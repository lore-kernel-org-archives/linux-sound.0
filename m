Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3FC37C10F
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302656; cv=none; b=ib/EZ/0mHZNegN+WwSaDGTkDPB5RNQtAnyzGYv0wQm3qlZGlgCjlAVAhbbtIDFNa9TQ7Tu9ukYU0VzK3oPGmIsm0XOgNQLcUhdyilEDIIrQ2C2yutMzHovMXGfFDtlmzE4JLoKTaYGWDo1zQRxvj5wfJf353ce8GQqrlTuSIAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302656; c=relaxed/simple;
	bh=YZ3+GFKwrOvSycDL4t7i4EkltuaHxufg5gntG7mzqbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umUePp3K2rB0GPPU3SQvWk74oHOq7o1yz+zCLosvgfJSiG2/6UruB8cNUe9w6YR2CjG8y53vUZLalBUhvchTnORFM5mOzNGcTlaZZpRlp0XsMjPT2npgdZWfprKVKZ2t2xLZXnrsilWNuvxO31w7QmWm4qKlLBxk23pSnRfKwQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NaJMBDlY; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NaJMBDlY"
Message-ID: <b79e1263-e696-45a1-a335-e023058ad035@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZsJ1QjL75kA17HXLkwMXAgOjgcrZQpfK8QOJKz49TI=;
	b=NaJMBDlYfWiRfu3D0PcjEcs7ZNUCtjRtZ/vpEEcqI4pKrxxZ0W91yJj0eFrF5pJoDmE/b7
	P4Yorw9+qqmq5rIkVKw/ChbPid0JRpKpRh+BzDTPHOoaK+bNZw8aaP/lrffgS71WuQerK9
	+1Su3novfAJAOWbSe3HyWf4oA8+5ZuI=
Date: Mon, 23 Mar 2026 14:40:42 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20260323041545.2101-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260323041545.2101-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +#define TAC5XX2_PROBE_TIMEOUT 10000

Best to include the unit in the define, e.g.
#define TAC5XX2_PROBE_TIMEOUT_MS 10000

> +#define TAS2883_DEFAULT_FW_NAME	 "tas2883-default.bin"

it wouldn't hurt to add a comment, in theory firmware is supposed to be extracted using platform-specific ACPI mappings.


> +struct tac5xx2_prv {
> +	struct snd_soc_component *component;
> +	struct sdw_slave *sdw_peripheral;
> +	struct sdca_function_data *sa_func_data;
> +	struct sdca_function_data *sm_func_data;
> +	struct sdca_function_data *uaj_func_data;
> +	struct sdca_function_data *hid_func_data;
> +	enum sdw_slave_status status;
> +	/* pde lock */
> +	struct mutex pde_lock;

it wouldn't hurt to explain why you need a lock here.
In theory the PDE needs to be activated based on DAPM information.

> +	struct regmap *regmap;
> +	struct device *dev;
> +	bool hw_init;
> +	bool first_hw_init;
> +	u32 part_id;
> +	unsigned int cx11_default_value;
> +	struct snd_soc_jack *hs_jack;
> +	int jack_type;
> +	/* lock for fw download */
> +	struct mutex fw_lock;

same, why do you need a lock for fw download?
Isn't this chip using the SDCA method to download firmware with UMP?
If not, a note would help...

> +	const u8 *fw_data;
> +	size_t fw_size;
> +	bool fw_cached;
> +	bool fw_dl_success;
> +	u8 fw_binaryname[64];
> +};

> +static int tac_cx11_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct tac5xx2_prv *tac_dev;
> +
> +	ucontrol->value.enumerated.item[0] = 1; /* Default to DC:1 */

If DC refers to "defined constant", what's the point of exposing this control?

And you should explain how the clock selection is supposed to work, it's not something we've seen before in SDCA chips.

> +	if (!kcontrol || !kcontrol->private_data)
> +		return 0;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return 0;
> +
> +	tac_dev = snd_soc_component_get_drvdata(component);
> +	if (!tac_dev)
> +		return 0;
> +
> +	ucontrol->value.enumerated.item[0] = tac_dev->cx11_default_value;
> +
> +	return 0;
> +}

> +/* Convert dB to Q7.8 format (16-bit signed value) */
> +static inline u16 db_to_q7_8(int db_value_times_100)
> +{
> +	u16 result = (u16)(((db_value_times_100 * 256) / 100) & 0xFFFF);
> +	return result;
> +}
> +
> +/* Convert Q7.8 format to dB*100 */
> +static inline int q7_8_to_db_times_100(u16 q7_8_value)
> +{
> +	s16 signed_val = (s16)q7_8_value;
> +
> +	return (signed_val * 100) / 256;
> +}

Didn't Charles Keepax add some macros for the Q7.8 format?



> +static int tac_fu_event(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	int mute;
> +	int channel;
> +	int function_number, fu_entity;
> +
> +	/* right channel and mono case uses ch 2.*/
> +	if (strstr(w->name, "_L"))
> +		channel = TAC_CHANNEL_LEFT;
> +	else
> +		channel = TAC_CHANNEL_RIGHT;
> +
> +	if (strstr(w->name, "FU21")) {
> +		fu_entity = TAC_SDCA_ENT_FU21;
> +		function_number = TAC_FUNCTION_ID_SA;
> +	} else if (strstr(w->name, "FU23")) {
> +		fu_entity = TAC_SDCA_ENT_FU23;
> +		function_number = TAC_FUNCTION_ID_SA;
> +	} else if (strstr(w->name, "FU11")) {
> +		fu_entity = TAC_SDCA_ENT_FU11;
> +		function_number = TAC_FUNCTION_ID_SM;
> +	} else if (strstr(w->name, "FU113")) {
> +		fu_entity = TAC_SDCA_ENT_FU113;
> +		function_number = TAC_FUNCTION_ID_SM;
> +	} else if (strstr(w->name, "FU26")) {
> +		fu_entity = TAC_SDCA_ENT_FU26;
> +		function_number = TAC_FUNCTION_ID_SA;
> +	} else if (strstr(w->name, "FU13")) {
> +		fu_entity = TAC_SDCA_ENT_FU13;
> +		function_number = TAC_FUNCTION_ID_SM;
> +	} else if (strstr(w->name, "FU41")) {
> +		fu_entity = TAC_SDCA_ENT_FU41;
> +		function_number = TAC_FUNCTION_ID_UAJ;
> +	} else if (strstr(w->name, "FU36")) {
> +		fu_entity = TAC_SDCA_ENT_FU36;
> +		function_number = TAC_FUNCTION_ID_UAJ;
> +	} else {
> +		return -EINVAL;
> +	}

when I see this code, it makes me wonder if it's not better to have one driver per function, rather than one driver that takes care of multiple functions?

> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		mute = 0;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		mute = 1;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return regmap_write(tac_dev->regmap,
> +			       SDW_SDCA_CTL(function_number, fu_entity,
> +					    TAC_SDCA_CHANNEL_MUTE, channel),
> +			       mute);
> +}

> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct sdw_slave *sdw_peripheral = tac_dev->sdw_peripheral;
> +	unsigned long time;
> +	int ret, retry;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	u8 sample_rate_idx = 0;
> +
> +	time = wait_for_completion_timeout(&sdw_peripheral->initialization_complete,
> +					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT));
> +	if (!time) {
> +		dev_warn(tac_dev->dev, "%s: hw initialization timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev,
> +			"error: operation without hw initialization");
> +		return -EINVAL;
> +	}
> +
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!sdw_stream) {
> +		dev_err(tac_dev->dev, "failed to get dma data");
> +		return -EINVAL;
> +	}
> +
> +	ret = tac_clear_latch(tac_dev);
> +	if (ret)
> +		dev_warn(tac_dev->dev, "clear latch failed, err=%d", ret);
> +
> +	if (dai->id == TAC5XX2_DMIC) {
> +		function_id = TAC_FUNCTION_ID_SM;
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		port_num = TAC_SDW_PORT_NUM_DMIC;
> +	} else if (dai->id == TAC5XX2_UAJ) {
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_UAJ_PLAYBACK :
> +				TAC_SDW_PORT_NUM_UAJ_CAPTURE;
> +		/* Detect and set jack type for UAJ path before playback.
> +		 * This is required as jack is not triggering interrupt
> +		 * when the device is in suspended mode.
> +		 */
> +		tac5xx2_sdca_headset_detect(tac_dev);
> +	} else if (dai->id == TAC5XX2_SPK) {
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_SPK_PLAYBACK :
> +				TAC_SDW_PORT_NUM_SPK_CAPTURE;
> +	} else {
> +		dev_err(tac_dev->dev, "Invalid dai id: %d", dai->id);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +							 TAC_SDCA_REQUESTED_PS, 0),
> +			   0x03);

isn't a wait on the ACTUAL_PS required here?

> +
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
> +	port_config.num = port_num;
> +	ret = sdw_stream_add_slave(sdw_peripheral, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret)
> +		dev_err(dai->dev,
> +			"Unable to configure port %d: %d\n", port_num, ret);
> +
> +	switch (params_rate(params)) {
> +	case 48000:
> +		sample_rate_idx = 0x01;
> +		break;
> +	case 44100:
> +		sample_rate_idx = 0x02;
> +		break;
> +	case 96000:
> +		sample_rate_idx = 0x03;
> +		break;
> +	case 88200:
> +		sample_rate_idx = 0x04;
> +		break;
> +	default:
> +		dev_err(tac_dev->dev, "Unsupported sample rate: %d Hz",
> +			params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	if (function_id == TAC_FUNCTION_ID_SM) {
> +		ret = regmap_write(tac_dev->regmap,
> +				   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_PPU11,
> +						TAC_SDCA_CTL_PPU_POSTURE_NUM, 0),
> +				      0);
> +		if (ret) {
> +			dev_err(tac_dev->dev, "Failed to set PPU11: %d", ret);
> +			return ret;
> +		}
> +
> +		ret = regmap_write(tac_dev->regmap,
> +				   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS113,
> +						TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +				sample_rate_idx);
> +		if (ret) {
> +			dev_err(tac_dev->dev, "Failed to set CS113 sample rate: %d", ret);
> +			return ret;
> +		}
> +	} else if (function_id == TAC_FUNCTION_ID_UAJ) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			ret = regmap_write(tac_dev->regmap,
> +					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS41,
> +							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +					sample_rate_idx);
> +			if (ret) {
> +				dev_err(tac_dev->dev, "Failed to set CS41 sample rate: %d", ret);
> +				return ret;
> +			}
> +		} else {
> +			ret = regmap_write(tac_dev->regmap,
> +					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS36,
> +							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +					sample_rate_idx);
> +			if (ret) {
> +				dev_err(tac_dev->dev, "Failed to set CS36 sample rate: %d", ret);
> +				return ret;
> +			}
> +		}
> +	}
> +	mutex_lock(&tac_dev->pde_lock);
> +	retry = 3;
> +	do {
> +		ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +								 TAC_SDCA_REQUESTED_PS, 0),
> +				0x00);
> +		if (!ret)
> +			break;
> +		usleep_range(2000, 2200);
> +	} while (retry--);

and here there's a loop but it keeps writing the REQUESTED_PS without checking the ACTUAL_PS.

This doesn't seem to be aligned with SDCA concepts, either the hardware does something different that should be documented or the code should be updated?

> +
> +	if (ret)
> +		dev_warn(tac_dev->dev,
> +			 "Failed to set PDE power state ON: %d", ret);
> +	mutex_unlock(&tac_dev->pde_lock);
> +
> +	return 0;
> +}
> +
> +static s32 tac_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	s32 ret;
> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream =
> +		snd_soc_dai_get_dma_data(dai, substream);
> +	int pde_entity, function_id;
> +
> +	sdw_stream_remove_slave(tac_dev->sdw_peripheral, sdw_stream);
> +
> +	if (dai->id == TAC5XX2_DMIC) {
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		function_id = TAC_FUNCTION_ID_SM;
> +	} else if (dai->id == TAC5XX2_UAJ) {
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +	} else {
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +	}
> +	mutex_lock(&tac_dev->pde_lock);
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(function_id, pde_entity, 0x01, 0),
> +			   0x03);
> +	mutex_unlock(&tac_dev->pde_lock);

I don't see the point of this lock?
The PDE should be defined as a power supply that gets activated when paths become active, no?

> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_dai_ops tac_dai_ops = {
> +	.hw_params = tac_sdw_hw_params,
> +	.hw_free = tac_sdw_pcm_hw_free,
> +	.set_stream = tac_set_sdw_stream,
> +	.shutdown = tac_sdw_shutdown,
> +};
> +
> +static int tac5xx2_sdca_btn_type(unsigned char *buffer, struct tac5xx2_prv *tac_dev)
> +{
> +	if (*buffer == 1) /* play pause */
> +		return SND_JACK_BTN_0;
> +	else if (*buffer == 10) /* vol down */
> +		return SND_JACK_BTN_3;
> +	else if (*buffer == 8) /* vol up */
> +		return SND_JACK_BTN_2;
> +	else if (*buffer == 4) /* long press*/
> +		return SND_JACK_BTN_1;
> +	else if ((*buffer == 2) || (*buffer == 32)) /* next song */
> +		return SND_JACK_BTN_4;
> +	else
> +		return 0;
> +}
> +
> +static int tac5xx2_sdca_button_detect(struct tac5xx2_prv *tac_dev)
> +{
> +	unsigned int btn_type, offset, idx;
> +	int ret, value, owner;
> +	u8 buf[2];
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				       TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
> +	if (ret) {
> +		dev_err(tac_dev->dev,
> +			"Failed to read current UMP message owner 0x%x", ret);
> +		return ret;
> +	}
> +
> +	if (owner == 1) {
> +		dev_dbg(tac_dev->dev, "current owner is host, skipping..");
> +		return 0;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				       TAC_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0), &value);
> +	if (ret) {
> +		dev_err(tac_dev->dev,
> +			"Failed to read current UMP message offset: %d", ret);
> +		goto end_btn_det;
> +	}
> +
> +	dev_dbg(tac_dev->dev, "btn_ message offset = %x", value);
> +	offset = value;
> +
> +	for (idx = 0; idx < sizeof(buf); idx++) {
> +		ret = regmap_read(tac_dev->regmap,
> +				  TAC_BUF_ADDR_HID1 + offset + idx, &value);
> +		if (ret) {
> +			dev_err(tac_dev->dev,
> +				"Failed to read HID buffer: %d", ret);
> +			goto end_btn_det;
> +		}
> +		buf[idx] = value & 0xff;
> +	}
> +
> +	if (buf[0] == 0x1) {
> +		btn_type = tac5xx2_sdca_btn_type(&buf[1], tac_dev);
> +		ret = btn_type;
> +	}
> +
> +end_btn_det:
> +	if (!owner)
> +		regmap_write(tac_dev->regmap,
> +			     SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +					  TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
> +
> +	return ret;
> +}
> +
> +static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
> +{
> +	int val, ret;
> +
> +	if (!tac_has_uaj_support(tac_dev))
> +		return 0;
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
> +				       TAC_SDCA_CTL_DET_MODE, 0), &val);
> +	if (ret) {
> +		dev_err(tac_dev->dev, "Failed to read the detect mode");
> +		return ret;
> +	}
> +
> +	switch (val) {
> +	case 3:
> +		tac_dev->jack_type = SND_JACK_LINEOUT;
> +		break;
> +	case 4:
> +		tac_dev->jack_type = SND_JACK_MICROPHONE;
> +		break;
> +	case 5:
> +		tac_dev->jack_type = SND_JACK_HEADPHONE;
> +		break;
> +	case 6:
> +		tac_dev->jack_type = SND_JACK_HEADSET;
> +		break;
> +	case 7:
> +		tac_dev->jack_type = SND_JACK_LINEIN;
> +		break;
> +	case 0:
> +	default:
> +		tac_dev->jack_type = 0;
> +		break;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
> +					TAC_SDCA_CTL_SEL_MODE, 0), val);
> +	if (ret)
> +		dev_err(tac_dev->dev, "Failed to update the jack type to device");
> +
> +	return 0;
> +}
> +
> +static int tac5xx2_set_jack(struct snd_soc_component *component,
> +			    struct snd_soc_jack *hs_jack, void *data)
> +{
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	if (!tac_has_uaj_support(tac_dev))
> +		return 0;
> +
> +	tac_dev->hs_jack = hs_jack;
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev, "jack init failed, hw not initialized");
> +		return 0;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_11);
> +	if (ret)
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register jack detection interrupt");
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_16);
> +	if (ret)
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register for button detect interrupt");
> +
> +	return ret;
> +}
> +
> +static int tac_interrupt_callback(struct sdw_slave *slave,
> +				  struct sdw_slave_intr_status *status)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
> +	struct device *dev = &slave->dev;
> +	int ret = 0, value;
> +	int btn_type = 0;
> +	unsigned int sdca_int1, sdca_int2, sdca_int3, sdca_int4;
> +
> +	if (status->control_port) {
> +		if (status->control_port & SDW_SCP_INT1_PARITY)
> +			dev_warn(dev, "SCP: Parity error interrupt");
> +		if (status->control_port & SDW_SCP_INT1_BUS_CLASH)
> +			dev_warn(dev, "SCP: Bus clash interrupt");
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT1, &sdca_int1);
> +	if (ret) {
> +		dev_err(dev, "Failed to read SDCA_INT1: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT2, &sdca_int2);
> +	if (ret) {
> +		dev_err(dev, "Failed to read SDCA_INT2: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT3, &sdca_int3);
> +	if (ret) {
> +		dev_err(dev, "Failed to read SDCA_INT3: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT4, &sdca_int4);
> +	if (ret) {
> +		dev_err(dev, "Failed to read SDCA_INT4: %d", ret);
> +		return ret;
> +	}
> +
> +	if (sdca_int1)
> +		dev_dbg(dev, "SDCA_INT1: 0x%02x", sdca_int1);
> +	if (sdca_int2)
> +		dev_dbg(dev, "SDCA_INT2: 0x%02x", sdca_int2);
> +	if (sdca_int3)
> +		dev_dbg(dev, "SDCA_INT3: 0x%02x", sdca_int3);
> +	if (sdca_int4)
> +		dev_dbg(dev, "SDCA_INT4: 0x%02x", sdca_int4);
> +
> +	/* read jack status */
> +	ret = tac5xx2_sdca_headset_detect(tac_dev);
> +	if (ret < 0)
> +		goto clear;
> +
> +	btn_type = tac5xx2_sdca_button_detect(tac_dev);
> +	if (btn_type < 0)
> +		btn_type = 0;
> +
> +	if (tac_dev->jack_type == 0)
> +		btn_type = 0;
> +
> +	dev_dbg(tac_dev->dev, "in %s, jack_type=%d\n", __func__, tac_dev->jack_type);
> +	dev_dbg(tac_dev->dev, "in %s, btn_type=0x%x\n", __func__, btn_type);
> +
> +	if (!tac_dev->hs_jack)
> +		goto clear;
> +
> +	snd_soc_jack_report(tac_dev->hs_jack, tac_dev->jack_type | btn_type,
> +			    SND_JACK_HEADSET | SND_JACK_BTN_0 |
> +				SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> +				SND_JACK_BTN_3 | SND_JACK_BTN_4);
> +
> +clear:
> +	for (int i = 1; i <= 4; i++) {
> +		int control_selector = 0x10;

shouldn't you clear only the interrupts that were detected earlier?

This loop could lead you to clear an interrupt you haven't dealt with, no great for jack detection...

> +
> +		if (i == TAC_FUNCTION_ID_HID)
> +			control_selector = 0x1;
> +		ret = regmap_read(tac_dev->regmap,
> +				  SDW_SDCA_CTL(i, 0, control_selector, 0), &value);
> +
> +		if (!ret) {
> +			dev_dbg(tac_dev->dev,
> +				"Function status for function id: 0x%x is 0x%x", i, value);
> +			ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(i, 0, 0x10, 0), value);
> +			if (ret)
> +				dev_dbg(tac_dev->dev,
> +					"Failed to clear the function status interrupt");
> +		} else {
> +			dev_dbg(tac_dev->dev,
> +				"Failed to read the function statuspt for function id: 0x%x", i);
> +		}
> +	}
> +
> +	/* clear interrupts */
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT1, sdca_int1);
> +	if (ret)
> +		dev_dbg(tac_dev->dev, "Failed to clear SDW_SCP_SDCA_INT1");
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT2, sdca_int2);
> +	if (ret)
> +		dev_dbg(tac_dev->dev, "Failed to clear SDW_SCP_SDCA_INT2");
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT3, sdca_int3);
> +	if (ret)
> +		dev_dbg(tac_dev->dev, "Failed to clear SDW_SCP_SDCA_INT3");
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT4, sdca_int4);
> +	if (ret)
> +		dev_dbg(tac_dev->dev, "Failed to clear SDW_SCP_SDCA_INT4");

same here, only clear that was detected earlier...

> +
> +	return ret;
> +}
>
> +#if IS_ENABLED(CONFIG_PCI)
> +static struct pci_dev *tac_get_pci_dev(struct sdw_slave *peripheral)
> +{
> +	struct device *dev = &peripheral->dev;
> +
> +	for (; dev; dev = dev->parent) {
> +		if (dev->bus == &pci_bus_type)
> +			return to_pci_dev(dev);
> +	}
> +
> +	return NULL;
> +}
> +#else
> +static struct pci_dev *tac_get_pci_dev(struct sdw_slave *peripheral)
> +{
> +	return NULL;
> +}
> +#endif

Is this CONFIG_PCI stuff relevant for an SDCA device? The PCI stuff looks copy/pasted from an HDAudio codec driver, I don't see how this might work for a SoundWire device?

> +
> +static void tac_generate_fw_name(struct sdw_slave *slave, char *name, size_t size)
> +{
> +	struct sdw_bus *bus = slave->bus;
> +	u16 part_id = slave->id.part_id;
> +	u8 unique_id = slave->id.unique_id;
> +#if IS_ENABLED(CONFIG_PCI)
> +	struct pci_dev *pci = tac_get_pci_dev(slave);
> +
> +	if (pci) {
> +		scnprintf(name, size, "%04X-%1X-%1X.bin",
> +			  pci->subsystem_device, bus->link_id, unique_id);
> +		return;
> +	}
> +#endif
> +	/* Default firmware name based on part ID */
> +	scnprintf(name, size, "%s%04x-%1X-%1X.bin",
> +		  part_id == 0x2883 ? "tas" : "tac",
> +		  part_id, bus->link_id, unique_id);
> +}
> +
> +static s32 tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
> +	s32 ret = 0;
> +
> +	if (tac_dev->hw_init) {
> +		dev_dbg(dev, "early return hw_init already done..");
> +		return 0;
> +	}
> +
> +	if (tac_has_dsp_algo(tac_dev)) {
> +		tac_generate_fw_name(slave, tac_dev->fw_binaryname,
> +				     sizeof(tac_dev->fw_binaryname));
> +
> +		if (!tac_dev->fw_cached) {
> +			ret = tac_load_and_cache_firmware(tac_dev);
> +			if (ret)
> +				dev_dbg(dev, "failed to load fw: %d, use rom mode\n", ret);
> +		}
> +
> +		if (tac_dev->fw_cached) {
> +			ret = tac_download_fw_to_hw(tac_dev);
> +			if (ret) {
> +				dev_err(dev, "FW download failed, fw: %d\n", ret);
> +				goto io_init_err;
> +			}
> +		}
> +	}

shouldn't the driver read the NEEDS_FIRMARE status bit before downloading firmware?

> +
> +	if (tac_dev->sa_func_data) {
> +		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
> +					     tac_dev->sa_func_data);
> +		if (ret) {
> +			dev_err(dev, "smartamp init table update failed\n");
> +			goto io_init_err;
> +		} else {
> +			dev_dbg(dev, "smartamp init done\n");
> +		}
> +
> +		if (first) {
> +			ret = regmap_multi_reg_write(tac_dev->regmap, tac_spk_seq,
> +						     ARRAY_SIZE(tac_spk_seq));
> +			if (ret) {
> +				dev_err(dev, "init writes failed, err=%d", ret);
> +				goto io_init_err;
> +			}
> +		}
> +	}
> +
> +	if (tac_dev->sm_func_data) {
> +		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
> +					     tac_dev->sm_func_data);
> +		if (ret) {
> +			dev_err(dev, "smartmic init table update failed\n");
> +			goto io_init_err;
> +		} else {
> +			dev_dbg(dev, "smartmic init done\n");
> +		}
> +
> +		/* Set default value to DC:1 */
> +		tac_dev->cx11_default_value = 1;
> +
> +		ret = regmap_write(tac_dev->regmap,
> +				   SDW_SDCA_CTL(TAC_FUNCTION_ID_SM,
> +						TAC_SDCA_ENT_CX11,
> +						TAC_SDCA_CTL_CX_CLK_SEL, 0),
> +				   tac_dev->cx11_default_value);
> +		if (ret)
> +			dev_warn(dev, "Failed to set CX11 default: %d", ret);
> +
> +		if (first) {
> +			ret = regmap_multi_reg_write(tac_dev->regmap, tac_sm_seq,
> +						     ARRAY_SIZE(tac_sm_seq));
> +			if (ret) {
> +				dev_err(tac_dev->dev,
> +					"init writes failed, err=%d", ret);
> +				goto io_init_err;
> +			}
> +		}

this is mixing table inits, clock setup and regmap init, is this intentional or could this be refactors with other bits done in hw_params?

> +	}
> +
> +	if (tac_dev->uaj_func_data) {
> +		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
> +					     tac_dev->uaj_func_data);
> +		if (ret) {
> +			dev_err(dev, "uaj init table update failed\n");
> +			goto io_init_err;
> +		} else {
> +			dev_dbg(dev, "uaj init done\n");
> +		}
> +
> +		if (first) {
> +			ret = regmap_multi_reg_write(tac_dev->regmap, tac_uaj_seq,
> +						     ARRAY_SIZE(tac_uaj_seq));
> +			if (ret) {
> +				dev_err(tac_dev->dev,
> +					"init writes failed, err=%d", ret);
> +				goto io_init_err;
> +			}
> +		}
> +	}
> +
> +	if (tac_dev->hid_func_data) {
> +		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
> +					     tac_dev->hid_func_data);
> +		if (ret) {
> +			dev_err(dev, "hid init table update failed\n");
> +			goto io_init_err;
> +		} else {
> +			dev_dbg(dev, "hid init done\n");
> +		}
> +
> +		/* register for interrupts */
> +		ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
> +				   SDW_SCP_SDCA_INTMASK_SDCA_11);
> +		if (ret)
> +			dev_err(dev, "Failed to register jack detection interrupt");
> +
> +		ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
> +				   SDW_SCP_SDCA_INTMASK_SDCA_16);
> +		if (ret)
> +			dev_err(dev, "Failed to register for button detect interrupt");
> +	}
> +
> +	tac_dev->hw_init = true;
> +
> +	return 0;
> +
> +io_init_err:
> +	dev_err(dev, "init writes failed, err=%d", ret);
> +	return ret;
> +}


