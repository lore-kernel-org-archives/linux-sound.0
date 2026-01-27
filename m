Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2763612F1;
	Tue, 27 Jan 2026 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530137; cv=none; b=HaZ9FyrS/jCytBZAsyYbl9iftjaJaA/ijdeWjLkk0aN5UBJKgAM8+hwQ3EDne1vREpGtGPz8IrypKUoLwJ+kKmuG/qIa9kjhuBgUG8QyuczUCLcj+DbB0etbLyqO15sK2QGBIDqACVOEKSmUr09jvTfQVaC5tYqW4upSYm669gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530137; c=relaxed/simple;
	bh=3VtSJnQCY8pYYz10u2rtmjcw3+lGch8r14/sd2oeLoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXMvioD85GTzrOtPxQQFJd03mafQV+9yY1rd9kGi9P2e7lM2pN3NXLDPVFfxQK77g4gOg4tb02gZS8Zl3nU2ygFItnR+5ew2K7H8fA+DUi6JtA4Q2uNTpCHWr6Qdpi4ybLJm6qamHSic96XJXZc4K+Tdhs+WuKNIDa/n8fkquFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AMZcF7Db; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AMZcF7Db"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530130;
	bh=3VtSJnQCY8pYYz10u2rtmjcw3+lGch8r14/sd2oeLoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AMZcF7Db4+ei90X1Ypt3yaTX6Wp8Q1PvEvZQDOJOwZn1v7kCj/myDmcfugpz48o/0
	 PFsNQdCQevfjVw+/gbnpyPMhZ4NIMBM2xelVu1jwdRVwrPwmyqQElKtcjXo9VRivWt
	 jl16KB19+zvAWaVoaU8TMG1jJF4jbNm02JE5HHqZupDgKcQQFN+2a3JpTUrBaGGACh
	 iffa+meMXSMtTsBE0YT/kse46Zxe860Gjbr3+7GajsdTBQlqqpCqaHXnJReCqxaeB8
	 QyAXM9FwGvyl4PDH//tvxysTOyhtYzVsvJXJiS1h8EKqUZ9JPSiZMfNMRRw7Y60sNH
	 matsdC6tYzLxA==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DB1917E15C1;
	Tue, 27 Jan 2026 17:08:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3E31D480067; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:29 +0100
Subject: [PATCH 09/10] ASoC: rockchip: spdif: Fill IEC958 CS info per
 params
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-9-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7ODBVlljcUJVeN1AM0slvyR3nttNW9uIUEky/t7o4ww=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xE5aRuIiinMFkY7vij1peupa2RoP78o3
 Z2B695qMsqp04kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMRAAoJENju1/PI
 O/qaQUIP/3fFK3B0NjYUQpmxp3knRgQiGQPi/fd8eQC6Xd4wxKKQZ1SgEq3KLryeRpN7hOlIbxq
 /+DsloFnmsC9Zew5CXmwkvuYvRaPYabsxDNe4B2E7glrwj0T5EZxZBnKPK4dQNEDVvQTJ0Iu0OE
 4JTGGHuAnIJLyzsZrnkxIjQ6nUNluOTFhua8HsYSz0RUQUaP13XibmGLzhURuiIf6GAJBaRwKLs
 kfzMAiREk+ZIzjmOE8w3IUqwRKI14vUkQu4yW9c8wVvBryUfMoEzWIgOiPksBZaqTfDKReOVAby
 yVxX8VLkHKmo7B8/KMUHElLXQ3Qx7dBrHoXvKoafj0flj5fDjXto+8Acc+Vv8YFY8JSaALMPMvq
 Q/zlc+Uo4aL2OxkHqTTDHkPBxncPubYqfuB/fEn/jxJ0o2i647EoeU8/+rc3wGcZMhGsBWRRzGW
 6j/KzTJVcS+1MEJRKrcR8qujngTOG0EwfbbOBGNBB8tGxFCFTMJlVqWk4WcQwYn22Alh1eXTrKM
 rxrAWVyXpxl+xluJiZPd5tZ1t5WE7x9PWVP9rEjxQL39IuYdqlK7pp40P9Za5RUgqKG7Kyrh9dV
 ABOrKQUfdAnEQk1d1HUtVCltxsZX5h0mwgchwKu6Z1HlH9A58y0fJy7Gj1PvwV4D2KdMTTDULzR
 LCcSiGzHIpKWLvZcexCoeQw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Add support to fill IEC958 channel status information.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/Kconfig          |  1 +
 sound/soc/rockchip/rockchip_spdif.c | 45 +++++++++++++++++++++++++++++++++----
 sound/soc/rockchip/rockchip_spdif.h |  8 +++++++
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index bd210fafe9fe..391ce2225fde 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -41,6 +41,7 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
+	select SND_PCM_IEC958
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF driver for
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 5e9504220a1e..2c804d25c547 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <sound/pcm_params.h>
+#include <sound/pcm_iec958.h>
 #include <sound/dmaengine_pcm.h>
 
 #include "rockchip_spdif.h"
@@ -27,7 +28,25 @@ enum rk_spdif_type {
 	RK_SPDIF_RK3366,
 };
 
-#define RK3288_GRF_SOC_CON2 0x24c
+/*
+ *      |  7  |  6  |  5  |  4  |  3  |  2  |  1  |  0  |
+ * CS0: |   Mode    |        d        |  c  |  b  |  a  |
+ * CS1: |               Category Code                   |
+ * CS2: |    Channel Number     |     Source Number     |
+ * CS3: |    Clock Accuracy     |     Sample Freq       |
+ * CS4: |    Ori Sample Freq    |     Word Length       |
+ * CS5: |                                   |   CGMS-A  |
+ * CS6~CS23: Reserved
+ *
+ * a: use of channel status block
+ * b: linear PCM identification: 0 for lpcm, 1 for nlpcm
+ * c: copyright information
+ * d: additional format information
+ */
+#define CS_BYTE			6
+#define CS_FRAME(c)		((c) << 16 | (c))
+
+#define RK3288_GRF_SOC_CON2	0x24c
 
 struct rk_spdif_dev {
 	struct device *dev;
@@ -88,8 +107,20 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
 	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
 	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
-	int bmc, div;
-	int ret;
+	int bmc, div, ret, i;
+	u16 *fc;
+	u8 cs[CS_BYTE];
+
+	ret = snd_pcm_create_iec958_consumer_hw_params(params, cs, sizeof(cs));
+	if (ret < 0)
+		return ret;
+
+	fc = (u16 *)cs;
+	for (i = 0; i < CS_BYTE / 2; i++)
+		regmap_write(spdif->regmap, SPDIF_CHNSRn(i), CS_FRAME(fc[i]));
+
+	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CSE_MASK,
+			   SPDIF_CFGR_CSE_EN);
 
 	/* bmc = 128fs */
 	bmc = 128 * params_rate(params);
@@ -239,6 +270,9 @@ static bool rk_spdif_wr_reg(struct device *dev, unsigned int reg)
 	case SPDIF_INTCR:
 	case SPDIF_XFER:
 	case SPDIF_SMPDR:
+	case SPDIF_VLDFRn(0) ... SPDIF_VLDFRn(11):
+	case SPDIF_USRDRn(0) ... SPDIF_USRDRn(11):
+	case SPDIF_CHNSRn(0) ... SPDIF_CHNSRn(11):
 		return true;
 	default:
 		return false;
@@ -254,6 +288,9 @@ static bool rk_spdif_rd_reg(struct device *dev, unsigned int reg)
 	case SPDIF_INTSR:
 	case SPDIF_XFER:
 	case SPDIF_SMPDR:
+	case SPDIF_VLDFRn(0) ... SPDIF_VLDFRn(11):
+	case SPDIF_USRDRn(0) ... SPDIF_USRDRn(11):
+	case SPDIF_CHNSRn(0) ... SPDIF_CHNSRn(11):
 		return true;
 	default:
 		return false;
@@ -276,7 +313,7 @@ static const struct regmap_config rk_spdif_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = SPDIF_SMPDR,
+	.max_register = SPDIF_VERSION,
 	.writeable_reg = rk_spdif_wr_reg,
 	.readable_reg = rk_spdif_rd_reg,
 	.volatile_reg = rk_spdif_volatile_reg,
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index acf64986a2e0..b837b1f8d57f 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -21,6 +21,10 @@
 #define SPDIF_CFGR_CLR_EN		BIT(7)
 #define SPDIF_CFGR_CLR_DIS		0
 
+#define SPDIF_CFGR_CSE_MASK		BIT(6)
+#define SPDIF_CFGR_CSE_EN		BIT(6)
+#define SPDIF_CFGR_CSE_DIS		0
+
 #define SPDIF_CFGR_ADJ_MASK		BIT(3)
 #define SPDIF_CFGR_ADJ_LEFT_J		BIT(3)
 #define SPDIF_CFGR_ADJ_RIGHT_J		0
@@ -64,5 +68,9 @@
 #define SPDIF_INTSR	(0x0010)
 #define SPDIF_XFER	(0x0018)
 #define SPDIF_SMPDR	(0x0020)
+#define SPDIF_VLDFRn(x)	(0x0060 + (x) * 4)
+#define SPDIF_USRDRn(x)	(0x0090 + (x) * 4)
+#define SPDIF_CHNSRn(x)	(0x00c0 + (x) * 4)
+#define SPDIF_VERSION	(0x01c0)
 
 #endif /* _ROCKCHIP_SPDIF_H */

-- 
2.51.0

