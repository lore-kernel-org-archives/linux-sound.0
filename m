Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710F471D1B
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714894; cv=none; b=bipZ0mHjb/k6VQSPxjlSb0FIxAYMogSSw4K7GLUA0igMNto3r/WpyNDRxmyzWBaFCrDz7LTtv69sUHQk0gkcu3Ma4XTTZiK/L4WifV64Kiib9QyFdEvFqaWrNP11mC6e9wcpBswv70mmAq1hgYTpgQkCH/eD2YJTJWW9OWQb90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714894; c=relaxed/simple;
	bh=/6y2rOBs8rDmm+ZmIrGOnJSPzixX/5shuOMVECiTTGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O84zNZi+sJxYaD81fPFqF2cj5ubXpwNBtfz1PjFxwEXejX9+yxsltqIt0Bu0xsG6XDSGifSgaf5QfKy6H4lcJwpavz3v8IzwcchEGqWiVLIZYKZSc2aGpC9cDrT3Bfyjzn7fKbuHm5+7QCsxr0NHnTEZWVQx+p/rm8SLG0NeCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSQ9AAB+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSQ9AAB+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so1523596a91.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714892; x=1787319692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sc7kpq7dxQn0HvFszffVq6DRG7iIwj8Pl4wCJ18jRfQ=;
        b=CSQ9AAB+CSGv4qEeHMGaEutKwnn1FhydiYTfkttNhPrJ/O74AS0T5Uc57JtWyXCqtm
         /BCZRFzMGMaiRdF9ph8i1WK196iQIYlp/noQpEs9z8PCrSa2mNLHunTbClO6AeFvPpZr
         GAyScLBtth0sqOlsF/rKIhJMZ8S6aFZyeAEykVoBZD+Rd0n/JTGqw2HG7XCevt9cZ8nD
         MbAdJCtd5mfvvldPU3H1Qf4oHUxW5LI0yFOtG/jMslRX2CyOTA6U0jTli0DaeYEK/4rR
         1pMVUtVUzAp6BxdF5Q68YRq84vK7Fq4Gu/CXpJoFoU3MT6XtZLFt/bZ4uqNPtPHz8IZE
         LA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714892; x=1787319692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sc7kpq7dxQn0HvFszffVq6DRG7iIwj8Pl4wCJ18jRfQ=;
        b=F6kVMJ5RPogQsHaY9cBSGgBtEATmyvqjhh3VfCF3mHm9ARDGz7jiqT03ITmqQU+p12
         BguMao/H9HUmGbSsjUVcRVjuId8lfUlRRxfzi+eHzbJTkoyJCUACLqhyH49EAwk4QSSj
         mk53WtTBurC3QqXrso6UkTicqsGb4StaDU631VygKMoU0aEN+ATaunZKvCCd31TrdScl
         UlurmDz/iQxMe1mm0vixDfAsbWNcQhSjAoMmtT6DXPz1z2ZrNJfcZr0DQxXg4Dsm2Ldd
         LZakdKvXx7Vvh9DIgS1tZomKyVK3y6cNwtgtdJF6jjpy3FAKmMvQygJDWPn3mCuTHQAX
         U3zA==
X-Forwarded-Encrypted: i=1; AHgh+RosoTcoh94yHVqMU5ug761ZSAXJUBkpaBfRdOyT2v0NWnEZ+uxWoUgVB7PrqANAZWNKLw4jYxVv8Z25OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDXSM5q8FGKDmgtglMKgfGEYDVOyY7iFExBVVGgscZ6Bo7BbU
	zhZWRqTbhJa/B8I3ZgykYKJyrsogM/ZS9+nJjp+7Fg5vBzqiI+gXO3Y6
X-Gm-Gg: AR+sD10VmP+kJ1LQ0qVZv4isT5LsP9XTgXOD6qF/o9uMoKBsH4oG8JDcxQcIzh/yyUy
	Wjnw1sAx3TJh5ZH1QrMaBzzsHP23D15yDpJ/noLN4nVJgx1LKA09wvT/k47TQ+b+2cwpgUSiiJ6
	94WsAqAKIW+RElouGvfrwrkjPQ66P1vsYsAl8i2OEBEVMB+phaHe6Y4D5trlGTbWa0HO2lvv5Ql
	x8+60UEF+vBapaWGdtOfszI5RvipauSbHQjljj3beR1QYsgUDM57d1b5SJ2K+uDLi89xwp2HNie
	U5To1EONSWAW/s1NCzWCygeA/RfagrfOLZvPgDIYEDBkNTqmb6NgO6t51IMmpShsRyah3pCWDP6
	uGiZ61yygPhRhKnyRFoCxgjUomWqtjzdELgjqBxsMemqVmUCye/Yqw+H1QzY8XMRaaltJ28EfFU
	Ybk4zrOUR12cuH73IB3KEyVJ7nwWZwPQiz6pVf9WTlCyIRg+NA68Wg8KUXcrltX7+v8whD9BvZY
	OzlJmzG
X-Received: by 2002:a17:90b:4405:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3933b8c4cf1mr5657892a91.17.1786714891897;
        Fri, 14 Aug 2026 06:41:31 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb78d512sm2798370a91.16.2026.08.14.06.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:41:31 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] ASoC: codecs: arizona-jack: Balance MICVDD and runtime PM on MICD errors
Date: Fri, 14 Aug 2026 21:41:26 +0800
Message-ID: <20260814134126.1387876-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arizona_start_mic() takes a runtime PM reference and enables MICVDD
before enabling microphone detection. If regmap_update_bits_check()
fails, it only reports the error and leaves both references held.

A later arizona_stop_mic() only releases them when clearing
ARIZONA_MICD_ENA changes the register. An error before MICD is enabled
therefore keeps the device active and MICVDD enabled indefinitely.

Release MICVDD and the runtime PM reference on error, just as for a
successful update which reports no change.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: fbdc60b2a787 ("extcon: arizona: Correct error handling on regmap_update_bits_check")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752b..ec291174660db 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -272,9 +272,10 @@ static void arizona_start_mic(struct arizona_priv *info)
 	ret = regmap_update_bits_check(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				       ARIZONA_MICD_ENA, ARIZONA_MICD_ENA,
 				       &change);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(arizona->dev, "Failed to enable micd: %d\n", ret);
-	} else if (!change) {
+
+	if (ret < 0 || !change) {
 		regulator_disable(info->micvdd);
 		pm_runtime_put_autosuspend(arizona->dev);
 	}
-- 
2.51.0

