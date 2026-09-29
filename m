Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7E41A4E4
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662337; cv=none; b=PtCU7DfOz+0rxbk5aBJmLGWGGcemtlSz4WjYND/vqo+lEG3MZHW3gVrCAEu4L+LaCWayNzUmjHqjlmx4YWrz8RA/v3EFGPebBENbVt2b5iKNZxqyt5iPKUQPM7+S1Ia//gXUR6lvjQLGXDOfUmlUhC0KnKJDcF2FlplTZ8Ve5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662337; c=relaxed/simple;
	bh=eF0q83Y+oQZF5di7Cc518sTOKLF39DjAz4+BHEHLp3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hk9WhSOpjdnuo+wwnSYP447qNvPjJ7v0KnsOtSzRqOQm+vVaZA6syk4THURFlFX4QZFZDydp2RhSrKnaPfj4Kk6+U7UoGewo+MJrhPO0vFjnAql68mYJwk1nWon4EBWJkUaDqcrPTR0/m0iLGcTNQcNNVGdR4OtFFGIZaD5Cx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBocqplE; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBocqplE"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so2127439a91.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662335; x=1791267135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=lBocqplE/dmc/c/tZ8dURcjpKr/U3Yx1tjddFCfHvHceiK5wJ/izSEGMSfSCMTZZAL
         uJn7DmZzrnM5LFXu0ZS9LVKM1QpMfutbTOTa2yfAhJzEnI50KcR5SIDjqwpz8vZUhNkZ
         WWYxlCci+hW/+o7YpJJSaETMkLPhBeCM7G67m18Uo6lc7xnGWKz3GPBxI5AjDa6ayz0f
         f8xYhU54nbuXpn9grPCLvlbYMRBXimaoHTduIC2Cbmocrh3MrcZTzIZXPigDaaXS54W4
         DmrcqEoABd55TDolK+mNflbRHnxAgSDwidn4f6yE/qUNUC9PRiFrlhv0soxEQlpAqcTy
         qMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662335; x=1791267135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=yWfx1rYvKFBwNLsp+yjzrE4r9sgOlBrz+99ZhUxUTitVaDRMyKSONRNcSDM5rAQ/6Q
         zUbcJgDdG12ppxQMIzPwNS0fF7nAz9RZdad6R5ojY3LNZxdFKnx0+KnP5nU2lKwWwpJM
         rk886wkH9MmoVTdt+26MffYP+6Rdx7bkgUZe4aR6B7aaSpxz63I6r6I5CdfnttWVHyDH
         wyIkIoZGIxPZCzww/nS9jhY5ykY2BDBdq+lpEGHTq6dFCDuBif3Bs7+bP+gYIbWEoDLc
         JxO4MPDwzpf9E9pw1CktIut6SNNS4pKQk8Zkkb+d4sDoH4U4TR61jHO30jggZ4FZsnNB
         KXNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwThOQ3AF9BDTrBCSl/GbMv+Q+IsaJF0kdoVryYnmGvg0EaYTllKuQStG7lQJrDax2tct/UkL8Yl6YkCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJycA/KGGz0cmlXjyru8eKjFW4LnZ9FTUm00bjybwsGDVS4PIo1
	O3+EPx2UCZ03UvX13L91Lk/JHRU01o7u5F7Y+BllPi6Hk6/ckRbsxE+oncGGhg==
X-Gm-Gg: AYBFou1P9JurZQW2Aw4+V+aOQpO6K37wnbD3V+EeSd0N1B49eSHORMlxFXXIeG9hbvN
	CJS+BsogrReB7jPac1Rqkj8eabSL6LiGGQslOyMI4Z0+e1BMf/W7ex3QPIavxLoLlMDzT3Fe8Iu
	4BBjtPblY3/h56AKILZTeYDg1YVo1NmNxqAzgac3MiJ8XcUOK7tfUcQnA7Z2rs4tlyg4qb9BDFk
	HuBjq+aki/aO7E6mE5N2FY+qfwel4aiej40kIlWG7FJj9q9NkQYoC+DfRNzPJ/IBIyUeVPXqqeB
	SZU2Ps+XVCpC0dDDMOJknbgkDZXVQ3oD7iRT8Lu1+sAGqJ+SLDuE7eXODRzDfeCA6irrZrvm7Tu
	ZbTMSjo3Z0HJj5HGlX+ktGaZvD3r3GpoRl/i0bCviiTtvabaMKaAgM7k5Ln4SbnOSCyitbR5pCG
	M4owx3UvWhbC/PEpQ+7DhH/p3OgaOeH0jToFxtlaMTznA65+Q6binnxYEiCWm32wA/JfeGTY1PL
	Tq4ie5hpMo8kVvGtebZhigeIfUXXkdyLZee5Zc2l7g71prUBesToOOE4ul4PlS0WP5s73RULjwh
	r6krVza7sAhduQ==
X-Received: by 2002:a17:90b:4e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a098b8addcmr11959877a91.29.1790662335533;
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/10] ASoC: mediatek: mt8196: fix register access clock error handling
Date: Tue, 29 Sep 2026 13:11:15 +0700
Message-ID: <20260929061121.124001-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from clock operations and disable previously enabled
clocks when a later operation fails.

This ensures that the register access clocks are properly cleaned up on
the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1d107b85d03c..6198711e01b5 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -546,26 +546,41 @@ int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 	int ret;
 
 	/* bus clock for AFE external access, like DRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	if (ret)
+		return ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret)
+		goto err_disable_adsp_sel;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audiointbus;
 
 	/* enable audio h clock */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audio_h;
 
 	/* AFE hw clock */
 	/* IPM2.0: USE HOPPING & 26M */
 	/* set in the regmap_register_patch */
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_disable_audiointbus:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+err_disable_adsp_sel:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+
+	return ret;
 }
 
 int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

