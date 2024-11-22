Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B24A08
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236466; cv=none; b=nIqNxp0jPvaTU8rHCVzWEM8BMd47bETbE3BtvYWG1ptxIUzQrHgTm7NuYjXILo4zVV+zqVrg72eUlssLbEX5e3FIaEQApgoo1cZW9diWCWtibdB/KGu7Evs87G1tE0Q+i4X5D3gqa295eC9krPXlOdjRGW/KmW2cZwnpmXEeEP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236466; c=relaxed/simple;
	bh=eQ8kIXg5Uwc5J/4F/1E4S0ElrF44S0HR7t35Q9p34ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVkRDgu88+DmdcIG36AZPLyODOyN1BXKibscnL415JcHNEolibuBU7Q8qsfodTXoLl399TjDhn0qTYMWkJifYtqng+fVF6R+O0bok1GUHBsCqoFSbmY2cG7rv3KMDmXyHO62C30YNwhuqxow9n8UiZTMsBBz/RPSPYPKBIMIy5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WquRQzus; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WquRQzus"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f53973fdso1424168e87.1
        for <linux-sound@vger.kernel.org>; Thu, 21 Nov 2024 16:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236462; x=1732841262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJnQ0tRphnuqXv8JlNdv1AMzWLMUZZkvEPXzsxnLu/s=;
        b=WquRQzusUvOmRBU9uo3YeuuTCx0l8Q6aVMBFct/+OrVHXmeJqNiRwJRXn3iLW0pGZq
         9UnUDd1aQatOGfBceOQXWM/L/selGFiLchhj6g+Z4RsVxAjdDs4lwaBbjvMAZwzyF8vI
         43KFPl1NJtSqsziFkpZszKCC1Kk890rN3A1Pw0LZdR5UeiiJf+13M10WRjwLZI6tmhV8
         dMDJBSS4Vneg0ugrNcLCvGbRp5X7R7E2mOb1V6OdFcxrFjxAHpTLFi/O9yGF99a7KcgM
         PD+agy+B0H8RSA2TnatTdlDtePnjIFqGjfuZ07e0opKhafKBgSoEfrvqTGK7aPy2CSWS
         aD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236462; x=1732841262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJnQ0tRphnuqXv8JlNdv1AMzWLMUZZkvEPXzsxnLu/s=;
        b=o5ykS9YoyllcgBAF1eTnQLNUJMRA3iI4o6KLXtvRW0uhgDywdE4M18GGbMj5V+QNg3
         r4LqP3pFHs/Q6CXfHXsP98UHbNfEWdTEXelxirvdrNynHWj6boeYUpe+EOdKng7K9geN
         0CjmWDCC3H1ktACchAtH0k8P9gF8Z/aKyzoYYFuN5Xg7t9s600Rc4W2C4M+6ZXPawpSl
         VAUHjFLtv2b14UHWFqc3uGhlNKjjcPCUnecrxZMKZ2M+bKyCb8UWpPqqDYUQ8kMDKDQG
         Tf+lwVSaZzPMaB/DskF9y6KSKWnGiC1AydrtI33UrKuJmZxIm39c4+vqLS2fIHbmI7p9
         DYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXfIczoqimRPiZA2HNU4dCRo/CJhF+FBo8afoY5JYvU3ENyHf4IAygm1zTIkwBQoUijVNY8yAPbd9dYHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OD3kwHXyWaj76yJj6akAkga8hcToEj32jiEtre482ExaQvd7
	FeztDDRH0BzGnZb8ViagZ+sCEbogX8U7pMutkQ072jrivm3s4Z7Tp/s6kCc9W0o=
X-Gm-Gg: ASbGncuv6pnv0Hcebas5D4fVjlsW3eUIx06k6wEdDYaRFhych1u2Gpp7rMOEKvQ41eN
	RlIyrX1Xrqr3KruVvDLHjM4urvyE1WpxHELv5Vs9NbY8D4Ud8W95vdle2h9unlSCxxVGA3N303D
	lkBw9aElvjf2ipEFroxxJrB6/xHlVNXuWZ70CVUE59YUvtkhoexNyrIYxlLBlzQI53Lou9/2DO+
	gRpYHJle+Hx1cM6GAalJZSYXtSV1si2P6QGCR4TZAzVzpSxp/Xv8eBy6g==
X-Google-Smtp-Source: AGHT+IG/8gcw9tO0mI/52yh8VIeaAAyZzDyqsI74Djucy9hy39QFmFazcqdbIrJ2pfZcz+Sl5JhPdQ==
X-Received: by 2002:a05:6512:31d1:b0:53d:d0a1:f544 with SMTP id 2adb3069b0e04-53dd0a1f58bmr945032e87.14.1732236462208;
        Thu, 21 Nov 2024 16:47:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:31 +0200
Subject: [PATCH v4 1/7] ASoC: hdmi-codec: pass data to get_dai_id too
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-1-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eQ8kIXg5Uwc5J/4F/1E4S0ElrF44S0HR7t35Q9p34ko=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7r9lRWHOeJj0xJXqGlEODEX7BI65easv2vPzJOHn93e0
 R+762pTJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmkrmW/b/Lz59n5s88JK4R
 XSpdkiO50je7/9HHN3vZGFPuP/n2bv+3qJZFGuqr3y6q3M60Run8/b8vpNhuNYaH5a6/7lAXyD/
 b6taTL8VOLLGxm0q/nencxtdp9jDSq+da2zG+wr9aWxW7nCIkoqTann3btIm9eU9DaKTEzq//ej
 SEPbQynCrl95g8eH43acLd9P9yBrFWSt+93fUsTdpPMdyfyu+952XFHjv19uSi+MU5edc0MtgsY
 qaev2TE5q5Q9Uz8sYCya6579MK7/fafZtaFPbLw6l2movxpI6vBzPqkWLsoFSmP1/4npmfXbz/3
 XFAmNe18maG84EWOzSVa3963MrmnVxRIiJfuWpcqWhkJAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The upcoming DRM connector HDMI codec implementation is going to use
codec-specific data in the .get_dai_id to get drm_connector. Pass data
to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>
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
index a2675b121fe44b96945f34215fd900f35bfde43a..926437346b6c9a651d495faf25162cac7407d30d 100644
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
index 8f25b338a8d8f95dc0691735ac6343675098f7f7..6bc1b2476847c3bccbbf9874bb384c1f60674da6 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1059,7 +1059,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f89af8203c9d67cb05b629b27f66cf996baedd16..77bc09b875323d88f7346db9d24ea89a355c99b1 100644
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
index 9be9cc5b902594ebe6e1ac29ab8684623e336796..f0be803cc2274ca2199ed7661cf752b0a91434b6 100644
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
index 26c187d20d973dc65801a3baa59ecf57d20072eb..86c412e9cbc80bb82bad5db3aa0263a7acd9c2d7 100644
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
index 74caae52e1273fda45ab8dd079ae800827f0231f..abd7c9b0fda9ee6fa6c4efde1f583af667716611 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -981,7 +981,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5

