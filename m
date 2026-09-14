Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103443E4C61
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370991; cv=none; b=WBJTnhy1tFp+T1Oa7f0LkhJlz7Zr8b8vOut5U89wTL0w0wEZ6PABy4lJtcuECp7SkVA7tJeVbC5jFqB6xvztwf1x9XR4ow3eyAVxIY3eko3OSwoByMvW0sASHgTLGYYfB5bYBYJX0T7a7LMLKFpkjeJIMrFsXPY/gL0xDL6X47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370991; c=relaxed/simple;
	bh=zVt/GLB/PctPHE9xjcaVCw+lY910OuGBOfYlSPretgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSvrBwljcFcj9kh2xZd2jljnXlBkvO39zBGn5SG67PMBZCc4zDfh3ZuWwotJ4mVs8Rtz5qghYO87FOB0tRkJwOzx0t0BD5TF/rmX0K3ncXYvBqbPcP4dZhP6ZtmDI6WzXSHsrJTPWM2qlgpWJ3nzPEWtvF3ptOJNvfrsncffrLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYAI7pFo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYAI7pFo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d715f4a587so42238585ad.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370989; x=1789975789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=KYAI7pFoKDv+72sI+qVre+WTK5th4jHZDZEbSzMkA76Tih8WoFXiferCPS9j5NkGKz
         3qAQC6T8qIN1Yv8/X/Rm2TMuXinYnRS/DPNFGd1Nx0Q7q01JUn5dxMj9HfJ6lXNa2HHc
         e2aUfCnB6PsPSMFSU8thEMw+iO1KxCbaVox3OZ9VPaBOaEhG+kyX1tS1kXrWQbGiwnRv
         tFC92gK43lZIVBMwYoS89R3ujMVrMSasj7/rxn+7BJ6YCedeWSKIpk+dQGf7M5RNH9M5
         7sUotqco5RJhjo5KzYerHw4FsNXKLoUk303VDPrm6VR9jjCkzmcTCaFls9oRnMvlksKp
         tQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370989; x=1789975789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=SPda27XWfZqFsdOPF9j17/fRFg/bocbGvuldkIjHHWmILEzs+EcB3mXOCJEpZGAR3v
         iN3CSjpwoqIZ4Fbn1JozNebz/YlcpwWIIX72l1zRbcYEc6W55SzVfnzUPiZqcFbOKWuu
         wqvSAyS7s4U7OGbh+RRE4wtpZaLpN17MbjeMobfZzhBHJ+cPe7/GCal7bsBGWLnPvbr4
         hq9+7azA8ASRQrtcO3dgvBfMtGseYxSnKp72lV2YL4E28uETN5HZFju9cJfePzvdR18G
         PHk9IZEEcK2LXzlO9Xy6DbrZTl/hMTOKldmFW2oJSigikVtTzo364+uPAZGTFMu1EJJZ
         3/pA==
X-Forwarded-Encrypted: i=1; AKwUvBzLqZ55gO0VAvnLML6Pr6zD3TxAxAiguOIau27Bprd/x3yq2RzxzxeZTDd3JnZECJvED8Cd7xtEVavxzA==@vger.kernel.org
X-Gm-Message-State: AFuF++mKA2v/1gyyRE7NAroYByC0VJnrl+wsXMSUbf70gfAnftSWoaM7
	b2mLNyYnGu65aPZ0vwag4U5oMYAlaAD33FL7h/Eib4uOuvCCBOXJqivB
X-Gm-Gg: AYBFou2DbVPPHI1LFdztK2pL4WJ2KEklQ5QnO5o2Lup5nE4f+bClD5pllTlaN8oT3pe
	Dt3bYWYelRcVN/YzzJzvSGCbrOuqOZ7cZVuhbWgll5HfXVkkqTUb5LAQJOkeWV93diP8gaO8FPN
	HAvDw1RdLCXLzhdaFTL54+KyoExrnCEb26W22tladJc5GyDWSNdgFcUJwWdKHH2mGaFWeJhOEFY
	PFuCKraMyR55XLxXKqexzr+Pb+QKK0xeAjEwT9keceE0gn3WG/91gjI+N65/nrMu9Cw1xn6BLhs
	1AAyeMcH/TsoktwO24onQoMyzkEYzH9SJAng7L+waOlWdei/pVCMAG187ymFVXdiUEeB0MRj1JA
	vg+aYYsj7coxoK2J7r885aZ/kAesk5x5JRyaiR+DiUy7PHlcUwbiRVpAkupDauDq4HTWFNBXuOb
	f/znXqJqwSMz3hyCe30+V/0zUOiL5HFWod0UFM+zwh6AdD3N8t9LjidwxSF9ZZm2zJGbCfMaQK0
	x4Yrr+tTGZPKxXYHCeqjQOE0bxLw8oWioc6uSHNGfkg/EQtdsPrM1gdD4ioE0XqqfHlrd8cPjaL
	10VBIRioYOelREE=
X-Received: by 2002:a17:90b:17c3:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39debf6cf10mr3012416a91.5.1789370989442;
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
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
Subject: [PATCH v2 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Mon, 14 Sep 2026 14:28:41 +0700
Message-ID: <20260914072842.24420-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_tdm_bck_en_event() and mtk_tdm_mck_en_event() currently ignore
errors returned by the MCK enable and disable functions.

Propagate these errors.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..1b51027c6cf4 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,23 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, bck: %d\n",
 		w->name, event, dai_id, tdm_priv->bck_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8189_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +289,24 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, mclk %d\n",
 		w->name, event, dai_id, tdm_priv->mclk_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0

