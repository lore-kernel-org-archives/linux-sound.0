Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727E14C5AA
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396057; cv=none; b=bb1AboiS8tNG1i1hCbP1JeRGtaUk5Tzb3RGZvzzXhaHbRilCKMXVM9m09RRn3F4doF6xtK6XeXBY2ohu3GhD59AiF2lfC/7xXRE9pEShzStygQ5lJczb1ng2Jpqeb427Zh/GTFx1KDT1uDzcKKBeS4hkET6IeVZatvOCl5X66Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396057; c=relaxed/simple;
	bh=7s/0WO/aTzEx9yhjto9LxdTyBBJwSv9ES82NKKPeNQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kaCRuwnEixvJXyPPWUeq6ue0qiv7yzbe5tocdd+f0+hMqoNqqNbW5qBzno5ylCwK/f7WQ7B5Vf2+zwASx9450vLZGWROfAbMI5mBuFG8NP7noqPvwHvRb+jJArrO9YpLWgcxyJWWQk5iUGIJTvYaVU4NcV+2K5PpMyIBgl25M+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbM34vRs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbM34vRs"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f22fd6832so4964660e87.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396053; x=1735000853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
        b=WbM34vRsZiuZvoEJ3e7ev7GcMetQlA8aot39c9HZdsttj1nyK1gAj2D6irlNeyQr82
         VVZKaEfSF0QuEiaNIWTA0ED58M5kCYDTIpc0PJfGus7XumI130myxW/vjG9bioq7IzLt
         cXHY8nNg5YBqR5cT8XgthtbgxFBulCbNILilXnMSRdhkouUq83hj2oyvvojVfSqYdJS7
         2xTpkHWFkBFAnPxf5OdPDMzZqDiSwoNnRZL27dfAMnpRERFnaUxq9bPrFNV1BfjU63z1
         7AWQjGJPZQkD2D+OlUQhJzTZ3axZOSwkHMQ8E9cStMxa8DIud9J3a4be3nm3w8XwyR4h
         lpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396053; x=1735000853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
        b=mP/P4GdnFAOr1a/UjxiWLT5TFLCJA8iK+xoD1VESTV4E7csKCLETqZVzyUEIqWCQVN
         eaAmfnWzOhhc+DwAfnSBcl+vF8M8rBisuhW3oFJ7q4hT7HDQVIPQ29DbOTsmE6h57AjL
         mchLfeRMdkDiz7gRO7HVUe+38x0itJ7/Dhdgy6bgU7EERxXFCb7K54SXT1GSQWUtjula
         7U31zh8qGMgsZFrYuokIeTH5R81KHXOa4BeZnOcaZMtryaJJkwa0yxyzc++RUu8+eC5Y
         xhRhgZzr2NbpJzX/DALNtdnAJL72FmuA3XvDMohra7CR1LKdgQL3efmVJ+eQJKAY0Yw6
         FBAw==
X-Forwarded-Encrypted: i=1; AJvYcCW+qqehAaHcC+KirYP5QLlno5KIpvYiBXwcaCGX+tJx314Xekvt6fOMjP5gWlAa+BghkWk4YgUc7iyxww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKHWGKOuuZegtVeFSzduRpNzd9JhpeDUmtpH5FneY8wAw6x0q
	1rFhD4X8H2PHaR478eSzoXAy2/yt0vAlp9BAv/o40uMxQexRr6xY3l51rFSk0bY=
X-Gm-Gg: ASbGncvcgd0kir0BVTV0C08aGIu2SMVYowBzXnEe7DvJPxQ6MTxZZbxh7+Qd0rV9acL
	Nj6U2gH8Tru6+J06PfGIZ1mB104M2QF4Fh2LsHD7T/yDYTEFomvR36E+HYKlJgxyBnI1KeWZXc0
	DW/CWmPkaJGnvsLP4NCjwrA3piaBEAG8GvML5LMZRjXFdHe4APtjm4eyl4qF9A7jTg34cp1otBv
	msY9Wk5BcH397u0cF5eQuU+9iEWgdIIkUM3zUGIV3nI7iwe01V8rIJ3MvTm76xC
X-Google-Smtp-Source: AGHT+IGe0QdLZY73JsApHksPxAww/oxjVlJdjygOnTwbgrdsohY4NxxLR2cwt2MC32di//BAmFafkQ==
X-Received: by 2002:a05:6512:b06:b0:540:17ac:b371 with SMTP id 2adb3069b0e04-54099b6ecdcmr4290758e87.56.1734396053589;
        Mon, 16 Dec 2024 16:40:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:32 +0200
Subject: [PATCH v7 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-10-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7s/0WO/aTzEx9yhjto9LxdTyBBJwSv9ES82NKKPeNQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh66KurD/so/4BhoqlDVPuK2xAohhbIWN/EG
 x67827EyE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIegAKCRCLPIo+Aiko
 1ZsiCACZHuxK0m8L9MH1NhE2yPwWUTbzhXV2jMuyyQcJBcJKvwYMEAdKnau9ASgbjUyjrS0EqxK
 PG9HYh7v6OQuoktgWtwxcZgo8DyLPYPsH3ep2lhRl3cz3v19tta06Uegl+D5MxWNoOployl5pF4
 LYT81VevjzV55DOYBg/jYXMGpIZF+9d3Umz+KLMKQZ5DXC85lct2mD6XBUBijzLjKir8Yn92L2b
 o6p48mzqad3L+E2Mxe5QGYoLg5IvVV+ouFScCpgfmP28rZL9PzfgkdmP0ahbxw/xtzK1kfWSxSI
 2DH1/dpfUzApuoHsTjp/y0HbjKkiH/BbrYduZ4L2RBFNDDAi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bb5e8738845c74d975c1e0e1262ced46e4ef8fde..328a845ce0c4168b5463d344b3ad1f77a5437cff 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

