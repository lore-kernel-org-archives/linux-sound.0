Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EBD38F259
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993766; cv=none; b=eh9x+Q5UJjyxSTvUPvXifNGKMcyGOo4+N+MKlUxuqRhjuma3mTeoQXwp/1EFpggIpo3RvWbjuwVxafdLEZpK9qMNRk/uiikD90KXkVUosF6MQ7YbAaIJxXX995dn3lwrFDeBXe9R0euDX1FIRuemP3AyVQR+5uDcJ6i/Be4A5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993766; c=relaxed/simple;
	bh=gbdNai/yyrvBcy3tjk5+d2/CebPxq3UL1AqPKIy6wy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdSpHZOgoIlLvYfma0SZZlvNK5fCpUd4W1OlcfN3sqkWUtfus8mWHggHOjevmAdnkp/T5AXBTaD8U8SnuJEylHChZSw7n5eUoCA9oahwrjU81UMJddSq2qtmM/lVcHX2ZC6q5uMDdHczaHe7VKKoJygFXWEUNlWEsCtMfdkcUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZzOaWL1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZzOaWL1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a652535dcso1204175b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993765; x=1786598565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wed7zRTG0fPLK7b8aSvZs5TBxnd4+YK7ALZwX/ab6vo=;
        b=TZzOaWL14ofpMCN9SwmBxLoyJaLUne/ZWUKoZNUFhMjNmGCF46oz8s6CsxhK+8wgmZ
         nc/AyoTCW/8kbEXgYyOVRonv7XEwAueaDJZDp8jMVenSCk6N6vKwtH0nIH0B/VJiy1G3
         8eBwskyQmMtyCxKhhgYpDTjuIlbqsMsnyKROjdtifjvIF7t1f7GbC7k7nl42fByn+ZEi
         fjqOwWqdKIEIsbtyj2+mbckr0UpFka4OjoZ9eVffyyAeYzS2uubCbNo9UIpVpWAt4YJx
         lEtPrsPf978MwPr0X3qOcc81JTl9fvebTdqT1d7q1mFJyDVw9ikpMy2CmlSleiy7TQ+O
         L28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993765; x=1786598565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wed7zRTG0fPLK7b8aSvZs5TBxnd4+YK7ALZwX/ab6vo=;
        b=ZWMXdGVSTW9/zB4Duxsp7zQgqr8sVsjjQRMbUsVRnR/PLP9ykIOTvfPlq2qJtV3WDd
         MmPKc/3jH+J/R73pQHNU5t0UX3TjUoRazx93hdF9GPXbXQ/izymjv2i7gpujMa9fj51L
         WIv/FP2QFIFbMC9nzsSjfxjdsM6fXtm79r/O8/2yMXRWa4nys59J5WDQsp9VlAbUv1FW
         kpAWV+tELEC7orRADxNPQA5Hf/TVLyimDRl2QE1DC3g88Du5yFdVbK62z1a758gAUCAx
         c0ImVbRB5xUZJ1AqmhX0jeJIHAhwMI8QwBpTQ09r5ezShGqF/LVSjPQVqbD2/PFjKSwR
         EqZg==
X-Forwarded-Encrypted: i=1; AHgh+RrrcMtDU7gyvcNOtVT4JXNXmioUCMHEYUIeo+jbt8U+GDsJVqavo0Z0ZU4OwUPJrZKONGCimVc27ZACPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhqejBSGeIca4NQGNrdjpu69rXHvO1AfdWfQjccgRXdiepjXon
	RShFwtzlUqySWnnVcy1xhwE41/ID70oSunrstst7prS6k2brtSiOE/lt
X-Gm-Gg: AR+sD13nB3cR3vq3EZkVrtDOI6W8vVvf2ikNNUfWYstk0NgpW9EDGOAV8rcVu4B6HUn
	dCHyzW//yF8fD5y++FnKhuNtUNPAzHh0MmQmXxWHwX3eQcrRcQitI3nJkqGwhijETf78vV9VxvA
	QMDNd0GUhdZqisKp/OlcKwH5HDAibC/qvAf4f79SSpAIXmNxve3+5OQk15CxKNju2PTuadgSqUe
	kfDqn602ST+5QuPUMlG8Omgigv0twQm+v3l+vRyrroNnd4aDjys8FZzFPnxad+2xBomjnrDUeY1
	WwyeuTEboioz1Mw+BzwAGs5DXeS/c9HXoJFHdYwjq4coEfKUEABEO6Ty0O1kXuMA6k4svlyPoNG
	k1H2gDiEkapSF7VZBeaRVnG5uc3c9tFIcKWPPrU/gQJiMhDNJ7pCOwxnIXeNu2YsYcxanRFYC5m
	GbDEj5fzAUkfbIHdLDpEbqWq45claDimcDmCMX/QYuShDIh6XkYLPnh52DYAdvK54dKh0vuktpY
	4gbOpehNyGVSHfLbSYD8r6jwo35y9D0xhjca8xzAL7ZPtxN2NbrFjTn9BEI2hNZ4Ir5MhyZYIOo
	FPUHM1fNWeQDsjs=
X-Received: by 2002:a05:6a00:a226:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84f2e13b00emr13190693b3a.36.1785993764917;
        Wed, 05 Aug 2026 22:22:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/14] ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:30 +0700
Message-ID: <20260806052136.21034-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 075d0990a126..426506a8e18e 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -428,11 +428,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
 	/* Parse card name. */
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Soc parse card name failed %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* register the soc card */
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.43.0

