Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771636;
	b=q1l9KNa8ZwuD1361on5vMSIEk40HxePWeBwnF3gVcuifWKcJxTq/rA4wS6Ev9ZNBXqeg
	 mvVWUa4zffpCnd3ZIOJnI5Hf8O8je6DMrbuqzUl+FWjMFejWNHjsHPSiWUAUZnfGzC6Cn
	 S86Jmiwi/vDcOStlzXHDImzV82hc+cWxOZoj0MISdJ8XbHdlQ+gOvCxqW8MBIVK1E8pE/
	 4bLgO2MOvN1eHfjZ7cNJ5gIlzC0Ksh0in4+5A7LS4jLikPjG0eFAAvtG6yqfo7lwXTnbz
	 1hN9gH9Eg258Mj8cUBnSz0a5snEAYAD+oByioyjl/732DQJW2SfYSnpcwr+dBN7bbRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IDdskE3P3CjwXx+To4shVG0GivjF6DfN3dmbq1nXdrY=;
	b=rLccUNSoSOQ2uZWqduifaUiYXIyKwUdIKwNsZ9C6WkazFFgBdZQdfHo0SdySO2b8cotA
	 Fd/cqV4+k0hnPY8yGWDdQ0iIiQWzWhmcSCZ62h9j4NfDerWGLRbmn+tPYofujgH7raaIk
	 rkkYk2TvwT5FUPLWRpxBt2AzB+Kug/4+VhwLionDgqpejfMbd89zKU4KG8CuoXeP6YVfA
	 /KGidl15p0swncIkBzMTd4T962KeR26zK3+8JMbE0TrPW9VoqbrOutG0Mw+U+E2JGxvfI
	 OFve41+ZZVnH+AQkBWL3cxjt/oiPRJ0UvsFCLpVmWxwVWM5Xd5z/pcnGRgbEBFTgnMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXlAk9fp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2764606A33A;
	Fri, 27 Nov 2026 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXlAk9fp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE841F00897;
	Fri, 27 Nov 2026 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771636;
	bh=IDdskE3P3CjwXx+To4shVG0GivjF6DfN3dmbq1nXdrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXlAk9fp31KQqlOQZ2pnBhsKBsWAki0NSlLvAAEyyxits3KzP7j7AA6wEgEGgszSB
	 xmPWcHNbsXZhYi4EpDgf5LSrk6nGvBTE1Usx9SLXZNzc2zAwFjOozj/KbaAs5/+DGM
	 5w1DRARK2NUAK9htGr7L1JzDuwykAgfbpAQpuWND6dAdNKijCBbRsW9B9j4qka43OG
	 PcRIsPYwoTTqken4Zwnv6cqkin31N/Y18Q9/9w9HS2bx0Dvv5gWaGB3o4fy/OhgH4Q
	 MPWekcRgMcXqRan3YBlYEY3db0gi2n7Yuarj30iGACHrGhMo9eEClxyjMjt+T/E4B6
	 Mqa6SaseoOB5A==
Message-ID: <sashiko-outbox-236972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunuk Son" <hyunuk.son@irondevice.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127090707.389362-3-hyunuk.son@irondevice.com>
References: <20261127090707.389362-1-hyunuk.son@irondevice.com>
 <20261127090707.389362-3-hyunuk.son@irondevice.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:27:15 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Medium] ASoC: ma5311: broken slot lookup and restore in
  ma5311_reset_control_put()
- [Medium] ASoC: ma5311: premature speaker mode write in
  ma5311_aif_in_event()
- [Medium] ASoC: ma5311: unlocked amp_power_status check in
  ma5311_dapm_aif_in_put()
- [Medium] ASoC: ma5311: zero rx_mask clobbers RX slots in
  ma5311_dai_set_tdm_slot()
- [Medium] ASoC: ma5311: flag_dai_tdm skips TDM TX setup in
  ma5311_dai_hw_params()
- [Medium] ASoC: ma5311: PLL and ADC clock left enabled by
  ma5311_dai_hw_params()
- [Low] ASoC: ma5311: duplicate format validation switch in
  ma5311_dai_set_fmt()
--

commit 047836593fa27eab5c43de3db5553f6e85de9ab6
Author: Hyunuk Son <hyunuk.son@irondevice.com>

ASoC: codecs: Add driver for Iron Device MA5311

This commit adds an ASoC codec driver for the Iron Device MA5311 audio
codec supporting I2S and TDM playback and capture.

> diff --git a/sound/soc/codecs/ma5311.c b/sound/soc/codecs/ma5311.c
> new file mode 100644
> index 0000000000000..d548fcd0267b4
> --- /dev/null
> +++ b/sound/soc/codecs/ma5311.c

[ ... ]

> +static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =3D
> +		snd_soc_component_to_dapm(component);
> +	struct snd_kcontrol *slot_control;
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +	unsigned int rx_slot;
> +	int ret =3D 0;
> +
> +	if (!val)
> +		return 0;
> +
> +	if (!ma5311->reset_gpio)
> +		return -ENODEV;
> +
> +	if (val >=3D ARRAY_SIZE(ma5311_reset_text))
> +		return -EINVAL;
> +
> +	slot_control =3D snd_soc_card_get_kcontrol(component->card,
> +						 "RX Slot Configuration");
> +	if (!slot_control)
> +		return -ENOENT;

[ ... ]

> +	rx_slot =3D snd_soc_dapm_kcontrol_get_value(slot_control);
> +	rx_slot &=3D MA5311_TDM_SLOT0_RX_POS_MASK |
> +		MA5311_TDM_SLOT1_RX_POS_MASK;
> +	ma5311->dai_tdm1_rx_pos =3D rx_slot;
> +
> +	ma5311->flag_ext_rst =3D true;
> +	ret =3D ma5311_reset(component);
> +	ma5311->flag_ext_rst =3D false;

[Severity: Medium]
Does looking up "RX Slot Configuration" via snd_soc_card_get_kcontrol()
fail with -ENOENT whenever component->name_prefix is set (for example on
multi-amplifier TDM boards), where snd_soc_component_get_kcontrol() is
needed instead?

Also, overwriting ma5311->dai_tdm1_rx_pos with
snd_soc_dapm_kcontrol_get_value(slot_control) discards any TDM RX slot
configuration set through ma5311_dai_set_tdm_slot() or
ma5311_dai_hw_params(), because those paths update MA5311_DAC_37_TDM1 and
ma5311->dai_tdm1_rx_pos directly without updating slot_control's cached
DAPM value.  In addition, I2S playback in ma5311_dai_hw_params() clears
MA5311_DAC_37_TDM1 and ma5311->dai_tdm1_rx_pos to MA5311_DISABLE_TDM_SLOT,
and switching back to SND_SOC_DAIFMT_DSP_A playback never restores them.

[ ... ]

> +static int ma5311_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D
> +		snd_soc_dapm_kcontrol_to_dapm(kcontrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +	unsigned int old_val =3D snd_soc_dapm_kcontrol_get_value(kcontrol);
> +
> +	if (val >=3D ARRAY_SIZE(ma5311_aif_in_source_text)) {
> +		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (old_val =3D=3D val)
> +		return 0;
> +
> +	if (ma5311->amp_power_status) {
> +		dev_warn(ma5311->dev,
> +			 "Cannot change AIF IN Source during playback\n");
> +		return -EBUSY;
> +	}
> +
> +	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> +}

[Severity: Medium]
Can ma5311_dapm_aif_in_put() race with playback startup because old_val
and ma5311->amp_power_status are checked before taking card->dapm_mutex?

CPU0                                  CPU1
ma5311_dapm_aif_in_put()
  if (ma5311->amp_power_status)
    (false)
                                      soc_pcm_prepare()
                                        mutex_lock_nested(&card->dapm_mutex)
                                        ...
                                        ma5311_aif_in_event()
                                        ma5311_startup()
                                          ma5311->amp_power_status =3D true
                                        mutex_unlock(&card->dapm_mutex)
  snd_soc_dapm_put_enum_double()
    mutex_lock_nested(&card->dapm_mutex)
    snd_soc_dapm_mux_update_power()   <-- updates mux while powered

Because both "Mono Both" and "Stereo" routes connect from "AIF IN", the
"AIF IN Source" widget stays powered across the mux change and
SND_SOC_DAPM_PRE_PMU does not re-fire, leaving the kcontrol out of sync
with ma5311->amp_mode and the hardware registers.

[ ... ]

> +static int ma5311_aif_in_event(struct snd_soc_dapm_widget *w,
> +			       struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int mux =3D snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		switch (mux) {
> +		case MA5311_MONO_BOTH_MODE:
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_10_SYSTEM_CTRL3,
> +					   MA5311_SPK_MODE_MASK,
> +					   MA5311_SPK_MONO_BOTH);
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_37_TDM1,
> +					   MA5311_DAC_TDM_STEREO_MASK,
> +					   MA5311_DAC_TDM_MONO);
> +			break;
> +		case MA5311_STEREO_MODE:
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_10_SYSTEM_CTRL3,
> +					   MA5311_SPK_MODE_MASK,
> +					   MA5311_SPK_STEREO);
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_37_TDM1,
> +					   MA5311_DAC_TDM_STEREO_MASK,
> +					   MA5311_DAC_TDM_STEREO);
> +			break;
> +		default:
> +			dev_err(ma5311->dev, "%s: Invalid value (%u)\n",
> +				__func__, mux);
> +			return -EINVAL;
> +		}
> +
> +		ma5311->amp_mode =3D mux;
> +		break;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does writing MA5311_DAC_10_SYSTEM_CTRL3 and MA5311_DAC_37_TDM1 in
ma5311_aif_in_event() cause the post-power-on writes in ma5311_startup()
to be skipped by regcache?

During DAPM power-up, "AIF IN Source" (a mux widget) runs
ma5311_aif_in_event() before "AMP Power" (an out_drv widget) runs
ma5311_startup().  ma5311_aif_in_event() writes the speaker mode while
MA5311_PLL_MASK and MA5311_POWER_MASK are still off, and because
ctrl_regmap uses REGCACHE_FLAT, the later regmap_update_bits() calls on
MA5311_DAC_10_SYSTEM_CTRL3 and MA5311_DAC_37_TDM1 in ma5311_startup()
after enabling PLL and chip power become cache-hit no-ops.

Also, ma5311_shutdown() forces MA5311_SPK_MUTE in
MA5311_DAC_0E_MUTE_VOL_CTRL on DAPM power-down, but ma5311_startup() never
restores ma5311->dai_spk_mute on power-up.  Finally, "AIF IN Source"
subscribes to SND_SOC_DAPM_POST_PMU in ma5311_dapm_widgets even though
ma5311_aif_in_event() only handles SND_SOC_DAPM_PRE_PMU.

[ ... ]

> +static int ma5311_setup_pll(struct snd_soc_component *component,
> +			    unsigned int bclk)
> +{

[ ... ]

> +	regmap_update_bits(ma5311->ctrl_regmap,
> +			   MA5311_DAC_A2_TOP_MAN2,
> +			   MA5311_PLL_MASK, MA5311_PLL_ON);

[ ... ]

> +static int ma5311_dai_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{

[ ... ]

> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_B8_TOP_MAN5,
> +				   MA5311_DAC_ADC_CLK_ON_MASK,
> +				   MA5311_DAC_ADC_CLK_ON);
> +		ma5311->dai_adc_clk =3D MA5311_DAC_ADC_CLK_ON;

[Severity: Medium]
Can ma5311_dai_hw_params() leave the PLL and ADC clock enabled when
hw_params fails or a substream is closed without starting?

ma5311_setup_pll() turns on MA5311_PLL_ON during ma5311_dai_hw_params()
before params_format(params) is validated and before DAPM powers up the
widgets.  Because the PLL is only turned off in DAPM power-down callbacks
(ma5311_shutdown() and ma5311_adc_event()), an unsupported PCM format or a
substream closed before DAPM power-up leaves the PLL powered on.
Likewise, capture hw_params enables MA5311_DAC_ADC_CLK_ON in
MA5311_DAC_B8_TOP_MAN5, and no error path or DAPM power-down callback ever
disables it.

In addition, ma5311_i2c_probe() initializes ma5311->dai_sdo_len and
ma5311->dai_sck_rate to 16-bit/32FS (0x5c), whereas ma5311_ctrl_reg_def
initializes register 0xa1 to 24-bit/64FS (0x40), and ma5311_dai_set_fmt()
repeats the switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) check twice.

[ ... ]

> +		case SND_SOC_DAIFMT_DSP_A:
> +			dev_info(component->dev, "Working in TDM TX Mode\n");
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_A1_TOP_MAN1_FOR_SDO,
> +					   MA5311_TOP_MAN1_O_FORMAT_MASK,
> +					   MA5311_TOP_MAN1_O_FORMAT_TDM);
> +			ma5311->dai_o_format =3D MA5311_TOP_MAN1_O_FORMAT_TDM;
> +
> +			if (!ma5311->flag_dai_tdm) {
> +				regmap_update_bits(ma5311->ctrl_regmap,
> +						   MA5311_DAC_38_TDM2,
> +						   MA5311_ADC_TDM2_SETTING_MASK,
> +						   MA5311_DAC_38_CAPTURE_8CH_CFG);
> +				ma5311->dai_tdm2_capture_cfg =3D MA5311_DAC_38_CAPTURE_8CH_CFG;
> +
> +				regmap_write(ma5311->ctrl_regmap,
> +					     MA5311_DAC_39_DATA_PATH, MA5311_ADC_DATA_PATH_TDM_8CH);
> +				ma5311->dai_data_path =3D MA5311_ADC_DATA_PATH_TDM_8CH;
> +
> +				regmap_write(ma5311->ctrl_regmap,
> +					     MA5311_DAC_3A_TDM_SLOT_ENABLE,
> +					     MA5311_TDM_SLOT_ENABLE_ALL);
> +				ma5311->dai_tdm_slot_enable =3D MA5311_TDM_SLOT_ENABLE_ALL;
> +			}
> +
> +			break;

[Severity: Medium]
Does gating the TDM capture register setup on !ma5311->flag_dai_tdm leave
all TX TDM slots disabled if ma5311_dai_set_tdm_slot() was called with
tx_mask =3D=3D 0?

ma5311_dai_set_tdm_slot() only configures MA5311_DAC_38_TDM2,
MA5311_DAC_39_DATA_PATH, and MA5311_DAC_3A_TDM_SLOT_ENABLE when tx_mask is
GENMASK(7, 0), yet it sets ma5311->flag_dai_tdm =3D true unconditionally.
Similarly, I2S capture in ma5311_dai_hw_params() writes
MA5311_ADC_DATA_PATH_I2S and MA5311_TDM_SLOT_DISABLE_ALL without clearing
flag_dai_tdm, so a subsequent DSP_A capture session also skips enabling
the TDM data path and TX slots.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ma5311_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +	case SND_SOC_DAIFMT_DSP_A:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +	case SND_SOC_DAIFMT_NB_IF:
> +	case SND_SOC_DAIFMT_IB_NF:
> +	case SND_SOC_DAIFMT_IB_IF:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +	case SND_SOC_DAIFMT_DSP_A:
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}

[Severity: Low]
This second switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) block duplicates the
check at the start of ma5311_dai_set_fmt().

[ ... ]

> +static int ma5311_dai_set_tdm_slot(struct snd_soc_dai *dai,
> +				   unsigned int tx_mask, unsigned int rx_mask,
> +				   int slots, int slot_width)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int rx_val =3D MA5311_TDM_SLOT0_RX_POS_0 |
> +			      MA5311_TDM_SLOT1_RX_POS_1;
> +	int ret;

[ ... ]

> +	switch (rx_mask) {
> +	case 0:
> +		break;
> +
> +	case BIT(0) | BIT(1):
> +		rx_val =3D MA5311_TDM_SLOT0_RX_POS_0 |
> +			 MA5311_TDM_SLOT1_RX_POS_1;
> +		break;

[ ... ]

> +	ret =3D regmap_update_bits(ma5311->ctrl_regmap,
> +				 MA5311_DAC_37_TDM1,
> +				 MA5311_TDM_SLOT0_RX_POS_MASK |
> +				 MA5311_TDM_SLOT1_RX_POS_MASK,
> +				 rx_val);
> +	if (ret)
> +		return ret;
> +
> +	ma5311->dai_tdm1_rx_pos =3D rx_val;

[Severity: Medium]
When rx_mask is 0, does ma5311_dai_set_tdm_slot() unintentionally reset
MA5311_DAC_37_TDM1 and ma5311->dai_tdm1_rx_pos to Slot01?

rx_val is initialized to MA5311_TDM_SLOT0_RX_POS_0 |
MA5311_TDM_SLOT1_RX_POS_1, and case 0 breaks out of switch (rx_mask)
before unconditionally writing rx_val to MA5311_DAC_37_TDM1, clobbering
any previously configured RX slots when a caller only wants to configure
tx_mask.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127090707.3893=
62-1-hyunuk.son@irondevice.com?part=3D2
