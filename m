Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FF456DE9
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828119; cv=none; b=l+hRQi/baKT11fKTHgGVKxXwzBfznlwjUPAm3Yze0vpj645lPTOKwYXwnZ8k46HrA/oSyJ3niAlRf+JVJONqJeNdDS9NgxvhuIdpQp6HW/wjMhmUVcfOkxRNnUhpk1mLYiJ0DCYpHGXiPLxGSeRk7E0vkAiZfEh6Al8pII1y5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828119; c=relaxed/simple;
	bh=TZ3qenQJFicTEI9C0kYCuMjNHSmyytOuC51GUPiQlME=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uiYj4gts+J82NdC49Mj57NOcGZKosL1C43gkEu2y7b6qz4a9NiPQMIHPXeWycJK3d+CUc8OWrZNwGUMYlyXd3bDSx+XZjpqHeNNMzxrftsqz8ZzwaHMjvQEeNPe8K/5VUCBWsyDyH/xa5kH1UqZ0th1KIFQySfv9OWK8irWno4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NdIlcI+o; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NdIlcI+o"
Message-ID: <18b06aa8-dbf5-442d-8b7d-33b5fba9df40@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784828113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhN2pWgn16DnimEr/1dNlGwWea9hyYKPiEk/DBvvzIk=;
	b=NdIlcI+ootNNt5Gk/0RCAjEMv3eSFslfb4mqOLqqChZcVkhaCo4SnHDaFSqKHbZoslju1i
	KivNZ0rStmIqHk9h/SzVzQqdFm9a2j2M6gTEg5USqSjP1orGCRQdkkmGwacrWlQw86VWSj
	4ocCe36vYlz9rDYy3cw2sQpVFeE3iI4=
Date: Thu, 23 Jul 2026 19:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: =?UTF-8?B?UmU6IFvigJlQQVRDSOKAmSAyLzNdIEFTb0M6IGNvZGVjczogYWRkIG5l?=
 =?UTF-8?Q?w_SoundWire-based_SN624x?=
To: ming cong <ming.cong@senarytech.com>, broonie@kernel.org,
 julianbraha@gmail.com
Cc: qianghua.wang@senarytech.com, jim.tang@senarytech.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Niranjan H Y <niranjan.hy@ti.com>, Derek Fang <derek.fang@realtek.com>,
 Zhang Yi <zhangyi@everest-semi.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Miaoqian Lin <linmq006@gmail.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20260723063112.9086-1-ming.cong@senarytech.com>
Content-Language: en-US
In-Reply-To: <20260723063112.9086-1-ming.cong@senarytech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static const struct snd_soc_dapm_route sn6242_sdca_map[] = {
> +	{ "Headphone", NULL, "sn6242 HP" },
> +	{ "sn6242 MIC2", NULL, "Headset Mic" },
> +};
> +
> +static struct snd_soc_jack_pin senary_sdca_jack_pins[] = {
> +	{
> +		.pin    = "Headphone",
> +		.mask   = SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin    = "Headset Mic",
> +		.mask   = SND_JACK_MICROPHONE,
> +	},
> +};
> +
> +static const char * const need_sdca_suffix[] = {
> +	"sn6242", "sn6244", "sn6247"
> +};
> +
> +int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
> +	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_component *component;
> +	struct snd_soc_jack *jack;
> +	int ret;
> +	int i;
> +
> +	component = dai->component;
> +	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
> +					  "%s hs:%s",
> +					  card->components, component->name_prefix);
> +	if (!card->components)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
> +		if (strstr(component->name_prefix, need_sdca_suffix[i])) {
> +			/* Add -sdca suffix for existing UCMs */
> +			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
> +							  "%s-sdca", card->components);
> +			if (!card->components)
> +				return -ENOMEM;
> +			break;
> +		}
> +	}
> +
> +	if (strstr(component->name_prefix, "sn6242")) {
> +		ret = snd_soc_dapm_add_routes(dapm, sn6242_sdca_map,
> +					      ARRAY_SIZE(sn6242_sdca_map));
> +	} else if (strstr(component->name_prefix, "sn6244")) {
> +		ret = snd_soc_dapm_add_routes(dapm, sn6242_sdca_map,
> +					      ARRAY_SIZE(sn6242_sdca_map));
> +	} else if (strstr(component->name_prefix, "sn6247")) {
> +		ret = snd_soc_dapm_add_routes(dapm, sn6242_sdca_map,
> +					      ARRAY_SIZE(sn6242_sdca_map));

looks like all branches do the same thing, consider refactoring all this...

> +	} else {
> +		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
> +		return -EINVAL;
> +	}
> +
> +	if (ret) {
> +		dev_err(card->dev, "senary sdca jack map addition failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
> +					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
> +					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> +					 SND_JACK_BTN_3,
> +					 &ctx->sdw_headset,
> +					 senary_sdca_jack_pins,
> +					 ARRAY_SIZE(senary_sdca_jack_pins));
> +	if (ret) {
> +		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	jack = &ctx->sdw_headset;
> +
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +
> +	if (ret)
> +		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
> +			ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
> +
> +int asoc_sdw_senary_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
> +{
> +	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	if (!ctx->headset_codec_dev)
> +		return 0;
> +
> +	if (!SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
> +		return 0;
> +
> +	device_remove_software_node(ctx->headset_codec_dev);
> +	put_device(ctx->headset_codec_dev);
> +	ctx->headset_codec_dev = NULL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_exit, "SND_SOC_SDW_UTILS");
> +
> +int asoc_sdw_senary_sdca_jack_init(struct snd_soc_card *card,
> +			       struct snd_soc_dai_link *dai_links,
> +			       struct asoc_sdw_codec_info *info,
> +			       bool playback)
> +{
> +	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +	struct device *sdw_dev;
> +	int ret;
> +
> +	/*
> +	 * Jack detection should be only initialized once for headsets since
> +	 * the playback/capture is sharing the same jack
> +	 */
> +	if (ctx->headset_codec_dev)
> +		return 0;
> +
> +	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
> +	if (!sdw_dev)
> +		return -EPROBE_DEFER;
> +
> +	ret = senary_sdca_jack_add_codec_device_props(sdw_dev, ctx->mc_quirk);
> +	if (ret < 0) {
> +		put_device(sdw_dev);
> +		return ret;
> +	}
> +	ctx->headset_codec_dev = sdw_dev;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_init, "SND_SOC_SDW_UTILS");

quite a few lines from this file are just copy-pasted, is it time to try
and share these helpers?

> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index d8db8fc5313e..603e57a4f09c 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -1228,6 +1228,148 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		},
>  		.dai_num = 1,
>  	},
> +	{
> +		.part_id = 0x6244,
> +		.name_prefix = "sn6242",
> +		.ignore_internal_dmic = true,
> +		.dais = {
> +			{
> +				.direction = {true, true},
> +				.dai_name = "sn6242-sdca-aif",
> +				.dai_type = SOC_SDW_DAI_TYPE_JACK,
> +				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
> +				.init = asoc_sdw_senary_sdca_jack_init,
> +				.exit = asoc_sdw_senary_sdca_jack_exit,
> +				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
> +				.controls = generic_jack_controls,
> +				.num_controls = ARRAY_SIZE(generic_jack_controls),
> +				.widgets = generic_jack_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
> +			},
> +			{
> +				.direction = {true, false},
> +				.dai_name = "sn6242-sdca-aif2",
> +				.component_name = "sn6242",

not sure why there is a component_name only for capture?

> +				.dai_type = SOC_SDW_DAI_TYPE_AMP,
> +				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
> +				.init = asoc_sdw_senary_amp_init,
> +				.exit = asoc_sdw_senary_amp_exit,
> +				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
> +				.controls = generic_spk_controls,
> +				.num_controls = ARRAY_SIZE(generic_spk_controls),
> +				.widgets = generic_spk_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
> +				.quirk = SOC_SDW_CODEC_SPKR,
> +				.quirk_exclude = true,
> +			},
> +			{
> +				.direction = {false, true},
> +				.dai_name = "sn6242-sdca-aif3",
> +				.dai_type = SOC_SDW_DAI_TYPE_MIC,
> +				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
> +				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
> +				.quirk = SOC_SDW_CODEC_MIC,
> +				.quirk_exclude = true,
> +			},
> +		},
> +		.dai_num = 3,
> +	},
> +	{
> +		.part_id = 0x6242,
> +		.name_prefix = "sn6242",
> +		.ignore_internal_dmic = true,
> +		.dais = {
> +			{
> +				.direction = {true, true},
> +				.dai_name = "sn6242-sdca-aif",
> +				.dai_type = SOC_SDW_DAI_TYPE_JACK,
> +				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
> +				.init = asoc_sdw_senary_sdca_jack_init,
> +				.exit = asoc_sdw_senary_sdca_jack_exit,
> +				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
> +				.controls = generic_jack_controls,
> +				.num_controls = ARRAY_SIZE(generic_jack_controls),
> +				.widgets = generic_jack_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
> +			},
> +			{
> +				.direction = {true, false},
> +				.dai_name = "sn6242-sdca-aif2",
> +				.component_name = "sn6242",
> +				.dai_type = SOC_SDW_DAI_TYPE_AMP,
> +				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
> +				.init = asoc_sdw_senary_amp_init,
> +				.exit = asoc_sdw_senary_amp_exit,
> +				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
> +				.controls = generic_spk_controls,
> +				.num_controls = ARRAY_SIZE(generic_spk_controls),
> +				.widgets = generic_spk_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
> +				.quirk = SOC_SDW_CODEC_SPKR,
> +				.quirk_exclude = true,
> +			},
> +			{
> +				.direction = {false, true},
> +				.dai_name = "sn6242-sdca-aif3",
> +				.dai_type = SOC_SDW_DAI_TYPE_MIC,
> +				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
> +				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
> +				.quirk = SOC_SDW_CODEC_MIC,
> +				.quirk_exclude = true,
> +			},
> +		},
> +		.dai_num = 3,
> +	},
> +	{
> +		.part_id = 0x6247,
> +		.name_prefix = "sn6242",
> +		.ignore_internal_dmic = true,
> +		.dais = {
> +			{
> +				.direction = {true, true},
> +				.dai_name = "sn6242-sdca-aif",
> +				.dai_type = SOC_SDW_DAI_TYPE_JACK,
> +				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
> +				.init = asoc_sdw_senary_sdca_jack_init,
> +				.exit = asoc_sdw_senary_sdca_jack_exit,
> +				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
> +				.controls = generic_jack_controls,
> +				.num_controls = ARRAY_SIZE(generic_jack_controls),
> +				.widgets = generic_jack_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
> +			},
> +			{
> +				.direction = {true, false},
> +				.dai_name = "sn6242-sdca-aif2",
> +				.component_name = "sn6242",
> +				.dai_type = SOC_SDW_DAI_TYPE_AMP,
> +				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
> +				.init = asoc_sdw_senary_amp_init,
> +				.exit = asoc_sdw_senary_amp_exit,
> +				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
> +				.controls = generic_spk_controls,
> +				.num_controls = ARRAY_SIZE(generic_spk_controls),
> +				.widgets = generic_spk_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
> +				.quirk = SOC_SDW_CODEC_SPKR,
> +				.quirk_exclude = true,
> +			},
> +			{
> +				.direction = {false, true},
> +				.dai_name = "sn6242-sdca-aif3",
> +				.dai_type = SOC_SDW_DAI_TYPE_MIC,
> +				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
> +				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
> +				.widgets = generic_dmic_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
> +				.controls = generic_dmic_controls,
> +				.num_controls = ARRAY_SIZE(generic_dmic_controls),
> +				.quirk = SOC_SDW_CODEC_MIC,
> +				.quirk_exclude = true,
> +			},
> +		},
> +		.dai_num = 3,

all those 3 dais look identical, the only difference is the part_id.
Isn't there a better way to define and represent these dais?

> +	},
>  };
>  EXPORT_SYMBOL_NS(codec_info_list, "SND_SOC_SDW_UTILS");
>  

