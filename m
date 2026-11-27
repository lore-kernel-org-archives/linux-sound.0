Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799187;
	b=e/Nhj8XTSW33ocOyyZaKoNVAYmA0zceKQRbKA6hipmiSGffv9eapoHlSLtFM2eD+/Huw
	 T0khMD7Y/ilVsnVWc6oDCVegXEPErCbcabghM5c/ifku0TO3CjlLy4XUxcy3qLLElgr3E
	 8ubIFjcZy38UJRzlTWVsRGldO7pdVGJMtgoV7mOhp9yRpIo8qMD+G6E1ualBZ2U5a7u7p
	 WMnrDbpmWr44X459sqDq53gcaJ6zjWBEWctAd5nb3ZI2WkY6lc1n76qeaZLa7rbb8N26o
	 7nDZVGd9RG57DejdI7fnQK5ZAyjuhkl7dlIUMZc/vRryOuPAEK0GLDffW/KRogMoJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gvz5aUWafc0NS4kFOYpuamCKKhW8CpbeqSpgoy22VUg=;
	b=ZXRr9LXJDjljPmyFFyHocSSJcgudqnpRQyvnDOndjG0o7MJc+B/YMhzkSE/Q+91VrqsU
	 o3A/bIofDqexIaNNyd7BEPJStRA5RJaPmEh7dYn7ZsiR6A8J93yn4pJFP7cXaYiZqOZQZ
	 MRpDH8aqc1o0SLEUV/zzNVBFm3ytCIUQ28La6Gj3TxosPS9yb9kFsMG1FlReOpQhpwsgw
	 Xnbfj5hL6HZKV2bkIdA4z54PRFiQysUS6zgCNe9VeAifWQo1ETYqua1sq2VXg9t4eX6rO
	 azDBoKxbQ6ZwOKEQtMAjFIQR7db+qfSIto769fPc1WP2vVGsVLSpO2MxZoyfGbiXj4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxxqLANF;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D272606A32D
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D272606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxxqLANF
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so48802745e9.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799186; x=1796403986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gvz5aUWafc0NS4kFOYpuamCKKhW8CpbeqSpgoy22VUg=;
        b=jxxqLANFPpaH1+5y0/cFQT4hhrySxUswtKPuWqXiqDlS+OuyPEOszdX+4++lih1DPB
         clnPVDzTM3S3Y4bNBFk9Af7oOq19s1tpYUuFQaJ86PpLBCUwYymgGlcoxTUpTvUReI00
         gaLqbNAj5Syd1/sNE6tsgSAi24OjO0BzsQ9U3HSQbUHP1aQAujeN76xnw1U1wQQz/BLO
         rdqzjvodbmHIm/ijsQVgS+KEHrgDpX6b1vsr46x5Glyq8wq0E+JwXwAn4ZGnGmrcEQuM
         ggCUVJ7A2xrOOWnX4T2u+MHjHC8XAvprwfu2bSb7t8QK7GzTeap+7NrAIytQ5Z0j38Oo
         0rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799186; x=1796403986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gvz5aUWafc0NS4kFOYpuamCKKhW8CpbeqSpgoy22VUg=;
        b=fTepHxUODagepqdwnFy+SG7zIAiUFuU8T6miK/Q88/RqEZkddPnkPo8AhpJFqaisf4
         13q88cnyHxn7ClhLuvfxW/9i4aYoWNVF0y+Cmgf/l3BYgyAuR/F0Ik5YmuBKTFx0Vw8a
         SFAAOFceJxsrCsgPdOCrLId+jseuRN/N1h59pyhO1QiuDOiA+1mRnXUcyaTejkyDK6zN
         KCSsmKYnmJO5pNdT7W7wi3PD2111k92164UY5rggFY2gRExFjcSAvzicAJLT34rx+1KH
         cMBnSNM12/OowAKvwgCQ7v36+ZLxnU0IQs/JJz74AQzBaRdzPjyzQTyQJmLH22C/uLuz
         QvgQ==
X-Forwarded-Encrypted: i=1; AL+hErHvtb8yQyOsLVIl+zaPLzQ/L8eplBBbRDT2dSGZGTqq3j9kF1/NSMFzhDJatSkbyLOKYT5QIRfXYWm1bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9eldI9hJI3g6GLfpyMN8rSvO2DCOgsqzh05Zb/oOP36wjAKp/d
	HA4XoGKqNDuW1NNIusWPWa4GAKG2sF0oU0C/Bj6vZTvhKzoGsr49n6M6
X-Gm-Gg: AZFdTZer3wAp1FNlIxFxFFB6A2IAcAJHJvmSsbJSnzQenQiegalx52h9GcL5IbPLpKq
	WKKcaimentRMsuLn+Kni9wgBAoUnzhmKOSKDXb8E8QrjJ0GNKkIsnlMhsjn9nipj4ippAkv+aNC
	VxcEXTYz7mzKSavfAlkLtle0nchGHhI1qRDGBQF3uzYiWZNb1se6Jlr0f6221XSuh3uIfVNSOMB
	7TkwszeqCMjBO7m+tmeF/pQikEq49/5qUuOuPZ3bZ0NOLmSMYS/iURvF5Z6S39tureUXfmOHUzy
	LjM+UHVJk/F7I9LcT47TX10t3fm6mXOBOx/C1l/OlUpIqyibbnpKG1yYJgOZ4AW1YjYdT9FQFcU
	h9s6QnsnmsPvzWUJbO43/iXWhGrsjWVNyFaJlfGKTTl7QEN2MO3qqr3gA4upbJj9VxmRzP74gd2
	bf6NnynC4+ck0CoAvoQ5H/57x/5v32EIOglbOA5HXNmo8kaqTwlVehWSPH+vBFz4pfsUvomyMUS
	Kwz/Nmzr5v+Tjn7p5KbngcKdV8ZXvjHrAYS2CLwcJS+2olFCpMbnOsLYqHwPI5yiZbnXoU92aoL
	w9o9Hdxc6oH0m1PHU/93kfkvYk/9uVAzxmCSkbWCn90pr2D+86hRVisZnA==
X-Received: by 2002:a05:600c:c0c6:b0:4bb:b0d8:333c with SMTP id 5b1f17b1804b1-4bbb0d8335emr65847945e9.31.1795799185876;
        Fri, 27 Nov 2026 09:06:25 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:25 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: wm8962: fix interrupt mis-firing during runtime_resume()
Date: Fri, 27 Nov 2026 19:00:39 +0200
Message-ID: <20261127170039.663-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

During testing, it has been observed that the runtime_resume() function
may cause the codec interrupt to become asserted. Interestingly enough,
for the MR-NAVQ95 platform, the logic HIGH signal would sometimes peak at
about 50% of DBVDD (1.8V), which seems to be enough to make the downstream
PCAL6416 chip (which is edge triggered) think an interrupt has occurred
and report it downstream.

A sample of the captured waveform is shown below (sample is taken around
the time wm8962_i2c_probe() is called). WM8962_GPIO2 is the GPIO2 pin of
the codec and is configured to generate interrupts for the downstream PCAL
chip. PCAL6416_INT_N is the PCAL's INT_N pin. The GPIO2 active HIGH signal
peaks at about 0.7V in this particular snippet.

              3.3V

WM8962_GPIO2
                             --------                  --------
                             |      |                  |      |
              0V ____________|      |__________________|      |_____

              3.3V
                _______________________________________
                                                      |
PCAL6416_INT_N                                        |
                                                      |
              0V                                      |_____________

The fix for this would be to mask interrupts during runtime_supend() and
unmask them during runtime_resume() only after all of the operations have
finished (i.e. before returning from the function). This requires the
IRQ_DISABLE_UNLAZY IRQ flag be set to handle interrupt controllers which
don't implement the .irq_disable() callback. This ought to make sure that
the interrupt is at least masked after disable_irq() is called.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/codecs/wm8962.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 3bbaacb08aaf..8c9523d60219 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -4021,7 +4021,7 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 
 		ret = devm_request_threaded_irq(&i2c->dev, wm8962->irq, NULL,
 						wm8962_irq,
-						trigger | IRQF_ONESHOT,
+						trigger | IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						"wm8962", &i2c->dev);
 		if (ret != 0) {
 			dev_err(&i2c->dev, "Failed to request IRQ %d: %d\n",
@@ -4039,6 +4039,15 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 			/* enable GPIO IRQs if need be */
 			wm8962_init_gpio_irq(wm8962);
 		}
+
+		/*
+		 * we are forced to keep interrupts disabled while doing runtime_resume().
+		 * Otherwise, we may end up with some unwanted transitions on the interrupt
+		 * line. Some interrupt controllers may not implement the .irq_disable()
+		 * callback. In such cases, the interrupts will only be masked if
+		 * IRQ_DISABLE_UNLAZY is set.
+		 */
+		irq_set_status_flags(wm8962->irq, IRQ_DISABLE_UNLAZY);
 	}
 
 	pm_runtime_enable(&i2c->dev);
@@ -4131,6 +4140,10 @@ static int wm8962_runtime_resume(struct device *dev)
 				   WM8962_MSTR, WM8962_MSTR);
 	msleep(5);
 
+	/* keep this last - keeps the interrupt line from mis-firing */
+	if (wm8962->irq)
+		enable_irq(wm8962->irq);
+
 	return 0;
 
 cache_sync_err:
@@ -4147,6 +4160,9 @@ static int wm8962_runtime_suspend(struct device *dev)
 {
 	struct wm8962_priv *wm8962 = dev_get_drvdata(dev);
 
+	if (wm8962->irq)
+		disable_irq(wm8962->irq);
+
 	if (wm8962->master_flag)
 		regmap_update_bits(wm8962->regmap, WM8962_AUDIO_INTERFACE_0,
 				   WM8962_MSTR, 0);
-- 
2.53.0

