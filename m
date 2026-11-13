Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566285;
	b=Ek4hmzl3qfCF6CNPy80UG81mcGv6r2ddy5I5BoFBwgCPqCRgMPZLm0czFloyla24mAm1
	 zO+ajsIaNs5HiuuiJciVCkuPddYV2GvMnERugxx0/tu7PdqHBUqrCtLjSpLzGYF+z+6UM
	 Tt0XwxvhtTnTFsq8QjGRLqBqmRjcNgfAxkXn7ys7wA/+GB4tq4rvmgbdW/mIqU1X1XdDP
	 1sIrHTRo9woX6tEukp6je99IA9hG0BOb435DmMS6GdYq2xHIjKqrESaTjs/8cm/CSUMUC
	 TxB7LAT5bOWJ9yDiPhVXZUJwRhBi3wEwv+x5hHaIF1mAbaJiQNo+iW+CE97fAi72deA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
	b=4uTySq4YqoDsUNXLqBLXegcAmmAIl44QH1Fr7RI9E0nfKxtqwg7k7OK1UQZoMgwyS1rA
	 E1sSBGkMlO6kyxoAF787GlSdU08C+0DkRMd6n3TiNLZKkfDPfpl4DXQ+Er8ql0u9P2Crp
	 RyFBvdF9SRdVT40Acr3kk9IVN4XOTEA7/zvhV1garV1DwlmyzAa9wwONwWJnpSyubf1JA
	 554SdxXWw45LgwvzFxsl39SiaICWBkTT33VqGPLotTlfUH8sbXCJXTmdpZLnOTgzRXBnV
	 xJkI6sgtm3zTxbhbvBOxS25HxDod42hIiTAsKm7gUFvhdRRnOAN/rSQaKGlgzVeDpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXJ+j4YP;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18FA606A895
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18FA606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXJ+j4YP
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd69954c755so1040985a12.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566284; x=1795171084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
        b=OXJ+j4YPEzROMci4/6WBbpm5mmIBZilGdKCSUh9S4IzpYLnyzdiArHKawdZV8Q3iAB
         ArnfdARK2ycY73RC8AYJjwpVIKZUnzce6gdsuNIpgcRCPgm3XLWC2IEjQgkBM55q9MQr
         HYZPZJwykMZHx4xRWn5bvQEJNwGkRb34r04ttFN50X/7XkxfwwdOl6czUeDfLMNRUfIs
         XSiEpHzhl2r3jKtzdjAvPe2ywW9lFPEQf9zvJa+oFcme8SCkYbumhyG6ydX1m3E4s/2A
         vQVy6F7qwAonKxQHUTmW3PWTIv3FkP6s/Igs0z1Qyzv/wDOfCSSoroSfZWE7HwH2rKV2
         x/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566284; x=1795171084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
        b=ywtmVl2Bp/fD5LTRlX5MAs5kI0H6AhrAQMlnL+gW4t/3utHS1Z4nlUl7REbHMAkaOt
         Mqfwniq6idsKyfbX5mwEMIWmmxMvzCCUsDoKO3xHBSJjanKY7lq+MDeMLAHwiSeC+MCG
         f0H2hFL496SXQQy9lQS3IKRVcDegIPV65wuBQ2CjkmdPCtPrmGfJmy6jWwQoFlL1TFkB
         r8aquEMVLjvkMBM/HRTCOEl+CG5sNiSfrciMIUo5ovvWwsEhxyriw29C4ups9EpqWN5p
         v2JzMdT7+Rp2y8FXKXiPo7Xe1UBapZxpCUx3PMEqO5bUKztr3/GYW/e1VGZcGjnk+VjO
         PTVw==
X-Forwarded-Encrypted: i=1; AL+hErFHFVs2VFWLnSukYXxspkAMKDXlHHXimqBVIqZ0E2QsjJVkcs8OlgmxfVj27BdoZLBFoUbDuiRzeSqr+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TOix+wA5eyBjBu3ZSEvKbwV9Uq1j+4jyNfwFP5lAGeNpWTUpG
	YagJKysZgMDg3WN4qwH8xYJNy/2uVjJcg3W3zjSYIfQ4SsUE531CBcYH
X-Gm-Gg: AYBFou3OHrHmcXitOFo+lw/YDeTBsoEqYgIr3iKk36GljciijJcoXxHn5IcRnkE+d+S
	K+r+7aUJO9WjKbIVeGPiG+1FjVEWWv4UkbbBgRRaNoE1Z4LT7RDA8Et6bSM+NDZXwdZqHcSLegc
	kR4EL/ZTb/aEKOxOALC0kjMT1qHzWKDWIL4QF0Kt0dN7LEDzx9lwWQrj68rmDbdQmRUK/T4iPfb
	ClJhtu9knJLV23twJu1nv6QPwHKYx9vgWtTW91o/UsF8JwFnP1IpU7L4JrjZxFn+UP2yZ6CS2Rr
	mZvCzB307RgycZo7v2dzQna/e84eiFq/bz3tfuNBbqoUEEbYO7heY0sd1ygKgOe5vuLDa2wRIpJ
	G0L7dQ0Tmc+1fgdptLxkYEDw4bj5BCiYt4uaLNipb+8fF8KMngJXZkzzOpgXzqKXonRU0gmFILk
	5PTYiJX2oDEPYXltsk5C8TXX/SudirJ46MsCcqFDJthpIiBuVdEW45fXxTcqq6FP7b/JN+WuNTV
	pgbM90DT8Sy+O7Zg46d1hb3ww46txy7sy8fVXbFuBEIEI2Hjn876q6uphHOma0ec3+LUf37r5uQ
	2xuVtO80WT9KIK2Lh90hL/vU+9ncYKwtQZbp0VFkfECF1fDoykInF/lrJzVouCH9KWBi9Pw54iL
	vuNFm63vvfdVTS1gVLPFeSP5z4aIBpYV0S9PFEerk1zqT
X-Received: by 2002:a05:6a21:687:b0:3e0:d032:31c3 with SMTP id adf61e73a8af0-3f7a7ac97ebmr1933929637.46.1794566283860;
        Fri, 13 Nov 2026 02:38:03 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:38:02 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: atmel-classd: Enable pclk during probe
Date: Fri, 13 Nov 2026 17:37:27 +0700
Message-ID: <20261113103727.30449-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113103727.30449-1-phucduc.bui@gmail.com>
References: <20261113103727.30449-1-phucduc.bui@gmail.com>
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

The peripheral clock is enabled in the startup callback but never
disabled, causing its enable reference count to increase on each
startup and preventing the clock from being gated.

Use devm_clk_get_enabled() to enable pclk once during probe and
automatically disable it on device removal.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 117c8e400184..b6d815804e33 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -122,19 +122,10 @@ static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-	int err;
 
 	regmap_write(dd->regmap, CLASSD_THR, 0x0);
 
-	err = clk_prepare_enable(dd->pclk);
-	if (err)
-		return err;
-	err = clk_prepare_enable(dd->gclk);
-	if (err) {
-		clk_disable_unprepare(dd->pclk);
-		return err;
-	}
-	return 0;
+	return clk_prepare_enable(dd->gclk);
 }
 
 /* platform */
@@ -546,10 +537,10 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	if (dd->irq < 0)
 		return dd->irq;
 
-	dd->pclk = devm_clk_get(dev, "pclk");
+	dd->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(dd->pclk))
 		return dev_err_probe(dev, PTR_ERR(dd->pclk),
-				     "failed to get peripheral clock\n");
+				     "failed to get/enable peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
 	if (IS_ERR(dd->gclk))
-- 
2.43.0

