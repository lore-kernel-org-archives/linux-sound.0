Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203094;
	b=oJuC1K0jkL5gYLevT9AUX7/Qtz8IZdGLPLG/G1EZfCyke3RRTgyC+Tx9kusCJoGTqMO5
	 BXJNAW87vQwk9HnpOyVTdLJr5jk8vwNYzoWdcgxsZMCgxGDNcyzpL3/G88qJBMejm+fVr
	 ClhUjk63ByJqyWMt49K5MbiRbGfWtR4A1OAkav4r6zRt5RfDfkqDntK8v9hYV/MroNRlX
	 5I2q6h9rbkEjIIY1V1mLdjc6sJGPfa2vOO/cA/ipM7qtJIDwSQ+zfmMSta5zq57BrHqoj
	 QlwZfB5Hl2+dLrQj4g+pMn8k8Bd0je5YoYwPV0jlrSbgeGWTY+u7RUibW0MCeptXtEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203094;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lSED3ktPNEl5+gFKHpSEWPyAcXm1vHBh0bU7469gUxc=;
	b=W/9B0PL5WsvtKHM7KVJZAuBk3q5YkFMmYEPEM54ptM1pb5FrIS1j3Jd+9lp+tXk60SeP
	 anRWMA7ZHLPN6I6nsXtJ/jXAj8B7C6K8OFaXYMf+/J+lRxZy40Ubv8/8CJiRn9emdMGOG
	 rFN/23CPkVLbmOqGmU5AyYuGlhEPbEi8ZzkEnTGZTrvQ107Q9RE3Sqo4Qu+nT4paE2kas
	 RUunMH3SqYGysdWVTqzkMO/cqkaCHY6eOj5VhyZKTwA9GSXAIM/a7YncwhWGdLnh2Pb1m
	 I4r4BQSCZo3uVIMyTda8SN9UMbPV7aEJCHcHkwIAEYXoT1vQMa7Qfcucfn9Nytmx2/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUlHpk8W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD6606A321;
	Mon,  9 Nov 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUlHpk8W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02DF1F008A1;
	Mon,  9 Nov 2026 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794203093;
	bh=lSED3ktPNEl5+gFKHpSEWPyAcXm1vHBh0bU7469gUxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KUlHpk8W8ya27D9F0UtuF4SxiDSFusszWm+TjSJ1lOZXW91vCErj5+IPGcBA/3WNK
	 tvva2Qo936aaCNDACR8xPfbXfM//ym89mDNrHfJ327mOML6uXpaBzsr1QRU/4eQhiY
	 7fuC63oEP31h6wvh0w+oyG1W6D8IkFQNTra/mOoVihX10BO/v1F6yZO7SaMINI29YB
	 cJ9ol+7SpDpNX4easMqw+U/lKPcMsJsAVfPsvmfUPQ5QiFrGBUR2Vrebjd0oMmtuPI
	 D/bJ8rAM/Q1In6BNWzOsilmlDLeJP+nx1PX5rZoNPl/NKXL2JyBrZEYDJdpRRC+gfZ
	 rsTck3geQ4s0Q==
Message-ID: <sashiko-outbox-204454@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109051251.471879-3-YLCHANG2@nuvoton.com>
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:44:52 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 16 potential
issues to consider:
- [High] ASoC: nau8310: type confusion in nau8310_biq_coeff_put()
- [High] ASoC: nau8310: DAPM state desync and work handling in
  nau8310_dsp_init()
- [High] ASoC: nau8310: uncanceled load_fw_work on probe error and
  component remove
- [Medium] ASoC: nau8310: unchecked regmap_read() in
  nau8310_biq_coeff_get()
- [Medium] ASoC: nau8310: uninitialized kcs_rst on empty reply in
  nau8310_dsp_kcs_setup()
- [Medium] ASoC: nau8310: races on bias_level and clock in
  nau8310_dsp_snd_soc_dapm_put()
- [Medium] ASoC: nau8310: unmuting DAC on error in
  nau8310_dsp_set_kcs_setup()
- [Medium] ASoC: nau8310: broken Sense DAPM pin and ADCDAT_OE lifecycle
  management
- [Medium] ASoC: nau8310: nau8310_set_tdm_slot() bitwise-ORs encoded TX
  slot selectors
- [Medium] ASoC: nau8310: broken clock config for 64kHz/96kHz,
  NAU8310_RATES, and 1x/2x mult
- [Medium] ASoC: nau8310: nau8310_resume() skips firmware load when DSP
  is bypassed
- [Medium] ASoC: nau8310: race between load_fw_work and DAPM clock
  events on resume
- [Medium] ASoC: nau8310: nau8310_dac_oversampl_enum exposes reserved
  register value
- [Low] ASoC: nau8310: broken route cleanup in
  nau8310_dsp_setup_controls()
- [Low] ASoC: nau8310: off-by-one KCS size limit in
  NAU8310_DSP_KCS_DAT_LEN_MAX
- [Low] ASoC: nau8310: wrong dB scale unit in adc_vol_tlv definition
--

commit b7ad2d10b4218feb399fff7738dd084543f6cdfc
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8310: Add support for NAU83G10 amplifier

This commit adds an ASoC codec driver for the Nuvoton NAU83G10/20 mono
boosted Class-D audio amplifier with integrated DSP and I/V-sense support.

> diff --git a/sound/soc/codecs/nau8310-dsp.c b/sound/soc/codecs/nau8310-ds=
p.c
> new file mode 100644
> index 0000000000000..bdf49709dfef9
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310-dsp.c

[ ... ]

> +static int nau8310_reply_from_dsp(struct snd_soc_component *cp,
> +	const struct nau8310_cmd_info *cmd_info, int data_size,
> +	void *data)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct device *dev =3D cp->dev;
> +	int ret, frag_len, pad_len_exp, data_count =3D 0;
> +
> +	ret =3D nau8310_dsp_replied(nau8310, &frag_len);
> +	if (ret)
> +		return ret;
> +	if (!frag_len || !cmd_info->reply_data)
> +		return 0;
> +	if (!data || frag_len =3D=3D 1)
> +		return -EINVAL;

[ ... ]

> +static int nau8310_dsp_kcs_setup(struct snd_soc_component *cp, int offse=
t, int size,
> +	const void *data)
> +{
> +	u8 *data_buf =3D (u8 *)data;
> +	unsigned int kcs_rst;
> +	int retries =3D 0, ret, data_len, data_rem, addr_offset;
> +
> +	/* Limit full load of KCS_SETUP data and not beyond 3kB offset. */
> +	if (!data || size > NAU8310_DSP_KCS_DAT_LEN_MAX ||
> +		offset > NAU8310_DSP_KCS_OFFSET_MAX)
> +		return -EINVAL;
> +
> +	/* sending fragments for KCS setup */
> +	addr_offset =3D offset;
> +	data_rem =3D size;
> +
> +	while (data_rem) {
> +		data_len =3D min(data_rem, NAU8310_DSP_KCS_TX_MAX);
> +
> +		ret =3D nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_SET_KCS_SETUP,
> +			addr_offset, data_len, (void *)data_buf, 0, &kcs_rst);
> +		if (ret) {
> +			if (retries++ < NAU8310_DSP_RETRY_MAX)
> +				continue;
> +			return ret;
> +		}
> +
> +		data_buf +=3D (u8)data_len;
> +		addr_offset +=3D data_len;
> +		data_rem -=3D data_len;
> +
> +		/* checking KCS result */
> +		ret =3D nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_GET_KCS_RSLTS,
> +			0, NAU8310_DSP_DATA_BYTE, NULL, NAU8310_DSP_DATA_BYTE, &kcs_rst);
> +		if (ret)
> +			return ret;
> +		if (kcs_rst !=3D NAU8310_DSP_KCS_RSLTS_SUCCESS)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can nau8310_dsp_kcs_setup() evaluate an uninitialized kcs_rst if the DSP
replies with frag_len =3D=3D 0?  When frag_len is 0, nau8310_reply_from_dsp=
()
returns 0 even when cmd_info->reply_data is true, leaving kcs_rst
unmodified on the stack.

> +
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
> +	int ret;
> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_warn_ratelimited(nau8310->dev, "changing path is not allowed durin=
g playback");
> +		return -EBUSY;
> +	}
> +
> +	val =3D (ucontrol->value.integer.value[0] & mask);
> +
> +	mutex_lock(&nau8310->lock);
> +	if (val =3D=3D NAU8310_DAC_SRC_DSP && !nau8310->load_fw_done) {
> +		dev_warn_ratelimited(nau8310->dev, "Cannot enable DSP: Firmware not re=
ady or disabled");
> +		mutex_unlock(&nau8310->lock);
> +		return -EBUSY;
> +	}
> +	mutex_unlock(&nau8310->lock);
> +
> +	ret =3D snd_soc_dapm_put_volsw(kcontrol, ucontrol);
> +
> +	if (val =3D=3D NAU8310_DAC_SRC_BYPASS) {
> +		/* Switch the clock source of DSP to MCLK. */
> +		regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
> +			NAU8310_DSP_SEL_OSC, 0);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
Can nau8310_dsp_snd_soc_dapm_put() race with stream startup and firmware
loading?

CPU0                                      kworker
nau8310_dsp_snd_soc_dapm_put()            nau8310_load_fw_work()
  snd_soc_dapm_get_bias_level(dapm)
  /* val =3D=3D NAU8310_DAC_SRC_BYPASS */
  mutex_lock(&nau8310->lock)
  mutex_unlock(&nau8310->lock)
                                          mutex_lock(&nau8310->lock)
                                          nau8310_dsp_init()
  snd_soc_dapm_put_volsw()
  regmap_update_bits(...,
    NAU8310_DSP_SEL_OSC, 0)               <-- switches DSP clock off OSC
                                              during firmware init

snd_soc_dapm_get_bias_level(dapm) is checked without holding
card->dapm_mutex and before waiting on nau8310->lock, so playback can
start before snd_soc_dapm_put_volsw() runs.  In addition, when val is
NAU8310_DAC_SRC_BYPASS, NAU8310_DSP_SEL_OSC is cleared outside
nau8310->lock without flushing load_fw_work.

[ ... ]

> +static int nau8310_dsp_set_kcs_setup(struct snd_soc_component *cp)
> +{

[ ... ]

> +err_loaded:
> +	regmap_update_bits(regmap, NAU8310_R13_MUTE_CTRL, NAU8310_SOFT_MUTE, 0);
> +	if (fw)
> +		release_firmware(fw);
> +err:
> +	nau8310->load_fw_done =3D false;
> +	return ret;
> +}

[Severity: Medium]
As reported by Mark Brown on v1 [1], doesn't clearing NAU8310_SOFT_MUTE to
0 on the err_loaded path unmute the DAC when firmware setup fails?  In
nau8310_dac_event(), setting NAU8310_SOFT_MUTE mutes the amplifier and 0
unmutes it.

> +
> +int nau8310_dsp_init(struct snd_soc_component *cp)
> +{
> +	struct regmap *regmap =3D cp->regmap;
> +
> +	nau8310_sw_reset_chip(regmap);
> +
> +	/* wait for the power ready */
> +	msleep(120);
> +
> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
> +		NAU8310_DSP_RUNSTALL | NAU8310_DAC_SEL_DSP_OUT, NAU8310_DAC_SEL_DSP_OU=
T);
> +
> +	return nau8310_dsp_set_kcs_setup(cp);
> +}

[Severity: High]
Does setting NAU8310_DAC_SEL_DSP_OUT directly in nau8310_dsp_init()
desynchronize the hardware state from DAPM?

During nau8310_codec_probe(), nau8310_dsp_setup_controls() registers the
"DAC data from DSP" switch while load_fw_work is sleeping in msleep(120),
so dapm_set_mixer_path_status() reads NAU8310_R1A_DSP_CORE_CTRL2 while
NAU8310_DAC_SEL_DSP_OUT is still 0 and marks the route disconnected.  When
nau8310_dsp_init() then sets NAU8310_DAC_SEL_DSP_OUT via
regmap_update_bits(), hardware routes the DAC from the DSP, but DAPM
leaves the DSP, DSP Clock, Capture Sense, SAR, ADC_I and ADC_V widgets
unpowered during playback.

Also, in nau8310_load_fw_work(), nau8310->lock is released before the err
label clears NAU8310_DAC_SEL_DSP_OUT and NAU8310_DSP_SEL_OSC on failure,
leaving a window where nau8310_dsp_active() is true while load_fw_done is
false.

> +
> +int nau8310_dsp_setup_controls(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct snd_soc_dapm_context *dapm =3D nau8310->dapm;
> +	int ret;
> +
> +	ret =3D snd_soc_dapm_new_controls(dapm, nau8310_dsp_dapm_widgets,
> +		ARRAY_SIZE(nau8310_dsp_dapm_widgets));
> +	if (ret) {
> +		dev_err(cp->dev, "Add DSP widget fail (%d)", ret);
> +		goto err;
> +	}
> +
> +	ret =3D snd_soc_dapm_add_routes(dapm, nau8310_dsp_dapm_routes,
> +		ARRAY_SIZE(nau8310_dsp_dapm_routes));
> +	if (ret) {
> +		dev_err(cp->dev, "Add DSP route fail (%d)", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	snd_soc_dapm_del_routes(dapm, nau8310_dsp_dapm_routes,
> +		ARRAY_SIZE(nau8310_dsp_dapm_routes));
> +	return ret;
> +}

[Severity: Low]
If snd_soc_dapm_new_controls() fails, doesn't jumping to err call
snd_soc_dapm_del_routes() on routes that were never added?  In addition,
nau8310_dsp_dapm_routes contains a route with a control ("Switch"), which
snd_soc_dapm_del_route() does not support removing, and ASoC core already
cleans up component DAPM widgets and routes when component probe fails.

> diff --git a/sound/soc/codecs/nau8310-dsp.h b/sound/soc/codecs/nau8310-ds=
p.h
> new file mode 100644
> index 0000000000000..a8301b9df8cbf
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310-dsp.h
> @@ -0,0 +1,111 @@

[ ... ]

> +#define NAU8310_DSP_KCS_DAT_LEN_BITS		10
> +#define NAU8310_DSP_KCS_DAT_LEN_MAX		((1 << NAU8310_DSP_KCS_DAT_LEN_BITS=
) - 1)

[Severity: Low]
Should NAU8310_DSP_KCS_DAT_LEN_MAX be (1 << NAU8310_DSP_KCS_DAT_LEN_BITS)
(1024) rather than 1023?  Defining it as 1023 causes
nau8310_dsp_kcs_setup() and nau8310_send_dsp_command() to reject a full 1
KB KCS payload with -EINVAL or -ERANGE.

> diff --git a/sound/soc/codecs/nau8310.c b/sound/soc/codecs/nau8310.c
> new file mode 100644
> index 0000000000000..d5b2a655a367c
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310.c

[ ... ]

> +static int nau8310_biq_coeff_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	int i, reg, reg_val;
> +	u16 *val;
> +
> +	val =3D (u16 *)ucontrol->value.bytes.data;
> +	reg =3D NAU8310_R80_BIQ0_COE_1;
> +	for (i =3D 0; i < params->max / sizeof(u16); i++) {
> +		regmap_read(nau8310->regmap, reg + i, &reg_val);
> +		/* conversion of 16-bit integers between native CPU format
> +		 * and big endian format
> +		 */
> +		reg_val =3D cpu_to_be16(reg_val);
> +		*(val + i) =3D reg_val;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
If regmap_read() fails in nau8310_biq_coeff_get(), doesn't this copy the
uninitialized stack variable reg_val into ucontrol->value.bytes.data and
return 0 to userspace?

> +
> +static int nau8310_biq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *cp =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	void *data;
> +	u16 *val, value;
> +	int i, reg, ret;

[Severity: High]
Doesn't calling snd_soc_dapm_kcontrol_to_dapm(kcontrol) in
nau8310_biq_coeff_put() cause type confusion on kcontrol->private_data and
dereference an invalid pointer?

"BIQ Coefficients" is registered in nau8310_snd_controls as a standard
component control, so kcontrol->private_data is struct snd_soc_component *,
not struct dapm_kcontrol_data *.  Writing to this control will crash in
snd_soc_dapm_kcontrol_to_dapm(); it should use
snd_soc_kcontrol_component(kcontrol) like the other controls.

Also, both nau8310_biq_coeff_get() and nau8310_biq_coeff_put() store and
read __be16 values through int reg_val and u16 *val instead of __be16 *,
which triggers sparse endianness warnings.

[ ... ]

> +static const char * const nau8310_dac_oversampl[] =3D {
> +	"64", "256", "128", "", "32" };
> +
> +static const struct soc_enum nau8310_dac_oversampl_enum =3D
> +	SOC_ENUM_SINGLE(NAU8310_R29_DAC_CTRL1, NAU8310_DAC_OVERSAMPLE_SFT,
> +		ARRAY_SIZE(nau8310_dac_oversampl), nau8310_dac_oversampl);

[Severity: Medium]
Does exposing index 3 ("") in nau8310_dac_oversampl_enum allow userspace
to write the reserved value 3 to NAU8310_R29_DAC_CTRL1?  In osr_dac_sel[],
index 3 has osr =3D 0, which causes nau8310_clock_check() and
nau8310_hw_params() to fail with -EINVAL.  Using SOC_VALUE_ENUM_SINGLE()
would avoid exposing the reserved setting.

[ ... ]

> +static const DECLARE_TLV_DB_MINMAX(adc_vol_tlv, 0, 24125);
> +static const DECLARE_TLV_DB_MINMAX(pga_gain_tlv, 0, 1600);

[Severity: Low]
Should the maximum gain in adc_vol_tlv be 2412 (24.12 dB) instead of 24125?
DECLARE_TLV_DB_MINMAX() takes values in 0.01 dB units, so 24125 reports
241.25 dB to userspace for 0xc1 steps of 0.125 dB.

[ ... ]

> +static int nau8310_clock_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *cp =3D snd_soc_dapm_to_component(w->dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		/* Switch the clock source of DSP to MCLK. */
> +		regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
> +			NAU8310_DSP_SEL_OSC, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
As reported by Mark Brown on v1 [1], can nau8310_clock_event() and
nau8310_dsp_clock_event() race with nau8310_load_fw_work() during system
resume?

CPU0                                      kworker
snd_soc_card_resume_deferred()
  nau8310_resume()
    nau8310_dsp_fw_load()
      /* sets NAU8310_DSP_SEL_OSC */
      schedule_work(&load_fw_work)
  snd_soc_dapm_sync()
    nau8310_clock_event()
      regmap_update_bits(...,
        NAU8310_DSP_SEL_OSC, 0)           nau8310_load_fw_work()
                                            nau8310_dsp_init()
                                              <-- DSP clock switched off
                                                  OSC during firmware load

nau8310_clock_event() clears NAU8310_DSP_SEL_OSC without holding
nau8310->lock or flushing load_fw_work, and nau8310_dsp_clock_event() does
not flush load_fw_work before taking nau8310->lock and clearing
NAU8310_DSP_SEL_OSC.

[ ... ]

> +static int nau8310_adc_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *cp =3D snd_soc_dapm_to_component(w->dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap =3D nau8310->regmap;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_update_bits(regmap, NAU8310_R0E_I2S_PCM_CTRL2,
> +			NAU8310_I2S_ADCDAT_OE_MASK, NAU8310_I2S_ADCDAT_OE_EN);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		regmap_update_bits(regmap, NAU8310_R0E_I2S_PCM_CTRL2,
> +			NAU8310_I2S_ADCDAT_OE_MASK, NAU8310_I2S_ADCDAT_OE_DIS);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

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
> +	if (srate_table->adc_div < 0 ||
> +		dsp_mult_sel < 0 || dsp_mult_sel >=3D ARRAY_SIZE(dsp_src_mult) ||
> +		n2_sel < 0 || n2_sel >=3D ARRAY_SIZE(mclk_n2_div) ||
> +		n1_sel < 0 || n1_sel >=3D ARRAY_SIZE(mclk_n1_div)) {
> +		dev_err(nau8310->dev, "The fs %d isn't support in DSP.", srate_table->=
fs);
> +		return -EINVAL;
> +	}

[ ... ]

> +	if (mult_sel < 2 || mult_sel > 4)
> +		return -EINVAL;
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
Can 64 kHz or 96 kHz ever succeed in nau8310_clock_process(), even when
the DSP is bypassed?

nau8310_clock_process() unconditionally calls nau8310_clkdsp_choose() ->
nau8310_calc_dsp_clk(), which requires fs * 2000 <=3D dsp_clk <=3D 10240000=
0;
for 64 kHz and 96 kHz, fs * 2000 exceeds 102400000, so it always fails
with -EINVAL.  For 96 kHz, target_srate_table[] also sets adc_div =3D -1,
which nau8310_clock_apply() unconditionally rejects, and NAU8310_RATES
advertises SNDRV_PCM_RATE_8000_192000 even though 11.025, 22.05, 88.2,
176.4 and 192 kHz are absent from target_srate_table[].

In addition, nau8310_clock_apply() rejects mult_sel < 2 (1x and 2x
multipliers in mclk_src_mult[] and dsp_src_mult[]) with -EINVAL after
already writing NAU8310_R03_CLK_CTRL, NAU8310_R40_CLK_DET_CTRL and
NAU8310_R04_ENA_CTRL.

[ ... ]

> +static int nau8310_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx=
_mask,
> +	unsigned int rx_mask, int slots, int slot_width)
> +{

[ ... ]

> +	for (i =3D 0; i < NAU8310_TDM_MAX_SLOTS; i++)
> +		if (tx_mask & BIT(i)) {
> +			ctrl_val |=3D nau8310_tx_slot_map[i];
> +			dev_dbg(dev, "NAU8310_ADC_%c_SEL_SLOT%d",
> +				(i % 2 =3D=3D 0) ? 'V' : 'I', i);
> +		}

[Severity: Medium]
Doesn't bitwise-ORing nau8310_tx_slot_map[i] across all set bits in
tx_mask corrupt NAU8310_ADC_V_SEL and NAU8310_ADC_I_SEL when multiple even
or odd slots are set in tx_mask?  NAU8310_ADC_V_SEL and NAU8310_ADC_I_SEL
are 3-bit binary-encoded fields (0x4..0x7), so ORing slot 2 (0x5) and slot
4 (0x6) produces slot 6 (0x7).  Also, slots is a signed int only checked
against !slots and slots > NAU8310_TDM_MAX_SLOTS, so negative slots or
mask bits >=3D slots are not rejected.

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
> +	if (nau8310_dsp_active(cp))
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
> +	if (!nau8310_dsp_active(cp))
> +		return;
> +
> +	snd_soc_dapm_disable_pin(nau8310->dapm, "Sense");
> +}

[Severity: Medium]
Does the "Sense" pin and NAU8310_I2S_ADCDAT_OE handling work across
bypass, full-duplex, and idle states?

1. "Sense" is a SND_SOC_DAPM_SIGGEN widget and is never disabled in
nau8310_codec_probe() or nau8310_resume().  Enabling "DAC data from DSP"
or "ALC gain selection mode" while idle completes a Sense -> DAC ->
Speaker path, powering up the codec and raising bias_level above
SND_SOC_BIAS_STANDBY so nau8310_dsp_snd_soc_dapm_put() rejects further
path changes with -EBUSY.

2. nau8310_shutdown() disables "Sense" without checking if the other
stream direction is still active and without calling snd_soc_dapm_sync().

3. Once nau8310_shutdown() disables "Sense", switching to DSP bypass mode
leaves "Sense" disabled because nau8310_startup() only enables "Sense"
when nau8310_dsp_active(cp) is true, preventing Capture (ADC_OUT) and ALC
sense from powering up.

4. Both "ALC gain selection mode" and "ADC_OUT" share nau8310_adc_event(),
so powering down either widget unconditionally sets
NAU8310_I2S_ADCDAT_OE_DIS even if the other widget is still active.

[ ... ]

> +static int nau8310_codec_probe(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(cp);
> +	int ret =3D 0;
> +
> +	nau8310->dapm =3D dapm;
> +
> +	/* Loading DSP firmware */
> +	ret =3D nau8310_dsp_fw_load(nau8310);
> +	if (ret) {
> +		dev_err(nau8310->dev, "Loading DSP firmware failed(%d)", ret);
> +		goto err;
> +	}
> +
> +	ret =3D nau8310_dsp_setup_controls(cp);
> +	if (ret) {
> +		dev_err(nau8310->dev, "DSP setup controls failed(%d)", ret);
> +		goto err;
> +	}
> +
> +err:
> +	return ret;
> +}

[Severity: High]
Does nau8310_codec_probe() leave nau8310->load_fw_work running if
nau8310_dsp_setup_controls() fails or when the component is later removed?

nau8310_dsp_fw_load() schedules load_fw_work before
nau8310_dsp_setup_controls() runs, but the error path does not call
cancel_work_sync(&nau8310->load_fw_work), and soc_comp_dev_nau8310 has no
.remove callback to cancel the work if component probe fails later or the
sound card is unbound while the I2C device stays bound.

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
> +	if (nau8310_dsp_active(cp)) {
> +		ret =3D nau8310_dsp_fw_load(nau8310);
> +		if (ret)
> +			dev_err(nau8310->dev, "Loading DSP firmware failed(%d)", ret);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
If the system suspends and resumes while the DSP is bypassed
(!nau8310_dsp_active(cp)), doesn't skipping nau8310_dsp_fw_load() leave
nau8310->load_fw_done set to true even though the DSP lost its firmware
across suspend?  If userspace later enables "DAC data from DSP",
nau8310_dsp_snd_soc_dapm_put() will see load_fw_done =3D=3D true and route
audio through the uninitialized DSP.

[1] https://lore.kernel.org/r/179304693306.199157.5210648249546181520.b4-re=
view@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109051251.4718=
79-1-YLCHANG2@nuvoton.com?part=3D2
