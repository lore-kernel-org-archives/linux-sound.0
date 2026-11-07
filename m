Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072409;
	b=m5kg9XkvJlRTX9yFATiO2xcK1fCmG/UiJYDJE42Qm0cgpBIieyPfjoLxIwe+KSFwO5Bx
	 jRcBGbJK9OI2f2RHT9glNxzRniHqp/M+AnHVUBVAUDdeJWAMGK2UGLS1fbK5wRXjjuGNk
	 Djz9HLJ0Uastloau2fKxzXtB11w4p9ETm1kwxUU0FlsyEXDFcGwIaha9HKMIp+OqocrNB
	 ieYdBvV1MBmmWCgmba4ZkQ6VQb6SZxEBwque2i9PctiNx09hMgDJpxUbsBL5azYIHwRdi
	 0qpJunaW4rAZ0kBrBOS8xDV5Xa3NCfTonJKfLb3jQJVTeUb9xvgRbjf9F8XthIzo/YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XV6wxG2nZJByfpNN3e1VBlwYw+pc47/AaJqMCpAEg68=;
	b=5bQ8QpmNf9mLiFeC4o6AwY2255OBIA8P2DnQBIF6gucT5L7uF8uV/SvNycswb0eXfvun
	 zijbwV1fSuW1PSZEiMACVf6/0BX3k5IkefX206e+ibbKrxRyZJwmzk132SRYUmrVKmKyD
	 ooPj6e0olU2/KlZ+le5th/jlBq/+6/OVGseZL1vIdhY5wJjdJuyxCABfUUZAExBSUsEKC
	 k+krjqJwL5x+nsiDMbkD/FURLXP64d6JzJvYoYfNrTu44Ru/PbuWLzAL8ssb51UZfIWfc
	 g7ZDe1tQf5sKorfyeqIithW3WVR4WssLn8eKybh8OuoeQXwvZqkpUmBQNzIeCrFBa1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt4jcXCR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF01606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 17:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF01606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt4jcXCR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12849915e9.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 09:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794072407; x=1794677207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XV6wxG2nZJByfpNN3e1VBlwYw+pc47/AaJqMCpAEg68=;
        b=Nt4jcXCR2I5OQQRcrsTp1xOTUSgtpm9qChh0o8i0Z7Z1IcUMe62Pm0pozzy61U7GKf
         ycXgJlSOOZG5y6y2XcMXLMMfzJPw5moNZA/UYfKoMusMeDT9fnI4+Aq2RnNEhtk71nzw
         VdjUTV3pyKOhah/b4fa8Wg+eazW1hJNWju9LI5mz/iOrEjhJYVTbTEiUcO0hvR/JCqtw
         K/Lv+4mhCrdWOqR98i6CguXtkyhOfEyZQaipQwg5ZzQxZo58WGDT83k5jdMHEMLveNWm
         woIZhU47y6W4rOFx+y89Z6oF0ZPWwa//3+Gvu22lFhtabzU1t3EgfdKSrgFjoEs/XGeb
         QvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072407; x=1794677207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XV6wxG2nZJByfpNN3e1VBlwYw+pc47/AaJqMCpAEg68=;
        b=pnvgqvK9Vkh2FhasvulD0LTo0Wdi8sKN24vXRB8OXpgL5P+qxJ7HWdSbDhBKS5vkbk
         iOwzQuPnQp2kyl6R+y2SgvIXXyV89g2sT424hMq8ywL4VD6q9AosgNDlwq3RruXl6qoZ
         g358BOtQFgmK7R3Af5ru+RPpCVpEHfTlDKl+UlDtXD7MK4fmLGLgHNynoaIdag3QeMG/
         vjwRpI5PecXrIaD2p/D3X/VB1631z00z1QDRknDxJjWYvufXcw3U0cwPmPHLp9Eg686k
         dPT/VqgyKNqrxeHE9dQ1yIC6NyFQd4b9BAYsBhChSo9RWo5KwRKKn+pNKHlofY+Y40VF
         CLSg==
X-Forwarded-Encrypted: i=1; AKwUvByNmrxU1IooQ9gqu+Z/Y3apBqoX536sLHY+YguHKIEF+uUJ2HC0eHiVZnk+gu9/WKIws5Y/IqL4MP4tJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+j5oCbh42I4JyDxQ6aegD2mLzEn2U5XJ7e7LpAUeE3iVD5z3Gp
	xqijlVfvD5td43rhlNYOaBz+vPqoRmfqIBSEjoDXvK9rEUPn0CJPoNw=
X-Gm-Gg: AYBFou0QwrzzKja3ql5rmt8z3I8vPG4lI8yd/T8OxspHkgsJZJJH9gqbGH/rxoOaMM8
	+u85nVJhETWgOvKINr9+l1ycmOMR2toMIQhGCg57IUOXAXOh327oXNK6HheV7KpXlzykzB5g9a7
	7XAAhbZZo66FmdVXQz4BWWfNKfDR/E37Kfx9TgBUWTEFotuvvM0bCe3YdM9J0RtWnDpVEJlPOqf
	zNmZW26/I5gXZednMk5qmvr8v96tOm0aE4R8daRcglX/EJwgsIBIc7bb1yZjGri04t0iaQY/yBd
	HvwyS0JmPkbsN5+2QgLkHNoMossPDLFvGNqHHWdxO3sLKXyLZXDnow6mr8RhScP+5C1ALljRx4R
	Q7td4LWSmHbeEwwa3XfDHW49DQK0054IJxFOJxtqjapKH/F5/vDdSPrYLwwxjjYpIq7Q0cose8W
	S3FknEyaBuDk1WBUf8zHIdNbmKhiupj7z2EyBQMZ9m23w1wtjmULiLXZfSs7WUAwW+ZdigRZJGH
	cUqsBSNk+LtZRRKFXacnjogb+I+5f+phj5SCdEWiF3uKgyHi2yMIs84ZwzbKQR1oHtj5LGTkqoZ
	yHKSs0cyoF9tWRY=
X-Received: by 2002:a05:600c:6384:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4b6dea6a00cmr108689285e9.19.1794072406654;
        Sat, 07 Nov 2026 09:26:46 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d60e78sm10471054f8f.1.2026.11.07.09.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:26:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v3] ASoC: rt5668: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 17:26:37 +0000
Message-ID: <20261107172637.2729867-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107130651.2059891-1-tristan@talencesecurity.com>
References: <20261107130651.2059891-1-tristan@talencesecurity.com>
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

The cleanup in rt5668_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

Additionally, headset detection registers from a previous session
remain cached after the hardware reset.  regcache_sync() on rebind
restores this stale state, which can leave the SAR source on button
mode.  Clear the headset state by calling rt5668_headset_detect(0)
before the codec reset.

If the I2C device unbinds without a card bound, rt5668_remove() is
never called and the IRQ keeps queuing jack_detect_work and
jd_check_work until devres frees the private data.  Register a devm
action to disable the IRQ, set irq_disabled, and cancel both delayed
works on any I2C teardown path.

Consolidate the IRQ disable and work cancellation into the devm
helper and call it from rt5668_remove() and rt5668_i2c_shutdown()
as well, so every path goes through the same sequence and
irq_disabled stays consistent.  This prevents an unbalanced
disable_irq() when multiple teardown paths run in succession.

Store the I2C client pointer in rt5668_priv so all paths can
reference it directly.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v3:
  - Set irq_disabled in the devm teardown helper and call it from
    rt5668_remove() and rt5668_i2c_shutdown() to prevent double
    disable_irq() when multiple teardown paths run
Changes in v2:
  - Clear headset detection state via rt5668_headset_detect(0) before
    codec reset to prevent stale SAR/button state on rebind
  - Guard disable_irq() in rt5668_i2c_shutdown() with irq_disabled
    flag to avoid unbalanced disable

 sound/soc/codecs/rt5668.c | 41 +++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 29d70802a046a..5bfe5d9546925 100644
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
@@ -2213,14 +2214,28 @@ static int rt5668_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static void rt5668_i2c_disable_irq_and_cancel_work(void *data)
+{
+	struct rt5668_priv *rt5668 = data;
+
+	if (rt5668->irq_acquired && !rt5668->irq_disabled) {
+		disable_irq(rt5668->i2c->irq);
+		rt5668->irq_disabled = true;
+	}
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
 
@@ -2230,17 +2245,18 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *i2c = to_i2c_client(component->dev);
 
-	if (rt5668->irq_acquired) {
-		disable_irq(i2c->irq);
-		rt5668->irq_disabled = true;
-	}
+	rt5668_i2c_disable_irq_and_cancel_work(rt5668);
 
-	cancel_delayed_work_sync(&rt5668->jack_detect_work);
-	cancel_delayed_work_sync(&rt5668->jd_check_work);
+	if (rt5668->jack_type)
+		rt5668_headset_detect(component, 0);
+
+	rt5668->hs_jack = NULL;
+	rt5668->jack_type = 0;
+	rt5668->component = NULL;
 
 	rt5668_reset(rt5668->regmap);
+	regcache_mark_dirty(rt5668->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -2576,6 +2592,13 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
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
@@ -2584,6 +2607,8 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);
 
+	rt5668_i2c_disable_irq_and_cancel_work(rt5668);
+
 	rt5668_reset(rt5668->regmap);
 }
 
-- 
2.47.3

