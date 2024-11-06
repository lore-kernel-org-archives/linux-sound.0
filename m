Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E201D90D7
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881169; cv=none; b=EjyfgsyQet/Kcihp6o6cRbQDLlk0aP8pB/eU7yTsd8PtzfKooV23u/To0da3eglC+ia2hPsiyLg65V7XcTDCKAC75Z2moQp2tZd6D5ZGfXdqJdQo8t0CcUNqEz7aXy/p6NwhntZrd7e3SsQYyAIHqD5A+lrLn/fYOXLknYkBUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881169; c=relaxed/simple;
	bh=8UOlDm3vrSjRTc4vbWGP2PkIhWAkTQRY2So1hnpltTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WSXWBjtEnSn8T261Gu78ZP9CkVydztQY9lnMs3hjOy2cEPWv4g9FZLz4VDpjuxvzmcHkWsr/v9SdoLqJel+UNmAbRWHUYApbDiWSryENNC7eeplixUt2oy6v/B2LZYeKxGbVfRvwszEmZflEkJMd0vNBPTVa1jFvsKI2BNr5u4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jmVh954j; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jmVh954j"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a99ebb390a5so111764866b.1
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881166; x=1731485966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+ke7NRgTssg/IEZFWgLNPKBw8NmV+vA1artHipjKW4=;
        b=jmVh954jD7M2GVDspV46DP3n+eTyxONuvgCAET/J8yAWK/PVZnydCyq1UMULQkDPqY
         IHmkCCbeCxpYf/oAHBw+Hu9VwXNJEYeJkR6NmlLAaAPcl7LUS5jmFtVYKoLWU4ZU38Ra
         b7gRO9gK+l0xAehVCBPMxPf5VJUxVsSwbHc4qhke8WeK6iCoJC0CJr+w+WFpn/lLqmaB
         9NexTqSK1uo9W7a3tbC5WALhSTdxGmUldVmc9GrwRkA8q+derdXQhn4KjpI0gw8f+sL5
         fYg95f0Gvgq4NV8UtUX68El4bLi4WVZC4c2bxCTwZr479g334dRBwtQaRCbLQUJbCmpO
         iFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881166; x=1731485966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+ke7NRgTssg/IEZFWgLNPKBw8NmV+vA1artHipjKW4=;
        b=gTVv7aF3Gs2QlFtbFs2lc4HFxaN1hyhIxkA834xFKuaM7G7rrq1/v46DwTxmEnLuGa
         0otOY5E3+F4/jhJytqXL1TvpeyDN9s+ItPbmH0/H4+pThgLYOtGSD/Kwtc+a6i2bDeYp
         Em7BYvGMpqtNLe7QFhoYSC4j5q9JlFOnTTZGqxY8xOMdVeP40Ak794LKfzT/vUZlWVip
         vwp1XOmBjht4CXMbIGM1TXJaE8fFPnmibcIE7ik0kM1du6/7n12aeDyg0/8xKhov79jP
         JmEAmaxNOOa9QpOhE0NCxd/bfittpYVbqGpWlS+lEy4dxC2BL7/K6lwKIJAVZQasd3aR
         equQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS1alPE34ohrzDRVnPjQzZ9jxXLATrNfoMwPATGJyhC7p2L+0xyUexgwWzFcKmwZpNtOv195sh4Qm/vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUcyx/7YoOqzZLci/MT92V0yTmATG/bHLX+2Oo48YU7Hz/Q3i
	6LFir1byMKbejXPG9dglLwcR4jbkDfeKAea/oWe6H5q2PJmnIQfoLDZXCjbHBMY=
X-Google-Smtp-Source: AGHT+IGsSrynXgwp9ybYH96pAnSvTf/jo28kUEGLKKl8GOZpqqi1T6VVn/a9MUUUoZoaN649GiICbA==
X-Received: by 2002:a17:907:e29f:b0:a9a:616c:459e with SMTP id a640c23a62f3a-a9ec667289fmr159795066b.27.1730881166124;
        Wed, 06 Nov 2024 00:19:26 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:25 -0800 (PST)
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
Subject: [PATCH 05/31] pinctrl: renesas: rzg2l: Add audio clock pins
Date: Wed,  6 Nov 2024 10:18:00 +0200
Message-Id: <20241106081826.1211088-6-claudiu.beznea.uj@bp.renesas.com>
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

Add audio clock pins. These are used by audio IPs as input pins to feed
them with audio clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8ffb9430a134..1190ca4b1808 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2086,6 +2086,8 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						      PIN_CFG_SOFT_PS)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS)) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
+	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
+	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
 						     PIN_CFG_IO_VMC_SD0)) },
-- 
2.39.2

