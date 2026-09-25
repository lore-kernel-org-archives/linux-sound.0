Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63413C818D
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311827; cv=none; b=Tz6Oj4xJ6xOw7fIzsps1Uq+y5cf+LezPHURYwvOlpfOQMLu8yThCCKSrCTh/zcZeIatTxC/MYwC9h/USnIfoAT/5FNGlSRXE9jRwFbaDJ2AYHXTwlaur04XEUZyZ0tKHhC+KMsb8a7jNH9yO6NeBeiJ5L7h3pvoW5OfZOUMWnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311827; c=relaxed/simple;
	bh=ftxTR8on66uxbSklw596OG+y/YWB6brt0oLqdp65L3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Om5tLoHm3Ghh6LQtCDBoeyDcUkfZ8AU8eQbYSLJnwuPSgQkYckLEQXF0cFdX8FV9aEZKXr4OfXiu/djC3l7AFCWsK4Xm5WKn0RvZm35fk965Y5tg+c3G+jLZ9cukXWPSqGDmI1FX6yc03i8YSoVHy1Z1JBSzZS5PURVWbasbPyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSVB4gWJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSVB4gWJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so2954135ad.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311825; x=1790916625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=HSVB4gWJ6ZayUSzU4JOvDrRNYbfQrllCCkQuHwaIGNA3grXYxnAmIjEFPdzhEnKqTV
         mZIF9HLdLwkXVcONEX46JptSD/acgo7/HaiS3RQw6wLj47agPQytlKHTik7M/ifIEb8v
         NqN6uvSHjQS09UKNuW+eshrP+nqTZBSzVAx379ghD4EhIpUF7sQwb3EyFk7r2tQ1jT/3
         IcDyFNj86m21DJvOXsfmdALXx9lGeobfbHSErMDS/SMJ9EKAm0gcWzwVYZbA9u5Shecw
         qKYDGauWkobZ0qwhrW6ZOI735AqL0sRrG7PTEYXRkzwiwh0deFux3wRSi7nJRzkJKlhz
         uRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311825; x=1790916625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=bU46qjaGPbWxkt0gg6Q6jxx/rTKPQlPGeniupVz4vGSMN8S2oTCkfEphpf2o8iWu7E
         zV9v74dGLT3dzfPt528fNq6effI80ect28BEpxy4c2tB3e7vD2pAUi86ZoGBKNCmqTNf
         vgENm1OLwHrUcW0s+bAbnxw0ETCM8ibcjqCQXuGXkkp3FrGMKkyEvz3i1j2ry46ClFjV
         RdLV+FMdzxN3JaSI32gI4YnIb8dE3pucRYH8z1KJpzAYtZKP5VVgERCdl5ObuNH6GUhT
         QyGqYrKWyfpg/gmGe2UT2Sx8sHULTmGP8GJPjxjPbl7Anoyv6lgqbI9KFisBK9+8kEXH
         02lA==
X-Forwarded-Encrypted: i=1; AKwUvBz+8VDIgRYhOk70g6ey99CP7p6v3EMgZjXhDJUOPP6g2uGwboIlsXoDCJn4/kEmgjlAEj5T2f2zY08nyA==@vger.kernel.org
X-Gm-Message-State: AFuF++ks0+wnGNFvL99qkkmJXv+rvhSbUz0Qwzcle+yuSiwJgpCcVlap
	6LWpcCOq+roD2Bcet9/2t/20bZdFzOOO+fOdBHxKoAxuGutg5sqtOhXm
X-Gm-Gg: AYBFou3i3zmUcYHi/bVwgspwLpXCq9iVku2EzWNJRD6vACfLbsOnD9L4vj+8qrM10pi
	04/M7pW6vhu/FbLzVuA15fgw50CQ76GIken9CZtBbYX8I3usUfKPHdMVTbHIp6r5PiY7V5aJoHt
	2N5FZR084sxMHiNrjVtUSPoZVf0BhbiACkwIe8yF9w/n9Xw9lRfC2meFWFUUJwqmbZsMci/+ioI
	7+Ot3wnwiJ5dITvp9kd6TvP0DhfejmXOlJnfq/Wco0FSkLvyozrCD0BLVTJ5pIWOiRi5ODJchyC
	qBit1KH17r6hdFu+bj6Wgoyll2UX2biBO17wfFlJEQwaMzeUb9NeLHHJRQvaYvOY1VEbDPclzEc
	zY8mxC9NozuXZlOR/dJnGvH7UiI8KiJY1bUW3enPLhsNTQF0GX8/iW+9numpJQSVh74gqApKpeQ
	kUd6FMiYF7Q9eRbHodgycAwVqCQuSIBnoC69M0N02jWK6X4UylIGn3RxBmdv4S2KoZA8OnV5LAN
	RDx0qrK41MUGKnGu6sSVWYPkkTN4wriRGiW0cc3M92Rokzq+vzXZsaqQO5cIjPDgYgwH5cB5r80
	0xsgCE1R+Nzg4w==
X-Received: by 2002:a17:90b:2c88:b0:39e:b15:7950 with SMTP id 98e67ed59e1d1-3a0bb5789eamr919112a91.23.1790311824883;
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
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
Subject: [PATCH 07/14] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Fri, 25 Sep 2026 11:49:01 +0700
Message-ID: <20260925044908.450775-8-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 5e76625915a5..be150c0f5472 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2958,18 +2958,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0

