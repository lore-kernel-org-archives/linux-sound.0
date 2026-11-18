Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036697;
	b=WcYTBaxT3u0rH+wWU3hhbfmEM3jDRRDIcN6dYnEqqx3vR/XIYCtL24u/BL70fXT7tY1Y
	 X8RlKf/AIQh8/70fpWi4r2Db5Psv93+8DTpvjlBw4MxASNhMw1Hh3FQcEwt/NQM3KrqwN
	 wyoNLeeK2rQ6uQFr4sG82HzkFszWs6CPN0OLNnUuQBXFCvApY3sAyJx5J4TwyvA7h6OFI
	 vIaA7gvbR7aVleslgpNGR4ZWb36DCW4CohngY226ebF9oOC3tVtYoJW3SggVV1IEb6KkC
	 Ev1TXu4WtybVGTVTBSce4WpNSMg6xPggsoo6L9x8cSsfV2cbn6FyPLiGvNnfhCCFwfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZgjJ8XS4c/O/84bDgIlPZ0lvCX5UJVbssSmCGQ9+W1o=;
	b=YUQ/7WEuWmjOS9UNj3D+yrPLbzDu14YffMeMrSe54/OpwQKVmHPsFIW/UVxc82gcxHWx
	 JJADdqrEsYy2KI4BJpQ9N5HQvDxyg3EiRqBiqtUKdes49fE/i9zov+fb2FPU7xo43ncVw
	 1JIods8aReqCZXAqAl4qpHUoHeIZ8O7fd7goElQHgBUeL811EKeHARn5XNGOvcIG/7iKp
	 bZDr8LR6TMMf2UKsP8zGMTXFDYNMdFtOGRarERDljoL590OIoDI6TMDIpiFmSxm+rURAV
	 1TeXUS19WzKV73XVyfXn/bKbxTXbqt+2Acc3TGjFcpJ5P+ZDJAlUGDKszy/ddTPgyhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IoQEAp/H";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A4606A320
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 21:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IoQEAp/H
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1967570c88.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036696; x=1795641496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgjJ8XS4c/O/84bDgIlPZ0lvCX5UJVbssSmCGQ9+W1o=;
        b=IoQEAp/H5oVh6B6j7orZgoCIetzlN+Qfybwy2d3ZFRUrLHSdL52w5RxOzRvUiWDPYh
         PXT7uPkXfwkY8QdKa7t9CbRg6Dc26svJVRFPXh0rJ3Epk3ufT/amOonIknH23hadvMWP
         T8FNFaa1JaY4PUTFKIlifcCBqnCMe7bYZHbSj0sknNFu1+SGkToiOvDmpFtlkRQ7FX+3
         KjNc1SfDfMwWdKPA7Q7/zRDY40qm5ZPH4V8gJCg6eD82/sORuhOJU7UQwtNtF2FIs7oQ
         ecrQxKUml32ShzMPf7wR+uSumQlZvdlntuE9QiRZSYqw+dtIT6e49pon9xZu7cwstjaM
         Bt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036696; x=1795641496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgjJ8XS4c/O/84bDgIlPZ0lvCX5UJVbssSmCGQ9+W1o=;
        b=R+9prsYa8aQCA39gNet1qP6O3nFLrTZrUGHFXzU9p58P8ozzfJ0QpX6Be07OawL9KJ
         uL8XXEYHbNRIpaNLmaL7GPfLn2tppnq5y+1bCUe6ZMrjlNJvFxLtayDjffciFB2OSKo/
         1rhf060HUtyyJnymDqIFbZxa3AxBTTeFFY7B/4c1TAlx3zRUUJZ6mmhb4YlL1T5/gVDs
         izbEc3OvJdJmtO+8v2IFnvmflLdP2dApx6cwJhCMDHwsyVIjgRtVkEjHyK0lzQrBNiY3
         6D1sDKV8q7blSRNENyM7DqX5l+iZARJz72Tbj+c0Zg++NMQ6G9qfhl3l8Ity+ueI6e4Z
         8DqQ==
X-Forwarded-Encrypted: i=1; AL+hErF4CAViWCouTFE/VUdlCx+RYHdFD1qTEmtjfxwI9Owewm7PUxsPpb6BicwPEc3NCYugMmMoPYRTiVsBTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9NBuziJKruQxlcDYbdX+xzVYKmY4dtrnDFT36Yp6Raz0AJySOD
	w+Chro2YsqdZcasfHyX2lmq0AJ2nJ+pqfCdnFjPiwsl4G2Ib6lRwpcEj
X-Gm-Gg: AYBFou3PKKD8SdB7Lq5zw4rROIqYuA17V8rlfBbHzptGPaPDXXTGmVWkK9wJFBfk6/4
	cSDEWOIF7dU2yOJaTO3c8iUIH/B40xEyphBN9bJgEhpeydshvH+Kd/o+lwn8JxTu4HLqJs2KYqv
	lmX4xGh/h+9bFGjfJooUpGxSvJVFiT85iw7+CzKg2tikaC6OsXVRxE5hNep8TGLAOpl6U2lNHRb
	oPlOnnnwFV26wdwp5w/5+Gez9qsm3CzVp5DWU20M4GBPFAgBgQQ/AxOqdty2A+mlBO1OjtBu+ZU
	lW2B+FMbBUY37MK8iaXYc1SW0dGQycu2jhs8yY5ZsU2lhZAjMV8dCU8nzH8OgACRkUb14jxRr6s
	A2PytpQEo8Vn5MJD+cFdmwTbGQsDd4XlT9MtJJy8wNXKqk3piC5fqvlav1ffpR+bBFM8Qz9XhNf
	QRMhJTR20GAWklEAq6+3hhwrBv5haEjEPlAltSXaqYyNWaYi94yIgQUHVCxL9VKVj+5gm1PMVuj
	R4MYN1iW1W6knIoFGYBgcLpxT1ZTmUTqCPolw9eHmSMlwozNPFK3CiqerblC1ZZEYTi0c3FS+iy
	hkVHsz0dDlwCJRQFIBbLX5XkA2dpy9zrqj4o6mVrEAabVaVLptZ8K6O1ApIvyTIsl31ImgvRRe8
	Nhw2gKHM05FyaD/nZBtljEw==
X-Received: by 2002:a05:701a:ccc8:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b543cf29damr3110194c88.12.1795036695422;
        Wed, 18 Nov 2026 13:18:15 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:2fea:c6f8:d30d:433])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm8736807c88.4.2026.11.18.13.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:18:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/2] ASoC: pcm512x: Support external mute GPIO
Date: Wed, 18 Nov 2026 18:18:00 -0300
Message-ID: <20261118211800.63292-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118211800.63292-1-festevam@gmail.com>
References: <20261118211800.63292-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@nabladev.com>

Drive the optional XSMT mute GPIO alongside the PCM512x digital mute.
Assert it before muting the DAC and release it after the digital unmute
has completed.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 sound/soc/codecs/pcm512x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index b760561d0ef7..f6f07de133c4 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -31,6 +32,7 @@ static const char * const pcm512x_supply_names[PCM512x_NUM_SUPPLIES] = {
 
 struct pcm512x_priv {
 	struct regmap *regmap;
+	struct gpio_desc *mute_gpio;
 	struct clk *sclk;
 	struct regulator_bulk_data supplies[PCM512x_NUM_SUPPLIES];
 	struct notifier_block supply_nb[PCM512x_NUM_SUPPLIES];
@@ -1463,6 +1465,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
+		gpiod_set_value_cansleep(pcm512x->mute_gpio, 1);
 		pcm512x->mute |= 0x1;
 		ret = regmap_update_bits(pcm512x->regmap, PCM512x_MUTE,
 					 PCM512x_RQML | PCM512x_RQMR,
@@ -1486,6 +1489,8 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 			return ret;
 		}
 
+		gpiod_set_value_cansleep(pcm512x->mute_gpio, 0);
+
 		regmap_read_poll_timeout(pcm512x->regmap,
 					 PCM512x_ANALOG_MUTE_DET,
 					 mute_det,
@@ -1581,6 +1586,10 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 
 	dev_set_drvdata(dev, pcm512x);
 	pcm512x->regmap = regmap;
+	pcm512x->mute_gpio = devm_gpiod_get_optional(dev, "mute", GPIOD_OUT_HIGH);
+	if (IS_ERR(pcm512x->mute_gpio))
+		return dev_err_probe(dev, PTR_ERR(pcm512x->mute_gpio),
+				     "Failed to get mute GPIO\n");
 
 	for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++)
 		pcm512x->supplies[i].supply = pcm512x_supply_names[i];
-- 
2.43.0

