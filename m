Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8931C147
	for <linux-sound@vger.kernel.org>; Sun,  1 Dec 2024 00:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733013875; cv=none; b=W5+p9Tl9+PJWhjkmrcHJHAJ14z22Q3/NMlyte6VHanx1Zo99k9mGn4AagLgqV3I3DAAEHBApgRXzdFt15GAC5uNtMtqRRRGKR/8weiTaDAK+pdkUi2SM3W6N450xv3CwUZvTU30HfcThE0Mchww3W8IBGSUy82LEVvYFG6D0QPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733013875; c=relaxed/simple;
	bh=h4SDlLdLeTf2M3phGYhMa3icgLWVQxFU2Yi+KA0yVFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK00CvZWR93+J7zC+QRg/dwGSmRcMQy7H6LKfSkiTKESDWQYPilpN3XEh/Kp+/BPqs94nwvQXlBQSlHnsQw3wPge6N1G8nYXJnE9VZS+lBXWCaKBS5vmmOwS829jpB7XLdGAYwWND+QG3ysPgLJUHO9iuQvION3sBy7rHOUgk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=apCIiU9r; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="apCIiU9r"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5325af6a0so418139766b.2
        for <linux-sound@vger.kernel.org>; Sat, 30 Nov 2024 16:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733013872; x=1733618672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=apCIiU9rurOO4UqNAKBO63Q5xrzwW3FHiVCAIzIY5LbeZJBiX4HU4OOBfG67zlQf8a
         k7Au+Epn2Ow0Zov1X01JW7/d0x8ftBuaNyH1KE7wk8TfRXUsA0Z42anLlvMnG0nYgITl
         9at9Gi4hR5jDjUUFYkiD0EeDl2CalHQj/m9qa93rRCYoRSVHduELsRgMtYedGf8oH4mb
         wkiT6FCqmQ4UtMVjd/JjRwpSE+glkZu2Sjjm7ATzXIfOmW288xlDLwU4YwHjoUvd0uOw
         ED8lHQcX7b/wLVx7myZ705U8zVEnG/BbV122Z8ALb64uJ1n5IjBKXDWJ4s86Qa+lz+3+
         l8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733013872; x=1733618672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=IhlSBQ7BjqifrrVyTzVh4fN4x091TWjtDmTPGzqHvOK4m5lw76sttO1nSCQTOv9o5J
         XYxkbKAOj305q0t1rQkmfYIDzJWnOFhNcWoR0HXUn2LX8fmj+ZvWuEHV6Def0SV8ZEcJ
         pvXGcJatwwfKbSyKysMzygpFXmku3xVhEyx8BaKsHL9MGqkR4awyrFg5OZPCC5x6pM5x
         ZyH/i6yr+BSbI1xmzBId9QR8MkJM1kIIZZC4quFJPtP1FuISvi1oidmkvBoMi/aB03dH
         D/p7QbJc1PVNu18FF0767r3X/IMPsbmYK1Zbe8+CLM6yHE4b8C3P1uDOO+fhCw4kXxyP
         nLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRhYY5cXcRMlfwojafQ47LxRFQNW/FyWqeK+qcPZB+TAP7VFdFyvZTIX7d4B83eAVzrkkd53f+9ImmJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIMuwV4sGEwVLsq73+vrmYmhetPGDVRrzl60reey24HrA+k8d
	eEgaFGO/HNabqMJ918wHs2wHEClPfbxSIkUmGONAmn2Zw2E1yH1ZfhbHhQNrjLA=
X-Gm-Gg: ASbGncv3mEhhXMisinwBE8zBHM/e/h6u8aFjyVeXSZXZbimxMYGijTx/my6pE+mvivM
	/x9SuHRe35y+WQ9hfH6HM1l0kr9c6dg4fQ9fI4XT7LlMZROWgOvC5+KFg0rxgfDQTCHlF/nLNMX
	FRiBVePg9SJIDft9FLssyq4LHWEMdQH90ivQka5vAf5AW1A7b3c594Q73W88n31o/q8MMms4qbY
	sMkJ3C9dUmO0zZh4IfO5shN3aIT692hNQ2vyWNzOIZmHdm0c5oI2mIMTw==
X-Google-Smtp-Source: AGHT+IF0K77MkwwvldGVr80BjUwOmELL9E07KeKBaGPCRtOUdN8bdaAj3EzrCh/1BXcCeTTEMCnHgA==
X-Received: by 2002:a17:906:23ea:b0:a9e:b281:a212 with SMTP id a640c23a62f3a-aa581073993mr1476511666b.51.1733013872041;
        Sat, 30 Nov 2024 16:44:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 16:44:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:10 +0200
Subject: [PATCH v5 6/9] drm/display/hdmi: implement connector update
 functions
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-6-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h4SDlLdLeTf2M3phGYhMa3icgLWVQxFU2Yi+KA0yVFA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7r3xggGN//LkX2OGwV+txgy3vuXMVki+fujBVtzTye9y
 q9pS1zVyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFN4eIUgBt9joOh27iqbFpIUtNcDtZZ
 E+VVG5nEZcsFbRfqPXNbWnZNvPuYgbuBgYfj2QflllV+25J428zve53mfPtNiu2apdg+hYVyKu3
 tDnuf/9SNNzN6aPNWhd3pxJxr2pmXj5/bpHLHW6lDU/vHgkkTfUu8+FxbDGf9emDpc7VG9oRJgO
 ocyb/JNx6LTnOwza+17atl/3Ph/LIwkwVyoQ5RUTO0I5ru/ubcv44l812kxC82CeP93+oLlmT4/
 VST2sex6/TfE8yXfjw7+idpwjOV2Rd1nDpmLZNKjVnwvGrat0L7O7m3whMOPIrufzLpqaN3167E
 gKWqSpybPTTdG+zz2zYmPj2q82lhYu9bwzXv6g2WsQAA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by driver utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 59 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..2230b7fc92cfee46a9cad2479edce71822d30934 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
+ * @connector: A pointer to the HDMI connector
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most of
+ * the drivers should be able to use @drm_atomic_helper_connector_hdmi_update()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+					     const struct drm_edid *drm_edid)
+{
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+
+		return 0;
+	}
+
+	drm_connector_hdmi_codec_plugged_notify(connector, true);
+
+	// TODO: also handle CEC and scramber, HDMI sink is now connected.
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..61c43e744051886ba5f2024197fcc90688670ebe 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,6 +6,7 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
@@ -20,4 +21,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5

