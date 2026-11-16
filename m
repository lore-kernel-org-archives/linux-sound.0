Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866627;
	b=T4xRL9bBMYvKOuiwnaAdrOwYoCc6P4o+zBFEWBARSyo4Kan4BB6MaVa5PBXgX0JiVtG+
	 OoLxAmY2VqN1Z8VxDEJ6eNbvIWuFlSHsT/NsjIO0nG4xHFFpl9f1mJyGIUFVxDfn6WQQy
	 64fjQuydh8oQlU6SQLL9YCiRtNIexzETHcSdPWkeXOc4kYUcSPDftxVD+xraT0GRopDXy
	 ShcgNT824W3KFA4UsX/Dy0TYYQ5T+CugvppbH9mMOJYdJL6l8XXXyqxXuEfzezxQEo6/X
	 VXsLf6DwW9MuahvzGuL07ErKMtnR+7p00g/Mko23EY+Elpxqn+z/wT8TIcImaqfcdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866627;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=PizgZNC5pZ1OdAP1T1MlqaKvfqVNkGdpygwkEwMjJh8=;
	b=2a2W6hnhEPVnbzSa7T5UeFwEbfJ1cXlA4y6lOdTOE6gq8zrcrAbOH3jVxHZ3jLTOJhqW
	 e3+CnGTfx0HphFSr3VwdbP94vSmUOwbxSpV7kBt87DAgJ6CeMXfrBkjoW6WUqoYXD3XZh
	 KOfPwIaMs56IBZvXkCW9ZRao5CRfpDMf3jZC9spDgaJB7BFB7ziWbP/dOxJP+3u3WCEqF
	 eoj9VG2kMCQKosioO3yTQzhoUwq2QBCfaMjBpc4O9GKTnO8Rhd4M/X7FsrIDYTgtc/Ya0
	 Bihe/LjCS9mVdQtvMchEyoa7e443Dc1ATkrg/Apkzs1r6dbjWTpG+Q5DlEm6sP/TauA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C7A606A88D
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 22:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C7A606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67da3d03263so1957684d50.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 14:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866626; x=1795471426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PizgZNC5pZ1OdAP1T1MlqaKvfqVNkGdpygwkEwMjJh8=;
        b=pwg7kFTLSdG1AE59Zh7ddO8VCl6B8/+BrcwaoQBjpVkNSKB8aJN3qhl5zzGXpwiULS
         LJiBvMl7xvILIwPWhdUUXmXjPdlf4DyPo8KE7jHxsaF3hQeY/Kps7D9slLEhT3sYmV9q
         kDzLoYLZNxcT9o81I5xlVvvLS/fGObMO/s0pM9/6rGudlcbEzLQlJyPsXRA+Wwe09Dsl
         h0vk+xgNT7lfcKusLOU8/iIomiRTDXIzjJO+bnWrlKfcVHwQi3kEb6hfiFjtQezO1l5C
         4dNlZrBmdVRj3FEdIHPWjSMtNoGscXkjzcE59FE38ODVwxx6SPG+s9XW8GKWBbmP3fHb
         HGig==
X-Gm-Message-State: APuU4Z/g82xuuG5aMVqXCeGSQkivWuHvEUDOfSdaT5oAPrXT+4H61+fo
	T4OOxwKoGAho38F6XTPx0oLuFP5od4Zz0ntVLT6l34KJfa8n3l189ZzO
X-Gm-Gg: AZFdTZeOmCJZ5OKFXcZMKOxm9WQ5ZCJpYG21fBYyoS30/YTW9Eqr+oPxE8nR6Pv8Cyu
	Jc25T7NI6jBWfQL1WzCD8WrV2Xuh0wsdHBTl+vfAyCzhVd2vAzoi6/RBtOCRZrzu2RRKK5iUYhp
	b/Gbj5o3tJ8oYj9oQbFSZlDq/f8/OXvLMR+P3xjPchJ3SmIr8wb337U/yZVwhhKgoIKltV69Irr
	NpiaSGILxwdsriPPFcvLQx5gnYQhzBvD+FVH7ajPva9jyU8NOsQJTKLflyrjbFmiTTWZ4yu0Erz
	Zt2V425iUBNnukYz12MOQWrQ1XDuqXld68aNAAGCJNqNdt/NX0A5nRvevGg5WxeKU6CQpgNdkA9
	Nx8txfxJ7lyG5SOWRn6EbpW+fA15IkMLbv4i46E3J+tYqSiEDaVYTG8QWSetQNCLOnSPlqTo6C6
	goKjtolM/1Z5HkbE8VHUS8Hd7iO+TidtnxxfLtT3GbKDg3xJqvmLKI0yiiIXo0zd0O6zlhwzGr2
	4CSp7eWVNiV7DaLnU1kF4mJBtnE1cTDKBM0b1XfBiKfljmFtEZnOdz0CeRoPfT8LcWmTCBEfLcF
	LN6Wsj3OYnVz39sWKTOfPxdN5Hr63Qu3oya/uvvjzKMSEKfQBV+E75ws2qRbZDrLGgC22N1Tc5B
	CVWWK80iJh7VUgMac6YtC/o2aCm7jQ50qkB0=
X-Received: by 2002:a05:690e:1385:b0:67c:2462:b3c6 with SMTP id 956f58d0204a3-67d8972ec50mr6498893d50.101.1794866625778;
        Mon, 16 Nov 2026 14:03:45 -0800 (PST)
Received: from josephs-mac-mini.local ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm11133078d50.21.2026.11.16.14.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:03:45 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:03:22 -0500
Subject: [PATCH 2/2] ASoC: ti: omap-mcbsp: Implement set_tdm_slot
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-omap-mcbsp-tdm-slot-v1-2-6c9f7aa45a29@telaak.dev>
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
In-Reply-To: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

As bit clock and frame provider, McBSP sizes the frame from the SRG
input, the set_clkdiv() divider and the rate. Only a machine driver can
call set_clkdiv(), so with simple-audio-card or audio-graph-card the
divider stays 1 and the bit clock runs at the full SRG input: 96 MHz on
OMAP3, a 2000-bit frame at 48 kHz.

Implement set_tdm_slot() so these cards can ask for a frame of slots x
slot_width bit clocks with dai-tdm-slot-num and dai-tdm-slot-width.
hw_params() then picks the divider for the rate, and startup() offers
only the rates the SRG input divides to within 0.1%, the IEC 60958 level
II clock tolerance. McBSP sends a frame's words back to back, so
startup() also limits the sample width to the slot width and the
channels to the active slots, which must be the low ones, and refuses
I2S or left-justified with other than two slots. This applies only when
McBSP provides both clocks; without slots nothing changes.

Tested on an OMAP3630 board whose McBSP4 drives the I2S input of an
ADV7513 with no MCLK, with 2 x 32-bit slots and adv7511 taking S32_LE:
a left-only and a right-only 44.1 kHz tone each play at full level
(96 MHz / 34 gives 44117.6 Hz), 48 kHz (0.8% off) and S16_LE are
refused.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 sound/soc/ti/omap-mcbsp-priv.h |   4 ++
 sound/soc/ti/omap-mcbsp.c      | 155 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index 324c5d7d431d..7bd5a3f13a37 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -275,6 +275,10 @@ struct omap_mcbsp {
 	unsigned int latency[2];
 	int clk_div;
 	int wlen;
+	unsigned int slots;
+	unsigned int slot_width;
+	unsigned int tx_slots;
+	unsigned int rx_slots;
 
 	struct pm_qos_request pm_qos_req;
 };
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 6e0c7d7359f4..64d034f139a8 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -759,12 +759,117 @@ static int omap_mcbsp_hwrule_min_buffersize(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(buffer_size, &frames);
 }
 
+static const unsigned int omap_mcbsp_slot_rates[] = {
+	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200, 96000,
+};
+
+/*
+ * The SRG divider that runs a frame of slots x slot_width bit clocks at
+ * @rate, or 0 if none gets within 0.1% (IEC 60958 level II).
+ */
+static unsigned int omap_mcbsp_slot_div(struct omap_mcbsp *mcbsp,
+					unsigned int rate)
+{
+	unsigned int bclk = rate * mcbsp->slots * mcbsp->slot_width;
+	unsigned int div;
+
+	if (!bclk || !mcbsp->in_freq)
+		return 0;
+
+	div = DIV_ROUND_CLOSEST(mcbsp->in_freq, bclk);
+	if (!div || div > 256)
+		return 0;
+	if (abs_diff(mcbsp->in_freq / div, bclk) > bclk / 1000)
+		return 0;
+
+	return div;
+}
+
+static unsigned int omap_mcbsp_slot_rate_list(struct omap_mcbsp *mcbsp,
+					      unsigned int *list)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < ARRAY_SIZE(omap_mcbsp_slot_rates); i++)
+		if (omap_mcbsp_slot_div(mcbsp, omap_mcbsp_slot_rates[i]))
+			list[n++] = omap_mcbsp_slot_rates[i];
+
+	return n;
+}
+
+/* Computed on each refine, so nothing is shared between the streams */
+static int omap_mcbsp_hwrule_slot_rate(struct snd_pcm_hw_params *params,
+				       struct snd_pcm_hw_rule *rule)
+{
+	unsigned int list[ARRAY_SIZE(omap_mcbsp_slot_rates)];
+	unsigned int n = omap_mcbsp_slot_rate_list(rule->private, list);
+
+	return snd_interval_list(hw_param_interval(params, rule->var), n,
+				 list, 0);
+}
+
+/*
+ * With TDM slots the frame is slots x slot_width bit clocks. McBSP sends its
+ * words back to back, so a sample must fill its slot, channels go to the
+ * first slots, and I2S/left-justified (one word per phase) need two slots.
+ */
+static int omap_mcbsp_slot_constraints(struct snd_pcm_substream *substream,
+				       struct omap_mcbsp *mcbsp)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int format = mcbsp->fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned int list[ARRAY_SIZE(omap_mcbsp_slot_rates)];
+	unsigned int active = tx ? mcbsp->tx_slots : mcbsp->rx_slots;
+	int ret;
+
+	if ((format == SND_SOC_DAIFMT_I2S || format == SND_SOC_DAIFMT_LEFT_J) &&
+	    mcbsp->slots != 2) {
+		dev_err(mcbsp->dev, "I2S/LEFT_J needs 2 slots, not %u\n",
+			mcbsp->slots);
+		return -EINVAL;
+	}
+	if (!active) {
+		dev_err(mcbsp->dev, "no %s slots in the TDM mask\n",
+			tx ? "TX" : "RX");
+		return -EINVAL;
+	}
+	if (!omap_mcbsp_slot_rate_list(mcbsp, list)) {
+		dev_err(mcbsp->dev, "no rate for %u x %u-bit slots from %u Hz\n",
+			mcbsp->slots, mcbsp->slot_width, mcbsp->in_freq);
+		return -EINVAL;
+	}
+
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, active);
+	if (ret < 0)
+		return ret;
+	ret = snd_pcm_hw_constraint_single(runtime,
+					   SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+					   mcbsp->slot_width);
+	if (ret < 0)
+		return ret;
+
+	/* Rates follow the current in_freq and slots */
+	return snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   omap_mcbsp_hwrule_slot_rate, mcbsp,
+				   SNDRV_PCM_HW_PARAM_RATE, -1);
+}
+
 static int omap_mcbsp_dai_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *cpu_dai)
 {
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	int err = 0;
 
+	if (mcbsp->slot_width &&
+	    (mcbsp->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+	    SND_SOC_DAIFMT_BP_FP) {
+		err = omap_mcbsp_slot_constraints(substream, mcbsp);
+		if (err)
+			return err;
+	}
+
 	if (!snd_soc_dai_active(cpu_dai))
 		err = omap_mcbsp_request(mcbsp);
 
@@ -1020,7 +1125,15 @@ static int omap_mcbsp_dai_hw_params(struct snd_pcm_substream *substream,
 	/* In McBSP master modes, FRAME (i.e. sample rate) is generated
 	 * by _counting_ BCLKs. Calculate frame size in BCLKs */
 	master = mcbsp->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
-	if (master == SND_SOC_DAIFMT_BP_FP) {
+	if (master == SND_SOC_DAIFMT_BP_FP && mcbsp->slot_width) {
+		/* startup() limited channels, width and rate to the slots */
+		div = omap_mcbsp_slot_div(mcbsp, params_rate(params));
+		if (!div)
+			return -EINVAL;
+		regs->srgr1	&= ~CLKGDV(0xff);
+		regs->srgr1	|= CLKGDV(div - 1);
+		framesize = mcbsp->slots * mcbsp->slot_width;
+	} else if (master == SND_SOC_DAIFMT_BP_FP) {
 		div = mcbsp->clk_div ? mcbsp->clk_div : 1;
 		framesize = (mcbsp->in_freq / div) / params_rate(params);
 
@@ -1184,6 +1297,45 @@ static int omap_mcbsp_dai_set_clkdiv(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
+/*
+ * With slots set, McBSP as bit clock and frame provider runs a frame of
+ * slots x slot_width bit clocks and picks the divider per rate instead of
+ * using set_clkdiv(). It sends a frame's words in order, so only masks of
+ * the low slots work.
+ */
+static int omap_mcbsp_dai_set_tdm_slot(struct snd_soc_dai *cpu_dai,
+				       unsigned int tx_mask,
+				       unsigned int rx_mask,
+				       int slots, int slot_width)
+{
+	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int max_width = mcbsp->pdata->reg_size == 2 ? 16 : 32;
+
+	if (mcbsp->active)
+		return -EBUSY;
+
+	if (!slots) {
+		mcbsp->slots = 0;
+		mcbsp->slot_width = 0;
+		return 0;
+	}
+
+	if (slots < 0 || slots > 16 ||
+	    (slot_width != 16 && slot_width != max_width))
+		return -EINVAL;
+	/* Masks must be contiguous from slot 0 */
+	if ((tx_mask & ~GENMASK(slots - 1, 0)) || (tx_mask & (tx_mask + 1)) ||
+	    (rx_mask & ~GENMASK(slots - 1, 0)) || (rx_mask & (rx_mask + 1)))
+		return -EINVAL;
+
+	mcbsp->slots = slots;
+	mcbsp->slot_width = slot_width;
+	mcbsp->tx_slots = hweight32(tx_mask);
+	mcbsp->rx_slots = hweight32(rx_mask);
+
+	return 0;
+}
+
 static int omap_mcbsp_dai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 					 int clk_id, unsigned int freq,
 					 int dir)
@@ -1291,6 +1443,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
 	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
 	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
+	.set_tdm_slot	= omap_mcbsp_dai_set_tdm_slot,
 	.auto_selectable_formats	= &mcbsp_mcbsp_selectable_formats,
 	.num_auto_selectable_formats	= 1,
 };

-- 
Git-155)

