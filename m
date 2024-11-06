Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4E1DD553
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881184; cv=none; b=pcOMqk4x19DQFDpIxBuR7qFhgfaLR9IKN8Jc/z4SZq2h5/HEDTX+v5i+4nMag4yKEbUt6D9WhF0HHEi40CDhghV3e66ZjaYCwbeWQ4BiRVzs/V5arrou1qzy8MgsLOoxKDyoomXLXF5mCMoxTBXcCDHv5x/vfFtBmHa07KO0xfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881184; c=relaxed/simple;
	bh=IlzV64fO6uJJh1hPPD4D3vMSSZyX+CrHtv6dOm87frE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOuR4pZYQ3IPXecTtPUnPLj2m43py2feSz3hlLvfBAH8hMF6aiqsojf4SF++ynYLzQEkyKdyGVJFNZOv3dlVHGa/GWqQUWluKZZ7nNvpkGYi7Pv86ZLDsdhZaSYr74KAtl2EC84GwHdiigUVGdLlVLbuO1geLLy1HWujdC2fz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c0vUaQyX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c0vUaQyX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a998a5ca499so845011966b.0
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881181; x=1731485981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXOsXWAMtSTYQ212z41y5UW4GbeVT2rMx2mc46WkYEI=;
        b=c0vUaQyX3V5FBzzZi91qgokwG1J93OwklQl3eRM41mBrOknD2MovgJsyobtRcsJwTW
         rVeYewVNe+CVNox2GwdYEbvuSAivCBD/dbCmJvVkU+9xDEkvWPmuOHnPFZEar3ytXHxu
         G1SjT5zci2M+tLekZKdl/7Da+dceovjaCK/nDloDOWGodf3tiNqswPLMLNK/3KMCfPLg
         Mm/v1IeC1c9onaxk732N2s9ixNcnGzbfYZ0Aviu45Z9/rrdX4T6w7ZEclhr9YaY9cNu4
         18mW1aJZu9f3bWZjdfrZ2z6DnScnl/rpRa+FCfAUFT6JZJfYZh5NJsypzPjQ10s7vUZJ
         hvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881181; x=1731485981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXOsXWAMtSTYQ212z41y5UW4GbeVT2rMx2mc46WkYEI=;
        b=BJtIXzNOCVLw0krd1156R7A3hZNYTsor09lqoaRy5VbhJhERlykDFZh7PDlLjTpwDb
         sDrgok7Qm9egAXWK4h3um1MBfb0c78iKeuk+eHkYRT0KpxKxKJ/w2kwJzWLrB5C9Baxj
         wZV7qokIYX8XM/sX0P4I3k5pEDEnvVa2/a/p2O4ZP9aqNi3cNz/c8cdpCBkcR0Yw2I27
         Q/qPfFUQ+emdje/O/SMpxLtMUO9nxoDlZuq2equeKU1CpLm4Mgdlm0wT6czMsE0v/V6i
         VuAsx/OxQsvGalXGxvuS4YEw1ypbwQKhYiu1sWXWnJqvSLxZtlhpn8dTB7bm6QDZ8Cai
         qdMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjGWqBjDNxrkdWglVs1z49LE+WeXFdLo2mg3fzRaIvrVsrCu6QLtdSoZsEb7rzWQlSkbOKk2kphNYxxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/pEem3oL6LrAzCsjKZT/YQI6q6gZoiwcZwoozJxKd1gQEJJv
	3XQfsmjVZybkCccZY1+5DmcNqxBmfCclMy6fG3rHQO82ItQnDFzJfxM7TPsph/Q=
X-Google-Smtp-Source: AGHT+IGI82+/kvSoBV/R5AWe4VGlMpF8Tsx2W6U8jW2pq8WFOPcu/x4sZis0FCEsyVQt0Dr9l3s0EQ==
X-Received: by 2002:a17:907:2d10:b0:a9a:1115:486e with SMTP id a640c23a62f3a-a9e655b9327mr1846201166b.45.1730881180836;
        Wed, 06 Nov 2024 00:19:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:40 -0800 (PST)
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
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear bits
Date: Wed,  6 Nov 2024 10:18:07 +0200
Message-Id: <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

While it is still correct to pass zero as the bit-clear mask it may be
confusing. For this, use a proper bitmask for clear bits.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index f230d63339e8..47b82fe549ac 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
-	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
 }
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
-- 
2.39.2

