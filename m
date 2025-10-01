Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A32BEC23;
	Wed,  1 Oct 2025 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759313685; cv=none; b=FS5o+tIVdWktpC7t6gU3t5t9im5X3rad/B6lXoGv8d7An0GYhZI3O7K5yhoerGv8Xo9gIK3CZwoQtkPcBvhWlN8QKdA3k3iulhu6psq3+MWWxGGO8+rzBoXLbLyOz6L3moHEHMbTE3bKcq82g9AO3HcxhJjZmGllJWePvm7v3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759313685; c=relaxed/simple;
	bh=7xxuCF9C5cu4w/jvCQcEs8umQTwoODQ512OHhNI8b6c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dL097Tjl0VRp6Ns/6S2iuubK0AHHV7iuthmQFpD9XIY+SgLDtOnXncErNDGtC7Gy7tKe05Agkd24QEMcFTo+ekLYoL4K1awFUhjTFiNB92cjHmA9yhRkE0SlqV645aR7seYr76eyOIZP8yxlWkxRjesyo6EyvtrZ4/wGIygHtNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 1 Oct
 2025 13:13:28 +0300
Received: from localhost (10.0.253.101) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 1 Oct 2025
 13:13:27 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] ASoC: q6apm: fix potential overflow in q6hdmi_hw_params
Date: Wed, 1 Oct 2025 13:13:02 +0300
Message-ID: <20251001101304.612758-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Since 'module_config' array in struct 'q6apm_lpass_dai_data' has fixed
size APM_PORT_MAX (127), function q6hdmi_hw_params() may hit
accidental buffer overflow. Specifically, in case 'dai->id' has
values ranging between DISPLAY_PORT_RX_1 and DISPLAY_PORT_RX_7,
DISPLAY_PORT_RX_1 being equal 129.

Mitigate this issue by expanding the maximum possible size of
'module_config' and increasing APM_PORT_MAX to account for bigger
possible values for indexes.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 2f6860e6133f ("ASoC: qcom: q6apm: add support to display ports in lpass dais")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
P.S. This issue is quite similar to another, already fixed one, see
commit a31a4934b31f ("ASoC: qcom: Fix sc7280 lpass potential buffer
overflow").

 sound/soc/qcom/qdsp6/q6apm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..1d032004e01a 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -14,9 +14,10 @@
 #include <linux/of_platform.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		DISPLAY_PORT_RX_7
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */
-- 
2.43.0

