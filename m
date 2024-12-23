Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33213AA2A
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922745; cv=none; b=ha8faaycyR10LooPzdn84Ip5wXiRiaZf8SMUyIIEmpmt3xOCm/vyPBHcF3RMr+e3PgK901hcKmAeRW6w/30UT/P+v762wce8+rKKbd7eKVV2ztb/aosGADb3EvVxGEj7P1tbJsLDlctJkAQGT5lqf9oy1poLDWekC50SpANEDz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922745; c=relaxed/simple;
	bh=mIheBGJ5xnKlUvZ/MqJ78uXN/dvisv19PmCLKBVN7L0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tbAcS3KBdAGwBaG0cd5eVyT6rP/H7stZFNFXHc2j67bt2dKhfFXd0LCIjlV7/mcnqdTMHMhNOhKmQG3pHg0Xw0EXINuSzw6HZctVcmssP9018uj4c1IcLwL6d0OMlwlN8J1duBOD1JZTnCPT46gfAlTVauJJST6jmcJZ6jEFgwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kqn0+/Jd; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kqn0+/Jd"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54026562221so3964504e87.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Dec 2024 18:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922740; x=1735527540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xb+TOxaYCjOBIz9Q4W8+U1oJU/9HKxHMlhS0eOr6et0=;
        b=Kqn0+/JdjPcN+IJioQ9zaZCD/fMKJeejj7tVOvK96ynEtLNOhBLrdpyuNVmwm2LQJA
         D86PrEEeuGRwcSN3ub9KOIJSB6PGa5SQwvz46JemIDWUxzlPXxP+29Jtph3b+fQIuHHP
         qlC+XB95TjhZI4HC6QbCndsHEwaos3BwuaCmSpf/Bh/QZ9Zw80ALj0zyRKtSqLbyqbUa
         q7jv4MFUIfLDEfr8tz3JXMMgx/Os/Om9nciHjiBXLImKU+nToJEIRnf+VJ/dMbviA/3F
         r0bztzyyqQwiOes7YTT5LaifA0fqEsKG1Vq1bypY4Gt8/1cgjXdtkLeMWyRUL1uO6C8v
         Af9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922740; x=1735527540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xb+TOxaYCjOBIz9Q4W8+U1oJU/9HKxHMlhS0eOr6et0=;
        b=jKsgVXOSVh6+aE/hJo5mJC2M/dHw1hzqqCBzRRPOZaNp3+IqobvVfVdmpX+cUGpYqn
         CY90TyYlcZRFN/p53XfgehcwxTz+2WH2biptlQIc9owKx5dTzGW8kI5c+R2+Y43MFbYv
         8DZBlZ5w0jB9VRooUt+Xv8VjRBihfAZutc2IyKlKVMEqKcNiMUvIgaMRpSCA0LTnA8b9
         pYmR9IPH76Eo9fKdKroRwZ5iHSfgHz///xcE4plLyN5sb6TgR/xhOHQQckX8QCQQvFkk
         G+YE3AUwb8Q7dDUGfS3Iy2Q5VwuZeDC4Fa90GQBzaglloGwMlZWfc8TvgQq3Ll4lkG/7
         uaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZs6jdQngISCkyW7yo+IJwVgMkJT+GtPvhOgUCPJSPhfjKhnbkW+QoZqEJ38DBECMImBs9wHyBFG0RrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5IJtdtQkGSBkdVQasGIv1um99Z+0XQ/w564DPv9e7FOyL/Cmn
	2oWgvLPjysGyXVvJr7mSzf3wtU6Xe9JBz+8oJU/J/ehicHfN1TfaDX/Nmx4xKbw=
X-Gm-Gg: ASbGncuNYNYFhqLoLACPz7jOvkndTSQ5FHlK7z/VOCU0tcNVrT0UFukh9CACOv3YfX3
	05OgOTvqOB/bsqZWJ8J9ZS83Bcb3x30Uh3/5ry6VnJYR7brd8tNMxqZGnKCYs3r8/4ft0zuXx05
	9ne3beP3iZTS33/n+DCwouvnn9qFdYdyNdB62S4sd8W0DetmPA55C9rjYH4gTq0+EZJlTEq2BeK
	DGttUiwoRyu3Gn/rspU3SZLvUVILhti7pa3nM1t9TK6/aJFjFzQiUWO3X0nEGBH
X-Google-Smtp-Source: AGHT+IHPJdivuQywuu0B4zhbSIt3ph9a3ubXCP4l6mr8/G4+CftlTr18vgLKdd8BO8JB+8DNf+BT9g==
X-Received: by 2002:a05:6512:3f26:b0:53e:39b7:54a3 with SMTP id 2adb3069b0e04-5422953ac26mr3225094e87.24.1734922740419;
        Sun, 22 Dec 2024 18:59:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:58:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v9 00/10] drm: add DRM HDMI Codec framework
Date: Mon, 23 Dec 2024 04:58:51 +0200
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOzRaGcC/33SS07DMBAG4KtUXhPwI3YyXXEPxMKPcWuJJOCEq
 Kjq3Zk0AoIieeexPd/I1n9lI+aEIzserizjnMY09FTAw4H5s+1PWKVANZNc1lwrXoXcVS6nQCf
 n0KXKD32PfhpyBY5H00gNjUJG/e8ZY7rc7ZdXqs9ppGtf91GzWHZX1QhdUGdR0VAN0Tet0dbJ5
 7fU2zw8DvnEFnaWv5QQXJQoSVSjACPYECLgjlJbCkqUIsoLbWPwVrdtvaPqDSVliaqJcnUwEAw
 qF2BH6T9Klh+oF0orYbCV0Qi7o8yWMiXKEKV58KLWFjw3O6rZUKIpUc3yVw5ClM5YLfSOajeUL
 EVsbomSCiA4ixKA/6Nua+gyfnxSjqc1eczZEYnoujQdDwvdpdE//SyqHi8Ttd6+AfyVUH4KAwA
 A
X-Change-ID: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7987;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mIheBGJ5xnKlUvZ/MqJ78uXN/dvisv19PmCLKBVN7L0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHwULF4FLgPukZXdAF98uBzR05Rqa4/PCQcl
 nY46XMqNhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8AAKCRCLPIo+Aiko
 1f21CACrW3Iqm6nbgodLP2vWMo4lTyAzXGFzw0IdufJUp6p9WrtzUJ0gUxHTjFhRBTYg05B5T+3
 CHkz9MARAzuTA2d0cNcj8dWpJZNnbeOANhn5pwMBq2fmsPIvJdqA75IMl6Mcn2hC6h0DHgaJK25
 xIERQLsdmCYZ7rvXwRNbI9T2H8Pvun2gi9RGEobSdy/l2NFHLeVybEZOuvmdtRiU6BQ1czUzFlq
 GZoQ3fcYjDYmKZZmd1dDkeCJOWMGP6F+K/kT4LASFVaywWStLziCn0uxFm46zqes1e2OyBlrOjY
 hrGK4yPb4fgs6EULH+Cf30M20W53K6XvzQliCoIYqcbRFHs2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
framework, I stumbled upon an issue while handling the Audio InfoFrames.
The HDMI codec callbacks weren't receiving the drm_atomic_state, so
there was no simple way to get the drm_connector that stayed at the end
of the bridge chain. At the same point the drm_hdmi_connector functions
expected to get drm_connector instance.

While looking for a way to solve the issue, I stumbled upon several
deficiencies in existing hdmi_codec_ops implementations. Only few of the
implementations were able to handle codec's 'plugged' callback. One
third of the drivers didn't implement the get_eld() callback.

Most of the issues can be solved if drm_connector handles
hdmi-audio-codec on its own, delegating functionality to the actual
implementation, be it a driver that implements drm_connector or
drm_bridge.

Implement such high-level framework, adding proper support for Audio
InfoFrame generation to the LT9611 driver.

Several design decisions to be kept in mind:

- drm_connector_hdmi_codec is kept as simple as possible. It implements
  generic functionality (ELD, hotplug, registration).

- drm_hdmi_connector sets up HDMI codec device if the connector
  is setup correspondingly (either I2S or S/PDIF is marked as
  supported).

- drm_bridge_connector provides a way to link HDMI audio codec
  funcionality in the drm_bridge with the drm_connector_hdmi_codec
  framework.

- It might be worth reverting the no_i2s_capture / no_spdif_capture
  bits. Only TDA889x driver sets them, while it's safe to assume that
  most of HDMI / DP devices do not support ARC / capture. I think the
  drivers should opt-in capture support rather than having to opt-out of
  it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v9:
- Fix a part of the hdmi_audio rename sneaking into the
  drm_bridge_connector patch.
- Move HDMI Audio implementation into drm_display_helper so that it
  doesn't get compiled for driver which do not require it.
- Link to v8: https://lore.kernel.org/r/20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org

Changes in v8:
- Mass rename hdmi_codec -> hdmi_audio, drop redundant audio_ prefixes
  from several callbacks (Maxime)
- Fix the commit message to stop mentioning
  drm_atomic_helper_connector_hdmi_update_edid() (Maxime)
- Link to v7: https://lore.kernel.org/r/20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org

Changes in v7:
- Renamed drm_connector_hdmi_codec_init() to
  drm_connector_hdmi_audio_init() (Maxime)
- Added extra empty line in struct drm_connector_hdmi_codec_funcs
  (Maxime)
- Dropped if/else from drm_bridge_connector_audio_startup() (Maxime)
- Added optional .read_edid() callback and reworked
  drm_atomic_helper_connector_hdmi_hotplug() to use that callback
  instead of having an internal function which accepts EDID (Maxime)
- Made VC4 and drm_bridge_connector use .force() in addition to
  .detect() and .detect_ctx().
- Moved HDMI codec functions out of struct drm_connector_hdmi_funcs.
  Assign them from drm_connector_hdmi_audio_init().
- Documented struct drm_connector_hdmi_codec and its fields.
- Link to v6: https://lore.kernel.org/r/20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org

Changes in v6:
- Dropped extra checks on the EDID (Jani)
- Reworked drmm_connector_hdmi_init(), splitting the codec init to a
  separate optional function rather than passing arguments through
  drm_connector (Maxime)
- Reworked EDID update functions (Maxime, Jani)
- No longer refresh the EDID in vc4_hdmi_connector_get_modes(), it is
  redundant as vc4_hdmi_connector_detect_cxtx() already does that.
- Link to v5: https://lore.kernel.org/r/20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org

Changes in v5:
- Moved prototypes from drm_internal.h to
  drm_connector_hdmi_codec_internal.h (Jani)
- Rebased on top of ELD mutex series, resolving the long-standing FIXME
- Converted the VC4 driver (compile-tested only)
- Link to v4: https://lore.kernel.org/r/20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org

Changes in v4:
- Added forward declaration of struct drm_edid (LKP)
- Fixed kerneldoc for drm_atomic_helper_connector_hdmi_update_edid().
- Link to v3: https://lore.kernel.org/r/20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org

Changes in v3:
- Dropped RFC status
- Fixed drm_connector_hdmi_codec_init() kerneldoc (LKP)
- Dropped double underscore prefix from
  __drm_atomic_helper_connector_hdmi_update_edid() (Jani)
- Moved drm_edid_free() from
  drm_atomic_helper_connector_hdmi_update_edid() to the caller's side
  (Jani)
- Link to v2: https://lore.kernel.org/r/20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org

Changes in v2:
- Use drm_atomic_get_old_connector_for_encoder in atomic_disable() to
  prevent it from crashing
- Reworked HDMI codec init/exit, removing drmm_ calls (Maxime)
- Drafted the helper to be called from .detect_ctx() that performs HDMI
  Connector maintenance duties (Maxime)
- Moved no_capture_mute to struct hdmi_codec_pdata
- Link to v1: https://lore.kernel.org/r/20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org

---
Dmitry Baryshkov (10):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI audio helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()

 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/Kconfig                    |   8 +
 drivers/gpu/drm/display/Makefile                   |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 137 ++++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    | 189 +++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  56 ++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 103 +++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  74 ++++++++
 include/drm/drm_connector.h                        | 141 +++++++++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 27 files changed, 726 insertions(+), 208 deletions(-)
---
base-commit: 9d2616754ce7e16a9e73ab6c00efc27fe47cb943
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

