Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760049;
	b=HexIqfiyTWHsCUHkOU+rq+ADokC9N4wUNVCJ7vuleRWtcnTrOabM44cbyyTgHHBAmTgr
	 sY3E2LtiYjA0EPGy9LrwQ3Fbv+gjC9pG+LhgMOsbKHSxcDmMrqQGh+/SK4SxvosyNAk4D
	 N8SHr4e8yVfU9DA9q7rrAnjIwHDN55lXYb40/a9xNza+lPMTA3ArprFnH07ckFVXJzpmD
	 /MRowo4Cc2LXhNccV8p+RCxkju+N8EvObGOHTO7lckFli+SOGQOYTkTvc6UN7HiqdAqiC
	 bwbmEEqTSWawZ1DZ8OQdC75NaPY2Bw845bftcSQwCuIe5RKuBqF7UIYb4GyqSmNFnEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760049;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Aiw8ztCLCwr7ofFLwmsjgCzbaqYAulB7XDuA9opYCwM=;
	b=Vr+Zll0BW2CEleqlaVprOMbyenNwbLXddIYGcEN6wIj7ckq4sYinX6//fd3VUZ7cPA6z
	 NI7ybkm5xBJc0LTNQndBezDH4YLLZ7sS+XKePZdnHAG8SVxuACkAQfbr9BPL+EdxyNhB9
	 diOrzSDqgc5l5Zg13bA1Y/qlClBGCeHMuGx25Q4qixaBXLvjYLPmQKnXNOLUXrWtBPzy5
	 jLO2e0uCbd42PXer+1Gfb46/SZFY3wfJBXGoM/3ybHmWlPu3kJDYJZpHEdH4ssuJl8CuE
	 FhcwnEC4tZZEn4gvTw5H/esm6MYYSeJVVOrE/E0bygJRJcwkKi37B0PBFbIs7MN0uxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1E606A331
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD1E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnVf8om+pqbLk+AA--.27471S2;
	Wed, 04 Nov 2026 10:40:40 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: rt5677: register the GPIO chip through devm
Date: Wed,  4 Nov 2026 02:40:49 +0000
Message-Id: <20261104024049.1508652-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowABnVf8om+pqbLk+AA--.27471S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry5Gr15Cr4rZFy5Wr1UGFg_yoW5JF4kpr
	nYq393CrWUJF47WF4UJr45Aa4xtw4xtr42yF4xW34F9F1Uur1Ik3WUtF4jvFyUKry8u3Zx
	Xa1I9a4UJr4kZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b7pBhUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEBA2rqY+TXMAAAsv

rt5677_init_gpio() registers the GPIO chip with gpiochip_add_data(), and
rt5677_i2c_remove() unregisters it. If devm_snd_soc_register_component()
fails at the end of rt5677_i2c_probe(), the probe returns an error and the
driver core never calls .remove, so the GPIO chip stays registered and
keeps its reference to the parent I2C device.

Register the chip with devm_gpiochip_add_data() so that it is torn down on
probe failure as well as on driver unbind, and drop the now redundant
manual cleanup.

Fixes: 44caf7648064 ("ASoC: rt5677: Add the GPIO function")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/rt5677.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 7b80922236e5..4e6bb23eda17 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4861,17 +4861,10 @@ static void rt5677_init_gpio(struct i2c_client *i2c)
 	rt5677->gpio_chip.parent = &i2c->dev;
 	rt5677->gpio_chip.base = -1;
 
-	ret = gpiochip_add_data(&rt5677->gpio_chip, rt5677);
+	ret = devm_gpiochip_add_data(&i2c->dev, &rt5677->gpio_chip, rt5677);
 	if (ret != 0)
 		dev_err(&i2c->dev, "Failed to add GPIOs: %d\n", ret);
 }
-
-static void rt5677_free_gpio(struct i2c_client *i2c)
-{
-	struct rt5677_priv *rt5677 = i2c_get_clientdata(i2c);
-
-	gpiochip_remove(&rt5677->gpio_chip);
-}
 #else
 static void rt5677_gpio_config(struct rt5677_priv *rt5677, unsigned offset,
 		int value)
@@ -4881,10 +4874,6 @@ static void rt5677_gpio_config(struct rt5677_priv *rt5677, unsigned offset,
 static void rt5677_init_gpio(struct i2c_client *i2c)
 {
 }
-
-static void rt5677_free_gpio(struct i2c_client *i2c)
-{
-}
 #endif
 
 static int rt5677_probe(struct snd_soc_component *component)
@@ -5703,11 +5692,6 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 				      rt5677_dai, ARRAY_SIZE(rt5677_dai));
 }
 
-static void rt5677_i2c_remove(struct i2c_client *i2c)
-{
-	rt5677_free_gpio(i2c);
-}
-
 static struct i2c_driver rt5677_i2c_driver = {
 	.driver = {
 		.name = RT5677_DRV_NAME,
@@ -5716,7 +5700,6 @@ static struct i2c_driver rt5677_i2c_driver = {
 	},
 	.id_table = rt5677_i2c_id,
 	.probe    = rt5677_i2c_probe,
-	.remove   = rt5677_i2c_remove,
 };
 module_i2c_driver(rt5677_i2c_driver);
 
-- 
2.34.1

