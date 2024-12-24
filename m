Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3224518FDC5
	for <linux-sound@vger.kernel.org>; Tue, 24 Dec 2024 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004908; cv=none; b=gocosjD4p2Vx4ZvyL30u71v1mmMq1Do2l0xYoqwP5Q7+NMae1lbJgY20Rs7azNNru+PvhCkx4Q/8aEkG1dOYPp504ypG9GrKzr6uV35sue6oGsPasnXeLtypV+LbKmShgObNSmrcSq8YF3Hqf/UXxyJWnwlqT+U6UJmFvYqvoy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004908; c=relaxed/simple;
	bh=B+VyVi47xGS5Rgo1fXAf2iMXQyx6B0hUm57mitVwu5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXDAcHaL2xDErcT8YNh1WjUEAKfVbSzOjAsqUml9b4qn382ATSmLFKsz7Fmb7LqdqecPNCpNAI/PBgv9UM7t7r9hJcNzNT9qjqNkjHS6/7uEYp2XzHhIpjHCTasFIZrWiXy/HueFSY0Dyvs+XORfnLMB/CuqTPw6CjWD9gxygyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iz4c21E8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iz4c21E8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso5011477e87.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 17:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004905; x=1735609705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
        b=iz4c21E89IsqBSixg1Ijgg6Pdg3xz2qajc7Ld8qKHNo5CMb4+0wJv/2c/xrKCGYKwa
         /iRx4IaYoPlV0uutV3642wQYM6pKCQ6fMS3GUIH0zzvgMMf3maPf7veJmclo+TLTTarh
         2HUzY8A6VUUnLUni09zQZofoAHaW23UPuj3NLzkzCQLxv8bvGXXmQ3xpluX9ME25QmnR
         pzr7EXtBd24ZL2rgU/56WoMvxNh+bXBj3k8I2upkoOI9V2JF6UxKLGB/4j0EXwkoPC3J
         gNKPVFZ1v2WULUEREuEuFGry02cMSVkvvJAUXRtFDcCnQ/t58psvWJCQkpsXCdN+Qj50
         N5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004905; x=1735609705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
        b=BiyoY2zrwMHtlyOZBI/pztrgr1UJjea2NVR6ERKDsbcEOCU5ZhJ1OMSITrOHeKHOUm
         OPtqR+aNWeAiaKVCVLT1tcw+v1uReCcuN84gItvJKBSYnOPkq76/2ezlkOZ4s7JqFaJm
         KxOyMPUnfur+wtOBm2Tp3xwIuX0PKzhsvUEz58j56n7s5AYUf0WLBe+YkV9hacW8n470
         2jXj/zPGlemrdEDnI6xo6Sue3+L2SsEHE8w8TA1YoZ7sQmIODkjOwLnVEZKnCSFM/Mvd
         MSyA38Fsb0Q2UNj7vRGhAGb0UYqIgAPRY5OL2BvVbtIiwp7iySpiXuvZEhLtJQ0KDiYk
         YeHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6fMoq4sQmOEoMFJO4J5Fm2BmGH4ID9NB5xWQivaAXZabj+QWAZH9o2PwPez70/or/UP3bDw4CSgLSBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1EqqTaTXskq4ocCmA4RTlgaj1dtWKj3yZp4Vk1dGuYYFCwL1
	U71YqRs9lk5kD9BYs2prVuiv026pIdK02rJOpuojJtl8OFjpg2tr7ZLJw10DJ6M=
X-Gm-Gg: ASbGnctT3XcDQ/YfPl3o9z1ziSX5vEf3PuoeZbSq2C6G0xEWIy0oGDJzzYh12VKutY+
	w3nKp3aVCvxs/LW5UykKlKolb+BNCcVSwBCgOcY3bQaOK5XdpVSbXktZgdheG1CDFJlSyZJnsuh
	3L+C4EdjShVmKbf5wwjJilk3/dV2WIhGv+MZHhEL4lJ42nmNkYj0qksXxXcYX3nsys9ZZxEKfnn
	E1KGNSObgaxqmVX5qlc6etDmK2i4RK0k8V2F3l6qk5GZjfp2Wmlz+C5CeQn7dEN
X-Google-Smtp-Source: AGHT+IGxywAHlZ5biHokHnOEm3MPf0yFL5QnCm6g8X8iUKGFmxEoXLpi8MebkWFCTzgOs9+bQfvDzA==
X-Received: by 2002:a05:6512:1245:b0:53e:395c:688b with SMTP id 2adb3069b0e04-5422956b5b1mr5020537e87.47.1735004905376;
        Mon, 23 Dec 2024 17:48:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:02 +0200
Subject: [PATCH v10 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-10-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=B+VyVi47xGS5Rgo1fXAf2iMXQyx6B0hUm57mitVwu5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLO/eNo/39x/HJrv+HFXwG6d8BCBlotDoJCU
 qqGZkD6mo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzgAKCRCLPIo+Aiko
 1TWHCACeIhaoB+aD1Id5dsTO6uA+nC/AVkJRJD/7UYmW8Ex7Zn2qDhEmWtBdITotMWW3ByYkUvj
 uWd356HEakck9NA8ieyZDfqWEWxIYpA8KfFQcvIFiYtmcFLi8kJSZDn50oFIpYvQaj2/gM0dAUN
 p8u9lmdLuAdFhoJjHaZawfbQ74cmm6k0F0FhKKbhW+u/RzdcsQu+fDZ+GzwQfElhQt5Cabh9VTD
 9m+cMW8Yv8g3rD7N8BgPs/xSnrX5W/1NqXWaD3O5GzP50Iks3oWr3bfaQmjdOpjCu4PWuKpHVmB
 5WNoz9+G5V+lgNo6KogfIsR04KOp+MyB/Lr4QH+DuZNDR5I1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4949171c28876a9145ddf03e99c00feff4df255a..47d9ada98430634cfd8c1e21c2a4d00d501bab7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -384,7 +384,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -406,17 +405,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -550,6 +546,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

