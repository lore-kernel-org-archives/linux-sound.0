Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B638C406
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030510; cv=none; b=gDhwS+o5+vdS42X4DJlib+O0BYelf+9oFcp2/fxQn5+esBpyFMbYvm4MOlzhWYXmcJD2dti9HD1oPg5U7B4cOeIYwWUoD8dQybzW7tFBF9IC3xqNUQSvaP1PVj8G8uQxFt+ZEEh2c+I6ehf+vGeb/7O3Achwu3AHE6/S2Vsq2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030510; c=relaxed/simple;
	bh=57NVq0S2AlHmeh0L3SJpPKysGLjaiNdhbzGWZRlh98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUGEQQPJ8Kc/BRk/vP/PR8qwr+jNTm+23WCVBVd944KD+9VEImBygnk7yUh4mxRbu0gIr9Fpa7MqkIBgNUGZQiaJ792tXqLNOJr3WgGdXrh5tfLoBXFrkhT7ey6F9roSpSmKr6v0NC29lX3IQ30Cv4o0GrMjieZiKcRQ9hafcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCyDn4l0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCyDn4l0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so806278a91.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030508; x=1784635308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAFG2wBH9r9TrXOu1Xguqk4pZPLZGhj2LPXn115L7c4=;
        b=fCyDn4l0xHubwValWrLKKkd4agGqrr6elKU5JUUO4KnWA2A7F1tvtRMeqAhGyXiV6I
         99wMxaoWJ1yyUFRfJbEeKsoYjDvyk+ZgyKNb0sIWjO1kVdi071/IWY2D71dJqKvVvGHD
         3sg9HpNEj/iyxHsa+GohRxzeYG6Xk1VL0KZqsdWC2wZbMaqO3y0gCvLv/Ka+9r0cv5Ue
         kOrmtoWKJApzvF4sPkZ01CAKrhpBfIgeU1yIYdDDtculUj5FZ/SZu/6Ro2WPnlThhwqQ
         vVzr1Owa6LPTGXfB7+y2UsjhLtFSARuXtO5DUB8kQRBxWWyGuh0ZkNGWnLDp+9gSw3xJ
         Fd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030508; x=1784635308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAFG2wBH9r9TrXOu1Xguqk4pZPLZGhj2LPXn115L7c4=;
        b=DT/49ILkcp0zNsgWFZxg8L/nQEttXMZshwpTEkvH6j0FDbs0jomnDWjPvgxfbYNhjR
         o6GYXwume7sKy5LZEJ5lyHy0Fz9TXknB20aUk6Q8NQdU/FQnvggNlPjRyP6qLI7jH7Pb
         x3f5OC74URx23HNQqLUiMvKXxh4Donu5NgpLXTMOPM9KsSKyL/21HQ9ZmKhOHa91CgMk
         gCoueZsyl4E8MQT39aIU/AyUuNk6ZW4UcC0G99Hu6JvMbbLXC4R0VgwSq64v4gazxG2O
         XO5VPXVnG55mNAgshCNGRrpk4xm6mNSWvuD4yTUXEWmliTP2Fbsp9r+ppvFNBpiTu1IS
         Ke3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrAvt+hmH/2ly++gA9HL/gH5X8u/nTrINsP69fgmX74bGgbZ0Pn4nYpzhbXsEzND3+Bl3/oo478oiIJqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yvSUy1JyjzKwXBWK6xvEL8UJT6djv48sn54nIr4BEgWUg1oF
	8cwfAojHel9qbu4/iA2m1oDC+dnsWMOmEE8uZG/+RnnuacQcy6GNbJNY
X-Gm-Gg: AfdE7cmowjJrjfTIQS0FWbaGWWe61eBQXJVxnyMUL8fyB8GY5dxYEJyhcXQ4Ohbs+ZQ
	qWj9p/CiyRttlmKfnCTvVFjhdgWtV6m97BAJ84uBsj4rHPkUVJWAcl3dAiYy3aP7fKA88Y6ioL1
	mzvUARSoOwpV53ZA34YP5P2BEjAF+7Bpw/hvsOQhlLtUMCehAFOZVxZw4s6RSVHXvOZGMJH2W5L
	GA0raYoI90TTQ+qKQ0VbF8hWVtdh03gvHHzgUILgbRJxV/wC4uaitofW2/kI/cK2wY0FehWw1DS
	TZkRAt9lG4JqqvPsxPTNa3iTyKtQT0Y5C4R2A5nbR6GqHZcFVmWMGy7mGXBCrEcRwUdBdDA/OFw
	b/330qeB66CuLv1cEQZmSvv4sfpnOijp5US5ZTw2Pen+0PiqVE6nuahpM90gLHOq/3uOlhQSTYT
	f2Kst8xl2paP4UgD44NwHpvX2Bp8biNfXuhp7QILONma8EmJE=
X-Received: by 2002:a17:90b:5626:b0:37f:9cdf:f03a with SMTP id 98e67ed59e1d1-38dc7b85e20mr12463148a91.29.1784030508278;
        Tue, 14 Jul 2026 05:01:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:01:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/10] ASoC: ti: omap-abe-twl6040: Preserve error code and drop redundant log
Date: Tue, 14 Jul 2026 19:00:36 +0700
Message-ID: <20260714120042.491712-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original errors from the OF parsing helpers and remove the
redundant error messages, as the helpers already report failures.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 56aa4b22083b..dfa931071d81 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -234,16 +234,13 @@ static int omap_abe_probe(struct platform_device *pdev)
 	card->dapm_routes = audio_map;
 	card->num_dapm_routes = ARRAY_SIZE(audio_map);
 
-	if (snd_soc_of_parse_card_name(card, "ti,model")) {
-		dev_err(&pdev->dev, "Card name is not provided\n");
-		return -ENODEV;
-	}
+	ret = snd_soc_of_parse_card_name(card, "ti,model");
+	if (ret)
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "ti,audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "Error while parsing DAPM routing\n");
+	if (ret)
 		return ret;
-	}
 
 	dai_node = of_parse_phandle(node, "ti,mcpdm", 0);
 	if (!dai_node) {
-- 
2.43.0

