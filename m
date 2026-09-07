Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55941D202
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782625; cv=none; b=EL+ugQyYPryB5Fyl2je+OEVilx/IzlND2JpbsJmwfh/xS3Rhc5iDrxh6LpOf5r0g4aHK4NzwNbxG2dQU0njG/+Nv6YQcSXTKMYUpWwV8NlGmpwHUSJc0Ka4gGqgSvWV5dsHJ6RYseITwEJmri2JViqxw3nwYyU3sK8J265zTjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782625; c=relaxed/simple;
	bh=ht28FDJd62sIVqArBKyNm8KvUqEKJhifE3cS4QkTo8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoBGjSmbGu/bw0WUYAI2IlcN4fFGd0+ia2wO6vBFe0ZW6GbsrDR42jpyBw5GdWSpNWyyTXgDb8xhf69ecAjUNv6DCX7/W46hG/6HTyQwDm9QM+2x5F32Us3qWeYL1WtLtuQTQoG5H5uvHSGFtgdvZ+RALRH48PtywWrfZC9iBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q60wGK22; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q60wGK22"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3738573a91.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782623; x=1789387423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=q60wGK22hd4GaiPP9BXilA3CHaA5TO5LDeMbDL5KX1MMa/KBL15PpzMz0HBYNVNIGp
         9PuVjV7Sm6ID8q/hKGY/2oZXMct+QkGk1eN+3KS1MVAu5Jfz10LNQaE4ArxQcSs/KwSs
         Kcs5Mrr9z0eSEpI272I3sp1aZfyQR7KoVZVKDzqCzeSVTZTCwzYd9Y77LGmqB8Yk1Hn1
         khojlW0ENcA5L2jKsrHJCaroNDmfY411p2WUKDhC/pInsKOrgKg4OLHyd0P79R68EFRi
         O8X93EJx2KuQNkTsGxGxKpMLESc7x8lsb4Cp8M2Clfn53h5bdxk9+JeXGFv/+mvACPHJ
         J7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782623; x=1789387423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=GyC5h5LTAU8U7R4zO8uTiSz7BN6zKwBAXnZw6rD7bR0C8vdBpSibJe/LKCXjwZBCd5
         6RYM+OkqtLlFVpK/5pV0Obg+dh6/711OjOxan7HIdFF79QIdfGNzx+fHuo+OqV2LE4gH
         nBvlGgNcokMFtWWXROhbmTd6L+vgNkLUkcrChGQ7ZAk0bdMmx/GkeehU5EaWkRoljXhV
         UhzMqzgV0EYAV4KGOsb6dFmVUZ0FN2D19/W2zE0XX73QnRJEo01ZN/IMohs9uGcmRiRs
         BwDHH7koPwTpbPNSRvWN5bKwoy9Ok4Ft1JCjb3y5ynwlZbjh4i5Ol4r35Y27V7BWJcTg
         i8wg==
X-Forwarded-Encrypted: i=1; AKwUvBxtvY5+0bqyXd94on3YsJst3hMo+P25y0T4R21hlXIxzyTFiQl9/e6xhckBFSZ4+wBVWiCdxxzLCqWV2w==@vger.kernel.org
X-Gm-Message-State: AFuF++ncnD75B8MomXJW5waP9eZZ09c/gTX6Ng3rUxMYsY4FqaKL7XEe
	JQYGRk4kFVRgIO3CoGv/iaa01XktDAIEs4KBvV/f/1gy1/k8R60/Ra/c
X-Gm-Gg: AYBFou3q7Ix6TtX7hHKrIo71bRQE7Y8EXftJQxRAi0WWS3cbY+YFkXWnVvm2es5Q1Ir
	TL+7DcHzzYhcG4+beZva4GGrGN0pRZFmep7/OwnZ15+UiuKs3idybMxz/1peeqVevm3zOtHeaEg
	Y+cRsjiGj7XG/imWlhvKqwG/d62JmmL6qiHlhfCoyXy+/Y8HI2u46xEvdTAksBFo+qkpOGsilM8
	vGEUUryXiOyQIbxP5C3K1Th9b+wQ1zsHExjfSIZh/UhSp/rdBGhmh3M663h6/o3ZhIX0EtfdHGI
	JhJvUbGyGQ9Felh1ahRBgPROYwd0LWAuA6iAr8cePB6x985yjHxqYt0CGeqWIAedkk+cqTc4Xcc
	5u5fSycrGTOk6yoJYn+VO49ZxLftoM7RhTS2HEAgH9WE2X7dY2Gz8erQ5PyNEdyzD3c8CxXLenO
	Ea7ZFRD54GzeUk1jhkjqrPzBNnktuvOMsrB9iD/oM4xTZboyqWOMSAgv75yaWcjAP7Qf9cBXN18
	lL44l22R3X6aooYCZkjWC6XWtQicVmB9TBOKfZR8k3HYCxiq3m/0lZ/iqZI9VeYw1Ob9o/jAzvT
	aNIL
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr34312637a91.10.1788782623126;
        Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization errors
Date: Mon,  7 Sep 2026 19:03:04 +0700
Message-ID: <20260907120310.135693-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to handle clock lookup errors without printing
redundant messages for deferred probe.
Propagate the original error from tuner initialization instead of
returning -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index fc6cb3f0469e..42878c8a6529 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -416,12 +416,9 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8188_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
@@ -430,7 +427,7 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 		if (ret) {
 			dev_info(afe->dev, "%s(), init apll_tuner%d failed",
 				 __func__, (i + 1));
-			return -EINVAL;
+			return ret;
 		}
 	}
 
-- 
2.43.0

