Received: from r3-90.sinamail.sina.com.cn (r3-90.sinamail.sina.com.cn [202.108.3.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB61D38F253
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771380; cv=none; b=GQUvoRQMOdlzNOmWWigm/enhWo8rlbacCqkSm+31E/2SCTK2bdfHCV6YX5BS57IUleTEeyqi51poRKXPc5Anq/BuYJrdYkjvGyhTJqpXjecMQkNcx7/Q3BbJi2C9m8mh7cB82Cam9YUyqlos4CDymXn2BY8Luzbch/oM553h6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771380; c=relaxed/simple;
	bh=lWABAreMV20vCJ5QvqixM9atvBfJRR6eqsq0JTsByHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ft80jSnwweTWg+vGAIfRpKmcowDfza3VbIZch5TW3FGbbWFh6YyHDW44Mdc9qNRVnwoZdbl91ikl9LXYLPLAel6eHP1lWu9QXEPUmS/bDyqwz/MYwnCXWKsgxwyBtTuJbZwnWIOWBx+Wm3SLmDeA1SwP/k5yY6d0Hz3Qkqw/w+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A33AC4300004CAE; Thu, 18 Jun 2026 16:28:57 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: C90F691299C64ED09B5319E55A89AF3E
X-SMAIL-UIID: C90F691299C64ED09B5319E55A89AF3E-20260618-162857
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 5/7] ASoC: codecs: ES8389: Modify the initial configuration
Date: Thu, 18 Jun 2026 16:28:40 +0800
Message-Id: <20260618082842.2778-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260618082842.2778-1-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the initial configuration

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 501b3a16b..04b6a48b0 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -793,7 +793,7 @@ static void es8389_init(struct snd_soc_component *component)
 
 	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
 	es8389->version = reg;
-	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
+	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);
 	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);
 	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x38);
 	regmap_write(es8389->regmap, ES8389_ADC_HPF1, 0x64);
@@ -845,7 +845,7 @@ static void es8389_init(struct snd_soc_component *component)
 	regmap_write(es8389->regmap, ES8389_SCLK_DIV, 0x04);
 	regmap_write(es8389->regmap, ES8389_LRCK_DIV1, 0x01);
 	regmap_write(es8389->regmap, ES8389_LRCK_DIV2, 0x00);
-	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x00);
+	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x10);
 	regmap_write(es8389->regmap, ES8389_ADC_OSR, 0x1F);
 	regmap_write(es8389->regmap, ES8389_ADC_DSP, 0x7F);
 	regmap_write(es8389->regmap, ES8389_ADC_MUTE, 0xC0);
-- 
2.17.1

