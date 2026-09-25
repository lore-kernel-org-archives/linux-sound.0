Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E423C7DF5
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311858; cv=none; b=hJ0AZ1yDnExYXCPEiOy1kDkLL3rjxGJYpKFk8DDyOFFbNGoNJREMaSYw2v5kcQKjubtP2pRDZH9j9Y1BJ2K0pRkas4zkG/aMbUteC4nqZJPHKdeJdOlykN5ILO2WPNan9ACGsLbL1g+TXblMvR4rHo232Ng2SkD9mdSW0zO4Skw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311858; c=relaxed/simple;
	bh=d1blBm1Hzmm7Po+juQSeLUZW1RgbslTJX1nk3YK/wzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDpeKsSJ04XAc0t2k50CKpkURisciunrjQIYDEra2MOF5gn0FZDq4Kg5iJXO4Xbvuelhbrzq4MEQvT8blo/X4cA9YzlFnGbt9ym1xbhDp0xM7k+qivI1v+hKL3xgWKyf2K7lHbB5laTsVJG2kK8ylQqHIqbQCfhscVc0rMVeslg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/9/9vj+; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/9/9vj+"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso35147a12.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311852; x=1790916652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=n/9/9vj+ZzXN6wazkBzaj8qmD8oholi2GnmzxGjiNcW0UMIjR9VnX27T4WMWFDq/4E
         Itst6lRjpcFJ5K7FFKbTrBCwC72O3/6XjLE5TfuYS8a4cnFvaRc3weE4ACoslSD5f7Cc
         hZGsIotg4EYaddaShH0d6aY+tHabPmEoLHsCpT3zKQRP33hVDHN+Bfk6SiDaAy1XFdeX
         ldYJyiV/qAHIgpPFjxDrlGs2C6t9n0QcdM94eLSFsCvyMnlKuIjOY0IxJ1n+VsQHZt3w
         pThEYzSvVj4G1PDqY94UFNsXwEdd8cL1VbE2zHSTtpHb35PcpDotBPBUwhLEQniVbkGN
         WFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311852; x=1790916652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=Yh9Qgeh1TMEMxyATaT3GODXT7G2iShMqQbGzyMsT4ZWlK4/Vl84Nea9Om+GQDhCCzN
         hfrYuwZMCi51bPPOn/D7CRxAfBQ7DXsY8c/YVI6HLtTy42APb72Ihh1vO1QDJ2b1ggDy
         XbfIXjHYfbcNvN0wqpdsgrNm+HftvRne4dZAtKIs/2N6+5P3PmINeU2H/6Vg81bnO9SS
         +Z6oscO7vKU+k0ro4cWfQNiXeT0pUtbjoLp8x5PxFcnCLEfWrsKeShfv0MItTtx+TsYd
         bATXroQ8rN7saa27oG0Ckom/epRv4DcoiEZcbIFx7Eg1cQEVC02+tD+t4t/JcOTInkYB
         x/GA==
X-Forwarded-Encrypted: i=1; AKwUvBya10/bvet1XLhDtU6aWbsg5V+eA6kQwX1jn3/VOTcCR8fFvhlG44VlcUbXTN944bGJeHGKGMyACja6DA==@vger.kernel.org
X-Gm-Message-State: AFuF++l00qHRXl42aKCwjC1rvksex4iTLW9QLPkn0oQmLmI/sYP0TJEQ
	VQioVQDpWk0hD83wp5+Bvi4XN0wgo1oDukqnd/6MQNJ+0SDiGd8XplNs
X-Gm-Gg: AYBFou3GY4zcz0bqxPG0eZoXtcbYwI75uuWVGdd71nN67hsL/pYwYTWISfn5sOIqlZW
	Rg13CzHy8sQdfrF4QNriPheRHHwRZmY1zFuV1Ghc9L7bshFuHUaJBtztEsrYcqhz9DYZ664R5sA
	A6aSrjpb+bkMN8c+MI0ctMnErYxh9fk//VHjDlvWmNwi8Nur8MJK/1SiQBraWRaswRcSATCdInS
	K9SpQmRUYa0RHm6sFCNDc5+3tFeJDIvM+53tWQwt2MAHDLLZgEtY7k2142+S6QDTy/iIfm1TVGD
	D1iMM4p7ZhJ0oVtN2VTbtQJf02lFeVqVGKSZfoXsOm3VuHdqvn/bNOaN9jSZXThA9Zu1QCt1u6Q
	9lnyEU1Bvg2S722mY5cLzpU8dxPXDXvprTr6B7kwX9gPaXWb36pIZxGvr3tryAMUEnkYDWoJ+3k
	50mIc22Iq3AGQ4Uu7gY0gsW0rPMCNl91VMcHY0/32lMrrhmeQmOKtLGjwzyV4glpViplIKZza83
	Bh9omqFBQwLWopMnekCP5WKvs5FHK0+G7kLq+m8tCSLcZgVmaM3HS+zg8qQjyxAmVpF0bVYnJgu
	xhJR/FP5aNzvtDakPzM0K6Cz
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr3859051a91.26.1790311852041;
        Thu, 24 Sep 2026 21:50:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:51 -0700 (PDT)
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
Subject: [PATCH 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Fri, 25 Sep 2026 11:49:07 +0700
Message-ID: <20260925044908.450775-14-phucduc.bui@gmail.com>
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

