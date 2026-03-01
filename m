Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5F32ED27
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352409; cv=none; b=gKUE8T4rkOzOK7he7JXbxIgKgrB0KGmxjLLDOHwg4yt5UeqQvRQ/qRmKgoaZ8YneO74PFUJlAJyk1pxbrHVNzCiibr9DKx4sujntZJc+rxppx/Rd+W2f9ZGkWu95CgBhxxxTtQKvMWP5lBjxnpeg7BrGAES2FYjxKz/VeG8XdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352409; c=relaxed/simple;
	bh=rqHc/7eJJOJ6QC/+Z/HBxx57SV1pobAnEybE9GKRIxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdpmS6SB3XeLyV94eDAxl0AEhDnrXUxxjNcs34IwNit+2C9JX5R3QqwYoWULUJYf5GhZheF+dati/UTNO+xCVQ3kSN6uV4ufObBAUlqNv9MuRRnTLvU6/otkPVbFa8SuV26yi5F2kHyW/ITPlR6gwIceqkAp9fU/DaynmCDJrMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilXetxV/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilXetxV/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-354c825dc77so1540750a91.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352408; x=1772957208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=;
        b=ilXetxV/zcUPo/7SgqT+LY2jiBmHLRg1+8tv2oJSmRx95DyLVEtv1wFqV7YLqzeXyB
         zpDTMrU+UxgttG0YhdSa79vdGUcVCXkqSW89tNlS16G43FDs3vp6M3LIQ1FfZVGzrhwL
         A6TcO9W4q9jij8zIvE4F1vYD8QIFFbit0ZfJAlh9SjzLUdNnOzYiLCREglZBeJVkoA3T
         FVqUsypxeiQrhqu4zISqQrncxZOUsUbxVaGtSeWWD+JfOPr4KsZR4GtYNfmyqwCjC3my
         tyxx2NIQ3x6LsrhQWP67zp3inDp/OVnvXI98B5TW6beeWNxvZAab7ENFnjSe5X9VNA0X
         EZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352408; x=1772957208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=;
        b=Mm46QhiDkn797M8vU4Mufjk1OnN5rtyV91GlIpFvNXlDfsZqmQHT12S9XcUVtvCkun
         3edNRtp8Hw5JFca2c6l9pYnA2+lfS/gNjqnLKfcaRmPCx7ti4gAX3hc2jLEItKQ6sxsP
         grYw4zKNlHFvFQ2NGPIMoQuHp5yxRS9Urt64FiOFtc9srnkK2t+UueNUvoPK9rHVtVkw
         380SHDc4lXr0XWR78B8+3b7+Ll4jbQV6vV4boGuw5tPQJ1bbuiow7j3KOShAuq6ssut2
         TRGxSNDKkHVRzcj++1Lc96ZtstYOsLtuj6TIKEDUXI8qwqwTBk0tUag+8A43p6grAC7N
         hzOw==
X-Gm-Message-State: AOJu0YxYyCtfnTo9Fuc/1pARYqL9Fb2Ct0fDwmhPgItQo1960a2NNZYZ
	daZ/9ZdHyJgFHTSnw9G51/McuMPb6+hYC9nSBWcpvQz+iWtOcm/+7uIu
X-Gm-Gg: ATEYQzy4w3a1Y+FPJkEC1Md/Qyh495NRXUPHN2FlGmGkCnapDzUr7ehmjl40wkQLILg
	WRszXpLLAhoayqFiOfMi2aajAuoc1iTPAguqk0AOpBxoB0TN6jNXi+jHIvYiXHGCg6lfyx6SQMt
	v+7y4mh/lvJAf9e9hy5uL2cnFF0DDlA+CrzrgmLACafTvbQ/94qRIs63R30hwip0gn5RCGFxRfc
	Vso5qX3hkRHDILe59fyq6fez8+AdJQeOrhlPNllSPAAznGADIe+FWLh1iSRYkMg9U+6heqkAFuQ
	JJy9CAdJrXIrXinB1eOGDsFVaE+FX+i97TenW5Z+dIm1MRycjmpkaOW3wygS6qciAHG7u9eRGfG
	1OXsRXkTzN0kdFiApA1QIFptIfSxGA9y4HC83Q/bsa0Xe84VURPZ0ifFKfwePe/lhlsHLSaGdNw
	KOWd+4nrdHNz9FzkcBn+v7I4cCTR03KBEdjyoIMUl7GmVTbPTrdgp6Fr2hzJ+uZdfcJZ+iyliGd
	2CG5OOk/kB74TrKgu1cQey0LZVyPE6m5lNo0L6vIwzvr0ySK4Tj0QzcBiY6C2F/Oxep3i/VZwoe
X-Received: by 2002:a17:90a:f950:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35965c17f28mr6826445a91.7.1772352407658;
        Sun, 01 Mar 2026 00:06:47 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:47 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:24 +1000
Subject: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=rqHc/7eJJOJ6QC/+Z/HBxx57SV1pobAnEybE9GKRIxI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fHbmx7kXl96WTxidGSMsWbznFOqazZpjSdxWp3p
 OgcsdayjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQHlTIy7H+vPHeZsVjRqpyjTIlX6t/3GuyeUMb6iHdldILNd5V78xj++y1kKM/
 kX1mzJXNuWVb416nGnxV5G11PqHusm5xx8qY2FwA=
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
2.53.0

