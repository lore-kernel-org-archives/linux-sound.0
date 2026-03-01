Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EEE314B66
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352417; cv=none; b=aXc2AF4eQUe8lkJYKmSAspNrVmpGQdLTygCcEv0J0dxPB20eCi2b2SUueQ5Laeppzxu7s38f51VTb+8yLC0WucHawH/UdKLksLF/pX4L5cjorXVga1WB9fzPKWUwQ+3srmHwvEMO7Uiismm2itMirIo77ppgS5iO55JDwJFa6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352417; c=relaxed/simple;
	bh=Vu++GF5ETzV25pFIC4PFfCrxUq2vxpmKW9zJn8nLbis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccu5HkUFnFJmhKhuKzwrvs8WU0HB6YV/NcraN46+U63rjsGO0+X9RcuRTOr15DAYIkeageZRf7pXhv8f/Le8yI/IMtjZs83LtkM3JUdWY8eD9zk16NTqbQY5CEdk4Hgb1XqM5OMD6h3HdcPydYqyzZs31rG5ZBpP7Ty9VfHdFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8XGbW3G; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8XGbW3G"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so3121990a91.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352415; x=1772957215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyY9G+TpSKpweHm5kQNAg6JQKS/x6D4lbPKE8/3PcuQ=;
        b=G8XGbW3GYFk1fue6NlaKsG9Da+xsXLBYr6eMwmWIzgvIKPAngI5xE9YfSQ/oeDGP/Y
         y6RGJoiF/vqvxbZMSTXdnNrVigoG3QDkCPb1Tf59D7ca5E9FEcBn0d8KnD78mnnpPRxi
         VaOf/rUcZXt+vTxvDr31wyFs+2zAQwTKPazEh21FuGRWo7WqqMdEWU1wJ0b1Z2YatlVf
         D/iC18KhX3zRm92F2LE/TuHsZm+l8yBcyCY1WeD7LsmJ5OocYSY1Cq5Jou04j6p7vx1B
         kGAwXdApZpKkls1Kz+9v2MJJqKBNW7QYxF6MUEfNIt7a5IYJY01uy00zybAsy+usnOaD
         gC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352415; x=1772957215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyY9G+TpSKpweHm5kQNAg6JQKS/x6D4lbPKE8/3PcuQ=;
        b=waB+SBjWhmrg0mJxQGf2IWnG07dfKQqwRXPR/eZTWwabGNrpyoi3pwmvgDzF+5ies1
         miFgsRM4PNQeM3cv70qNe01vWkfc/MLZWykB06qmxkCmAaZ8MSJn7TIMInOlWqNcCQyu
         4trSTn7k6qWkGdinpi7espR6HXFlC8YGdT1MMYEqnohgkOxtclAvfNkVr/xWhyJaEBUp
         XEYOF127636TNbx+Swjq+0qPq+yAp5NosOrKvRtciHb0RC6QrQAf6dKMfZOOCwKhfrvi
         yJpkxzMveBdYgUUE7cTSUYQWHtWTB+TTRqXF2pvm2BJisAbRiJqvgOgMaGXh6yfxft/t
         QaFQ==
X-Gm-Message-State: AOJu0Yx1u1Mfi6Lof0ro8qlwCHCaafxfnS7Eth3na85mHwxS+JYJjQq7
	oGUJgowgjDKuYNupPrUCJ4YRofF9vJe6r79FIRcHHUaA5UEu3NVlckVT
X-Gm-Gg: ATEYQzxb1l+WOSRzdOAv2ty4SPD+EViXEfj5MkvX6azS7JflMLCywzZBpnOZrrxk+XW
	XGCPDkCgxAnH8964z6cbauhPCYhAmyQO8QF/goH2Zfj4sp2ZGSyHUSuNyTTqyvMVz8ASwjTznhw
	jyyw5KPhyjBnGwAYoZmIzLvCeXj+GH19wes2GUDq95nphq0FRG5l55y/NglKoakcYRw2e/tHbu8
	xiZPQVIvtWjtt4HM0taBSFDaIVL7AX0aS0AplHdR58jR7sHwjGhzaNOUEuHpnVsmSOdLeiCgQXS
	3SROOvAuf9D3moy7t6hI1ZSz3xDdOxvUhVSsXV0P6DUJsQo8ZEaKIarfEseyVZC87T7bkRCFCyc
	c9SD4jOj8PoFth2dQ9fKp6hC16ysYQg7np9lJOm4tepgCa21alP5xQutO+uD+FeuKY0CN/AuB84
	iV3w7bEfR+UScH7T6GUTmlHByB5PrjIB+kN6LqAop3L1KHnIjH+IRj1ua/YaWjyNfZ+fxiAdmzH
	peEqFgRxZxCS+pzizvy5oupiOf7WaFwlVX+h1wV2oqGP9E5YrXfUWLkuE1S4YSV3V/YW9becQQb
X-Received: by 2002:a17:90b:5843:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-35965cc7144mr7861675a91.26.1772352415479;
        Sun, 01 Mar 2026 00:06:55 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:25 +1000
Subject: [PATCH v3 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-6-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Vu++GF5ETzV25pFIC4PFfCrxUq2vxpmKW9zJn8nLbis=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fbzXi237ksdNkrtpPrtvx/flhkTavndm4hKccDN
 kseZh793jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqjiBGhjXHfFdmNmrrbLe9FOwu6+jap7PBkn3f461fXm3L4omqfs3I8DS37Gn
 DnLMuwmz8VWHXDmvO6nbbOzuB8ejCRHdh0zU2zAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2764, and the Apple-exclusive variant SN012776, include bus keepers
on the SDOUT pin that can be configured to alter the behaviour of the
SDOUT pin during specified TDM slots. The chip can either leave the
bus floating (default/uninitialised behaviour) or fill the specified
slots with zeroes.

Expose the SDOUT bus keeper and allow it to be configured using the
set_tdm_idle DAI op. The mask must be cropped to only cover slots
valid for the configured BCLK ratio, so introduce a set_bclk_ratio
op that properly configures this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 11 +++
 2 files changed, 106 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 36e25e48b354..423b7073b302 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -44,6 +44,11 @@ struct tas2764_priv {
 
 	bool dac_powered;
 	bool unmuted;
+
+	struct {
+		int tx_mode;
+		unsigned int tx_mask;
+	} idle_slot_config;
 };
 
 #include "tas2764-quirks.h"
@@ -509,11 +514,101 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2764_write_sdout_idle_mask(struct tas2764_priv *tas2764, u32 mask)
+{
+	struct snd_soc_component *component = tas2764->component;
+	int i, ret;
+
+	/* Hardware supports up to 64 slots, but we don't */
+	for (i = 0; i < 4; i++) {
+		ret = snd_soc_component_write(component,
+					      TAS2764_SDOUT_HIZ_1 + i,
+					      (mask >> (i * 8)) & 0xff);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tas2764_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything on SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2764->idle_slot_config.tx_mask == tx_mask &&
+	    tas2764->idle_slot_config.tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		if (!tx_mask)
+			return -EINVAL;
+
+		ret = tas2764_write_sdout_idle_mask(tas2764, tx_mask);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = tx_mask;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		/* HiZ mode does not support a slot mask */
+		ret = tas2764_write_sdout_idle_mask(tas2764, 0);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN, 0);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = 0;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/* The SDOUT idle slot mask must be cropped based on the BCLK ratio */
+static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(dai->component);
+
+	if (!tas2764->idle_slot_config.tx_mask)
+		return 0;
+
+	tas2764->idle_slot_config.tx_mask &= GENMASK((ratio / 8) - 1, 0);
+
+	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
+}
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
 	.set_fmt    = tas2764_set_fmt,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
+	.set_tdm_idle = tas2764_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 538290ed3d92..4494bc4889dc 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -126,4 +126,15 @@
 
 #define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
 
+#define TAS2764_SDOUT_HIZ_1            TAS2764_REG(0x1, 0x3d)
+#define TAS2764_SDOUT_HIZ_2            TAS2764_REG(0x1, 0x3e)
+#define TAS2764_SDOUT_HIZ_3            TAS2764_REG(0x1, 0x3f)
+#define TAS2764_SDOUT_HIZ_4            TAS2764_REG(0x1, 0x40)
+#define TAS2764_SDOUT_HIZ_5            TAS2764_REG(0x1, 0x41)
+#define TAS2764_SDOUT_HIZ_6            TAS2764_REG(0x1, 0x42)
+#define TAS2764_SDOUT_HIZ_7            TAS2764_REG(0x1, 0x43)
+#define TAS2764_SDOUT_HIZ_8            TAS2764_REG(0x1, 0x44)
+#define TAS2764_SDOUT_HIZ_9            TAS2764_REG(0x1, 0x45)
+#define TAS2764_SDOUT_HIZ_9_FORCE_0_EN BIT(7)
+
 #endif /* __TAS2764__ */

-- 
2.53.0

