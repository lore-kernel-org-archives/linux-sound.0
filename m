Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5753E0B
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147920; cv=none; b=f2H4vcywSfSMOeSszcSYRiurPc12ETZ80NRbu3890bAY5WLsBYFM+yqOyF6OzChkJIlQdNLQCiRg7IHDPiPy+kdgkErUPaKzcG8WiQTfPkoe68PcrUEg481xhYpSNtFwfajZZ8G1ognP1rFd0LvHFngO2tUNQ83D5ohjwyrPkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147920; c=relaxed/simple;
	bh=sdl+PHQsGQzr8k/0B7mgp8Ik3SGi8fGKNsMsjweHNck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IIsfcWCcms/m6oYoEog/5hjjmv20BZI/sTCcZ2I3NHpG99tGh8uRznYiE/iQQbCH/b11ake4/+xWmvO1U9NiATM0b6w+rONtE26S+QBe3EX35F6RGZe3sda7m96cxE/nNuhf74SSu2YWhyFej17Bl4BfPPPgwj5SIS4iwfvPd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:32 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 29CDD3AE2E0B4FAFAAD83F7615188A08
X-SMAIL-UIID: 29CDD3AE2E0B4FAFAAD83F7615188A08-20260611-111832
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 5/7] ASoC: codecs: ES8389: Modify the initial configuration
Date: Thu, 11 Jun 2026 11:18:22 +0800
Message-Id: <20260611031824.4628-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611031824.4628-1-zhangyi@everest-semi.com>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
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
index 647d9d628..284eb707f 100644
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

