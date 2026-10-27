Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094875;
	b=lYDNdX/EeNmrwinKOraRl/5b+p69eJrBebu8WloHw4QdRusdb/KUpdM/2p7uUPztSgRI
	 9eBn0FyrYkdZ32Qci7qMZKsnEhXgPn3uqt6ccxGXu2Ea2B9xFZvD61qSNDqU7YG9p2WBr
	 KfNtdTpIFAya3xsy1RGngZZ3xIHXEmNE7UQ1MtKuSMmG/ieK+QAXZxrNh1ljCVwwSTcN3
	 ECB5JUn1AF6R86NiNzgyycQUFCNhI+eWjZhRQdlWVHR4VAfmeR4LVOs7dYIR/PILcRTgz
	 l/S4fLwUEloF8hgNVUo2rSDWx9NKJ+arEMvLB/iyQn8KQDtcWN0uNV6xuchRxcvtD6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094875;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=omcOoal/UgPkZrp7oQdJpKjriud8YOHQ4YfFD1RKRYQ=;
	b=Xg8BNXutfbpmuZAKVT/oiG/NgNK/vxQ3xcGr/lWbqfxYZzP/6n56DVPt50UMcWwpBPBw
	 1+NfhDQIe/ZveuzzhW9E8ZvpTnnBFS2956oVm05CaC6T77C37Fbeu9H1OTa03jRWPcaRk
	 k73Ri7zCAnIQAH6Z+01WLndWy66wdPO00U48c+F+E6S8AqGlyOVy7+F2n1vyuEOQJ7kZM
	 Z9yKz9R1Xg/TDAOjGzDTRUEnT7LRiuwjH02p4SSfvmovj06ywSnIYaUHch6XnqojBQ5yJ
	 po9ngrPZDIxc0s1mgawaewA9XOBQQwH1luA4+sfs+5BLP7qp7PeMOGFCiR6WK+3yZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejEch136;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70D606A31B;
	Tue, 27 Oct 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejEch136
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229711F01825;
	Tue, 27 Oct 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094874;
	bh=omcOoal/UgPkZrp7oQdJpKjriud8YOHQ4YfFD1RKRYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejEch1362/7FbPhOgEgWLPhfaPGKLEUZQUj28fNhpzhlv2z7jzHa2q46EZMcSjQGL
	 MARh+eD+M547vqjtnzpMFd+p8VJsgQtETHu5hLJSCMnmmDVNT/FNPVnyOiMZOywSxS
	 6uC3STVL/+1880HYAbokVYQwydixMX8JLURSQOagmhsXHMpuiX/S2ffBkm9Xt5vsNC
	 RrKZl4s7M5Dr185EkpHkv7fUDOZJ6pl6UuJG7HGoEfu/kFD34DS389HXxRsXJTmHtO
	 j9yYEI8AjEQElQhJCUCshyiRplh7vWphoKelySIyKamMx3Rgk8evQcoJ/3KhdEZvNh
	 zR2XlaWAB7EYw==
Message-ID: <sashiko-outbox-186341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunuk Son" <hyunuk.son@irondevice.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027093232.859755-3-hyunuk.son@irondevice.com>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 09:54:33 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] ASoC: ma5311: ma5311_irq_thread() does not clear fault or return I=
RQ_NONE
- [Medium] ASoC: ma5311: unchecked regmap calls in ADC PGA control get/put =
callbacks
- [Medium] ASoC: ma5311: bitfield overflow and uninhibited TDM regs in capt=
ure_mode_put()
- [Medium] ASoC: ma5311: missing I2S case in ma5311_playback_mode_put()
- [Medium] ASoC: ma5311: broken RSTN Switch control and state loss in ma531=
1_reset()
- [Medium] ASoC: ma5311: integer truncation before bounds check in ADC put =
callbacks
- [Medium] ASoC: ma5311: broken speaker mode update and PMU order in ma5311=
_aif_in_event()
- [Medium] ASoC: ma5311: missing register writes for TDM slots, sysclk, and=
 ADC rate
- [Medium] ASoC: ma5311: broken I2S mono BCLK calculation and 96kHz 8ch PLL=
 lookup
- [Low] ASoC: ma5311: invalid reg_defaults with REGCACHE_NONE and unsorted =
defaults
--

commit b66c1b240eead610149979ef5c3fc3dd398f1c55
Author: Hyunuk Son <hyunuk.son@irondevice.com>

ASoC: codecs: Add driver for Iron Device MA5311

This commit adds an ASoC codec driver for the Iron Device MA5311 audio code=
c,
supporting playback and capture over I2S and TDM interfaces with regmap-bas=
ed
register access and ALSA mixer controls.

> diff --git a/sound/soc/codecs/ma5311.c b/sound/soc/codecs/ma5311.c
> new file mode 100644
> index 0000000000000..31b79f1154cf2
> --- /dev/null
> +++ b/sound/soc/codecs/ma5311.c

[ ... ]

> +static int ma5311_adc_volume_control_put(struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =3D
> +		(const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int val =3D ucontrol->value.integer.value[0];
> +	unsigned int *cache;
> +	int ret;
> +
> +	if (val > MA5311_ADC_VOL_CTRL_MASK)
> +		return -EINVAL;

[Severity: Medium]
In both ma5311_adc_volume_control_put() and ma5311_adc_pga_control_put(),
ucontrol->value.integer.value[0] (which is a signed long) is assigned to an
unsigned int before checking whether it is within the valid range.

On 64-bit platforms, if userspace passes a negative or 64-bit out-of-range
value whose lower 32 bits fall within 0..MA5311_ADC_VOL_CTRL_MASK (for
example, LONG_MIN, which truncates to 0), won't this bypass the bounds check
and write the truncated value to the hardware register instead of returning
-EINVAL?

[ ... ]

> +static int ma5311_adc_pga_control_get(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =3D
> +		(const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int *cache =3D ma5311_adc_pga_control_cache(ma5311, mc->reg);
> +	unsigned int val;
> +
> +	if (!cache)
> +		return -EINVAL;
> +
> +	regmap_read(ma5311->adc_regmap, mc->reg, &val);
> +
> +	ucontrol->value.integer.value[0] =3D val & MA5311_ADC_PGA_CTRL_MASK;
> +	*cache =3D ucontrol->value.integer.value[0];
> +
> +	return 0;
> +}
> +
> +static int ma5311_adc_pga_control_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =3D
> +		(const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int *cache;
> +	unsigned int val =3D ucontrol->value.integer.value[0];
> +
> +	if (val > MA5311_ADC_PGA_CTRL_MASK)
> +		return -EINVAL;
> +
> +	cache =3D ma5311_adc_pga_control_cache(ma5311, mc->reg);
> +	if (!cache) {
> +		dev_err(ma5311->dev, "%s: Invalid Control ID - %s\n", __func__,
> +			kcontrol->id.name);
> +		return -EINVAL;
> +	}
> +
> +	if (*cache =3D=3D val)
> +		return 0;
> +
> +	regmap_update_bits(ma5311->adc_regmap, mc->reg,
> +			   MA5311_ADC_PGA_CTRL_MASK, val);
> +
> +	*cache =3D val;
> +
> +	return 1;
> +}

[Severity: Medium]
Should the return values of regmap_read() in ma5311_adc_pga_control_get() a=
nd
regmap_update_bits() in ma5311_adc_pga_control_put() be checked like they a=
re
in ma5311_adc_volume_control_get() and ma5311_adc_volume_control_put()?

Because ma5311->adc_regmap uses REGCACHE_NONE, an I2C read failure in
ma5311_adc_pga_control_get() leaves val uninitialized on the stack, copying
uninitialized stack bits to ucontrol->value.integer.value[0] and *cache.

Similarly, if regmap_update_bits() fails in ma5311_adc_pga_control_put(),
updating *cache =3D val causes the cached state to diverge from the hardware
register and prevents subsequent retries of the same value due to the
*cache =3D=3D val check.

[ ... ]

> +static int ma5311_capture_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{

[ ... ]

> +	switch (val) {
> +	case I2S_ADC1:
> +		regmap_write(ma5311->ctrl_regmap,
> +			     MA5311_DAC_39_DATA_PATH,
> +			     MA5311_DATA_PATH_I2S_ADC1);
> +		break;
> +
> +	case I2S_ADC2:
> +		regmap_write(ma5311->ctrl_regmap,
> +			     MA5311_DAC_39_DATA_PATH,
> +			     MA5311_DATA_PATH_I2S_ADC2);
> +		break;
> +
> +	case I2S_ADC3:
> +		regmap_write(ma5311->ctrl_regmap,
> +			     MA5311_DAC_39_DATA_PATH,
> +			     MA5311_DATA_PATH_I2S_ADC3);
> +		break;
> +
> +	case I2S_ADC4:
> +		regmap_write(ma5311->ctrl_regmap,
> +			     MA5311_DAC_39_DATA_PATH,
> +			     MA5311_DATA_PATH_I2S_ADC4);
> +		break;
> +
> +	case TDM_8CH:
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_38_TDM2,
> +				   MA5311_ADC_TDM2_SETTING_MASK,
> +				   MA5311_DAC_38_CAPTURE_8CH_CFG);
> +		regmap_write(ma5311->ctrl_regmap,
> +			     MA5311_DAC_39_DATA_PATH, MA5311_DATA_PATH_TDM_8CH);
> +		regmap_write(ma5311->ctrl_regmap,
> +			     MA5311_DAC_3A_TDM_SLOT_ENABLE,
> +			     MA5311_TDM_SLOT_ENABLE_ALL);
> +		break;
> +	}
> +
> +	regmap_update_bits(ma5311->ctrl_regmap, MA5311_DAC_39_DATA_PATH,
> +			   MA5311_DAC_SDO_DATA_PATH_MASK, val << 2);
> +
> +	regmap_update_bits(ma5311->ctrl_regmap, MA5311_DAC_91_ADC_DAC_MIX,
> +			   MA5311_DAC_ADC_DAC_MIX_CH_MASK, val);

[Severity: Medium]
When val is TDM_8CH (4), doesn't passing val << 2 (0x10) with
MA5311_DAC_SDO_DATA_PATH_MASK (GENMASK(3, 2)) and val (0x04) with
MA5311_DAC_ADC_DAC_MIX_CH_MASK (GENMASK(1, 0)) overflow both 2-bit masks and
clear those fields to 0?

Also, in the TDM_8CH case, MA5311_DAC_38_CAPTURE_8CH_CFG (0xc1) has bit 7 s=
et,
which is outside MA5311_ADC_TDM2_SETTING_MASK (GENMASK(6, 0)). And if the
control is switched from TDM_8CH back to one of I2S_ADC1..I2S_ADC4, shouldn=
't
MA5311_DAC_38_TDM2 and MA5311_DAC_3A_TDM_SLOT_ENABLE be restored as well?

[ ... ]

> +static int ma5311_playback_mode_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{

[ ... ]

> +	switch (val) {
> +	case TDM01:
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_37_TDM1,
> +				   MA5311_TDM_SLOT0_RX_POS_MASK,
> +				   MA5311_TDM_SLOT0_RX_POS_0);
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_37_TDM1,
> +				   MA5311_TDM_SLOT1_RX_POS_MASK,
> +				   MA5311_TDM_SLOT1_RX_POS_1);
> +		break;

[ ... ]

> +	case TDM67:
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_37_TDM1,
> +				   MA5311_TDM_SLOT0_RX_POS_MASK,
> +				   MA5311_TDM_SLOT0_RX_POS_6);
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_37_TDM1,
> +				   MA5311_TDM_SLOT1_RX_POS_MASK,
> +				   MA5311_TDM_SLOT1_RX_POS_7);
> +		break;
> +	}
> +
> +	ma5311->playback_mode =3D val;
> +
> +	return 1;
> +}

[Severity: Medium]
What happens in ma5311_playback_mode_put() when switching from one of the T=
DM
modes back to I2S (val =3D=3D I2S)? Since switch (val) has no case I2S,
ma5311->playback_mode is updated to I2S, but MA5311_DAC_37_TDM1 is left with
the previous TDM slot configuration.

> +
> +static int ma5311_reset_control_get(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +
> +	if (!ma5311->reset_gpio)
> +		return -ENODEV;
> +
> +	/* Do not persist a reset request when ALSA saves the mixer state. */
> +	ucontrol->value.enumerated.item[0] =3D 0;
> +
> +	return 0;
> +}
> +
> +static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =3D
> +		snd_soc_component_to_dapm(component);
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +	int ret;
> +
> +	if (!val)
> +		return 0;
> +
> +	if (!ma5311->reset_gpio)
> +		return -ENODEV;

[ ... ]

> +	ret =3D ma5311_reset(component);
> +
> +unlock:
> +	snd_soc_dapm_mutex_unlock(dapm);
> +	snd_soc_dpcm_mutex_unlock(component->card);
> +
> +	if (ret)
> +		return ret;
> +
> +	return 1;
> +}

[Severity: Medium]
There are a few issues around the "RSTN Switch" control and ma5311_reset():

1. Since reset_gpio is optional (acquired via devm_gpiod_get_optional()),
returning -ENODEV in ma5311_reset_control_get() when reset_gpio is NULL cau=
ses
userspace tools that read all mixer controls (such as alsactl, amixer, or
kselftest mixer-test) to fail on boards without a reset GPIO. Also, in ALSA
control naming conventions, the " Switch" suffix is reserved for boolean
controls, whereas this is an enumerated control.

2. ma5311_reset_control_put() does not check whether val >=3D
ARRAY_SIZE(ma5311_reset_text), so any out-of-range enum value triggers a
hardware reset instead of returning -EINVAL.

3. When ma5311_reset() runs after a runtime reset, it overwrites all regist=
ers
with ma5311_ctrl_reg_def, including MA5311_DAC_01_INPUT1_CTRL1 (wiping the =
DAI
clock provider/consumer role and clock polarity configured by
ma5311_dai_set_fmt()) and MA5311_DAC_37_TDM1, without restoring the DAI for=
mat
or resetting ma5311->playback_mode, ma5311->dapm_aif_in, and
ma5311->amp_mode. Doesn't this leave the driver state out of sync with the
hardware after a reset?

[ ... ]

> +static int ma5311_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D
> +		snd_soc_dapm_kcontrol_to_dapm(kcontrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +	unsigned int old_val =3D ma5311->dapm_aif_in;
> +	int ret;
> +
> +	if (val >=3D ARRAY_SIZE(ma5311_aif_in_source_text)) {
> +		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (ma5311->dapm_aif_in =3D=3D val)
> +		return 0;
> +
> +	ma5311->dapm_aif_in =3D val;
> +
> +	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> +	if (ret < 0) {
> +		ma5311->dapm_aif_in =3D old_val;
> +		return ret;
> +	}
> +
> +	return 1;
> +}

[ ... ]

> +static int ma5311_aif_in_event(struct snd_soc_dapm_widget *w,
> +			       struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int mux =3D ma5311->dapm_aif_in;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		switch (mux) {
> +		case MA5311_MONO_BOTH_MODE:
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_10_SYSTEM_CTRL3,
> +					   MA5311_SPK_MODE_MASK,
> +					   MA5311_SPK_MONO_BOTH);
> +			break;
> +		case MA5311_STEREO_MODE:
> +			regmap_update_bits(ma5311->ctrl_regmap,
> +					   MA5311_DAC_10_SYSTEM_CTRL3,
> +					   MA5311_SPK_MODE_MASK,
> +					   MA5311_SPK_STEREO);
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
> +
> +static int ma5311_power_event(struct snd_soc_dapm_widget *w,
> +			      struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		return ma5311_startup(component);
> +	case SND_SOC_DAPM_PRE_PMD:
> +		return ma5311_shutdown(component);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Both inputs of the "AIF IN Source" mux ("Mono Both" and "Stereo") come from
the same "AIF IN" widget. If a user changes "AIF IN Source" via
ma5311_dapm_aif_in_put() while playback is already active, the mux widget
remains powered and SND_SOC_DAPM_PRE_PMU will not fire, so
MA5311_DAC_10_SYSTEM_CTRL3 and ma5311->amp_mode are never updated.

In addition, when playback starts from power-down, DAPM runs all PRE_PMU
callbacks before POST_PMU callbacks. Doesn't that mean ma5311_aif_in_event()
enables the speaker mode in MA5311_DAC_10_SYSTEM_CTRL3 at PRE_PMU before
ma5311_power_event() calls ma5311_startup() at POST_PMU to turn on the PLL =
and
system power?

[ ... ]

> +static const struct regmap_config ma5311_ctrl_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +
> +	.max_register =3D MA5311_DAC_FF_VERSION,
> +	.readable_reg =3D ma5311_ctrl_readable_register,
> +	.writeable_reg =3D ma5311_ctrl_writeable_register,
> +	.volatile_reg =3D ma5311_ctrl_volatile_register,
> +
> +	.cache_type =3D REGCACHE_NONE,
> +	.reg_defaults =3D ma5311_ctrl_reg_def,
> +	.num_reg_defaults =3D ARRAY_SIZE(ma5311_ctrl_reg_def),
> +};
> +
> +static const struct regmap_config ma5311_adc_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +
> +	.max_register =3D MA5311_ADC_CH4_3F_OUTPUT_FORMAT,
> +	.readable_reg =3D ma5311_adc_readable_register,
> +	.writeable_reg =3D ma5311_adc_writeable_register,
> +	.volatile_reg =3D ma5311_adc_volatile_register,
> +
> +	.cache_type =3D REGCACHE_NONE,
> +	.reg_defaults =3D ma5311_adc_reg_def,
> +	.num_reg_defaults =3D ARRAY_SIZE(ma5311_adc_reg_def),
> +};

[Severity: Low]
Both ma5311_ctrl_regmap_config and ma5311_adc_regmap_config set .cache_type=
 =3D
REGCACHE_NONE while also providing .reg_defaults and .num_reg_defaults, whi=
ch
causes regcache_init() to emit a "No cache used with register defaults set!"
warning on every probe.

Also, in ma5311_ctrl_reg_def, register 0x91 is placed before 0x8A..0x8F:

	{ 0x89, 0x00 },
	{ 0x91, 0x00 },
	{ 0x8A, 0x00 },

Should .reg_defaults be dropped when using REGCACHE_NONE (or a cache type
enabled with 0x91 sorted in ascending order)?

[ ... ]

> +static int ma5311_dai_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int bclk =3D 0;
> +	int ret;
> +
> +	switch (params_rate(params)) {
> +	case 48000:
> +	case 96000:
> +		break;
> +
> +	default:
> +		dev_err(component->dev, "%s: unsupported sample rate: %u\n",
> +			__func__, params_rate(params));
> +
> +		return -EINVAL;
> +	}
> +
> +	if (params_channels(params) > 8) {
> +		dev_err(component->dev, "%s: unsupported channel count: %u\n",
> +			__func__, params_channels(params));
> +
> +		return -EINVAL;
> +	}
> +
> +	if (ma5311->format =3D=3D SND_SOC_DAIFMT_DSP_A) {
> +		if (!ma5311->frame_size) {
> +			dev_err(component->dev,
> +				"TDM frame size is not configured\n");
> +			return -EINVAL;
> +		}
> +
> +		bclk =3D params_rate(params) * ma5311->frame_size;
> +		dev_dbg(component->dev, "Estimated TDM BCLK: %u Hz\n", bclk);
> +	} else if (ma5311->format =3D=3D SND_SOC_DAIFMT_I2S) {
> +		bclk =3D params_rate(params) * params_physical_width(params) *
> +		       params_channels(params);
> +		dev_dbg(component->dev, "Estimated I2S BCLK: %u Hz\n", bclk);
> +	}

[Severity: Medium]
ma5311_dai advertises channels_min =3D 1, channels_max =3D 8, rates 48000 a=
nd
96000, and formats S16_LE and S32_LE.

In I2S mode, the bus frame always has 2 slots (matching the 32fs and 64fs S=
CK
rates configured below), so when params_channels(params) =3D=3D 1, doesn't
multiplying by params_channels(params) compute half the actual BCLK frequen=
cy
(for example, 768 kHz at 48 kHz 16-bit, which fails in ma5311_setup_pll(), =
or
1.536 MHz instead of 3.072 MHz at 48 kHz 32-bit)?

Also, for a 96 kHz, 8-channel/8-slot, 32-bit stream, bclk is 24576000 Hz,
which has no entry in ma5311_pll_matches (max 12288000 Hz) and will always
fail in ma5311_setup_pll() with -EINVAL.

[ ... ]

> +static int ma5311_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
> +				 unsigned int freq, int dir)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +
> +	switch (clk_id) {
> +	case MA5311_EXTERNAL_CLOCK_19_2:
> +	case MA5311_EXTERNAL_CLOCK_24_576:
> +	case MA5311_PLL_CLKIN_MCLK:
> +	case MA5311_PLL_CLKIN_BCLK:
> +		if (clk_id =3D=3D MA5311_PLL_CLKIN_BCLK)
> +			dev_dbg(component->dev, "PLL input: BCLK\n");
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Invalid clk id: %d\n", __func__,
> +			clk_id);
> +		return -EINVAL;
> +	}
> +
> +	ma5311->sys_clk_id =3D clk_id;
> +
> +	return 0;
> +}
> +
> +static int ma5311_dai_set_tdm_slot(struct snd_soc_dai *dai,
> +				   unsigned int tx_mask, unsigned int rx_mask,
> +				   int slots, int slot_width)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +
> +	/* Reject invalid frame geometry before changing the hardware. */
> +	switch (slot_width) {
> +	case 16:
> +	case 32:
> +		break;
> +
> +	default:
> +		dev_err(component->dev, "%s: unsupported TDM slot width: %d\n",
> +			__func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	switch (slots) {
> +	case 4:
> +	case 8:
> +		break;
> +
> +	default:
> +		dev_err(component->dev, "%s: unsupported TDM slot count: %d\n",
> +			__func__, slots);
> +		return -EINVAL;
> +	}
> +
> +	ma5311->frame_size =3D slot_width * slots;
> +	dev_dbg(component->dev, "TDM slots=3D%d width=3D%d\n", slots, slot_widt=
h);
> +
> +	return 0;
> +}

[Severity: Medium]
Several hardware configuration fields defined in ma5311.h are never written=
 to
the device registers:

1. ma5311_dai_set_tdm_slot() validates slots (4 or 8), but never updates
MA5311_TDM_N_SLOT_MASK (MA5311_TDM_N_SLOT_4 vs MA5311_TDM_N_SLOT_8) in
MA5311_DAC_38_TDM2.

2. ma5311_dai_set_sysclk() accepts MA5311_EXTERNAL_CLOCK_19_2,
MA5311_EXTERNAL_CLOCK_24_576, and MA5311_PLL_CLKIN_MCLK, but ignores freq a=
nd
never writes any clock selection registers, while ma5311_setup_pll() only
configures the PLL when sys_clk_id =3D=3D MA5311_PLL_CLKIN_BCLK.

3. ma5311_dai_hw_params() accepts both 48000 and 96000 Hz, but never updates
MA5311_ADC_SAMPLE_RATE_MASK (MA5311_ADC_SAMPLE_RATE_48K vs
MA5311_ADC_SAMPLE_RATE_96K) in the ADC general setting registers, leaving a=
ll
four ADCs hardcoded to the 96 kHz default (0xA5).

Should these register fields be programmed when configuring the DAI?

[ ... ]

> +static irqreturn_t ma5311_irq_thread(int irq, void *data)
> +{
> +	struct ma5311_priv *ma5311 =3D data;
> +	unsigned int dac_status;
> +	int ret =3D 0;
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EA_DAC_STATUS, &dac_status);
> +	if (ret) {
> +		dev_err_ratelimited(ma5311->dev,
> +				    "I2C Read Failed During Interrupt Handling\n");
> +		return IRQ_NONE;
> +	}
> +
> +	if (dac_status & MA5311_DAC_EA_FAULT_MASK)
> +		dev_err_ratelimited(ma5311->dev, "FAULT Asserted\n");
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
ma5311_irq_thread() is registered as a threaded oneshot handler for the
active-low level-triggered INTN interrupt, but it only reads
MA5311_DAC_EA_DAC_STATUS, logs a message if MA5311_DAC_EA_FAULT_MASK is set,
and unconditionally returns IRQ_HANDLED without clearing or recovering from
the fault condition.

When INTN is asserted low, won't unmasking the level-triggered interrupt li=
ne
after ma5311_irq_thread() returns IRQ_HANDLED cause an immediate re-interru=
pt
and an unbounded interrupt and I2C read storm (and bypass spurious IRQ
detection when no fault bit is set)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027093232.8597=
55-1-hyunuk.son@irondevice.com?part=3D2
