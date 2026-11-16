Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821072;
	b=xtDgS8jG014J4sAFxCue1xDi/5gUVHR4jidkPsLGov3T1GyHh+kN47jKpSJ8nj6C6fAD
	 JHgM4cu4E5eSzOc+hHUD78GYL9xzjvSYHwL3jmzMPzlWht7B55Z7O/iPzHzRJz4Zqf8LG
	 YIwxxHvefm0X/HS400ELWJEgEIMbt1s42CYyxjalgN+PUCRnYqXMmydDIEKh6RWk9VUqA
	 0HmyXkV2lQRp3BDszKBUmrAzg1qpZ+Eotfhndw2bnvtizM9xgZ0BT4YDdchl8TOb3Z/HQ
	 Q4ZsXeZwdyEcBMUMoPPl69WdjqBcA1uzM8u8kl15HqvxQ0EsHanER0CUNZ4r8qYVUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
	b=joGyTFNFYLHqCVVgYpCacQLHK9uKHUDIh/Q3kU9OXeRgK2LS+rT12fVtvLZrObbZkPmJ
	 o99As7RCccH3axagpfzO58A8VbRNHvYk1CunFSSTWTYE2iyh5eyF7L+FM1zm1o7hlo6j/
	 7/gagHg8SOB8/M86TJIQu86gLYMdxFhz50DbdA/WQVe/k7aHl/e4cGAuCnLWla34nEXFO
	 lFoQuljccGMZfSd53nWgRg9JfdEHklg090i3Q15FcNQleVWb1oEcmQslEnS9yypSYkFi9
	 E1p01F+FbbMkA8ERVutL4nt5yn5TrjF+XlS/FDYIdIGc1P0tQYSJziU7ICocJYexDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5TQZv6b;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90F606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B90F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5TQZv6b
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1273053a12.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821071; x=1795425871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
        b=w5TQZv6bsjLSNbXl2UuN7Zz3w6jxJSxACzi6VHaFEopvJshU+ZE/GtvF/oKwaBDwqn
         LcSz5N+EyC8sA8TeI9SX5pR6vDdocRF+l36aCz3jORKV6i3mR8MAZrHgk8cqcJ0Q36E4
         Aoq65Pp2cyExFNweTWWsCA5w6VTfRSl31KYdS9kHfW18qOkVSf4hcMrXU18hDAmolW2J
         2rOf3dqUvA4ZCrmVf5s9MI2IOd85e4PqBa6awZWv8mqZVUFGAIhaFU4yoLRYFo/ED/Mw
         7yWk3u2lP6cNZE0Na0noKBY0zURj9JHYCMHtlTPhzwrye0/cT8k6P7NcBNQAd6bBcwAH
         6Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821071; x=1795425871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
        b=0Fa2wSniHxFB6qP0X9hY5uHNFT9HU4QiL1EYGcy8Sct6sGhHkgVVtDvF1HsUfY/U2m
         YbgiSU0Hq8FmTF2ut6iisqxddMosQAt1C5V+SeIarnLJgwbNhMU3xI8lHWty4bcJYfTm
         mMOlIGvMVX//VYTLag2k6kCzWU88lbcdowFVhu/JEMrQB9une2Qx0KPX9ad6ub1fEiA5
         Tqy/uQTZ9KBuREtsFSAomw++dLdocpeUZeLrCieHmLHipYOZL9LmeA+v3E6JV+YqzBrq
         1XddVUueWMkMV4t6gqGcvBGiMpqNBscCuZfWnMWhLgufcSu/ecgOZVWfb+4lBMf4qgyP
         uPgg==
X-Forwarded-Encrypted: i=1; AL+hErHqX85iX4GXngEXTsfOknP9tC0cICfzOjZIMBDFZ+9titO8qJGY8uhVM2GdVjbKfUiW1W85nj/jTAH9fQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z92hLUuxz1krjClOKA6Llnj4TCMWua3hrliFIe8coRzX0WpGYm7
	uY7fXRrqmOjnjKPF/RwyAHRy+q2Kkvu/5tRRtxEg7pECdgKFpxffsknj
X-Gm-Gg: AZFdTZfvLVFjYDzWEsgv4IK40Pp89oG87aGa2mSvyMNkbriP2Xoey3Cdwc6STTsBOl6
	Te6/cvOMPaGWK1zfgEqbVgwigz/ZvPcTGSofK0leQ6Z5Mur0+2+Let1+T+KWqJXlfz/O4lWl/Uy
	F+CDBzLVvoLv4thoYlA7zvjmtbbP7AjIYlwKVJw7xI54aVIE4tWZEG4QK+h95F/W1rkXqRB6WIo
	tBYIOFw3my9f3z22/tRD1za9JzgH+GkNgqXT5MaGv7dVPnUEyLmBkvAz5va4aIpJaJ0KfnuQ9rZ
	uH5tFRGGbn9WKrdwVLcZ81nxVmy6UnoUtG83XqoIyEPwJfcOvkM3Do7cjgbFIo5DjqvU/YLANzF
	dDYOqvmOVy8YBHToCrXcOjAj0ylOCpBthjt9nIcfsQzWhhZQ+fAqhmCJrxxaHVKr3qwhMnEcMGq
	y5QMd+JmD6Zu3GkjImMv9EhFOiKDZA5UF889MAFT6o5z6IHXQazhHzGb2o6dHKom3zPGBcCy893
	hf0Qed4qUO/uKeTON4qBFOrL1SjCt/6ttlx8FzPsgdh5/iHET+pq7H7G7KATyFN3NLdrtxX06SQ
	QdfSKNuEWKo6iFbHsGZhx83hVY5GkIGo4aNeJxQMmxl3ajA8bpALjyIizQGp6a8QrOLovCPKWF3
	mVCKlRguhl/pjBGZ/oDPaaTpkWtIRwSne0fKyCX+gn4XJ
X-Received: by 2002:a17:90b:1d46:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b1b0a4dd29mr9560360a91.39.1794821071518;
        Mon, 16 Nov 2026 01:24:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:30 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
Date: Mon, 16 Nov 2026 16:24:04 +0700
Message-ID: <20261116092407.514998-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
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

The current code is unnecessarily verbose for handling an optional
clock. Use devm_clk_get_optional() to simplify it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index cb0f3e55b05d..9d8043a85782 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1073,14 +1073,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	}
 
 	/* Get the optional generated clock */
-	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		if (PTR_ERR(dev->gclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_warn(&pdev->dev,
-			 "generated clock not found: %d\n", err);
-		dev->gclk = NULL;
-	}
+	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the generated clock\n");
 
 	dev->soc = of_device_get_match_data(&pdev->dev);
 	err = mchp_i2s_mcc_soc_data_parse(pdev, dev);
-- 
2.43.0

