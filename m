Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760054;
	b=EERupE3rh/UWtqIGSoq4uKkps9A0xaugynjju8k0TlHLjG2MMbcYbBf3PKxLFpRQADTR
	 1P6n5SbxG5xY8oQZOXnl1nVZcfEJuvghJEsjaKAmM46yCjTUAQvP0Wt54f9TZd5TJw6w7
	 8180qsyM323gGNnNJaaWmdeGDIMWYtYfCUqMRwmhqwwAHdq32tyYGk3jn4lS+Aq6iPend
	 9bIBZay5iWh7DYPYVnQ4RWlMXA2wvBvlQWvR5pe2lK41YWDQDGorMEfHiJR4ke962TAaz
	 RbtMTAfrp2dCQoWB1ITHsX6kiW2sBEikwLARC3wKsXmZvV03OhdvDzSl85f9dpxDxjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760054;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=GPPjgPXMdTGHADngYsCikDS3FDt2Si5kyVRezK2CTn8=;
	b=48S+URVeDih4rhjPJh+pOXedolvRZSinW7r4oSmaXJSPwTWICygKB7npFk+CffeHNMY0
	 MNEOv5avtsWsBPocMJtm7471kH72K/sDZe9D4d57FRLCn25jbX77zstWyuI+Q3eUKxRV5
	 AXRIGoXhYaLdj4PAotJJMGTgU4pxwSEd34qEjbmd6OzHdkcbR1OtJ3s6pEI4XLTrH7ovw
	 k4c6reW2kN4RVd0m5G41piCuGkm43Z+8+FX31JFm2a1MrYsK9emKJzTGp+2Osjg4cjL37
	 i8P27Okc9qwl3jBidEgBzY401jjBQibLBLq2dEwnWKMxNMF6po/DNMDdNMs7B8uMH9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278C606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E278C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXwvwqm+pqh7k+AA--.5176S2;
	Wed, 04 Nov 2026 10:40:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: stm32: spdifrx: keep the control DMA channel on config failure
Date: Wed,  4 Nov 2026 02:40:51 +0000
Message-Id: <20261104024051.1508703-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACXwvwqm+pqh7k+AA--.5176S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF43ZF17Jr4xKw1ktFyfCrg_yoW8Jw1rpr
	4rJrWvg3y5Xan8XF4qgr109ayv9rZ3Ar4DKws8Ww12vrnxAryIva9xWw4qgr42yFW8Ga12
	9rs3tFy5uw1rCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bzhL5UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwQBA2rqZFjVPQAAsV

When dmaengine_slave_config() fails, stm32_spdifrx_dma_ctrl_register()
sets ctrl_chan to NULL and returns the error. The channel obtained from
dma_request_chan() is thus lost, and stm32_spdifrx_probe() calls
stm32_spdifrx_remove() on the error path, which then passes NULL to
dma_release_channel().

Leave ctrl_chan untouched so that the remove path releases the channel.
Its IS_ERR() check already handles the case where dma_request_chan()
failed.

Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/stm/stm32_spdifrx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 88863dbd05d9..ce75929daf73 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -425,10 +425,8 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 
 	ret = dmaengine_slave_config(spdifrx->ctrl_chan,
 				     &spdifrx->slave_config);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "dmaengine_slave_config returned error %d\n", ret);
-		spdifrx->ctrl_chan = NULL;
-	}
 
 	return ret;
 };
-- 
2.34.1

