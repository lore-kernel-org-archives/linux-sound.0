Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA0B382294
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302667; cv=none; b=JaILmib4ns8d1bX82J/4pJK5eVlgi2XE2drg7oPZO+3ZQp5VTLYz+D0KHTtgGgzsSMZSOUKYrYHbfUNPI07vR547m15tjbaFwdSHuTo4DB8w2qxmcuhm+01wAxXX7Om76pyEojSYW6W8XIJ1PyPn2FiGv18b4/zetK74KgsxcYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302667; c=relaxed/simple;
	bh=bHlKlhECOoLTi+7UeQ9MqnMO8AfuEUK2gNxuvQRm0PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMz6WfaIYuDFsrhsC2jVeI73ShJ7G2OGLzvWY0dG5hSx2iBtJw58o7lBNWn1P0/cw3bjNn75ZkToXFC5CrfynkszO53OLF1W/EwcDpELM1wSwsT5EHSOMVmAY+4e74QwmNFAyOviIXBTUVaPta1zHKjicDfBURLLSmz+Hx4+Nuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ruch63u5; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ruch63u5"
Message-ID: <e7fa376b-bb81-486a-b13f-0676a582e6f9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3dcGEL09MsoK+RJTveeex82lXJP7dl/pmzn6g963ZI8=;
	b=Ruch63u59fGL7v2VQQ8HyBoofG8+SMOAI+31irFpF+oUyPK9DNt9WackNszZwJMmtBYWEv
	c3p7eHyzD29bifDxLhIiYYdM1mU+1MrqeZ3124FdzhTnkCmJGoyDcJoNUTvhdsbLTcUscn
	I45ANuZcmyN5jGgkDoIR3mw+/xqkXy0=
Date: Mon, 23 Mar 2026 14:46:52 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 4/4] ASoC: tac5xx2-sdw: ACPI match for Intel mtl
 platform
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260323041641.2133-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260323041641.2133-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/22/26 21:16, Niranjan H Y wrote:
>  Add acpi match entries to support TI's tac5572,
> tas2883, tac5672 and tac5682 on link 0 on MTL machine.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  .../intel/common/soc-acpi-intel-mtl-match.c   | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> index 72c35e73078e..2e4222456f27 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> @@ -122,6 +122,42 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
>  	.group_id = 1,
>  };
>  
> +static const struct snd_soc_acpi_endpoint tac5xx2_endpoints[] = {
> +	{ /* Playback Endpoint */
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* Mic Capture Endpoint */
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* UAJ-HP with Mic Endpoint */
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
> +static const struct snd_soc_acpi_endpoint tas2883_endpoints[] = {
> +	{ /* Playback Endpoint */
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* Mic Capture Endpoint */
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
>  static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
>  	{
>  		.num = 0,
> @@ -1011,6 +1047,33 @@ static const struct snd_soc_acpi_adr_device cs42l42_0_adr[] = {
>  	}
>  };
>  
> +static const struct snd_soc_acpi_adr_device tac5572_0_adr[] = {
> +	{
> +		.adr = 0x0000300102557201ull,
> +		.num_endpoints = ARRAY_SIZE(tac5xx2_endpoints),
> +		.endpoints = tac5xx2_endpoints,
> +		.name_prefix = "tac5572"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device tac5672_0_adr[] = {
> +	{
> +		.adr = 0x0000300102567201ull,
> +		.num_endpoints = ARRAY_SIZE(tac5xx2_endpoints),
> +		.endpoints = tac5xx2_endpoints,
> +		.name_prefix = "tac5672"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device tac5682_0_adr[] = {
> +	{
> +		.adr = 0x0000300102568201ull,
> +		.num_endpoints = ARRAY_SIZE(tac5xx2_endpoints),
> +		.endpoints = tac5xx2_endpoints,
> +		.name_prefix = "tac5682"
> +	}
> +};
> +
>  static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
>  	{
>  		.adr = 0x00003c0102000001ull,
> @@ -1035,9 +1098,45 @@ static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
>  		.num_endpoints = 1,
>  		.endpoints = &spk_r_endpoint,
>  		.name_prefix = "tas2783-4"
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device tas2883_0_adr[] = {
> +	{
> +		.adr = 0x0000300102288301ull,
> +		.num_endpoints = ARRAY_SIZE(tas2883_endpoints),
> +		.endpoints = tas2883_endpoints,
> +		.name_prefix = "tas2883"
>  	}
>  };
>  
> +static const struct snd_soc_acpi_link_adr tac5572_l0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(tac5572_0_adr),
> +		.adr_d = tac5572_0_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr tac5672_l0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(tac5672_0_adr),
> +		.adr_d = tac5672_0_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr tac5682_l0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(tac5682_0_adr),
> +		.adr_d = tac5682_0_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_link_adr tas2783_link0[] = {
>  	{
>  		.mask = BIT(0),
> @@ -1047,6 +1146,15 @@ static const struct snd_soc_acpi_link_adr tas2783_link0[] = {
>  	{}
>  };
>  
> +static const struct snd_soc_acpi_link_adr tas2883_l0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(tas2883_0_adr),
> +		.adr_d = tas2883_0_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
>  	/* Expected order: jack -> amp */
>  	{
> @@ -1208,12 +1316,36 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
>  		.drv_name = "sof_sdw",
>  		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
>  	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = tac5572_l0,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-mtl-tac5572.tplg",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = tac5672_l0,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-mtl-tac5672.tplg",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = tac5682_l0,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-mtl-tac5682.tplg",
> +	},
>  	{
>  		.link_mask = BIT(0),
>  		.links = tas2783_link0,
>  		.drv_name = "sof_sdw",
>  		.sof_tplg_filename = "sof-mtl-tas2783.tplg",
>  	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = tas2883_l0,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-mtl-tas2883.tplg",
> +	},
>  	{
>  		.link_mask = GENMASK(3, 0),
>  		.links = mtl_rt713_l0_rt1316_l12_rt1713_l3,

