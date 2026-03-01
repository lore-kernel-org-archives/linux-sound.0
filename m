Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A4330B04
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352427; cv=none; b=dMgE/Ja8gvw9Aghzec/zRnr6qU7K8FTz8G8Xf3SJ6KyxdME4nDEp3f1mZd88PufKXlavQAZyKFpVBayw3suINJlMzWX8KBc5B+w4t99YJvdVbzib42ymWwCjFH163bQb6bV4obD2QN6lx0Px7K0hApjFvL+CGOGWjjWoJKrfN1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352427; c=relaxed/simple;
	bh=tgaTiLnqDVU09V+sOch0MS59MDRnaMGowpS7pQpkHvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pl/gWNjIIRxWm/H0ynVC0/sjT8wAS4E3a9W2cJtORC6K9UybNxsXYnvanggalZWWsomrX8wwZx9xgmHgOPmAE2VQNBzzdVtx/jZXOd4ci5RRnzWAVl6tJTorI2d2zWOeZYaefFAAfTKBjug1BmN4Mo9o+/Trxg8MGWiTFjIya7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYe4LbjL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYe4LbjL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3597fea200dso559535a91.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352423; x=1772957223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=;
        b=YYe4LbjLoKhJqGfmGUo/URpC9aSyiORt8niRgTowcRmJBptAvvUxxmCnLuJzAB+rfB
         Xu5HC5sUFsj7U/FHcOW/B/H17tNrv5Jo4sxPuSWH+NtOOof/7lh1o8JqSImwL2G1PBWF
         NzpHKhZ8Dh6jJNcYfXh5QJ34TKhD0fr3w4w4qnFL2XX4BdfeH0+AGcNJUg+Kr6vDwknQ
         WKOmxhq+X4CLunnL42nSwSB2U9vhw/Sgstk8VdsAdJoJ1xckcziA5QRFFGsNi20l2foj
         NKZYrN4ErEGf8GY5TkuwTCb6CmOsMiCmBRCMHwg/52+u5Qx5OACOBkBPPz5mnDEZSjs5
         Cu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352423; x=1772957223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=;
        b=iT39S1wEWV8e12XzJk0xXPO/RNsbsPvxWqRbN5/kdZlgpBHaOiflE9QPlwZzzY2Ldz
         i8IruUUlakiA7bqehZV0Q18UEB/yXuaHL5kMKJXr+nPgRlnlvwGC2KUWsPWD0azqmyaV
         otcwLwYGYt1BW0sO1a2lVDzN+KFma7VyjyF1rKSK1WewGQvu7Mg3pZp4yiwMxO1aY8ju
         J3JRf9+C8t8Gud05yMKEj7PKs1TG8r05CzBUS6W/fSwz2b4qWZA1isEQ5pr7/LoW4Kk3
         Ko5NCF5LcMKZcOO7YJOw5julbx/6DA0qkpc5Yfwp/yeq5ax0vtIvmWwfzBiFpxJ6bc9c
         Ybig==
X-Gm-Message-State: AOJu0Yzh2zLhN7f0BxjE/QeeqoJW8v4FgjfgEon0FOWuJ5RY93ATcnPT
	PIx/LviIVHKX+o9gUpyB1TeijGwYCCb4B9FsPsrSZOrX0JRjyH+c2uum
X-Gm-Gg: ATEYQzyBXshGWkQGK3507Bfjg/jT4GBbUGDDtOvRlvuigdlYiDwF+weMjsH36UK3a7D
	IAIq7o7hXU7GfIWqo+lrQxmzVTr3ihSv3HyMAOOz6hBs8PVvF+FmZhMsAmZsbhY7znbDVYTxiWS
	LOcVfLURnFyqPASbMYlb+PiBrPv3miU1UPQNyUac2Q6nrVQV7cSSqBPXW2zSEHHwSsSRCS3Vxg4
	jErUu8+vdTGeFlDnsfDwECV/bg+fydWbc7+M3CqyzIoFDZa8QmkkJa7NfmekRDwaoz4d5gjs2q1
	Ms3Kl38aCcIf0agWy7vDX8Gdx5wjH7b12dZylo9Qk/c4ZX4n1CWbBLASqS6zp0DvpOzfdKwrLJY
	cRgaMtOQCYgMQqtrz7UTGDwpHtMSq9OolKnrbd3AbFX2+fz8G5+JbHSKGmQr+6o1GrUuVidAQE+
	zALuxWNAVcqqa6ocsuClDYLwFGtrkmEhVFAlVWoCeQufta3cGBrXGIjUJB1VaQBZoxVumBBEIFu
	Q9TZ2zezpRFuQMYOrSJA+xZ3mot2s9iSjypYnzynWOIcnsnOsDi2jMml0NcXRLyTta2Gr6GJHv7
X-Received: by 2002:a17:90a:e18f:b0:356:8719:f516 with SMTP id 98e67ed59e1d1-35965ceaf7dmr8142105a91.24.1772352423345;
        Sun, 01 Mar 2026 00:07:03 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:07:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:26 +1000
Subject: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tgaTiLnqDVU09V+sOch0MS59MDRnaMGowpS7pQpkHvk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP2dcTLpzemWex/bfGxXUDX58YpGPWnFnj8yUCo28u
 2eU9EtmdExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbaUpCR4YJRr9JVri/nYzdXH/q9TWVPg7Cu/fqlz6NSj7Bqmj44Y8PwT00yTkn
 RuGpje8r1VntOyysFth9LO+97iO69NGWv9stOdgA=
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
2.53.0

