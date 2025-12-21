Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C0283FDD
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309843; cv=none; b=aD+EspzQARNc40mqje0g0wMF9S6fNQb3nWQQURWsM7olXJmUSwLsXapBP+NI1tNbG62BAWgVQip9LpjB54I8orzT19OI+G3kAkB/0/X1JCaJggVHPHVuU95u3XFYlC2El3nKb1XhXAvU0LoivPKHwqDwRNh6lOXjRmazTmuALiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309843; c=relaxed/simple;
	bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3uenz+jQQgw5bYbPIrKT2JCf7ewCAId2hdund8ra5JZZhHYQpAiFs6CB9ElknGJtT9BsKTzrV7UXrtl7p/o1LVZtrKBMra2brR6l2tN5s67IxqQZHujcvcWV/5B9vmmANydErC7pArqMIqWDVKBJ1JMgSuYW/g0D8wU2DGZTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYXaWRml; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYXaWRml"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0bb2f093aso31823315ad.3
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309840; x=1766914640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=cYXaWRmlCBpmKneLWpX+F/JZLk6QEd7UZSO3Fhi9CBem6OkL+jpJJoHTXgkRtswpnp
         oCk6slBebaTpmu47RE3okRTPD8zIxgov6g/VsH2KPWyDdrcfYDRqDbuVFgUdWT4oGuoY
         EUaWPuxZCdDF81P42qfnZ+unBzPlsQeUZNZHf5DT9/PbXhvyUQ+0a44d2E/dnmr3mQAg
         dYxC/UE7yxkLuFHrs6bkTSPmI2t+iZXRLXcCXBaeU8+ApO4pIk1KUPKlSbMfDr4c/KKs
         tNLJ9VV+/Qx7jiz+XKmZsRGFOWYcWvDvs/BbtregKHZEwEhKOfqWXJXkK/3ms6tA1dlu
         mKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309840; x=1766914640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=Pspw4xHLfmIoqrR3X5uf08uOAX/WfWgPVc2v73gt5DM9Q7LdzXF8CC1+fPz3vYx067
         jwKDT4YeCEPULc7hab6KapFqa3naaGx7gfwaxpHjTNCKhbQR1Tny70GCwi7uv/iFGF6F
         v6cVvuSxEK7b7+uPuIjEK2aXVW1Gx0ckyw8uGDYNRTJ2G1GB30OJPi/Ry9TKTibcJkIT
         mkio8MsZXo2rgaONhIWEjjD63oA/I78CUjBwsfQ7vJp1owKQwdIzYGHlMnw0iAH85dTs
         2QVNKfvew6VB9+k9VHgCsQva/5BU509R9+W6zaNMXwUUPK34MaGGExM8yMSOn7MsjLAY
         mrfA==
X-Gm-Message-State: AOJu0YwM2vbj4pCUqjEdSCLYbuC1ArSAvlwDbYQL87mEpLfg2sxNuWPf
	1eqdft4k0raG3icTP7lXy4JwknnI9SRpgRYVOzo0pQ6V5xZ4whMRKVRd
X-Gm-Gg: AY/fxX6N2AudDl8O6Tf5Fn/1Dk0a+8dFGJgexlSoQIKdDLLqiSBm/re62XpsmzEHN/n
	zwrtkGV4ES52koZH/KN1u5YD7GvJ/zNAPrdik7YzsUDnpEjXRj8kfQdZa5a59EbkL5YCMP9ZnQ2
	B2a9nJKCCk/p6DRsvP01nimIqxJ3kmJY9lJ4sQnA5fqBEXYhauH8jzxgEMY+iF+iD4SkKHEWfXl
	kCO2sNCAtnSonsCzalLGVCPP8oPzRCHLJF/yyQ2tMDWYiUlY4XXuPLGvy/CgUJqUI3G/cdtmEgI
	eHfCFcumk8MwJ3zS1RtvilLGDfD5qkqLptEpzRvh2iVnJWy4rrizZY9zlY5/TOmDOp6gQlhUqqZ
	qLbW0fWbnKB9+5tDWXF3TrEDVwXK1POURgXAZuQfe6yo35GWztTAFfoIIbVxaE/kwFg1eOeE0c5
	9S5gKVV6nTVZbayK9FF7Qm6d+Xmx9/YkX2gq/+TPa4FWV5JLQqwo+WSihpD1UgHq7y9X2iYSpp5
	Vdq2UD6VySei3aazZiprgVT39yMdVWGqqPdpx80uBuIYlMSOHY0/iEa8NxAiemB/ceLVCidPPfE
	WSfJI8UIXsrEXzGdZSW8ueuoIP29dRQOtWlHCtobTVUo+vIwEk0=
X-Google-Smtp-Source: AGHT+IG3qoMi1pT3L1mx8WGusEqRkmhnU95IldSZ76zQsfA/ovZNAZJZT0w8l8bvTDKlgtAC1QBfZg==
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr79985445ad.18.1766309840329;
        Sun, 21 Dec 2025 01:37:20 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:03 +1000
Subject: [PATCH v2 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-7-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfrR21YfWKb47yGtwc+xpW/9c6z/JkwvT6vOXraG
 cUJZmskOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNt+oDhf9rmVdsiknuYdpu3fMtLPui2w+6rv+XNqN5K1Qs2BV2aSxgZNsq6aS5
 aNXflmtX5286cmq/g+1sz6eHq6U9fZc14/rAngRUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 includes a bus keeper which can be used to control the behaviour
of the SDOUT pin during specified TDM slots. The chip can either pull
the pin to ground, actively transmit zeroes, or keep the pin floating
(default/uninitialised behaviour).

Expose the bus keeper via the set_tdm_idle DAI op so that it can be
configured by consumers.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 75 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h | 12 ++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 6f878b01716f..d4d7d056141b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -492,11 +492,86 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask,
+				    unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything for SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2770->idle_tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT,
+						    TAS2770_DIN_PD_SDOUT);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL,
+						    TAS2770_TDM_CFG_REG4_TX_FILL);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT, 0);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
+		if (ret)
+			return ret;
+
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	tas2770->idle_tx_mode = tx_mode;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
+	.set_tdm_idle = tas2770_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 3fd2e7003c50..102040b6bdf8 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -67,6 +67,14 @@
 #define TAS2770_TDM_CFG_REG3_RXS_SHIFT 0x4
 #define TAS2770_TDM_CFG_REG3_30_MASK  GENMASK(3, 0)
 #define TAS2770_TDM_CFG_REG3_30_SHIFT 0
+    /* TDM Configuration Reg4 */
+#define TAS2770_TDM_CFG_REG4  TAS2770_REG(0X0, 0x0E)
+#define TAS2770_TDM_CFG_REG4_TX_LSB_CFG BIT(7)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER_CFG BIT(6)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER BIT(5)
+#define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
+#define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)
@@ -115,6 +123,9 @@
 #define TAS2770_TEMP_LSB  TAS2770_REG(0X0, 0x2A)
     /* Interrupt Configuration */
 #define TAS2770_INT_CFG  TAS2770_REG(0X0, 0x30)
+    /* Data In Pull-Down */
+#define TAS2770_DIN_PD  TAS2770_REG(0X0, 0x31)
+#define TAS2770_DIN_PD_SDOUT BIT(7)
     /* Misc IRQ */
 #define TAS2770_MISC_IRQ  TAS2770_REG(0X0, 0x32)
     /* Clock Configuration */
@@ -146,6 +157,7 @@ struct tas2770_priv {
 	int pdm_slot;
 	bool dac_powered;
 	bool unmuted;
+	int idle_tx_mode;
 };
 
 #endif /* __TAS2770__ */

-- 
2.52.0

