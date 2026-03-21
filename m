Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6637C10F
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302649; cv=none; b=ZHLp+Yub7HbVlWES/AXtqqiYp9TBuQoRrAmne5y/0F1HVV8TfrHdX9JxQrQKLbfXiB1aqAVQqXQrqT23b8sVfhFpAVHJxSHeJASjslBGuCUiI2UxV/+x5TMQFAunYdu+7K9lxXwPJrdiQwlxTWNcZJK9oLEVBLx+ADhjLw8woTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302649; c=relaxed/simple;
	bh=xqZ0bUtVmlLve31Om8UAza9sDsowtxz31rRqDv5fFWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQVx74Zu900yR2x0onM/Qu8UOHLK2jMKmLaZF4X3Cwz+bab4+4vA++0iWi9QT9UHEZ++JyegROK273B0cfijIsOvktv87e1Xx04looEdthlCrFTu6tnLsG/mBqvloKFdSDaWBbu0oqW3YrkRyfn3Q7qSLNC7YUEs2Xt0/opMNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a28kbbUZ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a28kbbUZ"
Message-ID: <737db29e-6adf-4b14-b9d5-1e87703d9b7b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QFSvzdOd0bOX4+x0ZNQEUQ34QUc3OWwq48oknJYrZ0=;
	b=a28kbbUZAUA4oGD1uFOZagKqAo/cjWGaqxelqfT/ct+vmpBx8pGjA3XNMvR9ROaVovpHaR
	4w5tF/Su7CxKPbKuT8rGxnzeVFPtfDkDA0yovMQUPrIjwJfpfQFI4FfbB0qPjAqr4kc7c2
	p4vcOWksHhr66WhzVXoF4fYiiSpcVFQ=
Date: Fri, 20 Mar 2026 17:06:12 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260319053959.9151-1-zhangyi@everest-semi.com>
 <20260319053959.9151-5-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260319053959.9151-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


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
> +		pm_runtime_put_noidle(&es9356->slave->dev);
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
> +	if (regv != ucontrol->value.integer.value[0])
> +		changed = 1;
> +	else
> +		goto out;

nit-pick: I am not a big fan of this goto pattern used here and other places, it feels odd.

> +	regv = 6 * ucontrol->value.integer.value[0];
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

> +static void es9356_pde_transition_delay(struct es9356_sdw_priv *es9356, unsigned char func,
> +	unsigned char entity, unsigned char ps)
> +{
> +	unsigned int retries = 1000, val;
> +
> +	pm_runtime_mark_last_busy(&es9356->slave->dev);

Humm, in case of a PS3->PS0 transition, why would you mark the device as last busy here,
*before* it actually becomes busy? 

> +
> +	/* waiting for Actual PDE becomes to PS0/PS3 */
> +	while (retries) {
> +		regmap_read(es9356->regmap,
> +			SDW_SDCA_HCTL(func, entity, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
> +		if (val == ps)
> +			break;
> +
> +		usleep_range(1000, 1500);
> +		retries--;
> +	}
> +	if (!retries) {
> +		dev_dbg(&es9356->slave->dev, "%s PDE to %s is NOT ready", __func__, ps?"PS3":"PS0");
> +	}
> +}
> +
> +static int es9356_sdca_pde23_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_pde11_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_pde47_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_pde34_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu21_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu41_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu113_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu36_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget es9356_dapm_widgets[] = {
> +	SND_SOC_DAPM_OUTPUT("HP"),
> +	SND_SOC_DAPM_OUTPUT("SPK"),
> +	SND_SOC_DAPM_INPUT("MIC1"),
> +	SND_SOC_DAPM_INPUT("PDM_DIN"),
> +
> +	SND_SOC_DAPM_SUPPLY("DMIC Clock", ES9356_DMIC_GPIO, 1, 1, NULL, 0),
> +
> +	SND_SOC_DAPM_AIF_IN("DP4RX", "DP4 Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("DP3RX", "DP3 Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("DP1TX", "DP1 Capture", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("DP2TX", "DP2 Capture", 0, SND_SOC_NOPM, 0, 0),
> +
> +	SND_SOC_DAPM_PGA("IF DP3RXL", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("IF DP3RXR", SND_SOC_NOPM, 0, 0, NULL, 0),
> +
> +	SND_SOC_DAPM_MUX("Left Channel MUX", SND_SOC_NOPM, 0, 0, &es9356_left_mux_controls),
> +	SND_SOC_DAPM_MUX("Right Channel MUX", SND_SOC_NOPM, 0, 0, &es9356_right_mux_controls),
> +
> +	SND_SOC_DAPM_SUPPLY("PDE 23", SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_pde23_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_SUPPLY("PDE 11", SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_pde11_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_SUPPLY("PDE 47", SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_pde47_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_SUPPLY("PDE 34", SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_pde34_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +
> +	SND_SOC_DAPM_DAC_E("FU 21", NULL, SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_fu21_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_DAC_E("FU 41", NULL, SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_fu41_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_ADC_E("FU 113", NULL, SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_fu113_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_ADC_E("FU 36", NULL, SND_SOC_NOPM, 0, 0,
> +		es9356_sdca_fu36_event,
> +		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +};
> +
> +static const struct snd_soc_dapm_route es9356_audio_map[] = {
> +	{"FU 36", NULL, "MIC1"},
> +	{"DP2TX", NULL, "PDE 34"},
> +	{"DP2TX", NULL, "FU 36"},
> +
> +	{"PDM_DIN", NULL, "DMIC Clock"},
> +	{"FU 113", NULL, "PDM_DIN"},
> +	{"DP1TX", NULL, "PDE 11"},
> +	{"DP1TX", NULL, "FU 113"},
> +
> +	{"FU 41", NULL, "DP4RX"},
> +
> +	{"IF DP3RXL", NULL, "DP3RX"},
> +	{"IF DP3RXR", NULL, "DP3RX"},
> +
> +	{"Left Channel MUX", "From Left", "IF DP3RXL"},
> +	{"Left Channel MUX", "From Right", "IF DP3RXR"},
> +	{"Right Channel MUX", "From Left", "IF DP3RXL"},
> +	{"Right Channel MUX", "From Right", "IF DP3RXR"},
> +
> +	{"FU 21", NULL, "Left Channel MUX"},
> +	{"FU 21", NULL, "Right Channel MUX"},
> +
> +	{"SPK", NULL, "PDE 23"},
> +	{"SPK", NULL, "FU 21"},
> +
> +	{"HP", NULL, "PDE 47"},
> +	{"HP", NULL, "FU 41"},
> +
> +};
> +
> +static void es9356_sdca_jack_init(struct es9356_sdw_priv *es9356)
> +{
> +	mutex_lock(&es9356->jack_lock);
> +
> +	if (es9356->hs_jack) {
> +		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_7);
> +		sdw_write_no_pm(es9356->slave, SDW_SCP_SDCA_INTMASK1,
> +			(SDW_SCP_SDCA_INTMASK_SDCA_7 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_1));
> +	}
> +
> +	mutex_unlock(&es9356->jack_lock);
> +}
> +
> +static int es9356_set_jack_detect(struct snd_soc_component *component,
> +	struct snd_soc_jack *hs_jack, void *data)
> +{
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	es9356->hs_jack = hs_jack;
> +	ret = pm_runtime_resume_and_get(component->dev);
> +	if (ret < 0) {
> +		if (ret != -EACCES) {
> +			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
> +			return ret;
> +		}
> +		/* pm_runtime not enabled yet */
> +		dev_info(component->dev, "%s: skipping jack init for now\n", __func__);
> +		return 0;
> +	}
> +
> +	es9356_sdca_jack_init(es9356);
> +
> +	pm_runtime_mark_last_busy(component->dev);
> +	pm_runtime_put_autosuspend(component->dev);
> +
> +	return 0;
> +}
> +static const struct snd_soc_component_driver snd_soc_es9356_sdw_component = {
> +	.probe = es9356_sdw_component_probe,
> +	.controls = es9356_sdca_controls,
> +	.num_controls = ARRAY_SIZE(es9356_sdca_controls),
> +	.dapm_widgets = es9356_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(es9356_dapm_widgets),
> +	.dapm_routes = es9356_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(es9356_audio_map),
> +	.set_jack = es9356_set_jack_detect,
> +	.endianness = 1,
> +};
> +
> +static int es9356_sdw_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
> +				     int direction)
> +{
> +	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
> +
> +	return 0;
> +}
> +
> +static void es9356_sdw_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +
> +	regmap_write(es9356->regmap, SDW_SCP_SYSTEMCTRL, SDW_SCP_SYSTEMCTRL_WAKE_UP_EN | SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);
> +
> +	snd_soc_dai_set_dma_data(dai, substream, NULL);
> +}
> +
> +static int es9356_sdca_button(unsigned int *buffer)
> +{
> +	static int cur_button;
> +
> +	if (*(buffer + 1) | *(buffer + 2))
> +		return -EINVAL;
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
> +
> +static int es9356_sdca_button_detect(struct es9356_sdw_priv *es9356)
> +{
> +	unsigned int btn_type = 0, offset, idx, val, owner;
> +	int ret;
> +	unsigned int button[3];
> +
> +	ret = regmap_read(es9356->regmap,
> +		SDW_SDCA_HCTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
> +	if (ret < 0 || owner == 0x01)
> +		return 0;
> +
> +	ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
> +		if (ret < 0)
> +			goto button_det_end;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(button); idx++) {
> +		ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID + offset + idx, &val);
> +		if (ret < 0)
> +			goto button_det_end;
> +		button[idx] = val;
> +	}
> +
> +	btn_type = es9356_sdca_button(&button[0]);
> +
> +button_det_end:
> +	if (owner == 0x00)
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_HCTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
> +
> +	return btn_type;
> +}
> +
> +static int es9356_sdca_headset_detect(struct es9356_sdw_priv *es9356)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
> +
> +	if (ret < 0)
> +		goto io_error;
> +
> +	switch (reg) {
> +	case 0x00:
> +		es9356->jack_type = 0;
> +		break;
> +	case 0x03:
> +		es9356->jack_type = SND_JACK_HEADPHONE;
> +		break;
> +	case 0x04:
> +		es9356->jack_type = SND_JACK_HEADSET;
> +		break;
> +	}
> +
> +	if (reg) {
> +		ret = regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_SELECTED_MODE, 0), reg);
> +		if (ret < 0)
> +			goto io_error;
> +		ret = regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0x75);
> +	} else {
> +		ret = regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
> +	}
> +
> +	return 0;
> +
> +io_error:
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +	return ret;
> +}
> +
> +static void es9356_jack_detect_handler(struct work_struct *work)
> +{
> +	struct es9356_sdw_priv *es9356 =
> +		container_of(work, struct es9356_sdw_priv, jack_detect_work.work);
> +	unsigned int reg;
> +	int ret, btn_type = 0;
> +
> +	if (!es9356->hs_jack)
> +		return;
> +
> +	if (!es9356->component->card || !es9356->component->card->instantiated)
> +		return;
> +
> +	if (es9356->sdca_status & SDW_SCP_SDCA_INT_SDCA_7) {
> +		btn_type = es9356_sdca_button_detect(es9356);
> +		if (btn_type < 0)
> +			return;
> +	} else {
> +		ret = es9356_sdca_headset_detect(es9356);
> +		if (ret < 0)
> +			return;
> +	}
> +
> +	if (es9356->jack_type != SND_JACK_HEADSET)
> +		btn_type = 0;
> +
> +	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +
> +	if (btn_type) {
> +		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->button_detect_work, msecs_to_jiffies(280));
> +	}
> +}
> +
> +static void es9356_button_detect_handler(struct work_struct *work)
> +{
> +	struct es9356_sdw_priv *es9356 =
> +		container_of(work, struct es9356_sdw_priv, button_detect_work.work);
> +	unsigned int reg, offset;
> +	int ret, idx, btn_type = 0;
> +	unsigned int button[3];
> +
> +	ret = regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
> +
> +	if (ret < 0)
> +		goto io_error;
> +
> +	if (reg == 0x04) {
> +		ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
> +		if (ret < 0)
> +			goto io_error;
> +		for (idx = 0; idx < ARRAY_SIZE(button); idx++) {
> +			ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID + offset + idx, &reg);
> +			if (ret < 0)
> +				goto io_error;
> +			button[idx] = reg;
> +		}
> +		btn_type = es9356_sdca_button(&button[0]);
> +	}
> +
> +	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +
> +	if (btn_type) {
> +		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->button_detect_work, msecs_to_jiffies(280));
> +	}
> +
> +	return;
> +io_error:
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +}
> +
> +static int es9356_sdw_pcm_hw_params(struct snd_pcm_substream *substream,
> +				    struct snd_pcm_hw_params *params,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	enum sdw_data_direction direction;
> +	int ret, num_channels;
> +	unsigned int rate;
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	if (!es9356->slave)
> +		return -EINVAL;
> +
> +	/* SoundWire specific configuration */
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
> +
> +	port_config.num = dai->id;
> +
> +	ret = sdw_stream_add_slave(es9356->slave, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret)
> +		dev_err(dai->dev, "Unable to configure port\n");

shouldn't you stop then and return?> diff --git a/sound/soc/codecs/es9356.h b/sound/soc/codecs/es9356.h
> new file mode 100644
> index 000000000..4f6bc7a19
> --- /dev/null
> +++ b/sound/soc/codecs/es9356.h
> @@ -0,0 +1,229 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ES9356_H__
> +#define __ES9356_H__
> +
> +#define SDW_SDCA_CTL_MBQ(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | MBQ)
> +#define SDW_SDCA_HCTL(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | 0x80000)
> +#define SDW_SDCA_REG_MBQ(reg) (reg | MBQ)

those macros don't seem like they belong in a vendor-specific header.
Aren't they defined anyways in an sdca generic header?

> +#define FUNCTION_NEEDS_INITIALIZATION		BIT(5)

same this is generic and shouldn't be here

>

