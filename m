Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB311A9F87
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081143; cv=none; b=lHAGw+XgaVmYPUTjuNpc8CrNycs+CQ1uNFVUOf4Mj+XZKI58IwInyLqqGDage4iYBLj9qkeJZUczjXjS3xg5ShaOpEkxYyIxkiQb0kZpHe47cAWgaIX87neGNv838qYMbH07WzgixtHUX3RDkXG4E8koE0+m/ivcTLp2J0tj43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081143; c=relaxed/simple;
	bh=ogWqg6oWczQKeONUP6X+jBTzfEY4XriMHJr6ybPCOOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7Mm/3MVkh+8uLnJSI7o3quR8jHTVg4K1X7wqbiRZlNojhqJ+zdNdGAeMh+DrM6i0qc510qYX6ncjuNGVpPJCTlsW19BxzLYeJ2/oQTqk/vD6bZ8ZH+mnBd8bpr5eiVvtnz9X5n7lE6z4PECL91AQU+AXskiYVvLu8wFh5i0UHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj218eHd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj218eHd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b24fede2acso753335ad.3
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 15:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775081141; x=1775685941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKJ4EBGQNHpCdGraAAnQNk15tqvANYFRUGyQCrvO9ms=;
        b=Hj218eHdtlRkA6hcrJJUY3gwS2mu7t0xQnTiypBLVUfeIelbJNFubvcihUO0H1UO6t
         lKTFHWWJBD9sgqlCzLSNJcUdDkhKu2DXiTNkksUBxN3srhDVlYW6TKsCcjTGkfKW2Iby
         yVp2vqGki991+l5tmup2+qKPBpXhvaLdTCnlwLt3lO+3IUBu11OQPGhO5dofzBBhwT+R
         vsO4Fn6EIKjtvbKCq3R5NUPbewsoLbxXp93V0FJ9f6zq5BLw7+YWyz+0GTfzQJ0sXu2o
         4Gj8hGcw43pS4YOW/KnsKSd/UNb8dgJ4+XJWrkZBGWlkUcXIif/8Vo0tyo81pStZfkKm
         tC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081141; x=1775685941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKJ4EBGQNHpCdGraAAnQNk15tqvANYFRUGyQCrvO9ms=;
        b=JU0RwbnGL9XNRXJB4TNtA25kwXt35B4HguWn0fx8KdqbbQxEz8qZXMerdkbDmm60Bo
         E/Q/V5yui2WxJzDRmKa0Tr45Yv2SdR49SyMp6Uho/HjBJKQFyevfALMRtmXEnJvVlK41
         svZvvEw3mkGNWjPccjOfpxMW+5qDD7NZVbcs1iBbokKol/Zg68gC6ur8QvdnrkfGX/eO
         y71OdfSjOwct3iLGW+okAKzF2byTY20ZXU+TTLzjRxg/EIYTLY1dtVoHrFsMDm15SJtT
         K5FJ+3/x1EnQ6BLPgTd6EwaU7rnYReO8Pn+Sr0XYggazQYtdRwlVAs8rrqsMzgyNTj0o
         T6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXtL4/iqTOnhGoywxz57JE6CpVV3f9B5xCuZzkgPDr5GW+Z6Wv3QT4akoR04x5MMKK3HjIx//PHv8DI2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83/6z6E6TTJWuPRA1uwUhYozuLgHVIdSFhUNE1BwIvGmJinXK
	PNEaIDMc7Ms0ugVdC3d/pwWCS7+7I/vGnofwMyWppxODsQmrlgJ0wWQb
X-Gm-Gg: ATEYQzwWV9FiLJkmIpKJrqJf6oK/L0fqiX6d8ySzbeXFxDeqSxmCQ3VsnJVo65XwP2Z
	94KjYrPwgGfEbiZgIJdpFsajdIy62aXJq32qDROqlMaZPSpUA7/Oo2y+V58L4d8mXvdjiThyQvl
	u3wI7zinwT6hmAGA+VzhDxzOJtYagM7qNh9Oc02Po4/L2ZAGw52y2eNCGGtBuM9Q2Bw+x+Siy8p
	q1js83pdqMmwqaFh4xdydh4XxeE01RzkG+WUck01XeHWNFNcrFaWOYl7VhH3hegKanTmpQeXHpY
	xp6FZN5kv1K16CF4hy6PD1a5clPP0QOGVnoyQCY0p0DK1TtrPhAEn7fEAe6tG/2/NB+Z+a3Iq6M
	RDbqHm7hdebsfvRACd8zpzVlO/ZPDHWOiGuZ/jSwzfSUUpvgGewiv88mkHdM9WVjk0gziumQgd4
	a2esyeqia/Rq2zTSkAxQMQGoTdY0+71BOAh+NS1ByTUfYQ
X-Received: by 2002:a17:903:2c04:b0:2b0:917c:bc4 with SMTP id d9443c01a7336-2b269a9a34cmr49199335ad.4.1775081141337;
        Wed, 01 Apr 2026 15:05:41 -0700 (PDT)
Received: from debian.killsync.com ([45.116.230.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm9050815ad.42.2026.04.01.15.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:05:40 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: cezary.rojewski@intel.com,
	broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v6 2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
Date: Wed,  1 Apr 2026 18:05:05 -0400
Message-ID: <20260401220507.23557-3-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
cleanup call to prevent the clock from leaking.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 68cf463f1d50..8932fc5d6f4f 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -209,6 +209,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
+		if (ret < 0)
+			clk_disable_unprepare(priv->mclk);
 	} else {
 		/*
 		 * Set codec clock source to internal clock before
-- 
2.47.3

