Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4791641225
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804349; cv=none; b=IV0Dq4vFz5xK623Dbj1Oh8cfUkhYwFZeIvSp+FnC/j70HV/YETDLL0m+goClSiAvUba1s4/hejyI1i5UKSR4zJSQftzN9GSZ2hGZEgh6XMTLXJ+pOEellv4U4KhmWKLXLt9yISrlLOx/2AAGPhZ5I0G0dGZx3t2JJWG5cXrqLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804349; c=relaxed/simple;
	bh=PslOAr7mFGJ4prqzSj17si0yfukTEjMxxut2jOVCmEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=g5EZJbeJ0wj2Zdds69wUhQNt4SOern/751duuk/LDFtKSLjKPP5cwEnEuochraSje8wA/yR8FHRHqTrQr/YGlSQulSH1CDcUMJmxu0taFzo17BYfSWm3vpzqYQKy30CV/eOBEcYZ0qR/jq9nRdjftH7W7KxBNnN09Czl3ZDABUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A436EE200001A79; Tue, 30 Jun 2026 15:23:17 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: ECBF0735CF1C4684A461E0ABED2E7054
X-SMAIL-UIID: ECBF0735CF1C4684A461E0ABED2E7054-20260630-152317
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 2/6] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Tue, 30 Jun 2026 15:23:07 +0800
Message-Id: <20260630072311.8427-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260630072311.8427-1-zhangyi@everest-semi.com>
References: <20260630072311.8427-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Fix the issue with incorrect modifications to mclk_src
When the system needs to be configured to use the MCLK from the SCLK pin,
the code still sets the relevant registers to use the MCLK from the MCLK pin

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 2 +-
 sound/soc/codecs/es8389.h | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index be7a36f17..074c68fe6 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -609,7 +609,7 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (es8389->mclk_src == ES8389_SCLK_PIN) {
 		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
-					ES8389_MCLK_SOURCE, es8389->mclk_src);
+					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
 		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
 	}
 
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index d21e72f87..57bf7c5f8 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -116,9 +116,11 @@
 #define ES8389_TDM_SLOT               (0x70 << 0)
 #define ES8389_TDM_SHIFT              4
 
-#define ES8389_MCLK_SOURCE            (1 << 6)
-#define ES8389_MCLK_PIN               (1 << 6)
-#define ES8389_SCLK_PIN               (0 << 6)
+#define ES8389_MCLK_MASK              (3 << 6)
+#define ES8389_MCLK_FROM_SCLK         (1 << 6)
+#define ES8389_MCLK_SOURCE            ES8389_MCLK_PIN
+#define ES8389_MCLK_PIN               0
+#define ES8389_SCLK_PIN               1
 
 /* ES8389_FMT */
 #define ES8389_S24_LE                 (0 << 5)
-- 
2.17.1

