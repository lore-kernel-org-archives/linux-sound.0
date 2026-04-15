Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952C35C19F
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257270; cv=none; b=BOpozAVfLSCZorV3DoaRw/l0mVSZBGelcinrlOd2Yt9ITl1ElXlGUdoB6VSl0jhprqMouDYt23z3KLBA44Lq7trBiGx57f7VLRYWohqpBBoTmWyfIrwCvN8YkPni2LcOSmVgbHz69FBWDvxdbt4Y0d7T2jQn71QV/ptz60OYs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257270; c=relaxed/simple;
	bh=jEQUdAtH8yE5mBvf4ytaTJJnGJ58WWs9SMxtTW7gBUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7IodxB3wqD1vvaPxtyFXoHjoqKXzl8DbdSiV51Rux2PZ8esJLkJyl9ky21FXGY0JXDffBnfqTku5LGI/uJWeXzncqOwFHDtdFLZs1BVuajEMicwNiyFcQRZWNHGmyHl1TNsvag/sSAgaDbJ6B2Us0AuY0Poh+ZRI38lnNQT4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOT800eY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOT800eY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4200446f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257267; x=1776862067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzcOCyQLNmU8cBIifwv6HJp2UvPykwfLFilqam8mArk=;
        b=pOT800eYk1HANo1s6Jv49cU/Aj3dWRzvCsbG099gjq75vYWtjkC5uzR2/FYYqb5yiI
         sXWGfI0HMaQ4CtP7Ah06ftVkap+YvMDq2TuEpN8riwTPE0l3joQJwUl0uJF9XQl1eiyJ
         b0DhiN6O5zrmZVk0NqyxJHuk+O6UJ4bgS+nCa76bmUHjUTju4Sv3wrmDtpRuRb6xC/HP
         y3B+XtANE1MFDyT5NYEljd49rLst9rNUaTk1mZSJ2VkvPAVXDViakJmqQzU6+bW7u9Nr
         WogIEhstTcN/OTZidJ28nRiQGLffEd7P1LJbAFwHFbb5eBCtFvStP6/Zq/kSbo6jcSoF
         qaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257267; x=1776862067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzcOCyQLNmU8cBIifwv6HJp2UvPykwfLFilqam8mArk=;
        b=GFrpllaYnLwTjAG7uebNcmniGIibOdON8Z5ZPg88iVY2Tqf+T6uQXBEWKsh49xJdV5
         sAmbXKCFxYATLyloVqmjaLO0WSBE0HMov74K3Jm1ALhCqJEmrdSypkJmbCSxcc+N3+4W
         SjWWRvz4jj2WlXYkN/9sqKZM6kuQPzBNEmwh55wltCOgoBAb6R5tHqCRIBAo/2FAK29q
         S6UrcPPtztZZG3BIGqpTHJmjZgiBoIc2PVL89mF8NCPItIB9OP9KdM/HGB9KfNzPjA8P
         vcqMIFImfLWQtGkVhewztZdoAVzOaojINak8xV4xU59U1X+BwhH9esFOwz1nMu/8ElnH
         yoVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n4ek4zGK+9VIhExm3Nv4HlsM3aiF6VTjAk3z7WeWF0uRurGF0ZVeo0WnolkLFNswnifRWD/BEyosSuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUN0Cviji5D0DcFjAnWEQzpRaCk0YoPcPXBsTF+KJkL2iXqkA+
	h0Hkb+27W+BFeb0QK55Zy3XrukLVk93gkrkea3bLg0Ic/bQoY1mi5bYN
X-Gm-Gg: AeBDiesv4oQZiTWTM1uA+6H/Zi8jCsu8SeL0SXyX01hHwY3bJYoU77sDOFAAhgNmuNW
	W5eh3PVhSVMETORP4OV0KE7SmvrNphs7S9b9kW75fJtvrCLrJKfMhF59vLNUQaF5K3fP3Ju9yOP
	e1We7MJUzhCUrezeAsau61g7dtWCKdXvbhrs72nXCAirD/UlpzmOXvgg0jK/Vanr0nLmqCzaK4d
	SBlqULNeIe30Y9eZaiV2uhaphfwxU7NwE6CBwEJ1oY8qjNaufBJv9dNAfUqV6JowWCKxP2HgWPj
	RtBH46yaW3DGsNfQ1nfsXck70qnJgtC+5F3IwfMyflvN+E/7h4HaWHJNoKN/B/fw/GGQGn/5Y+I
	L0AYgN1daT0Cfzo8wESB1/vWYigfpbKZmDij+PyxMKMK3SwIQwxF+j3UOmsxEYpN8M128G0hDxn
	jbbkAOZh3SD2j/8cypqlw9SeJ+z3M26V6/r7GKKQ==
X-Received: by 2002:a05:6000:2081:b0:43d:6ff5:3a2d with SMTP id ffacd0b85a97d-43d6ff53ad1mr19853081f8f.10.1776257266466;
        Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 10/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:27 +0000
Message-Id: <20260415124731.3684773-11-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E requires the ADG reset line to be deasserted for the audio
subsystem to operate. The ADG module clock is already managed via
rsnd_adg_clk_enable/disable() through adg->adg, so no additional
clock handling is needed.

Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single lines

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0105c60a144e..813ad5eabba6 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct rsnd_adg *adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
@@ -779,8 +780,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (!adg)
 		return -ENOMEM;
 
-	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, NULL, 0, 0);
+	rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get adg reset\n");
+
+	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops, NULL, rstc, 0, 0);
 	if (ret)
 		return ret;
 
-- 
2.25.1

