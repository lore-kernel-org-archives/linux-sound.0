Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5226E711
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518793; cv=none; b=sa2a/dDsUwdmF463v3/ZLsHTN8RPEqZ58ZfOYRyUMO+VU9hPYUPgPz6K/5JmcG3ndked/sOU5HDIt1iDvv/IMpwHx1EubJsBjyuIE0fhrzTtzTZCBTMRfs0cdv1Sd1Ch9MdXW84FopLaxzWsW3BMFwyY+j1TX748L/DBqRrzPmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518793; c=relaxed/simple;
	bh=pKTbBNm6M9yjEKbvryVHNC+FzXbWUf7dbfkGsgux1Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEuA0AQX1IJCZT7ai3lZrAzOLQi0QMhDfn6t/tK798zCK4RaFJWiFO240vJ347tEui3GYH5CGdk0bqYCPtdUs1YJK0I04GhLSc05Aje4kWSo45Y5n7QINoLX00bac2zBphyGLsphpfPKVTSpai/557ydvRjalEdCqmlLyboA6do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iH8VqRcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iH8VqRcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF832C19425;
	Sat, 14 Mar 2026 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518793;
	bh=pKTbBNm6M9yjEKbvryVHNC+FzXbWUf7dbfkGsgux1Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iH8VqRcymy8EAx8+O6HkKR7r5IpW9X9/g/3hfelgml6PMIuC26ZeMw4wbHU6lYwLR
	 Z2XEiIcgHA4Hj4O4K81FE0BjxyNZFNVzFVJ8SRKqfNdvSx9cRn/G1nYNKikhJqX55R
	 Qz9WlMtocIjmwUtNwBxUh9Jo4brZkjBxoqk/+M/SpAJvCeBU90F7mVtEPXCEPjb1NI
	 a4UszVCNw6SlERe8CMBPtJG7ztn9OYeWS/3obNnKRemPhvklsGV616vZqpvCu49xpI
	 0461BQiZER9g0KGqXMxF45FWNNek9yY6qGwIsPJLVmjAf3AE42pjXlOUyPkdDrJhsa
	 O+VoVZZXcYwnA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 21:06:24 +0100
Subject: [PATCH 5/5] ASoC: amd: acp3x-rt5682-max9836: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-asoc-amd-v1-5-31afed06e022@kernel.org>
References: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
In-Reply-To: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 4ca1978020a9..39e1a355e157 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -11,7 +11,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/i2c.h>

-- 
2.53.0

