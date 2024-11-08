Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D4E1E3DE7
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063038; cv=none; b=S92T4xzvX40U3im72eZum8i22fB6rdVAS+aG/7TLrhpMDFbUhBwPys6xovVj/TlI/Aat5/JM2j7+Omupw3rffXT9IJYUSGhBcQdzpWaMbhYCEyX4yRF1owstlGbXlfFys+8HeZUSTiCXX9ve6QtArw6+Yn9bnom/rfiox0ue+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063038; c=relaxed/simple;
	bh=JjIahQr6A0j7MFD+w6mZNB6iEn2WX+1Wm4FASvWAtvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lyKZ9mowaGEyiLoHGWvyC5zqH/n1iAFmTcygJZ4JVwWNraFf53p12Gfn7DkH1CIM7GUGbt+XgpCNmCPDgRJU7e3CmZHTH/B1LQKNeIKL1FnEcCTUKcqgj6KB9lU1a+utgYom8oB4H1ocmtufe3ArLXdbW+yKJD29HpNW7xmr4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MCezlR8B; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MCezlR8B"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso310461866b.2
        for <linux-sound@vger.kernel.org>; Fri, 08 Nov 2024 02:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063033; x=1731667833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8RwfIDsdAPmonZ2TVWnj8OzE+nZU+M7zjNrbRKY8/4=;
        b=MCezlR8BYV7NJ7y1eHnLvPoXVcOHurcSRg5/doI7sph4NSWJKwT5Gbic4XuxFkjKj/
         qa7zS1Kr7YjRaDb8v9Yu2EbO77BGyoxtdpOl5lvagAA6VKcgC5uwQAJ7Bvk1MVhavbEg
         dfjY1CKsjkA4VKrNFoIY6SH1zHEDp+/jPm2FpuplxfeisxwnvSsIkJ3OvGbfqhVznI7p
         liEoUNMZ8T+a1JPPS/UPmE1Do5o5GV4myKflWwqipS98UoV6Q7ev9bYwy9BTyxs6Nl17
         SvP9S5iU1kZh8yc751wLctE1fhiU+3ffUcu2AHqeFd5Rp+CjxDzg60mwcLEKl2V+dNgL
         4RQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063033; x=1731667833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8RwfIDsdAPmonZ2TVWnj8OzE+nZU+M7zjNrbRKY8/4=;
        b=qqD6fUdUzjBGVcz7oFa5Qfk7+d4Zf1xV2A30LTPYnu2WgbdnM1IsztYeiNVkVCvDjC
         lUS9iFf55gQrLPuJ83Q8SZWRNzU4DxZWelrwrG2NBhesW0D2qII8S1cVqm25N1b+n1xZ
         2ZwJnPQLUTIGhsPN/GPwBZSbktOUkWOdh2enpOZlc/GrDvqHHM/uW+UuJpJO3acjqELj
         n5Rp//yK2uLipud4JxAyg2VbVc4MxwuqE/Vl2khne3jeOkmtXTUbfEN5OXNByAVafb3k
         b9S8E73iIczWBID09I21v8a5lqlNRZnqXix2C+kG+RKlzvZ+9E2zkrjEXt5qd7a7xU4j
         pPhg==
X-Forwarded-Encrypted: i=1; AJvYcCUPU5Et/9Nk1Ymzjd1ZObjotmGvQ1UIft5+v7Rzt+eDJp8Aczb5s7Y+w6JRi6AMn9GE//9fRkMIvkKI9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSHD/5dVktu3NvrfUlMYBz5X3sr35g3aZm1BHWKC3L3FtuTsc6
	ocWZvNMuFMks7u2Bstm0a6HTveN3BcsRekYmSeoDswSuX4GVJEM5SsEzqPnmZyU=
X-Google-Smtp-Source: AGHT+IFPnrgFfPbNd3TP73wQjFYRKTrU9RrXTJRvMfUQhEiSnGU8niQr6Ks7xN8nlYRGUMQMvIJMJg==
X-Received: by 2002:a17:907:84a:b0:a9a:be:37f8 with SMTP id a640c23a62f3a-a9ef0018b3bmr208920566b.43.1731063033457;
        Fri, 08 Nov 2024 02:50:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:32 -0800 (PST)
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
Subject: [PATCH v2 09/25] ASoC: sh: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Fri,  8 Nov 2024 12:49:42 +0200
Message-Id: <20241108104958.2931943-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
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

