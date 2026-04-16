Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154AA30215A
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776371577; cv=none; b=s1/IB0lUIyP4pfJ9EHH8c19yh3tdYzDH695oIdTXhvtsBmAs1u66jGyofV1KMQv4evqb4jh4MxwtSeEx4N9UhdXLZu3oAJsgqV5ZkQ/km1YOhjarh7QvL+RYtDKr1sgVU5OJ/gbNhiO9qKZSTgkKMtu6YPdoL5rirR7RhiahtNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776371577; c=relaxed/simple;
	bh=R6ZGdecofpc0tcy9dSIPKRr1NqWmS/Frk3lf5kTbM2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivVunIjJPjGRw8NVZA5vZd8tvDf1sfKyiF8mjciPdTXHeRg/iSi49m4ST8pExONkRyVB6Pv7ojwAHX8ZxlkKkgsetshYWmeDKucUZsrSORpQhV0i8KZkuEcBdpl2zkRWHrk34DiYD0a7d4QEJtColxhMINOJhs4mswBRk99Y7xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fB4sN6wQ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fB4sN6wQ"
Message-ID: <89733e7a-4daa-4d49-99d5-4f2c596568f0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776371573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zhgfvnBFPn5gu6SdbCpb5Q/EqOzKzQicWE9YyTfIDQ=;
	b=fB4sN6wQ0+2LSMq903bC9IraTvdPbvgB9Z5ZTi6KjBM4LWr7FoQP3Pd4obhU+7VsnlXj2v
	67z8OtpFtMeCCOtoqeE7Jmi59feozWWHEtOQxDMVGHRZb0UM8snhqu5yqiBaNzBi5rv9rA
	1H7f7vasqT1HsYUufGmeJQdvZLT9A6Y=
Date: Thu, 16 Apr 2026 22:31:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com
References: <20260411132746.8103-1-zhangyi@everest-semi.com>
 <20260411132746.8103-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260411132746.8103-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static int es9356_sdca_button_detect(struct es9356_sdw_priv *es9356)
> +{
> +	unsigned int btn_type = 0, offset, idx, val, owner;
> +	int ret;
> +	unsigned int button[3];
> +
> +	ret = regmap_read(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
> +	if (ret < 0 || owner == 0x01)
> +		return 0;
> +
> +	ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
> +		if (ret < 0)
> +			goto button_det_end;

indentation seems off?

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
> +			SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
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
> +	default:
> +		es9356->jack_type = 0;
> +		return -1;
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

these last 2 assignments will not be used, ret is not returned.

> +	}
> +
> +	return 0;
> +
> +io_error:
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +	return ret;
> +}
> +
> +static void es9356_interrupt_handler(struct work_struct *work)
> +{
> +	struct es9356_sdw_priv *es9356 =
> +		container_of(work, struct es9356_sdw_priv, interrupt_handle_work.work);
> +	int ret, btn_type = 0;
> +
> +	if (!es9356->hs_jack)
> +		return;
> +
> +	if (!es9356->component->card || !es9356->component->card->instantiated)
> +		return;
> +
> +	/* Handling different types of interrupts based on the mask bit */
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

this is a bit weird, the code seems to assume the jack interrupt is handled before the button interrupt, can this branch be taken?

> +	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4);
> +
> +	if (btn_type) {
> +		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4);
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

You've already read the DETECTED_MODE in the headset_detect() routine, is this required to read it a second time?
What is the purpose of this sequence?

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
> +		if (btn_type < 0)
> +			return;
> +	}
> +
> +	snd_soc_jack_report(es9356->hs_jack, es9356->jack_type | btn_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4);
> +
> +	if (btn_type) {
> +		snd_soc_jack_report(es9356->hs_jack, es9356->jack_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4);
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->button_detect_work, msecs_to_jiffies(280));
> +	}
> +
> +	return;
> +io_error:
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +}
> +
> +static int es9356_pde_transition_delay(struct es9356_sdw_priv *es9356, unsigned char func,
> +	unsigned char entity, unsigned char ps)
> +{
> +	unsigned int retries = 10, val;
> +
> +	/* waiting for Actual PDE becomes to PS0/PS3 */
> +	while (retries) {
> +		regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(func, entity, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
> +		if (val == ps)
> +			return 1;
> +
> +		usleep_range(1000, 1500);
> +		retries--;
> +	}
> +	if (!retries) {
> +		dev_dbg(&es9356->slave->dev, "%s PDE is NOT %s", __func__, ps?"PS3":"PS0");
> +	}
> +	return 0;
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
> +	int ret;
> +	unsigned char func, pde_entity, cs_entity;
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
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
> +	if (ret) {
> +		dev_err(dai->dev, "Unable to configure port\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (params_rate(params)) {
> +	case 16000:
> +		rate = ES9356_SDCA_RATE_16000HZ;
> +		break;
> +	case 44100:
> +		rate = ES9356_SDCA_RATE_44100HZ;
> +		break;
> +	case 48000:
> +		rate = ES9356_SDCA_RATE_48000HZ;
> +		break;
> +	case 96000:
> +		rate = ES9356_SDCA_RATE_96000HZ;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Rate %d is not supported\n",
> +			__func__, params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case ES9356_DMIC:
> +		func = FUNC_NUM_MIC;
> +		cs_entity = ES9356_SDCA_ENT_CS113;
> +		pde_entity = ES9356_SDCA_ENT_PDE11;
> +		break;
> +	case ES9356_AMP:
> +		func = FUNC_NUM_AMP;
> +		cs_entity = ES9356_SDCA_ENT_CS21;
> +		pde_entity = ES9356_SDCA_ENT_PDE23;
> +		break;
> +	case ES9356_JACK_IN:
> +		func = FUNC_NUM_UAJ;
> +		cs_entity = ES9356_SDCA_ENT_CS36;
> +		pde_entity = ES9356_SDCA_ENT_PDE34;
> +		break;
> +	case ES9356_JACK_OUT:
> +		func = FUNC_NUM_UAJ;
> +		cs_entity = ES9356_SDCA_ENT_CS41;
> +		pde_entity = ES9356_SDCA_ENT_PDE47;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Invalid dai id: %d\n",
> +			__func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, cs_entity, ES9356_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), rate);
> +
> +	mutex_lock(&es9356->pde_lock);
> +	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps3);
> +	if (ret) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps0);
> +	} else
> +		dev_dbg(component->dev, "%s PDE is already PS0", __func__);
> +
> +	mutex_unlock(&es9356->pde_lock);

what is the purpose of this lock? Can you have two separate hw_params() or hw_free() that would attempt to change the power state concurrently?

Also IIRC hw_params() can be called multiple times without a matching hw_free(), so the dev_dbg() above could be logged by design.

> +
> +	return 0;
> +}
> +
> +static int es9356_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	int ret;
> +	unsigned char func, pde_entity;
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	if (!es9356->slave)
> +		return -EINVAL;
> +
> +	sdw_stream_remove_slave(es9356->slave, sdw_stream);
> +
> +	switch (dai->id) {
> +	case ES9356_DMIC:
> +		func = FUNC_NUM_MIC;
> +		pde_entity = ES9356_SDCA_ENT_PDE11;
> +		break;
> +	case ES9356_AMP:
> +		func = FUNC_NUM_AMP;
> +		pde_entity = ES9356_SDCA_ENT_PDE23;
> +		break;
> +	case ES9356_JACK_IN:
> +		func = FUNC_NUM_UAJ;
> +		pde_entity = ES9356_SDCA_ENT_PDE34;
> +		break;
> +	case ES9356_JACK_OUT:
> +		func = FUNC_NUM_UAJ;
> +		pde_entity = ES9356_SDCA_ENT_PDE47;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: Invalid dai id: %d\n",
> +			__func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&es9356->pde_lock);
> +	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps0);
> +	if (ret) {
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps3);
> +	} else
> +		dev_dbg(component->dev, "%s PDE is already PS0", __func__);
> +
> +	mutex_unlock(&es9356->pde_lock);

same questions on pde_lock

> +
> +	return 0;
> +}
> +

> +static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
> +					 struct sdw_slave_intr_status *status)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
> +	int ret, stat, reg;
> +	int count = 0, retry = 3;
> +	unsigned int sdca_cascade, scp_sdca_stat1 = 0;
> +
> +	mutex_lock(&es9356->jack_lock);

what is the purpose of this jack_lock? 
> +	ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +	if (ret < 0)
> +		goto io_error;
> +	es9356->sdca_status = ret;
> +
> +	do {
> +		reg = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +		if (reg < 0)
> +			goto io_error;
> +		if (reg & SDW_SCP_SDCA_INTMASK_SDCA_1) {
> +			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
> +				SDW_SCP_SDCA_INT_SDCA_1, SDW_SCP_SDCA_INT_SDCA_1);
> +			if (ret < 0)
> +				goto io_error;
> +		}
> +
> +		if (reg & SDW_SCP_SDCA_INTMASK_SDCA_5) {
> +			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
> +				SDW_SCP_SDCA_INT_SDCA_5, SDW_SCP_SDCA_INT_SDCA_5);
> +			if (ret < 0)
> +				goto io_error;
> +		}
> +
> +		if (reg & SDW_SCP_SDCA_INTMASK_SDCA_7) {
> +			ret = sdw_update_no_pm(es9356->slave, SDW_SCP_SDCA_INT1,
> +				SDW_SCP_SDCA_INT_SDCA_7, SDW_SCP_SDCA_INT_SDCA_7);
> +			if (ret < 0)
> +				goto io_error;
> +		}
> +
> +		ret = sdw_read_no_pm(es9356->slave, SDW_DP0_INT);
> +		if (ret < 0)
> +			goto io_error;
> +		sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
> +
> +		ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			goto io_error;
> +		scp_sdca_stat1 = ret &
> +			(SDW_SCP_SDCA_INTMASK_SDCA_1 | SDW_SCP_SDCA_INTMASK_SDCA_5 | SDW_SCP_SDCA_INTMASK_SDCA_7);
> +
> +		stat = scp_sdca_stat1 || sdca_cascade;
> +
> +		count++;
> +	} while (stat != 0 && count < retry);
> +
> +	/* The 280 ms figure was determined through testing */
> +	if (status->sdca_cascade && !es9356->disable_irq)
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->interrupt_handle_work, msecs_to_jiffies(280));
> +
> +	mutex_unlock(&es9356->jack_lock);
> +	return 0;
> +
> +io_error:
> +	mutex_unlock(&es9356->jack_lock);
> +	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +	return ret;
> +}

> +static int es9356_sdca_dev_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	mutex_lock(&es9356->jack_lock);
> +	es9356->disable_irq = true;
> +	cancel_delayed_work_sync(&es9356->interrupt_handle_work);
> +	cancel_delayed_work_sync(&es9356->button_detect_work);
> +	mutex_unlock(&es9356->jack_lock);

same question on jack_lock, it seems suspicious to to the cancel parts within a locked section?

> +
> +	return 0;
> +}
> +
> +static int es9356_sdca_dev_system_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	regmap_write(es9356->regmap, SDW_SCP_SYSTEMCTRL, SDW_SCP_SYSTEMCTRL_WAKE_UP_EN | SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);

this doesn't seem right, the codec driver shouldn't modify generic registers.

I provided this feedback several versions ago...

> +
> +	return es9356_sdca_dev_suspend(dev);
> +}


