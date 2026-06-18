Received: from r3-89.sinamail.sina.com.cn (r3-89.sinamail.sina.com.cn [202.108.3.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F043A169E
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771379; cv=none; b=m9fLkfnGigwNHKV7gUcIOjRoz6NETTaDSmvqdI26qENGSBCKJjgxNQa1KBCTaPqzTM6O6Fy30W/x4xVxAAordhEjWD1QdJxQ4DtvgBC1F9LTHg84Wh/lnpgIKis63jJld0aoLROXAfMs4Uc8YZzifYk6V2kMRn6WoYFVEHpoMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771379; c=relaxed/simple;
	bh=zZd92xJVf64vXyk/uClw9UJnsa8Vh57gPysBhfR75i4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LK8uBq+7S3BMJfMCKuglnkvVMq4Ft5iawZr7aQrzMPjMo6HSs4Qbh/DDQ4TMOkcaWBcX+Aiv+qpLIh9TGDjtTAO0iIPryc5yWQJvnOAVRvD+W0LcWKVBdRppZgFXc7kzoNAh6JvYfERFRz8ZmeSW/4dqtYW7pmaELuw4nsqVMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A33AC4300004CAE; Thu, 18 Jun 2026 16:28:55 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: DE2EDD0B935D4BAF9E311D43C707F08A
X-SMAIL-UIID: DE2EDD0B935D4BAF9E311D43C707F08A-20260618-162855
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 3/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Thu, 18 Jun 2026 16:28:38 +0800
Message-Id: <20260618082842.2778-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260618082842.2778-1-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
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
 sound/soc/codecs/es8389.c | 4 ++--
 sound/soc/codecs/es8389.h | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index be7a36f17..7c1d61dd2 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
 	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
 
-	if (es8389->mclk_src == ES8389_SCLK_PIN) {
+	if (es8389->mclk_src) {
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

