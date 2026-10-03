Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54030C177
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054470; cv=none; b=rNVqIuQHMQE6qb8BqiDvzQmwXirmvsF1W9LEZm7Oy+hlY5YFqB5c90614Wy9z75fO8YDDK+T7iv6A9EdQP0RX8pZhvKkmpfZmWlQYHHwYx0dVMQbtzn9ZvA8StTYc5credUkCSK/PMmSIrYZFGr2qGJ4RGWdcpkzWRItS7rWRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054470; c=relaxed/simple;
	bh=TKPP0VzgeDagGyLZwK0huHH8JWRvxQanvSViJXLm7is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hbEVu+el5l6O9HHFpb2K67aIrMErFyg9wv/sxXeLAGCzk4wG5iwaa3jaDmXuS9AwN82vxwRzfwNy90uozLtk2nBBNWXzwe6qOZaczEu//wgxVFATef4QzAb7WOM7aiPertpXNpuSs+TSdr5TKg49+Sh2cak6UrBKfxDQArjUh6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMI9krby; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMI9krby"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so4843745e9.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054467; x=1791659267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKkf2SFy8uqVHKA6kh6K9FK6RoDGCKvfagK/bM4F5lQ=;
        b=RMI9krbynjF5Q3dtVd2qkDiLfOh7k8604o45OmCoBQsb+y5Y+fEyHmFEuCaOuwKYtu
         NxUFsHEpiX8yYMLAUSXqh70lzIlpcZRdF2YPdAERtFbYAnf8H8lZTziAo2jkF2soOI9T
         jTKKT5nhAsb/A6pXSgFpwvYywqMLZ6fmziLouBdcir5Y4DzfQL/5COqSuZ/086rjgU5a
         +7pHXrj1CLZOmpEbOLxefP1kLwVg9VZ4fjRQMH3gjoqwh7tsjCVzXxl/YcBVF4b3fuLZ
         yACPZbtGyQJuDPOEIQhvvR8oADyAHEc+k1LT1dPIW+fRs/EIs3QUNr90Tgt5DR8iGtdR
         nvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054467; x=1791659267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKkf2SFy8uqVHKA6kh6K9FK6RoDGCKvfagK/bM4F5lQ=;
        b=P1PrmmwT6JCHEnb9eUtIkifClihPlR7xcBtDoizDYDdNlqKkwPskpogzz4Q5fCZ5dT
         ZjkF6hYBqkl8P4IkYTyNpn/aDuyJIryCCaalhGm+BDG4nDqW1JYQjUKEIAJIBzso3CqW
         +PCKzVB8F+59p6mgbEKI9TP6RvIQqV7EADlLJLfodH6m/nMOadV8OC1c74HliBZF+IL8
         m+Q66OqtWDOCFsnlnNuXTS6ObbyamDmtKgjUGf3cM3t0dReLKZeAn9V8wK2UZpDzBugA
         yq/Amy/xgYsJAz6tei9uKnnwKrPgsPw2ePktGPaLQMVXU2l7Kr1K+TGDZzrQhcsPBOM0
         Q7rg==
X-Forwarded-Encrypted: i=1; AKwUvBx//Se4O88UWoX5knl2q6LBJ+UhkjRe1QUBzBPtmNbGIZ04vfSvKlyYFDb+Ruo0BpNe//PNF3TGKGDH5w==@vger.kernel.org
X-Gm-Message-State: AFuF++kHJZNxvkWwQMPJcDtudHA/UByCfKPYjbYWtkvwn/u6D6+d23ON
	JDpDILTQnpLVr3U2t5uG4o0W9HPrarEM4RAQw9Mh70x7fXE/SOvnzn5P
X-Gm-Gg: AYBFou0Pw0tWEakbX4LwLl/e36OtmGwaGoM89EQ1rkkTEZXNxBoug9khpYemNnwDx9i
	wqPPHI2tzZFmWJva5Y9G9PxVcF9klDFPODsTefaIIbPknQHWg6uYT0upsalhOHfaPT9TzPr3dda
	D1zbFIdlRQajKZRCfHT7ZZ9UUq/06HmdJ/bgr9waiaJ79CNvuZfbZcOqg5qIwS5spBtZlr07PtE
	9FTUPh7PHYeiEdAnh96sPGQDq7FJiVZzOir81EK6EKKsJvww4a1097n1+onQSzUHPYMSi04ytTc
	dLuR8lYp/K14Jvw9JTgr9XtD4CseSsYcjcTw9LJJiXSgcANDW6sY+vqTVbX6D5XHFX5jvMzhHk3
	IIGy/8c4wU/Zd4stRFc+0Jeq5YNoJaMMXm0rB252iRKTJZTifP3hLErg6cFeYJULdlyR0fuqk1R
	r18fMWitkQKjNawGITi/KW6Xix0HUSc5rJYlQPCbfcnWqHuoIgBQxUKlU1Ls2K+EagThbRNphS7
	GsrEGJawePMJkX4nFqG2EJvhKwMTJCiheqs27lAfHuxxnzW+wd27J+p6YD+/GmExSUGYNAWFVan
	7++9rdalppT34ts9AdzqWUPRkLeryz+lPQRVYlBmLW7R9VH+KDCdXBxXvd5Bag7CtVHxwI+U+/5
	Tglw=
X-Received: by 2002:a05:600c:4703:b0:4a0:25fe:a4b with SMTP id 5b1f17b1804b1-4a02759442bmr120884405e9.15.1791054466825;
        Sat, 03 Oct 2026 12:07:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm200984615e9.0.2026.10.03.12.07.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 12:07:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: es8375: use devm_clk_get_optional() for mclk
Date: Sat,  3 Oct 2026 21:07:38 +0200
Message-Id: <20261003190738.77564-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

es8375_read_device_properities() gets "mclk" with devm_clk_get() and
then tests the result for NULL to print "assuming static mclk". A
missing clock makes devm_clk_get() return -ENOENT, so the probe fails
before that test can match.

The binding does not require clocks, its example has none, and
everest,mclk-src lets the codec run from SCLK instead of MCLK. Use
devm_clk_get_optional(), as es8311, es8316, es8323, es8326 and es8389
do for the same clock.

Found with an experimental clang warning about NULL tests on functions
that return error pointers. Tested only in QEMU with i2c-stub in place
of the codec, not on real hardware.

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 sound/soc/codecs/es8375.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433..67bf73d80fb5 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -661,7 +661,7 @@ static int es8375_read_device_properities(struct device *dev, struct es8375_priv
 		return ret;
 	}
 
-	es8375->mclk = devm_clk_get(dev, "mclk");
+	es8375->mclk = devm_clk_get_optional(dev, "mclk");
 	if (IS_ERR(es8375->mclk))
 		return dev_err_probe(dev, PTR_ERR(es8375->mclk), "unable to get mclk\n");
 

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.53.0

