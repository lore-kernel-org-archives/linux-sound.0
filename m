Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC33C553F
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311818; cv=none; b=ee2/M0F6OrNbP+ZeKgDYPFso/qozeOmZBLC9nUNOV+rYj0Rl+ImugQnc5yKiv9kX3fd03G7EdAYVZ/955nxbZUePheJucSPhBKhyOpoCYce76UbF6wccMsI4jH7F1IVp6NJV+TUgRKXn2ipKO/W0SVv2Un9i/RyzavmWKT+fmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311818; c=relaxed/simple;
	bh=75Pi527tpe9avIX9uIyazGSmLusLOPieiQVrl5PsM34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYTm8ZCN+D7MmdpnhNQ2I5yURdrT3+2YnlCq4u3gIv566S8kiJRtHHoO+IUlnx1tTEyrp/rh8AJwPePEw4dAFPvpljZqix3oTYhJtoo3uqBTpBTk82iAxff985v2GPTijdbq2tArPRH+6EZNgJH1/3QSmnC9ei6+SgPU4cg7kJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFXI5HNS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFXI5HNS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso431339a91.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311816; x=1790916616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=TFXI5HNS27m+sLCVRCW+yiRNtiAtzdeYvmIL63uRnzvIyuDcgHA/uwDrZ1JoU25WRs
         xDi6kkFyNtCra8idpZfggJQgcAbvK5kAICTIa5xMZE+aU2GXbvgwitrkfjyUASJTgcbg
         U/TXHd/u2hutpVUpeS7fWY7YA7raG/LAYNeVVA36RCk4huY9eSjbK3x/Iv4C3OA10J/o
         UZ58dgSzuFeXD9jmX/LYpFnZIi+a25pVXA/hDZztG/1R1lVXgXPjKfLz+KdLr8w2sUFF
         PyTtsVa0M/4OXoDCB9CF/xmmc8Fh0nWAV41XJYfWfji5AFomfUjrmaQyOp96pVHf7igv
         hPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311816; x=1790916616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=RplJgYyYZcpLn3XZjL2GUkYBeglBq0BOllcwEg+2NOqFKkeJIz3CNXM81rFuHIxnqi
         3/RkvUNQMb/oSVNtYeyLtQP9pbBmxBECsMNgLhAHAeKzkRAItXlD8UbSQ59hogd/pAek
         sfTjylhuUO2KoQSUiKz7KBmTubWp0K1/72bge99oqD7L+qQQloRr38euSLMXqJ/oM8EF
         mPEGWFfN6JY6pThlSHqWWBJWEvEW19sXWfs2x6V3DfcR57/umWQoq9/288M72r/dTuXg
         X+YXv0IUblMByRZ6w5B2tVAFp/ROUQAoi3JwkNIRPq4+39z1StahE5hcO+OGCa/qiXbO
         WRpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPoIoFZJLZ9CICXY2oTdoVZGKpBfRyhHz00tf3X6FesMFVycXiETZ+/H1Aw2YvmmMccFbngqWAkQRpvA==@vger.kernel.org
X-Gm-Message-State: AFuF++naOP5gfx7O0tgAmIlVhxuoQ4NtiwtTfIzMSLfyfEmtuDjXnNTd
	eQFrUH2Q+Gd6xZXveB9CNaeTqNLPgYllv2RmrZZOcwReJJlS0Z4EFAob
X-Gm-Gg: AYBFou2doQtV99Vpb2KMWj8XSt0cDlg9E2z6Xop4bImJJEZUGnLdBVtl/4YyX5tb4pE
	bPgUAkJibV10CLw8Sd7lfRb0M6Z8kYmaXDpZt2Eeixtev+nB1kEwHUq9ppfSAa0vJr6iqaXhsLL
	OeuRjuhokKft+Bz/aIog9wAu9F5xejEfZRhQlrilH+4mCfwJVxguS5XuaHnmHi5iS59+DQbTWJX
	15f5TBrhc0u413DXLl5lT1zv8N0z6a1QKz01jGPYrFpPXFr3RkX6Scr+9EJRnH2EaCELRde6G9D
	rlTN8/8JVKdwCGirk5eSsYs8o6fvNZI3uJ/6CR8YYvKd3STTsjROlBR9VUssUAoYJ0wJ5hJu1or
	SdJ5gq8suWfoZQ1NiG3XGYWIKXsbn8C+ZFoWWgRxA6zrWKti0PDkWaF/rhqw8NzdVvJE/+8N95y
	5o5dThpPxAnqtXGgcBBLSF6ARIXif5MX8P55B4Q1Ru4ZXCwrOILesrP2aKqvjVvPS5c4J+JyMx5
	xUmVhrMVrQrBa49Mb9tg+jsgrLYitrgsQdDe+R5AB1PaZUp5mVIydWtt07xPv5iYrJCW7yzWy67
	AOTB1RYCldcR6w==
X-Received: by 2002:a17:90b:164c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a098df465emr3862695a91.30.1790311816047;
        Thu, 24 Sep 2026 21:50:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Fri, 25 Sep 2026 11:48:59 +0700
Message-ID: <20260925044908.450775-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0

