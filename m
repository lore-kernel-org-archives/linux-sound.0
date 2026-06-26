Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035101CDFCA;
	Fri, 26 Jun 2026 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440863; cv=none; b=fnJetW5q7zlz8mcEqgjjzPkQnM6GsJIh6syQoeohbDhY/7O9KSDpHjG0Qo8N9yueURClAfBZxTCD4n8d88o+Mvp5mPeC8cP0i8WJcT28Hk4mF9J0ysuUN5fF0KSboqd41CZIWjZG217L4Xg2CF7lTbiWVd+7kZ2WLbdfQbzOTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440863; c=relaxed/simple;
	bh=fUQpPSS0W6gZsMG8KBIG6vTVer1Mny9E4l4aej5Bm8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDd0exurHMteaEUcNpgpMMLI+alFeJtkZDDEQp3Isp2F8eFAsXpgCBiLvwth7q1hnaitqLUCoDcveUXQpZ3TLJNG3DPtivQUxkeft6LReBb6nG5qW5Xp38dfEYiKDOJrjgz1VqVfZ0X921KxpY8RVpytkgGi32tky3ljFhOjkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8DxEvCc4z1qBTEYAA--.62377S3;
	Fri, 26 Jun 2026 10:27:40 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJCxWeCY4z1qr22zAA--.13114S4;
	Fri, 26 Jun 2026 10:27:39 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 6/9] ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card support
Date: Fri, 26 Jun 2026 10:27:27 +0800
Message-ID: <ed1314e1d3275fd20aff47397345a88fad6e9368.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeCY4z1qr22zAA--.13114S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGo8w2QaowAAsK
X-Coremail-Antispam: 1Uk129KBj93XoWxCrWDXF1fAF43Ar18Jw48Zrc_yoW5CFyDpa
	nxA3yjgr4YqF13uFn8XFWrAF15Z3s3A3ZFqF47Jw18Kr9Fyw15uryUKF1jvF4ayrykGFyU
	ZrykCrWxG3WDGrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j6VbgUUUUU=

The Loongson-2K0300 audio card uses a different DAI format compared to
existing Loongson platforms.

Move the dai_fmt setting from the static DAI link to runtime hw_params
via snd_soc_runtime_set_dai_fmt(), and pass the correct format through
driver match data.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 34 +++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index ea895fe6b5e9..0e63cbcad57a 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -2,8 +2,9 @@
 //
 // Loongson ASoC Audio Machine driver
 //
-// Copyright (C) 2023 Loongson Technology Corporation Limited
+// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
 // Author: Yingkun Meng <mengyingkun@loongson.cn>
+//         Binbin Zhou <zhoubinbin@loongson.cn>
 //
 
 #include <linux/module.h>
@@ -18,6 +19,19 @@ static char codec_name[SND_ACPI_I2C_ID_LEN];
 struct loongson_card_data {
 	struct snd_soc_card snd_card;
 	unsigned int mclk_fs;
+	const struct loongson_card_config *cfg;
+};
+
+struct loongson_card_config {
+	unsigned int fmt;
+};
+
+static const struct loongson_card_config ls2k1000_card_config = {
+	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBC_CFC,
+};
+
+static const struct loongson_card_config ls2k0300_forever_pi_card_config = {
+	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 };
 
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
@@ -45,7 +59,7 @@ static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return 0;
+	return snd_soc_runtime_set_dai_fmt(rtd, ls_card->cfg->fmt);
 }
 
 static const struct snd_soc_ops loongson_ops = {
@@ -61,8 +75,6 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	{
 		.name = "Loongson Audio Port",
 		.stream_name = "Loongson Audio",
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
-			| SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(analog),
 		.ops = &loongson_ops,
 	},
@@ -177,6 +189,10 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	if (!ls_priv)
 		return -ENOMEM;
 
+	ls_priv->cfg = (const struct loongson_card_config *)device_get_match_data(dev);
+	if (!ls_priv->cfg)
+		return -EINVAL;
+
 	card = &ls_priv->snd_card;
 
 	card->dev = dev;
@@ -202,7 +218,15 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson_asoc_dt_ids[] = {
-	{ .compatible = "loongson,ls-audio-card" },
+	/* Loongson-2K1000/Loongson-2K2000/LS7A */
+	{
+		.compatible = "loongson,ls-audio-card",
+		.data = &ls2k1000_card_config
+	},
+	{
+		.compatible = "loongson,ls2k0300-forever-pi-audio-card",
+		.data = &ls2k0300_forever_pi_card_config
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, loongson_asoc_dt_ids);
-- 
2.52.0

