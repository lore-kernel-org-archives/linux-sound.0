Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428170;
	b=gztayYjEqu1dmXpNforlbZuFBaAbP48OVxbM6Ghb8fEOgQ4qEWU795hYBEwVgHtHPySM
	 YNy7KGrtfPG/y6+Eze+fkUHAd9tsMo4nw+/KCtP1eF5qM1u5M6/PdTsggzUFf3am5hsL0
	 AEEcD9bUmB8H0fYK28QhL5VuZtQt33RRjJiffVVxMGu3/0SEq+Svm8JXItIqGvixzZSMh
	 aG7BDp21g528xd4rMNjoX43AQuPDqNhFcoGq54dEzn82RtEx67KJIjf+3g6/qoLGsFh9N
	 0PrCYfw8FL9jQ/qrbUmtNPnTPXumQ2D2TxR5ZfdiJjQumKWFs2IZhM8xdqqPR0lpnHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U5fmRl7VLOuEYCBD7EtGXC6AhEnchrAVlkeohL5NfGk=;
	b=QDWqagyOhlbW2RFeHVgpr480gR4lfDL1rKSD4CHw5D+Q3Vb91VSJREebfCrOOPJWzScv
	 v61ewJBrJeVQISDOlriHRn0+AyIIrF66WqklNN1QZdW4bPiJIWfmWFIJJ3wJdjWnb7aiy
	 ieYfKnXg5Gebhlfc8PahvFxVOzpazA+AnulMhgHLC5+2niomh3tdgeWNzDy3CqEAIG5JM
	 DXAP1CnvGCiDlyEBtJRYY6v/zXFaj9BaCKIvh0+QmhJ1Du7bxXFmr6WcZkNl/pnsZgm/N
	 iOP/Q9mgHX1FnWXpfEAtt1XJq+MPf7JKum8ZmOZFxSyUA/V23USZKtWojgMP/kJtU4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=li0sHq2m;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD147606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 10:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD147606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=li0sHq2m
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso516048566b.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428168; x=1796032968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5fmRl7VLOuEYCBD7EtGXC6AhEnchrAVlkeohL5NfGk=;
        b=li0sHq2mCmwwRFH+LLFzvwWgCT9ZJMjiSXz8Q8lvN8eXtk1T7jXaLFbWt1kW4dE5GL
         4cIDkGnzjMOWhPDb7+65owWaa47Xxmn9XL+HE8Yh7CvJxOWKsicn1ViWpxFBRAmM6afn
         C4A6P8BtCvTV2qKms4AZztZ1ruFalyZ0JpSrQqKOX3G6gCo0j5izFoDbDV2gcl4igG9J
         qoHyPm/nRwaelbzuiW61pIus+rjpJcBku4wOi8ORO0pKx1pK3JS3pRywjB6Ca8crHVxH
         FqY3CMwE4gaEf6r5+PekFhkfyNQqlUOfo9ziml38HdJetVMAf1uvPh4dfCq65UThWQ9r
         iCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428168; x=1796032968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5fmRl7VLOuEYCBD7EtGXC6AhEnchrAVlkeohL5NfGk=;
        b=N+wE1LoA43Yu7jVmvxgX8MLYD555FJ8BzL1CUt1QMcS+NK4o6FLXYrIt3rM+7FcTTk
         i0xA2eW+fgdKq8ae8jfYp8qG6h2YMO2JdOhW7ebB6lDuHbf7kCHgToXe21WgagAlJXIa
         bacI7ozQpUC7BBScF2BG9lNPnlyf5nbZt1pjL7se4eZtoawXolQxPWEDrn46u+3Z/LaG
         dt2xK8SX2Pl1qoVhs9lkSJcFdE1QuMVCcf75/rpNaw0fSqoJ0JNMXGd0KYOA/End8dvL
         4o7Yp2wHadSqMW9XR0xtSIM0ewjaTT913kXIhcaSzLYthuUva8uc0ROMEQ3ts4dJaY9C
         GNVg==
X-Gm-Message-State: APuU4Z+Jkgg0oo3tx8Knyws0tjrY4KnveJkJqdy6j1IYbbLilwZPJ17n
	3kNiQtbdk+u+BOvPWr6Vlt2sbdIlHwON1KHJLfTP7NG9XbVFi6L7Hww+
X-Gm-Gg: AZFdTZcD5Q+H++lN7dixA0upcxCgT42z2ewBCEm3dzOJ0v81YuuLmQIYlOvqjXq7xqk
	L6zPbtcvxUK/n71VlkFEy6N85P0/FgvXGUxjL2k85QjMw8zoHQn1RWsZQCGZlAYZkOefRGD35c7
	p/naJayg2GWYVefGe/0kz6dhcBMM45YVTFFJlI9cK8bgsUpdPBZ1err5k/ijA/8/4t0lag/dBeq
	ufLgEMfbflas0+9j1rhlQJJA4GlWY52rwO9IbU6t/usZRcvKF0leD4nvQJCffdseUXkPHAvQS2F
	l2F5zSC8dKORe4/r74phL5PLTSdYCh9M2kSRvvMFOtE91LQrYBjELs0DchQ28Ff1jDkR5wZtt/g
	BunSc+MZpkC9o2zZzW6wjCHwF0RH8O9y0QxQCPxhfJGb/PgxPXc6C7V5tTbZPaAshwuFu2GlHy0
	cRxC94ZgfzmsZsgrWSSkdqaALPWu3SlnRHfk9kiHPDcAGloLJAvUOSnq+3qEY0Ghlrl0/fwdq02
	h45Iwf7+bK43EmldqE9fnQrqYBDCb8fHt6wjjPl/qaW/qSUP0Iiml12OnU6UlrmqB5K04d+Qub4
	+xW3K2QYu11kvWF4NcHDoiElCRVrzsS64crpgyBa+/mOoE3PGB/IEBlDPPmiBtKFOnqiu6rkADp
	b/UtxfDhLaA==
X-Received: by 2002:a17:906:397:b0:c41:26b8:c49d with SMTP id a640c23a62f3a-c513aab9965mr692564366b.38.1795428168018;
        Mon, 23 Nov 2026 02:02:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8dc60sm379265766b.34.2026.11.23.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:02:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: tegra: Add support for mono channel to Tegra20/Tegra30 I2S DAIs
Date: Mon, 23 Nov 2026 12:02:28 +0200
Message-ID: <20261123100228.77797-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

According to the TRM, both Tegra20 and Tegra30 I2S should be able to
support a mono channel for non-DSP formats, while the number of channels
for the DSP (FSYNC) format should remain restricted to a minimum of two
for Tegra30+.

Implement support for mono audio by adjusting the I2S clock and divider
calculation logic for both Tegra20 and Tegra30+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
I2S clock calculations were adjusted to match those found in downstream
sources for Tegra20 up to Tegra124. This change was tested on the LG
Optimus Vu (P895), and sound was consistent with both mono and dual
channels, with no distortion.
---
 sound/soc/tegra/tegra20_i2s.c | 21 ++++++++++++++++-----
 sound/soc/tegra/tegra30_i2s.c | 31 +++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 2978c9d6f4839..285923e6aeffa 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -144,7 +144,12 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, i2sclk_div, is_dsp;
+
+	is_dsp = regmap_test_bits(i2s->regmap, TEGRA20_I2S_CTRL,
+				  TEGRA20_I2S_CTRL_BIT_FORMAT_DSP);
+	if (is_dsp < 0)
+		return is_dsp;
 
 	mask = TEGRA20_I2S_CTRL_BIT_SIZE_MASK;
 	switch (params_format(params)) {
@@ -174,18 +179,24 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 	/* Final "* 2" required by Tegra hardware */
 	i2sclock = srate * params_channels(params) * sample_size * 2;
 
+	/* Additional "* 2" is needed for DSP mode */
+	if (is_dsp)
+		i2sclock *= 2;
+
 	ret = clk_set_rate(i2s->clk_i2s, i2sclock);
 	if (ret) {
 		dev_err(dev, "Can't set I2S clock rate: %d\n", ret);
 		return ret;
 	}
 
-	bitcnt = (i2sclock / (2 * srate)) - 1;
+	i2sclk_div = is_dsp ? srate : params_channels(params) * srate;
+
+	bitcnt = (i2sclock / i2sclk_div) - 1;
 	if (bitcnt < 0 || bitcnt > TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
 		return -EINVAL;
 	val = bitcnt << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
 
-	if (i2sclock % (2 * srate))
+	if (i2sclock % i2sclk_div)
 		val |= TEGRA20_I2S_TIMING_NON_SYM_ENABLE;
 
 	regmap_write(i2s->regmap, TEGRA20_I2S_TIMING, val);
@@ -330,14 +341,14 @@ static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
 	.playback = {
 		.stream_name = "Playback",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index e5e648d00621b..433a7eb873b43 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -137,10 +137,16 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, i2sclk_div, is_dsp;
 	struct tegra30_ahub_cif_conf cif_conf;
 
-	if (params_channels(params) != 2)
+	is_dsp = regmap_test_bits(i2s->regmap, TEGRA30_I2S_CTRL,
+				  TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC);
+	if (is_dsp < 0)
+		return is_dsp;
+
+	/* For DSP format min amount of channels is still two */
+	if (params_channels(params) != 2 && is_dsp)
 		return -EINVAL;
 
 	mask = TEGRA30_I2S_CTRL_BIT_SIZE_MASK;
@@ -157,10 +163,15 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 
-	/* Final "* 2" required by Tegra hardware */
-	i2sclock = srate * params_channels(params) * sample_size * 2;
+	i2sclock = srate * params_channels(params) * sample_size;
+
+	/* Additional "* 4" is needed for DSP mode */
+	if (is_dsp)
+		i2sclock *= 4;
+
+	i2sclk_div = is_dsp ? srate : params_channels(params) * srate;
 
-	bitcnt = (i2sclock / (2 * srate)) - 1;
+	bitcnt = (i2sclock / i2sclk_div) - 1;
 	if (bitcnt < 0 || bitcnt > TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
 		return -EINVAL;
 
@@ -172,14 +183,14 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	val = bitcnt << TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
 
-	if (i2sclock % (2 * srate))
+	if (i2sclock % i2sclk_div)
 		val |= TEGRA30_I2S_TIMING_NON_SYM_ENABLE;
 
 	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
 
 	cif_conf.threshold = 0;
-	cif_conf.audio_channels = 2;
-	cif_conf.client_channels = 2;
+	cif_conf.audio_channels = params_channels(params);
+	cif_conf.client_channels = params_channels(params);
 	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.expand = 0;
@@ -323,14 +334,14 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 	.playback = {
 		.stream_name = "Playback",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-- 
2.53.0

