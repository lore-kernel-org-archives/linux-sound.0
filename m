Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F96D3009F6;
	Fri, 26 Jun 2026 02:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440887; cv=none; b=t1Y2bat1T+R9ySkt6YtGAciT21Zoz1IxMRGtBOD637vQa5UxkzL2ZpoEzR2Gp5tEXqJaFy+BBQXPpZ6jChGvSbuoIK7CPoeqfp0b3KQOLq5GyVSXgQL8b0RKNX05PeRAvzOd4ShiqlxgdKvMKTAEU6hcmKlTet7qvy60SbDp244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440887; c=relaxed/simple;
	bh=noAg+IT1cwF/wm0lavT2jdfHpwNojYlhhiVnYLSkpS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdJhl8hXhaAOxvB02QXkK7XieiFK4rYkyyudZFCSIpZiSSfYI3wlLvWpclj+CkDlu5XU7M/HDtW+U/Ytr5atevo+8Vqfmqt5Wet20EuncSGiJGgKvuIM3V44SJd6BtcZR6xKp0QX/bS71CWkgCrYFTQ7TfBngP7hPd5SyF+poT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8AxvsCy4z1qOzEYAA--.38446S3;
	Fri, 26 Jun 2026 10:28:02 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBx68Gs4z1q0m2zAA--.10481S2;
	Fri, 26 Jun 2026 10:27:57 +0800 (CST)
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
Subject: [PATCH v3 8/9] ASoC: loongson: Add headphone jack detection and DAPM routing
Date: Fri, 26 Jun 2026 10:27:48 +0800
Message-ID: <c4b1503220b6fb433ecdcb881556827579041c3d.1782439646.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBx68Gs4z1q0m2zAA--.10481S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGo8wzAaJwAAsZ
X-Coremail-Antispam: 1Uk129KBj93XoW3GFyfGr13CFyUAw47XrWkuFX_yoWxZF13pF
	9rZayYgF45JrWrZF1rXrW3ArnxA393CFZrta17tw1vkrsFywn8WryDGF12vFW3ArWkGr1U
	XFWkCFWfCas8uFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUx_HUUUUUU

Extend the Loongson audio machine driver with jack detection, DAPM
widgets support, enabling proper switching between headphones and
speakers on the Loongson-2K0300 ATK-DL2K0300B board.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 131 ++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 4 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 0e63cbcad57a..25cd12eab4b1 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -7,33 +7,126 @@
 //         Binbin Zhou <zhoubinbin@loongson.cn>
 //
 
-#include <linux/module.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
 #include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
 #include <linux/pci.h>
+#include <sound/jack.h>
 #include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
 
 static char codec_name[SND_ACPI_I2C_ID_LEN];
 
 struct loongson_card_data {
 	struct snd_soc_card snd_card;
 	unsigned int mclk_fs;
+	struct gpio_desc *gpiod_hp_det;
+	struct gpio_desc *gpiod_hp_ctl;
+	struct gpio_desc *gpiod_spkr_en;
 	const struct loongson_card_config *cfg;
 };
 
 struct loongson_card_config {
 	unsigned int fmt;
+	bool add_hp_jack;
+	bool add_dapm_widgets;
+	bool add_dapm_routes;
 };
 
 static const struct loongson_card_config ls2k1000_card_config = {
 	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBC_CFC,
+	.add_hp_jack = false,
+	.add_dapm_widgets = false,
+	.add_dapm_routes = false,
 };
 
 static const struct loongson_card_config ls2k0300_forever_pi_card_config = {
 	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
+	.add_hp_jack = false,
+	.add_dapm_widgets = false,
+	.add_dapm_routes = false,
+};
+
+static const struct loongson_card_config ls2k0300_dl2k0300b_card_config = {
+	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
+	.add_hp_jack = true,
+	.add_dapm_widgets = true,
+	.add_dapm_routes = true,
+};
+
+static int tegra_machine_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct loongson_card_data *priv = snd_soc_card_get_drvdata(card);
+
+	if (!snd_soc_dapm_widget_name_cmp(w, "Speaker"))
+		gpiod_set_value_cansleep(priv->gpiod_spkr_en,
+					 SND_SOC_DAPM_EVENT_ON(event));
+
+	if (!snd_soc_dapm_widget_name_cmp(w, "Headphone"))
+		gpiod_set_value_cansleep(priv->gpiod_hp_ctl,
+					 SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget loongson_aosc_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", tegra_machine_event),
+	SND_SOC_DAPM_SPK("Speaker", tegra_machine_event),
+};
+
+/* Headphones Jack */
+
+static struct snd_soc_jack loongson_asoc_hp_jack;
+
+static struct snd_soc_jack_pin loongson_asoc_hp_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE
+	},
+	{
+		.pin = "Speaker",
+		.mask = SND_JACK_HEADPHONE,
+		.invert = 1
+	},
+};
+
+static struct snd_soc_jack_gpio loongson_asoc_hp_jack_gpio = {
+	.name = "Headphones detection",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
 };
 
+static int loongson_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct loongson_card_data *ls_priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	if (!ls_priv->cfg->add_hp_jack || !ls_priv->gpiod_hp_det)
+		return 0;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headphones Jack",
+					 SND_JACK_HEADPHONE,
+					 &loongson_asoc_hp_jack,
+					 loongson_asoc_hp_jack_pins,
+					 ARRAY_SIZE(loongson_asoc_hp_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headphones Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	loongson_asoc_hp_jack_gpio.desc = ls_priv->gpiod_hp_det;
+
+	ret = snd_soc_jack_add_gpios(&loongson_asoc_hp_jack, 1, &loongson_asoc_hp_jack_gpio);
+	if (ret)
+		dev_err(rtd->dev, "Headphone GPIO not added: %d\n", ret);
+
+	return ret;
+}
+
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -75,6 +168,7 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	{
 		.name = "Loongson Audio Port",
 		.stream_name = "Loongson Audio",
+		.init = loongson_asoc_machine_init,
 		SND_SOC_DAILINK_REG(analog),
 		.ops = &loongson_ops,
 	},
@@ -135,16 +229,35 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 
 static int loongson_card_parse_of(struct loongson_card_data *data)
 {
-	struct device_node *cpu, *codec;
 	struct snd_soc_card *card = &data->snd_card;
+	struct device_node *cpu, *codec;
 	struct device *dev = card->dev;
 	int ret, i;
 
+	data->gpiod_hp_det = devm_gpiod_get_optional(dev, "hp-det", GPIOD_IN);
+	if (IS_ERR(data->gpiod_hp_det))
+		return PTR_ERR(data->gpiod_hp_det);
+
+	data->gpiod_hp_ctl = devm_gpiod_get_optional(dev, "hp-ctl", GPIOD_OUT_LOW);
+	if (IS_ERR(data->gpiod_hp_ctl))
+		return PTR_ERR(data->gpiod_hp_ctl);
+
+	data->gpiod_spkr_en = devm_gpiod_get_optional(dev, "spkr-en", GPIOD_OUT_LOW);
+	if (IS_ERR(data->gpiod_spkr_en))
+		return PTR_ERR(data->gpiod_spkr_en);
+
+	if (data->cfg->add_dapm_routes) {
+		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+		if (ret)
+			return ret;
+	}
+
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
 	if (!cpu) {
 		dev_err(dev, "platform property missing or invalid\n");
 		return -EINVAL;
 	}
+
 	codec = of_get_child_by_name(dev->of_node, "codec");
 	if (!codec) {
 		dev_err(dev, "audio-codec property missing or invalid\n");
@@ -199,6 +312,12 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	card->owner = THIS_MODULE;
 	card->dai_link = loongson_dai_links;
 	card->num_links = ARRAY_SIZE(loongson_dai_links);
+
+	if (ls_priv->cfg->add_dapm_widgets) {
+		card->dapm_widgets = loongson_aosc_dapm_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(loongson_aosc_dapm_widgets);
+	}
+
 	snd_soc_card_set_drvdata(card, ls_priv);
 
 	ret = device_property_read_string(dev, "model", &card->name);
@@ -227,6 +346,10 @@ static const struct of_device_id loongson_asoc_dt_ids[] = {
 		.compatible = "loongson,ls2k0300-forever-pi-audio-card",
 		.data = &ls2k0300_forever_pi_card_config
 	},
+	{
+		.compatible = "loongson,ls2k0300-dl2k0300b-audio-card",
+		.data = &ls2k0300_dl2k0300b_card_config
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, loongson_asoc_dt_ids);
-- 
2.52.0

