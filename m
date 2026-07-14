Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E5381EA1
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030499; cv=none; b=UacgD/T5iseCsDPi771rwRS5Iy8o118T+gEq0ZPbeScUHGRDwZBVbivLV4/BSGx67GEQOE2A1UHCt8uCzCRhsLwjqe5EufY6nYLFsMbsOBxAH9EiOkVhwko7Ln+KDX505nuX5OLTb0HFXymXbgdW75oiq90vRsV9sSoqFoaRS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030499; c=relaxed/simple;
	bh=IP2A4NG1iSAJCV7o+iplwQjKgP9oqVqfntMy+uTxAxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXVgDNlTumoG5dtcfBPirXuh7ujWbG9z2YSDaGmtf+RzO+neNydbikWJsS6TH51EArhVPLKOJPFRFlDCieL3JuJA2ROHQdsG/BVPyamvHwE5WNGct79cMf7BI/v2G27sR+rEn5XWNQ3oKoJaMQcsdbc0c0CtQMSUQrq0s4Ybt80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP28ArT3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP28ArT3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38deea72eebso2102512a91.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030497; x=1784635297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tax8xN+PuIBXPCnVnoDq4zkyzvX1SMkIQO4uphx4hsY=;
        b=BP28ArT3tUsYJja4bmOs77t1QQFskSRL+dCejn+FFW9mNBEoDIk2LLbnTAJZkF79Dg
         uZLR/E7MRndE3le/Xg9kem3L8m7hT9ZLsEX98N4ChLfyqNniprVSsXSvgddOIM9QJU2e
         zYjrBlbg/qh6q0oROKc52siB+UeCnIfhtXuyI8f8KRKR+QKb5eyEnEefm3fCHwNxHgbZ
         P4zdWt5d/9Ja6LZGdrCDPLARO9JfAhRu3auo3INwxcQBTHVvHmnOGszR1pzoEzMOjV9F
         VfXzN4JpLEO9SnvFDt8PQxoSVv9U4DFBWqh3pvETCKCa/qOO36i89wJlQ/zuNWZYIorA
         kZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030497; x=1784635297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tax8xN+PuIBXPCnVnoDq4zkyzvX1SMkIQO4uphx4hsY=;
        b=KOtdhKriVoPV6khndwOIsLqXPLRltaohfKdc2E7TxsA2dmc8/ARyQPSwdOWKZFzNQT
         qF+jKAVjCev3rLsFFB81zevVJoqqBIXGyux39IEsGalxAeCKV2wwWwqmOhWjVbLUE+B4
         OaDEWerKfKfifFjVrLMOG2ww/qs4iTMbD4NJahjeTi3AK4KX+BJdQWL9ytzaH9PV4RZF
         AQpZ3rTeqCDzgxnkG8Oib4jahN9IXvVt14RdzhS+SUhxRNLLz/TXTX/TXW0HokhcChH+
         kRPuqDqZln8+HP6uS8CwLQywQfvfc52uqiggTvvanF5TIUKIanaT/Vc0iC5OFKP/KGIs
         MFdA==
X-Forwarded-Encrypted: i=1; AHgh+RqMRrthx4YsdV7rBE4rPBvA5Ir4UNVA+eBVHv0nH90C7C5FP67FXzYIx4yBBL0+Bnb5m5WBodPoyaGv6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyD448VfXM7N1TKmhkVk/VE2nBE4hXP4omhf5lbzWg/oJ0Jx4m
	YA9WUXsGxmG3hS0n4D5Md01D9E7Xw4BWQgiKOgejL3qEUc9IcRCQM8GzmmE83A==
X-Gm-Gg: AfdE7cmj1kckUiqh1JHCe1WIhyJ7clGcRiXiTo1XJ3dyFulQO/HIDqcd71hGnqt61Yt
	8XTUarSQspo/X3lGLWc1t6hklx/2AURJxTczjw0YvF9uhxIdsH/tf/WqyFoPuxgwlz6os9aDopv
	ow/rya1761kcD6xoQsJcaKuKG0tj9cw7QlMT80ozAvszb5Yk99Vv7MTlHsWIHMlRCAzHpHaRDqb
	IHc7dH/dEIZerjGE+LYjBXeV4jouh0ayT8iGrGGQQKY+L3fQunYM3G/FE9rRjqNjoC2gy264QXo
	97OYyO16owKzpBiGlZJ3kzjyO8FtB0uYnxV/K9lagel5z5SUNtLgoInMjMV+ZyDYjsmB2tebObt
	JMWc9UKraq9bLwLFXGdJ/L6oN+j5jusUxafoSU+I42mnHWkv8IOvU1TVsbT075+4w29QIdWI+HO
	31wuVB7+PVJHJ+f56cw2065ftKaB38cDSsvZNZBeU8mmOOTdU=
X-Received: by 2002:a17:90b:1a8a:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-38e251761camr279497a91.9.1784030497086;
        Tue, 14 Jul 2026 05:01:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:01:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: ti: ams-delta: Use dev_err_probe() for error handling
Date: Tue, 14 Jul 2026 19:00:33 +0700
Message-ID: <20260714120042.491712-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to replace dev_err() followed by returning
the error code. This keeps the error handling concise and
suppresses log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/ams-delta.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 61252359d5cb..1c9342ceaf56 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -574,9 +574,8 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
 		card->dev = NULL;
-		return ret;
+		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 	}
 	return 0;
 }
-- 
2.43.0

