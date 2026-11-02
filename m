Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638431;
	b=Evm4vFbSP91FWiWoU03ytY5IzXFQfH5GFZwApYl3MnSncD3KkWFdnaN5MGglHpL624Cb
	 EPFKgEHerXb1hAgLuUtRE2mokfYovoHHp1z8KavKEIIThbgwoDtjwPYzcMAsTMr+ndoqs
	 Ou8tt6qH/d2nkRKicNRbGMhCDr81dbShzUddZrj9CdFooFqC/zWUcbsA9bpHc28irs2DU
	 vEXFBHu38eafnNOa+IZM/UVAfAdsXg61bUsl5Ett+Rr1UYGKTWTU81ZeV8quYWa0iIC+L
	 JNmJMwhsSnAKAoclHNeoWvbVgtmtXMhsOBm48aPkav/MDpTTfJHnxI/6pGzWZVEriGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FKqv7bnNQX/8zEXTN67qa4Cr1S0J70BOR+pXSxfvYfo=;
	b=xBs2tar8ThqsOWjc2q4t5UewZgK3jpkZiO4Jr3I1nzdrofibcDeQzhf/WfccMixLxcYv
	 bS0rwWeixjDDRILT6yBAdp+YLokYDAL7oBLpsQe0ZW9Rr4/3qw9yze+4PXL4L/DLMQvi9
	 pfS+dl+1nxQiJZzQo4Ppa8JB6Gwkei6O5/GXh88Hp4ReZtCmlaKDt33DSdyIkMG6eHJlF
	 d0Z127uT90Jm3ud/dQCiGbfjplqz4kw8SEOSASIw3bbBAsF5Y8Wdbn5LhKGtkkFbqrcwA
	 LDoeanqoa3Xzg0+QuikxpD2nLgc+N1DFvwc76cLZT3KZaVVgaHTtiwD4zvUBn/9zLbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4kHbyed;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A216079911
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A216079911
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4kHbyed
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b042c0759so1692531f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638429; x=1794243229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKqv7bnNQX/8zEXTN67qa4Cr1S0J70BOR+pXSxfvYfo=;
        b=Z4kHbyed13kOoAAH+vY0vunbCucbOvrgv/juqfz5g3DiN/noLQKXsg8JROEDofrtZO
         i0g/iUlWDLkUcju3Q9Lqs1cVkCGSiMLWZGnfBAIKqz+9kSI1J74KDjUJ4hEsXDOrbF2h
         /7QlVOX6/NHBhb3EoQ1fo/kPDfuEp40hRmxOkyPveP0fY5zdp0Kz3wn1Hyd9mQH0UKGh
         7SYOx7H00GPl8pYv0mNBVOTNEIDko8WKW3H/p0Umm02HDbTihxNBS9Hdh9ze+n7+t9+1
         r+TbMkkdNl7AOphF/uls/joLz+bamY/B4BG/7ld60QPsv9Ph/dDK3k7iQo0r4RbM4f4i
         LehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638429; x=1794243229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKqv7bnNQX/8zEXTN67qa4Cr1S0J70BOR+pXSxfvYfo=;
        b=Kc2FFIfnECTkSqTDQAFJxTMiuge91a7rt+jh3Zu254R8ooywPTMRaJBmAFWDXHSHw5
         4F8Ai15NWplnScWOMGtTigZ9I25ssdgK7B/kvAxj9vh1VRMYKfKO+4cX96egMpKFxLJs
         iKYHhSm+mf/YIymjB1JKjc0ZeaJQ529rMc+MjY6i6QTzuZsHogDMSXjFaUcqx7exmSER
         YXseGDy+kLX6ko2FR/8sEX/Ikx9W2LqnmUJGnH3Ad9U3D98l57F72nJwdOyKNRJ7Ha4F
         iU0UNI4lhmVGi0MVYgigy4px9i9KkwUlllK912A4RR86VA7XC9D/GbYAM2IIcBC/IEIO
         NuIA==
X-Forwarded-Encrypted: i=1; AKwUvBy/HyYNIX+MyHmpVQfMck8vBFO4vy2r+qfRxVer2I39eNNB8DSXgZIU/LwVgYpnluorBSiV203Qwwfktw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WQ2l7QFFKz6YSafbvKkQJkVRDZrFDl96e4U9BerNXxYeC+0dQ
	emoKzdBo18SudSta+l6iNdNwbvvoYdaLKOOtJpZ5Jq5ofnhpa801vKM=
X-Gm-Gg: AYBFou2i6IBk3/CbSRCOpNN6tXJirWd640eo+tW3QtuYIiPhFD0g74ZyioatmjLR5dK
	IRmzZTwGlxLuRhsS79H92sOv09gX6swDYZAHzHKCzhBX7x2F37LbeDe1zbLX8imsJ4+UNidIDRW
	GSQ3w1nWcasOG+KMmcUDyHl/Ccuj3QncL8hUAiKS3uH3ltG+SF019weYHZRAwaxAkvK3/eTeYtM
	FHbCU6A6SHypLrIkh5zgbRcsZyp7ov5JQWi0plu+ijN06l0IeCWy+mkImQy8iGe1Tw4Db37CUUH
	5JxuuzbIWpoRORlpnQjDjy2WrhBFTkcGGPS9ml7UchLHSuhFGeK1XHWNDJdPgaXxRMZ8ahLydTv
	6RJIGLUSmyrggCujN4XYVPfTXNDI5k6jHw6f6rd69oE/G2ht2uwnl4xKNcF/s6ZDnBjMqr5+eJX
	E2Mjz0ljawA54LJsiYV6nmjjsd8VUamIC7PNgu/y0PBOUVMl50b4RP5UzAvDsaBhcZ3/KuE4DcH
	x1shG92+kqTtp+Cw98y4Yoow/yQU8ikUGm5YckU2n8VbG5+UOMfnwPU5SWQe81zGCLqgj3iQQ==
X-Received: by 2002:a5d:5d09:0:b0:48e:76ab:7900 with SMTP id ffacd0b85a97d-48e76ab7eefmr16659618f8f.17.1793638429213;
        Mon, 02 Nov 2026 08:53:49 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:48 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	Margarita Olaya Cabrera <magi.olaya@ti.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v6 2/4] ASoC: rt5659: cancel jack_detect_work on component removal
Date: Mon,  2 Nov 2026 16:53:38 +0000
Message-ID: <20261102165340.1558853-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102165340.1558853-1-tristmd@gmail.com>
References: <20261102165340.1558853-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

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
index af8051fa69f89..68f7d5673e190 100644
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
@@ -4283,6 +4297,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_2, 0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_work);
+		rt5659->jack_detect_work_inited = true;
 		break;
 	case RT5659_JD_HDA_HEADER:
 		regmap_write(rt5659->regmap, RT5659_GPIO_CTRL_3, 0x8000);
@@ -4292,6 +4307,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_1,  0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_intel_hd_header);
+		rt5659->jack_detect_work_inited = true;
 		rt5659_intel_hd_header_probe_setup(rt5659);
 		break;
 	default:
@@ -4302,7 +4318,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
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

