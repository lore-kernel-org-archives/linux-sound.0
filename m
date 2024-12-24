Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D795183098
	for <linux-sound@vger.kernel.org>; Tue, 24 Dec 2024 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004903; cv=none; b=abMqA3P9cxoo1fwLigeqKAqZB/UjuKRhazkTJtnqdI9dMyadxEHP3s8cVzRuU/QmTRfchdnYLnbLFH77n8heAsD6bQPzsqpmHwv0jwp7K7JkYvW8XydaYmj4a64oznCZ4xfX6PzcdmhlcXlpxsIxeRRx4auCrB+nk50BmLwRMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004903; c=relaxed/simple;
	bh=hK86h8tSIYG4gNCwBsALiUu4fy8l5FoieDOZ0a2t+ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9y+EPXB5m1ygDAVC4bl/7HrqbGyEp2qYt3MuGQkXsMEqU/Vxqv8L8ykvjlIzgQ8qWK4ko+p7NrTwYuApmZsy3UkMbHlRkQedd45HIUOk1gPaDpruh5ScHSgeagbgsn/IJgp12ak3eA8GyzziDtVkddfI4nUjmpG+ZpIvck/6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1QLXZHJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1QLXZHJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401ab97206so4879555e87.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 17:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004898; x=1735609698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=;
        b=w1QLXZHJY6x/c5N8Et9mkjAbAO1bjrpMosz7nsmcfNwygBVdZME8wuK5MmGK0OO2ZU
         1T9xukyv8OZ5X/6qGO0AF4FYvS0k+SA5JcspWugrhOX9gW68pBcZEMGbAU9nqiR6Clxj
         zQFLZISRF6Z/45kSly7opOGQw/RT+slAniMikXO/yS8LnLSA2zPwYSFV3HurDo76Te+d
         kEQSAVrDiSK7BIsvNfb6oijQSJfVBYF7Z9C3NngtNted/JB6DSwHmSBPAQFnzSrlDnwV
         KslK2flX+Xhbt7PBJy4MeygSZqD/NP4H+/NAPAp3NgN4JrHomT4PEh19VXSU2MdDTeXl
         0kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004898; x=1735609698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=;
        b=cLDJBqxI9KHkq9zodUo3lMotetNAm6MG4bQbre44zU/62HSkIOybkrDO4wgWSGly5e
         dA6d/lPAKZ336qQdyXEa6Pk6IRpZyIRQxJOZ9nK2+4ecZdI50IHm3TULgUaasEQiFuIw
         A5UCDuOqqykqksu+1GVM1TpNXDACEcMAoSbw7Ax2uA0Kk6Elm+pN8/i1ofC0mf760lKF
         0DzXWiIptNLDJb4F+E6/poHzWRIkSkjWcdyk8oLOII1obFinK9xy8H3RcE10HMgCqKc9
         3MgS4p28GGyw1DYo7lMMK1fFB9u7jNSy1GdaFfxfcTLgwDd+xzwZRGNDdb4T4NYULyoQ
         difw==
X-Forwarded-Encrypted: i=1; AJvYcCVmOdyQztBcG2LaOQe3HPSiFFdF15CeFvddWdpAB770v5iaiZoWie9425U+Z02Ln+Zp4br7vr7Xu5XXqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnkpxpts5jgijttvp2vhGZE+oz6riLOhB1Lm7FJufhJy7V8Nc
	rEB2DqMERUR3E2ZTtCuBToFvyhAAvQwst5ec9/k8yyO2M+VWFFcXwmm0AP9RjtA=
X-Gm-Gg: ASbGnctsFPUMkHE0pldqzTrpES7vH2jQFfzl0ri06fcKihJw/teqgpp2WnX8FphiLy1
	OapHDN/2cq4b38cUD8PpIg0pPZakgdAkCtRVVIMvxcCbqSt3r0IukHCUIEUWyJEbtUfecef7m3/
	RapHihIMdDGGtykMyQyPwJH06xIYQsEKlg1/9DnyE+zFUpXYLf3u/u2g+utV2TEqYW64F+9pLCV
	o2/1ce38ddlTEVaFoO8lFY/JGNymPGTTm2BHIwdecp5+L+mt2/CdkOBEq9o1gUB
X-Google-Smtp-Source: AGHT+IGPqkn30jxniIP++g3DHBL/bjgtZ0I3v3hoP6RoKeGURCaPTg5NoNi6aq19h5jln67MzBZcug==
X-Received: by 2002:a05:6512:683:b0:542:2f0f:66d9 with SMTP id 2adb3069b0e04-5422f0f69d8mr3459595e87.16.1735004897679;
        Mon, 23 Dec 2024 17:48:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:59 +0200
Subject: [PATCH v10 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-7-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hK86h8tSIYG4gNCwBsALiUu4fy8l5FoieDOZ0a2t+ng=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNlKk1pyY18Usd0pAsYgRQhoxcr7VaL4Ngy
 mqv7/G60TqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1UzgB/wLQTAl/PBvsBI087pXZoO4Xtg0wcjMMQ32OkBKFjWYFinkJTEVHSPdZ8RJl1HOBQiKBqP
 C0EP7jbuqRBtzkhax4sAkGMsZF5OmcJwMgvPlt0nGAWOtoH0jAJiVPDcR3Fs/D/MyZ4fS9ZZTWL
 GfzbiAIF39GTPL8myW0yoY4YIL+N6llV0uZ0yYejHvwFUV6D6/B4CFN9yLdUFOH4xpWo5YaZMcL
 Pk1jZXYaE09n/bNPxO+CkLslE4AlzgvszVNANChOpIwinIWkIAghEIGEZXGoa0XHdTd3anUV7kQ
 5DfNw5Xi4L8P8aAF97ZE4DEcrniGkLQU1O61s1IoP3YHcCUn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 3f18495c30a4a7fcdaf93b161cf1d30020788772..c4a1476c8bffb86b34e86bb9051194bcd912ae1f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -181,11 +182,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -204,6 +209,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
+static void drm_bridge_connector_force(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		drm_atomic_helper_connector_hdmi_force(connector);
+}
+
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -232,6 +247,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -277,6 +293,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.
@@ -369,10 +393,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	return drm_bridge_edid_read(bridge, connector);
+}
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.read_edid = drm_bridge_connector_read_edid,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)

-- 
2.39.5

