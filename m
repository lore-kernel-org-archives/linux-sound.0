Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED9381AE3;
	Mon, 23 Mar 2026 21:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302660; cv=none; b=rLDBayRaMmjIFHP6NVpvIWK/+o6RZPdI1vw5x5Q1rZwtcmr44ARIhcREzovy+nF1gFQKrwPEfax5EJgP2ZO8i/Ccb218Fg0FoV/XeyFuaKd5VsIZElJgBSu709RBvFJOlDM2pJBTbM6XgyMFz31M56gaoeZhGBfey6vOEuR2k4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302660; c=relaxed/simple;
	bh=39ED6l3RxVN9xEHCaUM8xpQOsa/7sqx9JTKwdc5sRhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip2yDsIeC6zgLseLvfYPLXR9+4blZ13o6jj8htJlGP/VdNeFvgkB1gY4UmhOAJFoEggYI8mXLHa9s0l1pZuQD84TbCbaTtSvewt0ofnDLBXvqgIn5GFFUUMOaWL086aVcpEui2l+2jSP3ddidt+98uAU46QrbwJTXzCiKZPQh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bBWvcWv4; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bBWvcWv4"
Message-ID: <3f9272bb-76f2-4d45-8406-0da71344436b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdnyduQcz5PihYpk1kWvQaozoysu3+PmWLrPfwdna0U=;
	b=bBWvcWv4bc6uk+XpumJf1zRp1O96m7LnQcBySVrSgbv9b+EWm87HJ9lJD9zmbMV2Tyqosh
	U/WS4+jb2afXiBa7NTn4abYIBJgXXWQMhXl+d+j/7NhKyzw6lT4SrDY1yBZXy2YVKcRcJj
	LSldb5LM5qOxjr6W1HXy9WBMlGid/sM=
Date: Mon, 23 Mar 2026 14:43:00 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/4] ASoC: sdw_utils: add vendor_id to
 asoc_sdw_codec_info
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260323041505.2088-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260323041505.2088-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/22/26 21:15, Niranjan H Y wrote:
>  struct asoc_sdw_codec_info has part_id which is not
> sufficient to uniquely identify devices. This change
> adds the vendor_id field and updates the codec_info
> list with the corresponding vendor id as per the
> Manufacturer's id in https://mid.mipi.org/
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

IMHO this should be a single patch applied *before* the TI-specific code is added.
We've known for some time that the partID would not be sufficient to find a device, this adds the vendor ID.

For this patch only:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  include/sound/soc_sdw_utils.h       |  1 +
>  sound/soc/sdw_utils/soc_sdw_utils.c | 46 +++++++++++++++++++++++++----
>  sound/soc/sof/intel/hda.c           |  7 +++--
>  3 files changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 98531e500cbb..48f516ba682f 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -71,6 +71,7 @@ struct asoc_sdw_aux_info {
>  };
>  
>  struct asoc_sdw_codec_info {
> +	const int vendor_id;
>  	const int part_id;
>  	const int version_id;
>  	const char *name_prefix;
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 75658148df57..0daffd78f58c 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -73,6 +73,7 @@ static const struct snd_kcontrol_new rt700_controls[] = {
>  
>  struct asoc_sdw_codec_info codec_info_list[] = {
>  	{
> +		.vendor_id = 0x0102,
>  		.part_id = 0x0000, /* TAS2783A */
>  		.name_prefix = "tas2783",
>  		.dais = {
> @@ -92,6 +93,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x700,
>  		.name_prefix = "rt700",
>  		.dais = {
> @@ -110,6 +112,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x711,
>  		.name_prefix = "rt711",
>  		.version_id = 3,
> @@ -131,6 +134,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x711,
>  		.name_prefix = "rt711",
>  		.version_id = 2,
> @@ -152,6 +156,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x712,
>  		.name_prefix = "rt712",
>  		.version_id = 3,
> @@ -194,6 +199,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 3,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1712,
>  		.name_prefix = "rt712-dmic",
>  		.version_id = 3,
> @@ -209,6 +215,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x713,
>  		.name_prefix = "rt713",
>  		.version_id = 3,
> @@ -237,6 +244,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 2,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1713,
>  		.name_prefix = "rt713-dmic",
>  		.version_id = 3,
> @@ -252,6 +260,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1308,
>  		.name_prefix = "rt1308",
>  		.acpi_id = "10EC1308",
> @@ -275,6 +284,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.ops = &soc_sdw_rt1308_i2s_ops,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1316,
>  		.name_prefix = "rt1316",
>  		.dais = {
> @@ -296,6 +306,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1318,
>  		.name_prefix = "rt1318",
>  		.dais = {
> @@ -317,6 +328,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1320,
>  		.name_prefix = "rt1320",
>  		.dais = {
> @@ -338,6 +350,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x1321,
>  		.name_prefix = "rt1320",
>  		.dais = {
> @@ -359,6 +372,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x714,
>  		.name_prefix = "rt714",
>  		.version_id = 3,
> @@ -375,6 +389,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x715,
>  		.name_prefix = "rt715",
>  		.version_id = 3,
> @@ -391,6 +406,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x714,
>  		.name_prefix = "rt714",
>  		.version_id = 2,
> @@ -407,6 +423,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x715,
>  		.name_prefix = "rt715",
>  		.version_id = 2,
> @@ -423,6 +440,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x721,
>  		.name_prefix = "rt721",
>  		.version_id = 3,
> @@ -466,6 +484,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 3,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x722,
>  		.name_prefix = "rt722",
>  		.version_id = 3,
> @@ -513,6 +532,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 3,
>  	},
>  	{
> +		.vendor_id = 0x019f,
>  		.part_id = 0x8373,
>  		.name_prefix = "Left",
>  		.dais = {
> @@ -533,6 +553,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x019f,
>  		.part_id = 0x8363,
>  		.name_prefix = "Left",
>  		.dais = {
> @@ -553,6 +574,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x025d,
>  		.part_id = 0x5682,
>  		.name_prefix = "rt5682",
>  		.dais = {
> @@ -571,6 +593,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x3556,
>  		.name_prefix = "AMP",
>  		.dais = {
> @@ -598,6 +621,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 2,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x3557,
>  		.name_prefix = "AMP",
>  		.dais = {
> @@ -625,6 +649,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 2,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x3563,
>  		.name_prefix = "AMP",
>  		.dais = {
> @@ -652,6 +677,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 2,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x4242,
>  		.name_prefix = "cs42l42",
>  		.dais = {
> @@ -670,6 +696,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x4243,
>  		.name_prefix = "cs42l43",
>  		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
> @@ -778,6 +805,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 4,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x4245,
>  		.name_prefix = "cs42l45",
>  		.dais = {
> @@ -850,6 +878,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.aux_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x01fa,
>  		.part_id = 0x4747,
>  		.name_prefix = "cs47l47",
>  		.dais = {
> @@ -886,6 +915,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.aux_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x0105,
>  		.part_id = 0xaaaa, /* generic codec mockup */
>  		.name_prefix = "sdw_mockup_mmulti-function",
>  		.version_id = 0,
> @@ -912,6 +942,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 3,
>  	},
>  	{
> +		.vendor_id = 0x0105,
>  		.part_id = 0xaa55, /* headset codec mockup */
>  		.name_prefix = "sdw_mockup_headset0",
>  		.version_id = 0,
> @@ -926,6 +957,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x0105,
>  		.part_id = 0x55aa, /* amplifier mockup */
>  		.name_prefix = "sdw_mockup_amp1",
>  		.version_id = 0,
> @@ -940,6 +972,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		.dai_num = 1,
>  	},
>  	{
> +		.vendor_id = 0x0105,
>  		.part_id = 0x5555,
>  		.name_prefix = "sdw_mockup_mic0",
>  		.version_id = 0,
> @@ -964,9 +997,10 @@ EXPORT_SYMBOL_NS(asoc_sdw_get_codec_info_list_count, "SND_SOC_SDW_UTILS");
>  
>  struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
>  {
> -	unsigned int part_id, sdw_version;
> +	unsigned int vendor_id, part_id, sdw_version;
>  	int i;
>  
> +	vendor_id = SDW_MFG_ID(adr);
>  	part_id = SDW_PART_ID(adr);
>  	sdw_version = SDW_VERSION(adr);
>  	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
> @@ -975,6 +1009,7 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
>  		 * version_id is not specified in the codec info.
>  		 */
>  		if (part_id == codec_info_list[i].part_id &&
> +		    vendor_id == codec_info_list[i].vendor_id &&
>  		    (!codec_info_list[i].version_id ||
>  		     sdw_version == codec_info_list[i].version_id))
>  			return &codec_info_list[i];
> @@ -989,6 +1024,7 @@ static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_sdw_id(const struct
>  
>  	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
>  		if (id->part_id == codec_info_list[i].part_id &&
> +		    id->mfg_id == codec_info_list[i].vendor_id &&
>  		    (!codec_info_list[i].version_id ||
>  		     id->sdw_version == codec_info_list[i].version_id))
>  			return &codec_info_list[i];
> @@ -1093,8 +1129,8 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
>  			ret = snd_soc_add_card_controls(card, codec_info->dais[dai_index].controls,
>  							codec_info->dais[dai_index].num_controls);
>  			if (ret) {
> -				dev_err(card->dev, "%#x controls addition failed: %d\n",
> -					codec_info->part_id, ret);
> +				dev_err(card->dev, "%#x-%#x controls addition failed: %d\n",
> +					codec_info->vendor_id, codec_info->part_id, ret);
>  				return ret;
>  			}
>  		}
> @@ -1103,8 +1139,8 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
>  							codec_info->dais[dai_index].widgets,
>  							codec_info->dais[dai_index].num_widgets);
>  			if (ret) {
> -				dev_err(card->dev, "%#x widgets addition failed: %d\n",
> -					codec_info->part_id, ret);
> +				dev_err(card->dev, "%#x-%#x widgets addition failed: %d\n",
> +					codec_info->vendor_id, codec_info->part_id, ret);
>  				return ret;
>  			}
>  		}
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index c0cc7d3ce526..9ec33147d9af 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1179,6 +1179,9 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
>  		struct snd_soc_acpi_endpoint *endpoints;
>  		int amp_group_id = 1;
>  
> +		if (sdw_device->id.mfg_id != codec_info_list[i].vendor_id)
> +			continue;
> +
>  		if (sdw_device->id.part_id != codec_info_list[i].part_id)
>  			continue;
>  
> @@ -1193,8 +1196,8 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
>  		 * dereference
>  		 */
>  		if (!name_prefix) {
> -			dev_err(dev, "codec_info_list name_prefix of part id %#x is missing\n",
> -				codec_info_list[i].part_id);
> +			dev_err(dev, "codec_info_list name_prefix of part id %#x-%#x is missing\n",
> +				codec_info_list[i].vendor_id, codec_info_list[i].part_id);
>  			return NULL;
>  		}
>  		for (j = 0; j < codec_info_list[i].dai_num; j++) {

