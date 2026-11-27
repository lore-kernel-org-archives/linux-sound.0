Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799184;
	b=kxCny3CgnIkH4GztnwQtMudLtycCnh0BRqIxygtZnclWri4FPuVg3px1IfERPDp6JKtW
	 a6WdcjhOEj7Sd3HEviTaG7RtHLj3W5xAUKfJ3OYWQxYfoEWYAT3us6KvHJoJSFCw2Qtal
	 /Zqb7lEaVtXfmmDXv/e6JcozJTwKMtlxwRCJJnn6DwN6dvylum4ukECLyKAMwIpN5oaXH
	 vpHm7CiCUs9Fn9kBGLwppOlnUbrAxg2331Q2ZoBPs/HSaGbKi3d92LIJRWzq18Yh4iZmY
	 oEsmBMuo7jcau9rK29+kS2naOCaGEQeGw+jrVeDLVbLcic2flLzB5D1rMLVck7XlrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DFW2Ct2DsSBGcZ/nnkFJSQ/DuIGXSSTrp6mc5E+tLnk=;
	b=nJDCwgwwUo6dONnE/lcTkKKwAg96F2kpdk3ykEbhrk4OUIBO/88H3C1jDhPVvPVFeO4W
	 sc0ADBVsp+vyivISd6ZfDUL2dtDkyH42482pxJLB171kfCrwLkGBRj5jyWiMtjV3rJ+pf
	 EaYMddK/bpYgTynGnF/aiiKqfJX2jbBPLCMYVVuaSmVIRp7enRlEMD+oU44DXsHKxbsuL
	 WnQfowL8rhgCKCXhuA75gyFK8Hf1nZJ0bmhYwcYkABH4SGsFoCN6JfqPe1/QPXkuuOGpm
	 LGHYYkUKTjnsSus8brZvlj/wW2UIAXjXHgdtsUmfWQrUFpKNup9JGBU+Q6ZSJQ4yWyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDRiR70n;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8EE606A327
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8EE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDRiR70n
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a358881793so4415785f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799183; x=1796403983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFW2Ct2DsSBGcZ/nnkFJSQ/DuIGXSSTrp6mc5E+tLnk=;
        b=WDRiR70nTbs+a3mS8DcqF5vUJ1R4C88ODijKOheo3DAC3JiyUwGn8F7DCZrZhjggGW
         Maf2LEXyybkRnp7/B5GGxWm2UFD46NR+ETfXL+KpPAlYU8BtW0IZwk2QSAQZ8UF/Ekr0
         OVf13XkBhWt12cYBxpvYqMPOmk4+AkrCwrC4jvWsLg3gG0YuuQ449OozFDkfJpW5AezS
         l7eF+iumn+RHZuSqA0TBqxnX9VOWi6CI5XWfoxXmC4uLMKQa0xEuQLppT/KMt3MMaJkR
         wSEJmv6zePbcRDnjQeuftBh8m2arYd1OZ6gG7riHaAPFaG9OUfpuP9DnrXqu5W+wQ87r
         joQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799183; x=1796403983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFW2Ct2DsSBGcZ/nnkFJSQ/DuIGXSSTrp6mc5E+tLnk=;
        b=DSJyAuoBvMJgWT1j6YTigcJjkPXquCuTJ9Q0w32Vf0IwvwpurGOxYHapgAVgVXulkA
         PZbvvJ3hDHv6LpeYYWYPS1skYBz2COzQA5ov0WAbSX8NSOobaWa/Ca8cJxzEj1LcMFGf
         dyJnB/mK2CCmLA1fSxSwCe5aOE07nAY660+csxjsf9i35i16Z0ikgCbnwAPDkQhTcffo
         xSCdxXGKMf6ad9yqcxaXCZceOUYHxqQiWKldhwSpiTTAGFsXan3SVy10ZCkRq00rzlxD
         fbKs/u+PC+LBzJkgWNYhPmB9vXNhpvFI0Qk0DhQk48tK6qfjvV06Xi08+WCT7kt01Wwv
         YF+Q==
X-Forwarded-Encrypted: i=1; AL+hErFa/MYWQS8czPbVqgm9VDU3OAOxqCxnQBnkRCwKkSZDHmKQYReXoU9LbcP3nQ8vD9mi7DL53efropjgqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9R3SNqsHeK84BGA5ARDGU13ogSPQV1/PoJgOZK3a9Wmw6OQtl
	TCQq13Rk4XJI8vYP6jMTGmmoVyA+y8salXAVkechQxSBqVV1WVgBm5um
X-Gm-Gg: AZFdTZfP8R2YmGpU35Tx1h7FiGvCp1q6/0o7AQ0G1F7Xwloa6EoygVQcgAAF3IVp4Kz
	WIBXGGZnYs/bhMgIqfaJT7FykdVd59hVsQCyiD2tye3qi2vx95+wfdNhYG19i56BNedct9N6AiJ
	2M5rm93kEMq0ZHUhhFlhOAyt9OXDryS/5TlTmuMdkde3WS0gt5q4/QsPBCztXfgplfXQMmDPT7+
	6XJw849KPmOLiyiyQDSxLnhywOZavvczyJ1M/nBHWd7CVi6uLsUne9s1ADdiPwXTVqCvAl2eFUb
	Qkq7aQvovo4QWOpNDtBKRXh9/FMGIyqF5i4qd6Ak2Z5Ix6j4zE7HfQsnlsUEVuRG3bqDwkRo/4E
	M+rUsHKqcHjGchV5Onk2Njtg3/b5zRIHTLNgqN2Upilfv4O0a6KIzY6R3sx6uwptMEmf+LmBmyb
	ZQH69YRzpll5YImTHxLOoV0GRNO8TQYUxABOOR0baKosr88oYuQf0Y62mY0sSXTL30GWklub1Mz
	0k0GL2WmbY10hQAFSNJp392TmWcWxdBdfgKb+otEMxjK359JYwtSpnh6QDDJWO3d1ZS7v/MOg6M
	glY+akPXJzXv2FZIGRC4cOq5e7Lm5J7m3Rq/NZvrwEVj5Ym90uqKakaV4Q==
X-Received: by 2002:a05:6000:2283:b0:4af:e519:cccc with SMTP id ffacd0b85a97d-4b546663d5bmr31920336f8f.12.1795799182654;
        Fri, 27 Nov 2026 09:06:22 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:22 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: wm8962: add GPIO interrupt controller support
Date: Fri, 27 Nov 2026 19:00:38 +0200
Message-ID: <20261127170039.663-3-laurentiumihalcea111@gmail.com>
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

The WM8962 codec provides two GPIO pins: GPIO5/GPIO6 which can act as
interrupt sources. Therefore, in the context of Linux, GPIO consumer
devices (e.g. in this case, the sound card), could make use of these two
pins to handle certain events (e.g. HP detection).

Add support for this by modelling the WM8962 codec as a GPIO interrupt
controller.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/codecs/wm8962.c | 132 +++++++++++++++++++++++++++++++++-----
 1 file changed, 115 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 7122d93a742c..3bbaacb08aaf 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3141,13 +3141,34 @@ static void wm8962_mic_work(struct work_struct *work)
 			    WM8962_MICD_IRQ_POL, irq_pol);
 }
 
+static int wm8962_irq_status_masked(struct wm8962_priv *wm8962,
+				    unsigned int status_reg,
+				    unsigned int mask_reg,
+				    unsigned int *status)
+{
+	int ret;
+	unsigned int mask;
+
+	ret = regmap_read(wm8962->regmap, mask_reg, &mask);
+	if (ret != 0)
+		return ret;
+
+	ret = regmap_read(wm8962->regmap, status_reg, status);
+	if (ret != 0)
+		return ret;
+
+	*status &= ~mask;
+
+	return 0;
+}
+
 static irqreturn_t wm8962_irq(int irq, void *data)
 {
 	struct device *dev = data;
 	struct wm8962_priv *wm8962 = dev_get_drvdata(dev);
-	unsigned int mask;
-	unsigned int active;
-	int reg, ret;
+	unsigned int active_1, active_2;
+	struct gpio_chip *gc = &wm8962->gpio_chip;
+	int reg, ret, nirq;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
@@ -3155,43 +3176,51 @@ static irqreturn_t wm8962_irq(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	ret = regmap_read(wm8962->regmap, WM8962_INTERRUPT_STATUS_2_MASK,
-			  &mask);
+	ret = wm8962_irq_status_masked(wm8962,
+				       WM8962_INTERRUPT_STATUS_1,
+				       WM8962_INTERRUPT_STATUS_1_MASK,
+				       &active_1);
 	if (ret != 0) {
 		pm_runtime_put(dev);
-		dev_err(dev, "Failed to read interrupt mask: %d\n",
+		dev_err(dev, "Failed to read interrupt 1: %d\n",
 			ret);
 		return IRQ_NONE;
 	}
 
-	ret = regmap_read(wm8962->regmap, WM8962_INTERRUPT_STATUS_2, &active);
+	ret = wm8962_irq_status_masked(wm8962,
+				       WM8962_INTERRUPT_STATUS_2,
+				       WM8962_INTERRUPT_STATUS_2_MASK,
+				       &active_2);
 	if (ret != 0) {
 		pm_runtime_put(dev);
-		dev_err(dev, "Failed to read interrupt: %d\n", ret);
+		dev_err(dev, "Failed to read interrupt 2: %d\n",
+			ret);
 		return IRQ_NONE;
 	}
 
-	active &= ~mask;
-
-	if (!active) {
+	if (!active_1 && !active_2) {
 		pm_runtime_put(dev);
 		return IRQ_NONE;
 	}
 
 	/* Acknowledge the interrupts */
-	ret = regmap_write(wm8962->regmap, WM8962_INTERRUPT_STATUS_2, active);
+	ret = regmap_write(wm8962->regmap, WM8962_INTERRUPT_STATUS_1, active_1);
+	if (ret != 0)
+		dev_warn(dev, "Failed to ack interrupt 1: %d\n", ret);
+
+	ret = regmap_write(wm8962->regmap, WM8962_INTERRUPT_STATUS_2, active_2);
 	if (ret != 0)
-		dev_warn(dev, "Failed to ack interrupt: %d\n", ret);
+		dev_warn(dev, "Failed to ack interrupt 2: %d\n", ret);
 
-	if (active & WM8962_FLL_LOCK_EINT) {
+	if (active_2 & WM8962_FLL_LOCK_EINT) {
 		dev_dbg(dev, "FLL locked\n");
 		complete(&wm8962->fll_lock);
 	}
 
-	if (active & WM8962_FIFOS_ERR_EINT)
+	if (active_2 & WM8962_FIFOS_ERR_EINT)
 		dev_err(dev, "FIFO error\n");
 
-	if (active & WM8962_TEMP_SHUT_EINT) {
+	if (active_2 & WM8962_TEMP_SHUT_EINT) {
 		dev_crit(dev, "Thermal shutdown\n");
 
 		ret = regmap_read(wm8962->regmap,
@@ -3212,7 +3241,7 @@ static irqreturn_t wm8962_irq(int irq, void *data)
 			dev_crit(dev, "Speaker thermal warning\n");
 	}
 
-	if (active & (WM8962_MICSCD_EINT | WM8962_MICD_EINT)) {
+	if (active_2 & (WM8962_MICSCD_EINT | WM8962_MICD_EINT)) {
 		dev_dbg(dev, "Microphone event detected\n");
 
 #ifndef CONFIG_SND_SOC_WM8962_MODULE
@@ -3226,6 +3255,22 @@ static irqreturn_t wm8962_irq(int irq, void *data)
 				   msecs_to_jiffies(250));
 	}
 
+	if (active_1 & WM8962_GP5_EINT) {
+		nirq = irq_find_mapping(gc->irq.domain, 4);
+		if (likely(nirq > 0))
+			handle_nested_irq(nirq);
+		else
+			dev_warn(dev, "Unmapped GP5 interrupt\n");
+	}
+
+	if (active_1 & WM8962_GP6_EINT) {
+		nirq = irq_find_mapping(gc->irq.domain, 5);
+		if (likely(nirq > 0))
+			handle_nested_irq(nirq);
+		else
+			dev_warn(dev, "Unmapped GP6 interrupt\n");
+	}
+
 	pm_runtime_put(dev);
 
 	return IRQ_HANDLED;
@@ -3555,6 +3600,18 @@ static int wm8962_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (val & WM8962_GP5_LVL) >> WM8962_GP5_LVL_SHIFT;
 }
 
+static int wm8962_init_valid_mask(struct gpio_chip *chip,
+				  unsigned long *valid_mask,
+				  unsigned int ngpios)
+{
+	bitmap_zero(valid_mask, ngpios);
+
+	/* only GPIO5/GPIO6 can be used as interrupt sources! */
+	bitmap_set(valid_mask, 4, 2);
+
+	return 0;
+}
+
 static const struct gpio_chip wm8962_template_chip = {
 	.label			= "wm8962",
 	.owner			= THIS_MODULE,
@@ -3562,13 +3619,42 @@ static const struct gpio_chip wm8962_template_chip = {
 	.direction_output	= wm8962_gpio_direction_out,
 	.set			= wm8962_gpio_set,
 	.get			= wm8962_gpio_get,
+	.init_valid_mask	= wm8962_init_valid_mask,
 	.can_sleep		= 1,
 };
 
+/*
+ * TODO: implement mask()/unmask()/bus_sync() if required. At the moment, we
+ * operate under the assumption that the pins' function is set to IRQ using
+ * the "gpio-cfg" DT property. The interrupts are unmasked regardless of the
+ * pins' function!
+ */
+static const struct irq_chip wm8962_irq_chip = {
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void wm8962_init_gpio_irq(struct wm8962_priv *wm8962)
+{
+	unsigned int val = ~(WM8962_IM_GP5_EINT | WM8962_IM_GP6_EINT);
+	unsigned int mask = WM8962_IM_GP5_EINT | WM8962_IM_GP6_EINT;
+
+	if (!(wm8962->pdata.gpio_init[4] & WM8962_GPIO_FN_IRQ))
+		val |= WM8962_IM_GP5_EINT;
+
+	if (!(wm8962->pdata.gpio_init[5] & WM8962_GPIO_FN_IRQ))
+		val |= WM8962_IM_GP6_EINT;
+
+	regmap_update_bits(wm8962->regmap,
+			   WM8962_INTERRUPT_STATUS_1_MASK,
+			   mask, val);
+}
+
 static void wm8962_init_gpio(struct snd_soc_component *component)
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct wm8962_pdata *pdata = &wm8962->pdata;
+	struct gpio_irq_chip *girq;
 	int ret;
 
 	wm8962->gpio_chip = wm8962_template_chip;
@@ -3580,6 +3666,11 @@ static void wm8962_init_gpio(struct snd_soc_component *component)
 	else
 		wm8962->gpio_chip.base = -1;
 
+	girq = &wm8962->gpio_chip.irq;
+	girq->threaded = true;
+
+	gpio_irq_chip_set_chip(girq, &wm8962_irq_chip);
+
 	ret = gpiochip_add_data(&wm8962->gpio_chip, wm8962);
 	if (ret != 0)
 		dev_err(component->dev, "Failed to add GPIOs: %d\n", ret);
@@ -3599,6 +3690,10 @@ static void wm8962_init_gpio(struct snd_soc_component *component)
 static void wm8962_free_gpio(struct snd_soc_component *component)
 {
 }
+
+static void wm8962_init_gpio_irq(struct wm8962_priv *wm8962)
+{
+}
 #endif
 
 static int wm8962_probe(struct snd_soc_component *component)
@@ -3940,6 +4035,9 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 					   WM8962_FLL_LOCK_EINT |
 					   WM8962_TEMP_SHUT_EINT |
 					   WM8962_FIFOS_ERR_EINT, 0);
+
+			/* enable GPIO IRQs if need be */
+			wm8962_init_gpio_irq(wm8962);
 		}
 	}
 
-- 
2.53.0

