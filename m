Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCF53612E7;
	Tue, 27 Jan 2026 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530136; cv=none; b=Ng6uv1zJCNKOFaWisiaFVIY3KUlh133Kv6tiB0JL8a7YRsbmP7H1B6Ze4pRqdZf7Jfy3U6npMR52nEk6V7DtNs4OTbhuV8coiBDru3EXfZOUECieqkwJZig7IXU4CZ9tVo6PF3KsppWTNaHbRvgOPUaglhmW9wuGYumNWgmB3hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530136; c=relaxed/simple;
	bh=24zrfV+l62Jtv7PtKy08Y2/hOj8Lfc/0IFp2rDE01pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYqF+dtFu8viPmDjWYv5xiuoUA2Sc5O7L8KN/jSzPmCO75SPJG09tlTfJ9MNU6kpsmsU9pSrGm8Gi4m1ZObQXKiWgj/0XcKBPWAvjkGG+rreFs5EsnqgzhifcxOyfSw+dWXIm2dcIvYWtWRLdfhUpBD7D4v6HujE5g8lFuHa5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AIMpQFqy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AIMpQFqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530130;
	bh=24zrfV+l62Jtv7PtKy08Y2/hOj8Lfc/0IFp2rDE01pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AIMpQFqy1A9CphbiCEHWJJ5CW7NX/U+hqS6QDO81sGxuL/VI7sMWAMwxw94VaMeff
	 Tx+MdNwpwKxtZzNIS627NzwbNcjWFwVp9QDM4C05cq1+tj9q99YPsm9FkBM5NeG4PD
	 /fc9Lr12JrYRezxG0uPLwSQ3LwvvACC67bxu4n4hZauJnYj0OXy7RfmdGWEhTK09RI
	 jM3FZvOGfv6kejiqtvlwNezEscGpUQ8HjPns/Fle2134WF9XZEeQLfLQuCiBvkRkx+
	 meCVEjegbv2xaxAMFAEk8yxnXUGoFnZXklDELzWqGXQ57F0PSatql3ef0/INjzIg/N
	 1I1JzJyjheaTw==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 079F617E157E;
	Tue, 27 Jan 2026 17:08:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3F913480068; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:30 +0100
Subject: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6017;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=24zrfV+l62Jtv7PtKy08Y2/hOj8Lfc/0IFp2rDE01pk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xHe4fXHIaWZfyita0882SHV00TAzl1yz
 ZUBWRxqtSVRyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMRAAoJENju1/PI
 O/qagy8P/iGctAuuYrXQgiNUyfLVFmTpnlfbt6UstF5KNgxMLJWoDKOKZmRcW6e3AVu2bEHPClZ
 wZ5oGVEbLOGKOjPE6Ua7mNuutkkXvZ1/pVxmHfI3b6i53nW9RzajDDSvKHokV0fbV69jbiHBkdX
 k/tEmCdisuTxW7C5e6KvGkUDk74GcGKiQYQU6VBY+nzeAgZ6/YWGNhmHm36BhA1stAhX3awW0Qf
 jo8leI8eu++oRLz0zHudqf4AuOgNqoaVLG1TIMgiGQlH0JMTfsUANu3temTx8MDlog/eNKO5h2s
 6Rgfckjv6Ax+IYTqqVk45z7oHptuUWcsxI0tQpe5E6AruuJksqPCkEnPfXEp7wMna2QposllLIb
 zfVgQ6XkKmwgSn2Ea0XzC47ciI8DO6hcVY6IqBGrzZ645AmYRGqM/Sutt6mxZqrtHlMHQU8yrRD
 xISfyBvb6cDgLaqbmIMptvUf1Hjn2HwWezv1Cs+WHshEk5sJoHX6qKxmkOjRair+Y3Z4+4qlGnt
 fLkCC+PkFCZTor2h51r4USUdaDRLqZ8VVWHIdvoe/e5aAjjMyjCnKwn4n0X1FYAbTRrFwBnT8wH
 ee0sfTRMOdZrpBb5nPlDf9fu3froSqcjZZ7al7nDFCoc2wCzBiO5O1V/5aEgVlunI8WaKTQNZmN
 DdFMB0PcnxdsRYw1YbdMn+Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Convert the driver to use FIELD_PREP to increase readability.
This also fixes an issue that the SDPIF_CFGR_VDW_MASK was wrong,
which didn't have any effects as the only user in the driver
updates the other bits at the same time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 12 ++++-----
 sound/soc/rockchip/rockchip_spdif.h | 53 +++++++++++++++++--------------------
 2 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 2c804d25c547..d0b9967cfe4d 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -5,7 +5,7 @@
  *
  * Copyright (c) 2014 Rockchip Electronics Co. Ltd.
  * Author: Jianqun <jay.xu@rock-chips.com>
- * Copyright (c) 2015 Collabora Ltd.
+ * Copyright (c) 2015-2026 Collabora Ltd.
  * Author: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
  */
 
@@ -159,7 +159,7 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
-				 SPDIF_CFGR_HALFWORD_ENABLE |
+				 SPDIF_CFGR_HALFWORD_MASK |
 				 SDPIF_CFGR_VDW_MASK |
 				 SPDIF_CFGR_ADJ_MASK, val);
 
@@ -177,7 +177,7 @@ static int rk_spdif_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = regmap_update_bits(spdif->regmap, SPDIF_DMACR,
-					 SPDIF_DMACR_TDE_ENABLE |
+					 SPDIF_DMACR_TDE_MASK |
 					 SPDIF_DMACR_TDL_MASK,
 					 SPDIF_DMACR_TDE_ENABLE |
 					 SPDIF_DMACR_TDL(16));
@@ -186,21 +186,21 @@ static int rk_spdif_trigger(struct snd_pcm_substream *substream,
 			return ret;
 
 		ret = regmap_update_bits(spdif->regmap, SPDIF_XFER,
-					 SPDIF_XFER_TXS_START,
+					 SPDIF_XFER_TXS_MASK,
 					 SPDIF_XFER_TXS_START);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		ret = regmap_update_bits(spdif->regmap, SPDIF_DMACR,
-					 SPDIF_DMACR_TDE_ENABLE,
+					 SPDIF_DMACR_TDE_MASK,
 					 SPDIF_DMACR_TDE_DISABLE);
 
 		if (ret != 0)
 			return ret;
 
 		ret = regmap_update_bits(spdif->regmap, SPDIF_XFER,
-					 SPDIF_XFER_TXS_START,
+					 SPDIF_XFER_TXS_MASK,
 					 SPDIF_XFER_TXS_STOP);
 		break;
 	default:
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index b837b1f8d57f..ec33295e2512 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -2,7 +2,7 @@
 /*
  * ALSA SoC Audio Layer - Rockchip SPDIF transceiver driver
  *
- * Copyright (c) 2015 Collabora Ltd.
+ * Copyright (c) 2015-2026 Collabora Ltd.
  * Author: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
  */
 
@@ -13,53 +13,50 @@
  * CFGR
  * transfer configuration register
 */
-#define SPDIF_CFGR_CLK_DIV_SHIFT	(16)
-#define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
-#define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
+#define SPDIF_CFGR_CLK_DIV_MASK		GENMASK(23, 16)
+#define SPDIF_CFGR_CLK_DIV(x)		FIELD_PREP(SPDIF_CFGR_CLK_DIV_MASK, x-1)
 
 #define SPDIF_CFGR_CLR_MASK		BIT(7)
-#define SPDIF_CFGR_CLR_EN		BIT(7)
-#define SPDIF_CFGR_CLR_DIS		0
+#define SPDIF_CFGR_CLR_EN		FIELD_PREP(SPDIF_CFGR_CLR_MASK, 1)
+#define SPDIF_CFGR_CLR_DIS		FIELD_PREP(SPDIF_CFGR_CLR_MASK, 0)
 
 #define SPDIF_CFGR_CSE_MASK		BIT(6)
-#define SPDIF_CFGR_CSE_EN		BIT(6)
-#define SPDIF_CFGR_CSE_DIS		0
+#define SPDIF_CFGR_CSE_EN		FIELD_PREP(SPDIF_CFGR_CSE_MASK, 1)
+#define SPDIF_CFGR_CSE_DIS		FIELD_PREP(SPDIF_CFGR_CSE_MASK, 0)
 
 #define SPDIF_CFGR_ADJ_MASK		BIT(3)
-#define SPDIF_CFGR_ADJ_LEFT_J		BIT(3)
-#define SPDIF_CFGR_ADJ_RIGHT_J		0
+#define SPDIF_CFGR_ADJ_LEFT_J		FIELD_PREP(SPDIF_CFGR_ADJ_MASK, 1)
+#define SPDIF_CFGR_ADJ_RIGHT_J		FIELD_PREP(SPDIF_CFGR_ADJ_MASK, 0)
 
-#define SPDIF_CFGR_HALFWORD_SHIFT	2
-#define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)
-#define SPDIF_CFGR_HALFWORD_ENABLE	(1 << SPDIF_CFGR_HALFWORD_SHIFT)
+#define SPDIF_CFGR_HALFWORD_MASK	BIT(2)
+#define SPDIF_CFGR_HALFWORD_DISABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 0)
+#define SPDIF_CFGR_HALFWORD_ENABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
 
-#define SPDIF_CFGR_VDW_SHIFT	0
-#define SPDIF_CFGR_VDW(x)	(x << SPDIF_CFGR_VDW_SHIFT)
-#define SDPIF_CFGR_VDW_MASK	(0xf << SPDIF_CFGR_VDW_SHIFT)
+#define SDPIF_CFGR_VDW_MASK		GENMASK(1, 0)
+#define SPDIF_CFGR_VDW(x)		FIELD_PREP(SDPIF_CFGR_VDW_MASK, x)
 
-#define SPDIF_CFGR_VDW_16	SPDIF_CFGR_VDW(0x0)
-#define SPDIF_CFGR_VDW_20	SPDIF_CFGR_VDW(0x1)
-#define SPDIF_CFGR_VDW_24	SPDIF_CFGR_VDW(0x2)
+#define SPDIF_CFGR_VDW_16		SPDIF_CFGR_VDW(0x0)
+#define SPDIF_CFGR_VDW_20		SPDIF_CFGR_VDW(0x1)
+#define SPDIF_CFGR_VDW_24		SPDIF_CFGR_VDW(0x2)
 
 /*
  * DMACR
  * DMA control register
 */
-#define SPDIF_DMACR_TDE_SHIFT	5
-#define SPDIF_DMACR_TDE_DISABLE	(0 << SPDIF_DMACR_TDE_SHIFT)
-#define SPDIF_DMACR_TDE_ENABLE	(1 << SPDIF_DMACR_TDE_SHIFT)
+#define SPDIF_DMACR_TDE_MASK		BIT(5)
+#define SPDIF_DMACR_TDE_DISABLE		FIELD_PREP(SPDIF_DMACR_TDE_MASK, 0)
+#define SPDIF_DMACR_TDE_ENABLE		FIELD_PREP(SPDIF_DMACR_TDE_MASK, 1)
 
-#define SPDIF_DMACR_TDL_SHIFT	0
-#define SPDIF_DMACR_TDL(x)	((x) << SPDIF_DMACR_TDL_SHIFT)
-#define SPDIF_DMACR_TDL_MASK	(0x1f << SPDIF_DMACR_TDL_SHIFT)
+#define SPDIF_DMACR_TDL_MASK		GENMASK(4, 0)
+#define SPDIF_DMACR_TDL(x)		FIELD_PREP(SPDIF_DMACR_TDL_MASK, x)
 
 /*
  * XFER
  * Transfer control register
 */
-#define SPDIF_XFER_TXS_SHIFT	0
-#define SPDIF_XFER_TXS_STOP	(0 << SPDIF_XFER_TXS_SHIFT)
-#define SPDIF_XFER_TXS_START	(1 << SPDIF_XFER_TXS_SHIFT)
+#define SPDIF_XFER_TXS_MASK		BIT(0)
+#define SPDIF_XFER_TXS_STOP		FIELD_PREP(SPDIF_XFER_TXS_MASK, 0)
+#define SPDIF_XFER_TXS_START		FIELD_PREP(SPDIF_XFER_TXS_MASK, 1)
 
 #define SPDIF_CFGR	(0x0000)
 #define SPDIF_SDBLR	(0x0004)

-- 
2.51.0

