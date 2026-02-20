Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ECD34678D
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601791; cv=none; b=m88pX2FYZS0wm9yoLk+8zX2/bFyYM3SDl6nz+hFuCsiVEtt6c2twEZfQJltgXXIjjjp/df48vpBjrYKwcTAezpUwJCGSq0k0+7WG/A5ItMIwFGLZTRVwT/gRSLwj4Wv4rcR1EmgUVUbYdPfUDC7jwwRpm6EQCFyvoQM+1py7Krs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601791; c=relaxed/simple;
	bh=iOFnXiCigzajlM0ve9dWnJVkEhliaAcK0k3M2XTwSxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5II+Sg1g1eh4cGqzJccX/0KbtrzLPGbuZGT5a6UvUMJJRv0lkTlx3w5y3PVSMx0FyFKH5UzvGNIIs4calBnq/bYfV9xHCGKEpW3k0qvuHyb/HybW6iXQn/Hgcps95AbHbArhvOZNaBw0t6ZEUf/GQsuQVXmdAugAgs3QjDrUho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Gk2HYX8t; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Gk2HYX8t"
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id D41F36E8650;
	Fri, 20 Feb 2026 16:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1771601205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSjyJG1a1afLJ0OjvKwPwz19/SY4aTbeweheAtadhUc=;
	b=Gk2HYX8tUqEPwomxzJumKdXxXBVunOwyrf0PAOs7bEykX0bCNafinntEPjcaIGjyQNOep3
	Vv/6H/9/MG/ZhYz2XZ+5qQn9SxUND7HWhCfZWfi0u2iHA9mgZfY5M446xweWw2KC+WXde4
	fi7uTgsOLJTtNTfk2KAuw40U6rIC7Vr0JJKLq1Ah/8IQBY/ROkV2Bp6Gp288uAULPYObQM
	m3XpOS8XqQ3XG80nlzdkshmsjxHkGSW+Ev1tOOCpyXLscxKHbAE1UehHs0PXCBFZanTX27
	jDdA0BODHeEVXe8+plYPMPoMaHIQU2GWul00eGv+3DFeewSOC21sXz1kGL7BBw==
From: Sander Vanheule <sander@svanheule.net>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 2/2] ASoC: sti: use managed regmap_field allocations
Date: Fri, 20 Feb 2026 16:26:34 +0100
Message-ID: <20260220152634.480766-3-sander@svanheule.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220152634.480766-1-sander@svanheule.net>
References: <20260220152634.480766-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap_field objects allocated at player init are never freed and
may leak resources if the driver is removed.

Switch to devm_regmap_field_alloc() to automatically limit the lifetime
of the allocations the lifetime of the device.

Fixes: 76c2145ded6b ("ASoC: sti: Add CPU DAI driver for playback")
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 sound/soc/sti/uniperif_player.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index f1b7e76f97b5..45d35b887e4e 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -1028,11 +1028,11 @@ static int uni_player_parse_dt_audio_glue(struct platform_device *pdev,
 		return PTR_ERR(regmap);
 	}
 
-	player->clk_sel = regmap_field_alloc(regmap, regfield[0]);
+	player->clk_sel = devm_regmap_field_alloc(&pdev->dev, regmap, regfield[0]);
 	if (IS_ERR(player->clk_sel))
 		return PTR_ERR(player->clk_sel);
 
-	player->valid_sel = regmap_field_alloc(regmap, regfield[1]);
+	player->valid_sel = devm_regmap_field_alloc(&pdev->dev, regmap, regfield[1]);
 	if (IS_ERR(player->valid_sel))
 		return PTR_ERR(player->valid_sel);
 
-- 
2.53.0

