Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53358382365
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662050; cv=none; b=G+APgqSy5tgd/DqVeRhsYvjvrnK4YGagyhvmZ+65saZ0RfEh1Vvt1b8IKzax26Q42R0mxQWbMqiD75owk5IkHdtO9xqhkP6IC59zRNqET3yJfhe+nvLHjjqX3zzX7Xsp3zUKlexq8W2K+l/hLPP3fbbdx6y7bSX7aTk/inntyHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662050; c=relaxed/simple;
	bh=lZ7FZtmTEovnVZhym6I+cKVFhm8O/HbQ0QN2bfsjw8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHQoX4an9R9uOMIqGyxXldf5kYMEm2peVHClbnGiKBgrRYf2ltdJPYfUL4OrWf6engV2y6CS86giHlQvSgX7tc9LnkNlJtd3ofCqTqHpam+oPLzzXGo1Rdpe3a5JuU9/q/Mgzpw5o5Za7Z2aj3/At+xdFNBj2lyYUo4/+VCQ6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaJVAB12; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaJVAB12"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423f236418so1010430b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662048; x=1781266848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csAKonk0gKIDvDKdblNmpfIrIfjhCZDOh//IaoDPNxo=;
        b=JaJVAB12B6mycSLszIHn4MtmFmIMKfPect3WiBFw3FhyTdVTHdy6m5baAvEXLfbzFL
         pjWywbN1ZkmFZO86dlNZXU5LJgHk0ZFwHecj9MWqt22yAD/HkMDVA5DzL7DX8sCNJLFW
         SX+DbPuMPFmUknAdXysM7aiKer1RQZx2GV+ZK1rJSQ0SHgIhcYNwQBkcIUOTEZ+FFWrC
         Hw7IbHUANbOxh98wr4vgt6A+TMuqqCBk9+UfQvzALFWMDmJBslPfW4QkYEGozX0QEQoW
         MDq903vXIsFz9z/96C5sjWEA22ja9RqgEon4qTi7nmBObRt4v1I7iAJkUtXKi52A2MCm
         mu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662048; x=1781266848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csAKonk0gKIDvDKdblNmpfIrIfjhCZDOh//IaoDPNxo=;
        b=nZ1Wnvz+UOH7cDEIUI+mg97ONM1gVwCWzUMegpTtD1npkbl/meSRrg5Y15WVURkcF7
         YAUKVPZh6EJqyD0MBFkBSwAgI34rvF4qywPm8ZYg/RUq1LApZ+7wfpKjWQJNNhSsrK1a
         2TimDphhJdcAKy+ESs/lUw50jZFOizWTSZvdWCOiSuMJG3ZVfjolDryAEFzXM60vDxAB
         lNX4WxpuEtEf83ybt6GT3g+pzStAHi/I9DrttU68b/a89A2hdpbLCkeQ2nJe34qkHYed
         8jNh5dUI2ak2T5H3ZnHGcL7lCjUHwXURDILQD8lmcppLIJryuZz4XdIIsnciiorQH4aT
         IDzg==
X-Forwarded-Encrypted: i=1; AFNElJ+osDDMwzq/nUWfD2by7OVkZbv6FdvYp0/a8GZL2CaUUL2hwhSGcEfOHxNwWWJrELA0wcu4YsJzLDEkHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlJq9glYr7iDOS2wk4j+s5lYcFgU1slv3AVwP6w4kQj5BTCgX
	SASv45w4fXmGG2fKbXeoU+DqINiHHshYlyNp4ggLVwjMhspc9W2BHSvT
X-Gm-Gg: Acq92OEX1afkimSnZQSX23vbzhRNX9T702bUuitP/4nuSUKi6lJLaZKh5NisYGfzDYP
	UHCH/zrJ6+cm2K61tA3vHEwAf5KEe/4y3cf9k0c3jjhrpDXb1r5vKxoJQMlUsAMom07NvrGrHEQ
	+CiYw/wqi/Ib8WhNSE5AfVTn6Oly0W+HTyH7DcHQ6FG7clNkbs5EL4N98S44johVLtQG/y9f6kP
	C01UG+JqGUV7/ST+8RX8a4E0OwQMt46FmFTQhsNDRjUrRF8hiaH10Q0njTVAScvTnU6CYpO64/q
	0ypuzOlLPQI9Ch/km85nT49xPQA00uGyQCi1npPDRdiH+tFgfdBFlbFrPE0txgOTTjZIAkcGuIV
	K6DO0HD0uuFh2jaVHBb/CaM2jU7FDyFsvEHceHp4zzJPlfOOTk96YIpTlp1qSiOMsQ4dyYhmZJe
	f8jhGj020pLuQihcxu1iTixum+f3ERIVTvSdntKddGo+Gq/qv5lPuB7WD+OfyLFnhuqfzK
X-Received: by 2002:a05:6a00:b807:b0:842:51af:b3af with SMTP id d2e1a72fcca58-842b0e1c71dmr3279912b3a.3.1780662047867;
        Fri, 05 Jun 2026 05:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 07/10] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Fri,  5 Jun 2026 19:19:51 +0700
Message-ID: <20260605121955.105661-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick and div clocks are optional resources. Use
devm_clk_get_optional() instead of devm_clk_get() when acquiring these
clocks and switch to dev_err_probe() for error reporting.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 43e6772c06d5..a2d7d17dd2bb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -990,15 +990,13 @@ static int fsi_clk_init(struct device *dev,
 
 	clock->own = devm_clk_get(dev, NULL);
 	if (IS_ERR(clock->own))
-		return -EINVAL;
+		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
 		if (clock->xck == clock->own) {
 			dev_err(dev, "cpu doesn't support xck clock\n");
 			return -EINVAL;
@@ -1007,11 +1005,9 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
 		if (clock->ick == clock->own) {
 			dev_err(dev, "cpu doesn't support ick clock\n");
 			return -EINVAL;
@@ -1020,11 +1016,9 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
 		if (clock->div == clock->own) {
 			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
-- 
2.43.0

