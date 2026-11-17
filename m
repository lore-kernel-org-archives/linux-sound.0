Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889291;
	b=W6m5c7lhLvzIVLXgySgvuYbUBlol77CLQEcn7YVMdBPxgMYzTvuuS46s9nTzZ9Po9b3X
	 /y0qOR2/7AVtxem09RQWTacd24KnSZ7k2CU7oGPYJa8EE7NrN9eQo8aEyKMAVAyPi3n75
	 MDKkkyRtnGyv2UzZjkQo0VKLcffmsCtDBBAxm7gaYTXarhIm0x9Q7qm/+FMx7u+bMEJNQ
	 i3rdiS3/AIMEP3FdCJfjZDFgq/0yr1HPjNXKN/l3mkseOImyqeb0+YQD3XVl0MeWILtOG
	 ORtGDUCd22+A7yoyeu+CVO9hpMZ6VWfNZxaSszsnuBQ860GN3R0nVdCJmfkr76DynKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1355GaRprf5af481svTnlH2umLDzsTzd+KGfE9XZpIs=;
	b=ESy1RVSwVm7C7IfnVvgcTXzYdH+ViAdYyR7nW1DRBRsAM1q3YpGFRrbVLI9YRAxyb6nB
	 pHT86Bwoe/bKoIohUDhp/H8vwO/ZeD9cY3imy6I0+Fky8D1yM9ivnRumpDXepiPuBthJT
	 ZmhD9uKgwIgY8ALYHRvv0HX/jCaKhwPvX34Svzd2EHCgiqiHivD2nqwaAMH/CIf7NjeFh
	 zrJ5+ZRO7J0E4xjjl8HqbzP0PUBPRvo1a7xcogfogi0/gakEPSQhdAVveKKv+GrjyJ0Ey
	 RRG4Aa0g/tHKX1jS+iFEyOa+E7dOO4Kh6oVuA7CRwLClGd2+Jr/wrqm7aNI6AFZKSuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyrEDHfB;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A7606A329
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 04:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyrEDHfB
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9ae391a05so3584795ad.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794889291; x=1795494091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1355GaRprf5af481svTnlH2umLDzsTzd+KGfE9XZpIs=;
        b=EyrEDHfBd4YXBzIi4U3mV6VVjiFuf5p57wUhGUjLYjqXtPe7saanA9UCu0dAUXTCjx
         t//VGPpePsMN1M67t7JDCaQUIKevIadMpCtoOQcvgkGQ2tnqmWkt0BpNKhBJncq5Vz4H
         LZIp5FVP8CPjcDQ6vsIRDAoCF4pPT9DPwiVuZZnZzRG/OPXAjaoU62kxfcsP3P0IHJAD
         12VYxcHCAApmRv9u9sEiszfW4ycflDlkycI/uyD1RwDXvMS5rCAWdUIZuzffo2JAYt+Z
         lB30DmJShkkkiHGKxqbPeDC5g6yiUN2NWKxLwxWF8qOH2zF0EL6HFdCRQBf8L4daYAOh
         c5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889291; x=1795494091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1355GaRprf5af481svTnlH2umLDzsTzd+KGfE9XZpIs=;
        b=kN7JQNUvR3/v3xxv6WuWkTi4POjpa/0jyWxrkuA3fjYMiWahAVE8gMqWXKIRQzQi1+
         hMkoCUpVR+0lJOdsigTTUMRPmxW+x6RQ+kzTkKW5xWsPgxb73415UkNnX4GFr+//l2tz
         IX3OZXcgrEIn9HZKl/nkYrYD9GLeRDLk9Uoe3brqfmkgWxLC9s0T4ps+QgY02W+hrZhq
         USNvt6Z/JObHvNMu01xbgcym8nc2Jf5Z9X1TXxR1hjw2KYD4tvmoq+4C0zhIZqkb9j5h
         WJJEBP8FgLD/BNUpC4qpUGBs2CB+2DVapxyHwD2LfGO2vBVH6IAC/fSkMQFNTrVt63XI
         V7cg==
X-Forwarded-Encrypted: i=1; AL+hErH8Q4DgJG1WysbHR3F79kJ5fZKM5u6vOSuU4A4OOTnzh/H8lJ92a3RjbqvrLk6/ddn+ZJSRGyst3gzeUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mq4lOAq/thDlMIeOX7ZBXXRWJT3heXfA9XRszndBTgyo/4+xT
	ePsOmzdRGD+NTe/yjxkIE9M88YfRBEW29XCKUz6uHTPDSy8y+JdaPbdI
X-Gm-Gg: AZFdTZdkHFfK2+RVUlDL2FKInIeyUIeb3PGF1UwMcoDWs5zLBsXvgxHWg1id0HVgt9s
	XPP6JioIOEO1l9UFyNxr/0Im77KPujRcvLWaJGA/9Ttw8DZ9d1x8k37i1IbFS/2MalLTAUt88oc
	tVDifTkUHiZTSYCATyLf2WMKqds9ELnQ0ypbY2A7TU4iFCv7pl16wdCpSnpWujzVg2SPVbgehQV
	HBxQkBDsq0Uiz3rtz8DxkdPFsm1tsjZA+x61LPZ03Jn9Kfm7DygGm6hLsumWXNbVViKASPzQonm
	i9+nT6mMqLvtD5PY948RQuUHRfA38QOaEKANyTbSeBd1WXOw37jlHdsZSdu+fnxg1DooSO6a6tu
	toi/pFFG8A4LimDx61kbPuXd1lUkWoOhVwJtLfF3ooJz9g5IVT02hrhaEGRYM84Ozq36V0AkFhN
	nhwEJTnu7EQtv2pdc++Y0rd6WgWQPftzZVukbxf+J0L1lxbahPJVwr6fXNWD/yxns51gvaExsNc
	ObtJGlhdyNEfQm6dF/cXLkpw4ETrAJkCfu6GBxsunblEKTsN3zRO2C3i7e97X0lY7gCxDiyfGoy
	PYDUndS9haacYInIH1J4jo6FMUl0bAk3Gt4TZPjQ/3MFoGuX738mTlJsm+sSFKd6e6+4o391MLB
	/XXRyDmdHRi/tPC3lGvgutGwbmk6cFymCI4YQhCYzbxFv
X-Received: by 2002:a17:903:4584:b0:2ed:1cb7:79a2 with SMTP id d9443c01a7336-2efd9a87525mr10469925ad.25.1794889290610;
        Mon, 16 Nov 2026 20:21:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe41c8df5sm412385ad.70.2026.11.16.20.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:21:30 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: cirrus: ep93xx-i2s: Use devm_clk_get()
Date: Tue, 17 Nov 2026 11:21:02 +0700
Message-ID: <20261117042102.12442-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117042102.12442-1-phucduc.bui@gmail.com>
References: <20261117042102.12442-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use devm_clk_get() to manage clock references automatically,
simplifying the error path in probe() and allowing the remove()
callback to be dropped.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 47 ++++++++---------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 8dcfc6717e19..f2d55763a02d 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -471,54 +471,30 @@ static int ep93xx_i2s_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	info->mclk = clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(info->mclk)) {
-		err = PTR_ERR(info->mclk);
-		goto fail;
-	}
+	info->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(info->mclk))
+		return PTR_ERR(info->mclk);
 
-	info->sclk = clk_get(&pdev->dev, "sclk");
-	if (IS_ERR(info->sclk)) {
-		err = PTR_ERR(info->sclk);
-		goto fail_put_mclk;
-	}
+	info->sclk = devm_clk_get(&pdev->dev, "sclk");
+	if (IS_ERR(info->sclk))
+		return PTR_ERR(info->sclk);
 
-	info->lrclk = clk_get(&pdev->dev, "lrclk");
-	if (IS_ERR(info->lrclk)) {
-		err = PTR_ERR(info->lrclk);
-		goto fail_put_sclk;
-	}
+	info->lrclk = devm_clk_get(&pdev->dev, "lrclk");
+	if (IS_ERR(info->lrclk))
+		return PTR_ERR(info->lrclk);
 
 	dev_set_drvdata(&pdev->dev, info);
 
 	err = devm_snd_soc_register_component(&pdev->dev, &ep93xx_i2s_component,
 					 &ep93xx_i2s_dai, 1);
 	if (err)
-		goto fail_put_lrclk;
+		return err;
 
 	err = devm_ep93xx_pcm_platform_register(&pdev->dev);
 	if (err)
-		goto fail_put_lrclk;
+		return err;
 
 	return 0;
-
-fail_put_lrclk:
-	clk_put(info->lrclk);
-fail_put_sclk:
-	clk_put(info->sclk);
-fail_put_mclk:
-	clk_put(info->mclk);
-fail:
-	return err;
-}
-
-static void ep93xx_i2s_remove(struct platform_device *pdev)
-{
-	struct ep93xx_i2s_info *info = dev_get_drvdata(&pdev->dev);
-
-	clk_put(info->lrclk);
-	clk_put(info->sclk);
-	clk_put(info->mclk);
 }
 
 static const struct of_device_id ep93xx_i2s_of_ids[] = {
@@ -529,7 +505,6 @@ MODULE_DEVICE_TABLE(of, ep93xx_i2s_of_ids);
 
 static struct platform_driver ep93xx_i2s_driver = {
 	.probe	= ep93xx_i2s_probe,
-	.remove = ep93xx_i2s_remove,
 	.driver	= {
 		.name	= "ep93xx-i2s",
 		.of_match_table = ep93xx_i2s_of_ids,
-- 
2.43.0

