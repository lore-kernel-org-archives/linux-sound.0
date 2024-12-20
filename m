Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83F22619A
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722243; cv=none; b=I4HROaXbwdof3PfwyjHsMbYmMJY1mSOZhwHgbaav3mIQD425WHHaNWYbgh3BEJNXXOoNaY7/nYPMFQuH0dcK3aIiNAeQ18tM7W/reyO+LLffvkcEFlZK1t0ltNLDr3183MLs+xfN0vOKfWUhlFoaS/2GERYlczWWmrxHFbvMHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722243; c=relaxed/simple;
	bh=iKnhAGg7468g7orLpFdKJtkRp4+W6L6GVAIMc8oYKc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kf4Pb27QFWsM5JjDzuhBEStkBjwJL4UzGF/mN1Y+m4k7n8rW62g83EZSaLT1w8Y1drL/I1T+403/ZIK53nbWKTyHamlmc3xZlCHin1jsFljVk1fdUPCOmYj0E8KrMFKFp8yFqKHz8jvzDq1UcfGlJR9u8woyByBbAQqUlgCjjbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWhkIWdE; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWhkIWdE"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53df80eeeedso2233566e87.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 11:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722239; x=1735327039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HzhgiMxv2Db80VG+KMSWbYP6O7BGF88n2kIxBCX2f8=;
        b=sWhkIWdE1O1r7uHocjqFGhfLbuLqSW85OCrKeK42pMpYqBE6K+A1OEKTUXyRd/EX+1
         yWp9JFvVNUf2LDasjnYb7xTsoHmvBRBCSCGmbr3pjjyLvCVik7vD8RGFYggaStDWE5pm
         HrRio4KIsrcc56V3/sw8MDV6DFtcypZtDPV5OiudvlqjV3WhWBqT2FKnd+zTY28dSKQc
         BymvTFSnG/McoYgq9Xd58RKf7qQOwy5vhnDiJn3nUFp1ps0mg4fVOjG+N5npF/V4lOuC
         CA0clY+3C42bzCLqkl6AgZFK6+ZvlYarg/XzL4IkqXTSlePVU83G9nz0xybkLIyXMpOm
         HMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722239; x=1735327039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HzhgiMxv2Db80VG+KMSWbYP6O7BGF88n2kIxBCX2f8=;
        b=jBlvERCI5aoxe2Yie8wm4fMUjR9gmiDEYl1Tu9TSwaVCWCdMlexKM2YD/YChNAE/2K
         vcKZY5S6HnUu/YaycVQJD3RvgmabB9HTWCKPDK7DrTVWFKcSd3TTO15BKT2QNTn3iZST
         TCJIQtRzZ5GlzpHTqm+tuqnuvi9AumzG5izS2oz+rmFB08iP0ISMhNi+jAyyfTurpVIx
         i5BMLOv4aGklIDXH73EfUA/Q45Cc1SokYrtNoKn/auwsZmGhiL5hATgtkqRlfsRLTkbt
         dYjT+3ottiV3UY7mlgfBwwmUUOkNiEz44oRwL0TuWbmSPAaZltmetjXvgcDgeipVmsaX
         a13Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtWTWOqUjareocVxMRA4vhFIW+KHwrAWkgXn8DSoupAXr2dfUMa2k8K4xRxx0Kn6OuQ6VxcGTjRtQSeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWouOQpO+fMdaqE4zuyjrHwTVAk1r02ekJ8/Q0knjQDRhsYM1u
	doQBWdbXHK7r35RJBrtYX0lRtXauzjbYaYAKUSysX/Nk+mDtb6NlHqb+2WhfLuA=
X-Gm-Gg: ASbGncv+R0q6cCDjzV0RRhrcgJV4oesOrwbFNT6xE83FbdD0nqw4PI8cegNYhFXVJhJ
	yf6y3btuTZbo2BaciB8FKRCLRon35D3Dxqrocz6TKsO1HnxaUJMFOZLHw/5oo+Z78HJjmxjpEuW
	w4Fzc9ddByngXe+acyPih952Ai3uQgP2+YFvMsiRsmBAgB3PdFUZL54ZpLXMi4FI3pNRwNQFEuz
	JW5uJmt5EQsfLIs82K6drNAEEzhKr6ZtG3gLChM+OZgD42fOA2DMuzfRhtDhhkT
X-Google-Smtp-Source: AGHT+IG+R3K3voHplSfjL03KDUvgoZtw33SEZ8WVtANcb0AAyGXIHD8NReTbHW4+7YSPFOXEXe+wtQ==
X-Received: by 2002:a05:6512:1245:b0:53e:2c74:d65a with SMTP id 2adb3069b0e04-5422958201dmr1589853e87.41.1734722239334;
        Fri, 20 Dec 2024 11:17:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:03 +0200
Subject: [PATCH v8 06/10] drm/display/hdmi: implement hotplug functions
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-6-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iKnhAGg7468g7orLpFdKJtkRp4+W6L6GVAIMc8oYKc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKunctM/w08a1CycyuUyrKgqJE0Bzd71O8uo
 WVpbib0Zf6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrgAKCRCLPIo+Aiko
 1bouCACI/hyYhbo3BsoNBQmAzhkYtIbnylod9euQ2clpHTsmnWDdqwUgcPm0KYBF0eap7exoKlo
 fkeiA3vngkcPEWY8l9Ii7PBWjvkZX4xcUgsckX5Xrx/3V92Z5Q+YFgVBCFloiLeiI/HDbYaiqhL
 x4jKmdSqR0hb9ui6+mASE2iI8vLQCC56dA+O3bNof7h2wspVF4OB/8/FM9TWY6+hkYNvE/3hQoc
 kgs4Q1lkc/MfCG6R6tqK8n3Z3L19zxTdlbXhdl3ytgCa1MxKI+O3jING72+B/IWQxYELQ0weNIA
 xY4wwi3PDBIXl874ysTbU8OYBTQhAqqEhsSb+9IDem4XdejG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
framework.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d678c635a6935050ca9c1ccafbb0865f21df5d4e..f4935b3e630cd89ec6373eb67b06e6a3a3b3a55a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -777,3 +777,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+static void
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+	}
+
+	if (connector->hdmi.funcs->read_edid)
+		drm_edid = connector->hdmi.funcs->read_edid(connector);
+	else
+		drm_edid = drm_edid_read(connector);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+	}
+}
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * callbacks, updating the HDMI-specific connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
+
+/**
+ * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function implements the .force() callback for the HDMI connectors. It
+ * can either be used directly as the callback or should be called from within
+ * the .force() callback implementation to maintain the HDMI-specific
+ * connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..9ae19f3caf727f9a0fe06e6afe5fc46db924444f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,6 +8,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +21,9 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status);
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index ecd3dce94ffcfefacdb554efdc00ea19d6c18f24..9ea08a283018301449895602f3f50ffbf22429ce 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -45,6 +45,7 @@ struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
+struct drm_edid;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1247,6 +1248,21 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @read_edid:
+	 *
+	 * This callback is used by the framework as a replacement for reading
+	 * the EDID from connector->ddc. It is still recommended to provide
+	 * connector->ddc instead of implementing this callback. Returned EDID
+	 * should be freed via the drm_edid_free().
+	 *
+	 * The @read_edid callback is optional.
+	 *
+	 * Returns:
+	 * Valid EDID on success, NULL in case of failure.
+	 */
+	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
 };
 
 /**

-- 
2.39.5

