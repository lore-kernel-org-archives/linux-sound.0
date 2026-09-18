Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CAF51121D
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738814; cv=none; b=lKgLF5IZdWThZOP2msTZ0rAlMucDPq4dl4LxLyHpCcICzHsFu+WNQE61eAjp+7a8IIhszlmhF9qSl3ykbGx7zmqeussvoG8v0Z9pQRnRtFMKAA7pOdLPGU1esfJsN4tj1Dlh2TCzaBEfaWwUSnCivlIyUYxdsprH0n60W/E6+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738814; c=relaxed/simple;
	bh=py0ZrKaM8DbzSWplMOWdiU7mC/SzmDtkED2SS4JnlbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtzyGYxNnTQ31QD7RtVaWQu/eXSkJBe+WbOgwfy8LirwJiQh5dfxwe2Yu3hxmcSegYlPd1QEJB7nPC5VZ74yest4jLjdLaiznmbMRZ2wXJEydVjiNN9yu+4RrGqRgfyvzNK3ekYAPhRZEoSCXB53SkAADzPs+TxT1kIRP8wrw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KllhrvJx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KllhrvJx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso573733a91.3
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738811; x=1790343611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=KllhrvJxPPaQAm4itC6AAuwdWI5fyipgGpb82XDBO+s+Mbjav6GfhNZIzCGF4NaxtE
         OfrS16FRPCH5589trDyEJVkHBLj9SWHWaOAcmxxOr+yFt4OQXa8SzVIYsCjpsMEhxNK4
         Z7dOo4QFgXlVyxURw8w/Vk6RwDcIWZlHsjarYH9VvdmwMGR2CEhJ7tUUYd508Z2KLn8F
         69FuZPAj8H8tWFngcdG/pntEK3QDNDTX1XMhsagHxarTKhMxaiLUNOMlDDRQ3Q4jLj5s
         duMi9VDWHgRosA/EO1gOIcpwR4uW9YwOyUEmFFvV9M1euY/gO5LGBZfdyfNUCJubSH+k
         9uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738811; x=1790343611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=gRToxSKSOn+5v0CY792D+UNUVk6tmdAwXabUSV5/q9Z78iJZ3GxpO+ErlkGfnp1R67
         PDLLk07geSAEdRPGEHd4bGwnCSaFxm960Fp9ykJ6CBE2n0esOluQvRgiTUcTdQRFp10g
         z8ypFqpHE9S9OlxTgJ02EYFdBvCsa5BkYCV/TrgbQEcikvrfW3ujZzeU71z48E7xz3SL
         i+ZHExhmBrjHEOA1MNpyTR55t/9U+ubkJudhw3H2ly4SnMGmXpkswaSSh+hfn3MUj4l+
         8hwXBNOC8nK+iLbtSy6tOuaJ2VybMcM3cMOONWU58Exlwp+10aLeLQrcxhatTHWjUuoS
         galA==
X-Forwarded-Encrypted: i=1; AKwUvByjL5bQkBoZCiStOHFYUb7NLvqmfJVC2SGkL/vRMt1Ur0Awjfmd5wYe+zQRy/93PPCUD5wtrdsCXQqbUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mFPSiSTmtJrgZ6hrPbfmR7CsxQO1OGsEPetjYJ228HM9UUvj2h
	D8cg67u2vZ5RZu575zFmBWhktUKgszFLAwjT105lMhWTvc5YVdXJB4DO
X-Gm-Gg: AYBFou1FD+2RhA7cnfJJ9VaP1Xk5s5V+FtQvZVJbYUTpKOzDYb7/csbPYk+93cqjYHn
	DaM47WhV1pzc01JfPEZ4qKKS9kw99xz2q6kTd/1POy77ZZZw+VrB2/Uxcah2NxOjgySbbS5qAUs
	pkgcklwGzSoE3N+Q1jskOCyZ6v1QW+AXlGhEVtATGK4OPDLZpHwvXi/pTysiGPVMUvaFJSNklEO
	3lbyvruL/EHha3XK/kkn8ZUKlDXYHgViMyB2yHOnZLPvZF8L5eJAJ+8OalvgpIyGD5Exyiqq35M
	/D3Esbvvx9/0cVSLTE0mWsEgY0QJHR1b5zpVo9+bejisScW4vGvc/cDLod5Sw8z01/MpyV0g2or
	CkiJUcHapgshKFJCTrjN6rtvsz8EQGMnPaNLovjW6ECDpmFeCFCs4TaoeF9RmItfIjQ+wYyr7WU
	/pKylVQ8U6DTvCCKzTyVfkwZzV2Bkne3XeVuDIXPBeWL0OcNhh6MdOblT6WQdR5RjW9AsbwYSQc
	C61wy8wHpQySuoxvVqQXPmuxgqxDcdtjptpCEAA3hvflYtv+82mHMmd8Gh/7aHEPBnEPbpD2wOO
	Cp+aus3HiFWO3Q==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr10006575a91.3.1789738811052;
        Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/15] ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
Date: Fri, 18 Sep 2026 20:39:02 +0700
Message-ID: <20260918133912.133799-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 24 ++++++++--------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 9b9a3465ddb5..c6ca4fe7fb19 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -680,27 +680,21 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
 							       "mediatek,apmixedsys");
-	if (IS_ERR(afe_priv->apmixedsys)) {
-		dev_err(afe->dev, "%s() Cannot find apmixedsys controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->apmixedsys));
-		return PTR_ERR(afe_priv->apmixedsys);
-	}
+	if (IS_ERR(afe_priv->apmixedsys))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->apmixedsys),
+				     "Cannot find apmixedsys controller\n");
 
 	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,topckgen");
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->topckgen));
-		return PTR_ERR(afe_priv->topckgen);
-	}
+	if (IS_ERR(afe_priv->topckgen))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->topckgen),
+				     "Cannot find topckgen controller\n");
 
 	afe_priv->infracfg = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,infracfg");
-	if (IS_ERR(afe_priv->infracfg)) {
-		dev_err(afe->dev, "%s() Cannot find infracfg: %ld\n",
-			__func__, PTR_ERR(afe_priv->infracfg));
-		return PTR_ERR(afe_priv->infracfg);
-	}
+	if (IS_ERR(afe_priv->infracfg))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->infracfg),
+				     "Cannot find infracfg\n");
 
 	return 0;
 }
-- 
2.43.0

