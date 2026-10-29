Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260970;
	b=R+to0B0JrN+IS+Q9/d4M+BpiLPzgqVBhUBzhOWlS30XCkIoMsyl0lE9wUQ9we3CzUC2C
	 xt1/5zzbWB9Fei46uYL7yp1GB/TGvTDnq99qAfbW0CvytRakTkjh1aVea1zLAwCwvh/LP
	 KYY5YBN1uWBblomWTdW2vm//Ccq3NFck8jLklyTbAgqYzTsdxvB8RtSBeupVCO9etatbl
	 Q9e/At5l+wJaRvjUA7tNrptOaTcsBmmfcWwUftY1FhmnjV64777oosTBKiSgOyJ49v6mV
	 UhcAsm+cybN99gDY9DfGOGLrRfuuRtx4xh3k1VeUK8767fplS2lLSy0PZQpYm1rKgmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeRcowEcJztgoTCNQbpSgSRY43qw49t8iFvIdVsX2rI=;
	b=yK3hZg3CIDwD+EQj0Hvd4JUM3mOc317yqvPSgYDD4aXP4HtwDFcMeJ8lnS+iD0s5J3is
	 TgSfaRUBonCg8mW+DahgbTJE4EiXIFr7p+iDCO5SQ80POFU9+a8OK/vVrPnKfw9Uhh1N8
	 jBLG+vQYl0+6oJ3fM8WsjmvwQ0rPierxgvp5EheCkHuCfbXsV1MWZO7vPTyaosTPmVDia
	 uqi/q1xJQiDE8WANQINUBUSCE2f7aMaUMeQgIQlOTgKFdA6Sw53WT6xfdsDHLs7IyYEiR
	 WeFVdIKUbenjx1U/ohthdeJIbfLdd69HiKNT3CmLOvIrJR+zS/vqEZAjDEsLkS48iBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXYStLfA;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38074606A32D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38074606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXYStLfA
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so1228345a91.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260969; x=1793865769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeRcowEcJztgoTCNQbpSgSRY43qw49t8iFvIdVsX2rI=;
        b=QXYStLfAaS4Q/3RJjB4JyTj3cdZli6O178pczsM98effIniqYEf89O3iKUISQ3gNvZ
         rK93o7KSsxU2sXnMNZEvr5LfHdDFW8FmJOAhH0vZfWW5hhe0PNeVDedupwo1/GhkYml8
         wEsYU8WlvsD6AwWp35igI2Lh5r91x0c5zApu4iT6mWNmbVixhdx4+RMOjNHKE3wMm5mp
         vxidj2JmxtPpSKABk9ow+kCasisVEm2I2WgYCZBr45S7xEdzHHc0R7tH1nn2udKj2yT9
         mV/HbRQBzGM0keKJpqKCnLKacxphL9fJgnKp3vFm4tpPba+AGAaFm0noERI4PECeSTic
         J4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260969; x=1793865769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeRcowEcJztgoTCNQbpSgSRY43qw49t8iFvIdVsX2rI=;
        b=HeKyjPijo5DCYweuyTx2LEDkxauRipqHpUDBAhjWdVyPP9hviks73LABlK96j/GZik
         55kmaKnuosrko8EQU3+wYO15ISZeuiPpnE/rpoNlACfC6/ZdQPjyRlzsNGrIUosz7DnB
         ZEn1g0sv3MLrRJ8SQlummvx0S6EsbB7lFGwjJSqspwO8TKcxGhcpf/ABKmcppL/3j3ox
         JahU+m5eZXfL7gKtCHOeUMdnhpYPFITKaBQCR1LqoIV6gHecNgDjLfjK8HzBge1rkgiD
         VOZPQ6hjWasTwHyjR2gPLxDx5FY2Myk6f09XAYK42rDuE6ebsgJkvEUFjpdM3Pu9sSQW
         QIIg==
X-Forwarded-Encrypted: i=1; AKwUvBwJHpocQ+zOgtrmbKG+2+0Cqpu0W+pauXHF3BeC3b3oQhHkaZbgYl7bOKGoFNPsYh5iVhHq1MZyUKZ3fg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxM7uYnN9THFTv5RXqTEKpw79UpNlWDe2cbV+o2GoMuTC6Wghu
	KlNNUbZHL2eFIBFatQ6SS7kt3KHCXD5QcFRBhhcj0QUeaCXxph+9P71s
X-Gm-Gg: AYBFou2ozUTnqRjcCKnQW3RssdThpsCGBUuHM1AEic2ilvolDg4g6GSST4UBHkkDRmf
	bNLcYXnSPRHYl5yg3RbmpADhoh9upbWg5EB6JfqvoV1qwebpRCbrcdby75Vh3/sbgNrUH4Az8Ww
	HNBKa6CzEZREFkdbRXzbLONbi8VVRJ3qSqPYyg06/wbsBjyBTeHX7Ux7tDta1n2z1h344pvtYWC
	2Ql3kk6/C2HPqktAAIV0hIFvpSmkjn7yJT/N8DiM0S70beQBlHFFS1iO3jWbrhokQl5/54/0sc/
	ZnLPFHpy/UCWmU2AILR17axlW3AmFM0lN8Vafgo9lVN0GsnkdIqP2CztCzBHvLf2KTBCVoC8Zek
	SAbKujwVdnuQ6jqtC9nQ6ORxi8hD/4aH/z6OF6qEBM2NZMtQwsC3i9+kbYHyg84+9KXRjE13r76
	c9nEgbS+QiaAPKp7Q0ZR/qZ9M/OrqTYR9iwJnnIgtCbr3G0cuqK/EiwI1VAFv8IgW7BJVvOwhD7
	5rj2DHLASBiWykmm97fEmAYaSIFmdNSPULa7jSoR5e9PZA1SQmlTfyQHruK+rPoeXU/IljzhdWK
	IqSfUXVakUsQpQ0ToMZtxhURPilYzSP5m+Bp7A/5PtUNOteomruii95DuxxqkU5hwFXwNLHzupI
	GZ8TVVKrWKwOrhra8BUC4N2HGzQH4+r5XoU2uaXZsv4jb
X-Received: by 2002:a17:90b:1c01:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3ae57f63826mr3330013a91.15.1793260969503;
        Thu, 29 Oct 2026 01:02:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: google: Remove redundant error message
Date: Thu, 29 Oct 2026 15:01:43 +0700
Message-ID: <20261029080143.12304-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the redundant error message when devm_snd_soc_register_component()
fails. The errors handled here are already reported deeper in the
call chain, so the additional dev_err() call is unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/google/chv3-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index ebc352bd9e9b..102f931da357 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -310,10 +310,8 @@ static int chv3_i2s_probe(struct platform_device *pdev)
 
 	res = devm_snd_soc_register_component(&pdev->dev, &chv3_i2s_comp,
 					      &chv3_i2s_dai, 1);
-	if (res) {
-		dev_err(&pdev->dev, "couldn't register component: %d\n", res);
+	if (res)
 		return res;
-	}
 
 	return 0;
 }
-- 
2.43.0

