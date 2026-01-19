Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B702DC32A
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852404; cv=none; b=R5gW1AHC4akOShNwwhocmqni2lw3Un56SskPaOwWjbPiE/nIfAO+MHfuCS5NNuea8q0uJ3MDVxrl8zmV3NnqCjXSr2sfAD7QpPPmaCBJvjLf74FsyMAoPUKsZS2Gxa53uv9V9fyz0RRfB6XAg832xPYwIeLZorcEmNWsBPta/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852404; c=relaxed/simple;
	bh=OkSIcX1TDdic1UCogaglUYNDHLLvjkuOMxDbsuQWufY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pL2VH6nHQlsyWRLUdlxJgD/NXC21yU6Rn1MCOs+SraOC3tkNoorWYZyZTEreP8J86L1rQ6bg/+0KiLqk8UEhEV9WGizL+QH/gN5M/jmnuR168hCdq3UrIzp81YcmbmU7v3ASRrWW3sAPTwxpwnZv+BPomKG1usnyYG/4LhgqmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D7ymDlD2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D7ymDlD2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so817903966b.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852394; x=1769457194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFLMF0ktRrYnvXvDNuXEPfc/Kts5kt/g8ss5+3byzFE=;
        b=D7ymDlD20jDqkMCgzVm6nMMpmIFYd5wNCzelk/+ogD0CxY3Rn2Yq3Y+LPWw4opHe6A
         gIosvZdxmi3la82fQSuILCEW4tNtwfCbwwQ4h57ZqllJB7YAhLtsiSzWIVbJGJjXz7nn
         G1ouviBl2A9nhoNm+EidcStHPgKF+WhwQ2miJHp0UTlyLSQXwrHx52VvZancaoavvcA5
         M+YAmhHypEfJny0UWBbry9Fq3jixOVBIK6On6WvUraPk0uBFL3t/N8KRZ4k3QJM401Cy
         PSnmt5HazzxHM0VSWE4vypKGYYS/3dZJfcLq2dlvqZ5cjoLnqNsgo03LEffCyfthlx0x
         00nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852394; x=1769457194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFLMF0ktRrYnvXvDNuXEPfc/Kts5kt/g8ss5+3byzFE=;
        b=OFb633Tgfeu8/fYGNB38ydL8dHEVCYxrk4dMbQsLZzC6pmLFUKm5yneH/tyacrNGCB
         8Skt0zSEhqR8yZVGrY/pDBApCZ556Ip50UvxtodjzQuob5yyeEb9YMyT8Lzh2Gztlgdn
         N6YF7PiX+chreOgQ9hl0lIJH3iQZvRrA3DKleSiYBI1KI+z0o+eGMubPGweBXPVlXf1S
         UZlYPotuvw46nQiWu4s5VQpeog3MGtbI15GCh3Zzn7KbZnwbN8fq58Rq8dpISKnbTQuz
         ly2XhUjwe7Bomw8IflZW1wMxUjFPIGphLEpIJxbeEp60nXNrFKbotSNuTZbbqweTzFe+
         xgjg==
X-Forwarded-Encrypted: i=1; AJvYcCVFm2tpjGJpRKWRttd0L5ThU0L2oN/ttcH/sw62pKFhv7zsTjus/cqevR7cLUVGaqbjo3sPTTyOlby10w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdnc2bIqO9drjyxcB4NtmbaNbZIzKoX83jKKXKQym8uwOnvhwt
	M9efE4HrWD8dVqNd7qN8VvGikFi6XOnYgoTf6XYD+ZV1vlnXeufWRYc8xWf/DXcOFcA=
X-Gm-Gg: AZuq6aLRtZRopwEJ6Z+Gh6sAmv+9GdyPKxJHd8j2wv4+P9EnHRgLH5KfsX1ogazkY9G
	eTLoLpspUpKEPeexw6JZ1MyCi5uvxu/wcMcVS4C+YRjIXBrJ4O98woXn3SP1lNQdSRproDpLsY0
	1tN3OrjxL2mpo+xDvgFrAVDa8tWYqILQRVqLRKElzdPzGT7XwbskhHSfZsDqNE1jhL3FTh1pyL+
	LpGNweqkltM6GT+KxYPwaR5miD3izxtZidthfhbnmk5/UfwbYo/Y39hXBqhonsPZpMUCANj+FzN
	HdP6LUJdMhLO023+U8m+PXXtN8trfhGAQHNVjI+1Ck9w6NkcqKWrfWE+4bK+WsCrrnaVqoFaCJy
	oPTp/4foIPaypUVWlhxHNNOej3NRh83GfHdeG7rewJXzT4JGHBASP7CH6YZuvtaXg5Y0Fr1zwyM
	vFYsbksyyLXeM+Bi7Rjp9LJRmLMkiSKzSkufXW2qo=
X-Received: by 2002:a17:907:74e:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b8792fc4376mr1132619266b.41.1768852394000;
        Mon, 19 Jan 2026 11:53:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/4] ASoC: renesas: rz-ssi: Drop the & operator in front of function name
Date: Mon, 19 Jan 2026 21:52:51 +0200
Message-ID: <20260119195252.3362486-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need for & operator in front of the function name. Drop it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 694b32214109..76e7f0fe9df9 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1188,7 +1188,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
+	ret = devm_request_irq(dev, ssi->irq_int, rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "irq request error (int_req)\n");
@@ -1205,7 +1205,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 				return ssi->irq_rt;
 
 			ret = devm_request_irq(dev, ssi->irq_rt,
-					       &rz_ssi_interrupt, 0,
+					       rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
 			if (ret < 0)
 				return dev_err_probe(dev, ret,
@@ -1218,14 +1218,14 @@ static int rz_ssi_probe(struct platform_device *pdev)
 				return ssi->irq_rx;
 
 			ret = devm_request_irq(dev, ssi->irq_tx,
-					       &rz_ssi_interrupt, 0,
+					       rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
 			if (ret < 0)
 				return dev_err_probe(dev, ret,
 						"irq request error (dma_tx)\n");
 
 			ret = devm_request_irq(dev, ssi->irq_rx,
-					       &rz_ssi_interrupt, 0,
+					       rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
 			if (ret < 0)
 				return dev_err_probe(dev, ret,
-- 
2.43.0

