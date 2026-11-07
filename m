Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071905;
	b=kDA+NY4NVsyzQq/LHTWLNM422Z4i67U2B+HPF67PltgHDhyAC8TA9vAh/5elMK8L0DaE
	 EgSosm5Er9hu/tVqOf1hz+IAVyCrT485BsCBdzYkcBjvged8BtMudC4EAlp9W4LK4C+2S
	 rZ3MYqZ/Y4Zp2uF7UctQdzWnwMrca+zytshjERlivrHTzTPaDJTuPYINNJHUuiLVI79+7
	 Ac8wwwNylMHGhe10B961alg187kpZbTnHU7kCIRNwF0a3fJO/lG2q25aAOL3OtG42/7u4
	 Rer1r6kFeVucjxEWlXYyhanD2q/Jvt5kOp9AQ/WoxV67824WqY7pKfmDibLPVdNmhnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GzJZLxK0N1nyYDcTPn6m0/DSL3brMWaSJHk89v88tFE=;
	b=mq2AxN+aGj1/r4MFYEN0Q2Znmbesm5VkRtiOg5XFtQY7PtDzu38C6QM+bQXSR4kYvQ21
	 xGwT3112qFIBrhnqK7UqvLYfr/6JTg3C7wOk1BjxDgCZhM7HNZGkf1EO1kav9dNKCAqy/
	 aTFVmZTWZvur90RcFjRW0rRPQZAnGYun3v4s5VoQmCTo6/k2a4Cjom4A8FkZ7id1D3aWp
	 n0t/NrBS35ITyhMPII1KL7FsAVSPQl7mQNGlHkiiJMJjrd/cI872Y245iIkEQHPY+dm/+
	 89+BvWAJHoUQv3t9TX7GekMnFK6Fz8Gplh+lfyvrQa+Q9lu4OVgC8lRbZOJu6ZwieKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meeIzSY7;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9219606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 17:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9219606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meeIzSY7
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491971ac844so1436355f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 09:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071903; x=1794676703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GzJZLxK0N1nyYDcTPn6m0/DSL3brMWaSJHk89v88tFE=;
        b=meeIzSY7RiL12Tn3Dqy72t250PR3HKMAjCIPHV4Omp6Mw3jPK4J3zRT8GCOtu5xHcc
         7pbvxi83nXPIbAcHu2iQaTzNHsPBAsGfbvnuVzokTJjkn4ohQsqtVt4bZ/lweyutZ91Y
         32vE9QA/inLVmrEbueeW5OPZUoq/vGZtQzZmgl9OIwrw4V4KFl2Q3JniZ/qg9w6kbGxC
         SSUyIfn+ifg2OPg4AiA/jGXOU8gj3nmMsCmKI+gKnXUZ2wN3eEXMwWhxPWOT/UN1JdCT
         Z9Pr6Tse8nRiazmtN3PjIw+NqOPcIgOdncSpQ1KARz47z80F/45HJux7AAhZf5AHVO9J
         yDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071903; x=1794676703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzJZLxK0N1nyYDcTPn6m0/DSL3brMWaSJHk89v88tFE=;
        b=BKeDO9DnP0xOV1zt2XkR+lFoZDurDaGZ1NPQnI6wZeyaUt0CKpUnD7pkNGcuDw341e
         eBTXI+ZzdEvLXTbb63LSaaPVgX7We0PYgMucQhNj3cox/UCjkL9/xWsGYHuHg41vc77B
         atY9NG7dBNwzoXYJ90GmPty1C+9o2GF9zKhKJZGWHBi+9QZTeQlyOIv6oSUci93GlRwq
         suJr0IqziXl1SVNYVLU7LPvdOG3LFrneqrrbPFGiC0fwjVbwp9gKitJzzVB3K1zK2wSD
         i6AwsES5bkh5V4A/CSa1gD0gUrtGEdhXdojvmVEpOzwzO6FQN9ZxA0iAzkASwmkMl1Np
         LveA==
X-Forwarded-Encrypted: i=1; AL+hErFFCW6qYI98/hQn6DdUgbVp4BPBul8IqIkNi65B5QKZj/0bJU3mA0+t5VAWUEi4MneW1vnlW92lDoToVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qLHtMxRQJh1rZfpY7uxq2402tiVWJ1zhrcJ2ycnD+TzQ+ySlH
	xJfKF5M9eQs29oeBO7QUnFSwe+XYNwVpJe4HwChSr/b2xB4las1qB3MfdmoG
X-Gm-Gg: AYBFou1qyOukD5LF/LU8z/yHU6cM1qMZfBSfNZ7cgK3qJZmOzokRpCbbQZgbijl4qzJ
	hk9/HxHXlwCdg5lPYh9dd23UcAw7r4ZzkRhk7YmxgLzRsKPFVCsVXDgAaTZlxxaGN+zYKZenrTu
	XyQ9i3IR1Sf2mpDV1Ocuw4F0QSnw4KfEFzWKyUMeBrmlf8CL+jyAZOkJwZMc5p7/AhksxEK9Viw
	OMNgcw0Fz0/DqAUmIvTnDvRMEtcjQA8wgskK2cXIFko15ztj0M5QCKQMEP3hWHJCs03UY3zC99F
	+A9NysQRnbIQWwJrj9TFpcxF5qPv2775u3w81oIoC1LTBbJhTen7miFmOqnWcQD4O1P0GXcg+aQ
	NYs/ZX/z0rIQdxQTsiCAtlgD9l8pYF8uyMSCLG+rry5LIevtf+x6A2Pf3yk9IhWuKmERfKaCTsL
	AYbh0qgPQImZogiQFnqyKrpZNYhdcuorKTKy92VsqGLmYZidg3t8g6GUiW4MhML3KT4xyc0BQFT
	oiPrYBP54lQNxqaYhag71Zn9l+X2sCEy/DdTTQ+xyrbu1N9Vp/sh6iG9bpd3TSCcb5U3j3ezGE2
	l1eYEvT7+swtpc0=
X-Received: by 2002:a5d:64ce:0:b0:48f:e879:5890 with SMTP id ffacd0b85a97d-492760da597mr10879426f8f.32.1794071902970;
        Sat, 07 Nov 2026 09:18:22 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc628dsm10434892f8f.48.2026.11.07.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:18:22 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2] ASoC: rt5659: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 17:18:13 +0000
Message-ID: <20261107171813.2561973-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The cleanup in rt5659_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

Only clear headset detection state via rt5659_headset_detect() for
JD3-mode jacks.  In HDA header mode the SAR, 4BTN_IL, and IL_IRQ
registers are set up once during I2C probe by
rt5659_intel_hd_header_probe_setup() and are not re-enabled on card
rebind, so clearing them in remove would leave mic detection disabled
after the next bind.

Reset the HDA IRQ polarity bits in RT5659_IRQ_CTRL_1 and
RT5659_IRQ_CTRL_2 to their unplugged defaults before marking the
regmap cache dirty.  Without this, regcache_sync() on rebind restores
plugged-in polarity while hda_hp_plugged and hda_mic_plugged are
false, so the polarity-flip logic in
rt5659_jack_detect_intel_hd_header() never fires and subsequent
plug/unplug events do not generate an interrupt.

If the I2C device unbinds without a card bound, rt5659_remove() is
never called and the IRQ keeps queuing jack_detect_work until devres
frees the private data.  Register a devm action to disable the IRQ
and cancel the delayed work on any I2C teardown path.  Guard
disable_irq() in rt5659_i2c_shutdown() with the irq_disabled flag
to avoid an unbalanced disable when rt5659_remove() already ran.

Store the I2C client pointer in rt5659_priv so all paths can
reference it directly.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
  - Only call rt5659_headset_detect() for JD3-mode jacks; HDA header
    mode registers are set during I2C probe and not re-enabled on rebind
  - Reset HDA IRQ polarity bits to unplugged defaults before
    regcache_mark_dirty() to prevent stale polarity on rebind

 sound/soc/codecs/rt5659.c | 47 ++++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/rt5659.h |  1 +
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 68f7d5673e190..b28804fa15806 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3660,6 +3660,16 @@ static int rt5659_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static void rt5659_i2c_disable_irq_and_cancel_work(void *data)
+{
+	struct rt5659_priv *rt5659 = data;
+
+	if (rt5659->irq_acquired && !rt5659->irq_disabled)
+		disable_irq(rt5659->i2c->irq);
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
+}
+
 static int rt5659_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -3667,8 +3677,10 @@ static int rt5659_probe(struct snd_soc_component *component)
 
 	rt5659->component = component;
 
+	regcache_sync(rt5659->regmap);
+
 	if (rt5659->irq_disabled) {
-		enable_irq(to_i2c_client(component->dev)->irq);
+		enable_irq(rt5659->i2c->irq);
 		rt5659->irq_disabled = false;
 	}
 
@@ -3689,17 +3701,34 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *i2c = to_i2c_client(component->dev);
 
 	if (rt5659->irq_acquired) {
-		disable_irq(i2c->irq);
+		disable_irq(rt5659->i2c->irq);
 		rt5659->irq_disabled = true;
 	}
 
 	if (rt5659->jack_detect_work_inited)
 		cancel_delayed_work_sync(&rt5659->jack_detect_work);
 
+	if (rt5659->jack_type && rt5659->pdata.jd_src == RT5659_JD3)
+		rt5659_headset_detect(component, 0);
+
+	rt5659->hs_jack = NULL;
+	rt5659->jack_type = 0;
+	rt5659->hda_hp_plugged = false;
+	rt5659->hda_mic_plugged = false;
+
+	if (rt5659->pdata.jd_src == RT5659_JD_HDA_HEADER) {
+		regmap_update_bits(rt5659->regmap, RT5659_IRQ_CTRL_1,
+				   0x10, 0x10);
+		regmap_update_bits(rt5659->regmap, RT5659_IRQ_CTRL_2,
+				   0x2, 0x0);
+	}
+
+	rt5659->component = NULL;
+
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
+	regcache_mark_dirty(rt5659->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -4328,6 +4357,13 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 				   RT5659_GP1_PIN_MASK, RT5659_GP1_PIN_IRQ);
 	}
 
+	rt5659->i2c = i2c;
+	ret = devm_add_action_or_reset(&i2c->dev,
+				      rt5659_i2c_disable_irq_and_cancel_work,
+				      rt5659);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_rt5659,
 			rt5659_dai, ARRAY_SIZE(rt5659_dai));
@@ -4337,6 +4373,11 @@ static void rt5659_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5659_priv *rt5659 = i2c_get_clientdata(client);
 
+	if (rt5659->irq_acquired && !rt5659->irq_disabled)
+		disable_irq(client->irq);
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
+
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
 
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index e10b3844501b9..1118e6ab1887d 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1793,6 +1793,7 @@ struct rt5659_priv {
 	struct snd_soc_component *component;
 	struct rt5659_platform_data pdata;
 	struct regmap *regmap;
+	struct i2c_client *i2c;
 	struct gpio_desc *gpiod_ldo1_en;
 	struct gpio_desc *gpiod_reset;
 	struct snd_soc_jack *hs_jack;
-- 
2.47.3

