Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943585;
	b=Q/UjQAfXviVd+IuV932lqz8U/DddRozfpBqRPG156P/KmMRfEzilKzL9eEa1PryxGP4u
	 iQFQQdbtBHzh+AmwXHi07CePhd79Rj+IQNEnkqZ4hWURuv4GeSGkrrS2RdVV9iGgc8oCs
	 YRpuJeXbNzsR8Mocz5uTPAoDy6YDYgpXb99KGSjMLh3cdjyT8jOYk5VTbYQWK6QJf8+9B
	 0nEM8wNL4T+KyzaEL2/StDshhgooHKsbOuaFahhOEFB6uKu2h4yWyKMfhwaYUaKISan6b
	 XeBUhRCQ+p7IsMGeyF1ZwEXgkd19JGb/jDLjT0A4F6IhhL6kMQEmH8DnwhJRnYaF/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Lg4TM9IMIMhK2nsIsgbthrrGhPSByoKtCvAHqP2kGUU=;
	b=l3+9IDnQolQlBxtAP+QbZxSxTWeRx3qFI5c5EPp/SFSEhLvQoPqwJJbqbK5iQeNBcJ1Q
	 l/Ua+sesyf/0f7bQ1Oi3Oxr8AG/yeKCOjCnNVmoZ31OypVqk26ryUPVc4b9TxI2ZbnfUW
	 8iN4kCACUJFKiJR6bfqRBng9oNWB8IeHVjFmoQ3/ZJLJ6F5ouDRdNmKVjPXIQbrlEMegz
	 lSio7Hyr00fsXnEs7Eq0IcbMO+vv8cEsvPgj03250GFRa9U3Gq8zTx8IO6zZFD5p+xzGl
	 pK3IJ0kFQ3rK+htNAJczxOa96jv/py9quPgN2VXiOVrSPaDr/7FBR6Vt0VpjbLoKdXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Wq+KtT2;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B7606D813
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 826B7606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Wq+KtT2
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso481835eec.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943584; x=1794548384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lg4TM9IMIMhK2nsIsgbthrrGhPSByoKtCvAHqP2kGUU=;
        b=0Wq+KtT2lsxt83dC7ROdj8ec4s57qxqQqFn8t0tlLg4/GDFQwXjX/26cIK3n0wZal2
         5JSYFLrG0j69RILfxUt3wgb9VNtwBttR6nFtZy6oIM8UyWN5X49v7ww8m6VVbW0H7yJD
         fxkAgyBOlCFm7W0UvyEksxGjr3YxSGb38C9CDtPVf7i3Nl9LnMVJwmpueV+pSBGtgw7a
         Owyt4lVbkF2kcSspjuXRyfOVYF9aw0HAlk9BnfgC/7mI5+CtTExQP0Wby1aNhr8Q+JVK
         +KWDmxd+/9sy2PaRtp3tGvx36EcMOyfWcU4DcIIpuNoPFj8vY6mddJHQi0QkObD8eNPW
         ltrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943584; x=1794548384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lg4TM9IMIMhK2nsIsgbthrrGhPSByoKtCvAHqP2kGUU=;
        b=gu/J0jNdrGs4rtn8fRFv5whjKewm8kPHMo/tDRKSje9I3+WMKSv+sRXQONHD7rFzTv
         AvZWEjMtWuNmqYsf6xw4ntGcmjwltr9bkIFRryLB9rHMckQTD/MY1yx+Xuxod8a3BNg2
         WRDyRAP/Ax2HFHRUevWDbDJxRlGLOeDCFlp/Hie35eVXuBr6+Zvj2hquY21yCslFj2iP
         hOCoRFe2nIxB8M2bPRJksptmIS4L/Bv41dxgXkNeV+iwSMb+GNa4d36x0Y2nrqTlEaPH
         TCev/mPT+9g5S29OV8pazSBqJ1e/5Ek5NU2hg7OrLv0f/DJ37c6sQzHOBn2yGD5xLeA/
         aZuw==
X-Forwarded-Encrypted: i=1; AL+hErH7k9kF7vKWS6IH/4u/owxxGjQemMUR3229KHUEbp9C232TbsXcVccDFSZuJMxOOksbXCY0ruV2yigd5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YWFqAw2/bL68hi2kXYQKhv+T0KNIMuPqDDS1rid+kaRSYHvI9
	aorBG0ClXc1t6/1kilgpZe00RUc80OGYkLJyGTncQubTFfCwSH4fCZEx
X-Gm-Gg: AYBFou3iIvnQ6WJbXBfxtaemPZ/5oS7B/3D2H0cClOxYCP+aI+i8oA+sscDJzDNnm9P
	yFukcI2gOiUr37Xp4Jj+/g2uPVlfFnQz4pB/5FDCzxLLk8rW43NSdexn+kPJlIUakQeI8BiwV0h
	J7TPGGWisPLnSCIbOFFVgZPzv3Dtq9Y9AgADIvvMcBCf4osQ4lYbZF0AQwOR8NJlpFk/i7uZGbG
	dWuxOX4ZwPggYeBldWzQMkYh0Tw9Iioh1wfNG3XBAwERp4NlSlnVONtj+un9gUR0wrIWVivnyuQ
	RElacVQVw78OoBQP8wvNjyLmySSglUB4z4h3G8cJ21zSWMaU9IxwNnhBjUQb4b8TGvyStDBLJLX
	T+epPDHYJgToUp+lmvTIXlqQoutc3KPbLN/XRaEJkKVpjZwMSNqpPWDxWKqtP4VcYkgwwWfdjg0
	QTitZSOrCcNL92f59AGeQ+DpJUXUtex7BcRPweKR9UjJD8+0bIozPQmBYHUBFVe8gsRijpWNq2Y
	qCtOBmxEZiQmZ22ooQtQVQxaaFPe4Ou8/vnj9SZuwX9jE0UDuVO+Q2XWd3S3G5o6uFNuW61jWu2
	daBkLTwEiEizMGKd983ZjAX/orPMsSbMDiXxVRTrD9uljfJzW2hspp3U8vP5HBMyliLyY503hiO
	sI0qqKyWVEFL3b1sU5hoxWegpafWjQV2ugB6AGw==
X-Received: by 2002:a05:7300:dd49:b0:36f:551:2bd5 with SMTP id 5a478bee46e88-36f7691ac12mr1963344eec.32.1793943583462;
        Thu, 05 Nov 2026 21:39:43 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:42 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:34 -0800
Subject: [PATCH 3/4] ASoC: arizona: drop unused HPDET accessory ID support
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arizona-asoc-v1-3-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
In-Reply-To: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

Nothing in the kernel sets hpdet_acc_id or hpdet_acc_id_line in
struct arizona_pdata, and neither has any Device Tree or ACPI bindings.

Remove both platform data fields and all exclusively connected HPDET
accessory identification logic, work items, GPIO lookup, and state from
the Arizona jack detection driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/mfd/arizona/pdata.h |   6 --
 sound/soc/codecs/arizona-jack.c   | 181 +-------------------------------------
 sound/soc/codecs/arizona.h        |   6 --
 3 files changed, 4 insertions(+), 189 deletions(-)

diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 984b2edfec07..96ef9c97d4cc 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -112,12 +112,6 @@ struct arizona_pdata {
 	/** set to true if jackdet contact opens on insert */
 	bool jd_invert;
 
-	/** Use the headphone detect circuit to identify the accessory */
-	bool hpdet_acc_id;
-
-	/** Check for line output with HPDET method */
-	bool hpdet_acc_id_line;
-
 	/** Channel to use for headphone detection */
 	unsigned int hpdet_channel;
 
diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index d5f14fc8af7f..737984c206a9 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -45,7 +45,6 @@
 
 #define ARIZONA_HPDET_MAX 10000
 
-#define HPDET_DEBOUNCE 500
 #define DEFAULT_MICD_TIMEOUT 2000
 
 #define ARIZONA_HPDET_WAIT_COUNT 15
@@ -92,8 +91,6 @@ static const int arizona_micd_levels[] = {
 	1257, 30000,
 };
 
-static void arizona_start_hpdet_acc_id(struct arizona_priv *info);
-
 static void arizona_extcon_hp_clamp(struct arizona_priv *info,
 				    bool clamp)
 {
@@ -455,79 +452,11 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 	return val;
 }
 
-static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
-			       bool *mic)
-{
-	struct arizona *arizona = info->arizona;
-
-	if (!arizona->pdata.hpdet_acc_id)
-		return 0;
-
-	/*
-	 * If we're using HPDET for accessory identification we need
-	 * to take multiple measurements, step through them in sequence.
-	 */
-	info->hpdet_res[info->num_hpdet_res++] = *reading;
-
-	/* Only check the mic directly if we didn't already ID it */
-	if (info->hpdet_id_gpio && info->num_hpdet_res == 1) {
-		dev_dbg(arizona->dev, "Measuring mic\n");
-
-		regmap_update_bits(arizona->regmap,
-				   ARIZONA_ACCESSORY_DETECT_MODE_1,
-				   ARIZONA_ACCDET_MODE_MASK |
-				   ARIZONA_ACCDET_SRC,
-				   ARIZONA_ACCDET_MODE_HPR |
-				   info->micd_modes[0].src);
-
-		gpiod_set_value_cansleep(info->hpdet_id_gpio, 1);
-
-		regmap_update_bits(arizona->regmap, ARIZONA_HEADPHONE_DETECT_1,
-				   ARIZONA_HP_POLL, ARIZONA_HP_POLL);
-		return -EAGAIN;
-	}
-
-	/* OK, got both.  Now, compare... */
-	dev_dbg(arizona->dev, "HPDET measured %d %d\n",
-		info->hpdet_res[0], info->hpdet_res[1]);
-
-	/* Take the headphone impedance for the main report */
-	*reading = info->hpdet_res[0];
-
-	/* Sometimes we get false readings due to slow insert */
-	if (*reading >= ARIZONA_HPDET_MAX && !info->hpdet_retried) {
-		dev_dbg(arizona->dev, "Retrying high impedance\n");
-		info->num_hpdet_res = 0;
-		info->hpdet_retried = true;
-		arizona_start_hpdet_acc_id(info);
-		pm_runtime_put(arizona->dev);
-		return -EAGAIN;
-	}
-
-	/*
-	 * If we measure the mic as high impedance
-	 */
-	if (!info->hpdet_id_gpio || info->hpdet_res[1] > 50) {
-		dev_dbg(arizona->dev, "Detected mic\n");
-		*mic = true;
-		info->detecting = true;
-	} else {
-		dev_dbg(arizona->dev, "Detected headphone\n");
-	}
-
-	/* Make sure everything is reset back to the real polarity */
-	regmap_update_bits(arizona->regmap, ARIZONA_ACCESSORY_DETECT_MODE_1,
-			   ARIZONA_ACCDET_SRC, info->micd_modes[0].src);
-
-	return 0;
-}
-
 static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 {
 	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	int ret, reading, state, report;
-	bool mic = false;
 
 	mutex_lock(&info->lock);
 
@@ -552,18 +481,6 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 		goto done;
 	reading = ret;
 
-	/* Reset back to starting range */
-	regmap_update_bits(arizona->regmap,
-			   ARIZONA_HEADPHONE_DETECT_1,
-			   ARIZONA_HP_IMPEDANCE_RANGE_MASK | ARIZONA_HP_POLL,
-			   0);
-
-	ret = arizona_hpdet_do_id(info, &reading, &mic);
-	if (ret == -EAGAIN)
-		goto out;
-	else if (ret < 0)
-		goto done;
-
 	/* Report high impedence cables as line outputs */
 	if (reading >= 5000)
 		report = SND_JACK_LINEOUT;
@@ -581,11 +498,8 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	arizona_extcon_hp_clamp(info, false);
 
-	if (info->hpdet_id_gpio)
-		gpiod_set_value_cansleep(info->hpdet_id_gpio, 0);
-
 	/* If we have a mic then reenable MICDET */
-	if (state && (mic || info->mic))
+	if (state && info->mic)
 		arizona_start_mic(info);
 
 	if (info->hpdet_active) {
@@ -654,55 +568,6 @@ static void arizona_identify_headphone(struct arizona_priv *info)
 	info->hpdet_active = false;
 }
 
-static void arizona_start_hpdet_acc_id(struct arizona_priv *info)
-{
-	struct arizona *arizona = info->arizona;
-	int hp_reading = 32;
-	bool mic;
-	int ret;
-
-	dev_dbg(arizona->dev, "Starting identification via HPDET\n");
-
-	/* Make sure we keep the device enabled during the measurement */
-	pm_runtime_get_sync(arizona->dev);
-
-	info->hpdet_active = true;
-
-	arizona_extcon_hp_clamp(info, true);
-
-	ret = regmap_update_bits(arizona->regmap,
-				 ARIZONA_ACCESSORY_DETECT_MODE_1,
-				 ARIZONA_ACCDET_SRC | ARIZONA_ACCDET_MODE_MASK,
-				 info->micd_modes[0].src |
-				 arizona->pdata.hpdet_channel);
-	if (ret != 0) {
-		dev_err(arizona->dev, "Failed to set HPDET mode: %d\n", ret);
-		goto err;
-	}
-
-	if (arizona->pdata.hpdet_acc_id_line) {
-		ret = regmap_update_bits(arizona->regmap,
-					 ARIZONA_HEADPHONE_DETECT_1,
-					 ARIZONA_HP_POLL, ARIZONA_HP_POLL);
-		if (ret) {
-			dev_err(arizona->dev, "Can't start HPDETL measurement: %d\n", ret);
-			goto err;
-		}
-	} else {
-		arizona_hpdet_do_id(info, &hp_reading, &mic);
-	}
-
-	return;
-
-err:
-	/* Just report headphone */
-	snd_soc_jack_report(info->jack, SND_JACK_HEADPHONE,
-			    SND_JACK_LINEOUT | SND_JACK_HEADPHONE);
-
-	pm_runtime_put_autosuspend(arizona->dev);
-	info->hpdet_active = false;
-}
-
 static void arizona_micd_timeout_work(struct work_struct *work)
 {
 	struct arizona_priv *info = container_of(work,
@@ -961,16 +826,6 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void arizona_hpdet_work(struct work_struct *work)
-{
-	struct arizona_priv *info = container_of(work,
-						struct arizona_priv,
-						hpdet_work.work);
-
-	guard(mutex)(&info->lock);
-	arizona_start_hpdet_acc_id(info);
-}
-
 static int arizona_hpdet_wait(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
@@ -1009,10 +864,9 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	unsigned int val, present, mask;
-	bool cancelled_hp, cancelled_mic;
-	int ret, i;
+	bool cancelled_mic;
+	int ret;
 
-	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
 	cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
 
 	guard(pm_runtime_active_auto)(arizona->dev);
@@ -1039,11 +893,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	val &= mask;
 	if (val == info->last_jackdet) {
 		dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
-		if (cancelled_hp)
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
-
 		if (cancelled_mic) {
 			int micd_timeout = arizona->pdata.micd_timeout;
 
@@ -1062,13 +911,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 			info->mic = false;
 			info->jack_flips = 0;
 
-			if (!arizona->pdata.hpdet_acc_id) {
-				arizona_start_mic(info);
-			} else {
-				queue_delayed_work(system_power_efficient_wq,
-						   &info->hpdet_work,
-						   msecs_to_jiffies(HPDET_DEBOUNCE));
-			}
+			arizona_start_mic(info);
 
 			if (info->micd_clamp || !arizona->pdata.jd_invert)
 				regmap_update_bits(arizona->regmap,
@@ -1080,12 +923,8 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 			arizona_stop_mic(info);
 
-			info->num_hpdet_res = 0;
-			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-				info->hpdet_res[i] = 0;
 			info->mic = false;
 			info->hpdet_done = false;
-			info->hpdet_retried = false;
 
 			snd_soc_jack_report(info->jack, 0,
 					    ARIZONA_JACK_MASK | info->micd_button_mask);
@@ -1252,7 +1091,6 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	mutex_init(&info->lock);
 	info->last_jackdet = ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS);
-	INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
 	INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
 	INIT_DELAYED_WORK(&info->micd_timeout_work, arizona_micd_timeout_work);
 
@@ -1322,15 +1160,6 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		return ret;
 	}
 
-	info->hpdet_id_gpio = gpiod_get_optional(arizona->dev,
-						 "wlf,hpdet-id-gpio",
-						 mode);
-	if (IS_ERR(info->hpdet_id_gpio)) {
-		ret = PTR_ERR(info->hpdet_id_gpio);
-		dev_err_probe(arizona->dev, ret, "getting headphone detect ID GPIO\n");
-		return ret;
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
@@ -1338,7 +1167,6 @@ EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
 int arizona_jack_codec_dev_remove(struct arizona_priv *info)
 {
 	gpiod_put(info->micd_pol_gpio);
-	gpiod_put(info->hpdet_id_gpio);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_remove);
@@ -1584,7 +1412,6 @@ static int arizona_jack_disable_jack_detect(struct arizona_priv *info)
 	arizona_free_irq(arizona, ARIZONA_IRQ_MICDET, info);
 	arizona_free_irq(arizona, jack_irq_rise, info);
 	arizona_free_irq(arizona, jack_irq_fall, info);
-	cancel_delayed_work_sync(&info->hpdet_work);
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index 499891e62183..766a29a23893 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -94,13 +94,11 @@ struct arizona_priv {
 
 	/* Variables used by arizona-jack.c code */
 	struct mutex lock;
-	struct delayed_work hpdet_work;
 	struct delayed_work micd_detect_work;
 	struct delayed_work micd_timeout_work;
 	struct snd_soc_jack *jack;
 	struct regulator *micvdd;
 	struct gpio_desc *micd_pol_gpio;
-	struct gpio_desc *hpdet_id_gpio;
 
 	u16 last_jackdet;
 
@@ -117,14 +115,10 @@ struct arizona_priv {
 
 	bool hpdet_active;
 	bool hpdet_done;
-	bool hpdet_retried;
 
 	bool mic;
 	bool detecting;
 
-	int num_hpdet_res;
-	unsigned int hpdet_res[3];
-
 	int jack_flips;
 	int hpdet_ip_version;
 };

-- 
2.56.0.506.g506a7eabc5-goog

