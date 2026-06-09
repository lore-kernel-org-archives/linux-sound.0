Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D435344036
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968723; cv=none; b=Z6+/Tx8BLk7D4e1ykrm7uSPZK+TVOET/NGuNuRwOrDWG2iUJb+kQALmZvkqR3DqkmA+q82HIvChkywN8yGZluAsb3pT8bHNnDbW4+zVE+8/+13uVyV0pbbzObu2nra739juCFHxXAjiukLbRwKg0txug9y89QaCCbDNV9c+22WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968723; c=relaxed/simple;
	bh=YpcDZMX363iIvbH5/NBtR85ZcvXyI4n+RHVGoibhH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBRYEevfNL0q5jmHe1VdcpI5h9CIGOQ/sMoRshxznuYoa6Fyd39fB22gEXDV5rC91xRY82KXEf6B+nhX8POG8wCMIq9nCvmhdPwAFjtlwyElMdO+as+h+eD7Gb1d52+3K/3PHmjn0tco5rFcWq3vU+rVJkuNjEYce4G8Bpg6uZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdI45W77; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdI45W77"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf3781ca51so46717305ad.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968719; x=1781573519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+bbQbftJjjFu55E1JFO4f7u5X8QUCbi+q5hkfYSnqE=;
        b=VdI45W77g1mNYc2sa/WMOZFI/Ut7kw1XmCDaITyuhyIYmTzlDJr1VDxpwYO414cpaY
         3cHXrY1ktqBrkoa+tBj/u1yjCrc++cCkpYqxUQ+/HMnZu7V57Ebfs2tCFTfo/9twN9ar
         e4p7H4Z5LkJJtS54YV9Cg/axxbXbgHlfdhUmAi/eXknBC4iNUXEImSddeApUR6SpMKum
         O/KpxZKWrygZhMUgXed4cVsrtH0QhB3W1slwYSk0mAVT2s3qwFLtNJR28UdaMr9f8X7H
         Nj4c4r+mY7V93/ZozKl9o/1m01xE1vNrylu8SJ68VRgUAFNJ7ZIMamCCTQYDhgPCIglr
         CA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968719; x=1781573519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+bbQbftJjjFu55E1JFO4f7u5X8QUCbi+q5hkfYSnqE=;
        b=adkTurddbzT3mO3RODCGW3RRSKvWmfHkuoHU6UN5o7jRf+KOwD+uJrHCp1yBTCoJ3q
         qtuHGwXxmUBq8FVRXOXJK7i7fXRFMiIv4aoafrKGMc7m+r8fSugwmm5nanGFJe1n+IpC
         niec+PQ/tmGh3kqmeCguOYMcgvorND876gFz2mDJTGtU9M+PIeDBq/zljqasp5LDGNGo
         vI8gxl6GqePUtECLNJC5PL0+2v+xucx46tPL+leJs17NWn0kz6PUvFQzeMdcksuNV4Cg
         fP5bHhlkxTNzROvRAmCxfX6/Ms6hxUPOyV1kmfOx0UVHm6D2TnVQQK3BlRSYCH0pgjMo
         VLuA==
X-Forwarded-Encrypted: i=1; AFNElJ+Tml5GWaxFdWY5JzXF7UpgvUCs2APYRRtKC/DrXN/7yuQY3tuV/dFTzMm0q+MCGbb7VEyuaM6l+h+XXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8zfgSAx6IuNjPWw2iyse/HS2MmqZ2MGAiuC6fC0KupHCxOlM
	MRaMkBS5hp6SzavJfjbodQGRQP/mfDioQtdE00zhNlSRYFRq7g0UUbZv
X-Gm-Gg: Acq92OEbp5DC5eDzYiT42NVNkCRUncWTrYbDuMB4gyxE+zNN7+dviPptYgM3FfcWBeK
	z/OAS1G6JngrvWlXuyYfyPo4S/9vtJLA6n3WuokwTMAnO4gVJY4iGQ0T31tnWBJ5t1zzideZxSu
	mr/LgRNmUrz+8tm4vl5j4UR2dr4djNfxmpcUQEDrR4l/4Qvtkf3gT1Se1dMLo50mV6vB0tJW7VG
	pv0rDv4JRS8KtvL0jyHluo5u/ObYEZn+UnUXrjX4wMoPa6DgYStsf4cqCDHPPqLINlFVkRGEozu
	SUF8BwrKSSj5U/tUl0P7osdbV1SNaOSLOTQ70vbMvf2geSQ7TgmwReFG0ECXT4G7ivDUAkahEA2
	B8b+fD7mypq+ujug112d1H6XfLXProBLG+AfkbwUu28PDQcELr//4kmNbKr1Cp7quDF3UZ6aVS/
	GDQ0BR2CPH4BKCgsZsBVpsZrEewi5pEYzaDE6tEO7pEcjs5l6lEobrt4b2ebLPrPX3L421buRgL
	+pDgWU=
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr200993215ad.0.1780968719494;
        Mon, 08 Jun 2026 18:31:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:59 -0700 (PDT)
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
Subject: [PATCH v5 07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Tue,  9 Jun 2026 08:31:03 +0700
Message-ID: <20260609013107.5995-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick, and div clocks are optional. Switch from devm_clk_get()
to devm_clk_get_optional() to correctly handle cases where these clocks
are missing.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1df7dc014363..e29be2bcf952 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -994,7 +994,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
 		if (IS_ERR(clock->xck)) {
 			dev_err(dev, "can't get xck clock\n");
 			return -EINVAL;
@@ -1007,7 +1007,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
 		if (IS_ERR(clock->ick)) {
 			dev_err(dev, "can't get ick clock\n");
 			return -EINVAL;
@@ -1020,7 +1020,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
 		if (IS_ERR(clock->div)) {
 			dev_err(dev, "can't get div clock\n");
 			return -EINVAL;
-- 
2.43.0

