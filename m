Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212621ABAA
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777081384; cv=none; b=g0IncC0sytazNdaSaC8GPskyOSU88cvOsIvqOqpfVXpXOyH7i1XRapsYDJeI6czirU04viLLnBcyolwffAhIXDwkBWAShaR54lCE8V+eGT4kMgYlOlLvMF8pZsD4XmhO9LSlCuY5wWrwmvVvwbVjNJw6wAlgwUbRGAG2KmYTk3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777081384; c=relaxed/simple;
	bh=+cdLIRk7vhwZO1mTjgtO6cxF+uoVQlfIJe72382/1X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uN6wqxhjSugXR1J5/nAWxJYHMYz4Nd4pzwQ804XgpqIiLb9RNoH2ceCossbV2AAQjbXXvhPCy18yVeDjoziY+rP8nEuj+hVmRpHt7HrsGrwcvGYkgswUiObqQv77hEP+1ADkW1NXqzS75tYGlJwchxKz1rvh/UEGJqAQs0OB7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6Gfbe4r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6Gfbe4r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab46931cf1so65640795ad.0
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 18:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777081382; x=1777686182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7jfOZXdYS61UScW0k+/0N0W+wALOe5mQD08+f58S0o=;
        b=G6Gfbe4rwPdKE9yQ1N9dR77SsaGX7INzaTIO5P3JFJHkv6EaucQ/fxW6QlI7+7acCE
         9W7wAh2T+1Kw/PUNRaay4Eq6rcL9YAqS2EkIeY1+O6JYFBgMDWRtHW21FRMOw0qCFp/f
         jlmOlF7AjXr4xpcIz+zYv3GD5GLz6tpuiz/1D97uryvXiKhcuOULbRy2rKoLLWw8oMd0
         ZZDeifch6lO+6weuXgTy5yA49XxnazinE3xGPjBEpRKvst4Fn32zJ+szEiUEr1t3sRej
         9NfkHFScdHDxf12rwpyT9kZawrk16CbJsdN66KPqJ6ulTHmksBuhYvhsRpkjMHjnh1gc
         gY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777081382; x=1777686182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7jfOZXdYS61UScW0k+/0N0W+wALOe5mQD08+f58S0o=;
        b=P3a7c3fG0309leCq/Dq99ImUNWlWNxA+WIgATV5vBL4idYoSFlHuSsEptcrb0zDvy2
         j1N0Gj6wJbSxmyEXQYck/lsEsp5/6/aJ6NaV8pMBPQQA0GlUm1bEP+hnakhe67V89ySV
         rJ585CWX+Etkn1z4tQeD2sr3gYLoCfT+ChM8tpZG31oFrd7+tMOlQqsSJ9fJy4x92XXa
         d3m8gJ5rCk0NAGv3vMsZcDqw/fqjISeJShJYPmAUNFMrxEuzm8QWRD/ALSmZlhlDO/2Y
         3N0i7XZhTg4xrSjXQL3jYHIrmH9Uj9R0eusjHVKTFf4Hoyt+jjWsgckw0hjymOEmwOMW
         dZ3A==
X-Gm-Message-State: AOJu0YyKypNGsrTgUj93OCzFLdiYiZZ5qN4AKd94ilxJEoxF7YHBHJmb
	/CxQWJfqrhlk3+4P0nOgdo+YqWtUFJWw8GDbKC4/JvyqGRbr97KHTWxVKuHBBw==
X-Gm-Gg: AeBDiesBwCVgujU/BGAZ+0ylQpvMKjmqh+JNDttHDGj6kODDSYJNS6YcmSxnCMqVDKi
	ICN0k4U/ylTBiY1x1HUGYcwDVYtMg0IIktl8G7/WdfffnsCRN57/6F49yfhQNYUwop+9PjFhBT4
	Xl03owJst271FkmtdAxfEykckUiDLn2+MwPSeTmgAddOZVnFELsAz/fK4GFphHPwDXTMzS18LzR
	bBD9EtXUq3z4aHof6qVwZu3Pgq6sGjuilibgXUrBCU/cP2E8V1eIfvLO2qP5EYAE4xmw5ozhtQk
	1ljapiABJ2ZPgaxy/C0cG+YwpJudHe626AjmNb9NYhyvLZfKhZIpB9jHZgM+uIwVDQUTQ7eGXd5
	qaERw2yAB+cr6EBgTOQAAJgxx3s0bMXUx1SMMihYtzZiHd76JLqW4vKb4rRnZFTDuo3+KoOF33p
	HFctlMp9I5Q/auzJdzJuDUq4ol5X1UE14xKBScbAF+5shLkv843wmV9n4OuFLD+L9YOnTjItjM7
	tq97BYXCqN2F7PDdri8cpP0ug==
X-Received: by 2002:a17:902:e748:b0:2b4:5d0c:7a85 with SMTP id d9443c01a7336-2b5f9dbcd42mr318493365ad.3.1777081382212;
        Fri, 24 Apr 2026 18:43:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa494e1sm235306615ad.35.2026.04.24.18.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 18:43:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: tegra: ADX: simplify probe allocation
Date: Fri, 24 Apr 2026 18:42:44 -0700
Message-ID: <20260425014244.439788-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce 3 allocations to one using a flexible array member.

Also use of_device_get_match_data. No error checking since it cannot be
NULL.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 24 ++++++++----------------
 sound/soc/tegra/tegra210_adx.h |  2 +-
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index d2f742ffc59d..3f6c068d00c8 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -676,17 +676,20 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
-	const struct of_device_id *match;
-	struct tegra210_adx_soc_data *soc_data;
+	const struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
+	size_t alloc_size;
 	int err;
 
-	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
+	soc_data = of_device_get_match_data(&pdev->dev);
+	alloc_size = struct_size(adx, map, soc_data->ram_depth);
+	alloc_size += sizeof(u32) * soc_data->byte_mask_size;
+
+	adx = devm_kzalloc(dev, alloc_size, GFP_KERNEL);
 	if (!adx)
 		return -ENOMEM;
 
-	match = of_match_device(tegra210_adx_of_match, dev);
-	soc_data = (struct tegra210_adx_soc_data *)match->data;
+	adx->byte_mask = adx->map + soc_data->ram_depth;
 	adx->soc_data = soc_data;
 
 	dev_set_drvdata(dev, adx);
@@ -703,17 +706,6 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(adx->regmap, true);
 
-	adx->map = devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx->map),
-				GFP_KERNEL);
-	if (!adx->map)
-		return -ENOMEM;
-
-	adx->byte_mask = devm_kzalloc(dev,
-				      soc_data->byte_mask_size * sizeof(*adx->byte_mask),
-				      GFP_KERNEL);
-	if (!adx->byte_mask)
-		return -ENOMEM;
-
 	tegra210_adx_dais[TEGRA_ADX_IN_DAI_ID].playback.channels_max =
 			adx->soc_data->max_ch;
 
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index 176a4e40de0a..4406a4a74496 100644
--- a/sound/soc/tegra/tegra210_adx.h
+++ b/sound/soc/tegra/tegra210_adx.h
@@ -88,9 +88,9 @@ struct tegra210_adx_soc_data {
 
 struct tegra210_adx {
 	struct regmap *regmap;
-	unsigned int *map;
 	unsigned int *byte_mask;
 	const struct tegra210_adx_soc_data *soc_data;
+	unsigned int map[];
 };
 
 #endif
-- 
2.54.0

