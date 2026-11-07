Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068632;
	b=ouGJz6NmC3ZOBVGQ8Bpyvqkqx5Yslvj6eRbAORUEHzwTZZYIdWzROEZ64aqwAwXPaNZm
	 bf2ougjOCfR4ULSE0Ya+jO/UPHHWnJdDtz0sFCrUTUoNhez2+w2sl97X1Ip4hyHgJUURO
	 0upGZz94nM7e/dDvu4rwbV3nprOFsOaukKFgxgjXQQfjMjR/DikPU6EPWFwD8ijADsooY
	 GXxTaw1lhwUqIiorF4XB9L3VRqNCRXllcAfTsgLYlDdipkrdt0Hppz4ety8EKbw+ktPp/
	 QaOFyrSZYwlYeB9UKTx8qqw74UqyvJW/uLDlFa7hQvA1Hr2QI79yNvsw05sdxuGAA4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BJxOd6zhjF3M7CCyz6Z10/bR/tIxDr4jHdB+bON0ABU=;
	b=JQ54j6mkxU70ERsq+PywRLEixsruawEv2d4HifYQFjlOFbNAnVGnhsb58m8xIEThHcKS
	 dt7d4os9YNs7Q8JjfASsOg2gEe4KmJEu0Gd3NTsbz0IVpRA6JmOwXSFfB1gtxCi2aSpEy
	 iJomEe9Eczbwg48SKr4BYxk0WgKjXPdFPY/OYlWFfvcxKDF6LqzgQx/RX4eifFMBhXag4
	 gSRk0Y2tFB88z233C4I8TwB+5wUzGN1T7uZXAptXZQkWA+RwQ82KE+N5PxE9FBiQRSKkE
	 g2Dpbb0PImFnjab7fIIluMMd9uS4zqtfazYSn6XGFhRhnqM/f7qJG+GRBzkj/5eV9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhRh4k6U;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9CF606A32E
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhRh4k6U
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10048835e9.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794068631; x=1794673431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJxOd6zhjF3M7CCyz6Z10/bR/tIxDr4jHdB+bON0ABU=;
        b=vhRh4k6UdOFLN+vT5tn4sQHilCzwg0NmRbtEbazlnN/bZXHYmHEKvuoiYXfquRrGXh
         m2fWFz+kLgb6XPU+X74RBoN5ywSIvKY6dKw2quJapA5WFTYUcttdfyy29F5VMkjfcSyF
         K3QCpb4QE51Jf5lqjk0hFZPizKo4W4FIEiQ8/L+863sc9sYzcAOwjN36YgVduv7AXCXb
         BTb5JbLLpLfX8DxRQY2iimXKZr23hCtyl5e4/YfgBDEizpJlZU5QD8umP1fF6K/wzqw5
         ViSpt9gp4weGNd1puQ1OYNe6NPAN89Uxmq5QqT+8thQjdeMB/MFsCsSjRrNauGzgEx41
         CeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794068631; x=1794673431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJxOd6zhjF3M7CCyz6Z10/bR/tIxDr4jHdB+bON0ABU=;
        b=iHCeusc/xqxumw+PjxyjruZ8lcm9sbmdCNdxDDH+nJEiRRjTcdCaOwoEjjWouAwUV+
         PXz/YpZ63vgCTPpADYkkh7PSaLpuUcNS88G6TXr1OdcNNYqMTf0kjOE7zVWdwjBOmiKJ
         1O4/e1UdyOHyoSUcLRqNvxtAX3mrW7iLmXsdMILjE7aUIxmkQz2bkyptfVJ1grr4vVVt
         0IKQkElQJm5yg6rqdTbolW6tl3QbqBMABOGOrkiDpTsg4pGE4XeusR2AXatO/Ve9brmC
         zKbnqvtacMS28NJMIDVjzaeZ7x/zzcmyOpqC9JYYy6MB9dEuH/DyswFrjWCmO3WQUsNp
         1//w==
X-Forwarded-Encrypted: i=1; AKwUvBxdzg3bk+oAkHQRcXxtKlEPhmT64oXQZ5cx6vVbxf0y6hVDynFc0qQbEgPIdz0tHxPsm4rYztefNVHbUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vh+V+W2TG8U1zzliteixWhBb6jQwBbU7PpzEZ5+MrLuDYIyUn
	12iCcJfWn0Qod4jk8JN5nRcAxPpaJ7S4t9uMxRgw3tL/Zw5MF+pUY2I=
X-Gm-Gg: AYBFou1yGqXHs/VGXX/s7WCcT0ad1cvjQsvS5/FADRSVzdPdLawYw2jP/YJ25do9qrg
	Iie7W7oGKo9j1+rwYgdKg3EeeaLIpknHbacBsl2ugZAk2Xjt7X/7MkLTAt0DWdt9jnPZHHf5KFO
	I8p8HUg055rYPuYdhYmtB5SY2rqiMVJJkPF37UVuvQAiMlAgZ2eRBOBNN7gIZc5H+fz6TQcAdJf
	yCOsuq2ZI9Fq2hp+avYlVhrLinWVzi0m0wYoNs/V5TkjdZdOfvpi/NGmuPvhjLB0vMqTbIKiGaI
	pZAx9WGDHaT9UcMCIqKrvQyj67iRelcW4Vu0mHwlPpbp9Xp6WLfe9wQZEc7SHyw69pQS2T6peFm
	bjAdLBHeiQKEM+y5QURT0IqvQljDrF7uNjoJ2fjqzZWlyJgJaAuGUhOUdBkowsXMOPBsBETmOmi
	y5sZvm8/OQz6tz4AoWyEBZMo2d/L4/XQ4MNrGrgiQoQ8UAe+fKC1rPUmN/7SKHadKVzzO/xLbnW
	GlpNmjtzhDXjPpCzgVdD7lGE8lqpresUdY8+UyUQVBPJNVaHn7tPjnG9kgYaMCb4EZnm/mwrLKi
	fX/zs5KnmzP/xDQ=
X-Received: by 2002:a05:600c:8886:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4b76a8b9e1dmr61230145e9.25.1794068630454;
        Sat, 07 Nov 2026 08:23:50 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32b46a3sm83755155e9.6.2026.11.07.08.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:23:50 -0800 (PST)
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
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] ASoC: rt5659: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 16:23:41 +0000
Message-ID: <20261107162341.1494240-1-tristmd@gmail.com>
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

Additionally, headset detection registers from a previous session
remain cached after the hardware reset.  regcache_sync() on rebind
restores this stale state, which can leave the SAR source on button
mode or HDA plug flags in an incorrect state.  Clear the headset
state by calling rt5659_headset_detect(component, 0) before the
codec reset, and reset the HDA header plug tracking flags.

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
 sound/soc/codecs/rt5659.c | 39 ++++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/rt5659.h |  1 +
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 68f7d5673e190..14111f40384e5 100644
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
 
@@ -3689,17 +3701,26 @@ static int rt5659_probe(struct snd_soc_component *component)
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
 
+	if (rt5659->jack_type)
+		rt5659_headset_detect(component, 0);
+
+	rt5659->hs_jack = NULL;
+	rt5659->jack_type = 0;
+	rt5659->hda_hp_plugged = false;
+	rt5659->hda_mic_plugged = false;
+	rt5659->component = NULL;
+
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
+	regcache_mark_dirty(rt5659->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -4328,6 +4349,13 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
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
@@ -4337,6 +4365,11 @@ static void rt5659_i2c_shutdown(struct i2c_client *client)
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

