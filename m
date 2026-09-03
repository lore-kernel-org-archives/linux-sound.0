Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6813815E1
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411174; cv=none; b=BVGtL/lyBnVpz6uWXc0FizaWQGa/y3NW/TwmHWr6wbtZDZM4MjJL+zMfoz4yoGBvVJF0ZIWLKcBQLoRKdu5A6an4fBJxC9AmmLqJxtLbApx6PPCC1klIzNUsEtCN7qV8ebc0oQ2KJ0w+K3cabVeuxfJ15jenEqXmiXUGGHkM0+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411174; c=relaxed/simple;
	bh=Q7QQT7/BVhDq1O498rAEP2puFeqnHzBBniDPqc+j0VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+4s1Wz5zR3Kf8ouoiTx74XEv6IjBpxcchg8iDKKbMERybAn8h/246dzPjZcJov8IOhJSJcjtG5md1GeJAiCKAd8l/Wt4Bngo/a77gguiIfnwiAwyRG0H2wMBrce2sj1b/RJqH/WBFJVTb/1Q2HZAqiTbqftHUifQOxXJPcQyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpszpUry; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpszpUry"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2264601a91.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 21:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411170; x=1789015970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=fpszpUrym7NqzDbQ/RgsCEPnsy2l1rnSVO71NqZpKIXz08fx+r8iX3COikHZxN3M+c
         PTm9tSzrNhaemk9FDi6Lrdx9PJc9NStZ+odBlR7zu92gqrLYR4cmWRx8J3/clIv+Sgce
         2LqGgAHLciSGCUTezaCzkelSZUOgTzIR5BGYZFyxOFUsHWDAGqwEwphSEbfkkfwwJyIv
         KdytoqDkkqJCb41vLdeDwNdSJSBaxVc0VFTYyJtcSC1Vu/OuCsBP7y8ZyAKW5EJ8G2K+
         rA8w219pNe1k4i6GJ6eiDnHuKvFEo8YBH5RCXwRblAviIahCKC98GM6AYNhAkuJUb8+k
         8luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411170; x=1789015970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=A+7fcLlWGdXQ2T2wODkiXkwsURjwWXqku/4eg7KvZO7JywFHy28mDDEvTZHJ8D3wxc
         8j30zTiUKp9+5TwkLP1Mwqi246WA+PkxnZVJg8ONfVXQ67Bkm+zynRYIe3T5VZ58YsL/
         ENIT369iYpa+yEGkSVvfFwYm2pkBwBi4sISS+5eGxokMw7tCgwgS0X6gfg96BzWiM3HS
         kiY0Y73S0W3dTsqCE5Y4VVUm4o9uLcbM0+JJZFqmG+WXU2dpCTsuuVux2wlxWDd0btGA
         lFEXn6SCdIheu8zVrWC6kx2Jq74+ud3i7u1FDZcZ8rcQnzhVZxInkGnr4Jeuc4BVJO+V
         6KWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi6QJoLS8BTMAur3cVDxcG3SLAOl7TSq0yZO+/g7HxdGXwtQkYPIttbXTShPVQt6uFfDqpd355Dim6Ww==@vger.kernel.org
X-Gm-Message-State: AFuF++ldyjjUT1R7a506n33mShR8y8xBLxad6nzsVJqNgKxIEHegzHBM
	TnGK+vnqIohg4FRIwyDFSDql1gMDC0f9bsOaOShYdjQ/uuXylt+WJHZr
X-Gm-Gg: AYBFou1x3aBlXs7vhVgBrhND8iDPT9hS2Pt/cvDtGX2Ypws4ANhwJIxQJKImXVH3JLC
	N/yZz9m1B5wpmkwWVIVg4gpblXHeG4owu8AO+5o3JbXKuN+syQIDVSEQrfc1n1FjxcIZhvlWL5W
	FEsgyICQ5QbaqgckJJsqtAKp0kpUxAOwj2S1PpufN6eYYX53a6JGnBF9mWmgQjhmb5/12U37EOD
	zhq00PUKlYjK7iyiLD+Eew3fVwS5MY08VHGD04VteAd27jHlA8XyjYdBns0CanORZm/eZLGXvT9
	zu6cVIFLa3vEvgXvKbh1iHId6q3HCsSTwKvsIX5nbKKio+bPP4UgllzqJPLG5ROSxS3HmAETox+
	oI6fDTbtKR/AAODeDpfqS83sWDTRUlP8ilHWaEqpT31yvpDl37/z3ct16t68Sp6Psfcqac1bI+A
	U1v8HOe0w80dLHjBImccovJ1tqPz2wgXyriGD33GRU6RtlEdKycDq3mLgA/gd03ExoU95c/95xI
	ChFvYVWBs764UQxqiFBAL3Pr/caqwo/sNNnmFpBSiJ06LcYLUZ1cbCnEPdm8HyjjHg0enY0htH2
	hIIF
X-Received: by 2002:a17:90b:1811:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39aedee9313mr14120611a91.8.1788411169700;
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Thu,  3 Sep 2026 11:51:59 +0700
Message-ID: <20260903045203.175337-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0

