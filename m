Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7E363C5E
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915984; cv=none; b=AzW6lNZdNxu0o/aCwGAwF1mRjxyviGAr/jdxsrvqszPTpx8uxzFLXo8GgFgm6F3FFj96GtQZR9kRY41SqeuVRIKSnC0+DFbDQKSZFGcnwbYN7B1kUtzqkZ7LongN43A1o4U4LZUBjY/17QaKd8w4kmUxbJgA2qum1y/koYUaqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915984; c=relaxed/simple;
	bh=vB63GPIU0CT82jKY77Joqx8rSniH5swMQgywJwLQU6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXDGU4wHD0S2Ygxi8bgF8VTTWliBd/HecTLVZYEaORuUi50J3+UnmvenT/HN7F++WAXITJch0XftlWe2jGfNri2ueKcgH6pWn5xtQFwFfEU/1THUg/sHdcs5uigZERDkAxcEybr5nePBaiMkM6/NkVufFwJ+I1FhfnlZnZBoyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkILmkPG; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkILmkPG"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso35455025ad.3
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 21:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915983; x=1791520783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=;
        b=kkILmkPG6HoDCk4r+vMQc1IO53yvfM6ZDHU/0ETuAuFd4VVrHzRhMpayBbr4st+l6X
         MhBnbA8znEJ+bozQyNGWazPOAPvUEaTFmPnOZOAWaC2fA8KEiobaHORJ0G7g8o2JjiAZ
         yvByyBpitx47SJLQ+x11QvtbFPFEFxPActGlz+7v3yBn4p/kDL0+Z6v9mvej0G3jcd45
         D8UFyMctYFOc6cTM06rGoPjzzhehTGcht1J7Wz6QmS/T7e1cYz3WNRz62bW/VQZzyb2F
         r9VZojKisekJ6YnqaBmFCabgcAwvUavX2hDHyFMKOuAy79gIs0ze2jfik4o0gJbDxVWc
         j/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915983; x=1791520783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=;
        b=0B1zXAzzQfGrj1M4PAYU0hh62+bPKpOVFLOf7oPmEPzSH0Np81OUxbmWvAfZ630EQ9
         PYO36Ra/n7CUoiNoPdAwNdcnA0tjXOTJOmh1vIjBwkJp8wKuUd5syT0117ExY1CKuT67
         fi4v2STC4Sf4aLQQVKwuTWneJcBwYn2YL2lhNMJJkqQ77MGCAFfCgc6aTBRZj8HuMmME
         42Va47BqNhhjRv6gwi947HyO+Fg22sDPlKi3nN7zqumwsl97labVy+pPtjvdDEzPtEq+
         r8qRVydZEEtBdCycE6qzb2aIaCHNSJnepbHMbm2LpnB6YgVFbablZckBOIhraEltFgBl
         PBYw==
X-Forwarded-Encrypted: i=1; AKwUvBytHV1+vryY8OpEjZv6JisxW8yACPfmHd/3AXEquzhrA3WUxbB4UGVdbyTPzSNIMrTem5/lAlpN2jiU6A==@vger.kernel.org
X-Gm-Message-State: AFuF++lCAvcfizhL2rp5FCCq8wb4o202Y74Rqr/89jHRjY74fKZT5o+/
	dWb555SftcToy0qlRxgJptIvMHyQpaA2XzvKvKSK+/yrmrcCNQ9sa3jz
X-Gm-Gg: AYBFou2vsx2sZZUyRlXFbvQKb+72CsvnwApm9VbAu/mR+2Hf6SYtc1D29HFn0Ej/OG2
	bMQtEOY0PuF06d4449OjRjIx0djr7crTjiDr9NJayDOBcqiVn6VQ1uaMxh589O8+3tfcRQCSDEb
	6LS5VC8xxy/1sRkv41pTHRAuQmZh/kqI0wjnk0MnWq0BvwSdPqRK/c3c82/An18pMWlU4umWlJ4
	h8tmA8a5RxnbD5hS8DhFMiAf5M7UVi6DwBG4wW1dMNGxVKSrd6g76k2HTHbIBWpqQVPTK+Flh8h
	S2ZmLusZ4ygi932Biddr6L6/vmJobYneZYEC5IcDIf+naAwrARO3MZi6uQn6kp6WL97mGDQfwHu
	kndlSl1khVB7tbOSSfJH9lXvIVp0osK0DmT/1i3l7Qt/Hj8pBFZ8M7tmpdNOp4wO9QjiFmkYNVO
	EXdRqLf1UIHasGzFuCObm7f8z174udCuZG2i+lhXve4vXtUqlPmRRAUSCraxTmna4SUdqK37ts2
	8h8c4DtL3kR35qu7XspL5DZREGLZGDVpil2qw/9iJlbXvzHyKUKbZ+vPJfFNO86tZrfVv63bG55
	VOuOTUIuIcGn1Q==
X-Received: by 2002:a17:903:1d2:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e49b652192mr13098135ad.21.1790915982554;
        Thu, 01 Oct 2026 21:39:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: atmel-i2s: remove redundant error message
Date: Fri,  2 Oct 2026 11:38:56 +0700
Message-ID: <20261002043856.97295-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 9b651eb4f0a4..e1d8af056234 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -699,7 +699,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 					      &atmel_i2s_component,
 					      &atmel_i2s_dai, 1);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register DAI: %d\n", err);
 		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
@@ -714,7 +713,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 		pcm_flags |= SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX;
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, pcm_flags);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
 		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
-- 
2.43.0

