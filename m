Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084486;
	b=S9PY3xBctojbLIe7Mng1T5kSWPHtH9qGwVLTfjO7hIoFOw+V3WgpwM5tOd9OBPbH/ZFd
	 AjjxAnsE0i9OYcmOrg4HGlvOx/q6a34XDK8leyO0/3o0VZ+Z199znN/B5VmvX6gVjz5kh
	 qIthUJ8EvISvHso1nHW9AT7xV87C8ffhZKSBJe+eQi9hojyKiX0AGR0OphSs6YUnsMowC
	 lIesoHKXi5r2+9/vneeDfSy//aSs3wZiAh4BMxDjuj/Nwx7Ikd30ly9CpeRvqoge8NDxa
	 2ZWBmUii88Vi68ghqbVOFwmRPWQaj6RZpYEsuAEagDySOolAyoxN1XoZaagMGqWRTKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
	b=p+ezeNZxeiTfuog74JAkToZIBDNjJ8HxnIIATOwRucAk3d9lGbP5ZpybxQbb6puxMTi3
	 WnJJmU6FvPkVgo2PSfn4VrSEdxE1PSJR3xHzFtYoXPfm0HbOrjIuePnYefUpk+RLdbSUh
	 oi87REGImjkxxjJN1zV93gwiazLT1nYW53D+e0mMs/sK1y2shCHugb3GX6kSqgjYByOji
	 ET+mG6mA5bEuApfJEpXX37ImcoRPv10KPo9YAXSceXwo57i1r8vqbI2hicECyeHkMcYeM
	 wl0GSk0RlLTLuP8xaTjBaQHa4DBxEJun9tVAxbjUFXcv2BKAnxUMZHyTFveAHxVcHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENC9pGUO;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C560A260A
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3C560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENC9pGUO
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03920c477so627125ad.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084486; x=1795689286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
        b=ENC9pGUOPzAAfJrBavhCHwIf5u770e91cAklDZyOyl8lwFe0cZo6nVPVrzC+eQgGtT
         Nvm4s9GmGQ8dncT5BU7aYZ40HtDf3jxyX1qu+9LKDkScvCzi3cCFdTyov26jDMh0CGkY
         lEEJT9NVc82EgbQPfASITAVosnedXfJAeLbxkXGqYHs5+X4emh4ZF/rPXM1kaavonVRt
         ttgUBRzNZw+jjyXdYOI8alZd4lXbstVgPDR4SR9YAUA+LsPgJIfVkaWT+qZGVZhtWC/L
         KCP1uRb5aLwZNFmN4AvPndEcVBzXAjx5oct313TmNDIG1Q0RLzwpcclr8NJ3bw4Wqwhz
         64jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084486; x=1795689286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
        b=BdHl1p4+UH6oem9VPKwpY0PnZwysM+w/fNrn3cMSFaKb1V5SX8AbXkGhTW++Gys++d
         0Bb22TVYohLKohYV4JhmZTAKGEmLxJ4b3gXVwaFIGNwp6s+rBqQA1PogwC7JLHjkSVOj
         UrIHeQg3S5l5EakpRKa0ooIm397SEWcEzX/H1csTeQJbqdcxv1o0MbTlFpcZYPFa+B+7
         o+H6XWxv1Bea51NO1v5T+43/ZL7IygzsoL2EHDoZaPGDCY0iiZuBioIPqH8zlXMNEfhl
         JRzTwWpwu83he8mDOObi4iPwcwgxgcO8HmFEBWUmI0v5wyBFF1H5l/6DIb/wUVo9kIkJ
         j1Ng==
X-Forwarded-Encrypted: i=1; AL+hErHsxHuUJuzbLG/UWtnsesk2KoBXPDEWpxGzC7iDMcny9vbGQFGkNVuqD9KR315ZL4Gyka8uPXQeotjs7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RhtjHbfoPvMbGv0lGRE7VfOKuehPbs5mVs1M2OsjzksrEWgoP
	zLO/Zo2LmhyQvjjWAYaenEpzmHZ6mfqPCoKjQrmYJTa5+zT1axElrrbV
X-Gm-Gg: AZFdTZcZI72bh5VJMFLYTLkUdravpa3X1DrdA4rNZUMZ4E7l8NJYe9XqMiPqJjvvn4s
	dA48drN7q0CwiTTVWa09bUgjBbsI3BLgkLGgLZUB/83K5DlkhTfE4oDjTXptETboSyGEAjP9HA7
	VvMXjl+Y95Y+DzwEI2PO+8SV8OWgucaW++6FZuwvoPMpx0pp+Fnh/xnf+zPK93w7w7b1uTToIwo
	OvbQwrlXgY0HMWjuLvqnbX7g2uDRcBQ5mBBYWttvacG+Qg80DpVjzcVL+FvxHYv6MPYNkRZ/7cV
	bND3AllKaYbtswjHLItrXQWxJkgRyUHHduoKGHUW7vPjDxy87tybdxboNcUxSgVuut8gCYF4Rr6
	g+jt9rekombXwpAIF4dQ0rka0ujfVf4j5OquxIcGtdBrNvEV8D/vxJ37uxtkGdtfzVmbTee/SUD
	VIGiRkAOIXqbRSYapWg1H04CsdTBQFnmtoaJi28wC5JGotI6a5IWIUdc0xaJ51mH/r8VkzWc4VB
	EFgY0wT5oH1722/bsxnSUz2R/KYtf4CR5TC3L6QYsIMofub9Vok9YbM/+YRyOFttyLeK5pH9tf9
	pM9u2uEa9BfAgEtrSNF4hjhVCFwf3qwu4N8471/ju3ahxQocf7ffm3DqWiO0rfYyT35DuF7UsWF
	K/28Jyyr+ps7f/K7vOxKJTNNfev07T3wh3jvv6/PaCZUxskvKOrqbis5bfL3VGwFsTA==
X-Received: by 2002:a17:903:2406:b0:2ed:15af:d38c with SMTP id d9443c01a7336-2eff720e4ccmr54759955ad.4.1795084485616;
        Thu, 19 Nov 2026 02:34:45 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:45 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
Date: Thu, 19 Nov 2026 17:34:12 +0700
Message-ID: <20261119103413.31729-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
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

Move devm_request_irq() after runtime PM setup to ensure the IRQ is
released before the runtime suspend action runs during cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 25122f6ef3c9..41c65e835765 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1113,16 +1113,11 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ. */
+	/* Get IRQ. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
@@ -1168,6 +1163,12 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Request IRQ. */
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
 	dev->capture.maxburst	= 1;
 
-- 
2.43.0

