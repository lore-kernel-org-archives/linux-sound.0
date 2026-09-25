Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E313C583B
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311809; cv=none; b=bCdno6cwf6+chmyZOkHa8XJ71x78AokgCxGpguXrnhDiOu0vI2jVobaRdBzSpVr/3tKC8Q2nePXQd5jYrAtiU74mTW/bNCnQY4WCayS10C9YYUisw17HHrDFHBldMM4psT2rc1IKlnv2P9W5FbxDqCXpPBW2DpLlXBbG1U4bc1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311809; c=relaxed/simple;
	bh=XqsJ/oamIOk0pZvu8Ad2mVMfwzmQXZjUOK1YVDL68Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Im0ANKOfAnXhd59BtPx4bRF8sevKamftFo+wjYsktU5fWP9bkw2n5KdLHzAJDhni48BFXQtdzA60D+OTp2daOGGefjicrCd+9Ciz7jgqxuRtQCWzY3FqUxbXYZKCg5xlnsw8b3ZZYbqUj8WwFUDIvWfShajp4jSAMkqm/rP1aGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaGpTo0i; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaGpTo0i"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b18f811cso396835a91.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311807; x=1790916607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=MaGpTo0iNj5rJoAuny9AgTFIUm8kW41YHB2fuWEhL+skuSBEDeEzHu45mQiQlx5cg3
         wUVfD3Fn4Gn/8Y9LeV2nclxrdNiqMnM7u+nW7c44ZdDwEVunaWpmrD4ob0D9BJqQOvJI
         3MvQVT8/u3FDFm98m3Y8NYUZtyw/T7Pep4e/Y8VufO2MfKMS8DqQhY8KQCVCiW+dDuzi
         YewF5cACzzpYAnPfsN9iaELJXsy8Id5twVfR2/9CJiHH8Myb2GoEA9Uy1y3cRSdy+7LO
         tTe/Mp/FB8bT2CHpNDEeWqIp8gmB20ipZO1CLHMiUsFf+Z4DKn6dj8J3Ihp+BV9hvA2c
         UAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311807; x=1790916607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=P103jMurkjw5FCiQukLlTE0B8Rpg6UKPhGXPsrtYb5qJI4yRkHG2AtEiPUeimz+/AI
         LGmBrrRJ3u3bBNM3Fdy54EEzWjW6OeguF7Gcd6jZ8OKP7UNsQ2d1Tw/3d4A9+kZ+OLLo
         4/eQ7zskMl/TUv3nO78Id6akLpaVMPlV1IJvs9sQLnMWpnyBDDk2A71UYB5Mfn0kuh1I
         ah42xfx2+RsrrQiXr0GK9IHOLpW5+CBnH12KE4vVoNg1e75z43mCCrvaHtOfv2lVcp3P
         t3AJc6x8XN4SP/O5VeSNdU29YH+Hnc4l79Pnq2sJ1Z1E/swK73RAd+gCxpWzhj7zuwe0
         kl0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXfnIm8vQYJUWqCqLgqKS/fEAFAQ+L/cFnnFbWzJssTqdJjIYU6o3QBdjJhomJbSKSMq08gappa2qNqg==@vger.kernel.org
X-Gm-Message-State: AFuF++ko/dTEjeQSLZUzqhMn+LP+Hv9PgMn/eZzLag0SR9kYFk/ohbob
	xeq+CEd879LMCy8jzVogajH1Xv4N6beSDzvuzy5Tv5AptFTdvOKstC3c
X-Gm-Gg: AYBFou00R5MmdQQkpGTnQOjAQiAgDuxpewmJ7kwHod3XaX8Bf5m9EhQdnrDMF4pNbo5
	duYhGens9JHyE6nzmPrvTJMaeQ/E5x1fUTUR/DudAHVVGLGJnk8XEr8t7DwpBAxbNgytzJC0b5x
	AxK6D5rxXNewS/2ZtjsPyYmjmaiQO+3qsYD0v9KrcZSa/ycJlpnBhCks4AmPOzdL32Mf8YIjMid
	X0lFU9zqcwzxdaTnhrgLa53g7jRlV4yzN9z5WcHuQK9v2IZ1VhgQ9eDuJkasuolIqdlJrWOwLXA
	kqbAgFcjsoVjxkspzptf0dM3h0gIhns35PXsaN5q/IlGLGN5mAJJI+7rGILuKXZtzy9ZY4heGH0
	e/LAdiKF/ugesI4NV34m/I1TwxfZ9GP/0vk/4gXxjClXvWWxupRmAbHec6lBegu4QKKoJrRbXV2
	7iVMzxwMA2JqvDyzP+AVgz2S/mjT1zx7bU5raGiJnlgFwEikZl6KINjAyOTKlyKiehVebqz4QZ+
	P5IqEulwV7Q9w6pV9UMMkRHCaq1P9t+En0MIwaiyTL0+6POm8gF6d4SGNG9V3JuXP/t9TVtssxj
	jO4oOC0dBHfYTw==
X-Received: by 2002:a17:90b:1b06:b0:3a0:8133:69a0 with SMTP id 98e67ed59e1d1-3a098b93cb8mr4058209a91.14.1790311807298;
        Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
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
Subject: [PATCH 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Fri, 25 Sep 2026 11:48:57 +0700
Message-ID: <20260925044908.450775-4-phucduc.bui@gmail.com>
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

