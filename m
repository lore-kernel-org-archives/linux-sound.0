Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE16B361962
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 20:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740624; cv=none; b=p5bHLffwvKZtpyE+df+vYafQ4gTp1dJTBM6XrEvMIJQ4iAMf/my7bgAsuUDjmtYs3BmXmPRPDUEzxNEDfOXBcLzwXdKuYVMW9VHT+TMDm+lrqX0neiNzVLCa4j011ElJQPWwzP3HjACSqwC2nZ6v5aOvfDW/HGaYjCdh8cxYlZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740624; c=relaxed/simple;
	bh=rMi4w9bWMPExIySBKpF7SkOspGEwb7Z0hkdpUDOjUlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmT3KL7qogy0HVmBpc4s8dceP6kHluvYEC11m+cUC8yootiOHB77vd2KugsCfH4lR+vyPlC5l+D3aYEo1ZuyNZ3skQzzB+ZRxScFzBqFdTQEsQwLF5f+hp9JKkRCJN4aFqU4C0L6i2IiDBAzILxI5LkL+AUnsbRNQNk+7Iu7WI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kh+e5L82; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kh+e5L82"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f032b47e3cso8071716d6.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740622; x=1787345422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkyHHjtATixIyw1Bw4ttBRBk5AVQgrYPiJnEiwLvP58=;
        b=kh+e5L82YtZkIHrWygVlduAiBZfJWtjGWir+ZpalOOD+g4rlAiaEjeY2e7lBf3fZ4a
         KveNeY1eX4rN7BdCjft3YyDRWrojdwbh1TNhoXEgaIyPAdpPyRTjyI7/4Y4YKXbAmTcT
         Nd3Q+9d9Xfv+a6wQvMJzoBddmGgi1rSE2J9c45gTek12iiqf3k3WhYTVP88a7C9h6wNW
         NqzGh+0LJ2wgxIIAgmP/wzR0qiHcbx11XuQsFb91lCbPJldn6skVQA+yL+u3JYxeQi9f
         MWjuT+u+h/jAyFADPqYaHpA4KhbBRZGC6vZHBzU1EMPpnKE0s2gOKk+asT9sXJIbc5ov
         8TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740622; x=1787345422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkyHHjtATixIyw1Bw4ttBRBk5AVQgrYPiJnEiwLvP58=;
        b=pjARC32yAopkEBGuLoe69e4GIFH2h3Gv3QHkEJ8GpfrkacULVfN6YJ5IUusz4N8R9Y
         GH6/EnpIGgVbIzR5WoS7dV2Pgpr9Wpc4/mMFWEQkdohRkwG+kvFmxesJNj43p51qBKX8
         7UgZbNfjNf/RBSM+lTJOUm7s1guRRFqfT3416a8woyV7e5xiNi8sculCYuUqM/vMb564
         yLx6nuKDMqKMd5DBFnDZ3Ox4I+FqMKOghVOqR09qQ4gyei4AJVhASbNYNCkJE5N0ctTs
         QC3U5E8R9zb/GyNtecl2WDZo+8Vwwetsr8l7KnbzvKVu4O5KA3ah846MKIxDZw6zTJdx
         TUpQ==
X-Gm-Message-State: AOJu0YzWUMOt0tQQ3Gc7mGrbwPGtoU5j1Y/Q+m+j4BTuXRFMW1RFqKZp
	4jfpYK2yUBg5XICsPNxoA5e1Kl2W1+7iLkHd5ZQywm+ffD+4dI8LNjnHpCOHKQ==
X-Gm-Gg: AR+sD1336bRz2PIAxD0jBHJzt/Hg5IqQ9PNl0g56GhDfg8ckA82oQsK+TnxV1UKGVTm
	YuhNIFSuCMVef+dMkkwQ4CPL55b3CKEN1Chr4GMWQunCHna95fYRuGzRP4X5AaB//+tzK7ee7I3
	nRRuhmFUH0j5MfVv74bdNDx/xVmx9497DUWjROKJbA2WNgsA4j4jSSCEhVlkEG0djMakLhzWqCK
	c/lZY24YwahDbVATqETPkl8iGEcv899BwaT3jlTTr6V4jfFTcDsdQVV5ELH4+wO+FJ3TwRIyal/
	ZNzh9I7l8KukzFF3uIVEF3D1JpkZnGxlsgCejPdWXBgb93Vzk/bJkpR/ptmmO2wdM8/bNs2hqpY
	/hkSlWq0nG+t2g/CkdXy3wvhyNL9afx/8DoCzH4wVcZvoBx5re3rbybEN1H45stTFMB315j5BBV
	DnENSBG1HN1Ml07DgU66/m19gqBMgda0TgU8pvFIkIGB+mDPy7ENrwszAH6QxQ0phIZf3F9Zas0
	OgS8vk5843ZoBuiNqMg3cs4YxjGFkhmNsGHJOPZA2nTji9qc/SO/xd/uCb0kaXexDwHmCQTWKtq
	L+uS/L+WQ53nDfByHAbStvPVZeq6QE9Vn4K8/CCZ8tI0zrlo
X-Received: by 2002:a05:6214:246b:b0:8ef:76c:cb15 with SMTP id 6a1803df08f44-90a91a470c3mr88262626d6.0.1786740621594;
        Fri, 14 Aug 2026 13:50:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a935900d1sm25215526d6.42.2026.08.14.13.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:50:21 -0700 (PDT)
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
Subject: [PATCH] ASoC: tegra: ADX: convert map to flexible array
Date: Fri, 14 Aug 2026 13:50:18 -0700
Message-ID: <20260814205018.39015-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the pointer-based map allocation with a flexible array
member and use struct_size() for allocation. This simplifies
the code and avoid an extra allocation.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 12 ++++--------
 sound/soc/tegra/tegra210_adx.h |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 9175598b52a7..d607ba4233b6 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -677,11 +677,13 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int err, i;
 
-	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
+	soc_data = of_device_get_match_data(dev);
+	adx = devm_kzalloc(dev,
+			   struct_size(adx, map, soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD),
+			   GFP_KERNEL);
 	if (!adx)
 		return -ENOMEM;
 
-	soc_data = of_device_get_match_data(dev);
 	adx->soc_data = soc_data;
 
 	dev_set_drvdata(dev, adx);
@@ -698,12 +700,6 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(adx->regmap, true);
 
-	adx->map = devm_kcalloc(dev,
-				soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD,
-				sizeof(*adx->map), GFP_KERNEL);
-	if (!adx->map)
-		return -ENOMEM;
-
 	adx->byte_mask = devm_kcalloc(dev, soc_data->byte_mask_size,
 				      sizeof(*adx->byte_mask), GFP_KERNEL);
 	if (!adx->byte_mask)
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index a6298c3dcca5..e5f1b44b2e76 100644
--- a/sound/soc/tegra/tegra210_adx.h
+++ b/sound/soc/tegra/tegra210_adx.h
@@ -92,8 +92,8 @@ struct tegra210_adx_soc_data {
 struct tegra210_adx {
 	struct regmap *regmap;
 	unsigned int *byte_mask;
-	u16 *map;
 	const struct tegra210_adx_soc_data *soc_data;
+	u16 map[];
 };
 
 #endif
-- 
2.55.0

