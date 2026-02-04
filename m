Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2626E718
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212981; cv=none; b=sj8cnv9QaDM4V25xqaJ4trbXgnqTdwe0DHStbKigEUTiJgcczDOkQ/dP5O4/M8UE/Xy+0qQjz6iSB1iDs03uG26nYd5dYhFKuQ0FtIyNSEAF2Y91K9xYyvXULoBvMhGSYOE2BpYC44UhtlFRsCcRkc3wsunOuWbXBtZteBm/IeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212981; c=relaxed/simple;
	bh=cftIPoB+UitYaDkZi5mVx7tw8Z51sBuEEOK6fXFE5pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4iR8kmYC8/NSZ4ExiNTj9Lf3DJfa17TJZ3j2Yv2aqXelm4Et9adP6XDI0NyCf1fT7JPkhHLjnLXB1NTKDYoEnGqEzoK8B/6lu0DRS/5slMR/i0R6R6o++J+jZeXfgwEKWVfSghOR8yzfG9T1c/ojDLKf9p+bjvYknxQYayg2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hMPCEXDX; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hMPCEXDX"
Message-ID: <1e628681-15e7-4ea8-a45c-18548f17692d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770212979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsIySk0v4Nw+ZTluzowt9+vogjrLD6xcPcs3VcRNhuA=;
	b=hMPCEXDXA+7RwVphwdR+G4S0XU6AFnp95B8wFmPOIUY7USIZJm4lPld18NVFOpcn62MaJg
	8P/9pjCLiqy5jFfDbmDumcR5Eg86b9Pg+tFkBL1RnBqpi0NI7cQ8yUV/tiMMck+pJkG8kd
	RoS35Oz0qkVDeFsysjNBegLO2VH7HC8=
Date: Wed, 4 Feb 2026 14:47:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260204094452.33289-1-zhangyi@everest-semi.com>
 <20260204094452.33289-5-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260204094452.33289-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
> new file mode 100644
> index 000000000..5e90f6be6
> --- /dev/null
> +++ b/sound/soc/codecs/es9356.c
> @@ -0,0 +1,1483 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// es9356.c -- SoundWire codec driver
> +//
> +// Copyright(c) Everest Semiconductor Co., Ltd

Usually the copyright line includes a date. Please check with your lawyers.

> +//
> +//
> +
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <linux/pm_runtime.h>
> +#include <sound/sdw.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/tlv.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <sound/jack.h>
> +#include "es9356.h"
> +
> +struct  es9356_sdw_priv {
> +	struct sdw_slave *slave;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct snd_soc_component *component;
> +	struct snd_soc_jack *hs_jack;
> +
> +	struct mutex lock;
> +	struct mutex disable_irq_lock;

best to describe what those mutexes do. Looks like a lot of copy-paste from other codec drivers to me.

> +	bool hw_init;
> +	bool first_hw_init;
> +	int jack_type;
> +
> +	struct delayed_work jack_detect_work;
> +	struct delayed_work button_detect_work;
> +	unsigned int sdca_status;
> +};
> +
> +static int es9356_sdw_component_probe(struct snd_soc_component *component)
> +{
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +
> +	es9356->component = component;
> +
> +	return 0;
> +}
> +
> +static int es9356_sdca_set_gain_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned int regv = 0;
> +	unsigned int gain = 0;
> +	int ret, changed = 0;
> +
> +	ret = pm_runtime_get_sync(&es9356->slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	if (ucontrol->value.integer.value[0] > mc->max) {
> +		changed = -EINVAL;
> +		goto out;
> +	}
> +
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &regv);
> +	regv /= 6;

what is this 6?

> +	if (regv != ucontrol->value.integer.value[0])
> +		changed = 1;
> +	else
> +		goto out;
> +
> +	regv = 6 * ucontrol->value.integer.value[0];

same, what is this 6?

> +	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), regv);
> +	regmap_write(es9356->regmap, mc->reg, 0x00);
> +
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &gain);
> +
> +out:
> +	if (ret >= 0) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +		pm_runtime_put_autosuspend(&es9356->slave->dev);
> +	} else if (ret == -EACCES) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +	}
> +
> +	if (regv == gain)
> +		return changed;
> +
> +	return -EIO;
> +}
> +
> +static int es9356_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int regv;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(&es9356->slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &regv);
> +
> +	if (ret >= 0) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +		pm_runtime_put_autosuspend(&es9356->slave->dev);
> +	} else if (ret == -EACCES) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +	}
> +
> +	ucontrol->value.integer.value[0] = regv / 6;
> +	return 0;
> +}
> +
> +static int es9356_sdca_set_volume_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned int ctl_l = 0, ctl_r = 0;
> +	u8 gain_l_val, gain_ll_val;
> +	u8 gain_r_val, gain_rl_val;
> +	unsigned int read_l, read_r, read_ll, read_rl;
> +	unsigned int changed = 0;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(&es9356->slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	ctl_l = ucontrol->value.integer.value[0] - 768;
> +	ctl_r = ucontrol->value.integer.value[1] - 768;
> +
> +	gain_l_val = (ctl_l & 0x07F8) >> 3;
> +	gain_ll_val = (ctl_l & 0x0007) << 5;
> +	gain_r_val = (ctl_r & 0x07F8) >> 3;
> +	gain_rl_val = (ctl_r & 0x0007) << 5;

more magic values, consider using inline or macros to get/set gains.

> +
> +	regmap_read(es9356->regmap, mc->reg, &read_ll);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
> +	regmap_read(es9356->regmap, mc->rreg, &read_rl);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
> +
> +	if (gain_ll_val != read_ll || gain_rl_val != read_rl
> +		|| gain_l_val != read_l || gain_r_val != read_r)
> +		changed = 1;
> +	else
> +		goto out;
> +
> +	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), gain_l_val);
> +	regmap_write(es9356->regmap, mc->reg, gain_ll_val);
> +	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), gain_r_val);
> +	regmap_write(es9356->regmap, mc->rreg, gain_rl_val);
> +
> +	regmap_read(es9356->regmap, mc->reg, &read_ll);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
> +	regmap_read(es9356->regmap, mc->rreg, &read_rl);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
> +
> +out:
> +	if (ret >= 0) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +		pm_runtime_put_autosuspend(&es9356->slave->dev);
> +	} else if (ret == -EACCES) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +	}
> +
> +	if (gain_ll_val == read_ll && gain_rl_val == read_rl
> +		&& gain_l_val == read_l && gain_r_val == read_r) {
> +		return changed;
> +	}
> +	return -EIO;
> +}
> +
> +static int es9356_sdca_set_volume_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int read_l, read_r, read_ll, read_rl;
> +	int16_t ctl_l = 0, ctl_r = 0;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(&es9356->slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	regmap_read(es9356->regmap, mc->reg, &read_ll);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
> +	regmap_read(es9356->regmap, mc->rreg, &read_rl);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
> +
> +	ctl_l = ((int16_t)(read_l << 8 | read_ll)) >> 5;
> +	ctl_r = ((int16_t)(read_r << 8 | read_rl)) >> 5;
> +
> +	ucontrol->value.integer.value[0] = ctl_l + 768;
> +	ucontrol->value.integer.value[1] = ctl_r + 768;

same here, can this use macros?

> +
> +	if (ret >= 0) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +		pm_runtime_put_autosuspend(&es9356->slave->dev);
> +	} else if (ret == -EACCES) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -9600, 12, 0);
> +static const DECLARE_TLV_DB_SCALE(amic_gain_tlv, 0, 3, 0);
> +static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 6, 0);
> +
> +static const struct snd_kcontrol_new es9356_sdca_controls[] = {
> +	/* Headphone playback settings */
> +	SOC_DOUBLE_R_EXT_TLV("FU41 Playback Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
> +		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
> +	/* Headset mic capture settings */
> +	SOC_DOUBLE_R_EXT_TLV("FU36 Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
> +		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
> +	SOC_SINGLE_EXT_TLV("FU33 Capture Gain",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33,
> +			ES9356_SDCA_CTL_FU_CH_GAIN, 0), 0, 0x0a, 0,
> +		es9356_sdca_set_gain_get, es9356_sdca_set_gain_put, amic_gain_tlv),
> +	/* SPK playback settings */
> +	SOC_DOUBLE_R_EXT_TLV("FU21 Playback Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
> +		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
> +	/* Dmic capture settings */
> +	SOC_DOUBLE_R_EXT_TLV("FU113 Capture Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_L),
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113,
> +			ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x41F, 0,
> +		es9356_sdca_set_volume_get, es9356_sdca_set_volume_put, out_vol_tlv),
> +	SOC_SINGLE_EXT_TLV("FU11 Capture Gain",
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11,
> +			ES9356_SDCA_CTL_FU_CH_GAIN, 0), 0, 0x03, 0,
> +		es9356_sdca_set_gain_get, es9356_sdca_set_gain_put, dmic_gain_tlv),
> +};

Shouldn't the default settings depend on an initialization using tables extracted from ACPI tables?
Volume settings are usually platform dependent, no?

> +
> +static const char *const es9356_left_mux_txt[] = {
> +	"From Left",
> +	"From Right",
> +};
> +
> +static const char *const es9356_right_mux_txt[] = {
> +	"From Right",
> +	"From Left",
> +};
> +
> +static const struct soc_enum es9356_left_mux_enum =
> +	SOC_ENUM_SINGLE(ES9356_DAC_SWAP, 1,
> +			ARRAY_SIZE(es9356_left_mux_txt), es9356_left_mux_txt);
> +static const struct soc_enum es9356_right_mux_enum =
> +	SOC_ENUM_SINGLE(ES9356_DAC_SWAP, 0,
> +			ARRAY_SIZE(es9356_right_mux_txt), es9356_right_mux_txt);
> +
> +static const struct snd_kcontrol_new es9356_left_mux_controls =
> +	SOC_DAPM_ENUM("Channel MUX", es9356_left_mux_enum);
> +static const struct snd_kcontrol_new es9356_right_mux_controls =
> +	SOC_DAPM_ENUM("Channel MUX", es9356_right_mux_enum);
> +
> +static void es9356_pde_transition_delay(struct es9356_sdw_priv *es9356, unsigned char func,
> +	unsigned char entity, unsigned char ps)
> +{
> +	unsigned int delay = 1000, val;

it's not really a delay, more a loop counter.
> +
> +	pm_runtime_mark_last_busy(&es9356->slave->dev);
> +
> +	/* waiting for Actual PDE becomes to PS0/PS3 */
> +	while (delay) {
> +		regmap_read(es9356->regmap,
> +			SDW_SDCA_HCTL(func, entity, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
> +		if (val == ps)
> +			break;
> +
> +		usleep_range(1000, 1500);
> +		delay--;
> +	}
> +	if (!delay) {
> +		dev_warn(&es9356->slave->dev, "%s PDE to %s is NOT ready", __func__, ps?"PS3":"PS0");
> +	}
> +}

...

> +static int es9356_sdca_button(unsigned int *buffer)
> +{
> +	static int cur_button;
> +
> +	if (*(buffer + 1) | *(buffer + 2))
> +		return -EINVAL;

what does this test verify?

> +	switch (*buffer) {
> +	case 0x00:
> +		cur_button = 0;
> +		break;
> +	case 0x20:
> +		cur_button = SND_JACK_BTN_5;
> +		break;
> +	case 0x10:
> +		cur_button = SND_JACK_BTN_3;
> +		break;
> +	case 0x08:
> +		cur_button = SND_JACK_BTN_2;
> +		break;
> +	case 0x02:
> +		cur_button = SND_JACK_BTN_4;
> +		break;
> +	case 0x01:
> +		cur_button = SND_JACK_BTN_0;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return cur_button;
> +}

> +static bool es9356_sdca_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case 0x44000000:
> +	case 0x44000001:
> +	case 0x44000002:
> +	case 0x44000003:

probably best to use macros to describe what those registers are?

