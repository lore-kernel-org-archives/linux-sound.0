Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307B3C73E1
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311854; cv=none; b=jXsgH+FTnmK5gBkHr2+Gw2nju2MaduXvpI76YgAOi9L2FkJ7w2Dv0DGdmJumK/JqwE5hnJ1oPZwAozaFXkotgzZTin4sEY8CPjGGXdbTcaAYGUiekKK2cf/48y75SqF6sgExtq6xDNfis17ayhQc5daJ4KNWAmT5/wOO5Cv4MuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311854; c=relaxed/simple;
	bh=MMm6LoBTkeAomP+0/fA2vfNONTNnzG8MpauClEVrS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXW1PcLgGZJjSYrERlWYa9lJEsBlk7sE78ka30Tf/a3Y9jzhPUnq5O1Fu/dknMv3MVRMn7CQ0BolW1cOuisoweo3wSYMGWb2TlM0ehhV/VivLc07Qd97Z2z0YQfw4s8kd/Jt3NkID09gvMer+i9aaAOjlw4rx8BmsysIxu0i8bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnHexfpC; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnHexfpC"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso428078a91.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311848; x=1790916648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=hnHexfpCQsOKHDUAlHnQ0U/+1FFmb7rgo2erz6co7i8Nq6Zq5pLE+1l7JNb594jyTt
         +2vyvWKGFOndBQMHCfBeaboMHG+cpgDu/uI753Fc/IdykjskGQEa7fo704aaEcHYaL2A
         wUH07I+uJzP/GKzjM2wIALh9y/8d2FB4spxPB/9LtWvSZYoesPYOXA2z+evKsctzVWNS
         BaeOMqcF9IIXDZcloxCJW0XeIYmdhvub221zZrDlrcizMq6WM05ZfSP95TfyFXcrNel5
         aHdTZJjbRLkUl+8OgDovuBOU8TtJq4aNzmpeoXZkgrnMoZD+R6qfONl1JtODRnuapUZD
         frMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311848; x=1790916648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=jCKsiL+DzBBoelpDoLVJ8GFGGhYM1ealzOxvNewyvooiBGZQl2dLMKJbjQ+k6kE5UC
         kITq2OqOifU1KQSmnDS4FYkZu6mZPHyBAIqSMnf8Tr1GO5vlKzRsaDFNoRuv6KejuJZs
         nKWRq7xlc1fK1u9NjDplA4vbTAqpJRDbd/GZBuPgQifevXFHjNZw6FgmVh4zmXxPAB2c
         LVUhAY13itqx/GUKRVDuTDwWtKCDnPNHziJfUK1GLTRRJVXsMALdKIPpLaT9fBFLDBT7
         roK94t0U0EFe/bx16YByusgzYPEymJSwiEy8HmH6jZSqYsA6bNtEidxDGjNEYp54Z+OL
         4F5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuue3diNon+DoAGbBkq4YFlSrNXbWZzukX9OSnpFBjBOF0gBbN1IrHi5IX2BtMP4Ig6oDw2a9l9rXxLw==@vger.kernel.org
X-Gm-Message-State: AFuF++lvUnun9Mq3QEj7CI3M/pJnKY4cMzsskzCOSkVVJxPki4C3Lqth
	EAjEc2S3Pof/B5wpCOSTqwqjmXoL5sPANAKiod92OGzpV14UqkWptRtv
X-Gm-Gg: AYBFou2TZ7XXxN3BImwGilwslkvArOy0TuPNsRu1E3YnKcKiWzyjOKnc+W5NQD5lkUy
	o1Lm3uaLatVjZzlF5ARt3m3ZukYvcLMsyOjhtVpR0Iw0Y9oyug98KEiwe/CsLmWnHPKjotyQqAO
	M8Vhsb7hY9vu7a5MUhDs7kn6tm4kvR5pL8X0j/jSkvU4dTE4sEBQRwciG1kATsTQb6TjZmPjBDf
	HLZYcedmyzwK4qNGGAKgiP4xEStaHZ3tfiWtHWPhx2MLzfiWy7i2AhKn6vsXten1hL6EelQnA7K
	8qqSj0jNJRQxVAFff1hLPG/RVaOUaSEnku/Im7K+nOwJfdsXzJr0MLvG/jje8jO1N6ykro1ZQUT
	5CoBqjj4eylbeqrW9FBRk0xcPHeixTbcM2gqpGYtpMRJWwi8xgwPQlCR6/el8ika+LHBC3Yor8V
	lvGtyArVHmqpxCUVBwXFmehlV8yc2NF3YIjF7SIzd2e2ZnQDcOYa1DsN9gYYoJFoj0hI2drjhFv
	NvVK11YqYfyy+rN9CcB2GDQa0AcYe1GYFesa//27wXtCtbv6N7WHmnl+MRdaiYNBwsCRty3AZ1J
	t1JRl54kWOCnEA==
X-Received: by 2002:a17:90b:3dc6:b0:39e:24ab:9fb0 with SMTP id 98e67ed59e1d1-3a098d43b17mr4135466a91.6.1790311847757;
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
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
Subject: [PATCH 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Fri, 25 Sep 2026 11:49:06 +0700
Message-ID: <20260925044908.450775-13-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

