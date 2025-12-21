Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3D27FB2D
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309829; cv=none; b=abbWnrG3q52xbS16SAogoiAIlpR8qoT4ay6dENbTpP2PVKrez6LqQpQ6P9imsNmskxLxfBBXgyqlka+sUPQdfCZh1jTlg+9XF+2+1JbQH7HvKwTjo1HPbzNZolXXf0cJmMyt0zAtgTnCvOCqUPE/Upu4/SmTPpvy6MKJNSX4igg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309829; c=relaxed/simple;
	bh=dYxrT04YcQdwO6b5nzPFQQREgLbm70Vca80uGYbXBbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYGnNjdVCHWdYKpexaMx6+pk6ASAP3AYHPynfW5dlFO5uXmOFn7fyANoDAhY262Cd7zhouNl8g+MgyBcbqnWIV6JG/Ikqfdo0/wRa5qHp0kfW+FHAuyc8aILk4k2acHQMgjCl3P4NObQr/1DxD4+gZlNmksszbiPCJeen3N45dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1WRSfNZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1WRSfNZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d67f1877so38534675ad.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309825; x=1766914625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=;
        b=K1WRSfNZxJ7EN4j1/5NDCg/MvPwdrkid2E61m43mUHkUDrE77bP6JVokltMXC29oSo
         nhBXmKGf+lKYbafuv9wtimllmXhwhy0n7K5vQG1DIJlmrfKTAZTcnzeC+de/3gSo2UMZ
         MuYQH5LqwmHVqtE1KDWv5JR0H8/v5m3tRi7BIyFOYEr5QAhxMMUrW/jEwKKa+WqhSz4n
         Eyqtyk+1ojX9W07r9MGCgOTn/ZsK04bf6hAoUJ/bXlSqsGR91LCblW4AYJ9te4EZSfPj
         DDIP+5PBpu3/nzSIGeVMhgoh9hf1z6O/MTogS47A2uOk6+bhu/sKr8/mmV8ZKLaJwupU
         bIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309825; x=1766914625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=;
        b=INK6NIap6ZpF9LAmilXxD12C2aLQLcAO/3QrWv41Z/W+UBeYXfE2nCxGBgB6bmcp3f
         zgPI0KgNPsyFgn+n9b/HCqNurjRJiXtmZiS5CpDeblr6UXc1Q8w1LnZduyDo7IwNOp28
         nN2OCKQqFPt8sCFwcpFnmhglZESFb6AWOG/MXno0NULV2gLNo+TPC2IGC2Unr1at+KNE
         rQOzC/VPcpxypDN/EK6SYBSjSIz2WxFudVJpuk10WX7o7FhU1HK5HHfwrWRP8bBlNGTo
         b66LonKTR1VwVF4U50G+6axUThhZSfr8JTBXiAGaxN0oGXOc39Zk/6CoZugxrjCfH7k5
         Uu3A==
X-Gm-Message-State: AOJu0Yx4qbNDeC3V4SO4l1K4Tr306Q4R6z7K3P76qTB8vO+0iwgfqxIg
	kaLJSpyAg5AmZSIJli8r58C12ykELtfwG577A215XsYgkyZCa8AprIMY
X-Gm-Gg: AY/fxX4WAK/Cu5cT8JJu824W55nTNcaT6I+T2rEsgKEe6xc8cSMc2lVQSg1nsxm/IsK
	5LzzeFO6La8kd0u7fkqqq5SBEyHkH9t9UUZQ2g42Xa5In2yUwD4u+7MHQOpJXHz0rQ4ByApKk2C
	aoGJGi6z4EmI85SxqQS6YjJiAy0g+aAZWAmUCi0wQBXLZa9zgOmXT+5Y771hGIjMlj0KkEVsB8t
	7Ff31yfiLJnaL0OsFbgAkZmayAKqPbs3M1lnQLGrf64WP45pg6a82D+IBx0B0H0vYpCIxk6UQKU
	v/XqslD+1E0Bp24xbeYbZu0x1byd5lsYXF13LjKzfOWw7HHfBPlON/l5EontasIQ/tUptHH4QG4
	0uNxdUBFB9NrrShEWmSFuDrZtfqOf13oA5auZunos/I8pNABbeIUTQkfcaWpM43ZwOictAa4Jqo
	05nqkTe7fhYkljBEdkvprRFHQ/ymsbKeqiAMMM2dQMBDnareLNxcLDHfObPLDruMFtEfmGi55a8
	3d2q+NIe7qBtyFdm3HCyfv6Vnszb0jLHS6YSr0n12JU92xNzNox1gtByMAHlJiEet25RnwNEoeX
	7Y26r8JaGZaajgXwIvfySxrkx7wzPtAQIH7N3e+k8bxbe+HvUlw=
X-Google-Smtp-Source: AGHT+IHTEvxzKwKOsqk6jxiFy1KEjLTBz6tFUpjwHXJ/UFHqcxf2UMgauXjpc/2YVHZ7EdAOXNaDmg==
X-Received: by 2002:a17:902:e803:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a2f2a420e1mr78890355ad.61.1766309825148;
        Sun, 21 Dec 2025 01:37:05 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:01 +1000
Subject: [PATCH v2 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-5-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=dYxrT04YcQdwO6b5nzPFQQREgLbm70Vca80uGYbXBbc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yf3en2e913tbLCZc/CEUy8ENxvx9r1wfNd5xNuJt
 63AcXVPx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKp/qDIyrFjrs0FXc0XYTlemLQmTiiatvJr6yCB+1jZBG8Xaq4+iTRn+h/7JuKk
 otcZRSbTkvkCAvWCqxiPJa7Jheit+PD3MIjybCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, like certain Texas Instruments codecs, integrate
configurable bus keepers that dictate the codec's behaviour during
idle TDM slots. Now that we have definitions for various idle modes,
add a snd_soc_dai_set_tdm_idle() operation to control this in a
standardised way.

This is useful on Apple Silicon laptops, where a single I2S bus is
comprised of two physical lines which are ORed just before the
receiving port. When a codec on one line is transmitting, we must
guarantee that the other line is low. We can achieve this by
configuring one codec on each line to use its bus keeper to fill
its line with zeroes during the active slots of the other line.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 44dd06add52e..6a42812bba8c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -196,6 +196,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -312,6 +316,9 @@ struct snd_soc_dai_ops {
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
+	int (*set_tdm_idle)(struct snd_soc_dai *dai,
+			    unsigned int tx_mask, unsigned int rx_mask,
+			    int tx_mode, int rx_mode);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a1e05307067d..2f370fda1266 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -282,6 +282,46 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
 
+/**
+ * snd_soc_dai_set_tdm_idle() - Configure a DAI's TDM idle mode
+ * @dai: The DAI to configure
+ * @tx_mask: bitmask representing idle TX slots.
+ * @rx_mask: bitmask representing idle RX slots.
+ * @tx_mode: idle mode to set for TX slots.
+ * @rx_mode: idle mode to set for RX slots.
+ *
+ * This function configures the DAI to handle idle TDM slots in the
+ * specified manner. @tx_mode and @rx_mode can be one of
+ * SND_SOC_DAI_TDM_IDLE_NONE, SND_SOC_DAI_TDM_IDLE_ZERO,
+ * SND_SOC_DAI_TDM_IDLE_PULLDOWN, or SND_SOC_DAI_TDM_IDLE_HIZ.
+ * SND_SOC_TDM_IDLE_NONE represents the DAI's default/unset idle slot
+ * handling state and could be any of the other modes depending on the
+ * hardware behind the DAI. It is therefore undefined behaviour when set
+ * explicitly.
+ *
+ * Mode and mask can be set independently for both the TX and RX direction.
+ * Some hardware may ignore both TX and RX masks depending on its
+ * capabilities.
+ */
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode)
+{
+	int ret = -EOPNOTSUPP;
+
+	/* You can't write to the RX line */
+	if (rx_mode == SND_SOC_DAI_TDM_IDLE_ZERO)
+		return soc_dai_ret(dai, -EINVAL);
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->set_tdm_idle)
+		ret = dai->driver->ops->set_tdm_idle(dai, tx_mask, rx_mask,
+						     tx_mode, rx_mode);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_idle);
+
 /**
  * snd_soc_dai_set_channel_map - configure DAI audio channel map
  * @dai: DAI

-- 
2.52.0

