Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760054;
	b=z28QzF0TUyfJH/uBz5ADih+dtXTuu3R5ASEFBY8Ec/mjmnKGZuD5/ehGzsXVO+pNhqzv
	 UtqTtKUeCLRPvn1F9z8+jIHTbprQZYjZ6sH5FljKQVZtEwDHAl+l3raX2eREoQ/USgk3B
	 7cCD+PUqt4AoludSOSC1fuEtvX/ckqK8tBC1gjVihWCSJhSwbYP3a6JoRBMAJGhVdHth2
	 E/y58+FpScwebvinajEytZV1AFFcC/65i6f4B1hNPO7Klgxuhzv2sWWBPRv0AeXT0gc8F
	 kPjS04ss+iK5sh4a8aY5lHmP6ZXurIuHs7fq4fHNDl4uy2E+ddkMLJjkrI2hn0mq16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760054;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=2k94f6eJZ0tyESK0KZJ+8dW0Sd5ymcU0Xqe9Ka3pb58=;
	b=qW26GRb8IqitnGE18n2VXm3hVq3i3CxzNeqwaMrnQQT+usMedYVPEKB//3iymb2fNfxY
	 ibyetUSNj4SdSEvJ07PDm0Wlu9jfrNKh9qla8dBay24e/KtKpWr9JjrzuaDQyKMJ/zLk3
	 NnkvUMZaBI2CrOWJMIzwMG/X9QzHDYhG9QzSwblgf6XYdBpQ0+B8lkGgIEUJFgYdVgsGt
	 QgVKZUdf3pd3OWnJs4/WGdSmkeeNau4DgnLFluzbPORfP+E1YSmpI8wRfczpdROIyQfyk
	 3oasOLfcxsFNGr734GTmcFeAb2t7YgrGI8O4opmRCGamuQBoTvoU+ccHsmuEi9I+D6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBE606A32F
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DEBE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAC35P4um+pqzbk+AA--.9683S2;
	Wed, 04 Nov 2026 10:40:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: sti: fix the player clock reference leak
Date: Wed,  4 Nov 2026 02:40:55 +0000
Message-Id: <20261104024055.1508788-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAC35P4um+pqzbk+AA--.9683S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFykXrWDXrW8Ww45Cry7trb_yoW8GrWUpa
	n7JFW5K3s8tF4fAw12qr40vF1I93yxCFWFgw4xA34kAw45trn7JwnxJr4rWayUCrWkuw1U
	KF15ZFWvkF1DZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnU
	UI43ZEXa7IU0f9N3UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwEBA2rqZFjVSgAAsn

uni_player_init() takes a reference on the player clock with
of_clk_get() and stores it in player->clk, but nothing in the driver
ever calls clk_put().  The reference is lost when probe fails after
that point, and it also outlives unbinding of the device, because the
struct uniperif holding the pointer is devres-managed.

Use devm_clk_get() so that devres drops the reference on probe failure
and on driver detach, like the other resources this function acquires.

Fixes: 76c2145ded6b ("ASoC: sti: Add CPU DAI driver for playback")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/sti/uniperif_player.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 844ddcfc421a..23c6f9e513c1 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -1078,7 +1078,7 @@ int uni_player_init(struct platform_device *pdev,
 		player->hw = &uni_player_pcm_hw;
 
 	/* Get uniperif resource */
-	player->clk = of_clk_get(pdev->dev.of_node, 0);
+	player->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(player->clk)) {
 		dev_err(player->dev, "Failed to get clock\n");
 		return PTR_ERR(player->clk);
-- 
2.34.1

