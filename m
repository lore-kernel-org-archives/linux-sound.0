Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821917;
	b=n2gbrIXw9RriDPwMG/wiUAfJrww7oZy6fUTVs8uSEXnmqRAeNTiYoeLohWYLobofLg7s
	 QnDrTxCEVJcTY8U+ghjiHXauqIklze5ORWJaZLzdhI7nSNzq+biPcB+9u7ZcK0sEN2V9q
	 xSev8bZrzp5qboae0C+Elw76JLK2kbvTqb8xS5ZjPNTwcULr/PoB4hErMRCIqpGTJxZBT
	 8csPDwtXcG+7BsXRW6OQCYo2bEyBb7blSg5iZ2Mr8nMRizD1Kk4BUAtUapu6K/B7AaUIY
	 CkjIlVatFnFJGMCQ8jel9RyK9q+qah6a0FKIgAaBzrfBavTC0HciIX208ogxY0zGgWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XEJwZeiN4f4Khv913TjEygDDX5wlP+VRCAErTIkXsdM=;
	b=5AwwM6NOjoHgJfJnJrMRm5h+gaCSqcalDYzh6mb897I/qy28YswvCOe8eWZ0xenkrA5i
	 Wd4j5jwomrVtsl52FzEToUhHe1ECwolQeCYPwyEHQX18u+/4YbiYarjDo5+ifA6i+DLdj
	 a0tFVR9eKYFqv9j5SkbYevlyVhmFQmJE3SjiQ8qsZkXF9y2X5at/AROdS56VX8uSC662L
	 L+FxYaVaF4TXtyKTd/QKMgU27pxAKb9wXhd7FC4dc0EghdEzKzP0QV2iignUVX+EFH6JQ
	 NzKtp8Snc5IqJvWe0YkIYo2z5Uox4vBJa3WCqZBAbbTwcLjEaMw3wwzPlX72ToHeGtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tm1wS9a4;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594FE606A883
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 594FE606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tm1wS9a4
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so284110566b.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821916; x=1795426716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEJwZeiN4f4Khv913TjEygDDX5wlP+VRCAErTIkXsdM=;
        b=Tm1wS9a4UYuCII+EcsvXeDPsTPiV7JI9yMuiiTNn/6wGIib1PFVDEVuEaIAGmj+DID
         C/ijT5qNPREzvN1EDxUagOGtSsVqfjlpj1X257vfRPT3SLVfnmE1W+PFgI03lzH4wtxj
         TQnwvlb5yiJkY/89woinB2Mo3xNhwiH2PwUbg55KJrWO3OkEsBoEk8R3gDo1noB6P4Wg
         8cQSoBL5hsatP25F2s9WViERcdxk7seVnq/xk3JJIazdSGMBiUwBHd/AlE3oDUWfH+r8
         wnChsjIL+bgz+VYOaXK+pct0vGFeCgaNzrW7X8CJI9MlBNWVOf+TYZY9rZKQT/qA8d6L
         UVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821916; x=1795426716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEJwZeiN4f4Khv913TjEygDDX5wlP+VRCAErTIkXsdM=;
        b=PeFs7kQmMD8u9KZEkNwKuEDGP4a8DGYguiRORbHHcc31JjwER3jj4KBZLZMVTQr0FP
         5zCO2zejVgFKfJqj0pl9hNapi+4P5ctyFCXK/sK6o5knyiryS+XbGlTLbmBOQtbUCEdQ
         /r4h1jFooB5318M+rD5vUAWnlQ4MfJX4ZmmlyV978ZO/r5EeeJ50KjlmBusA91sXh6lT
         8nq059u7b6UKcheDNSSSd9RRNFC14cBDrbtXwP/J5YFV26JWtnzTIwet1ii4dxUer5/h
         LibyDtJzbDHIoZ5laXJvyJoSt9KDzFO4cBZKT6AdlsVfT/VwPvVf2XmKuQP14olXn1OR
         Pjhw==
X-Forwarded-Encrypted: i=1; AL+hErF1uSYm/dsmkqmKOJW8yRI5kcHW6bf/NrHjEM4RQeG2R5U5I4wLDCErWbxwkKdMpdE13FE5U0wQsajjQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7shXIksPaD0GfPArVGpzmslv8fE+a1y+AhCMWbGZpZCXM9iE7
	by1GX68zrJzhDRhCo6JS5rG1vHP4klXUAIL/hqtqMb6l056XUhdxMxt2
X-Gm-Gg: AYBFou2wL8mP8b6KebTsUpN9GA2j2FkIL/44E1TkjrpJXFnrZm/USvbBh4r2ygTz1rS
	Pn8Hs39ofiMHyo9jEBmwWyYgeWMK+OpfMaYFqqbe+IeF5V/FM9k0/hdn1aw8ZFLQXnhPoBPKwlJ
	Xt/GSkF3XsjjHglwFq9MdudbYNJeQ3TxHj0lVDa2G5cOPab1NkzwOGHJfil0x68AlQ2vlyFIP/+
	BogLyPDvIRftBFR2dSuSBAnv2Q+VnR94+4LhTHsq1CT/dpYDY6zFA9cWvfy7SMgJooWWXYVVMWO
	3fURMbHb1O3QK+ihs5rIBO1+8Xt7BGOhqWvo3pG5ZiEJ6e883eU2Iiy/eJw0OY4gg63YacYD6p+
	Bncqlb+HyRQjBivIIujtaXN1y337rsK/vZkCB8wqa09juojRs2TUXkxD+kY4lcHRTSxpybVr3Ol
	Q/mLh36LQGmyCg8ehOxM0ryEPOD/r6C3Jew8Qqbeq0t4FpETBsohtl87+sFDuIhYpOPz0QoXdlK
	mzbFuOG04ZRBM+0CxDDpRZrQlXnT0VkaI+GrLTUtPymT+z+dnS7vVOrH4RZSSV17WBIF8zYBFDr
	NMOMFBRdLgAf2OyRb98+CL7B8Drv9nMhr/dd3FWtI8w2PFTlt0cUMZ9JA/CzkF74bsD8rI22tz3
	QQ+reWzMDLfxCwRM02hB7p3nL8VAvjqM=
X-Received: by 2002:a17:906:dc89:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c5096436f64mr828654666b.49.1794821915609;
        Mon, 16 Nov 2026 01:38:35 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm379906166b.65.2026.11.16.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:38:35 -0800 (PST)
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
Subject: [PATCH v1 3/3] ASoC: tegra: Reorder the codec structures and sort the machine OF match table alphabetically
Date: Mon, 16 Nov 2026 11:38:01 +0200
Message-ID: <20261116093805.73715-4-clamor95@gmail.com>
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
Content-Transfer-Encoding: 8bit

Reorder the codec structures and sort the "tegra_machine_of_match" table
alphabetically by codec names and their compatible strings for cleaner
organization and easier maintenance.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 366 +++++++++++++--------------
 1 file changed, 183 insertions(+), 183 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index ebca41a5db752..46de7c7d8762e 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -699,69 +699,70 @@ static int tegra_asoc_machine_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/* WM8753 machine */
+/* CPCAP machine */
 
-SND_SOC_DAILINK_DEFS(wm8753_hifi,
+SND_SOC_DAILINK_DEFS(cpcap_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8753-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cpcap-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_wm8753_dai = {
-	.name = "WM8753",
-	.stream_name = "WM8753 PCM",
+static struct snd_soc_dai_link tegra_cpcap_dai = {
+	.name = "CPCAP",
+	.stream_name = "CPCAP PCM",
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(wm8753_hifi),
+		   SND_SOC_DAIFMT_CBP_CFP,
+	SND_SOC_DAILINK_REG(cpcap_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_wm8753 = {
-	.components = "codec:wm8753",
-	.dai_link = &tegra_wm8753_dai,
+static struct snd_soc_card snd_soc_tegra_cpcap = {
+	.components = "codec:cpcap",
+	.dai_link = &tegra_cpcap_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_wm8753_data = {
-	.mclk_rate = tegra_machine_mclk_rate_12mhz,
-	.card = &snd_soc_tegra_wm8753,
+static const struct tegra_asoc_data tegra_cpcap_data = {
+	.mclk_rate = tegra_machine_mclk_rate_cpcap,
+	.card = &snd_soc_tegra_cpcap,
 	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
 	.add_common_snd_ops = true,
 };
 
-/* WM9712 machine */
-
-static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
-
-	return snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
-}
+/* MAX98088 machine */
 
-SND_SOC_DAILINK_DEFS(wm9712_hifi,
+SND_SOC_DAILINK_DEFS(max98088_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_wm9712_dai = {
-	.name = "AC97 HiFi",
-	.stream_name = "AC97 HiFi",
-	.init = tegra_wm9712_init,
-	SND_SOC_DAILINK_REG(wm9712_hifi),
+static struct snd_soc_dai_link tegra_max98088_dai = {
+	.name = "MAX98088",
+	.stream_name = "MAX98088 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(max98088_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_wm9712 = {
-	.components = "codec:wm9712",
-	.dai_link = &tegra_wm9712_dai,
+static struct snd_soc_card snd_soc_tegra_max98088 = {
+	.components = "codec:max98088",
+	.dai_link = &tegra_max98088_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_wm9712_data = {
-	.card = &snd_soc_tegra_wm9712,
+static const struct tegra_asoc_data tegra_max98088_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_max98088,
 	.add_common_dapm_widgets = true,
-	.codec_dev_name = "wm9712-codec",
-	.set_ac97 = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
 };
 
 /* MAX98090 machine */
@@ -799,33 +800,33 @@ static const struct tegra_asoc_data tegra_max98090_data = {
 	.add_hp_jack = true,
 };
 
-/* MAX98088 machine */
+/* RT5631 machine */
 
-SND_SOC_DAILINK_DEFS(max98088_hifi,
+SND_SOC_DAILINK_DEFS(rt5631_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_max98088_dai = {
-	.name = "MAX98088",
-	.stream_name = "MAX98088 PCM",
+static struct snd_soc_dai_link tegra_rt5631_dai = {
+	.name = "RT5631",
+	.stream_name = "RT5631 PCM",
 	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(max98088_hifi),
+	SND_SOC_DAILINK_REG(rt5631_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_max98088 = {
-	.components = "codec:max98088",
-	.dai_link = &tegra_max98088_dai,
+static struct snd_soc_card snd_soc_tegra_rt5631 = {
+	.components = "codec:rt5631",
+	.dai_link = &tegra_rt5631_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_max98088_data = {
-	.mclk_rate = tegra_machine_mclk_rate_12mhz,
-	.card = &snd_soc_tegra_max98088,
+static const struct tegra_asoc_data tegra_rt5631_data = {
+	.mclk_rate = tegra_machine_mclk_rate_6mhz,
+	.card = &snd_soc_tegra_rt5631,
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -833,81 +834,71 @@ static const struct tegra_asoc_data tegra_max98088_data = {
 	.add_hp_jack = true,
 };
 
-/* SGTL5000 machine */
+/* RT5632 machine */
 
-SND_SOC_DAILINK_DEFS(sgtl5000_hifi,
+SND_SOC_DAILINK_DEFS(rt5632_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_sgtl5000_dai = {
-	.name = "sgtl5000",
-	.stream_name = "HiFi",
+static struct snd_soc_dai_link tegra_rt5632_dai = {
+	.name = "ALC5632",
+	.stream_name = "ALC5632 PCM",
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(sgtl5000_hifi),
+	SND_SOC_DAILINK_REG(rt5632_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
-	.components = "codec:sgtl5000",
-	.dai_link = &tegra_sgtl5000_dai,
+static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
+	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_sgtl5000_data = {
-	.mclk_rate = tegra_machine_mclk_rate_12mhz,
-	.card = &snd_soc_tegra_sgtl5000,
+static const struct tegra_asoc_data tegra_rt5632_data = {
+	.mclk_rate = tegra_machine_mclk_rate_512,
+	.card = &snd_soc_tegra_rt5632,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
 	.add_common_snd_ops = true,
+	.add_headset_jack = true,
 };
 
-/* TLV320AIC23 machine */
-
-static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Line Out", NULL),
-	SND_SOC_DAPM_LINE("Line In", NULL),
-};
-
-static const struct snd_soc_dapm_route trimslice_audio_map[] = {
-	{"Line Out", NULL, "LOUT"},
-	{"Line Out", NULL, "ROUT"},
-
-	{"LLINEIN", NULL, "Line In"},
-	{"RLINEIN", NULL, "Line In"},
-};
+/* RT5640 machine */
 
-SND_SOC_DAILINK_DEFS(tlv320aic23_hifi,
+SND_SOC_DAILINK_DEFS(rt5640_aif1,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5640-aif1")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
-	.name = "TLV320AIC23",
-	.stream_name = "AIC23",
+static struct snd_soc_dai_link tegra_rt5640_dai = {
+	.name = "RT5640",
+	.stream_name = "RT5640 PCM",
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(tlv320aic23_hifi),
+	SND_SOC_DAILINK_REG(rt5640_aif1),
 };
 
-static struct snd_soc_card snd_soc_tegra_trimslice = {
-	.name = "tegra-trimslice",
-	.components = "codec:tlv320aic23",
-	.dai_link = &tegra_tlv320aic23_dai,
+static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
+	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
-	.dapm_widgets = trimslice_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
-	.dapm_routes = trimslice_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_trimslice_data = {
-	.mclk_rate = tegra_machine_mclk_rate_128,
-	.card = &snd_soc_tegra_trimslice,
+static const struct tegra_asoc_data tegra_rt5640_data = {
+	.mclk_rate = tegra_machine_mclk_rate_256,
+	.card = &snd_soc_tegra_rt5640,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
 	.add_common_snd_ops = true,
+	.add_hp_jack = true,
 };
 
 /* RT5677 machine */
@@ -945,136 +936,110 @@ static const struct tegra_asoc_data tegra_rt5677_data = {
 	.add_hp_jack = true,
 };
 
-/* RT5640 machine */
+/* SGTL5000 machine */
 
-SND_SOC_DAILINK_DEFS(rt5640_aif1,
+SND_SOC_DAILINK_DEFS(sgtl5000_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5640-aif1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_rt5640_dai = {
-	.name = "RT5640",
-	.stream_name = "RT5640 PCM",
-	.init = tegra_asoc_machine_init,
+static struct snd_soc_dai_link tegra_sgtl5000_dai = {
+	.name = "sgtl5000",
+	.stream_name = "HiFi",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(rt5640_aif1),
+	SND_SOC_DAILINK_REG(sgtl5000_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_rt5640 = {
-	.components = "codec:rt5640",
-	.dai_link = &tegra_rt5640_dai,
+static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
+	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_rt5640_data = {
-	.mclk_rate = tegra_machine_mclk_rate_256,
-	.card = &snd_soc_tegra_rt5640,
+static const struct tegra_asoc_data tegra_sgtl5000_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_sgtl5000,
 	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
 	.add_common_snd_ops = true,
-	.add_hp_jack = true,
 };
 
-/* RT5632 machine */
-
-SND_SOC_DAILINK_DEFS(rt5632_hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+/* TLV320AIC23 machine */
 
-static struct snd_soc_dai_link tegra_rt5632_dai = {
-	.name = "ALC5632",
-	.stream_name = "ALC5632 PCM",
-	.init = tegra_asoc_machine_init,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(rt5632_hifi),
+static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Line Out", NULL),
+	SND_SOC_DAPM_LINE("Line In", NULL),
 };
 
-static struct snd_soc_card snd_soc_tegra_rt5632 = {
-	.components = "codec:rt5632",
-	.dai_link = &tegra_rt5632_dai,
-	.num_links = 1,
-	.fully_routed = true,
-};
+static const struct snd_soc_dapm_route trimslice_audio_map[] = {
+	{"Line Out", NULL, "LOUT"},
+	{"Line Out", NULL, "ROUT"},
 
-static const struct tegra_asoc_data tegra_rt5632_data = {
-	.mclk_rate = tegra_machine_mclk_rate_512,
-	.card = &snd_soc_tegra_rt5632,
-	.dapm_fe_pin_name = "MICBIAS1",
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
-	.add_common_snd_ops = true,
-	.add_headset_jack = true,
+	{"LLINEIN", NULL, "Line In"},
+	{"RLINEIN", NULL, "Line In"},
 };
 
-/* RT5631 machine */
-
-SND_SOC_DAILINK_DEFS(rt5631_hifi,
+SND_SOC_DAILINK_DEFS(tlv320aic23_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_rt5631_dai = {
-	.name = "RT5631",
-	.stream_name = "RT5631 PCM",
-	.init = tegra_asoc_machine_init,
+static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
+	.name = "TLV320AIC23",
+	.stream_name = "AIC23",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(rt5631_hifi),
+	SND_SOC_DAILINK_REG(tlv320aic23_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_rt5631 = {
-	.components = "codec:rt5631",
-	.dai_link = &tegra_rt5631_dai,
+static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.name = "tegra-trimslice",
+	.components = "codec:tlv320aic23",
+	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
+	.dapm_widgets = trimslice_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
+	.dapm_routes = trimslice_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_rt5631_data = {
-	.mclk_rate = tegra_machine_mclk_rate_6mhz,
-	.card = &snd_soc_tegra_rt5631,
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
+static const struct tegra_asoc_data tegra_trimslice_data = {
+	.mclk_rate = tegra_machine_mclk_rate_128,
+	.card = &snd_soc_tegra_trimslice,
 	.add_common_snd_ops = true,
-	.add_mic_jack = true,
-	.add_hp_jack = true,
 };
 
-/* CPCAP machine */
+/* WM8753 machine */
 
-SND_SOC_DAILINK_DEFS(cpcap_hifi,
+SND_SOC_DAILINK_DEFS(wm8753_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cpcap-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8753-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_cpcap_dai = {
-	.name = "CPCAP",
-	.stream_name = "CPCAP PCM",
-	.init = tegra_asoc_machine_init,
+static struct snd_soc_dai_link tegra_wm8753_dai = {
+	.name = "WM8753",
+	.stream_name = "WM8753 PCM",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBP_CFP,
-	SND_SOC_DAILINK_REG(cpcap_hifi),
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8753_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_cpcap = {
-	.components = "codec:cpcap",
-	.dai_link = &tegra_cpcap_dai,
+static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
+	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_cpcap_data = {
-	.mclk_rate = tegra_machine_mclk_rate_cpcap,
-	.card = &snd_soc_tegra_cpcap,
+static const struct tegra_asoc_data tegra_wm8753_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_wm8753,
 	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
 	.add_common_snd_ops = true,
 };
 
@@ -1203,22 +1168,56 @@ static const struct tegra_asoc_data tegra_wm8994_data = {
 	.add_hp_jack = true,
 };
 
+/* WM9712 machine */
+
+static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
+
+	return snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
+}
+
+SND_SOC_DAILINK_DEFS(wm9712_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm9712_dai = {
+	.name = "AC97 HiFi",
+	.stream_name = "AC97 HiFi",
+	.init = tegra_wm9712_init,
+	SND_SOC_DAILINK_REG(wm9712_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
+	.dai_link = &tegra_wm9712_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm9712_data = {
+	.card = &snd_soc_tegra_wm9712,
+	.add_common_dapm_widgets = true,
+	.codec_dev_name = "wm9712-codec",
+	.set_ac97 = true,
+};
+
 static const struct of_device_id tegra_machine_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
-	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
+	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
+	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
 	{ .compatible = "nvidia,tegra-audio-max98088", .data = &tegra_max98088_data },
 	{ .compatible = "nvidia,tegra-audio-max98089", .data = &tegra_max98088_data },
+	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
+	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
+	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
+	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
 	{ .compatible = "nvidia,tegra-audio-sgtl5000", .data = &tegra_sgtl5000_data },
-	{ .compatible = "nvidia,tegra-audio-wm9712", .data = &tegra_wm9712_data },
+	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
-	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
-	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
-	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
-	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
-	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
-	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
 	{ .compatible = "nvidia,tegra-audio-wm8903-cardhu", .data = &tegra_wm8903_data_legacy },
 	{ .compatible = "nvidia,tegra-audio-wm8903-harmony", .data = &tegra_wm8903_data_legacy },
 	{ .compatible = "nvidia,tegra-audio-wm8903-picasso", .data = &tegra_wm8903_data_legacy },
@@ -1227,6 +1226,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
 	{ .compatible = "nvidia,tegra-audio-wm8962", .data = &tegra_wm8962_data },
 	{ .compatible = "nvidia,tegra-audio-wm8994", .data = &tegra_wm8994_data },
+	{ .compatible = "nvidia,tegra-audio-wm9712", .data = &tegra_wm9712_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
-- 
2.53.0

