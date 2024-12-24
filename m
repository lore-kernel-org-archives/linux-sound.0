Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4E38DD3
	for <linux-sound@vger.kernel.org>; Tue, 24 Dec 2024 01:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004888; cv=none; b=W5z7u8oU61M5GLdG8uOOkiZ80t2slQYtvRh6ZaN+YnKXhyuieUxPxYy0Bd6FviYq2Nm1w3gB83qYGrlwJ6XRR5D8NqZB/OTq0QFI4SSg3rs43yqVNpVe0J+s8dY/pxf91hs+3j/B3Fo8Nz6XGe69uatvPfNTXJelzeddH27rSf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004888; c=relaxed/simple;
	bh=WPV59zPnUnkkJ7Uz4UuxqKnfbTp+vJqvD7wMF0GDGF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Phx4O7IoqOGnlETrQp4sat4n6cf6e4hGTYIkpOn5IF5JXY3PVnp6a2b3L2Bb03ib7SIAq0Gk0AYwQgyjagvo1l2VsV0a4wqvB8tGBfApAjhkZQhBQl+giFHwFtgBuA+lpWNecQ3Dr6p20M/wQ0O2OYfvY8eZMqCbRzyWpUwgXQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaxyxvRb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaxyxvRb"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53df6322ea7so6452225e87.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 17:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004883; x=1735609683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeQhWMbiAj36NmxvAZBRKZHGBYgaRTeLUPD3AdVnWOM=;
        b=UaxyxvRb5jpjtqS1+opq7QMoShcIAmmF9IQAbDDtLBUMnIuqW9uiwbuwQsKUKGeWrA
         2QTU+7b6Kt0rUhwauI2WnC3dsGBbt2FaqIdgpYp/TFRK6xgD2kHpYaCfteYWdD1pCVOq
         BU7pAClI70uI45eacENs7wT+TsW/5omZHaNrxN6+flQdFk4vn/lkNdpwOHqaFV1L8Ndi
         uUitAM/S1+uRSLGiOcRl5KQS/10HHvOmg5qDzobW/FKUNR5gPL93vX4DFbXxEOABqViv
         7FoS1jBZMxtMDzD8msm/MYmbyyOlqoU603AqCxiO57PyNyndUiD9Xke/ZjCOg3pygN0Z
         Xuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004883; x=1735609683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeQhWMbiAj36NmxvAZBRKZHGBYgaRTeLUPD3AdVnWOM=;
        b=fdX9D3e4CPPLwoT3ziOtflF+c0KAFDrjEMdp0tpgnbBUdAxzFgehJE5sBEU2woKN9V
         iPRotqweHE8tAlAgdGZzrnU10STnJByKYi/XID9+pIraC5QZ8Mj2F4rCaeeL7cmtksE+
         n22eDfvRzG4T+RGNAxDTr3rRNQ6b4S+e+NN0nnhyyL1KouJeymDM1dT7A61FPShdrhvE
         YxPaGeEVTY/LPqB8eKM085i93mkBC8t0d253fa2hYLcw7pDhMydNsnWrijIXFWDK9PRl
         eSK7MoSn1rlWTo1HAxQjjgegqEVd3YJOW08bqILi5MTsaFi+4t4tMjU0ZxDfnBv1c7tz
         U8lg==
X-Forwarded-Encrypted: i=1; AJvYcCXDc7saAyoqSf9Kynf0+cXk4c/ba5hpNe59mCj9sIgW4a8UE/CJ0e8rlIGLkf5mh1h/3zDE/5bVpI8kDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzafAO0qVbYGQZQ2gORGafYZ/7gqYd4k9vFzkkmDFsCkobWZK7d
	inojYWfMg0q3+SUsHkr9gLprsUHpdj+T24WTY1G6qkjQGXPk4/3zAS7GYgLAGMM=
X-Gm-Gg: ASbGncuE5xp8yxDCDvZDkZxMzXn1FTrYsBGLnlzUXXcJ1gCf1v45Z9zWZAyTuoqBXtX
	4I8cpf8X7SMs5mZS1nu1Rq72Vupu3XK2PW6rVf1dLznmlCXh9Q/maIEYyyaoPXBUBXuufmqxRbM
	pqfZS4RDSYplDDNDWZPcRNf+cI/R4pbXCB5TpS+CORt4/Gi1oAhurcSL1HHWI0xKbD/MqfvBKgd
	BFyxM83hxAB8fNvrFAhoV5QeW9xsivPSGVu/Gj2t+x0dWt5afvNk6JgKIupVNSU
X-Google-Smtp-Source: AGHT+IGR24jHtPGUxfsKfO/45jWIvv5b6slQCVDAD8hWAJgGtxOK0toEZZdVCC30B+1NpY/lWq3Jzw==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id 2adb3069b0e04-54229992e47mr5455384e87.24.1735004883561;
        Mon, 23 Dec 2024 17:48:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:53 +0200
Subject: [PATCH v10 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-1-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WPV59zPnUnkkJ7Uz4UuxqKnfbTp+vJqvD7wMF0GDGF8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qW0JmIvaf0ZJx9gzznxy9gDxA3VXfasl5yX77W5B6nE
 7qP0906GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRsiXs/wPfhnxjupUgOUFt
 W+sWRunGC8KpKity2J0EPYMU5gi56b76Vs8UFdcjpS5/r3HSqrstFdcm5DMt65/7ITx+1pFZz/P
 SeSWyT7EHPU6IPvOgQetwQ+P39IXi9iaLw/L2HZr4cpd7KbvUu1eTZkzITVzi/PqGsGZZ54O8vG
 knuO8xzNRRVtl2a5vSylumF9kXCVYxmovlcqRGXDOPmcJ+6adIvLOq0NzwZ2aynxbbHC0vdDYO+
 GD55fb3jgqpRz4aIZ11fxXurBN6bb3cdn0Y013TSrbyiKyaHR+nTlT7l7bW/+r2yqPxgvM3nc6Y
 uGV6zRU975TCD+w/GAoitCYGrdq1YyZ3wswry9O9bN0lAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The upcoming DRM connector HDMI codec implementation is going to use
codec-specific data in the .get_dai_id to get drm_connector. Pass data
to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c      | 3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c           | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c             | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 3 ++-
 drivers/gpu/drm/bridge/sii902x.c                    | 3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
 include/sound/hdmi-codec.h                          | 3 ++-
 sound/soc/codecs/hdmi-codec.c                       | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..51fb9a574b4e28450b2598a92e2930ace5128b71 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -204,7 +204,8 @@ static void audio_shutdown(struct device *dev, void *data)
 }
 
 static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint)
+					struct device_node *endpoint,
+					void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6c409f4f17788d92bf2044238ca3b9aff09c6de9..4be34d5c7a3b8295f6b4593b3734ec8131bb3a4a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1952,7 +1952,8 @@ static void anx7625_audio_shutdown(struct device *dev, void *data)
 }
 
 static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				       struct device_node *endpoint)
+				       struct device_node *endpoint,
+				       void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 74f726efc74613460a6eb9c41f0bbad2ab06208f..698a9a01783d28edc734b6932a7768978de65ffc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1057,7 +1057,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index db9a5466060b663e88d58e85f24bf2d58d74a81c..f4c3ff1fdc6923eb7a8c0d8f7f92e7649c797d77 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -522,7 +522,8 @@ static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint)
+					 struct device_node *endpoint,
+					 void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 127da22011b3235b049c38413e56d50414cf36fb..a02d30c0ba4221d7fee0eb50892ab4d8e8436004 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -815,7 +815,8 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
 }
 
 static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
-				    struct device_node *endpoint)
+				    struct device_node *endpoint,
+				    void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index f1c5a8d0fa90e2eb2ee488b6a5871b005f797ea1..2c903c9fe8052ab721445188fd2b75270a55f2b0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -148,7 +148,8 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				  struct device_node *endpoint)
+				  struct device_node *endpoint,
+				  void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 5e1a9eafd10f5d4f831abbb6f4c0fff661909584..b3407b47b4a7878532ecf3b08eeecd443d6fdb07 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -105,7 +105,8 @@ struct hdmi_codec_ops {
 	 * Optional
 	 */
 	int (*get_dai_id)(struct snd_soc_component *comment,
-			  struct device_node *endpoint);
+			  struct device_node *endpoint,
+			  void *data);
 
 	/*
 	 * Hook callback function to handle connector plug event.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d9df29a26f4f213a30a2ebcdb63a593f9cf4b901..f536ca60e162dca6b50b37854ca6de2c114bc2a1 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -995,7 +995,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5

