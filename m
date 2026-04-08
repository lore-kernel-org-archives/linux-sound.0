Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282FB351C0D
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631841; cv=none; b=ZzgqfFmfcTpDvZxLUM+a5epd6t5oowrOPoIMImJ8V599oLqYdRP1EWZGl1ur13S+QQj2NQYDGd3RbVSlM8WceePjRXCb1BC2eT9qBeyf5XWkGuXaAafTq7AsKMGrUadFS+QgKnVdXMXeyDXTuVgsrN5K1tx+JXVuCGQ2TiagkYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631841; c=relaxed/simple;
	bh=BAD4m5TbEobGBmpv3TAC1kwVLO5ts99kRW9bVAYn6wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGPKESKOmTIJmtwOZsiB9s5a3TFC/98Q8MWvuyk2pQXtXGVbfk6ttEV2gohl+r4cAGeMBhaWgEknq6gq53CcLTV1OEW0SLliU7YZJ8MYf22xvDXPQkUeYqhxQ1MbyX5xMakbnhyLHJEMK8gt75VHmSqPpLF/1TY4y3J0Fj62i+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i46YmMaY; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i46YmMaY"
Message-ID: <be951758-3cd0-4948-860e-384b40c4e1ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775631837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7vwCgCea8kFJ+PSCHYaCsPlG+nGkdrmC9TirOWIx4E=;
	b=i46YmMaYekHLM0b6Z73pBicol3LoOzhz84yCLLYCbqJuhAIO5KuoqmfT0cTyhVzPY8hJMm
	UinTi/LAjcmKeaKAApbulDC0x3OWq/EHIcMFNgj5E1TRXFteCw96k0E5ScNduA3VVudB5/
	eqX/AJF0vBL7KnpMFwczO70t8HJQnLw=
Date: Wed, 8 Apr 2026 09:03:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260407094829.2391-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260407094829.2391-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +struct tac5xx2_prv {
> +	struct snd_soc_component *component;
> +	struct sdw_slave *sdw_peripheral;
> +	struct sdca_function_data *sa_func_data;
> +	struct sdca_function_data *sm_func_data;
> +	struct sdca_function_data *uaj_func_data;
> +	struct sdca_function_data *hid_func_data;
> +	enum sdw_slave_status status;
> +	/* Lock for firmware download and PDE state transitions.
> +	 * Serializes FW caching/download and DAPM-driven power
> +	 * state changes to prevent PDE operations during firmware load.
> +	 */
> +	struct mutex pde_lock;
> +	/* serialize potential concurrnet uaj detection in .hw_params

concurrent

> +	 * during playback session and .interrupt_callback.
> +	 */
> +	struct mutex uaj_lock;
> +	struct regmap *regmap;
> +	struct device *dev;
> +	bool hw_init;
> +	bool first_hw_init;
> +	u32 part_id;
> +	unsigned int cx11_value;
> +	struct snd_soc_jack *hs_jack;
> +	int jack_type;
> +	 /* Custom fw binary. UMP File Download is not used. */
> +	const u8 *fw_data;
> +	size_t fw_size;
> +	bool fw_cached;
> +	bool fw_dl_success;
> +	u8 fw_binaryname[64];
> +};

> +static int tac_cx11_put(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct tac5xx2_prv *tac_dev;
> +	unsigned int val;
> +	int ret;
> +
> +	val = ucontrol->value.enumerated.item[0];
> +
> +	if (val >= ARRAY_SIZE(tac_cx11_mux_texts))
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -ENODEV;
> +
> +	tac_dev = snd_soc_component_get_drvdata(component);
> +	if (!tac_dev || !tac_dev->sdw_peripheral || !tac_dev->hw_init) {
> +		dev_err(component->dev, "failed to get driver data for cx put");
> +		return -ENODEV;
> +	}
> +
> +	if (tac_dev->cx11_value == val) {
> +		dev_dbg(tac_dev->dev, "cx put, same value");
> +		return 0; /* No change */
> +	}
> +
> +	tac_dev->cx11_value = val;
> +
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_CX11,
> +					TAC_SDCA_CTL_CX_CLK_SEL, 0),
> +			   val);

do you really want to let userspace control the clock sources?
In most cases the clock sources should only be changed to let the SDCA device operate on its own while the bus is stopped.
userspace has no concept of SoundWire bus stop, nor is it aware of when playback actually starts.
This deserves more explanations/discussions.


> +	if (ret) {
> +		dev_err(tac_dev->dev, "cx put failed: %d", ret);
> +		return ret;
> +	}
> +
> +	return 1;
> +}
> +
> +/* Volume controls for mic, hp and mic cap */
> +static const struct snd_kcontrol_new tac5xx2_snd_controls[] = {
> +	SOC_DOUBLE_R_RANGE_TLV("Amp Volume", TAC_AMP_LVL_CFG0, TAC_AMP_LVL_CFG1,
> +			       2, 0, 44, 1, tac5xx2_amp_tlv),
> +	TAC_DOUBLE_Q78_TLV("DMIC Capture Volume", SM, FU113),
> +	TAC_DOUBLE_Q78_TLV("Speaker Volume", SA, FU21),
> +	SOC_DAPM_ENUM_EXT("CX11 CS Select", tac_cx11_mux_enum, tac_cx11_get,
> +			  tac_cx11_put),
> +};
> +
> +static const struct snd_kcontrol_new tac_uaj_controls[] = {
> +	TAC_DOUBLE_Q78_TLV("UAJ Playback Volume", UAJ, FU41),
> +	SDCA_SINGLE_Q78_TLV("UAJ Capture Volume",
> +			    SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
> +					 TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS),
> +			   TAC_DVC_MIN, TAC_DVC_MAX, TAC_DVC_STEP, tac5xx2_dvc_tlv),
> +};
> +
> +static const struct snd_soc_dapm_widget tac5xx2_common_widgets[] = {
> +	/* Port 1: Speaker Playback Path */
> +	SND_SOC_DAPM_AIF_IN("AIF1 Playback", "DP1 Speaker Playback", 0,
> +			    SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_PGA("FU21_L", FU21_L_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU21_R", FU21_R_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU23_L", FU23_L_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU23_R", FU23_R_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_OUTPUT("SPK_L"),
> +	SND_SOC_DAPM_OUTPUT("SPK_R"),
> +
> +	/* Port 3: Smart Mic (DMIC) Capture Path */
> +	SND_SOC_DAPM_AIF_OUT("AIF3 Capture", "DP3 Mic Capture", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_INPUT("DMIC_L"),
> +	SND_SOC_DAPM_INPUT("DMIC_R"),
> +	SND_SOC_DAPM_PGA("IT11", IT11_USAGE_REG, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("CS11", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("CS18", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("CS113", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU11_L", FU11_L_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU11_R", FU11_R_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("PPU11", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("XU12", XU12_BYPASS_REG, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU113_L", FU113_L_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU113_R", FU113_R_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("OT113", OT113_USAGE_REG, 0, 0, NULL, 0),
> +};
> +
> +static const struct snd_soc_dapm_widget tac_uaj_widgets[] = {
> +	/* Port 4: UAJ (Headphone) Playback Path */
> +	SND_SOC_DAPM_AIF_IN("AIF4 Playback", "DP4 UAJ Speaker Playback", 0,
> +			    SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_PGA("IT41", IT41_USAGE_REG, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU41_L", FU41_L_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("FU41_R", FU41_R_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_PGA("XU42", XU42_BYPASS_REG, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("CS41", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_DAC("OT45", "DP4 UAJ Speaker Playback", OT45_USAGE_REG, 0, 0),
> +	SND_SOC_DAPM_OUTPUT("HP_L"),
> +	SND_SOC_DAPM_OUTPUT("HP_R"),
> +
> +	/* Port 7: UAJ (Headset Mic) Capture Path */
> +	SND_SOC_DAPM_AIF_OUT("AIF7 Capture", "DP7 UAJ Mic Capture", 0,
> +			     SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_INPUT("UAJ_MIC"),
> +	SND_SOC_DAPM_ADC("IT33", "DP7 UAJ Mic Capture", IT33_USAGE_REG, 0, 0),
> +	SND_SOC_DAPM_PGA("FU36", FU36_MUTE_REG, 0, 1, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("CS36", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("OT36", OT36_USAGE_REG, 0, 0, NULL, 0),
> +};
> +
> +static const struct snd_soc_dapm_route tac5xx2_common_routes[] = {
> +	/* Speaker Playback Path */
> +	{"FU21_L", NULL, "AIF1 Playback"},
> +	{"FU21_R", NULL, "AIF1 Playback"},
> +
> +	{"FU23_L", NULL, "FU21_L"},
> +	{"FU23_R", NULL, "FU21_R"},
> +
> +	{"SPK_L", NULL, "FU23_L"},
> +	{"SPK_R", NULL, "FU23_R"},
> +
> +	/* Smart Mic DAPM Routes */
> +	{"IT11", NULL, "DMIC_L"},
> +	{"IT11", NULL, "DMIC_R"},
> +	{"IT11", NULL, "CS11"},
> +	{"IT11", NULL, "CS18"},
> +	{"FU11_L", NULL, "IT11"},
> +	{"FU11_R", NULL, "IT11"},
> +	{"PPU11", NULL, "FU11_L"},
> +	{"PPU11", NULL, "FU11_R"},
> +	{"XU12", NULL, "PPU11"},
> +	{"FU113_L", NULL, "XU12"},
> +	{"FU113_R", NULL, "XU12"},
> +	{"FU113_L", NULL, "CS113"},
> +	{"FU113_R", NULL, "CS113"},
> +	{"OT113", NULL, "FU113_L"},
> +	{"OT113", NULL, "FU113_R"},
> +	{"OT113", NULL, "CS113"},
> +	{"AIF3 Capture", NULL, "OT113"},
> +};
> +
> +static const struct snd_soc_dapm_route tac_uaj_routes[] = {
> +	/* UAJ Playback routes */
> +	{"IT41", NULL, "AIF4 Playback"},
> +	{"IT41", NULL, "CS41"},
> +	{"FU41_L", NULL, "IT41"},
> +	{"FU41_R", NULL, "IT41"},
> +	{"XU42", NULL, "FU41_L"},
> +	{"XU42", NULL, "FU41_R"},
> +	{"OT45", NULL, "XU42"},
> +	{"OT45", NULL, "CS41"},
> +	{"HP_L", NULL, "OT45"},
> +	{"HP_R", NULL, "OT45"},
> +
> +	/* UAJ Capture routes */
> +	{"IT33", NULL, "UAJ_MIC"},
> +	{"IT33", NULL, "CS36"},
> +	{"FU36", NULL, "IT33"},
> +	{"OT36", NULL, "FU36"},
> +	{"OT36", NULL, "CS36"},
> +	{"AIF7 Capture", NULL, "OT36"},
> +};
> +
> +static s32 tac_set_sdw_stream(struct snd_soc_dai *dai,
> +			      void *sdw_stream, s32 direction)
> +{
> +	if (sdw_stream)
> +		snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
> +
> +	return 0;
> +}
> +
> +static void tac_sdw_shutdown(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	snd_soc_dai_set_dma_data(dai, substream, NULL);
> +}
> +
> +static int tac_clear_latch(struct tac5xx2_prv *priv)
> +{
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, TAC_INT_CFG, 0X00);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, TAC_INT_CFG,
> +				 TAC_INT_CFG_CLR_REG, TAC_INT_CFG_CLR_REG);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, TAC_INT_CFG, 0X00);
> +	return ret;
> +}
> +
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
> +	unsigned int actual_ps = 3; /* off */
> +	u8 sample_rate_idx = 0;
> +
> +	time = wait_for_completion_timeout(&sdw_peripheral->initialization_complete,
> +					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
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
> +	switch (dai->id) {
> +	case TAC5XX2_DMIC:
> +		function_id = TAC_FUNCTION_ID_SM;
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		port_num = TAC_SDW_PORT_NUM_DMIC;
> +		break;
> +	case TAC5XX2_UAJ:
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
> +		mutex_lock(&tac_dev->uaj_lock);
> +		tac5xx2_sdca_headset_detect(tac_dev);
> +		mutex_unlock(&tac_dev->uaj_lock);
> +		break;
> +	case TAC5XX2_SPK:
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_SPK_PLAYBACK :
> +				TAC_SDW_PORT_NUM_SPK_CAPTURE;
> +		break;
> +	default:
> +		dev_err(tac_dev->dev, "Invalid dai id: %d", dai->id);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&tac_dev->pde_lock);
> +	regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +						   TAC_SDCA_REQUESTED_PS, 0),
> +		     0x03);
> +	mutex_unlock(&tac_dev->pde_lock);
> +
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
> +	port_config.num = port_num;
> +	ret = sdw_stream_add_slave(sdw_peripheral, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +	if (ret) {
> +		dev_err(dai->dev,
> +			"Unable to configure port %d: %d\n", port_num, ret);
> +		return ret;
> +	}
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
> +		dev_dbg(tac_dev->dev, "Unsupported sample rate: %d Hz",
> +			params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	switch (function_id) {
> +	case TAC_FUNCTION_ID_SM:
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
> +			sample_rate_idx);
> +		if (ret) {
> +			dev_err(tac_dev->dev, "Failed to set CS113 sample rate: %d", ret);
> +			return ret;
> +		}
> +
> +		if (tac_dev->cx11_value) {
> +			ret = regmap_write(tac_dev->regmap,
> +					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS11,
> +							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +					sample_rate_idx);
> +		} else {
> +			ret = regmap_write(tac_dev->regmap,
> +					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS18,
> +							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
> +					sample_rate_idx);
> +		}
> +		if (ret) {
> +			dev_err(tac_dev->dev, "Failed to set %s sample rate: %d",
> +				tac_dev->cx11_value ? "CS11" : "CS18", ret);
> +			return ret;
> +		}
> +		break;
> +	case TAC_FUNCTION_ID_UAJ:
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
> +		break;
> +	case TAC_FUNCTION_ID_SA:
> +		/* SmartAmp: no additional sample rate configuration needed */
> +		break;
> +	}
> +
> +	mutex_lock(&tac_dev->pde_lock);
> +	retry = 3;
> +	/* make sure that power transition write is successful, before checking atual ps */
> +	do {
> +		ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +								 TAC_SDCA_REQUESTED_PS, 0),
> +				0x00);
> +		if (!ret)
> +			break;
> +
> +		dev_err(tac_dev->dev, "requested PS write err=%d, retry=%d", ret, retry);
> +		usleep_range(1000, 1200);
> +	} while (retry--);
> +
> +	retry = 3;
> +	do {
> +		ret = regmap_read(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +								TAC_SDCA_ACTUAL_PS, 0),
> +				  &actual_ps);
> +		if (ret) {
> +			dev_err(tac_dev->dev, "read actual PS err=%d: retry=%d", ret, retry);
> +			continue;
> +		}
> +
> +		if (!actual_ps)
> +			break;
> +
> +		if (retry)
> +			usleep_range(1000, 1200);
> +	} while (retry--);
> +
> +	if (actual_ps != 0x00)
> +		dev_warn(tac_dev->dev, "err PDE transition to D0: PS=0x%x\n",
> +			 actual_ps);
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
> +	switch (dai->id) {
> +	case TAC5XX2_DMIC:
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		function_id = TAC_FUNCTION_ID_SM;
> +		break;
> +	case TAC5XX2_UAJ:
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +		break;
> +	default:
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		break;
> +	}
> +	mutex_lock(&tac_dev->pde_lock);
> +	ret = regmap_write(tac_dev->regmap,
> +			   SDW_SDCA_CTL(function_id, pde_entity, 0x01, 0),
> +			   0x03);

you need to check the ACTUAL_PS as well, same as for PS3->PS0, otherwise you risk unlocking the PDE too early while it's transitioning state.

> +	mutex_unlock(&tac_dev->pde_lock);
> +
> +	return ret;
> +}

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
> +#endif

CONFIG_PCI makes no sense to me in a soundwire context. The parent is not a PCI bus, is it?

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

same here

> +	/* Default firmware name based on part ID */
> +	scnprintf(name, size, "%s%04x-%1X-%1X.bin",
> +		  part_id == 0x2883 ? "tas" : "tac",
> +		  part_id, bus->link_id, unique_id);
> +}
