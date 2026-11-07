Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794056825;
	b=Ih/J7wGt30mAUXVXFVMpER1hiNMZnCOo3MJZNqsMmotyDf6VYqitcw1pV0Sk/CpvXNDl
	 BChcRgE+nBJEgvQpcpFlnUXBqcGvaUvYIjvsQwEsx07T1ozf/b2wlbi2BcBUS+tDyo6lh
	 g/hASdxwqS2a/OADGQQCv9bKPmwr/qw2RkA9V2ZqyLllAGp54JjitZTFgOsDvtDFeayfC
	 1Zzn6ygEXd2VO9uoIjx2qT6UCuud5cUP7LrFW+FIOmPRvRXUtG8+zZGur2tNORPEjuEik
	 Sf2qK+J1+CIOfM66lmpwHOeaqawkkm4Pbh5oX212neqnSU8hFB9l27C8EjKyMZcpJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=61Rzp6o+z7DbcxgwTRzElpmwApTyzJgIDqvPIvaYaus=;
	b=4oUrO/rxKP1ADO0l2gSRXNPTgIpU6V0/wfL0pZoL6BLfS1OOICpkeT8bHzAmIY8hiPwr
	 0uABoxh3ov06XFHkq+VAWEH5IBdT4RWqqxmALwF7TNji5hd48oZMkxK/UPmCBswz1LhpG
	 Ozr3ftIcrznM7KSeQJ4Bi3TSXjHuYmAoeCuvtDILxhkZLheL2237/7+nXY4TjX/8hBj+N
	 agiTjecmxvAhbBoD04smQxfr2rIQCEEjQmYi7XR4HE3ER+qvVP7xpim5eFCt5tnjAMq4/
	 sqpyjityawdEjMGsRveepNVxdwCTkEPCVqxJWN6KHjNzY9FO/BHUf5HfXJi1pGzpgnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu6lqaHc;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909F606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 13:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A909F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu6lqaHc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14039015e9.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 05:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794056823; x=1794661623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61Rzp6o+z7DbcxgwTRzElpmwApTyzJgIDqvPIvaYaus=;
        b=tu6lqaHcLt2g7SX8faDpQ3dOYQP+QezLCsfEHldu9X5qEHP2EsbIJrZtamC2k2ZouT
         e4je1KJzbsDcwUgt3SsrIIWDDI09exBzNlLM/p4ROCPKzMjpVxJgBJL+cvdzPndQi7HA
         hYjrdq+1Zy1nmtO30V4/mRIcXAPMrbvyybhbywl9cvu/ZLRzA0WNW2TyZRVN1VDWI2VF
         ZWPsnj/Yk3KsKNKiU/WBHOEx02zudjrBAcdEZSES58psQW+fX8IaED4B5enxj0cVcvLi
         PfEoODFY4vCOz2FA01d9e8dn27zF1dCu6EYzJ6W20bhNLSgRc35SCWASqp+gPt5IdX02
         B09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794056823; x=1794661623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61Rzp6o+z7DbcxgwTRzElpmwApTyzJgIDqvPIvaYaus=;
        b=OOKhzn3HnSwsswE06c6Fnl25tSkDuM2x01n9QIFNGiYc+AsXi/pJWdY7NnmrdVS0TH
         e3crYzBDcdpbrvDhrxOXpsQGrLyAVxI4iSFP3Kc/bVDdjuw+bCuN5ANWAWTrUxaoWxX5
         OD+wpr6hxhFVT70Jp/3LXEDDIZR3sCMiv4B0MhfQCgibOBWasGJy0BsBM1Yeh1VQzq7v
         wvAeyDG/kMm1Z1nDClPF9b8TJuUN/Ffcpog9BqMSzAIyA1q01OJxpXTm8hmd3G0oG8rT
         2jtag2YVDfpFysWeNBSONfhjbBAj74cVaafapYc6sXsjPYzY/23nRJUd4znVTwDlzmxN
         QJ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3NRw19mV+hwNYDUDM3e4jswBKmA/ZmJwdTAaihYIByatNI3t+XJuY9IGbQm2O+2L9/NEikEhwWvU89w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fU8+YdCGYfMpEJ9riK6XF6ELJy+ltm9VRZwLSw5875p3KyP8G
	OBIKmCANfPU3QWNP+VhDUJIEykeu79jLYHIQf9vgCBAvVJPSirUGFYE=
X-Gm-Gg: AYBFou22r1810JExXxZkGP00vfR0yOtwdlYRg+ALM0rYPanhTnPmz245+Asfh6FIZ0h
	vdKZaxCAOhXghCaGZgE10scqX2xT5yZII7LRU7Ms/HMieU8oSKDRKFLyU+k7kPo42899w5V5p+t
	lhZ0IcxVcVtBd5pUvabIEuDl+LSTdT7s5k5oOodqJlVOFuMkhMU8lwlIWHV2mGCL1ksU/kt83FS
	p85/YaakHHHDDrdUBMQIFIrd+0uJz86ekhkTmQmtNEoQ8ziu4IkmESnXat0TycMO/ZTcGgRnSpe
	4SIWadD0Pho5oCuJLb6mvMSw3NpX3+9WhsrxVMxDyE8gH2wH9i5X1Z5Y1HPpsZ67jhIIc+FJAcc
	2YQWrD1AZfGEWZKNN+NHmteG7ph26t0sjZf0D5cK6xjpEk7XDONPTTaPU+RP4QOo4d18IT60W0K
	vkxVqI+H0oaXojrja7UkW+r/+yT3s9wCl4L1h8uW/32hRz4e/x8YZIsvfW1ZM24u3QgVEmdzkxF
	F7DRAgPlFbxMI1lGj3ZZHZxmeDX+pG66PznSB6KNeuV1suIxu1gKXdYTqt174QlxvIk7rcq5vXP
	5lM/SgtwBZkTwxbfXvqe2ksSChsr
X-Received: by 2002:a05:600c:c8a:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4b6e0454dbfmr92462475e9.33.1794056822953;
        Sat, 07 Nov 2026 05:07:02 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm48372785e9.1.2026.11.07.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:07:01 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] ASoC: rt5668: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 13:06:50 +0000
Message-ID: <20261107130651.2059891-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

The cleanup in rt5668_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

If the I2C device unbinds without a card bound, rt5668_remove() is
never called and the threaded IRQ keeps queuing jack_detect_work, which
self-rearms every 15 ms until devres frees the private data.
rt5668_i2c_shutdown() has the same gap: it resets the codec without
disabling the IRQ or cancelling the works.

Store the I2C client pointer in rt5668_priv so all paths can reference
it directly.  Clear stale driver state and mark the regmap cache dirty
in rt5668_remove(), and sync the cache in rt5668_probe() to restore
register values on rebind.  Register a devm action to disable the IRQ
and cancel both delayed works on any I2C teardown path.  Apply the same
cleanup in rt5668_i2c_shutdown().

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 29d70802a046a..2ceae9d9f40f6 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -45,6 +45,7 @@ struct rt5668_priv {
 	struct rt5668_platform_data pdata;
 	struct gpio_desc *ldo1_en;
 	struct regmap *regmap;
+	struct i2c_client *i2c;
 	struct snd_soc_jack *hs_jack;
 	struct regulator_bulk_data supplies[RT5668_NUM_SUPPLIES];
 	struct delayed_work jack_detect_work;
@@ -2213,14 +2214,26 @@ static int rt5668_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static void rt5668_i2c_disable_irq_and_cancel_work(void *data)
+{
+	struct rt5668_priv *rt5668 = data;
+
+	if (rt5668->irq_acquired && !rt5668->irq_disabled)
+		disable_irq(rt5668->i2c->irq);
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+}
+
 static int rt5668_probe(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
 
 	rt5668->component = component;
 
+	regcache_sync(rt5668->regmap);
+
 	if (rt5668->irq_disabled) {
-		enable_irq(to_i2c_client(component->dev)->irq);
+		enable_irq(rt5668->i2c->irq);
 		rt5668->irq_disabled = false;
 	}
 
@@ -2230,17 +2243,21 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *i2c = to_i2c_client(component->dev);
 
 	if (rt5668->irq_acquired) {
-		disable_irq(i2c->irq);
+		disable_irq(rt5668->i2c->irq);
 		rt5668->irq_disabled = true;
 	}
 
 	cancel_delayed_work_sync(&rt5668->jack_detect_work);
 	cancel_delayed_work_sync(&rt5668->jd_check_work);
 
+	rt5668->hs_jack = NULL;
+	rt5668->jack_type = 0;
+	rt5668->component = NULL;
+
 	rt5668_reset(rt5668->regmap);
+	regcache_mark_dirty(rt5668->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -2576,6 +2593,13 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 			rt5668->irq_acquired = true;
 	}
 
+	rt5668->i2c = i2c;
+	ret = devm_add_action_or_reset(&i2c->dev,
+				      rt5668_i2c_disable_irq_and_cancel_work,
+				      rt5668);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_rt5668,
 			rt5668_dai, ARRAY_SIZE(rt5668_dai));
 }
@@ -2584,6 +2608,11 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);
 
+	if (rt5668->irq_acquired)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+
 	rt5668_reset(rt5668->regmap);
 }
 
-- 
2.47.3

