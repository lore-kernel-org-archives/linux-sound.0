Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D333B14BF
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717797; cv=none; b=oWVAwYyIEUDEL+zMq+FcwDtdbhn/WoAN7sgjcPITDdfU+CiWDSg+UzVqrkw7USzMpIooz+U/2OWLfhFkRxK48rEX0C/dfhmwAVE5OHMtu7Jj4cN0U1iPKk3egA4Rf69manngDevmSMMAUj07nLCLmYT5b0oQl5KM3cuHShEAOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717797; c=relaxed/simple;
	bh=B280B5d4ZrqByaPY29NZv8op05nWwjy/iX6IvPafOwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jiYmuGHOLNt3/lHk9a5pmxiRaHS0btToV5oGcZWf3fa/mtmvPu4MQ0gZZVlutIieNWHEDHdDnVX9MA6T/9PldUihesck76bXduqXwf3r1QRrzygJFTbefuEVQRIJ/I/gFODIzKfjiqKuJP7Ntfm3cpkPkMBOF9dsCkF/bXfmE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i/5cC9wA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i/5cC9wA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493f75f7172so4887125e9.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717794; x=1784322594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ps4p5IybPBy32zLyRvRZQao81FR1W1ML5zodf2gwZ7A=;
        b=i/5cC9wAx5thUMbcQSOSHlRuNz//l6pS/f1Mq+oVYmnj7MXVPxJpY0gNgF384LyTar
         D/iFdo1PcbBRiet8QJ3Ysmw1WycyYiKFcLz9h5A1gpPR+uI7cyMuhlGG2BKB5N4vSo+o
         iSWWgD37iH1bl7/nrEQsGTvfbWlOEkZ0O/mRgiCcRUkyvO5/zU+O+yIC/mKflOwgohFY
         7a+tHQfFnMMqMGSOKOizCaOT8N/dQ/+tZ+YSSQzbuEtYYNoSWyM1LYKXT9ao4zVg3vHP
         zzzmde6WrnzHh0t2ogcwqiaeqYpybyTSIoUS4ml9TIoYBoXK8LmJ65Eijkw+GEKLt/kU
         +Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717794; x=1784322594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ps4p5IybPBy32zLyRvRZQao81FR1W1ML5zodf2gwZ7A=;
        b=npgqGapzKrgA4e48Ra8su2btm9EUS8PBJIWpdeXnDcTO1peVfiANBdRcIrxpHHPckd
         XppFCmYF9cSXPgV27TH6hu3lEGLr5ka3mrIlxmQzkF5ILoWip3v/7nrpgu+urzsL2C0w
         T3ORTiRcO/aybBU0dGpwPOB7l5+p5AStu8uTVct3kQekVaiqh9biNM986igyniyzkhuK
         zkoGxtuzO703C7cyGn4n3PE+rreFy+yB58MYEE6vvJnPW+zeC0DUb8KrqfryCyMBdN9S
         qrwdEIBFPezCQ3mS9EeJfBIU/TXBQabfJdYOHU3aa8eHCiGKskzcA9w/KSEC0fCninR1
         Cgvg==
X-Gm-Message-State: AOJu0YzGFdoiexN4pvA71xNQDZNi37VAmwSGhGupYAqoNy1IjinxHJ1M
	4j2syAdtD8JfzrunxgccfqEFaSB4tRiCQ75puaDPp04RaOy5Zo/juKCR/SU/sH8kxdI=
X-Gm-Gg: AfdE7ckPfiJ0TMpfdHsCiDV/SRz1F7ZTvIdlMHbVxo68l7O1K6AqUI7WooE/2M6tsiz
	eb7raAY3qPyvij6jzvAECs1HWAXDWYh+o8rC0Gs8jD3yfYo7+I8o5RG/zah9FyCF7lw4MDVikA0
	GQPs4euZ8Wz0rp8Gv8glZ40ywV95iv9OVH23sm0J7Oz7ypgDsEU57bhmSJic0OWR14kaaIskC57
	wHtI+tXc40DGJkzJk41g4TH0WjT5hj8XeBQh79fMOVpOuweF53AmnT4Tru9eTF0lBusHrk8NhaH
	s+bI4aNTInJx2gJVSZtRRbrQPZIAd9XEW1TqZMT40RbBibtipPsWMuKKR3l6mW3IgPa3C2ndMCx
	RUYOhrr91+VHq1HPzkAuc7QfJ+0+McvRBpwt+MQ9XVGqc4lddn3CMyAnj3jII3OHjAtavZ0imxu
	vgBhQOAit3OA==
X-Received: by 2002:a05:6000:481a:b0:472:fe1a:1ee9 with SMTP id ffacd0b85a97d-47f2dcb5afbmr430808f8f.20.1783717794169;
        Fri, 10 Jul 2026 14:09:54 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:53 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 10 Jul 2026 23:09:50 +0200
Subject: [PATCH 2/3] ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw
 constraints
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-aiu-improve-quirk-check-v1-2-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5327; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=B280B5d4ZrqByaPY29NZv8op05nWwjy/iX6IvPafOwY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fN4TkYKKXVy+ubGSOYxhHa33lzAKb/gseizPwry3
 jOvl7N0lLIwiHExyIopsrBMv/e7oFTtoXHCyQKYOaxMIEMYuDgFYCJrrBn+Z1ovncn1efe6hf95
 qpfqMc1mUPzZw2z38+TfXdNeL1b7b8/IcLu05LjCYXexkykJP6LtGvh+rdR9tP1Yy4zVLGVOEQ/
 V2AA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Currently the only check for bs-quirk is implemented in hw_params(), but
this is too late: nothing in the refined hw parameters hints at the
restriction, so userspace has no way to know the configuration is
invalid until the setup fails, as Jerome pointed out during review [1].

Add hw rules on CHANNELS and SAMPLE_BITS at startup() so that the
restriction shows up during parameter refinement instead. The rules
are refined against the committed configuration of the opposite
stream:

- if it uses the quirk, the current stream is narrowed to the same
  8ch/16-bit configuration;
- otherwise, selecting a 16-bit physical width limits the stream to
  2 channels, and selecting 8 channels requires a physical width
  larger than 16 bits.

The rules key on the physical width while the quirk is defined on the
significant bits. This is safe because S16_LE is the only format
supported by the encoder where both are 16 bits.

The check in aiu_encoder_i2s_set_clocks() is kept as the last backstop:
both streams may be refined concurrently before either commits its
configuration.

The rules are only registered on GX platforms where the bs-quirk exists
and only when the DAI has a stream in the opposite direction.

[1] https://lore.kernel.org/r/1jik7pebk7.fsf@starbuckisacylon.baylibre.com/

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index c2a280bfdfe2..4c62ea41d7e8 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -147,6 +147,13 @@ static int aiu_encoder_i2s_set_clocks(struct snd_pcm_substream *substream,
 	bs = fs / 64;
 
 	if (aiu->platform->has_clk_ctrl_more_i2s_div) {
+		/*
+		 * The hw rules added in startup() make this unreachable in the
+		 * sequential case, but both streams may be refined concurrently
+		 * before either commits its config, since only ops->hw_params
+		 * runs under the card's pcm_mutex. Re-check against the committed
+		 * state of the other stream, which is stable under that mutex.
+		 */
 		if (aiu_encoder_check_bs_quirk(substream, params, dai)) {
 			dev_err(dai->dev, "bclk requirements incompatible with other stream\n");
 			return -EINVAL;
@@ -333,10 +340,45 @@ static const struct snd_pcm_hw_constraint_list hw_channel_constraints = {
 	.mask = 0,
 };
 
+static int aiu_encoder_i2s_pcm_hw_rule(struct snd_pcm_hw_params *params,
+				       struct snd_pcm_hw_rule *rule)
+{
+	struct gx_stream *other = rule->private;
+	struct snd_interval *ch = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	/*
+	 * The quirk is technically based on the significant bits whereas here
+	 * we're using the physical width for simplicity. This works because
+	 * S16_LE is the only format supported by this encoder that has:
+	 * significant bits = physical width = 16-bits
+	 */
+	struct snd_interval *phys_width = hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
+	struct snd_interval new_i;
+
+	if (other->channels == 0)
+		return 0;
+
+	snd_interval_any(&new_i);
+
+	if (rule->var == SNDRV_PCM_HW_PARAM_CHANNELS) {
+		if (aiu_encoder_is_bs_quirk(other->channels, other->width))
+			new_i.min = new_i.max = 8;
+		else if (snd_interval_single(phys_width) && phys_width->min == 16)
+			new_i.max = 2; /* Force 2ch */
+	} else { /* SNDRV_PCM_HW_PARAM_SAMPLE_BITS */
+		if (aiu_encoder_is_bs_quirk(other->channels, other->width))
+			new_i.min = new_i.max = 16;
+		else if (snd_interval_single(ch) && ch->min == 8)
+			new_i.min = 17; /* Request physical width > 16 bits */
+	}
+
+	return snd_interval_refine(hw_param_interval(params, rule->var), &new_i);
+}
+
 static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_stream *other_stream = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	int ret;
 
 	/* Make sure the encoder gets either 2 or 8 channels */
@@ -348,6 +390,31 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/*
+	 * If DAI supports both playback and capture streams ensure the bs-quirk is
+	 * handled correctly.
+	 * This is only valid for GX platforms (has_clk_ctrl_more_i2s_div=true).
+	 */
+	if (aiu->platform->has_clk_ctrl_more_i2s_div && other_stream) {
+		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  aiu_encoder_i2s_pcm_hw_rule,
+					  other_stream,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
+		if (ret)
+			return ret;
+
+		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+					  aiu_encoder_i2s_pcm_hw_rule,
+					  other_stream,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Enable only clocks which are required for the interface internal
 	 * logic. MCLK is enabled/disabled from the formatter and the I2S

-- 
2.47.3

