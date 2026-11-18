Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994262;
	b=vYF7VqTanw8dfIO1kR6b4yYvLqaQfQtutsvF9LSaEtbSMcZ8LqP3cTW37iTAL4PlsV6x
	 ZYHMAoqmZcvl95og0o07siu1pIPD+MwVz73Q1KXjsN5gV1yBUk1elBGdpw7YtiLc1VI2v
	 ZwvmXq6QhRuQfP05vG6qik5YEvaErcLC/74FMAOEh6A7lrkGTLN2bqvOVvpAhGN1gYBSP
	 1prhKkpXSHS4Sr2BBCBPyfeer/BFghB8q5Ud2qQPzv7UUoNCdhzT6awzRynjcw6LYZBL4
	 7OTFNk0R8iVz2CtnXCCCFo2J+yKiFCf0V6T1/pFteJJ/atS8XqQ2U1BY8LP+ruulw9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bI2RRovxJcOrXgC3oVMnN7iaY5TwUxaUYOpjqqlwuCI=;
	b=ice4l1TB0l4p5pCEiI9U2tIBEp7SNA/tLTujY4ZQ/EHbkGVaQR8zfA3Nd52kjqeg1HSO
	 p6jb8G/7jU9SjFeptFwrUP5727oVAIjM6FDQKIWq4Ngc6i3wgrzVtq+rpQ4xv9rwSi2Un
	 lHdTyMamJK1RvtRAiHJA5UwsASgRCBMtV9jXbz62+t/5aFYaQz2eVFV95GnpvyxqYJIKW
	 zfrhEOFkC9uw0Bujxy618AWsyMZQuBVYNA1e2BapKphAG71Y9mwX8CNf8h4J7+CsMM1G3
	 pYA/rXNPHdlIdYss4X/tdLb8uDRvy24lg6XUnEdjqW4VaQN+PSb6kdOmYTyEzs5BQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6Daqbxk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB4606A320;
	Wed, 18 Nov 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6Daqbxk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728961F000C4;
	Wed, 18 Nov 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994262;
	bh=bI2RRovxJcOrXgC3oVMnN7iaY5TwUxaUYOpjqqlwuCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P6DaqbxkHUilaSeZJFDtZkGI2Tli1g69HtIg3M1sWfIFgiXvb84agXKAp9U0TvFby
	 B+timVtYZn0xEQnyEJs9CRj5427Uw2QoFzpTsCfOBHnYC+fRlPM1BVnEonVY5s9m79
	 TNghzT196gvVjRkx7rvjPx8wY5YWSPaoTm5gYkvRSf6KLhtSQNeMFwZOmr6zwc0LFM
	 BimzRZOtowljztb9sfRsPVYCoHO3eSGcuKmAsn9dD0KVXCktv0docesQ2BYFSRXCsF
	 LDJ1vZHfXAnVzB/VcI2ih5bDvxrJGNhfMjx0y28/Y4FVWU5vvMvad87npG6zjLKdhu
	 Tv3SdVu08Zb8w==
Message-ID: <sashiko-outbox-220574@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118084214.527804-3-YLCHANG2@nuvoton.com>
References: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
 <20261118084214.527804-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:31:01 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential
issues to consider:
- [High] ASoC: nau8310: UAF and uncancelled work in
  nau8310_load_fw_work()
- [Medium] ASoC: nau8310: wrong property name for dac-vref in
  nau8310_read_device_properties()
- [Medium] ASoC: nau8310: broken 64k/96k clock calc in
  nau8310_calc_dsp_clk() and rate mask
- [Medium] ASoC: nau8310: Sense DAPM pin disabled for capture and bypass
  ALC paths
- [Medium] ASoC: nau8310: clock clobbering and unawaited load_fw_work in
  nau8310_resume()
- [Medium] ASoC: nau8310: TOCTOU race and unawaited work in
  nau8310_dsp_snd_soc_dapm_put()
- [Medium] ASoC: nau8310: unlocked error rollback in
  nau8310_load_fw_work()
- [Medium] ASoC: nau8310: unchecked regmap_read() in
  nau8310_biq_coeff_get()
- [Medium] ASoC: nau8310: unsynchronized clock_detection state in
  nau8310_clkdet_put()
- [Low] ASoC: nau8310: missing driver_data in nau8310_acpi_match[]
  causes false warning
- [Low] ASoC: nau8310: missing driver_data in nau8310_acpi_match table
- [Low] ASoC: nau8310: nau8310_hw_params() hardcodes -EINVAL on clock
  config error
--

commit b3b2391f6b106bacb0bf900f5edbb9a0df857b51
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8310: Add support for NAU83G10 amplifier

This commit adds ASoC codec and DSP support for the Nuvoton NAU83G10 and
NAU83G20 mono Class-D audio amplifiers.

> diff --git a/sound/soc/codecs/nau8310-dsp.c b/sound/soc/codecs/nau8310-ds=
p.c
> new file mode 100644
> index 0000000000000..7b4c95c618622
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310-dsp.c

[ ... ]

> +static int nau8310_dsp_snd_soc_dapm_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =3D
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int mask =3D (1 << fls(mc->max)) - 1;
> +	unsigned int val;
> +
> +	snd_soc_dapm_mutex_lock(dapm);
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_warn_ratelimited(nau8310->dev, "changing path is not allowed durin=
g playback");
> +		snd_soc_dapm_mutex_unlock(dapm);
> +		return -EBUSY;
> +	}
> +
> +	val =3D (ucontrol->value.integer.value[0] & mask);
> +
> +	if (val =3D=3D NAU8310_DAC_SRC_DSP && !nau8310->load_fw_done) {
> +		dev_warn_ratelimited(nau8310->dev, "Cannot enable DSP: Firmware not re=
ady or disabled");
> +		snd_soc_dapm_mutex_unlock(dapm);
> +		return -EBUSY;
> +	}
> +	snd_soc_dapm_mutex_unlock(dapm);
> +
> +	mutex_lock(&nau8310->lock);
> +	regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
> +		NAU8310_DSP_SEL_OSC, val =3D=3D NAU8310_DAC_SRC_DSP ? NAU8310_DSP_SEL_=
OSC : 0);
> +	mutex_unlock(&nau8310->lock);
> +
> +	return snd_soc_dapm_put_volsw(kcontrol, ucontrol);
> +}

[Severity: Medium]
Can dropping the DAPM mutex before updating NAU8310_DSP_SEL_OSC and
calling snd_soc_dapm_put_volsw() allow the DSP path and clock source to
be changed during active playback?

CPU0                                      CPU1
nau8310_dsp_snd_soc_dapm_put()
  snd_soc_dapm_mutex_lock(dapm)
  bias_level <=3D SND_SOC_BIAS_STANDBY
  snd_soc_dapm_mutex_unlock(dapm)
                                          snd_pcm_prepare()
                                            ...
                                            nau8310_clock_event()
                                              clear NAU8310_DSP_SEL_OSC
  mutex_lock(&nau8310->lock)
  set NAU8310_DSP_SEL_OSC
  mutex_unlock(&nau8310->lock)
  snd_soc_dapm_put_volsw()                <-- changes path during playback

Also, this function does not flush nau8310->load_fw_work before clearing
NAU8310_DSP_SEL_OSC when switching to bypass mode, which switches the DSP
clock away from the internal oscillator while firmware loading is still
queued.  Because nau8310_startup() checks nau8310_dsp_active() at
snd_pcm_open() time while bias_level is still SND_SOC_BIAS_STANDBY,
toggling this switch while a playback substream is open also leaves
nau8310_startup() and nau8310_shutdown() out of sync on the Sense pin.

[ ... ]

> diff --git a/sound/soc/codecs/nau8310.c b/sound/soc/codecs/nau8310.c
> new file mode 100644
> index 0000000000000..257b538f6b145
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310.c

[ ... ]

> +static int nau8310_clkdet_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =3D
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap =3D nau8310->regmap;
> +	unsigned int max =3D mc->max, min =3D mc->min, val;
> +	unsigned int mask =3D (1 << fls(max)) - 1;
> +
> +	val =3D ((ucontrol->value.integer.value[0] + min) & mask);
> +
> +	if (nau8310->clock_detection =3D=3D val)
> +		return 0;
> +
> +	nau8310->clock_detection =3D val;
> +
> +	if (nau8310->clock_detection)
> +		regmap_update_bits(regmap, NAU8310_R40_CLK_DET_CTRL,
> +			NAU8310_CLKPWRUP_DIS, 0);
> +	else
> +		regmap_update_bits(regmap, NAU8310_R40_CLK_DET_CTRL,
> +			NAU8310_CLKPWRUP_DIS, NAU8310_CLKPWRUP_DIS);
> +
> +	return 1;
> +}

[Severity: Medium]
What happens to NAU8310_PWRUP_DFT if the Clock Detection Switch is
toggled while the PowerUp DAPM widget is active?

In nau8310_powerup_event(), NAU8310_PWRUP_DFT is set on power-up and
cleared on power-down only when nau8310->clock_detection is 0.  If
clock_detection is changed from 0 to 1 during playback, NAU8310_PWRUP_DFT
stays set when playback stops because nau8310_powerup_event() returns
early, preventing the amplifier from powering down; changing it from 1 to
0 during playback sets NAU8310_CLKPWRUP_DIS while NAU8310_PWRUP_DFT is 0,
shutting down the amplifier mid-stream.

[ ... ]

> +static int nau8310_biq_coeff_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	int i, reg_val;
> +	__be16 *val =3D (__be16 *)ucontrol->value.bytes.data;
> +
> +	for (i =3D 0; i < params->max / sizeof(u16); i++) {
> +		regmap_read(nau8310->regmap, NAU8310_R80_BIQ0_COE_1 + i, &reg_val);
> +		/*
> +		 * conversion of 16-bit integers between native CPU format
> +		 * and big endian format
> +		 */
> +		*(val + i) =3D cpu_to_be16(reg_val);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can nau8310_biq_coeff_get() copy uninitialized stack memory to userspace
if regmap_read() fails?  reg_val is not initialized and the return value
of regmap_read() is not checked before writing cpu_to_be16(reg_val) into
ucontrol->value.bytes.data.

[ ... ]

> +static int nau8310_clock_apply(struct nau8310 *nau8310,
> +	const struct nau8310_srate_attr *srate_table,
> +	int n1_sel, int mclk_mult_sel, int n2_sel, int dsp_mult_sel)
> +{
> +	struct regmap *regmap =3D nau8310->regmap;
> +	int mult_sel;
> +	unsigned int ctrl_val =3D 0;
> +
> +	static const unsigned int mclkx_val[] =3D {
> +		/* multiplier 4x, i.e. 2^2 */
> +		[2] =3D NAU8310_MCLK4XEN,
> +		/* multiplier 8x, i.e. 2^3 */
> +		[3] =3D NAU8310_MCLK8XEN | NAU8310_MCLK4XEN,
> +		/* multiplier 16x, i.e. 2^4 */
> +		[4] =3D NAU8310_MCLK16XEN | NAU8310_MCLK8XEN | NAU8310_MCLK4XEN,
> +	};
> +
> +	if (dsp_mult_sel < 0 || dsp_mult_sel >=3D ARRAY_SIZE(dsp_src_mult) ||
> +		n2_sel < 0 || n2_sel >=3D ARRAY_SIZE(mclk_n2_div) ||
> +		n1_sel < 0 || n1_sel >=3D ARRAY_SIZE(mclk_n1_div)) {
> +		dev_err(nau8310->dev, "The fs %d isn't support in DSP.", srate_table->=
fs);
> +		return -EINVAL;
> +	}
> +
> +	if (mclk_mult_sel !=3D CLK_PROC_BYPASS) {
> +		ctrl_val |=3D mclk_src_mult[mclk_mult_sel].val << NAU8310_MCLK_SEL_SFT;
> +		mult_sel =3D (mclk_mult_sel > dsp_mult_sel ? mclk_mult_sel : dsp_mult_=
sel);
> +	} else
> +		mult_sel =3D dsp_mult_sel;
> +
> +	if (mult_sel < 2 || mult_sel > 4)
> +		return -EINVAL;
> +
> +	if (srate_table->adc_div >=3D 0) {
> +		regmap_update_bits(regmap, NAU8310_R03_CLK_CTRL,
> +			NAU8310_CLK_ADC_DIV2 | NAU8310_CLK_ADC_DIV4,
> +			srate_table->adc_div << NAU8310_CLK_ADC_DIV4_SFT);
> +	}
> +
> +	regmap_update_bits(regmap, NAU8310_R40_CLK_DET_CTRL,
> +		NAU8310_SRATE_MASK | NAU8310_DIV_MAX | NAU8310_ALT_SRATE_EN,
> +		(srate_table->range << NAU8310_SRATE_SFT) |
> +		(srate_table->max ? NAU8310_DIV_MAX : 0) |
> +		(srate_table->fs =3D=3D 44100 ? NAU8310_ALT_SRATE_EN : 0));
> +
> +	regmap_update_bits(regmap, NAU8310_R03_CLK_CTRL,
> +		NAU8310_MCLK_SRC_MASK, mclk_n2_div[n2_sel].val);
> +
> +	ctrl_val |=3D (dsp_src_mult[dsp_mult_sel].val << NAU8310_CLK_DSP_SRC_SF=
T) |
> +		(mclk_n1_div[n1_sel].val << NAU8310_CLK_MUL_SRC_SFT);
> +	regmap_update_bits(regmap, NAU8310_R04_ENA_CTRL,
> +		NAU8310_CLK_DSP_SRC_MASK | NAU8310_CLK_MUL_SRC_MASK |
> +		NAU8310_MCLK_SEL_MASK, ctrl_val);
> +
> +	regmap_update_bits(regmap, NAU8310_R68_ANALOG_CONTROL_7,
> +		NAU8310_MCLKX_MASK, mclkx_val[mult_sel]);
> +
> +	return 0;
> +}
> +
> +static int nau8310_calc_dsp_clk(int mclk, int fs, int mult_param, int n1=
_param)
> +{
> +	int dsp_clk =3D (mclk << mult_param) / n1_param;
> +
> +	if (dsp_clk >=3D (fs * DSP_CLK_MIN_MULTI_VALUE) && dsp_clk <=3D DSP_CLK=
_MAX)
> +		return dsp_clk;
> +
> +	return 0;
> +}

[Severity: Medium]
Can nau8310_calc_dsp_clk() ever succeed for 64 kHz or 96 kHz sample
rates?

With DSP_CLK_MIN_MULTI_VALUE =3D 2000 and DSP_CLK_MAX =3D 102400000,
fs * DSP_CLK_MIN_MULTI_VALUE is 128000000 for 64 kHz and 192000000 for
96 kHz, both exceeding DSP_CLK_MAX.  Because nau8310_clock_process()
unconditionally calls nau8310_clkdsp_choose() even when the DSP is
bypassed, nau8310_hw_params() always fails with -EINVAL at 64 kHz and
96 kHz.

In addition, target_srate_table[] sets adc_div =3D -1 for 96 kHz, which
causes nau8310_clock_apply() to leave stale NAU8310_CLK_ADC_DIV2 and
NAU8310_CLK_ADC_DIV4 bits in NAU8310_R03_CLK_CTRL from the previous rate.
In nau8310_clock_apply(), the check if (mult_sel < 2 || mult_sel > 4)
also rejects the 1x (mult_sel =3D=3D 0) and 2x (mult_sel =3D=3D 1) multipli=
ers
defined in dsp_src_mult[] and mclk_src_mult[] that nau8310_clkdsp_choose()
can select.  Finally, NAU8310_RATES is defined as
SNDRV_PCM_RATE_8000_96000, which advertises unsupported 11025, 22050, and
88200 Hz rates (failing in target_srate_attribute()) while omitting the
supported 12000 and 24000 Hz rates in target_srate_table[].

[ ... ]

> +static int nau8310_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *cp =3D dai->component;
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	unsigned int val_len =3D 0;
> +	int fs, ret;
> +
> +	fs =3D params_rate(params);
> +	if (nau8310_dsp_active(cp) && fs !=3D NAU8310_DEFAULT_FS) {
> +		dev_err(nau8310->dev,
> +			"For ROM Code revision 00, DSP only run at 48kHz.");
> +		return -EINVAL;
> +	}
> +	ret =3D nau8310_clock_config(nau8310, fs, nau8310->mclk);
> +	if (ret)
> +		return -EINVAL;

[Severity: Low]
As reported by Mark Brown on v2 [1], should this return ret directly
instead of hardcoding -EINVAL when nau8310_clock_config() fails?

[ ... ]

> +static int nau8310_startup(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *cp =3D dai->component;
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +
> +	flush_work(&nau8310->load_fw_work);
> +
> +	if (nau8310_dsp_active(cp) && !nau8310->load_fw_done) {
> +		dev_warn(nau8310->dev, "DSP firmware is not ready yet!");
> +		return -EBUSY;
> +	}
> +
> +	if (nau8310_dsp_active(cp) && substream->stream =3D=3D SNDRV_PCM_STREAM=
_PLAYBACK)
> +		snd_soc_dapm_enable_pin(nau8310->dapm, "Sense");
> +
> +	return 0;
> +}
> +
> +static void nau8310_shutdown(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *cp =3D dai->component;
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +
> +	if (nau8310_dsp_active(cp) && substream->stream =3D=3D SNDRV_PCM_STREAM=
_PLAYBACK) {
> +		snd_soc_dapm_disable_pin(nau8310->dapm, "Sense");
> +		snd_soc_dapm_sync(nau8310->dapm);
> +	}
> +}

[Severity: Medium]
Does keeping the Sense pin disabled unless a DSP playback stream is
started prevent standalone capture and DSP-bypass ALC from powering up?

nau8310_codec_probe() disables the Sense pin by default, and in
nau8310_dapm_routes[] Sense is the sole upstream source endpoint for SAR,
ADC_I, and ADC_V feeding Capture Sense -> ADC_OUT and "ALC gain selection
mode".  Starting a capture stream without concurrent DSP playback (or
enabling "ALC gain selection mode" in DSP bypass mode) leaves Sense
disabled, so DAPM never powers up the ADCs or enables
NAU8310_I2S_ADCDAT_OE_EN.  Conversely, closing a DSP playback stream in
nau8310_shutdown() unconditionally disables Sense and syncs DAPM, tearing
down an active capture stream mid-recording.

[ ... ]

> +static void nau8310_load_fw_work(struct work_struct *work)
> +{
> +	struct nau8310 *nau8310 =3D container_of(work, struct nau8310, load_fw_=
work);
> +	struct regmap *regmap =3D nau8310->regmap;
> +	struct snd_soc_component *cp =3D snd_soc_dapm_to_component(nau8310->dap=
m);
> +	int ret;
> +
> +	mutex_lock(&nau8310->lock);
> +	ret =3D nau8310_dsp_init(cp);
> +	mutex_unlock(&nau8310->lock);
> +	if (ret) {
> +		dev_err(nau8310->dev, "Failed to initialize DSP: %d", ret);
> +		goto err;
> +	}
> +
> +	return;
> +
> +err:
> +
> +	regmap_update_bits(regmap,
> +		NAU8310_R1A_DSP_CORE_CTRL2, NAU8310_DSP_RUNSTALL, NAU8310_DSP_RUNSTALL=
);
> +
> +	/* Switch the clock source of DSP to MCLK. */
> +	regmap_update_bits(regmap, NAU8310_R04_ENA_CTRL, NAU8310_DSP_SEL_OSC, 0=
);
> +}

[Severity: Medium]
Should the error path in nau8310_load_fw_work() update
NAU8310_R1A_DSP_CORE_CTRL2 and NAU8310_R04_ENA_CTRL before releasing
nau8310->lock?  Updating NAU8310_DSP_SEL_OSC outside nau8310->lock races
with nau8310_clock_event() and nau8310_dsp_snd_soc_dapm_put(), which
serialize updates to NAU8310_R04_ENA_CTRL under nau8310->lock.

[ ... ]

> +static int __maybe_unused nau8310_resume(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap =3D nau8310->regmap;
> +	int ret =3D 0;
> +
> +	regcache_cache_only(regmap, false);
> +	ret =3D regcache_sync(regmap);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D nau8310_dsp_fw_load(nau8310);
> +	if (ret)
> +		dev_err(nau8310->dev, "Loading DSP firmware failed(%d)", ret);
> +
> +	return ret;
> +}

[Severity: Medium]
Does calling nau8310_dsp_fw_load() after regcache_sync() in
nau8310_resume() overwrite the restored clock configuration and race with
DAPM stream resume?

nau8310_dsp_fw_load() calls snd_soc_component_set_sysclk() with
NAU8310_CLK_ID_INT, which runs nau8310_clock_config(nau8310, 48000,
12288000) and clobbers the clock registers just restored by
regcache_sync().  If DAC Oversampling Rate was set to 256 (valid for
sample rates <=3D 24 kHz), nau8310_osr_apply() fails with -EINVAL for
48 kHz before enabling NAU8310_DSP_OSC_EN | NAU8310_DSP_SEL_OSC, and
nau8310_dsp_fw_load() ignores the error and schedules load_fw_work
without the internal oscillator enabled.

Furthermore, when snd_soc_card_resume_deferred() resumes active streams
immediately after nau8310_resume() returns, neither
nau8310_clock_event() nor nau8310_dsp_clock_event() flushes
load_fw_work:

CPU0 (system resume)                      CPU1 (kworker)
nau8310_resume()
  nau8310_dsp_fw_load()
    schedule_work(&load_fw_work)
snd_soc_card_resume_deferred()
  nau8310_clock_event()
    clear NAU8310_DSP_SEL_OSC
  nau8310_dsp_clock_event()
    send CLK_RESTART
                                          nau8310_load_fw_work()
                                            nau8310_dsp_init()
                                              nau8310_software_reset()
                                                <-- resets DSP after resume

[ ... ]

> +static int nau8310_read_device_properties(struct nau8310 *nau8310)
> +{
> +	const char *def_fws =3D NAU8310_DSP_FIRMWARE;
> +	struct device *dev =3D nau8310->dev;
> +	const char *firmware_names =3D NULL;
> +	int ret;
> +	u32 val;
> +
> +	ret =3D device_property_read_u32(dev, "nuvoton,vref-impedance-ohms",
> +		&nau8310->vref_impedance_ohms);
> +	if (ret)
> +		nau8310->vref_impedance_ohms =3D 125000;
> +
> +	ret =3D device_property_read_u32(dev, "nuvoton,dac_vref_microvolt",
> +		&nau8310->dac_vref_microvolt);
> +	if (ret)
> +		nau8310->dac_vref_microvolt =3D 2700000;

[Severity: Medium]
Should "nuvoton,dac_vref_microvolt" use hyphens
("nuvoton,dac-vref-microvolt") to match the DT binding schema and the
other properties in this function?  With underscores, any
nuvoton,dac-vref-microvolt property in Device Tree is ignored and
dac_vref_microvolt always falls back to 2700000.

[ ... ]

> +static int nau8310_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev =3D &i2c->dev;
> +	struct nau8310 *nau8310;
> +	int ret, value, dev_id;
> +
> +	nau8310 =3D devm_kzalloc(dev, sizeof(*nau8310), GFP_KERNEL);
> +	if (!nau8310)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, nau8310);
> +	mutex_init(&nau8310->lock);
> +
> +	nau8310->regmap =3D devm_regmap_init(dev, NULL, i2c, &nau8310_regmap_co=
nfig);
> +	if (IS_ERR(nau8310->regmap))
> +		return PTR_ERR(nau8310->regmap);
> +
> +	ret =3D devm_work_autocancel(dev, &nau8310->load_fw_work, nau8310_load_=
fw_work);
> +	if (ret)
> +		return ret;
> +
> +	nau8310->dev =3D dev;
> +
> +	nau8310_reset_chip(nau8310->regmap);
> +	ret =3D regmap_read(nau8310->regmap, NAU8310_R46_I2C_DEVICE_ID, &value);
> +	if (ret) {
> +		dev_err(dev, "Failed to read NAU8310/20 device id: %d", ret);
> +		return ret;
> +	}
> +
> +	dev_id =3D (int)(uintptr_t)i2c_get_match_data(i2c);
> +	nau8310->silicon_id =3D value & NAU8310_REG_SI_REV_MASK;
> +
> +	if (dev_id !=3D nau8310->silicon_id) {
> +		dev_warn(dev, "Device Tree ID (0x%x) does not match hardware ID (0x%x)=
\n",
> +			 dev_id, nau8310->silicon_id);
> +	}
> +	ret =3D nau8310_read_device_properties(nau8310);
> +	if (ret)
> +		return ret;
> +
> +	nau8310_print_device_properties(nau8310);
> +	nau8310_init_regs(nau8310);
> +
> +	return devm_snd_soc_register_component(dev, &soc_comp_dev_nau8310,
> +		&nau8310_dai, 1);
> +}

[Severity: High]
As reported by Krzysztof Kozlowski on v2 [2], can registering
devm_work_autocancel() before nau8310_read_device_properties() and
devm_snd_soc_register_component() cause a use-after-free when the device
is unbound or component probe fails?

Because devres releases resources in reverse registration order, unbinding
the I2C device frees the ASoC component, component->dapm (stored in
nau8310->dapm), and nau8310->dsp_firmware before devm_work_drop() cancels
nau8310->load_fw_work:

CPU0                                      CPU1 (kworker)
device_release_driver()
  devres_release_all()
    devm_component_release()
    kfree(component->dapm)
    kfree(component)
    kfree(nau8310->dsp_firmware)
                                          nau8310_load_fw_work()
                                            snd_soc_dapm_to_component(nau83=
10->dapm)
                                              <-- use-after-free
                                            nau8310_dsp_init(cp)
                                              request_firmware(..., nau8310=
->dsp_firmware, ...)
                                                <-- use-after-free
    devm_work_drop()
      cancel_work_sync(&load_fw_work)

In addition, nau8310_codec_probe() schedules load_fw_work in
nau8310_dsp_fw_load() before calling nau8310_dsp_setup_controls(), and
does not cancel the work if nau8310_dsp_setup_controls() fails, nor does
soc_comp_dev_nau8310 provide a .remove callback to cancel load_fw_work
when the ASoC component is removed.

> +
> +static const struct i2c_device_id nau8310_i2c_ids[] =3D {
> +	{ .name =3D "nau8310", .driver_data =3D (kernel_ulong_t)NAU8310_REG_SI_=
REV_G10 },
> +	{ .name =3D "nau8320", .driver_data =3D (kernel_ulong_t)NAU8310_REG_SI_=
REV_G20 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, nau8310_i2c_ids);
> +
> +static const struct of_device_id nau8310_of_ids[] =3D {
> +	{ .compatible =3D "nuvoton,nau8310", .data =3D (void *)NAU8310_REG_SI_R=
EV_G10 },
> +	{ .compatible =3D "nuvoton,nau8320", .data =3D (void *)NAU8310_REG_SI_R=
EV_G20 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nau8310_of_ids);
> +
> +static const struct acpi_device_id nau8310_acpi_match[] =3D {
> +	{ .id =3D "NVTN2000" },
> +	{ .id =3D "NVTN2001" },
> +	{}
> +};

[Severity: Low]
Should nau8310_acpi_match[] also populate .driver_data with
NAU8310_REG_SI_REV_G10 and NAU8310_REG_SI_REV_G20?  Without .driver_data,
i2c_get_match_data() returns NULL on ACPI platforms and
nau8310_i2c_probe() always logs a false hardware ID mismatch warning.

[1] https://lore.kernel.org/r/179425369963.3711751.8538085283431158098.b4-r=
eview@b4
[2] https://lore.kernel.org/r/20261109-myna-of-noble-downpour-e09d3e@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118084214.5278=
04-1-YLCHANG2@nuvoton.com?part=3D2
