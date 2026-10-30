Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379866;
	b=xp7CIaKpTdsm8ca70V08mNj/2XPtIn+oJSBsa7rv743oHLDvh3506SPb6AOMx8AkfL+u
	 x1dbMqnvan/3HvNxIUU/GeAX0bAESWb0LlvElP1v35joXjvamJQcWWvXLZZzA7MOPqqsL
	 qj9RbC//AnwZMfWLbXiCsIz9+eWCqvI0BE31cnhc8dXi31lFx4zuO4AeJmlpfMCv3w79i
	 CWKsY6L6112izAajoRQhAzrm8vPXanwFzrmjuCLsA2kj+n3ksPPJgG9jxrQsfNjj6+ugA
	 CHqfCzgQLGIHjKYFpHYez+oQ0NsxhHiIcW5ttwR7vtqjd150HAlNP2NtM5y8r6B/9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FH4Kqn8dco80ci61ZbweWMHJrINyff7bOB9z+yUQ3m0=;
	b=kqEWuGyRo9e+JucRgFX7jD0RMQ8ZwG8i7ngKRvgtW2Lowa/i9nXxp9UJQso8YUsD1kIA
	 uMOoTjgrJNYeAo+G/g7iFvBz0gn46jCNhrZBKNLIUu5O+8hU8QkW0oK/GkmNX7IBYMF/u
	 pFVPVaw+L4pNto8vwlBvg4T2xwXIuVtX3SuHuMfcUMsYNTepoc99XRhU+gshL7X3owff7
	 pcuKTv0CvGMSBOxuxZmmJQ9wDWEADlXSX+dwAvEAaB5c+I2GaYD1BWKLbZS1HEIoTZisf
	 0tSftQm9zLCfZvG+9/x1/PItRE9vGv94F9pKepK5WwiQC03bbBA6SeovfsnFr7KulbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crXTYElq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F2606A325
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8F2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crXTYElq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so9949865e9.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379864; x=1793984664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH4Kqn8dco80ci61ZbweWMHJrINyff7bOB9z+yUQ3m0=;
        b=crXTYElqzOFutlD5BcyY2lnNO9wdIZ6XXNhpB4TGlVAdNu46eNUwo3ezNNXBgwM5mi
         GCjY5dDh1qFWw9TO3YbcvvhL5dTN6IWjTyum6j3D+YFNfpIjNAM/CbxkNykvw5VZbU66
         6kro0i1TFLRlnO+j0sWzd8oWL1AhJoqEZD+t5XuYbcF7p6ewnLc3PoxCZs5RDtnBW+8N
         YjZLHgkYghjotDUu3e2f8mqkJ5hCj9WPUzdmtrCC2H8vvpWRnvf7cvCJPoaCWCblnxuu
         EneyyjB2+empeLFdHl8601ANA8AvT4cIsJvU9FQW4S1qxKpmv9gNlOkf4wQneZZwjZOF
         GDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379864; x=1793984664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH4Kqn8dco80ci61ZbweWMHJrINyff7bOB9z+yUQ3m0=;
        b=TyH894wmuZaKdWExhAZc+xDP6FG4MXWsyVFNIf5Q7xjS18ALZuWL9f2Ujx1wLjGwOz
         AI7+HjYW4XYk/tPuBSCCUG7tBKhOSaUKiHXdsaI2s0paoaYAO8byW/TTioJVxv3C/DSF
         cOOf/i3ICdBJRNazb3hjRphVqX1b1lQgFA/161xAsg6ar4OkpF7f9ik4Gw6LWblJIq7n
         CjNM2skeJ0hJtj2w+baJHDc+gpOkibCM2U2qD22SCMrkHGuOrklLBDs96qtTd/HcbeQF
         BXEWGApivYjzVSxUdBnOofV6okXg1y2t/Uzqm5uRh0MatoYCuP+20B4h7Yw0aTWBKRJn
         JgXw==
X-Forwarded-Encrypted: i=1; AKwUvBw6hil7d8GVogWHI7fB6YcVwyqDjM9U0kq55aYrHq5EFOQ1POrEGnWDAuzXHfRc3Ix7MmYpJgBaQlr1BQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwmPz4Z9d1UjF0kTmAjUcSO2uAwqXtCFYaQtpDaBHTcAsMYA04
	MbALsxQzkBm0teHuYgEDlst96eAF+1koBZ6q6GVvJdKULmMWsB41a/8=
X-Gm-Gg: AYBFou0IkJGC9rNdzgSIuBQK7S0fYxye4uzgVkvtUBjzjbteBv3lfmqFGOxuPY9a4ds
	qVmAHNS1vzlxnYiLr69sVgJ3pXwvX2O41dwcj8JzQvDWY74SgramvFIjNypGr5cACzPxPSYTbVr
	iA5Nig9mUUVNtRuvmvZwW6ICpZI34/bBozatdKaIfHlwUmX0f82POI3Co+dS3NbXwQlYEJSy3Em
	Qo3Y7x5pzmVV4RgvcxW3OJTTuOze9fuSGcfQK2C8c8B7yfdaR7h7cldggl8RAEwWDk36axHOUnO
	6WDg1fBZp9ujE4NrFHahCZq05UfgZESsJ106UjOSbn9+t6RAB6ejKDva/16n2X/J9qjWSBAy8Lc
	1a9zGAtntUNYMoXplFO5kF84Q5fDfomKEJrJ34GEDsEhkOrX+9xvPZZS+g3yGwQ7EumRGsbvHe9
	onXULKziAHdvCLtFXa3C592gQ4wtBweYTyFHm62qLBB7jUg7C84x3jQeaPezGuITsX0JpqTXzkS
	aFpRSksw7LY0ovo4sxAtV7ta76bYBlbwqG1eHCkJw78cND98S+Utn6HjMqppFuhZs3wvlDcHfzN
	PE01O1CJ9kk=
X-Received: by 2002:a05:600c:1f93:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ac180f299emr65008855e9.14.1793379864002;
        Fri, 30 Oct 2026 10:04:24 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm75121785e9.13.2026.10.30.10.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:21 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4 2/4] ASoC: rt5659: cancel jack_detect_work on component removal
Date: Fri, 30 Oct 2026 17:04:14 +0000
Message-ID: <20261030170416.3561618-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030170416.3561618-1-tristan@talencesecurity.com>
References: <20261030170416.3561618-1-tristan@talencesecurity.com>
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

rt5659_remove() resets the codec via regmap_write() but does not cancel
the pending jack_detect_work. Since the IRQ is registered with
devm_request_threaded_irq(), it remains active until after the component
remove callback returns.  The IRQ handler (rt5659_irq) schedules
jack_detect_work, so a late interrupt can queue work that runs against a
reset codec.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  Guard the
cancel_delayed_work_sync() call with a flag that tracks whether the
work was initialized, since INIT_DELAYED_WORK is only called for
specific jd_src configurations (JD3, JD_HDA_HEADER) and cancelling
an uninitialized work is undefined behavior.

On component remove, disable the IRQ to synchronize with any running
handler and prevent new enqueues, then drain the residual
jack_detect_work synchronously before resetting the hardware.  On the
next component probe (card rebind), re-enable the IRQ to restore jack
detection.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5659.c | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..cdf499fb36d67 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3667,6 +3667,11 @@ static int rt5659_probe(struct snd_soc_component *component)
 
 	rt5659->component = component;
 
+	if (rt5659->irq_disabled) {
+		enable_irq(to_i2c_client(component->dev)->irq);
+		rt5659->irq_disabled = false;
+	}
+
 	switch (rt5659->pdata.jd_src) {
 	case RT5659_JD_HDA_HEADER:
 		break;
@@ -3684,6 +3689,15 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5659->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5659->irq_disabled = true;
+	}
+
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
 
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
@@ -4271,6 +4285,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_2, 0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_work);
+		rt5659->jack_detect_work_inited = true;
 		break;
 	case RT5659_JD_HDA_HEADER:
 		regmap_write(rt5659->regmap, RT5659_GPIO_CTRL_3, 0x8000);
@@ -4280,6 +4295,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_1,  0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_intel_hd_header);
+		rt5659->jack_detect_work_inited = true;
 		rt5659_intel_hd_header_probe_setup(rt5659);
 		break;
 	default:
@@ -4290,7 +4306,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5659", rt5659);
-		if (ret)
+		if (!ret)
+			rt5659->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 		/* Enable IRQ output for GPIO1 pin any way */
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index b49fd8baf4e7e..e10b3844501b9 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1813,6 +1813,9 @@ struct rt5659_priv {
 	int jack_type;
 	bool hda_hp_plugged;
 	bool hda_mic_plugged;
+	bool irq_acquired;
+	bool irq_disabled;
+	bool jack_detect_work_inited;
 };
 
 int rt5659_set_jack_detect(struct snd_soc_component *component,
-- 
2.47.3

