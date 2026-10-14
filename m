Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741824F96D4
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977371; cv=none; b=AhvJlaMnqjk5YyYNgOmtoRom7hRytPnUutozEosfq5taTdrtG+Ey0tVXFivWMmkPbT2kM043mxKGAwWMei3heSQhqJSiwLLEyPd3UogSEp2wxV34NMhG9fnLahmwzp1sFjLZ1dj4qn4pCb6xgwHx4NNii/sQbmTGFtYagpJVFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977371; c=relaxed/simple;
	bh=YFn/Uj3mpq3VOwSfjXjRt1zNxxCR3NBjVgF9SpAqAXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBo2vcUPt2xjaDB7n87JVgpdMQqKCKlIbNZxEaVqo57/cuiXT2oWhcSGnPMOfNmrZ59khzrAKy0ZhDnK0K6q9S0+uQygsI5lC4iEbyjOgKcWMskUrvj8NPsUZ7qBig3MznQ0KFMTd0lK8dVsyQ45y2JxRRBSu3z9w3TiRhlKh1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEl9GlXV; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEl9GlXV"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso1540944a12.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977370; x=1792582170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=CEl9GlXVJpx3BOvOvU5bDd4O5zzuPS3yQyyqjepzzFI6fMK8ctKiHxiTVG2RDBZUNJ
         +CBIVETkbzjbq+F64eO6fDikemDOc4DuaUEVeG9Jea0+G0NOQLbFdFX45eCgT/7W+U0r
         RPAauXjJJdouIvL3HxKvfwo6t3Y/l08XoUdNK3kwQmPtg538fBy5Qmj+En4SvY2BZMyG
         e2gkI9qq42mrROmVbuO76kmh8xx6cvsKVThUOC6FaQCqi2W5udCDV3zyq84pplR2upDo
         397GA50FgZ7kmglEajtTB61QNBTUhwGu30/qVG2PwQ0gxnqCUtu0QMCG0IML/IEeRE4B
         ZpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977370; x=1792582170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=WEGJBo5IhB6n9R0S2yKd+oOQWF7Fl6LvMscK6iZdsRuvDsZCHcYPWV5cI3e4y54su+
         zH0dneJHjGOQgfBwPzP4YDq/3HDD9D7eBUg+s0vfny7F3/N6q5RkeD2qP60dQwdjPjZW
         RqhgyvkgJuYBmuAAVE7M4Kgqh6BlMu2zpDAtSFJQcj0V8XdrHB45hBi9uU+6fB86yud1
         YXA4oXtpIaqZO5FC3FhlZFErA4S3XYdfMaI1ykCm6Rnouw2vrhnipbXuke4SmKtDNVvd
         qGa3kaO3YtmH7Nxj7ETuSXFZC5Cp/JOMXt+GdP8hCDfEeZWJ1qQShTMcWlIfgFs67duS
         ZMrg==
X-Forwarded-Encrypted: i=1; AKwUvBzHFZ7m3FcHKG79ZUljcqaXU7jWcRHyMW/HZ1s/u+8AbBJ1A//N0vBC3h/d4yYrYalc7HU+0bJ+H9dXXA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxXyLkULfkYqVGi+6WW5CRWyTGYDY+jCswE2uK0DlAVwXArERy
	s19W4l6TmUtUM+JBgKXBgAa+HgR9NroszgffZbg6baqyMbq7YsGFiP5B
X-Gm-Gg: AYBFou1dEtOBtwDiRfpfphUfVb3OGMHwtHeU1owqvUHygXv8E04qFPseBb/rxA8d6Kk
	rHsPGm2Zz44vuUsGvOAl1lmh9BoXs2wImye0M1VBYVnyNIch+LN/mSw7JlOQj5NaAOwe3ZZxUof
	rzQVBQZt1g9H9beyN0Knx/378ABj+PxvppcCFfKFU0fK3uKx1C5bK1kXvnj62CiZfZb29/6eOrw
	NUAPLku185wqPiz5izTtiGNOnOSuqdtH6JFD/3uNc2zYZEb/e8xgppx5MfRD72fRJePZ48pOYGX
	z6+2O6reAj+2mTzFfQYnz2k2B3AqUS8RcOqiN4XXu+vlI18kluU9GYeakMgADogvFofmXXO7ees
	c/k/c8aTWYd89Yp6j6/cPlKjHPICl5LSf4fOJVWzufrSXhqqBtu9vulRGQvg1Mxg9o637jgLXDj
	u1aIlRiC8qc9K1lsZIu/wxDQjC6w2KSSJUZPA8VR4CG6beGfunYiSVXBx0PmhFrza5iD1UJ3Oz8
	NkKHLYk6tZHufARRS0agSjOPQDRFdHLjnOwZelBQvcicF8/9/aT41nnEHbCcGb4pBEmK73sv9IF
	cTy/ayp/JHtlSA==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr13309248a91.22.1791977369735;
        Wed, 14 Oct 2026 04:29:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 13/16] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Wed, 14 Oct 2026 18:27:48 +0700
Message-ID: <20261014112752.683032-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

