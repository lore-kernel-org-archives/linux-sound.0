Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80253074A7
	for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410000; cv=none; b=rEnVIO0p98L+PY5+vxl4VL7tLCK6AU2QvDWCQcKpH9BTumOeQWb55mDZdClyWWRzO4GUoM1g4QGr6jUbkpmy+Jpf0cHH8ZzAmUVUbnRHOlSKvrtKXX4RoqXVLgItMwjS3TN6eVLPsPxWmg62jXWIgpcKKqDRh1rUsEpfvm8IrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410000; c=relaxed/simple;
	bh=iv3iCCSDVeRbyipC1ke5q3yTI1qFQp4/PoyLN2PjHKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lN/TXm9T3qVoD4U8pbDgZgUhn1NeJ+yeODxUlYmZsYhZx3moiMRJOGBp+NuJAwrTIjWWpoJ3v4H+j9jdyC8oL0uYlb5du2N+SUucCCbaoAmEfai48dSrqFkQc3KZynYaJtRQWF0K5VGYDmz6S5Cw+d8iq8jRNYxutxis9XLkpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyazQo4e; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyazQo4e"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4eba67d4b1bso7009791cf.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409997; x=1762014797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=;
        b=TyazQo4eXQpDlEchskrTFZdIOaTy8wv/yf77Ss+z9m8I9H1nHQcjTQ3Jv73z+B0Nb9
         R8Dkg+/E5n3Q9FoyzJa0csh2Clye8+VWjMxN6DeKZInVDGQVMAzhlP8Sj0dnB4TRd2Ua
         7MIP/ZErduqjWs2gK2pgNJrndI/dP/Wi2L0TAqL2UN9AsSuqCZ8y/2VkIdpzJYurpOf2
         w8MLPLGJ0YTkrnSu9nj+pADysISf6QZnLlsjfUZkHvBdWDAGaMT9F6eeSiFQIisChYQQ
         YPpMX3TDMb+udrv1wcikNDy2dIcatt47WFDRaahBMbmH6+n/N9OVba4c6nl7HzB7xura
         u/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409997; x=1762014797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=;
        b=o46f3sRSWHcQtHKe0S96R8z23OnbjQwqRNFngLL2ATS1AzvfvBHAN3QWnWRZgshzZj
         Siv5+XsCEZepVS/uTAn6+xZvveG9znDDmuHippjLHazKsttFZ8fCyjWHe29OJu685J+r
         UzzcRbInDaEo9nLyJS5RsB/QCYD6as1d4/Je4VaPjeer47GLY7gFCCixzAdgBo+6iKMc
         KKu6isuogWzS/WoGL9d9EvBtJSg8lDzDrYu3JXAEDzbmH20qlxF7tf59l/UvLVtTO6gE
         hZZk+vW8sW+FwLHFWH7cj3G1kpgotFMVuF6be5NnzU61UPgqT0CCfXjoiXiDDeAbbqCb
         nnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQAMVCR5x1wywhJCh680wArhPMLVjHe1HAUnDioRfvXVkSnaImMht94u2blhEJq5gJNXXhBHh2C09tJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynEcdJvgLB6f+gSEi19pRO855t1+oeBsZCyTP/RxpeBynVULbD
	azDPSGdrMpXcaoLvFkCtYCSkJjUvCTZ+i2CCi/U4SA8buyOYUoiqydNN
X-Gm-Gg: ASbGncv1LBzAjmywDtkIYbKkEGnDBoT7Yi4HSNkntiFHQ7dURh8j//VS2Bx8O2nHo/F
	3CYyIdp0+nbak296htpmSVbJQW3ClbD0B7K+v/CYasZU34coj4LNYc4RPp3qhFbAuvEfFBBwoQS
	IV3zmXvzYQxvD40aFgHq6gX0T0RSAireLBEBviPYaJCGV0Gf9th6m4Ynh0F7Kbn2wdk5yF1MPU6
	6F1wlUq50OybvMLW0zjTDD+nqc4xbCUWR7Pb/HYj0PCu2AP9xJROZoA0wMXgD4SLZt2zc+l8qyG
	eGtYO8+Wly92rW0FOp8KtXfon6hQbl9x2ajeF91EGh90WKqZLLbhC4xaRAlGl81GHLsfA8tFjhx
	Nuf9VFXQf/fQzXdyfKkHt/dOTGfcZlJMmmmdZBqWj+rNOGw9FBBrxM5pooUtH5WJr98iP31q2
X-Google-Smtp-Source: AGHT+IHyRdZCFKENEK5U2sVSqsYLQGnrThog0TUtBDXhz5Rjdgg8+4ZbO+vQpnHhnn4XFJ14+JpZIQ==
X-Received: by 2002:a05:622a:1817:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4eb943824a5mr76637061cf.51.1761409997366;
        Sat, 25 Oct 2025 09:33:17 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37b96d0sm15170181cf.6.2025.10.25.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:16 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-mmc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
Date: Sat, 25 Oct 2025 12:32:53 -0400
Message-ID: <20251025163305.306787-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently added FIELD_PREP_WM16() in a few places uses GENMASK. It's
confusing and may mislead readers. Switch to BITS() or FIRST_BITS()
as appropriate.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.h             | 2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c         | 4 ++--
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h | 4 ++--
 drivers/mmc/host/dw_mmc-rockchip.c                   | 4 ++--
 drivers/soc/rockchip/grf.c                           | 4 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.h                | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
index 2d92447d819b..e79e6031be59 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -115,7 +115,7 @@
 #define   PX30_LVDS_INVERT_DCLK(val)		FIELD_PREP_WM16(BIT(5), (val))
 
 #define PX30_LVDS_GRF_PD_VO_CON1		0x438
-#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
+#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(BITS(13, 14), (val))
 #define   PX30_LVDS_MODE_EN(val)		FIELD_PREP_WM16(BIT(12), (val))
 #define   PX30_LVDS_MSBSEL(val)			FIELD_PREP_WM16(BIT(11), (val))
 #define   PX30_LVDS_P2S_EN(val)			FIELD_PREP_WM16(BIT(6), (val))
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 38c49030c7ab..438fea5f6f6d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1698,7 +1698,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 		val = rk3588_get_hdmi_pol(polflags);
 		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(1), 1));
 		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
-			     FIELD_PREP_WM16(GENMASK(6, 5), val));
+			     FIELD_PREP_WM16(BITS(5, 6), val));
 		break;
 	case ROCKCHIP_VOP2_EP_HDMI1:
 		div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
@@ -1711,7 +1711,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 		val = rk3588_get_hdmi_pol(polflags);
 		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(4), 1));
 		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
-			     FIELD_PREP_WM16(GENMASK(8, 7), val));
+			     FIELD_PREP_WM16(BITS(7, 8), val));
 		break;
 	case ROCKCHIP_VOP2_EP_EDP0:
 		div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
index b13f58e31944..14df3f53ff8f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -12,8 +12,8 @@
 #include <linux/bitops.h>
 #include <linux/hw_bitfield.h>
 
-#define UPDATE(x, h, l)		FIELD_PREP(GENMASK((h), (l)), (x))
-#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(GENMASK((h), (l)), (v))
+#define UPDATE(x, h, l)		FIELD_PREP(BITS((l), (h)), (x))
+#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(BITS((l), (h)), (v))
 
 /* SYS_GRF */
 #define SYS_GRF_SOC_CON1			0x0304
diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
index 82dd906bb002..7fac1a7281bf 100644
--- a/drivers/mmc/host/dw_mmc-rockchip.c
+++ b/drivers/mmc/host/dw_mmc-rockchip.c
@@ -148,10 +148,10 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
 
 	if (sample)
 		mci_writel(host, TIMING_CON1,
-			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
+			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
 	else
 		mci_writel(host, TIMING_CON0,
-			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
+			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
 
 	dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
 		sample ? "sample" : "drv", degrees, delay_num,
diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 344870da7675..89fd4a4c69eb 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -125,8 +125,8 @@ static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
 #define RK3576_SYSGRF_SOC_CON1		0x0004
 
 static const struct rockchip_grf_value rk3576_defaults_sys_grf[] __initconst = {
-	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(7, 6), 3) },
-	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(9, 8), 3) },
+	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(6, 7), 3) },
+	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(8, 9), 3) },
 };
 
 static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.h b/sound/soc/rockchip/rockchip_i2s_tdm.h
index 0171e05ee886..eee6db372ee7 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.h
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.h
@@ -287,7 +287,7 @@ enum {
 #define I2S_TDM_RXCR	(0x0034)
 #define I2S_CLKDIV	(0x0038)
 
-#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(GENMASK((h), (l)), (v)))
+#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(BITS((l), (h)), (v)))
 
 /* PX30 GRF CONFIGS */
 #define PX30_I2S0_CLK_IN_SRC_FROM_TX		HIWORD_UPDATE(1, 13, 12)
-- 
2.43.0

