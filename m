Received: from smtp134-84.sina.com.cn (smtp134-84.sina.com.cn [180.149.134.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078731A552
	for <linux-sound@vger.kernel.org>; Mon,  5 Jan 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604608; cv=none; b=WolbWVE2UYm9WlHf6sv+QtXyW0VWRlBWl36zWYNFpM8ZCFA4rnN3u5eJ4guY9Xc/JN/G9odS1eak39XODNb7FfudcSa6d38cD1QSDKPDEdl13cT/uOSofHBaAcJ74rLYVDRcMjQ0V5yoZHGC0II7fMiLZrLn87atgoPDtTQg0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604608; c=relaxed/simple;
	bh=dgQQ6F45oqeFammg0GAVl8jdTScUMRgVkphcMI7eQw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=f90qopRFmw/bB/So/2sArB/iy1R8TZJPwWd0s8F6HnYyqzD8jMb/nkeF8R3KDfRxKJVC/ynOWiLJNLKrc71PFRJgDYYcxMqCnffSFtPOFQrRuMIde6L+5xjWFTlMCcJeNJyHz79f/wl77ty3f0fHEhAS5vRJlRZhPMo9xQ5eGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.29) with ESMTP
	id 695B814B000044A1; Mon, 5 Jan 2026 17:16:02 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 040B10FC642D4BB7882F7315900E9696
X-SMAIL-UIID: 040B10FC642D4BB7882F7315900E9696-20260105-171602
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 4/5] ASoC: codecs: ES8389: Add members about the version
Date: Mon,  5 Jan 2026 17:15:47 +0800
Message-Id: <20260105091548.4196-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260105091548.4196-1-zhangyi@everest-semi.com>
References: <20260105091548.4196-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Execute different configurations based on version number
in order to support different versions of es8389.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index fb650ab2dd17..e16e68785088 100755
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -38,6 +38,7 @@ struct	es8389_private {
 
 	u8 mclk_src;
 	u8 vddd;
+	int version;
 	enum snd_soc_bias_level bias_level;
 };
 
@@ -681,6 +682,10 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 		}
 
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (!es8389->version) {
+				regmap_write(es8389->regmap, ES8389_DAC_RESET, 0X00);
+				usleep_range(70000, 72000);
+			}
 			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
 						0x03, 0x00);
 		} else {
@@ -730,7 +735,10 @@ static struct snd_soc_dai_driver es8389_dai = {
 static void es8389_init(struct snd_soc_component *component)
 {
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
+	unsigned int reg;
 
+	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
+	es8389->version = reg;
 	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
 	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);
 	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x38);
-- 
2.17.1

