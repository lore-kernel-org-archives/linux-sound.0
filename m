Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760047;
	b=PQba5gN0jchso/hzUzh0SH5VVOkyIiH1QFGt9OPvwi8XeGcqx6t2wvR+MpL7rglmWBm7
	 0ltD/YQaVHtn0oU4Xsk1pzglGmldazIJ3I/GRiAiF7HLTdj8nQIIfGDfsP7H8thV+PP3w
	 RpUuJW9DUzhAwksWwrpSe7yKxYepaD0KUE6B75tnUkbL31DUWidq2OMzFp9xH3TDMIyTF
	 weVQ1L0HKOdXx3u3TCDrZsLgYq052KdFn65MlFP6wc2GsbQsmkuM//6udzFffHIZrijoi
	 /Zrfca8kfu/rqqasULbqk1AZRQngD9kb8exSws4dbYRcyLorHEds7P30+mjqtNVomJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760047;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=xO1keHoH4I0FfYSNyYlK+7y+faugCv+KHvCBvniDd+8=;
	b=fpIaXlu5Df82jnpKTz1n3mqxi4rq5w39KiXNmem4kAeImikyiYbWIxPPlZCCJ0irEe03
	 ucdTUPDSab4oOmfzWHIetH44aQL+3ctOaebbXk9yEGVE+Y8PGMj33V8reSsMM6ko8/dxS
	 Jk8yZvUJYMjHGJs6aEeUejImBLhhJ70498OtwfKXxSABCN+JmHkL6bUXWcrdm8Gr8FN7O
	 lpeh1gc/Ihz58t0PwUFlbicuYElS1Pzp5+DPil75oT5o+C4BpVWDBciFP9JzOaNHlg5NP
	 QT31pSoENOlogbajwQG57LIBcaBblxGVFWDwH+19IsA/9KiOJZ0wHy8ciUqMjrmQD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820AF606A335
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820AF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXvvgrm+pqlbk+AA--.9982S2;
	Wed, 04 Nov 2026 10:40:43 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: samsung: snow: release the I2S bus clock if registration fails
Date: Wed,  4 Nov 2026 02:40:52 +0000
Message-Id: <20261104024052.1508720-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACXvvgrm+pqlbk+AA--.9982S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xw1DZr13tr4fZr48KFyxAFb_yoW8Jr48pw
	s3W390gFWYyr40yr4UXrs5JF1Ik34IgrWfWr48W347Ar1rJrn7tF9Ig3yUuFZFqrykWws8
	tryUGa4xZF4kZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAABA2rqY+TXRQAAsb

snow_probe() takes a reference on the I2S bus clock with
of_clk_get_by_name(), but the only place that drops it is snow_remove(),
which is not called when the probe fails.  An error from
devm_snd_soc_register_card() therefore leaks that reference, and since a
deferred probe runs the probe again, every retry leaks another one.

Drop the clock reference before returning the registration error.

Fixes: aff8d2bed9e5 ("ASoC: samsung: Add HDMI audio support for Snow")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/samsung/snow.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 66ef49dff1ba..ad99c153e9f8 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -211,9 +211,11 @@ static int snow_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret)
+	if (ret) {
+		clk_put(priv->clk_i2s_bus);
 		return dev_err_probe(&pdev->dev, ret,
 				     "snd_soc_register_card failed\n");
+	}
 
 	return 0;
 }
-- 
2.34.1

