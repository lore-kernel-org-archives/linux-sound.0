Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167861;
	b=KFnYCqkAL2usiJM6Oc0QyU08HT2dNf9w6L46e1cIkmj9/9m4LbYyAdndGKqR1s/TAXvU
	 3Fq0puI91fu1+Zb/ToCL40hvQkU2yQsusyTdjyQAOkaVqeyPoqEOTzC8tFjqy95HnBpHL
	 LfvVVd5M+xmEHDuHKXXlv3JJJpQKStSYsqHzLnPAPqIvc8ga84zVVABXSsY0aapX13ww/
	 +Q8CvTGbkmUS78Bx1FC03dKQjgzE8PUSAhtyjKFZOuZhb9g0i0DLnoHuymEL/QL0iAosX
	 xUpRhJejSSl7KjFr3ZYwX1scUZ9+n7tBRD8wdbaLB7Ha2SbaDKr5clVGFszXOrk8d3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
	b=WR2KqQ1nhXweIpt1m8aYT5vHceSMSNz6dryzW9L9K0iLXlD4Iu4HmZoDXnOcKEzKkgru
	 pL0+q12ed8qjTUlriWdkix7QEVBfqVIGKnccRcCYvNOFW5Wmo3lv93P554yk6emjQpbJK
	 PO5HIgPJs3kXorIu9u5MJ6EpQuKJ2B0/ev4UDPzYKp1HE+vz4+PxQeSwUitfHGdzF+wqG
	 upIUixpezcCe9qb2D2nhj7jL/fMaDWNH/79eYUL6y0tgNRALMTLO1VwrByp5g3OIn1cbp
	 7IKCMrh7UTnxQqKqOARbWD4FgLUHUe6cyC+S14uruuSgvfrIM/zTv6Mr0yPSaH8q86A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FndfR0JK;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB101606A333
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 09:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB101606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FndfR0JK
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so1119712eec.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167860; x=1795772660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
        b=FndfR0JKp8StOClhw3XHVoOiIhurenT7bz5qhjoNm0Dcd7Nnh1Gz+dxSSbgvT6PWG3
         JMnF8DkCYDqWyfa8GRNTwvTSp0Z2pNikTdFAsw/Pxge1TQNWrvH1PpJRe2V/HDviv1rx
         f51gJX/IEkJz5d2LdDDBsFs0r1AWKywFjSzP9hmCdBWOJ5sVj8TNEY4x+Yng/z9+GyW/
         vwnqZPITzGoII1RTGAb1QQneGvbegkvdqXazg+ADeP+z/S3cS62TyekRmydOVxaubGLg
         z7C8VdJ5wJAwkbvBUGbeKnxPOBW2Inc+DrqLXj/H4Kq2oEmx4X/zridhGG2ov2ZXqDen
         GClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167860; x=1795772660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
        b=lFtZcNEPC4y9Vh/J/YgM4YUOgr0fJkAmgZh7CTPMe/eDqvMFS4S6czor2so6ZoSsSB
         OTkyETHZ+CASlVmNYZ52mhWp+gbNmcfaWMntYZ/I8qD+ssPXssZOmABtUsTsFxfkaDty
         IC3o0JAIYUlzqH/L77e5ZmPBikkZymbP70xMcX5sq+mXpVypGlKgZoBTdFQ1fesH3R6O
         SY7wleKsxg06qwMku/Tiegis6IPl+jbb51SeYhMQhimqz0mlF+g8BuMBbHUa++hHVHEF
         bsTDH0ewh9jMCthDLof9seXtSqIUw7uia/KcqDpQ3MszMfFG1Ceu1/UAOIdMeYzedA35
         woNg==
X-Forwarded-Encrypted: i=1; AL+hErHrGq7kNS+oVmqOZgKXmVMdJ3oLOgCfswYKqhHLUkjZ6eP6UNkorP6qRvSGsf+ywJHfBj4HiSEJzi5U1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pmlS1UEz8CODYHP+6A6N2JUbkyyovJHHs0jAk4+Qwq9pzuAka
	/Bk9nuOxuUBarDwZrJhDnekHL9jWg5hSz4CEdtedf42TLaDbMbFFNNe0
X-Gm-Gg: AZFdTZdnAGbsOuzjQNgwqv9kTS9vCEy11phCKPtwd60XpuMT5g2piJaI4SBrrmfRkFw
	f4KJ82lgh8MT4YO/9jt8EzIhW3T7HmiSdCBZ3PI03xlRH5TUlriqRgoI7w9Z2IWw9qkkocuCmzF
	11xrZbrZzVaOMTnLeGC+Evo2Vbt7AXv8gu906ohY1V8A8ckeStoajaO2Dtz9mG5IwKtU02bVPfT
	vNUN1EruIOK7aPWANx7vBEXU8R/YQYQdzsqtvcir9vOnVFQoGiBVspzdx2fUU2YdjCzW3B69j6y
	IYXxjfZ98qZ9u25ka+k0sP0vEVrpDpwNL1QHAPYFrRQwpvNoIX/w7VJC7gBAzsWtV0y1vwRcV0G
	2oeffZeBd5gP/kp0d2Th1iyehlLPz6jHIR2anwqsArUOdHBxWGWCIv5wsaarv1PeXeinjRP4UUX
	t4f1+xqyy+akzhG0pyF+Z258ISntch5mrY1czIv3WabMnmjSdXky2k0c5ULcmaqS+mBErUsZrl+
	gQjPpNxPe/wAjZ0pSUOh/UprOAVoXGil9KXMnZuyX0NfJsyGERdaa5gvmnmRhBuJk+k2B1OYg0A
	PuppUMnKRnHWwwgR/he04qnQwJq0NEX2xixsxwFz9fMVpszTMpE7YkoenHdO+a2bLyBF/WR5oN3
	gmqwVQaP01VRrPv1KtXVllqt3jo4r+5Xd7ou5bzs7n1Pr
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr2483136eec.33.1795167859917;
        Fri, 20 Nov 2026 01:44:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:19 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: atmel: mchp-spdiftx: Improve probe error handling
Date: Fri, 20 Nov 2026 16:43:52 +0700
Message-ID: <20261120094354.6814-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index fc635ed6856e..6ab32f0b8b8e 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -815,21 +815,15 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get the generic clock */
 	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		err = PTR_ERR(dev->gclk);
-		dev_err(&pdev->dev,
-			"failed to get the PMC generic clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the PMC generic clock\n");
 
 	ctrl = &dev->control;
 	spin_lock_init(&ctrl->lock);
-- 
2.43.0

