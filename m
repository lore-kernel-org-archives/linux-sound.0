Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171626;
	b=4sm34GCBqZKlxLV3LKQH2/8xscOWld2XDdoXYXI258ZHsKqSwGfwokdTx1dM4aHRO3pY
	 1mICeM/0mrHRW/M7uXLvrxSmH5IPKtNKFR0N5YafoRHWqvUFPE+Grc42MhGTMN2hMw7aR
	 NehBZ7BBsG0x/MKGKGpTnEXrP0tcEZ6AlTOjkyn7FOn6YPWTno5gxdbbuEXP8knT+munf
	 y0xTs++oRBP0fMRcJcchNsNXctr7fa1t2g5hUMx/m8TUrRaPYynpDjZFo2p5y056YRuoX
	 eYKEjS8cB9dzwfIYW7ce4eCDjyl/koXrMBHoFs3JXIShRh3rzQD5k5CVGEPeSCpAetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
	b=sqZqRJnWxMWnqfG5tQlRbdGT5z+ovc1B+5cnDQNRgMzubwxLdASkTt03FpTibeU3ghIZ
	 3oU1rL4eobIJ0nx1uf74iao5l9naKc5kCN9hp2HWhU6mnNZG2hOhQ17Q7MlEKOXDNoAPh
	 YGJnoj/5Zuh0Y5Hj96h53qdbDwmUkBRiUkMisv0M/+aQ34UtcI0WXdYcYmtM4yEeHcKvv
	 GctXy8lqzPJjusSvO5unxK3g/HyiPbeLyEtavwR3fDrMdYLC/gL8nMiXqBBoCnR9susos
	 1yy8w/qHmYeHpJn6AeKIMrkpohxsnOi+DBUt1qHsdsRq1n3JCHwGzg6sqXooHa1SwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAaTM93L;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6803F606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6803F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAaTM93L
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3712b6d9843so649491eec.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171625; x=1795776425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
        b=WAaTM93LIjUA71ONRKjoA/sY2kKxRETtNvEO2RJgpgBVUJJfxnOe/nXm589tHKf/iZ
         sQny/8ilsaemTqS7Q9FYv5HtFfuFfx4e23tJPJmrF1pM1ewxWhM07376kdcBK63AY2aW
         /X43B6FFCRVONiMG8mq0VnKfGSnGrj8LZykLRhDo/7NFMZIcHj65QtKe1g25tEy6a0mJ
         v+k57TuwGscZkMiHpI+l1nwrwol1mDdD3T+xeHNpK6Gb348sjjBonG1kBju8ERGZZzEo
         iHeoXxd1d1f9qFQsVa5Vo1l5InD6vQUKSclK9Ne4Fmj0ZkOha/QvKc/COGSzYH5jz9vI
         +6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171625; x=1795776425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
        b=vG1W2Mo8CEWc0WzBZ9GOorutwwmxKAWOAmlCL682kmcUYOfMPoDBZ4nOHhZJSoZ+uV
         fgVNKsjZqvYLPE8I1HiBJAn1tw1WcOLEj2yLAB2iz2DCJ2NoqhG+DjEJR4snbD8qiY/c
         Tpq8AR87tM++OsRMDnuov707iCvb2uztNtE38LgOLrJMN7dBn14pbxQQL04lBbq7J8f/
         i6jd5YN7+XUKAWazZjbdnJKaNxSMtj0jHq8KL8U1HIZLCEjpBSVihk4ZnhCSjHdVOfxO
         lwxhDBnbBkN5iJPO8B9heW9fS3udpEZkPrRJdfS3sfIKfDwTItRYxC9+9E8Ny4HcXCMl
         l0Bw==
X-Forwarded-Encrypted: i=1; AL+hErFvlC5F+DNBWP/KUWPLrG39tDYvjJnYkl/Xnrou5bUPA1fMlvFTzRNmoSYlnQsZdtiRK6MlWWOzcJVzFg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IcGKmDxo+RBgbp2mQG/7tFIA8Bc3yZstMSCEayW5snK95JPFu
	kIjMqaEf44fzbQaSjc7VsWWKgCnVKj6OcRI6ipRblKu3c38Bxi0sVakA
X-Gm-Gg: AZFdTZeJ26DmEIFihuqNwbYqs8FEXMaSalkT/26akSiilIjV00IneEoH0L7Oje9lJUv
	XVtE/wrNNsr3bKXdNdx0tmvYnuMm0mRsWl+h+ATveKPUpLLqPT8CB8xUVKmdiNbnqAgZgPiiZbI
	DJ/d4ONnysee2zbTOXULhbXtFDOXfYitIcXYihmPtJBYELmf7LXff3mxD+yToBkb7MnST+RB4gD
	x4ZVYo0omTA2BmSAy80uhrkA6RrTlW6ci8VePr8P6JmrJvS1zIr8/Jq8zcHPKkwOcZ34HVlSbRg
	bvepo66FLqYU32j5pyl3ggTpqU+YLMa05zkICHEkMW5ncE/JJHDmU0mNKRzFVgKn7I9om9TOakA
	HR+D8kuHSssxUl0EH//326ybvcWDatKR+hQe8/Ultph4GmfSPOQkEenTJEpRZkpLdz45mRo7bIF
	aJo8ZoRqZpCdeTyfHlHkFUPcc6f7eijWIxuaXp4NYT/eoM/sPm8TClr0Q0OafPWT9TV/RngF0P4
	vwRtkWN3umGm+1pZReeMazbYYEHT7tE56ky3l4Q9kMuAbAdenMJHl0R5T0fhoB3sWYcBl5ABufe
	d0cb9Fz63PG/AIwkhA6LR6dzbabUGFE1Ib/9BOxkZAkz527WH4nRCi6VylHNrTd7RcjynTMSP7F
	VdUje0YWd4m4Dh+/aWsohDewXrKLDho44zmCEguVGg6PV
X-Received: by 2002:a05:7300:ff48:b0:385:3595:5e87 with SMTP id 5a478bee46e88-3856fd5b5damr2179350eec.16.1795171625369;
        Fri, 20 Nov 2026 02:47:05 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:47:05 -0800 (PST)
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
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Date: Fri, 20 Nov 2026 17:46:29 +0700
Message-ID: <20261120104630.10240-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120104630.10240-1-phucduc.bui@gmail.com>
References: <20261120104630.10240-1-phucduc.bui@gmail.com>
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

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. While ISR is marked as volatile, IMR is not, causing
regmap to return its cached value instead of reading the hardware.

Add IMR to the volatile registers.

Fixes: c5682e2ba132 ("ASoC: mchp-pdmc: fix poc noise at capture startup")
Fixes: e8c8e9de4ee3 ("ASoC: mchp-pdmc: use runtime pm for clock power saving")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 8b55d864f3d5..4b380dc8b6cf 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -842,6 +842,7 @@ static bool mchp_pdmc_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_RHR:
 		return true;
 	default:
-- 
2.43.0

