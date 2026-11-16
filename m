Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821916;
	b=TwpQ3oWRNwpzIdVALlInwFwIWX675iSeIDOxPK1hJ320XhKd44OGPT4oZ1HxW5KrvuV2
	 4nJUQn3yjKv02RFet6vCqKYJps0th3o+YVdR6Ly5RpilpmBBL49UHf1rAw2mRALvWM2Ft
	 NOvGzL0jO1d5WAxSvX1d4SznVOFBLRuWjHnPM7HhfJk0X7K5IKqiwpJR7G/r9iXyhucHz
	 f4PClpDvy17K5X3F7BOhCuhtVgq4z3Q79490FwpK4EzWiwfYdHFeWCyvuhJxGRv6yN3lV
	 qqQ/k8idOruP6k6VmGCHU/VPcJZvp3mNkMBUn4zbjyXu+5wVCq2NXYBFQAAxvCBdEgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sHmtxI/lrLLdCB8CwfEvcj6WoBnt7riupKSCbLNCFEo=;
	b=CD6x7+OxQNdBSUk80NgWIlxHNeYpUAFgvQBKNttg9kcSM0J8Fa7rWo0FQZGvHn9gqmqk
	 9YUO5BOX/Go+8Oi5n25gi/CcFe63Rx4ovdAh5k2iY8ASASMMu1DDXI0rkGg82qNZyPNJh
	 1lirvFjMfU17WrWU8HIbxdvh6B/1a0Axlo3oC+aRPthU1pFcicgLC8JRGHpfq+esx2zOn
	 L8I/rye2doCg7id5Kr/rpaeRXmCWug+RmMIcLBw3TLFg8irCR1dw0kkpzwm7IjwAlT3Kn
	 L3tQ9onLdncDH7Li7AHNMcOkmo/OGcxU7rzMgAFrFUAXK+VS++pOMAUdsgtRrYy45Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRRPZYF5;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E4606A33F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00E4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRRPZYF5
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c468bd799ecso464621766b.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821913; x=1795426713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHmtxI/lrLLdCB8CwfEvcj6WoBnt7riupKSCbLNCFEo=;
        b=fRRPZYF58USDFSvukVpnMZZCxJ3eBCm50JMqxe9CbbKKmbPQsD9ktijz5o5Y/8sx4t
         Ofwcpz+muchhlPWkd4KNFGB/2DlqhOnDF8APy+zswjcxRA1hwF+oYOgkfcmbJ3BMNyKR
         FHil4LRb304W2lrRTrT7d21/HJcvCNUgH/lFSEL+gNq4nxSkQhe8ZbBXfSpZHDM3HO+o
         1LtSVznIetTOq3De5s1RvjBQYKdu3jstGhDoy9yhXX9w/GOBFiNrs7CLQ8oAvDQTdXrg
         +v3ImgXDihkm7sTHp21EeMjjCG29jZC4VOh7AoCBMw3EgLifT36IYXSF4FySAjtoWHYc
         O4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821913; x=1795426713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHmtxI/lrLLdCB8CwfEvcj6WoBnt7riupKSCbLNCFEo=;
        b=ZdMdH3BfDDbby+d4HFSGh3hcGtjFhI0pnx1RrzHoxRsSNIM0qVdhAoYIXbLBnC4Oxi
         Pdjp++yndryYgc/JXR2uYH5nLVLqUG3ZDhFBHlqR3tTNCuulEHIpgZDVJMBsAGTggYcp
         giANKQqJM5ldWeoAS8P3TnZZbH5A3c3r821vx30ObOxwCRVAuPgpjNDfxbBblrUU4ifG
         6FZG7RVvtMiZSzSiyYgHx1UQ774s8eEwdQgg7ZTC/1dWqvFjleLcQCNiStELq6DecNEB
         ntmQEXF52sBOV9mVa+pdRJms5E+mMZhVDpzVbTBPfQyCziQoG5+cqJ3PohjrFo4AJ4MM
         LQig==
X-Forwarded-Encrypted: i=1; AL+hErGLmFAbZESu0RfUFHitqCSLcTqbQEKDXpBzhbJer5Yh+Tay3+SASxch6ZRakpCprhBp4/YL0iZCstEcVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wlnecaNAnPmRqOwLSoxRw6TLQYgy8avwAm5CpJUBCU1b1p93x
	bAXBHDrQXh18LmRTa8/0ml+lSez+KbCnojaterLmpg92W99rdG01wHhy
X-Gm-Gg: AYBFou0IpFKD0+jLMe7CMJ7sNaqGpXG7ErIgwNtNEPQpz76qn5LDI5QFGQ7gTjStK0r
	eJMtciWQS4wp7Y8ssBGqPzAAKaMmPeGCRgohpIWEY9izkhWTlOEtf86uvCqu+rFfcXwoVImAO/a
	GsT+G2/eb3cn02rrtk4nMvRShyMu/NcXNeekMQs2yH7sRzsc8ockwgdcvlMu4o0xKfLJxVREPNr
	UOXyjARWgRDAfIxcjKydSZs0RxWsALOfIe7sM7podlEUPm7x8N908nPb/4Uk2X32zUz4MhT5bL/
	VEH+fY3ud4y3pTBo5C8okGglDru9OuOLb6d5GtD7U4lfbXaNui2iqt6rDYwXt2Rl8Mnjk1x66Mb
	dsqu+vqHSe2NxFeePmsypg3KIJQ0JCM+FzS37CjTyYjdagr8R7w97lz0g69KrfaxYwq/VH7abc/
	Sow259MeIHlYHquPI+pCetPl+wEchL3i3bxR2JQ1Z0H3HDHE69ATj7/YkyJvR6Y8Kk1HNGGS40i
	57cus5ReGOUWwPqNm4sxYEvU+kEghj/QDGtZAgMZJ5UGLbL6Eh/8w+51uQ9bXbgIDuxNHO7my20
	hJbIbON717tuR2RSYnAn1hGbzYzODE0/Q/NqhVw32ArJ9p1UPxRogiFavwh+TE7tHQHyD7F5Cab
	9MwKlG17odQ==
X-Received: by 2002:a17:906:f5a8:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c5096853f0cmr742258666b.49.1794821912839;
        Mon, 16 Nov 2026 01:38:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm379906166b.65.2026.11.16.01.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:38:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] ASoC: tegra: Consolidate remaining separate codec machine drivers into tegra_asoc_machine
Date: Mon, 16 Nov 2026 11:37:59 +0200
Message-ID: <20261116093805.73715-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093805.73715-1-clamor95@gmail.com>
References: <20261116093805.73715-1-clamor95@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Merge individual machine drivers for WM8903, WM8962, and WM8994 codecs
directly into tegra_asoc_machine.c, removing separate driver source files
(tegra_wm8903.c, tegra_wm8962.c, tegra_wm8994.c) and simplifying the build
system. This follows the unified machine driver approach used by other
Tegra audio machines.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 246 +++++++++++++++++++++++++--
 sound/soc/tegra/tegra_asoc_machine.h |   3 -
 sound/soc/tegra/tegra_wm8903.c       | 188 --------------------
 sound/soc/tegra/tegra_wm8962.c       | 165 ------------------
 sound/soc/tegra/tegra_wm8994.c       | 175 -------------------
 6 files changed, 229 insertions(+), 554 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index b8f90149bfa63..cb9f597bca1d7 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -41,14 +41,8 @@ obj-$(CONFIG_SND_SOC_TEGRA210_MIXER) += snd-soc-tegra210-mixer.o
 obj-$(CONFIG_SND_SOC_TEGRA210_OPE) += snd-soc-tegra210-ope.o
 
 # Tegra machine Support
-snd-soc-tegra-wm8903-y := tegra_wm8903.o
-snd-soc-tegra-wm8962-y := tegra_wm8962.o
-snd-soc-tegra-wm8994-y := tegra_wm8994.o
 snd-soc-tegra-machine-y := tegra_asoc_machine.o
 snd-soc-tegra-audio-graph-card-y := tegra_audio_graph_card.o
 
-obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
-obj-$(CONFIG_SND_SOC_TEGRA_WM8962) += snd-soc-tegra-wm8962.o
-obj-$(CONFIG_SND_SOC_TEGRA_WM8994) += snd-soc-tegra-wm8994.o
 obj-$(CONFIG_SND_SOC_TEGRA_MACHINE_DRV) += snd-soc-tegra-machine.o
 obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index e2d0e5947339d..18302119a08d2 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -138,13 +138,41 @@ static const struct snd_kcontrol_new tegra_machine_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
 };
 
-int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
+static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
+	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
+	SOC_DAPM_PIN_SWITCH("FM Radio"),
+};
+
+static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
 	const char *jack_name;
+	int shrt = 0;
 	int err;
 
+	/*
+	 * Older version of machine driver was ignoring GPIO polarity,
+	 * forcing it to active-low. This means that all older device-trees
+	 * which set the polarity to active-high are wrong and we need to fix
+	 * them up.
+	 */
+	if (machine->asoc->hp_jack_gpio_active_low) {
+		bool active_low = gpiod_is_active_low(machine->gpiod_hp_det);
+
+		machine->hp_jack_gpio->invert = !active_low;
+	}
+
 	if (machine->gpiod_hp_det && machine->asoc->add_hp_jack) {
 		if (machine->asoc->hp_jack_name)
 			jack_name = machine->asoc->hp_jack_name;
@@ -190,7 +218,7 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 			dev_err(rtd->dev, "Headset GPIOs not added: %d\n", err);
 	}
 
-	if (machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
+	if (machine->asoc->add_mic_jack) {
 		err = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
 						 SND_JACK_MICROPHONE,
 						 &tegra_machine_mic_jack,
@@ -201,24 +229,45 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 			return err;
 		}
 
-		tegra_machine_mic_jack_gpio.data = machine;
-		tegra_machine_mic_jack_gpio.desc = machine->gpiod_mic_det;
-
-		if (of_property_read_bool(card->dev->of_node,
-					  "nvidia,coupled-mic-hp-det")) {
-			tegra_machine_mic_jack_gpio.desc = machine->gpiod_hp_det;
-			tegra_machine_mic_jack_gpio.jack_status_check = coupled_mic_hp_check;
+		if (machine->gpiod_mic_det) {
+			tegra_machine_mic_jack_gpio.data = machine;
+			tegra_machine_mic_jack_gpio.desc = machine->gpiod_mic_det;
+
+			if (of_property_read_bool(card->dev->of_node,
+						  "nvidia,coupled-mic-hp-det")) {
+				tegra_machine_mic_jack_gpio.desc = machine->gpiod_hp_det;
+				tegra_machine_mic_jack_gpio.jack_status_check = coupled_mic_hp_check;
+			}
+
+			err = snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
+						     &tegra_machine_mic_jack_gpio);
+			if (err)
+				dev_err(rtd->dev, "Mic GPIOs not added: %d\n", err);
+		} else {
+			if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
+				shrt = SND_JACK_MICROPHONE;
+
+			snd_soc_component_set_jack(component, machine->mic_jack,
+						   shrt ? &shrt : NULL);
 		}
-
-		err = snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
-					     &tegra_machine_mic_jack_gpio);
-		if (err)
-			dev_err(rtd->dev, "Mic GPIOs not added: %d\n", err);
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_asoc_machine_init);
+
+static int tegra_asoc_machine_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link = &card->dai_link[0];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack)
+		snd_soc_component_set_jack(component, NULL, NULL);
+
+	return 0;
+}
 
 static unsigned int tegra_machine_mclk_rate_128(unsigned int srate)
 {
@@ -445,7 +494,7 @@ static int tegra_machine_register_codec(struct device *dev, const char *name)
 	return 0;
 }
 
-int tegra_asoc_machine_probe(struct platform_device *pdev)
+static int tegra_asoc_machine_probe(struct platform_device *pdev)
 {
 	struct device_node *np_codec, *np_i2s, *np_ac97;
 	const struct tegra_asoc_data *asoc;
@@ -645,7 +694,6 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_asoc_machine_probe);
 
 /* WM8753 machine */
 
@@ -1039,6 +1087,158 @@ static const struct tegra_asoc_data tegra_cpcap_data = {
 	.add_common_snd_ops = true,
 };
 
+/* WM8903 machine */
+
+static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int err;
+
+	err = tegra_asoc_machine_init(rtd);
+	if (err)
+		return err;
+
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8903-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8903_dai = {
+	.name = "WM8903",
+	.stream_name = "WM8903 PCM",
+	.init = tegra_wm8903_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8903 = {
+	.components = "codec:wm8903",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_wm8903_dai,
+	.num_links = 1,
+	.remove = tegra_asoc_machine_remove,
+	.fully_routed = true,
+};
+
+/* older device-trees used wrong polarity for the headphones-detection GPIO */
+static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
+	.mclk_rate = tegra_machine_mclk_rate_6mhz,
+	.card = &snd_soc_tegra_wm8903,
+	.hp_jack_gpio_active_low = true,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8903_data = {
+	.mclk_rate = tegra_machine_mclk_rate_6mhz,
+	.card = &snd_soc_tegra_wm8903,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+/* WM8962 machine */
+
+static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int err;
+
+	err = tegra_asoc_machine_init(rtd);
+	if (err)
+		return err;
+
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(wm8962_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8962_dai = {
+	.name = "WM8962",
+	.stream_name = "WM8962 PCM",
+	.init = tegra_wm8962_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8962_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8962 = {
+	.components = "codec:wm8962",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_wm8962_dai,
+	.num_links = 1,
+	.remove = tegra_asoc_machine_remove,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8962_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_wm8962,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+/* WM8994 machine */
+
+SND_SOC_DAILINK_DEFS(wm8994_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8994_dai = {
+	.name = "WM8994",
+	.stream_name = "WM8994 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8994_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8994 = {
+	.components = "codec:wm8994",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_wm8994_dai,
+	.num_links = 1,
+	.controls = tegra_wm8994_controls,
+	.num_controls = ARRAY_SIZE(tegra_wm8994_controls),
+	.remove = tegra_asoc_machine_remove,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8994_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.mclk_id = 1, /* WM8994_SYSCLK_MCLK1 */
+	.card = &snd_soc_tegra_wm8994,
+	.add_common_dapm_widgets = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
 static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
@@ -1052,6 +1252,17 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
 	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
 	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
+	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-cardhu", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-harmony", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-picasso", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-seaboard", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-ventana", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
+	{ .compatible = "nvidia,tegra-audio-wm8962", .data = &tegra_wm8962_data },
+	{ .compatible = "nvidia,tegra-audio-wm8994", .data = &tegra_wm8994_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
@@ -1070,6 +1281,7 @@ MODULE_AUTHOR("Anatol Pomozov <anatol@google.com>");
 MODULE_AUTHOR("Andrey Danin <danindrey@mail.ru>");
 MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
 MODULE_AUTHOR("Ion Agorria <ion@agorria.com>");
+MODULE_AUTHOR("Jonas Schwöbel <jonasschwoebel@yahoo.de>");
 MODULE_AUTHOR("Leon Romanovsky <leon@leon.nu>");
 MODULE_AUTHOR("Lucas Stach <dev@lynxeye.de>");
 MODULE_AUTHOR("Marc Dietrich <marvin24@gmx.de>");
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 6f795d7dff7c1..2034ce8e0689e 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -45,7 +45,4 @@ struct tegra_machine {
 	struct snd_soc_jack_gpio *hp_jack_gpio;
 };
 
-int tegra_asoc_machine_probe(struct platform_device *pdev);
-int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd);
-
 #endif
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
deleted file mode 100644
index efd46d4407e6d..0000000000000
--- a/sound/soc/tegra/tegra_wm8903.c
+++ /dev/null
@@ -1,188 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * tegra_wm8903.c - Tegra machine ASoC driver for boards using WM8903 codec.
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- *
- * Based on code copyright/by:
- *
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- *
- * Copyright 2007 Wolfson Microelectronics PLC.
- * Author: Graeme Gregory
- *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
- */
-
-#include <linux/gpio/consumer.h>
-#include <linux/of.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/soc.h>
-
-#include "../codecs/wm8903.h"
-
-#include "tegra_asoc_machine.h"
-
-static struct snd_soc_jack_pin tegra_wm8903_mic_jack_pins[] = {
-	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
-};
-
-static unsigned int tegra_wm8903_mclk_rate(unsigned int srate)
-{
-	unsigned int mclk;
-
-	switch (srate) {
-	case 64000:
-	case 88200:
-	case 96000:
-		mclk = 128 * srate;
-		break;
-	default:
-		mclk = 256 * srate;
-		break;
-	}
-	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
-	while (mclk < 6000000)
-		mclk *= 2;
-
-	return mclk;
-}
-
-static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	/*
-	 * Older version of machine driver was ignoring GPIO polarity,
-	 * forcing it to active-low.  This means that all older device-trees
-	 * which set the polarity to active-high are wrong and we need to fix
-	 * them up.
-	 */
-	if (machine->asoc->hp_jack_gpio_active_low) {
-		bool active_low = gpiod_is_active_low(machine->gpiod_hp_det);
-
-		machine->hp_jack_gpio->invert = !active_low;
-	}
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
-		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-		struct snd_soc_component *component = codec_dai->component;
-		int shrt = 0;
-
-		err = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
-						 SND_JACK_MICROPHONE,
-						 machine->mic_jack,
-						 tegra_wm8903_mic_jack_pins,
-						 ARRAY_SIZE(tegra_wm8903_mic_jack_pins));
-		if (err) {
-			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
-			return err;
-		}
-
-		if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
-			shrt = SND_JACK_MICROPHONE;
-
-		snd_soc_component_set_jack(component, machine->mic_jack, &shrt);
-	}
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
-static int tegra_wm8903_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	snd_soc_component_set_jack(component, NULL, NULL);
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8903-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_wm8903_dai = {
-	.name = "WM8903",
-	.stream_name = "WM8903 PCM",
-	.init = tegra_wm8903_init,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static struct snd_soc_card snd_soc_tegra_wm8903 = {
-	.components = "codec:wm8903",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_wm8903_dai,
-	.num_links = 1,
-	.remove = tegra_wm8903_remove,
-	.fully_routed = true,
-};
-
-/* older device-trees used wrong polarity for the headphones-detection GPIO */
-static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
-	.mclk_rate = tegra_wm8903_mclk_rate,
-	.card = &snd_soc_tegra_wm8903,
-	.hp_jack_gpio_active_low = true,
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
-	.add_common_snd_ops = true,
-	.add_mic_jack = true,
-	.add_hp_jack = true,
-};
-
-static const struct tegra_asoc_data tegra_wm8903_data = {
-	.mclk_rate = tegra_wm8903_mclk_rate,
-	.card = &snd_soc_tegra_wm8903,
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
-	.add_common_snd_ops = true,
-	.add_mic_jack = true,
-	.add_hp_jack = true,
-};
-
-static const struct of_device_id tegra_wm8903_of_match[] = {
-	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "nvidia,tegra-audio-wm8903-cardhu", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "nvidia,tegra-audio-wm8903-harmony", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "nvidia,tegra-audio-wm8903-picasso", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "nvidia,tegra-audio-wm8903-seaboard", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "nvidia,tegra-audio-wm8903-ventana", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
-	{},
-};
-MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
-
-static struct platform_driver tegra_wm8903_driver = {
-	.driver = {
-		.name = "tegra-wm8903",
-		.of_match_table = tegra_wm8903_of_match,
-		.pm = &snd_soc_pm_ops,
-	},
-	.probe = tegra_asoc_machine_probe,
-};
-module_platform_driver(tegra_wm8903_driver);
-
-MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-MODULE_DESCRIPTION("Tegra+WM8903 machine ASoC driver");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
deleted file mode 100644
index 1ace9261a0f33..0000000000000
--- a/sound/soc/tegra/tegra_wm8962.c
+++ /dev/null
@@ -1,165 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * tegra_wm8962.c - Tegra machine ASoC driver for boards using WM8962 codec.
- *
- * Copyright (C) 2021-2024 Jonas Schwöbel <jonasschwoebel@yahoo.de>
- *			   Svyatoslav Ryhel <clamor95@gmail.com>
- *
- * Based on tegra_wm8903 code copyright/by:
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- *
- * Based on code copyright/by:
- *
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- *
- * Copyright 2007 Wolfson Microelectronics PLC.
- * Author: Graeme Gregory
- *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
- */
-
-#include <linux/gpio/consumer.h>
-#include <linux/of.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/soc.h>
-
-#include "../codecs/wm8962.h"
-
-#include "tegra_asoc_machine.h"
-
-static struct snd_soc_jack_pin tegra_wm8962_mic_jack_pins[] = {
-	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
-};
-
-static unsigned int tegra_wm8962_mclk_rate(unsigned int srate)
-{
-	unsigned int mclk;
-
-	switch (srate) {
-	case 8000:
-	case 16000:
-	case 24000:
-	case 32000:
-	case 48000:
-	case 64000:
-	case 96000:
-		mclk = 12288000;
-		break;
-	case 11025:
-	case 22050:
-	case 44100:
-	case 88200:
-		mclk = 11289600;
-		break;
-	default:
-		mclk = 12000000;
-		break;
-	}
-
-	return mclk;
-}
-
-static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
-		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-		struct snd_soc_component *component = codec_dai->component;
-
-		err = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
-						 SND_JACK_MICROPHONE,
-						 machine->mic_jack,
-						 tegra_wm8962_mic_jack_pins,
-						 ARRAY_SIZE(tegra_wm8962_mic_jack_pins));
-		if (err) {
-			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
-			return err;
-		}
-
-		snd_soc_component_set_jack(component, machine->mic_jack, NULL);
-	}
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
-static int tegra_wm8962_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	snd_soc_component_set_jack(component, NULL, NULL);
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(wm8962_hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_wm8962_dai = {
-	.name = "WM8962",
-	.stream_name = "WM8962 PCM",
-	.init = tegra_wm8962_init,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(wm8962_hifi),
-};
-
-static struct snd_soc_card snd_soc_tegra_wm8962 = {
-	.components = "codec:wm8962",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_wm8962_dai,
-	.num_links = 1,
-	.remove = tegra_wm8962_remove,
-	.fully_routed = true,
-};
-
-static const struct tegra_asoc_data tegra_wm8962_data = {
-	.mclk_rate = tegra_wm8962_mclk_rate,
-	.card = &snd_soc_tegra_wm8962,
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
-	.add_common_snd_ops = true,
-	.add_mic_jack = true,
-	.add_hp_jack = true,
-};
-
-static const struct of_device_id tegra_wm8962_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-wm8962", .data = &tegra_wm8962_data },
-	{},
-};
-MODULE_DEVICE_TABLE(of, tegra_wm8962_of_match);
-
-static struct platform_driver tegra_wm8962_driver = {
-	.driver = {
-		.name = "tegra-wm8962",
-		.of_match_table = tegra_wm8962_of_match,
-		.pm = &snd_soc_pm_ops,
-	},
-	.probe = tegra_asoc_machine_probe,
-};
-module_platform_driver(tegra_wm8962_driver);
-
-MODULE_AUTHOR("Jonas Schwöbel <jonasschwoebel@yahoo.de>");
-MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
-MODULE_DESCRIPTION("Tegra+WM8962 machine ASoC driver");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm8994.c
deleted file mode 100644
index 11e0ad96caf40..0000000000000
--- a/sound/soc/tegra/tegra_wm8994.c
+++ /dev/null
@@ -1,175 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-//
-// tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 codec.
-//
-// Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
-//
-// Based on tegra_wm8994 code copyright/by:
-//
-// Author: Sumit Bhattacharya <sumitb@nvidia.com>
-// Copyright (C) 2010-2011 - NVIDIA, Inc.
-//
-// Based on code copyright/by:
-//
-// (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
-//
-// Copyright 2007 Wolfson Microelectronics PLC.
-// Author: Graeme Gregory
-//         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
-
-#include <linux/gpio/consumer.h>
-#include <linux/of.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/soc.h>
-
-#include "../codecs/wm8994.h"
-
-#include "tegra_asoc_machine.h"
-
-static struct snd_soc_jack_pin tegra_wm8994_mic_jack_pins[] = {
-	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
-};
-
-static unsigned int tegra_wm8994_mclk_rate(unsigned int srate)
-{
-	unsigned int mclk;
-
-	switch (srate) {
-	case 8000:
-	case 16000:
-	case 24000:
-	case 32000:
-	case 48000:
-	case 64000:
-	case 96000:
-		mclk = 12288000;
-		break;
-	case 11025:
-	case 22050:
-	case 44100:
-	case 88200:
-		mclk = 11289600;
-		break;
-	default:
-		mclk = 12000000;
-		break;
-	}
-
-	return mclk;
-}
-
-static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speakers"),
-	SOC_DAPM_PIN_SWITCH("Int Spk"),
-	SOC_DAPM_PIN_SWITCH("Int Mic"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
-	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
-	SOC_DAPM_PIN_SWITCH("Headphones"),
-	SOC_DAPM_PIN_SWITCH("Mic Jack"),
-	SOC_DAPM_PIN_SWITCH("Line Out"),
-	SOC_DAPM_PIN_SWITCH("FM Radio"),
-};
-
-static int tegra_wm8994_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
-		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-		struct snd_soc_component *component = codec_dai->component;
-
-		err = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
-						 SND_JACK_MICROPHONE,
-						 machine->mic_jack,
-						 tegra_wm8994_mic_jack_pins,
-						 ARRAY_SIZE(tegra_wm8994_mic_jack_pins));
-		if (err) {
-			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
-			return err;
-		}
-
-		snd_soc_component_set_jack(component, machine->mic_jack, NULL);
-	}
-
-	return 0;
-}
-
-static int tegra_wm8994_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack)
-		snd_soc_component_set_jack(component, NULL, NULL);
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(wm8994_hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_wm8994_dai = {
-	.name = "WM8994",
-	.stream_name = "WM8994 PCM",
-	.init = tegra_wm8994_init,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(wm8994_hifi),
-};
-
-static struct snd_soc_card snd_soc_tegra_wm8994 = {
-	.components = "codec:wm8994",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_wm8994_dai,
-	.num_links = 1,
-	.controls = tegra_wm8994_controls,
-	.num_controls = ARRAY_SIZE(tegra_wm8994_controls),
-	.remove = tegra_wm8994_remove,
-	.fully_routed = true,
-};
-
-static const struct tegra_asoc_data tegra_wm8994_data = {
-	.mclk_rate = tegra_wm8994_mclk_rate,
-	.mclk_id = WM8994_SYSCLK_MCLK1,
-	.card = &snd_soc_tegra_wm8994,
-	.add_common_dapm_widgets = true,
-	.add_common_snd_ops = true,
-	.add_mic_jack = true,
-	.add_hp_jack = true,
-};
-
-static const struct of_device_id tegra_wm8994_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-wm8994", .data = &tegra_wm8994_data },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, tegra_wm8994_of_match);
-
-static struct platform_driver tegra_wm8994_driver = {
-	.driver = {
-		.name = "tegra-wm8994",
-		.of_match_table = tegra_wm8994_of_match,
-		.pm = &snd_soc_pm_ops,
-	},
-	.probe = tegra_asoc_machine_probe,
-};
-module_platform_driver(tegra_wm8994_driver);
-
-MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
-MODULE_DESCRIPTION("Tegra+WM8994 machine ASoC driver");
-MODULE_LICENSE("GPL");
-- 
2.53.0

