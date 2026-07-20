Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5042943148D
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558706; cv=none; b=KSFdxf47U+qbbZMAPcEXob5tyREC2nMwSv/5xkTe9MAihHz1DLSj1i/bKBn9TdeOzJP76MgZVudQzhbB6/Y0wYPhh4/u75PlISvWNfxxio9/03qTx5AmrYVqyZ98lhpdfoOhVHlkR4FK9fUjkgNNsY5rTYcrSK5G30jZhLhNdBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558706; c=relaxed/simple;
	bh=fJnocvXXb6t69NhRAhQuGBw6OdLxFkfVuqjhMZznwM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4VK55Y6ez7Za12zi1S9735+UDyjKHyl3R1ZdSkDfms6mDthIBFMCcHVSthNzqZMzLOplJ3eAUwAbpeaIguVoj0kfJ4IV2aI4gkz7YKhSlzudhKCjYrJNHt0htHvBi/IYbNuMN1KgRmUcKWxnbGyiI9lWEnGd6rtn3jKHBaoz4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fouev2Qb; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fouev2Qb"
Message-ID: <fff6c488-295d-47c3-819a-478b6dc3b24b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784558685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxXHzF9Ck41omnNojK2NgILqupbZQaWjF2GaZx6FwcY=;
	b=fouev2Qb4ZPwzechNk3r6n10431Dv+KZnQFrw0vkArlTQVKKJ93wboFN6tkPTEdCRWfTac
	lIzM7hEO+Tc5TcqHedg3UuHl21mPaqbYoZXvzN9UzQwzF44aDqNVvbCLtTuJphTx+ou4bc
	K88NqV6x+H/Cbqbw1chh2AuVuV5cxnY=
Date: Mon, 20 Jul 2026 16:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: rt766: add RT766/RT767 SDCA driver
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20260720090613.2239891-1-shumingf@realtek.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260720090613.2239891-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/20/26 11:06, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds the initial SDCA multi-function codec driver for the RT766 and RT767.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Looks mostly good, I only have minor comments, see below.


> +static bool rt766_sdca_readable_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case SDW_SCP_SDCA_INT1 ... SDW_SCP_SDCA_INTMASK4:
> +	case RT766_VERSION_ID ... RT766_BOND_LATCH_ID:
> +	case 0xc344 ... 0xc345:
> +	case 0xc900:
> +	case 0xc920:
> +	case 0xd540 ... 0xd542:
> +	case 0xf01e:
> +	case RT766_HP_POWER_STATE ... RT766_HP_FSM_CTL2_1:
> +	case 0x310100:
> +	case RT766_MCU_PATCH_ADDR1_START ... RT766_MCU_PATCH_ADDR1_END:
> +	case RT766_MCU_PATCH_ADDR2_START ... RT766_MCU_PATCH_ADDR2_END:
> +	case RT766_MUTE_REG(UAJ, USER_FU41, 1):
> +	case RT766_MUTE_REG(UAJ, USER_FU41, 2):
> +	case RT766_VOLUME_REG(UAJ, USER_FU41, 1):
> +	case RT766_VOLUME_REG(UAJ, USER_FU41, 2):
> +	case RT766_MUTE_REG(UAJ, USER_FU36, 1):
> +	case RT766_MUTE_REG(UAJ, USER_FU36, 2):
> +	case RT766_VOLUME_REG(UAJ, USER_FU36, 1):
> +	case RT766_VOLUME_REG(UAJ, USER_FU36, 2):
> +	case RT766_PDE_REQ_REG(UAJ, PDE47):
> +	case RT766_PDE_REQ_REG(UAJ, PDE34):
> +	case RT766_SDCA_CTL(UAJ, CS41, SDCA_CTL_CS_SAMPLERATEINDEX):
> +	case RT766_SDCA_CTL(UAJ, CS36, SDCA_CTL_CS_SAMPLERATEINDEX):
> +	/* 0x40480000 */
> +	case RT766_FUNC_STATUS_REG(UAJ):
> +	/* 0x40481400 */
> +	case RT766_PDE_ACTUAL_REG(UAJ, PDE47):
> +	/* 0x40481480 */

these single line registers listed in comments confuse me, not clear for
example if this one applies to the following line...

> +	case RT766_PDE_ACTUAL_REG(UAJ, PDE34):

but then why not adde the values for the next 3?

> +	case RT766_GAIN_REG(UAJ, PLATFORM_FU33, 1):
> +	case RT766_GAIN_REG(UAJ, PLATFORM_FU33, 2):
> +	case RT766_SDCA_CTL(UAJ, GE49, SDCA_CTL_GE_SELECTED_MODE):
> +	/* 0x40600490 */
> +	case RT766_SDCA_CTL(UAJ, GE49, SDCA_CTL_GE_DETECTED_MODE):
> +	case RT766_PDE_REQ_REG(MIC, PDE11):
> +	case RT766_MUTE_REG(MIC, USER_FU113, 1):
> +	case RT766_MUTE_REG(MIC, USER_FU113, 2):
> +	case RT766_MUTE_REG(MIC, USER_FU113, 3):
> +	case RT766_MUTE_REG(MIC, USER_FU113, 4):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 1):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 2):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 3):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 4):
> +	/* 0x40880000 */
> +	case RT766_FUNC_STATUS_REG(MIC):

same here, are 0x40880000  and RT766_FUNC_STATUS_REG equivalent? If yes
maybe move the comment to the right side?

> +	case RT766_SDCA_CTL(MIC, CS113, SDCA_CTL_CS_SAMPLERATEINDEX):
> +	/* 0x40881500 */
> +	case RT766_PDE_ACTUAL_REG(MIC, PDE11):
> +	/* 0x40c80000 */
> +	case RT766_FUNC_STATUS_REG(HID):
> +	/* 0x40c80080 - 0x40c80098 */
> +	case RT766_SDCA_CTL(HID, HID101, SDCA_CTL_HIDE_HIDTX_CURRENTOWNER) ...
> +		RT766_SDCA_CTL(HID, HID101, SDCA_CTL_HIDE_HIDTX_MESSAGELENGTH):
> +	case RT766_MUTE_REG(AMP, USER_FU21, 1):
> +	case RT766_MUTE_REG(AMP, USER_FU21, 2):
> +	case RT766_VOLUME_REG(AMP, USER_FU21, 1):
> +	case RT766_VOLUME_REG(AMP, USER_FU21, 2):
> +	case RT766_PDE_REQ_REG(AMP, PDE23):
> +	/* 0x41080000 */
> +	case RT766_FUNC_STATUS_REG(AMP):
> +	case RT766_SDCA_CTL(AMP, PPU21, SDCA_CTL_PPU_POSTURENUMBER):
> +	case RT766_SDCA_CTL(AMP, CS21, SDCA_CTL_CS_SAMPLERATEINDEX):
> +	/* 0x41081980 */
> +	case RT766_PDE_ACTUAL_REG(AMP, PDE23):
> +	case RT766_BUF_ADDR_HID1 ... RT766_BUF_ADDR_HID2:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

> +static const struct reg_default rt766_sdca_defaults[] = {
> +	/* 0x40400289 - 0x4040028a */
> +	{ RT766_MUTE_REG(UAJ, USER_FU41, 1), 0x01 },
> +	{ RT766_MUTE_REG(UAJ, USER_FU41, 2), 0x01 },

things are much clearer/organized here!

> +	/* 0x40400291 - 0x40400292 */
> +	{ RT766_VOLUME_REG(UAJ, USER_FU41, 1), 0x0000 },
> +	{ RT766_VOLUME_REG(UAJ, USER_FU41, 2), 0x0000 },
> +	/* 0x40400789 - 0x4040078a */
> +	{ RT766_MUTE_REG(UAJ, USER_FU36, 1), 0x01 },
> +	{ RT766_MUTE_REG(UAJ, USER_FU36, 2), 0x01 },
> +	/* 0x40400791 - 0x40400792 */
> +	{ RT766_VOLUME_REG(UAJ, USER_FU36, 1), 0x0000 },
> +	{ RT766_VOLUME_REG(UAJ, USER_FU36, 2), 0x0000 },
> +	/* 0x40401408 */
> +	{ RT766_PDE_REQ_REG(UAJ, PDE47), 0x03 },
> +	/* 0x40401488 */
> +	{ RT766_PDE_REQ_REG(UAJ, PDE34), 0x03 },
> +	/* 0x40480080 */
> +	{ RT766_SDCA_CTL(UAJ, CS41, SDCA_CTL_CS_SAMPLERATEINDEX), 0x09 },
> +	/* 0x40480880 */
> +	{ RT766_SDCA_CTL(UAJ, CS36, SDCA_CTL_CS_SAMPLERATEINDEX), 0x09 },
> +	/* 0x40600259 - 0x4060025a */
> +	{ RT766_GAIN_REG(UAJ, PLATFORM_FU33, 1), 0xfe00 },
> +	{ RT766_GAIN_REG(UAJ, PLATFORM_FU33, 2), 0xfe00 },
> +	/* 0x40600488 */
> +	{ RT766_SDCA_CTL(UAJ, GE49, SDCA_CTL_GE_SELECTED_MODE), 0x00 },

> +static struct sdca_entity *rt766_find_entity_by_label(struct sdca_function_data *func,
> +	const char *label)
> +{
> +	struct sdca_entity *entity = NULL;

useless initialization?

> +	int idx;
> +
> +	for (idx = 0; idx < func->num_entities; idx++) {
> +		entity = &func->entities[idx];
> +
> +		if (!strcmp(entity->label, label))
> +			return entity;
> +	}
> +
> +	return NULL;
> +}

> +static int rt766_sdca_irq_ctl(struct rt766_sdca_priv *rt766,
> +							  struct sdca_function_data *function,
> +							  struct snd_soc_component *component,
> +							  struct sdca_interrupt_info *info,
> +							  bool enabled)
> +{
> +	struct device *dev = &rt766->slave->dev;
> +	struct sdca_interrupt *interrupt;
> +	struct sdca_control *control;
> +	struct sdca_entity *entity;
> +	irq_handler_t handler;
> +	int i, j, irq, ret;
> +
> +	for (i = 0; i < function->num_entities; i++) {
> +		entity = &function->entities[i];
> +
> +		for (j = 0; j < entity->num_controls; j++) {
> +			control = &entity->controls[j];
> +			irq = control->interrupt_position;
> +
> +			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
> +			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
> +				handler = rt766_sdca_irq_jd_handler;
> +				break;
> +			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
> +				handler = rt766_sdca_irq_btn_handler;
> +				break;
> +			default:
> +				continue;
> +			}
> +
> +			interrupt = &info->irqs[irq];
> +
> +			if (enabled) {
> +				ret = sdca_irq_data_populate(dev, rt766->regmap, component,
> +								function, entity, control,
> +								interrupt);
> +				if (ret)
> +					return ret;
> +
> +				interrupt->priv = rt766;
> +				ret = sdca_irq_request(dev, info, irq, interrupt->name,
> +								handler, interrupt);

There was a proposal from Charles to do an irq_populate_early, is there
a conflict between the two patchsets? see "ASoC: SDCA: Populate IRQ data
earlier"

> +				if (ret) {
> +					dev_err(dev, "failed to request irq %s: %d\n",
> +						interrupt->name, ret);
> +					return ret;
> +				}
> +				dev_dbg(dev, "Requesting IRQ %d InterruptName=%s\n", irq, interrupt->name);
> +			} else {
> +				sdca_irq_free(dev, info, irq, interrupt->name, interrupt);
> +				dev_dbg(dev, "Freeing IRQ %d\n", irq);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

> +static int rt766_sdca_set_fu41_playback_ctl(struct rt766_sdca_priv *rt766)
> +{
> +	int err;
> +	unsigned int ch_01, ch_02;

nit-pick: likely copy/paste from other drivers, but flipping the two
lines would be nicer. there are a couple of similar patterns in this driver.

> +
> +	ch_01 = (rt766->fu41_dapm_mute || rt766->fu41_mixer_l_mute) ? 0x01 : 0x00;
> +	ch_02 = (rt766->fu41_dapm_mute || rt766->fu41_mixer_r_mute) ? 0x01 : 0x00;
> +
> +	err = regmap_write(rt766->regmap, RT766_MUTE_REG(UAJ, USER_FU41, 1), ch_01);
> +	if (err < 0)
> +		return err;
> +
> +	err = regmap_write(rt766->regmap, RT766_MUTE_REG(UAJ, USER_FU41, 2), ch_02);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}

> +static int rt766_sdca_pde47_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
> +	const struct sdca_entity *entity = NULL;

useless init?

> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +	int from_ps, to_ps;
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(UAJ, PDE47), ps0);
> +		from_ps = ps3;
> +		to_ps = ps0;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(UAJ, PDE47), ps3);
> +		from_ps = ps0;
> +		to_ps = ps3;
> +		break;
> +	}
> +
> +	entity = rt766_find_entity_by_label(rt766->uaj_func_data, "PDE 47");
> +	ret = sdca_asoc_pde_poll_actual_ps(component->dev, rt766->regmap,
> +				   RT766_FUNC_NUM_UAJ,
> +				   RT766_SDCA_ENT_PDE47,
> +				   from_ps, to_ps,
> +				   entity ? entity->pde.max_delay : NULL,
> +				   entity ? entity->pde.num_max_delay : 0);
> +	if (ret)
> +		dev_err(component->dev, "%s: PDE transition %x -> %x failed, err=%d\n",
> +			__func__, from_ps, to_ps, ret);
> +
> +	return ret;
> +}

> +static int rt766_sdca_pde34_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
> +	const struct sdca_entity *entity = NULL;

useless init? Same comment for all PDE events.

> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +	int from_ps, to_ps;
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(UAJ, PDE34), ps0);
> +		from_ps = ps3;
> +		to_ps = ps0;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(UAJ, PDE34), ps3);
> +		from_ps = ps0;
> +		to_ps = ps3;
> +		break;
> +	}
> +
> +	entity = rt766_find_entity_by_label(rt766->uaj_func_data, "PDE 34");
> +	ret = sdca_asoc_pde_poll_actual_ps(component->dev, rt766->regmap,
> +				   RT766_FUNC_NUM_UAJ,
> +				   RT766_SDCA_ENT_PDE34,
> +				   from_ps, to_ps,
> +				   entity ? entity->pde.max_delay : NULL,
> +				   entity ? entity->pde.num_max_delay : 0);
> +	if (ret)
> +		dev_err(component->dev, "%s: PDE transition %x -> %x failed, err=%d\n",
> +			__func__, from_ps, to_ps, ret);
> +
> +	return ret;
> +}


> +static int rt766_sdca_probe(struct snd_soc_component *component)
> +{
> +	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = &rt766->slave->dev;
> +	int ret;
> +
> +	rt766->component = component;
> +
> +	ret = pm_runtime_resume(component->dev);
> +	if (ret < 0 && ret != -EACCES)
> +		return ret;
> +
> +	if (rt766->uaj_func_data) {
> +		dev_dbg(dev, "%s : irq %d\n", __func__, rt766->slave->irq);
> +
> +		rt766->irq_info = sdca_irq_allocate(dev, rt766->regmap, rt766->slave->irq);
> +		if (IS_ERR(rt766->irq_info))
> +			return PTR_ERR(rt766->irq_info);
> +
> +		ret = rt766_sdca_irq_ctl(rt766, rt766->uaj_func_data,
> +			component, rt766->irq_info, true);

same question on IRQ allocate/request for Charles.

> +		if (ret < 0) {
> +			dev_err(dev, "Failed to request UAJ SDCA IRQ: %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (rt766->hid_func_data) {
> +			ret = rt766_sdca_irq_ctl(rt766, rt766->hid_func_data,
> +				component, rt766->irq_info, true);
> +			if (ret < 0) {
> +				dev_err(dev, "Failed to request HID SDCA IRQ: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

> +static unsigned int rt766_find_dt_rates(struct device *dev, struct sdca_function_data *function,
> +							const char *label)
> +{
> +	struct sdca_entity *entity = NULL;

useless init?

> +	unsigned int rates;
> +	int i, ret;
> +
> +	for (i = 0; i < function->num_entities; i++) {
> +		entity = &function->entities[i];
> +
> +		if (strcmp(entity->label, label))
> +			continue;
> +
> +		/* Can't check earlier as only terminals have an iot member. */
> +		if (!entity->iot.is_dataport)
> +			continue;
> +
> +		ret = rt766_parse_rates(dev, function, entity, &rates);
> +		if (ret < 0) {
> +			dev_dbg(dev, "%s: failed to parse rates for entity %s\n",
> +				__func__, entity->label);
> +			return 0;
> +		}
> +
> +		dev_dbg(dev, "%s: %s supports rates 0x%08x\n", __func__, entity->label, rates);
> +	}
> +
> +	return rates;
> +}
> +
> +int rt766_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave *slave)
> +{
> +	struct sdca_function_data *func_data_ptr;
> +	struct rt766_sdca_priv *rt766;
> +	unsigned int rates;
> +	int ret;
> +	int i;
> +
> +	rt766 = devm_kzalloc(dev, sizeof(*rt766), GFP_KERNEL);
> +	if (!rt766)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, rt766);
> +	rt766->slave = slave;
> +	rt766->regmap = regmap;
> +
> +	regcache_cache_only(rt766->regmap, true);
> +
> +	mutex_init(&rt766->disable_irq_lock);
> +
> +	/*
> +	 * Mark hw_init to false
> +	 * HW init will be performed when device reports present
> +	 */
> +	rt766->hw_init = false;
> +	rt766->first_hw_init = false;
> +	rt766->fu41_dapm_mute = true;
> +	rt766->fu41_mixer_l_mute = rt766->fu41_mixer_r_mute = false;
> +	rt766->fu36_dapm_mute = true;
> +	rt766->fu36_mixer_l_mute = rt766->fu36_mixer_r_mute = true;
> +	rt766->fu21_dapm_mute = true;
> +	rt766->fu21_mixer_l_mute = rt766->fu21_mixer_r_mute = false;
> +	rt766->fu113_dapm_mute = true;
> +	rt766->fu113_mixer_mute[0] = rt766->fu113_mixer_mute[1] =
> +		rt766->fu113_mixer_mute[2] = rt766->fu113_mixer_mute[3] = true;
> +
> +	/* get SDCA function data */
> +	dev_dbg(dev, "SDCA functions found: %d", slave->sdca_data.num_functions);
> +	for (i = 0; i < slave->sdca_data.num_functions; i++) {
> +		func_data_ptr = devm_kzalloc(dev, sizeof(*func_data_ptr), GFP_KERNEL);
> +		if (!func_data_ptr)
> +			return dev_err_probe(dev, -ENOMEM, "failed to allocate function data");
> +
> +		func_data_ptr->desc = &slave->sdca_data.function[i];
> +		ret = sdca_parse_function(dev, slave, func_data_ptr);
> +		if (ret) {
> +			devm_kfree(dev, func_data_ptr);
> +			return ret;
> +		}
> +		dev_dbg(dev, "Function type=%d, num_entities=%d",
> +			slave->sdca_data.function[i].type, func_data_ptr->num_entities);
> +
> +		switch (slave->sdca_data.function[i].type) {
> +		case SDCA_FUNCTION_TYPE_UAJ:
> +			rt766->uaj_func_data = func_data_ptr;
> +			/*
> +			 * Some machines may only support a subset of the sample rates supported by the codec.
> +			 * Therefore, we need to parse the supported sample rates from the DisCo table and
> +			 * configure them in the DAI. If the DisCo table does not provide sample rate information,
> +			 * we will fall back to the default supported rates defined in the codec driver.
> +			 */
> +			rates = rt766_find_dt_rates(dev, func_data_ptr, "IT 41");
> +			if (rates)
> +				rt766_sdca_dai[0].playback.rates = rates;
> +
> +			rates = rt766_find_dt_rates(dev, func_data_ptr, "OT 36");
> +			if (rates)
> +				rt766_sdca_dai[0].capture.rates = rates;
> +			break;
> +		case SDCA_FUNCTION_TYPE_SMART_AMP:
> +			rt766->sa_func_data = func_data_ptr;
> +			rates = rt766_find_dt_rates(dev, func_data_ptr, "IT 21");
> +			if (rates)
> +				rt766_sdca_dai[1].playback.rates = rates;
> +			break;
> +		case SDCA_FUNCTION_TYPE_SMART_MIC:
> +			rt766->sm_func_data = func_data_ptr;
> +			rates = rt766_find_dt_rates(dev, func_data_ptr, "OT 113");
> +			if (rates)
> +				rt766_sdca_dai[2].capture.rates = rates;

are the sdca_dai[index] related to the function? Wondering if we can use
e.g sdca_dai[MIC] instead?

> +			break;
> +		case SDCA_FUNCTION_TYPE_HID:
> +			rt766->hid_func_data = func_data_ptr;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unexpected SDCA function type found: %d",
> +				slave->sdca_data.function[i].type);
> +		}
> +	}
> +
> +	ret =  devm_snd_soc_register_component(dev,
> +			&soc_sdca_dev_rt766, rt766_sdca_dai, ARRAY_SIZE(rt766_sdca_dai));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set autosuspend parameters */
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	/* make sure the device does not suspend immediately */
> +	pm_runtime_mark_last_busy(dev);
> +
> +	pm_runtime_enable(dev);
> +
> +	dev_dbg(dev, "%s\n", __func__);
> +
> +	return 0;
> +}


