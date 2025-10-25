Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A826311C01
	for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410455; cv=none; b=jURR1+7ZfscJ1Mp6ZSpvYYG7fnCFOeVfS9iWykktmhY6v639R/perUjNwdIT0jpt2tSxbjU6rVPPyM3xhGzkHs9oApf5+/BZcT924PrtAewi1W+dARMdfsNpERlSvOkA1iksunFiJN2wgm0NP6MI+0nCD49PE43D/H4Npkohnz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410455; c=relaxed/simple;
	bh=iv3iCCSDVeRbyipC1ke5q3yTI1qFQp4/PoyLN2PjHKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsHjJoHPQ7LDJQQ80w/NwSOJHfwip36kfo2c9Zc79uVXtabtk3YoqGWXrZOgE4D+5U7ZXBv2XRFXmGsP88XwUMYc+phCVEkA8cMu3gcn7FU+rvzsEmGoqb8JjyDX4tTeTe1cedny1eZxyuthHTAL0Q+MSn4LDCgXbdLhMg3Djmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CH5Pt97D; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CH5Pt97D"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-87c11268b97so33359826d6.3
        for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410452; x=1762015252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=;
        b=CH5Pt97DrMy2adK69ctT5bhrxVunqRAx0H+/jUSxxs0fBx9mXoxCN+96EnjVPD78Dj
         JX/gpwFnMB7lEXqbIDA9nBFJ4gKX810Oo0mpidTm+41TLfVhK/Ll+X2r9G5t6mDNjpNK
         SJWbZy+7wPvojWR9OGaCq3Hkw5avHHe0s7ig8hhBWR3ykmS+kWFktI+Sboa2cc1aim3O
         NATH6Canhs0gTSJLSwAUZU/orkyOVDGhCHrukY4UmxtqkxcxlN1QBbDbmO54GJvJdYvn
         tdy2Lk9A8BEW/y7tEaLkHKogkn0+c78bvtgMJmThPgkRKOvw8d2AEy+IZl2gMxnBTrWU
         fbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410452; x=1762015252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=;
        b=fjqjHBGWKoC1y36AwrZ6utnRWWF2VslbwG9j1Dpfvx/SV28KIMKWJ4A//83TnHu3aU
         4QmkhDGWvtHKs+NDIfOwRAoT2MWxOJkMGq7qZCWN9yAvBIpbHf+GErGFXPNLpaZb109C
         IR8Ijbq4teVxNC6Z954wqBz2G7u88ravvmRfymhZ0sCeUDK9kGsazWyF+VzYArlWQrj1
         lPCMHzBx59sFVYzjIcA5jEDqeI2hPuFWuhdMSRxJkSZf6bFHFpuVJJQzO4m5maYbi6KF
         C4sVuF3Oe1v7KKuhcKIPuTAdOHPlo3lgNsMhc6ncJWvWruw417BYDO3fhTnfYVMB6Lqn
         x4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU4T8ewuHOF5j6lggF82vt4FoHIcSTih1OdYgUlXMwk7/dhLZo4xFh5Pz9hMNO/ENkXh535dzNUb7a5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0uyLU0hAvHHtvhwTCtQN6H2CClNKVDGzDDHrb6OVu/sDq7ZJ
	jArEeYHBqjq7jKGOXlv8EwP7W1325gQK9ybV1s0Qlzpph/oBhmELq8f5
X-Gm-Gg: ASbGncsZBYNoaDcQg2hePtbYuOAW3E9XCxrdGKtvVTpkhKztBTOo9INiC5gedcNJO7s
	0xRARAeUzC4Dj+xVFOKaAI9DSG/L4ENW/nAer2P6NCSBqkHcesi718Y45p8EOIq7rgpsdNhgCRc
	hw/awMoN+wFJ/arTfMjq5nyLepw6WIVsoalQSW0V3dxI0QtuFQ3Nsn3z40EjVmBkmKNZPIgZn0b
	jITrrXTniNgU/Y9yvr8rs41ABDZw7mCqGpWnXMJNi98BDOkVtOiRJggx9z1AKJCH2UTD3UUIx4G
	EWhq+5lpQddvRdBzMJprCQf6ITss+VPzTHkEZB5ICDYUKV3vZ0T0PxJFopB8BV/5bhGuFP0Vhdw
	l7bmWYUhUIhm4yGwAVnaUinO8aJnwuLnAHvhYFyuMt6MKOWe7csZjJtliDT/8EYNAivac9JOEAX
	BWPjEva14=
X-Google-Smtp-Source: AGHT+IHlyjol8Bie8F99hAjP80rz8ZMg2F2ufGY62yGvqxUFdDm1aK3+hSTgiT9hRW2DHU1QiGn1gA==
X-Received: by 2002:ad4:5aae:0:b0:787:8e43:5761 with SMTP id 6a1803df08f44-87fb6473b5fmr66116636d6.56.1761410451896;
        Sat, 25 Oct 2025 09:40:51 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49b98b0sm16464616d6.54.2025.10.25.09.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:51 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-mmc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
Date: Sat, 25 Oct 2025 12:40:10 -0400
Message-ID: <20251025164023.308884-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
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

