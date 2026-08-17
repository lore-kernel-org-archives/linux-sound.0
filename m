Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AB3F9F30
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963797; cv=none; b=Z0QN5YkNpvW9oR6O5+qZIa8wi1fsD/KdyVkBdPKZRka3RDMnathYGMqgKxU1a3si3jOO98ZFd0306Abb4Nc6n72AKo+YYXy1pnhatsIHYlxwZC5+Xl++h6fXhzrpToTyNKgrnYRg8j3Y1zYxReQ8BRJ6nXZYiCDFXWkhuNTQPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963797; c=relaxed/simple;
	bh=mkirpRWcMQwyj+8bGLtI32XjArgjQakZTX6mVw1GFfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRx0Z1rQWOjl3eaca6HcqGpgXvJLI/3tTEanGbEkbV5LfsXq04w2zoSyBaop7buMAmiowbHVkezwl9JW62aARHh+7fZFAfCCPVfz277BmdXqWE8U5JgCx/FY64er2Qz23ttxMRklwhO38kvJsVjg9fvg1INM95PJXThllhzwgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAWwKFpk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAWwKFpk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3920130a91.3
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963793; x=1787568593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=;
        b=GAWwKFpkLWaBfPqrQ0qQadHUjnq3yM7yvrLokK7H5R6PQ/K11iFektLO97H1PNn4bS
         sFMRHW29TQSL/JLxeVAVxuafwKc83i0KMg3amdA27F/WA8xUsTzxY4ugmk4CgERgdS6C
         uLccglHBi5Ck9TDw//v4N8nJ23MIMf8UDAql1thHw20PCp6ZN4F8G/aee6SnPCKjMS0Q
         Mt+3ZpprEK6f+QxHYH7z+vubDQwZBL529HTFyvEKweIDjNl98axR6bMz8zqt+bSOnP9B
         hKeiYUsdZoUTPr10jSheQl7JZsJtYFzvrB5m1nD3rnWZXrm4HfhTALhEj4BaMwe6SinN
         xXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963793; x=1787568593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=;
        b=SthApNaZuPm0EyMiMo5bqIlmjFKa8izevLrCXa/DjZ7ghMZGYRAUbaItsxmPzG2z+a
         DuRZektzxVQqNzJm5Xvic6DUuw1yUv/eOrGGbNZQ9PR3RJU4RjoM/CxL6zrqiAS4ZqSW
         K479awJckb1NsAtfZoHv7v2tDlUGDFi8Xf8agSexDT6ySYedR5DIb15EWSy7+rrvcJG8
         /mGMbjjI8GIqNSvVAzVprjsbln0+UGc5/+yeJoYA5Za0bi1G/O2cO/arQHXr9J3kf0Sj
         zx+PGQWSQxIaC849H4ZtfphVKWv2Et129pWlsUZyT8M7TwaXmR9otT/+enEq92XiyP/t
         dOCA==
X-Forwarded-Encrypted: i=1; AHgh+RoxQagonaU/Mo+2W/NtBK7Q85qwb5r3wR2hTKnJXowKPiNkY5ZdHQ9DMhn3F6ejI+r7HrKc0A+OyBwFXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4jtZdjGfalTNN4Tw/9lzY5guR4SU+LTgrL+3qoafQEsQZWBP
	D34YG2Z0+yv+VGNAnP3B7qRfOowkEe2UpzCrGOviCQ2fEGbo9eSYChFQ
X-Gm-Gg: AR+sD10tFSvst9Pgdv26uZ1J5LcKb6V48cM3+ixtdIsC2lC15LsS3KWMnIBSqVN9S+X
	LVMtdcQ9z0DaNrjrXeUFxifIn5h9llopP9dVUqQHAtq7lD7IlaF23E0XtLkOOa78HuB1dL55HRo
	8+N5I1i/01l4OAOKs7xKC5cALq36SzdC4/8uZzfv/qKLnqMr3xhhYS5fl66XURPBzHuBobqy4v5
	8lKxUJucoMBOqjYHYPu1to7UcBfxx5Nra6ewhEP5jU0ZcKAQlowYyOlEQeLC40SFyAzyT5gFAP2
	7+Cm9AJtmj1hUqZyCsaNYM8ngF+pftEvmNphoRLFi0RQ8gWpZYXdP3Wuv0WYMdagrkSm1LLrB32
	/X7uURrrRl4cndnRB+azLe1QLTNJ/c73UD743RAZ0LzNCkbokuHVrafUU+t9PqHyt+lp2s+E70X
	MYhqlQylcoLku9/QFwQpDGvxwZVyi/FrHeGHDBLSv4YErtaPg2dxtHlgZb4igQCfLz2gY2f4NBl
	eFl4sUDN8PeJxNCrAnPT0J7ettr91IBBCIdUQZJbrvwbW2+UjzftwcAPiykIHLHP8VfwzC64U7A
	qZ3J
X-Received: by 2002:a17:90b:384f:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-3933e648702mr22943522a91.18.1786963793327;
        Mon, 17 Aug 2026 03:49:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt2701: Use dev_err_probe() for error handling
Date: Mon, 17 Aug 2026 17:49:28 +0700
Message-ID: <20260817104929.63152-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   | 51 +++++++++----------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 18f0f27bd8c0..1cf66ca44a33 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -30,10 +30,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
 		afe_priv->base_ck[i] = devm_clk_get(afe->dev, base_clks[i]);
-		if (IS_ERR(afe_priv->base_ck[i])) {
-			dev_err(afe->dev, "failed to get %s\n", base_clks[i]);
-			return PTR_ERR(afe_priv->base_ck[i]);
-		}
+		if (IS_ERR(afe_priv->base_ck[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->base_ck[i]),
+					     "failed to get %s\n", base_clks[i]);
 	}
 
 	i2s_num = min(afe_priv->soc->i2s_num, MT2701_BASE_CLK_NUM);
@@ -45,47 +44,43 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 
 		snprintf(name, sizeof(name), "i2s%d_src_sel", i);
 		i2s_path->sel_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->sel_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->sel_ck);
-		}
+		if (IS_ERR(i2s_path->sel_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->sel_ck),
+					     "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2s%d_src_div", i);
 		i2s_path->div_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->div_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->div_ck);
-		}
+		if (IS_ERR(i2s_path->div_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->div_ck),
+					     "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2s%d_mclk_en", i);
 		i2s_path->mclk_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->mclk_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->mclk_ck);
-		}
+		if (IS_ERR(i2s_path->mclk_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->mclk_ck),
+				       "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2so%d_hop_ck", i);
 		i2s_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_ck);
-		}
+		if (IS_ERR(i2s_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_ck),
+					     "failed to get %s\n", name);
+
 		i2s_path->hop_ck[SNDRV_PCM_STREAM_PLAYBACK] = i2s_ck;
 
 		snprintf(name, sizeof(name), "i2si%d_hop_ck", i);
 		i2s_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_ck);
-		}
+		if (IS_ERR(i2s_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_ck),
+					     "failed to get %s\n", name);
+
 		i2s_path->hop_ck[SNDRV_PCM_STREAM_CAPTURE] = i2s_ck;
 
 		snprintf(name, sizeof(name), "asrc%d_out_ck", i);
 		i2s_path->asrco_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->asrco_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->asrco_ck);
-		}
+		if (IS_ERR(i2s_path->asrco_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->asrco_ck),
+					     "failed to get %s\n", name);
 	}
 
 	/* Some platforms may support BT path */
-- 
2.43.0

