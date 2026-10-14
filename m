Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5384F96A6
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977383; cv=none; b=PcX63qoekt0GPxJP1pq3CPW3F+Ny5jbj4DkVPZXUl7R2D6ZPqh3nO+pEkwN0qJ043fTMM7aNcbQEeE5edP1A3EKD9FkVBsq1vuhhIrCzzh2R8RcnCOnNfTANzVx+0PnTnlz1NE32VqXORWomZbKmNleGWxz3Qp4vVWRo2Vnr6EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977383; c=relaxed/simple;
	bh=d1blBm1Hzmm7Po+juQSeLUZW1RgbslTJX1nk3YK/wzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbWvj2xBDuQvfUH0i2BVasgLDazKDSQEMcXuj7uI6PF+TZzUJCOwuMvPflJEOnwzIUxfhsQ4mTz7pQ+FjL8DfVtVTsYXxSPyKG0frH204dazqDQZLI8Uw19mGZW7U6JRsV2fqjfOF6baeecJaTJampl2BiMz9miPnAvvggfNf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQshfsTM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQshfsTM"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2866086a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977381; x=1792582181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=UQshfsTMDjHfn8RYLF+sA/YqWYveXKGoxy64xm3GcaCvkcj/2NPMlOtl8TXits7C08
         olYjSP5daWG+2PzUdfvvHeWyZRRkUjZtUL/3FGnRhRkbQ63owIt5YVrL4UzNcqMR8KHy
         +zmOKQmtp/UiPn4eEUXeWc1vFvtH3tr83Llc2ODQ/BOEIw/2ST7rgw3yNQtZQMqZRuPw
         EaLf0hw3YlLYSXc45ZyLP6og7azt7xYvowVA7gKpGIrPyEXeXeWAf0hafAFzn2GCytG9
         Xap7CI5BXKu0Y3l88slcmyS5d9l1ssWnHS1SxHtTwDEbFJmlBhqOCfV5DwcaG4HqyTHr
         OJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977381; x=1792582181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=bi6NwAphCFteLPXQcZim/xWMpEGCiwREGHCuSL7tojsWw2hOeXMm+t1WlTOF2Fr5kL
         LBE6jx2w0KSprdwA5+5vMAWlYslEvYSSUEuJKhJsRRFhgSnreTO9RYBtFdewrIZBgrKl
         z1MHzoe6yvDqWslwzNpId72K2eIkrNYNRw2nB1SvprY6UDbJ3F59BYA4BX6nY/RWC01m
         3MvZ/x6Q6WIxB04Zds6qEjcTyytilaSweHq4O3jhUvzU4nzuXeysne9PMvsMpw/GSdek
         6Y125EHQ71fopv3f2QOJ7Paj0cGE1E/S/jPUoQM5Dn688hG7gzrMlO+tw6xqLv7F6eKW
         O07Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7xey1DeuHcMk2XYlEPz/UQ7O0w6YoFyRXJ+20TQu45kQtbaBaEZGEti2UzjlzmoQbvf+5iDZxl7TJ1A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIIJDePL850TmIGqLfrQTlyukd95TvYIKUGO7N3graWo4QoX/7Z
	cwNSmdYJjIgkeEr2Vcr2ET8/Jn5zpxG6BiliUzuOqGv09t2PCcqkmj1X
X-Gm-Gg: AYBFou2xCSeBxPYmkT1TS1DjrUYo+M8DV0vE+evBBXLUJSpuIjYdGCIL9vR1qsTMDB1
	H6bXTRD4K1kg+kPOgLcEAvMdWKkZSYIw9rj683qMNPpcTRzFUk6PD5Kxyp//WBthk29f//4yykn
	qaC+BoGUG23Y1zhBeQFFSCZtHlP0igJLlNzxs8tsQhRAaqOQ8H3ze2AoRf9VmeQJvsMiFf3CeCW
	cFE9xuKG3t3l7N/fI8hdh+zIc3RKgjJ+Y6qtRdP1vLoPj/IeNl1Ggrum4GNhKQCdp4uRMa+D/Tk
	2dIvpJxV+dquq/UNkGdLP5iKXWPqKngQ/2T1q6tB914P+MJtqiW1xu8qMM9EgnaX6Xx7/nkTOIQ
	HRVGI0hOoluSemSDg+OKbiav+W1t7mB5AJG0sxlkAe+GhPPck6OrW2hBuehSZJThtRmBnVnLpqS
	7LIS/T2dTwiXJrzbsS8yRuZ726fZMO+qamoWxtYqRFPA24wyvO79aB1PvpQX/LdESdMWkjAVOmN
	E8MMnq1o71XJa2+NQVvasQu0jKKhT/s2MgGaj/Z5WglkM2VoVHyeYOQ5zYH9i9S5mIXpKBRNK2A
	d8vCzz3t0dMlBA==
X-Received: by 2002:a17:90a:10d6:b0:3ac:80dc:f40e with SMTP id 98e67ed59e1d1-3ac80dd0197mr393878a91.24.1791977380867;
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
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
Subject: [PATCH v3 15/16] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Wed, 14 Oct 2026 18:27:50 +0700
Message-ID: <20261014112752.683032-16-phucduc.bui@gmail.com>
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

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0

