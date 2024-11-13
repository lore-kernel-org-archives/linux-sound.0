Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3732022CA
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504959; cv=none; b=DV7TRfsSlHwQYzbV2lQQ81FWUs6RXpjvxIwoGNIxRrJB8jVfsp1vWXfqgk1ykJi20v7jmGa2g3H9mhSBY5kMAhZEFWKp3kGmXxE80EUEwa36rAJuTUyUG2zuME8I7Rg+2xtHZGuf9lMVZCCBx3SZzXjXIg0wn0XkdLc8QOvBIh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504959; c=relaxed/simple;
	bh=hsInE9S4S/vwenjeM66DD4/pCHktkvyL4wYR/f21JYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkvCQIkCPDgpTI6+qg9V5l1iVcXFmtHMl05j6JBjG4xq3F7tM2Qc4km/IUPJ1xgSDj7ufKpl7du9HWDX6VyzyZKIw4dzFFKaDwqsCNL1nuVcCEBDP6CWO8LGcXD2Ex4ucgnCAvRSx/5eNJPnYSr7/9C0Klqcs1+CEByFXUDOG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YcYu1xGk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YcYu1xGk"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53a007743e7so7966270e87.1
        for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504955; x=1732109755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMlZeixiliINj2sB8B/Hsjodp45t1qy+/EotEbzHeIE=;
        b=YcYu1xGkwpljYym8LpPMHKuiZvIvXup09ZYCunlEKTd8XO+zpH5qEgnw/ApWezX6Bo
         JgTEz2elBcZXHxf0hRuZmEamkdek1ymaRorKkyZvN/dDhRasl9C+c3lRDjLhFt/jMgvG
         4g72FdMdxMT3ba9Oa/i7XqUqd7M93JxQOJih9MaUGVqDPZm68G95cOcABY2J0wNt0BE5
         DgXrLqdamji13Dzrn8joilMR6Xs8gsyqcEwvsK+d5D1qU/8okfAuscHf1UAibMTloRX7
         OhB8XT397jgrLdQhOjwcm/PblL/GnbtoUU0+sBSVdz2QABuGFI+5YGS238xZgyAJY96t
         bBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504955; x=1732109755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMlZeixiliINj2sB8B/Hsjodp45t1qy+/EotEbzHeIE=;
        b=Vn6uWenq4RGp4+5V4Xw9/PV3rJyVXPHtyzJ0y6rrSGGdGHhI7wr2z0GCBUHRPyVNwy
         MCDJldekND60HhyoXAlgVhivjV30cJsc7W6HWWl4I35PMIu45EDF1195+BRrnK8VwjE7
         f3AdLtZHqwiBd6LkU0+CLdaoZDc6woRIg4hLT7Gfhq3w7eluQnxDI7Fdj1ohi1TIf1ID
         jDb7DdZlSc2YbqMNWxKAmCIKXGDv1QqOMNMfCHuXOYk/3MqfFvrZxYz5IM70XAIcw+Sd
         K3qextdjfFIdhws+BN6PGeVNMFhd1y1aMZ4BSxe5bl5oLO3LmwzMsYyXA9Yfae4tldF+
         qk/g==
X-Forwarded-Encrypted: i=1; AJvYcCV6hZuaP/mS8lLKcdViXFoPYZkERLfLaSYwM1ZDgJOHkq0DYsncvMptQWKQJ/IbSuzJzUlwbf5UlZB9GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyU/r30M3OBcwfsIdNBjDk6W2D0Nn0qB7kplWI9g2yyZ68/LE/
	h+OSw84/9grCOScsBzKP83R9j7BMUhoLRcqFOjXaCSshG1oJEVoFjllcsc0Q9yI=
X-Google-Smtp-Source: AGHT+IFDoqWlc+LYE1IHHSkdT7sRQOeKuofe1Yq22n5/D6CUznab7ngU7zpCUFlNPYH6frvj2r8HUw==
X-Received: by 2002:a05:6512:3da0:b0:539:8fcd:524 with SMTP id 2adb3069b0e04-53d9fe8ad7cmr1333681e87.30.1731504955530;
        Wed, 13 Nov 2024 05:35:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:55 -0800 (PST)
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
Subject: [PATCH v3 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
Date: Wed, 13 Nov 2024 15:35:20 +0200
Message-Id: <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
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

Add audio clock pins. These are used by audio IPs as input pins to feed
them with audio clocks.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

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

