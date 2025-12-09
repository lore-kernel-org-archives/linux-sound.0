Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE672DF709
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272731; cv=none; b=CWDvdtGRARAwM4aXl0+IYTSoI0uxs/lWQlgvAFrcGoViWngeYd+4AYpdLO+udMjpY0hNuwcmQegZKriJJFitMQAwLDRzhFnVTx0os6Ezg90xcD6j3W5RO8btlcFuYki4CDorD2rkvvo1N1ElGBHtslm6TXpM5oBGhJjXcIh7nSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272731; c=relaxed/simple;
	bh=9X7Ik0ab5d6Iz/18MVVGvVc22VgP6m21NK5Flfc6r74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ib5IS2YsnzQ51WsBA/mVSf+W/tVEx5KYr1wDhuC7SbfWeZxo/NXzMCaKdBW8/ibJ5BI4i2jk7lkKF6S+pNGyfVmQ3kpkLRfyJgrEwDWrJB9iaOJlOY3sedyEXD8W7LIILFm9kQ0HBui3cHKHnhyWLLStHih8zGakZpwpcoWr5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctO9zKQC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctO9zKQC"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3434700be69so7655041a91.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272729; x=1765877529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=;
        b=ctO9zKQCCcjO9oGYVTm1b1j2oT3lrbMQ9LRNkBrCjlAO5+DOC8BHoq7oEQbAcFqSs4
         PAazpflPQqvokCfmocCikbAlSgqpCTIHU+Lw02E422diEfop9wb/RlG9hLR7h2j4r9YA
         IKuMYEft9EylZFvWz2Xm/cG4yUI2unMekipCM1OT9Xp4zI5KqYRI3k5C6WcM5BpY7JqL
         MhcqSMVuVBPGvmDduPOwMQ2fHoUW6LhuHSlGqijxikHdksMF58hoEW8QlNDIpmA5AJJy
         GcVr8SbLRgTqqETlPIjsdrF802M1nWANFhYVwg+Ow5JT9kmdYu3k/r8oVbiPI+AABhSO
         PBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272729; x=1765877529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=;
        b=sK3AgPSLQW8O3sHa0vTVtQ9cRsRgNosd5ubXQyXQEhgiNSyGZHgQOcV9BzhOs78S9z
         luYn8f2uS2kKrJOu0XgxYaEARQhPkAv4EOvouTqG07MyeteVw/heY8uz0CUNNfBkYF0I
         ceQc7HzfnFQSWTH46h9r+jnGLqo1oKE8fmwGWnTzyxxtFslFPaOZ/VQNcUPS0KydS/ZR
         GsH6CSL+Mf76Qh9sZDdOpIsYH+BxuH16n6Ru7F0ueBTfWWoeypBKWux/ncXaHeDHULU1
         YQ78folZ7ks8u4mstIhDA2UJN1/GzNEWmngBRoiIIPI+yM5vhO8D1VZUhC2nAS5y+XkG
         dpLA==
X-Gm-Message-State: AOJu0Yyih9bx7mKSDXz+kqSETe9++vzOirtG7hJk8moCrfosBTidOdbT
	BPG8xFHm/szeV9NpJTADcLIXAbx7nIn2gpTchEhGzKcBDDKWSwa1HJM5
X-Gm-Gg: ASbGnctq1brzAlPgA9hHis7oB6fh1zH6PQxEMBaO0VUge0WhdSNFiwf9NgBds0Ui+jW
	+BS8WPhF+FvZ9N9gx1+7aPZgNdViNtyhtcMXyLJXjpGRolbX3uMYPiBYdzIjmiJVrMJsEFYGAi8
	nZmn+rMyX5LX4m03KzZNbLc2o16r4pub1yFw3Iy6tMbkh3rZm3SfYA7bRdHt1KedqoAloaqQHvQ
	LfztZ63nauG2Eyx1Nz+SxKVfW+dtsHRSV8zixmui9qnNhC7SKm/l8vHHRdVDWqQp6x3eSXXSiH1
	EoOM5b/dEksKAA4ujzJr8QEE5LvoEanbag3WDEnyVhkKfly9idQHr5FHKMe2qhu49KWfp39y8dX
	klCN4kQG7buZlYMmcBs3aWQGqj2fFVFGggfHIx7XhmpxjwyEdHr7/ljrnrqJhImBzQmNAx446Oa
	lEOLwOYk8U4JL2TKlgk0DWAzmaYpOIfM0WzD6pjUFWU0Jt48p4K5MNjF5JdNsfKvODbCO5HjF/d
	VEdkn14sXfYSCOPBdTpvyG766cRhe+QCuTh+bBa+afYD835Tpc4/Rie83dfU4ZPauJqwH2E5ePD
	MQixhIpPpn2W+QWHl8pjDXYlfM+YeWQxUZxqi4gcH3GjEoBhCrU=
X-Google-Smtp-Source: AGHT+IEf8k2cGwcYziNVTfhJRUNWm4Blk7mY9yN2+i0tDJn66zOZx4itoz7PdkJwqZ4b134kt4zn5Q==
X-Received: by 2002:a17:90b:3506:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-349a2613605mr9150879a91.22.1765272729310;
        Tue, 09 Dec 2025 01:32:09 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:18 +1000
Subject: [PATCH 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-5-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9X7Ik0ab5d6Iz/18MVVGvVc22VgP6m21NK5Flfc6r74=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7I1nvHsL9CcfHRpJM/b7PymxSXtYfH8PI94VRjWN
 Nop1LR1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApvpKJcP/hCPlHm6PuVo3nGwJWLYz+8wxVlu1PgahH335M3Z3v1DmYWR4cPhcbHe
 w4rJdj2QFo7h+m50xEP60+dIS0Qn7l+jL39VkAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, like certain Texas Instruments codecs, can be
configured to alter their behaviour when idle on the bus. Now that we
have definitions for various idle modes, add a snd_soc_dai_set_tdm_idle()
operation to control this in a standardised way.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a5784ef8e3f7..1f411237dde5 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -194,6 +194,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -310,6 +314,9 @@ struct snd_soc_dai_ops {
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

