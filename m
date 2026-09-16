Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6073BCD20
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534873; cv=none; b=lnVQLoaoSGedE4xqZvYJ5DOgRa0VqqmCrF4fcwyQa5u2XdMYdJtJgNO9CTK0x9n1bARLIm7fvPFadhQP8kx+OiASXMAXw0twu92aXajVUHdxBa591UTdceTsOVFdjwutLffTxFLoNj5AmksFdc0+VF1gw+PdTOoOQLFl8UYfX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534873; c=relaxed/simple;
	bh=oeRk0bBJFuLJzLGlSEPoNXPBNRImrcUF+YBmLpWZ/7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzYuUn4ET/we/L6qsRzGEgmXIpMjXvGORqLhIA5B2L8C7yIU9OmKt/9/Is8TDxeXJNuU1avFByIg9alNI1oabEJ1/lj6q0RpH/lnSq+p/+RVgAVXhm7MuUN7HEj6Z6PrMa/Gavymb6PG7kE/yusW1h/fG8FDOAj77C+isVAI18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyutKMBE; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyutKMBE"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so342916a12.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534871; x=1790139671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=JyutKMBE1IplCDxf2sfvqFIiQLquB0N7xV4LACqJTW4+TrsEf9jTfcvuA7bOlNySmB
         lhPduOqWfNqGNsKH0yI8tb/ZUcjLvezg3gYXpML42C+NwrsxCr4FTIm3gKsTYs7sSPsz
         sJN0viNjS2TMFSbFOxXY5qyrqBy8J2o5fa1UteVx+cyXIFgUy8B+tVuEnVc0kqWkLlHJ
         tC/wk0FOzAvb4RGfXEzfCOBfrO96ccjflvI7/5YFueRnk30UTl7zmeFrn4DTkO69DuWm
         R6jwGZWqQWcyaBMwuYuHHLGT1ZfafuvzJSwbP1Xk8/QSlHIEuQ7BkrrvuTznS7aMG549
         +zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534871; x=1790139671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=tOKl/voyNFq9cTya2JVm5uFN5YocYaRYnoe19MimRfFWChORm1exvd6V66M6bCY9ub
         RsBNEEOndve4GJ+kbkHhbf2LH0dCvKZdyARMlPHK1QozC91kd8Sg5ajIXzmx+8/OKSni
         ycX/AQAmhsrej3cBytsxoptJ/2iGS+APDjP23u6o22STP5/aIk8v5QUmm02OpxOkSi/Q
         3sd/Na6/7FrMxvVz7sGrvHfKoTK98MBeJaQB+qTDQRYAedMCgEJLvL4TPAha9vdDXVyq
         h91bCclLjsnYWvlu66L92cSeiSnyaWB5PQlerHyU9w0xSYgIsxTja7pt2vYwjwBY9xWR
         DA+g==
X-Forwarded-Encrypted: i=1; AKwUvByH2hVlX+l5KBtYW3JPEQj7EOBBs1DcjXL+AMEJc1xtPD6/Wc+pPXC8SaxIZFxfktUHnSjAfy7m0UYEuw==@vger.kernel.org
X-Gm-Message-State: AFuF++nYw9lq5odXd6xkoDHB4RhmfTzrWWz6DSdZcpIdR0ZYIVJz2a3S
	aw13foNO1D0uvOmAq9yUvuj6mQSDkYAAzFvco4dgbBg91Y0C4GZooiaq
X-Gm-Gg: AYBFou3+1X4Ymx5EONbHurIbghJt/sRx4/2fO9pyu2ZmSEWzZ88yCwJx2yty4ruwyrm
	Ov+utoJorHJIqEHasLHUHOpvs1zAAODr6hj/7Uy/eTC0i/jwSIx5hXuMdc6f5FQYHEtl7SWvOwI
	mDcG7aoQh/cXTwN4xEiIzCDFrK7ERVpICp5FTM4O43JO9QVFc87jX7JA03OnJW1oaJore8zWpPH
	tmlxY/uO0is5A1GCd/LuNuzDOw9p0eaQT6Nz8cP3mAENuxefmyZ4Wvu/wIfqm5efhSVPwdl/zbf
	USv2uCS6WNJzEZqgrRcc88hSmo+rKQgMfelYDMde4iQgr3+1yWpNsQOaBua0oVgkTnNhDgT/L/u
	YJx6yLyN6r6Y8zJ3Dzyl6XB8vNxP8rJYdywpY9VutrBaMctSLWW/107R/8FrT404ngoCeFNukGO
	PG5FnnCA2k1kutYbsuSjnuCFer9aMeKqzBRVHAcQb/WjNX83VBUXYrH7Uj8oJPjT4sUbTonHp8g
	28d7jddCQmyVdAX8scX67MTMewp2dYs30bBVYfZUDVCVq+u3y5mFHc0/zN8+aQM2XWLsIfI7nu5
	n6ElNF+jW8l8+6w=
X-Received: by 2002:a05:6a20:4307:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3dd5f7b07ebmr2753489637.27.1789534870897;
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/12] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Wed, 16 Sep 2026 12:00:13 +0700
Message-ID: <20260916050020.14575-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..39cc2804ad4c 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2332,20 +2332,40 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_set_cache_only;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_clear_26m_req;
 
 	return 0;
+
+err_clear_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

