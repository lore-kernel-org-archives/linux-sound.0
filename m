Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6A5280CC1
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309836; cv=none; b=pLI+uSMULv7hxMKXPJHSsc5DUseRJmC8d9eb75ee/6FVXUAgxEAXcOFg1HYh18YBxe2gEdo4K2+2j48ydl4XP7EViVH/xgQBBoYD6QJRnXS34j8PEvRidvsG3W4ZNxmtIiQZGRvTRwDi7q6vAOqENUbMgrt8WZXI182p14rFkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309836; c=relaxed/simple;
	bh=BcCWaQDqk2hqFZcbljTe5TshvfrnYl4MYwks/r0wuug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDdvCwftXx3MpqJhcn5i9aLVFl54gk9kDkDgJ9Fs28uipHbcOirK7IRdyOxUX5KuWA17FkcHgdwovIuQMBC2hTx6oCogrfuZcA0wUaqL1qSUw7/o3u0097MidJbgiLV4DYPeP0Gp5UmJ8rfMamAGIEn2KCE04DkWhHlZspnZJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRoR1zCb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRoR1zCb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0d5c365ceso38987855ad.3
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309833; x=1766914633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=;
        b=fRoR1zCbrhSm/ioatDa7PKrmUQ7gPp+XJUmKiZR0XjCBLwwwP4tO0Bz7bVUhAA1jtx
         g2KmbBkGaxNZcbxc5EJB61wa4z4KAD+sHDWA2hYmJ86Lgn3B4YyDkomV0MwZu3bdHUhZ
         9C6Tyb3DiceK91CcIBgRIYy1+WpMgP5m8Gg8wpkXmr6FlPsF+nCQ/VZS9fPMPsjMXSEu
         XPUn7SzaYzVOxk2j5CrCrkApDyKrOZLcnwXDRRlzL5eGZjEtys7hccEKo2845M9xesXl
         O7gholAnrKJZ1ojcARk1aNqAQScwoA6G3z/UtFVHf2CL03PFXh31bOZZiW2GFi62D9D2
         ZLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309833; x=1766914633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=;
        b=MQtJqygYgQDYqP6KTQXOn5lG+TtjyPIvxovSt/K4AURD3TO7GIyqguBVE9zTcqE+oK
         hGjARZjR83zwiIgGByMLF41HXcePtTWIvXInAWoyMm4ggg3V1EROH/QDX1OQyxtcfKO5
         wjT89fdcuVSpmYFRmQ7TJPkdCHsey/WcXCovizWD5tkgUX4sds32pEvwwMZKMIDF6+zA
         Iw8qp4jrpv0bGLuL7j0aAuznKf/upqvYoCHl9JYOgxJMFMqR1lECx1SpXtJX7AyYaoqz
         1CHeODqLX/MFUOVUxgEmgX4G+u6fM40gTbsloWZ6GmrUlX13dFtWfjGi/iRg5ckJQzgO
         HiHg==
X-Gm-Message-State: AOJu0YxsCRCAxQ7F4Qc+N/QaDjJg0zKyUGOv0YWWhrKxj+/QTQc0hgNo
	PUH3Toor9F7DLRBBQ2mMv4L/TiUUU60O0AoNnEpH6lqXKmjp48ivcRwo
X-Gm-Gg: AY/fxX5Flv7fQHzRXn4FcFJd8belkBRQJU6uYihGs6x0ZG5wlx5pxGHMYt5U1ZV18dK
	zVjgntnz+nHVlOsV/hEhAXr/uFcHZBIO6IOkuFw6G1yg2BLVhynfIQQR2Q3IaAm2kZANMDqrS/7
	ufKYKm0nD1OgJXCPpDBpquFKYMVubg+WTZ4MvOcoOepjDoU433Vf3Yhg/g2ldMuCiDkRzA1ampi
	2fdI3rrhd3xz5n0nwIGIFVUJXZxqgNMPAiKcKUYomUnKytSs7Ht7etodcOgLczillwmEvEiNTzK
	BFqNBE5tAM30S6a/bcYAyaJBtoRnvlF8crBPglJy0Iganez0+FJDudL/ndQxj28wwA89MEzpC9U
	YSqyAl3tOlXmsn59TutaQAIFE9V460EQVM82w2bsOq9WaAFXwsic71TiAgQlXtzbAmo5PWMeRsb
	m8h3/gWz2SibtE1At4/cKa6mfVS0nUL9sL+BS2xUcJ11D+NWlIo8WF7hvMKUNRVoxn2NbU81kef
	oZVNGAzFYRenvl7RUUGleK0L0fl0WgB6lmiNj+gMlCLuEj6X5JeJQt/GAxs5IfLFy84vPOc5k9l
	gO/u6vUNe2OILfpnYCc4qzqvXPupUH0zTLTgiFBSEm4fyweakM8=
X-Google-Smtp-Source: AGHT+IGMdyycbEEhzOfaP2Ty3g+HwuUlrykYJWMidFb++M717umnxFkAmzfzB53xMVODmVdckFRerQ==
X-Received: by 2002:a17:903:4b47:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a2f28335ffmr80140275ad.50.1766309832723;
        Sun, 21 Dec 2025 01:37:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:02 +1000
Subject: [PATCH v2 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-6-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BcCWaQDqk2hqFZcbljTe5TshvfrnYl4MYwks/r0wuug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yeXTb3J8Yz9vVX1g5YygxSGhRIJQhKv88V+6ynkl
 dry++d1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApprhFMNvVq/fM9f3TeT60aaX+KHjVf/r6Qtvvb8j2Dvd+sMcxi2z4hgZ2o7JaDE
 r9c45+PQi8yW9U247y1WTJbRnm0ebf3E7s+IJGwA=
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
2.52.0

