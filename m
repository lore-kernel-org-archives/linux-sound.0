Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D68191F98
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922766; cv=none; b=d0+BfbvJNu3555CvH6vlFeguMC3Y2AQjnp6rXc5jMuyS/qeNqdI0WYn6Xna08eV9BnfutuCUJkk8f+408S6D1gYKIogqkt/X7QTE/IsPmLOszNzrdLBKSVUpl57z7g/c79h99osJf25cJprqu23HwKAGdLgKIXyPMMSk0fIxoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922766; c=relaxed/simple;
	bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0YDcet9ApE7cqwaAYgunJnUhV0z/Bfst7RzwfDAoBD5p/7hOznmUoDTiA5+KpuUHeLKh9wF5Lz3OMP3WpIW8a609cj6zJPHfYIVrWXtTT8eq9w7gwkSQ1AQpMG2uLIRiP3p+cHC1M+ntFIDCSYuIa1s+u7zn0MlIn4prB1bhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZ9V9bUf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ9V9bUf"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e384e3481so3416099e87.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Dec 2024 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922762; x=1735527562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=KZ9V9bUfCVZWzza29OFxJq7Ues+YNdgyx5eJQPvv7X40++mI2u+5SQ51Nknfphr1UG
         3wA6P7ieTbfllQ7WKnpKYkxWC5xU24BW0fQUl0omjRbTpdeJq7qLXQf6UzvGph7BeNZz
         1q6KhUZRWM9R/WiQFg8kKWQhTP5zCWugvsoMOA/rZGqq7hkDGDNV0lh0emPFVAlt2Top
         vvFDg6Bxb3x/IboHRKW9iG8Rp9fUZw/suEzLVTCXnHhKyko72058BBUd7S9YfDEh1zRT
         0xtzj0CpLXHV54Z0hOdqtbfZYkIhmSwl6sPiR4shy+2Gy/57GCptBbWPo6jwg6ymmrST
         21jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922762; x=1735527562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=qrIPUWLF0IPLP03iHW8SELRvdidB+L67o0krEOXyOQYOCPVLdeq9Ja+nZwe48kKvA7
         HxtUJtDJ4+ZTC3L2/vU+41bwPCW1YLqBW1QrbUImW6ZTccEiFa8Y35xxp/jAtuXucIfQ
         OHDIqqsGZJOtxbrebjEU+U7WIi25Eri3uAmUsO5xNmsLcA7NsudCkOy1VmDlOVj9XgiX
         Z6Upd0ujUT3l3joDPnErHbxwe5wmV5GGCCnjnOjVrix68nsPOw1d9/ybk3ZEeDmwBiNA
         Ab+ggqnJ7tFJqPzFrkDxMb6ihXtUyhrzbFxdDx2hfed4FHf5RcVnnkiT+GGf22SZMmnq
         /Org==
X-Forwarded-Encrypted: i=1; AJvYcCURHdy6X8zJlSamh/Atj4rFVA9NOyN0vesmCc04B79quOC/JT30WZAn4zZJg36rXajc3xtyhbrKqObVnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8soBDkMvlrVhhyCMcY6+cWLXguJPHIls2pnkfXGOK75+Yx73A
	uy/0BdFTaDA8wIZOckrTV7QoIEaJClfqfTooPdTVSC3HRJJDjmny/RZ9oovSg90=
X-Gm-Gg: ASbGncthpbMvYcAmcIghkuxIi9cqwBgCk6A77dFWY52KFSHWmxD32kl1xtdoHnnC/8h
	su58aCjCpmuUZxna74hwD+bkHbsMZDv+AkiSIsHOiUhkzcV4UExc/0Od/TzoxKV4o64K66IWpqe
	VdcsCt5IFNrS9oGNqWfmAkYhiCsKsI+VwGlgSvujjblfexsT8Alir7q7LukcJZJ1nCD7rn33y8U
	62QEYkvA+4MwgksNibNdTy4Hmxk5YbmGIWjx0P/JXo//rU54j03t6De79GN6FvN
X-Google-Smtp-Source: AGHT+IGXP4rXvq7W3fLpzfisWqyUJAOUer76ywuuwhoE5fp8LHSToAxEcbOqHJy2piepiuWIG7rxUA==
X-Received: by 2002:ac2:4e07:0:b0:540:25a6:c342 with SMTP id 2adb3069b0e04-54229525435mr3832068e87.4.1734922762189;
        Sun, 22 Dec 2024 18:59:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:00 +0200
Subject: [PATCH v9 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-9-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxS+CfU4MvBlw2osJl83QA+wZ5kGncYgdoc
 JR2tU6eRoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1TOJCACrRFuRB+oY+c98sRz7Ma4pmcP9hkSpViEb1HhcqhQ+wSNrwsLQ11Regmd4mJBK79nOzwT
 Nfpri3HXgX0HS3qFYrZcUzi+B68x6wvwU60GwKMd/PZvyFIX8OxvcXzgOk2EQ/3yygWo8fFGThO
 X2MGTJqbpeegKvCKA3d3otC6Eu9/QitcjoKBNIh5HDbkAMlRMwzWQ2lriSa9FMiZYkSuA8vpt76
 bPSe/sIipmve9fE5crzyrvzklzHGaOofu5vsyHZI8cgf3TMNtOEi0MelWz3Xs3r09Ix2sCQ34be
 pLuk4G41OLEBneTNS266BoRuUdJI0xxWKkNROz1buEXtKh/I
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5

