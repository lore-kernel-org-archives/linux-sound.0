Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774065;
	b=m1gTwj1wYVGTzp8QpuskyHSYYStBJ5iBmaoodDWF/eE6aj1/LcX6uRumIf9xNhvdRNOy
	 /Ufn9i3IxPUXyGFosO/kmFGYC9tQUdSKClV9bTNIwRjSvOfXSVkY+8tnlhVjAC0cTfeAS
	 cYU+dXyEsthFQCl9aFRUuZTQl6P8CKIEWcM/xAWgN+qLaK9Nessawy4SOHWIQWhZ6eKI0
	 yEh0mumlLcuNkyiKd5pLz7I0u8rNHHVHK/vSPjOkIGQ7jHS1/pQWaVHbC+g9BMDIlssLD
	 CNaYMvrsp6o3wlCoZeddfFSAh/qS0FiaC+DYsPuzeqDWvyUKy7JkiggaTRM/faYgoXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
	b=3ndpsdixmaHyh92yqiuN2nVPEXaZS1xP51VII00B9cFo2mO5UPljDIHtaXdDmLFl53uw
	 guDeSsAaPA97DU+dTFtU7VaKM55Blspn+Wo4pI+ZHMYIMPJaQGaKl9SfEgI4diwx0Yo6s
	 7zEUliAEkWSFBrFlwQ5xYjW5SIjc14+ebqGm/gMBA9FabZv1SQn7AtFFrFxGkFJQhjWVl
	 ZFzIcV1BIeTO2NQcyjLQtyp0OMYkL/xkyQfj48wpFF6G450OTIML/snd4KoqpluddHIG4
	 fCgt09VRfQxIyyv8BNHUcauUCbI5KVYvJq5gr3GAYFOPmP5JUAQwjXE7vV0bbQTMQPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzYTgIJd;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC0606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 10:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzYTgIJd
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b5786e099cso6735267c88.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774065; x=1796378865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
        b=dzYTgIJdpufM0y1GczMQ3KPADpnRlHvaT/vswD1OVNnYdLGaEmIZKTO82G5I8k/PE/
         d0e6Umjs1iJgBMlmvzmO0+5am/ZmHqMh4P5G81HrPCnCUjdQJKt9mkWe/OhHT0WRDYLl
         8RYug8Gwt557Ms6ECYpJcqiQ4yuFtVgKsztUozVe40bIcdqLjw8MxrDqExjpTtpYl2dY
         4VWmBJ4eA79pJZerC/VhLti/TB5JVuVrOsbVujUk7ZFzP/mAjzqQNJTa5OL8vigB62Iv
         RpfeA/jNPB8HbUdEKc1yOa9Pbe96EslnOFPa4lXeo/QM1Bs/YMcB+lCO+Obo98oYcSav
         cwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774065; x=1796378865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
        b=hS3mLtDo7Czsku08ywJAwN50IUYvZENwdJ64HzlSvf9I8myxui4ABkdaOJ+4rFWARs
         V9ZBQnOEx2pz2QHcwp6tBNA92KN+toATaBmFjBtsfZq9ferybj1/MFziM3sELLW/ztXD
         YnDqsB0ljUoO0L0bnp2bhN2/M27trrVxcMZqGFrjKqx6nCQO3TJdQjJ7+MSgVGId2VMG
         ZPdphqEP4UZxkFwm5LFzujk4AG20n6QkRSKJGNQaiHUmB47+/L3rj4EIwzGEEwlNSIxC
         X1Jlb55og3J0+69MTxONf2FdJ+nfLcHN5UJxftDwUDDUMkpwjsNPBl5BrBZ7wpUPD49e
         Lqig==
X-Forwarded-Encrypted: i=1; AL+hErHip3Qb2E2lsHuTvaSvkhWhFH5Hv9bzXKXmv6ysIGu8uaxEZzKgZyPBOclsu639iDNSxa8javAJOmzlMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hNtM+3Hn84dRSrVPi2SkK1haD3/s7o27TQJU4S5NtISopDOel
	fCRQ4acobTRbwiO2Sv9o0i0IbqzZ/yHtYJoxsU9fgH+SrGAXfJmLZzXP
X-Gm-Gg: AZFdTZcspW+dQV41i+BqXnGJJlwlcIKSBZizysnXSMfqp1Vm/qP1d1yUtlWuTpwHEOe
	zTH8wOWXrdyhxuOesopHGaqzK6krX4XjVikqLXH0a4bi5rL/Zasx+Q9MDTCv6y4PnI7y72koFLU
	zFxSk7Ps7GfiT+gKe0+Efto7urgXUnZOZGraHOH4Pq/OfNfjtC0PWnFVePEfhb6eZ7Ep3A+MGOy
	cbyVkDAsZLqUmhAF1tbH0Rx51LOD9H8M2XSDb/bdds2qjrzXBFrmnkvx5tZBjtJ/T+GgBCwup4i
	h1KvFS+8RZFxRVz2ksvIAImlYDY4bySE/3AZwQQbsTH0ifCI1oXOl/11TGdhFy0Iw/TyjZzsGxy
	vwOOG3V5IvBjpWqfBTys1cENt8BCpHoHV2y59P2qS4ejn7gPZpG6rt26Gx/OFiqCY5Z8WE06MEg
	H1fIggajm2S2BDzZRGwiOJ2kqOo6lE6YgirfMRgfTMT+RrXyt8mCProHOQCnOWEl309Ka/TMol1
	3w9NAT5eFTcL8GeNBGqAMv+Mz3SANF2DJT749VrV4NtUq9Xv7bxJzR05MYKe8L1crlPnwWAQ6it
	o+/HBedMN1tGx6CphAwTlFbCUTXFX843k3OYkE6R9bycxEIztmDK
X-Received: by 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr23163707c88.9.1795774064568;
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
Received: from localhost.localdomain ([103.177.252.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm62858991c88.13.2026.11.27.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Fri, 27 Nov 2026 10:06:45 +0000
Message-ID: <20261127100645.3564-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
References: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
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

The driver currently ignores errors returned by
devm_gpiod_get_index() and continues probing. This can cause problems
when the GPIO provider is not ready and the function returns
-EPROBE_DEFER.

Use devm_gpiod_get_index_optional() to handle the reset GPIO as
optional. If the GPIO is not available, the driver can continue using
the internal reset mechanism. If GPIO acquisition fails for another
reason, return the error using dev_err_probe().

Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
because the optional GPIO API returns NULL when no GPIO is assigned.

Fixes: 5f10e84934e4 ("ALSA: atmel: convert AC97c driver to GPIO descriptor API")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/atmel/ac97c.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 234549e17351..3ab6ddb3259f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -670,7 +670,7 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 
-	if (!IS_ERR(chip->reset_pin)) {
+	if (chip->reset_pin) {
 		gpiod_set_value(chip->reset_pin, 0);
 		/* AC97 v2.2 specifications says minimum 1 us. */
 		udelay(2);
@@ -743,9 +743,13 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->pdev = pdev;
 	chip->regs = regs;
 
-	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
+	chip->reset_pin = devm_gpiod_get_index_optional(dev,
+							"ac97", 2,
+							GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
-		dev_dbg(dev, "reset pin not available\n");
+		return dev_err_probe(dev,
+				     PTR_ERR(chip->reset_pin),
+				     "failed to get reset GPIO\n");
 
 	atmel_ac97c_reset(chip);
 
-- 
2.55.0

