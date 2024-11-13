Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50372204020
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504968; cv=none; b=GrAAYTSStbguVq0H2KCx1vmsCM3p4jNh4lfgfSF2I1NIyZWQ1wXX3fXjwZ88YZ98bJ3NjJsNoPhcvvb7kG/39M5ochSuSxJl3EwR93/GO11Vfzs8x+B9VBJV5JYCkmVNt6BK4aMKilTZZ80bkoQ+cN0mbYXYyMxQj7HGTruIQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504968; c=relaxed/simple;
	bh=VAScEqC+gOYlOCD5fSBTF28pUjgsQMZqDGi/b9qUFQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U4yt1F5JioCPNei9uxk8GktlIniDqQR2eQvAvr4pYEt6NKfQzeILSL4NpADF0+tWUqvveJ67b+W1dnCuv+udkHZp9gpRps3NNzNb8p2ZN9RnajXqsoDpht+6SQ5EonTOo6PUyVmNUSoP4mNQRzMfHwU6oJ6p8TDHbRgwPxOGivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gXFZ/dcw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gXFZ/dcw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so61502785e9.1
        for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504964; x=1732109764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLrnY5p4F2ysEeuxEX1oEYB70cmBA8D62/QBYZDMk5c=;
        b=gXFZ/dcwZlK3nqxfyBwoKQ8r+NXg2cUybkd7Ptb65xgpF/+kJNiXPo0DvN8JZgOwSf
         pFuVUQptv6e2jBltSei/CGo9hEl1qRB0nJi+6180v2ATtAR1HOM32jm0RlM/CAfy8sCz
         /zOutt5fHtpZGdEE/fDvQ69UvCofZFggpxPZh3xX8L2Ee3tSaGoFB93T0dxS+Yc3mmah
         vrEg3leih7h4jRJmC50ho7UXnfdtovyAHHxwe/ZfmlGj73bmeTOwX8bEKPjZ4Ki4X4nn
         C1T4XvESgfLxfu9knSEuT/zI0rpVOpfYkGXpIVV4Ii8Jlfml0oj889ySWrF/ZpFsBzxa
         eBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504964; x=1732109764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLrnY5p4F2ysEeuxEX1oEYB70cmBA8D62/QBYZDMk5c=;
        b=Dk4oxAjWrmXTJFoChAjW87m3M91DEwjpiKOeReeZ4ipPnkGZiRDBpdMfOmanS1GPt1
         rx3kkxM2bMWJggMT1P9Ynsd5/JhAc8v4agi0WmnJl+9Jt90yaZWuy2TCBi8twye7zgi5
         USaQC+c1G2Fy4QQVwRjIi+VhyVdWUt91R/bVQ6bla1Vj6CnniV6Ns5Tl5+ptE6kTKDNY
         avbw6C6QP1pjtJ2KLa7K35R2HPe2TCHjHwIRxOV8mQ6SI4vXlm0b68YVwNcHYV86t7uJ
         LTyA9O4+n2xeT8/9iISdszQObU9hvw8jESAtYDdGJHTnhfpakGiZae4xF0/Oh4TXMvvq
         kavw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/qnqotjIR6Xh56q1ARE06K2Ix8ShqbrseQ+OJVvgUhIkwyZQkUNER/lQ0eB3s7v2daOxuAy6pje6RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9strpwQwv1TJItwh2fmsMcCWeKqfEXoXXT3AARgDaQScVFwEh
	8RaFr+YBxEmXDRpHGQf3rlEYgSvjUWOS0VjO6QSkL/87wRTxXlphs5aK/C+293I=
X-Google-Smtp-Source: AGHT+IFhAKQyD7wWJYrPMxlQRcN6qIExSg3WsiPuAigIJwy4l5iZHLGTurt4LfoRew5/k7IONHIaLA==
X-Received: by 2002:a05:600c:1c15:b0:431:4b88:d408 with SMTP id 5b1f17b1804b1-432b74fda4bmr168007215e9.5.1731504963709;
        Wed, 13 Nov 2024 05:36:03 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 09/25] ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Wed, 13 Nov 2024 15:35:24 +0200
Message-Id: <20241113133540.2005850-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the pdev member of struct rz_ssi_priv as it is not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index a4d65be17eb1..a359235b55af 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -99,7 +99,6 @@ struct rz_ssi_stream {
 
 struct rz_ssi_priv {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct reset_control *rstc;
 	struct device *dev;
 	struct clk *sfr_clk;
@@ -1043,7 +1042,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
-- 
2.39.2

