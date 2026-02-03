Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6070B3D3CF0;
	Tue,  3 Feb 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137201; cv=none; b=XAKOfzE+JEIWmKkXVTg0p3ilND5gctZYPmutI/cvxBMiXbswBwqeDHXkRALrSNZuxIHj/YG1Rb3n7PAYTQ46Ga5GFlCXcLDryTMV+s2PV7cy02uHWYyiENszNj87Q9mMFCMOnM5QSUFE1zTXgJ/fUzc/Hh4+mkVVETxEVw4GBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137201; c=relaxed/simple;
	bh=F8u3Q4lThH6JCSUtdBTKMGgSMOrb+9XbXSLjDkPJv8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4lI81rxe5A3zn1xGGwDdw6l8t9gZVa+FzEwS4cQATiA04yXHwTf07ryePr8Ly5mHhQCyJzt5tunVpHmOgW1SMTFqgO6CeByxaBi9PYGv9tE+1+73hdVzXVGWIVWaoS8Fl7C2a/Qyjyi40CKTvUTLuFiR/RoTK7/FDBvl63/rq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ilHrWHC9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ilHrWHC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=F8u3Q4lThH6JCSUtdBTKMGgSMOrb+9XbXSLjDkPJv8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilHrWHC9U7euwdq8OX8oqGOGIsVckVqm7sUdr2EwqDtqE65aIWnJcdeAIpK+pi+db
	 uKNKLxj4UeaiNhlKG+vNKT4EdlKvoHpfUL+TAyH09LCIc7enJzS0SdPRgXFdon5PCP
	 lDLwYmd093eBglou6rVrDkgURuOGO2HQabtfYE4+xeXDQNrQ3QZCRBZrt3betf+kbW
	 inThm7M8TxEmQH2AZzc5CvhY8pYdGYYX9tbGPinSvoWDXv7ELwc20NrDAhbP/Bgwu7
	 78GFXHYEYQv6PG6x7tV06mg63XwXh2Sj78Wn91EYVYsNX/JGKn3sZslevq8fknK9oR
	 +grpXY0DcJ5nA==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6ACE17E35C8;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1AF9C48002D; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:30 +0100
Subject: [PATCH v2 08/10] ASoC: rockchip: spdif: Add support for format
 S32_LE
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-8-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZTB+C6/WOs0DScK8wBWi6AQ4GJhK0F8kVAr5NV0OuEE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmlbGhY75qLpThU6zhxgGCskk6hGKSzm/
 rWNfuUMJtx8YokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaR7oP/i22QvfRjCUUq7L4qgROnqkFgrCg7aDDLCOE1MeJUrizPORn8KZ0/r0kBtjUQVGQY8V
 I69c9S5wK1KPomh3qcgHY0YNwrIAxuk52VATxcrZNbFbusr7QIV2QMdkDgvinVn3/JN44cmkVZM
 476r2ecTP3eT7+jSS+TFsQYpNOYV8jQEeWbqPAfFaiAKIlh0YYn5ZD1fWoiRxJyw9J7IwJDDgb2
 uAy10gGyN1v78IoxbN0Vk5tb6hMYoMTwDhk2eGXS59ApNeoJEfaradMJESSOkFfCDFe/NQ02XIX
 nktL3XL6x9WabCEwovwApvS99d9OsFVjFdIxFFM8KEll8iWGlzL6la9HAoyhYKDlUc3qlLberDz
 Z/5YW2tG+F25jFmDI6AgMlhTY9hfO10Pnub544QKCsRf9Z4s6xGfywwevIJ72icgxgeYTSXQB29
 /DYhPsrrgQmYQKrUlTzIv2C/UZyHVdJsl2bJSEY6EGbliEJrU0v7Dv3vuArCHJ+OUc45E3DO+vM
 e5bjGkwS69K0ecYE/Pbu5q1UiIp724PI3K8kTS0fkkRVqU1qcgVn+V8VYrXehDeG4irG8NQk+7U
 JZyk5foHVTq/beePJsXr4tigvuckiDKNdoIXZy0gtD/Odc/f1rHv07VkZ0uP8Rsjqo9EFDDMly0
 t17pstr0LoQYyZNg5SlMxEg==
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
index 3b66d97f0582..d06573f22805 100644
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

