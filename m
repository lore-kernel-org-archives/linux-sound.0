Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99136075D;
	Tue, 27 Jan 2026 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530136; cv=none; b=MU4LU051uRlAF8lxez6koeta4YbwduLGWzlsAt9spjSjt6eSfhAy3tMgUPSnll7MFNpluy47Mwq/j+Sd4PyWMUlbTV5tH1Ye/KdJDX/5fJO1pim35m4auo3ldJB6DB0mc5mSq3hJiRWjC6eOCk1m+OCVJDWSAfx8g4ekxBeagBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530136; c=relaxed/simple;
	bh=No+BNRoccsHf+NUA8GkCc9/TqVGutQZy/sMq+w/CZQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWrO5I/yExk4gklXLU+er+9aWkFFlgPyTvBXqqQB6Pkhu/bVwygdCypRLtyAlMGHqy+6lLDL4GFWUAnvQM6MYU1kRMa4d07JorMXGN0oxScenktsnI5Cxjr5Wo7Z5K5V0CPq7v/CdW3yRPcRWAlhGaWwo+JrDrWF5rJYQe3X89w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YnjN0joQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YnjN0joQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530130;
	bh=No+BNRoccsHf+NUA8GkCc9/TqVGutQZy/sMq+w/CZQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YnjN0joQp5Te2kW0fRX3E1yejb2/Jm2aJiU6hZ6dg9Wvx0hVu+cP9MUEUMxt5FgEh
	 ZKVXUEyLbVSICmAXcsOgvR4bHtC9icPcazBYZuYM4Aex7mL5AbmVhp4G2sWbfs9mQ0
	 XoNcNWWrDeOrNyZdRaVKDH7bimCAgKv5GJ/Hv1scotCgyOSyQDnONOS/RMugs1vIaS
	 +eB6uKgOMvM9pwred0Kam0xO6riLusH+CCSPmWiiDbA5rU9pJkH9+d5yy9nejM1Gp6
	 ptnIy8v08NTcgBQ/BPxgEsbdhr8Mda75rzigwcHYQLBunq01asvXAOJZUWRMn6vDqd
	 jLcpdOI6LihFg==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 03B3717E1543;
	Tue, 27 Jan 2026 17:08:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3CC3B480066; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:28 +0100
Subject: [PATCH 08/10] ASoC: rockchip: spdif: Add support for format S32_LE
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-8-a7c547072bbb@collabora.com>
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
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ioPETteiBdv5BnyEvaF4eaVsZWupHXbFC60Wx7hFpEE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xGS8LOF1xOkuIWQ+M/xPTBCFex19N5CF
 kioY6tXaCjckokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMRAAoJENju1/PI
 O/qa9ggQAJj24jtc72bB+skrp5GUfggHW/4PRPyhLGRv4vUSDzAe+wF9bPA5VJxZPLzzf1kXKyY
 12/7QiHMZDhi9s8MhSypMgr1kX1enCn+tGLdbvj38A0MOft6etoUB7pGf9urkUCI5MquQxtjkaX
 xE+W9mU71FL4qdsJMkKCBSsLTjW8TMbMCLtGA6UUJ2cL0tBXdOMkP+4JXX3OF9GGmUVyd/KyuDy
 nUUocTO0zG95PGuriO77Xit+is88lRwZC6XwqzOdZJ198c6mw3aph7Dda8OJl/SOId7FtB2iI+j
 gafMZMLKR9Yw6s2afn2wNkrxqYToG+A2NEI6Ft4PLku3kc+NrEWOnuaXbl6nNwZImhZ8DyCfEHU
 kimwpHv3HaIaLE34d3nRQHep1E8fSxQnLuFO8JvtORkrmryPV00J9xEuGl6gyOIL45Uu4llJtP5
 CWJQuqG7d0TPN69Pc+4O1ppPGxzU30ePThPJjmRHWMzU4qJ9UGi+oaV2ZGe9T1NEPFORfu1EOb4
 lKMQY2idy99LJEYtfZvNkmvgP28ktjgMgDirkDQWEfuRb1SiPsa7RHT92x3yW51ILFgqwK3F571
 W37sf81QV4DiCzN5qK91x9fn267xUwpnmxfxw7Jy1fooFcOL1bb6JluH5YZRiP1d5WJQ2VfLCfJ
 36DCfpCX5qyeXuz/IJGQ3Fg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Treat 32 bit sample width as if it was 24 bits using only the
24 most significant bits.

Co-developed-by: Zohn Ni <zohn.ni@rock-chips.com>
Signed-off-by: Zohn Ni <zohn.ni@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
[I've merged the channel-swapping fix from Zohn Ni into Sugar Zhang's
patch introducing the problem in the first place]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 22 ++++++++++++++++++++--
 sound/soc/rockchip/rockchip_spdif.h |  8 ++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 8cf54470f931..5e9504220a1e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -99,21 +99,38 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val |= SPDIF_CFGR_VDW_16;
+		val |= SPDIF_CFGR_ADJ_RIGHT_J;
 		break;
 	case SNDRV_PCM_FORMAT_S20_3LE:
 		val |= SPDIF_CFGR_VDW_20;
+		val |= SPDIF_CFGR_ADJ_RIGHT_J;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		val |= SPDIF_CFGR_VDW_24;
+		val |= SPDIF_CFGR_ADJ_RIGHT_J;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val |= SPDIF_CFGR_VDW_24;
+		val |= SPDIF_CFGR_ADJ_LEFT_J;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/*
+	 * clear MCLK domain logic before setting Fmclk and Fsdo to ensure
+	 * that switching between S16_LE and S32_LE audio does not result
+	 * in accidential channels swap.
+	 */
+	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CLR_MASK,
+			   SPDIF_CFGR_CLR_EN);
+	udelay(1);
+
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
 				 SPDIF_CFGR_HALFWORD_ENABLE |
-				 SDPIF_CFGR_VDW_MASK, val);
+				 SDPIF_CFGR_VDW_MASK |
+				 SPDIF_CFGR_ADJ_MASK, val);
 
 	return ret;
 }
@@ -203,7 +220,8 @@ static struct snd_soc_dai_driver rk_spdif_dai = {
 		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = (SNDRV_PCM_FMTBIT_S16_LE |
 			    SNDRV_PCM_FMTBIT_S20_3LE |
-			    SNDRV_PCM_FMTBIT_S24_LE),
+			    SNDRV_PCM_FMTBIT_S24_LE |
+			    SNDRV_PCM_FMTBIT_S32_LE),
 	},
 	.ops = &rk_spdif_dai_ops,
 };
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index fcc28b6c4f58..acf64986a2e0 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -17,6 +17,14 @@
 #define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
 #define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
 
+#define SPDIF_CFGR_CLR_MASK		BIT(7)
+#define SPDIF_CFGR_CLR_EN		BIT(7)
+#define SPDIF_CFGR_CLR_DIS		0
+
+#define SPDIF_CFGR_ADJ_MASK		BIT(3)
+#define SPDIF_CFGR_ADJ_LEFT_J		BIT(3)
+#define SPDIF_CFGR_ADJ_RIGHT_J		0
+
 #define SPDIF_CFGR_HALFWORD_SHIFT	2
 #define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)
 #define SPDIF_CFGR_HALFWORD_ENABLE	(1 << SPDIF_CFGR_HALFWORD_SHIFT)

-- 
2.51.0

