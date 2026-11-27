Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797889;
	b=FZTHggmngg6lV1egQoZk/02wcLKz2paL/JOGtKeojYhFqtEzloZjHwFn3AWxlbEww8hM
	 pI6g4Y40QiPCuUw8R+m73VFT1OVisIlyV0zAX0n17DxQkVAsm0UMfr+SidlWJRQJ09Imf
	 +QSzYc5sr08umt/1MtnFTyo4iMgxcs0E9oqNbLpy+4WglX2/1qPW9nkFq5qSEYf/rKo7Z
	 7HdpknVW+G93Wfbl0Z3mBpPPYMg6ZdRisxa9iyk05MQBqgoqL6X+xQp/mBm/f6wGcc/2I
	 TvAyb5jrvYbxBVGiLrLE4mdIwGsgEZ2Q7/8boCKph21BFGo0fp4Wbx5vrd1sMH2/WXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KTRMnPPdfeGg8LaA/1S6poYzQtNeoatW14gLT5kRLjM=;
	b=i4R6NVScTluUk5BIxAlXbO3i/I49H+WC9LuY5RJIeBeQV7+/KLWg08Z1o23GkwrG8qmF
	 KLsFnzsApFz2zn8PDL3tf4psg0puOCy1ynJwa4AnwjG7KZEiXDcBtU4obN6qSpat51OTt
	 qgL6xnQBITOxxG6YlVqT4Vu1Va3Dq0In6xyQCNrhZDIqUtg8Sg6s4O9mDro3vpoGTHYcC
	 xceezRTghEX/drMNRCaCvM2m0zYpUkSqAoyb1nXmGCioveccKyb5XtpGoM6+pHsTrmt7V
	 YcyaJeuFWfXTrAoE0qCgBgcMo6WfYS5GMlNj78LXT+NS9zQbK2M1i3ecUmIk+Ms8zcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcvaCvpG;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64C606A32C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 16:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC64C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcvaCvpG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1235323866b.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797887; x=1796402687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTRMnPPdfeGg8LaA/1S6poYzQtNeoatW14gLT5kRLjM=;
        b=CcvaCvpGiGXUipVT0/85Z7tvANU3+0v4+kPLH0L4ij7Pr/TMZN38loVoqLE4ZMDJO/
         Nf5lYJUxz66KcJKQXIIFAiUTC7/OIasBHyVNbXqx6p7Leor7KGNdYqQ4lc20YrSchsDh
         laonFda/1s6/GXdAeyRFW7Tg1aQ0norp6Rf4SdAd5Z2d1wrV3OLM0WVpbOQkM9NikTh/
         y0ee9G3dvU1oOQLtTCa/XkuOvaQv3HoYaKaEXredgBmNi2hiQUyNEQxuPddIsrVNEEVu
         fU/bPuTIIxe0USI3jrQsfnCHIZzgs4W4Urm0/rE8WDbDCkPCklaPbuuQpOXuk6dCU2Kb
         +DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797887; x=1796402687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTRMnPPdfeGg8LaA/1S6poYzQtNeoatW14gLT5kRLjM=;
        b=K4luPaz5cj0YIGzO1t5XEF2rClhH3gN3L2kz9EMKoCa7mWjOsLhdiQBkexpkYOhlcn
         I0TdcH79ViJdIA9Pk5oKvm68QMdMdALG+UrbeKNLWsAturze6XOY5cQjd4w5TxC2ctpS
         N8L51UDYVDoTBdtreTVCMjQFZvFzuRQKxKY2Z07OEJSDW4sT+zK7VeteJHrrK9mP2uXe
         BDeYh+WpQv540b5pLIVbh1YDgwa+kzkOzP7M1pQbwYoOdHy+AoyCuEeju6NgykWXutxP
         nbOxKzGWHakPJDTnhNeKu6SXjG9fYN4iyCZx9ujIujBvs3ISc8WtPstxLeA3eHNu6WYh
         ZDhw==
X-Forwarded-Encrypted: i=1; AL+hErHjYJOCZfz7fSfhWUD8XyEeBInGC3Gqdo6PeJiWFAI3a1GZPhKLylNabEoMN8pPuEDxJ+ebkUmooqMC5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tB3BBxEeOh3qvrIw0X1bxvkP9MfNQmfCgW6qhqSclqkoRlh7Y
	qPuZNTpvH3vmVGQ2ZvxnuxrbC4Xpqz/TW/bz+/N2NlWVRbEuqM6psjLU
X-Gm-Gg: AZFdTZcDJIWZeVoPetZ/Jhzm1Eqi7YZtjIkWE/PxfbJvRhWxaN1rtOiymwvRQ/28q0t
	oIF9Q6dIq9+AT/MGZB8hxskm73qjLsPTTQOODKTDUhMPWOY19u9wKVBGQH3Zpfdvy3xCyZOvbgh
	QkKkR8c6sFe18pVaE+IlsvyPqxhjWvfeFpeBv1GZWNaYKVNha8Q+n7b87yTpvTLzhtjoZn+3ayI
	kkTcQB/WGuuCHuhHHJu6Bfm9xKXGEEIS+69rF4ew4F7hZpNJaOTUZdFTLijR/6u+Gfu7qEmpzco
	87PF7kbTqFFdvc70kVIJ+UEEWtXoWoLfGhg0RggTs9VOayXZYoq2Ra8KMmiEzt4l/PQMt/ekeEw
	SEPcbcGgvg3xAYzuPFbGCqRNOWoYQ9InwUvf4rNV0SdiPLRCk0YNB4QSHbaZDTQYbeWd+QzyVrG
	H/f1FZsSZoqzjQYgWbiMcPzOHvEl8QeZaXY++myog07yhkBeFAQXIUz9H5ELzoMMRd/U6XvGcyX
	T5G8LLB+z9Oiltf9bZqwVQgfxO03z1nNlqlKXxi9NHdZleChtwsG0YlocJFzCqCd5dgu4HGfGKk
	TVs6ip9PRbvhuUmBaGoPyTf/W4mC0vWeOG4uriBaXAcGAx9rdDGBrlQjRl23DySPAHWdTRqtx7K
	bj5SN8AXoqKI=
X-Received: by 2002:a17:906:f885:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c513aaea94amr1456318666b.29.1795797887201;
        Fri, 27 Nov 2026 08:44:47 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:46 -0800 (PST)
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
Subject: [PATCH v2 2/3] ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
Date: Fri, 27 Nov 2026 18:44:33 +0200
Message-ID: <20261127164436.292585-3-clamor95@gmail.com>
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
Content-Transfer-Encoding: 8bit

Introduce a dapm_fe_pin_name field in struct tegra_asoc_data to handle
force-enabling DAPM pins (such as "MICBIAS" or "MICBIAS1") directly inside
the common tegra_asoc_machine_init() function.

This cleanup allows the removal of repetitive, boilerplate codec-specific
initialization functions (tegra_rt5677_init(), tegra_wm8903_init(), and
tegra_wm8962_init()) and points their DAI link init callbacks directly to
tegra_asoc_machine_init().

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 62 ++++++----------------------
 sound/soc/tegra/tegra_asoc_machine.h |  1 +
 2 files changed, 14 insertions(+), 49 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 0e0830d2733b9..eb78c89fc5043 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -154,6 +154,7 @@ static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
 static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
@@ -252,6 +253,9 @@ static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
+	if (machine->asoc->dapm_fe_pin_name)
+		snd_soc_dapm_force_enable_pin(dapm, machine->asoc->dapm_fe_pin_name);
+
 	return 0;
 }
 
@@ -908,21 +912,6 @@ static const struct tegra_asoc_data tegra_trimslice_data = {
 
 /* RT5677 machine */
 
-static int tegra_rt5677_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(rt5677_aif1,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5677-aif1")),
@@ -931,7 +920,7 @@ SND_SOC_DAILINK_DEFS(rt5677_aif1,
 static struct snd_soc_dai_link tegra_rt5677_dai = {
 	.name = "RT5677",
 	.stream_name = "RT5677 PCM",
-	.init = tegra_rt5677_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -948,6 +937,7 @@ static struct snd_soc_card snd_soc_tegra_rt5677 = {
 static const struct tegra_asoc_data tegra_rt5677_data = {
 	.mclk_rate = tegra_machine_mclk_rate_256,
 	.card = &snd_soc_tegra_rt5677,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -998,7 +988,7 @@ SND_SOC_DAILINK_DEFS(rt5632_hifi,
 static struct snd_soc_dai_link tegra_rt5632_dai = {
 	.name = "ALC5632",
 	.stream_name = "ALC5632 PCM",
-	.init = tegra_rt5677_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1015,6 +1005,7 @@ static struct snd_soc_card snd_soc_tegra_rt5632 = {
 static const struct tegra_asoc_data tegra_rt5632_data = {
 	.mclk_rate = tegra_machine_mclk_rate_512,
 	.card = &snd_soc_tegra_rt5632,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -1089,21 +1080,6 @@ static const struct tegra_asoc_data tegra_cpcap_data = {
 
 /* WM8903 machine */
 
-static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8903-hifi")),
@@ -1112,7 +1088,7 @@ SND_SOC_DAILINK_DEFS(hifi,
 static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
-	.init = tegra_wm8903_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1132,6 +1108,7 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
 	.mclk_rate = tegra_machine_mclk_rate_6mhz,
 	.card = &snd_soc_tegra_wm8903,
+	.dapm_fe_pin_name = "MICBIAS",
 	.hp_jack_gpio_active_low = true,
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
@@ -1143,6 +1120,7 @@ static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
 static const struct tegra_asoc_data tegra_wm8903_data = {
 	.mclk_rate = tegra_machine_mclk_rate_6mhz,
 	.card = &snd_soc_tegra_wm8903,
+	.dapm_fe_pin_name = "MICBIAS",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -1152,21 +1130,6 @@ static const struct tegra_asoc_data tegra_wm8903_data = {
 
 /* WM8962 machine */
 
-static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -1175,7 +1138,7 @@ SND_SOC_DAILINK_DEFS(wm8962_hifi,
 static struct snd_soc_dai_link tegra_wm8962_dai = {
 	.name = "WM8962",
 	.stream_name = "WM8962 PCM",
-	.init = tegra_wm8962_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1193,6 +1156,7 @@ static struct snd_soc_card snd_soc_tegra_wm8962 = {
 static const struct tegra_asoc_data tegra_wm8962_data = {
 	.mclk_rate = tegra_machine_mclk_rate_12mhz,
 	.card = &snd_soc_tegra_wm8962,
+	.dapm_fe_pin_name = "MICBIAS",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 2034ce8e0689e..8ff39b53930c5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -13,6 +13,7 @@ struct snd_soc_pcm_runtime;
 
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
+	const char *dapm_fe_pin_name;
 	const char *codec_dev_name;
 	const char *hp_jack_name;
 	struct snd_soc_card *card;
-- 
2.53.0

