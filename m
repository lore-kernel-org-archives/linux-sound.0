Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797889;
	b=ien9jH228/nFt7o1rKKSHDcia1y6XzVQfo5HiwZA1EGYdU+QMTIqyrUN/y4GpKQcr1Ze
	 d547S47AOJEiETaBa+maKPfVwWTYBj4bNpO/mNqb7DKKkx99Kdw1Epk04GgKUQWeHURaZ
	 KdFIHHO7rHPSbQ1KEqdHc5XOwL4CBPT0AhjF7b3W+8xqc/v0pUPMBsrAIsJSdp0dKozvm
	 80dQ+wMWSSpL4p9GQbp8sPQaD7qE0GRSvik1w8L6NWwJcvKRCN3u9Ff28oL5apLOXAJX7
	 qlbA3mTzxw8YRhseikr3nXNyOG+Gl4zFE4rwe+re48Rd+9J5SxkCpuyiwPcdY+JkfXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LiAU/rnvupWW4cNJ5vbhKdLQRYXgsnjzjuUc89YIVRw=;
	b=W1yMUgxeF/vScYHv6A8xrOg77KdcV3dM2cEwOY5iEbC7WzSNcAsKA8Vyy0vkeUk3ucZY
	 5r4eswaaRyAGep9UDndkVyCtDu3KqxG6HtRwDxbgvQmZdD8J0+jaGso+JW9HU+AL6AjBf
	 6ZqRpkqNJ0urbWQRE4UIwwPRpjpc7ClI7xLzdAm/DieRGroZloWJFefyiqwP1iUrJYqmy
	 3CDJQ1y56SK0kkG+Dgv19iVhdbfE2VxM7N8k9BWyP23qLuHX4TMDu7ieKDPnf+UU2BdSs
	 PUMRgrYYrQdhBWCXA0Msj3B8HZ5XT5DG5zFnD+nTJgjdPKoZbd8Cqmm9BTmL2Gk8lIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxprPzYw;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E19606A32F
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 16:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E19606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxprPzYw
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1498600966b.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797886; x=1796402686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LiAU/rnvupWW4cNJ5vbhKdLQRYXgsnjzjuUc89YIVRw=;
        b=WxprPzYwkw9x2689hRcp7DN5tpg5BY1nLOrctIJtf36R11hymKRxT1ArkoaIOXei5f
         FhKYY1pSK1GxAUFaA1Vs1L8NdurymBiPfLLvNeUEfUaA+VnbMdaKs83nt3ZJrAxR26oH
         gnm5lymEm3PD/z+uLCHG5fM+CwJklR2oVCCVuqVmaBadDqSZZqnzQswBOW4xcUymD5we
         mGz/GBgRi5B+MD38G5aYsDuCYN6G2PGDwnBiHVAJMDFga3yX4FA/YKAi8II/X6Ylimac
         AcYstnNq+z7aHyGKBI14xeXKPPPC5U502enDGXube9Eq7NJ1/bYqXd4fzNA1Nk9h23i4
         zjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797886; x=1796402686;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiAU/rnvupWW4cNJ5vbhKdLQRYXgsnjzjuUc89YIVRw=;
        b=rVFilOoEugJ7jYUpJ9wLs73nYUQLSJjh00I5H6SGljQXjoqMu1bfBM9FbRe+0Kr2lw
         mCX+L4NWb+KRKk3XuPoGgWjATQXrbm3D2gyMi44lkMm4DmPB5NhaZcyDKvk+2/eLZJYu
         L0yevNpanNa1uEspx/nmV8BnIx8TDcaNiLLaHBOjYPZRD3J1FL9LMejGzIEFnbxZeQ3y
         vhc8B5aakC6RKM41H/oKkwSSIWUkYpWIyLx/Vxa3cPj6X0Do17d7Rdq0wceEmUhesmT0
         BFdnPTuB64WlNedDj1bpgYjrfJZvgrhZPmGzKhogH/JiYUQpUEjWOyltty6cgAEkEpPR
         /oyQ==
X-Forwarded-Encrypted: i=1; AL+hErEqGyFe8MqrnM3JTu4IId/XkktFdBTpFda22PekdKydk76MFykSIKZB9N3AMo3eRAFt/tEsHLo5o0fAUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IBJgtyjvfEVRDVYjmhA3Dt0VEUK7cPX7dBlhD6KRPhTy0RHtG
	R0fDpFsUekFqeqPpn4tItF+IcQ3TpuHoKuyLsWVgcTVXPCAQ5P9OC6hX
X-Gm-Gg: AZFdTZcdGCl4qS37uBXALPW1Mb8uu7YXBICrG6VdbU4/RVjo2KaaWrvOMtc0BgwRDLZ
	POj5bCK1ykesi59x/aTTIpkVsJnIYOAJ6FCmBYC4q3UQhlI2u31Q4cGpw+ZU+jDYrtZ7VXWpuLc
	/h498gfL2VqzQuXUsKFPs+t6eHCzJ95PtfaP99mHYt4d2Km/Y++ASmm4NafXiaB0NqlVb9wFH/x
	vFhypJpQgITFw8QTCu6Y0kmIG7iHBqihyZ6oEVp+5oJEcdIuHIJL/NpRowhUyI6ZHD8HJHb+/oV
	sgml0nKvRxCWd+3mOnzGzl92e3Dfr8MZJbsrinqw9sTNYNOwU0j8UN0wmQP1H2PRbhIn75+orxJ
	eHXQfAhCMwyC/BCwtv8RAlT3VxZ+WhjB1x9N6PeBDBSGDtByn98R9TVX7vepZl5++/DjqQZQLsP
	XQZAy6wy0Xu+ubyu7CvLIuwqs4Vid3T9z+1t97UxPYprANP7wl5btQ9nJQKBZBXm0y4zXdYDmNj
	ADz5iO+tYz+X0dIXPEi7TIIqgantsT/RqHhdIE5N112DrO9XNO9IVr8eKFQ9oAaXnWdoilj3aXs
	te984wzOtH3ZnmoeO+KzkRhasiWVGGzBdb+g0NDm6vzxJOxEgsL84UpTD46DEzrulVdXKFTJmen
	qsR40bu6d7w==
X-Received: by 2002:a17:907:dac:b0:c42:73df:933b with SMTP id a640c23a62f3a-c513aacec0amr2053391166b.12.1795797885963;
        Fri, 27 Nov 2026 08:44:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:45 -0800 (PST)
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
Subject: [PATCH v2 1/3] ASoC: tegra: Consolidate remaining separate codec machine drivers into tegra_asoc_machine
Date: Fri, 27 Nov 2026 18:44:32 +0200
Message-ID: <20261127164436.292585-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164436.292585-1-clamor95@gmail.com>
References: <20261127164436.292585-1-clamor95@gmail.com>
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
 sound/soc/tegra/tegra_asoc_machine.c | 245 +++++++++++++++++++++++++--
 sound/soc/tegra/tegra_asoc_machine.h |   3 -
 sound/soc/tegra/tegra_wm8903.c       | 188 --------------------
 sound/soc/tegra/tegra_wm8962.c       | 152 -----------------
 sound/soc/tegra/tegra_wm8994.c       | 175 -------------------
 6 files changed, 228 insertions(+), 541 deletions(-)
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
index c4e62e2b7fd07..0e0830d2733b9 100644
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
 
@@ -1039,6 +1087,157 @@ static const struct tegra_asoc_data tegra_cpcap_data = {
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
@@ -1052,6 +1251,17 @@ static const struct of_device_id tegra_machine_of_match[] = {
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
@@ -1070,6 +1280,7 @@ MODULE_AUTHOR("Anatol Pomozov <anatol@google.com>");
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
index 25544d6804095..0000000000000
--- a/sound/soc/tegra/tegra_wm8962.c
+++ /dev/null
@@ -1,152 +0,0 @@
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

