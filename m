Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02269486B99
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828114; cv=none; b=RdBhN1LT8VxQbu88hlEve7oQOCU2TNHZIn59gRi+fvvk3A/aD05S15qxXxyjwTBD8/0tyatmURp4BsFF9bNFHWCKeu6OCKVIz86x2mOaMKtxf4g5amnL4P6TDCkwCqxOYlVOP992M9g7Rr9fDrjprfuAU8g8VxE2dh7uy4N/49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828114; c=relaxed/simple;
	bh=7hTvOZXzPJrHhrdm6ZwUIbIMAWuhabU2XenNB3eaUKA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rKuUXPD8bBVQQcZiMmvyTeB23GKHCQnJG+TBt7XgAGxE5a0kOnkN3roJkoQL1vWB6ebWPvBKsp4rEKYkWVRLfDLejq9gz7IZ7B9x/GuD4gn7OZXD8X736LedOQmI+B0nkVmDN4H3L0MrlRy6aZ2kxsz8F71JuyaxpEf84M6B/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qy0ALSYm; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qy0ALSYm"
Message-ID: <3db1c203-e81d-43a3-9c72-b2abb1374253@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784828109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfyhetuzsZBwOZBpfSzp1mr3ZhcoJsx7ZyT810Wia08=;
	b=qy0ALSYmz8r9TLlzHsg4nV6cqXo35LbS/bQ34LikxWHiUb+aU7tjejxNcmo6/HVKl90R0E
	HrXhBELJLnQn/VUm5JWhv4fxgXZep0S6RyFXwbGUOH4u4/0c93feltX2fDFWuC992rGn22
	qxmhUnJAxoVDVb6aU1xJSdh0LG7U8LQ=
Date: Thu, 23 Jul 2026 19:34:13 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: =?UTF-8?B?UmU6IFvigJlQQVRDSOKAmSAzLzNdIEFTb0M6IGNvZGVjczogYWRkIG5l?=
 =?UTF-8?Q?w_SoundWire-based_SN624x?=
To: ming cong <ming.cong@senarytech.com>, broonie@kernel.org,
 julianbraha@gmail.com
Cc: qianghua.wang@senarytech.com, jim.tang@senarytech.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gary C Wang <gary.c.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Zhang Yi <zhangyi@everest-semi.com>, Niranjan H Y <niranjan.hy@ti.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jang Pyohwan <vhgksl@daum.net>, Balamurugan C <balamurugan.c@intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20260723063129.9151-1-ming.cong@senarytech.com>
Content-Language: en-US
In-Reply-To: <20260723063129.9151-1-ming.cong@senarytech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/23/26 08:31, ming cong wrote:
> The current kernel does not support the SN624x codec chip.
> Add the SN624x codec configuration item to kernel.
> 
> Signed-off-by: ming cong <ming.cong@senarytech.com>
> ---
>  MAINTAINERS                                   | 10 ++
>  .../intel/common/soc-acpi-intel-arl-match.c   | 69 +++++++++++++
>  .../intel/common/soc-acpi-intel-lnl-match.c   | 69 +++++++++++++
>  .../intel/common/soc-acpi-intel-mtl-match.c   | 52 ++++++++++
>  .../intel/common/soc-acpi-intel-ptl-match.c   | 96 +++++++++++++++++++

this isn't an ASoC: codecs patch but an Intel patch.

>  5 files changed, 296 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54b7325f01e9..a157da5e4937 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29530,3 +29530,13 @@ F:	sound/soc/sdw_utils/soc_sdw_senary_sdca.c
>  F:	sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
>  F:	sound/soc/sdw_utils/soc_sdw_utils.c
>  F:	include/sound/soc_sdw_utils.h
> +
> +SENARYTECH AUDIO SN624X CODEC DRIVER
> +M:	ming cong <ming.cong@senarytech.com>
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> +F:	sound\sound\soc\intel\common\soc-acpi-intel-arl-match.c
> +F:	sound\sound\soc\intel\common\soc-acpi-intel-lnl-match.c
> +F:	sound\sound\soc\intel\common\soc-acpi-intel-mtl-match.c
> +F:	sound\sound\soc\intel\common\soc-acpi-intel-ptl-match.c

that also doesn't seem quite right, this is an Intel directory with
things that aren't related to Senary support.

> +
> diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
> index 59bfd5248819..07c95d0f2f31 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
> @@ -319,6 +319,63 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
>  	}
>  };
>  
> +static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
> +	{
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device sn6242_single_adr[] = {
> +	{
> +		.adr = 0x0000000496624201ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device sn6244_single_adr[] = {
> +	{
> +		.adr = 0x0000000496624401ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_link_adr link_sn6242[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(sn6242_single_adr),
> +		.adr_d = sn6242_single_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr link_sn6244[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(sn6244_single_adr),
> +		.adr_d = sn6244_single_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
>  	{
>  		.mask = BIT(0),
> @@ -621,6 +678,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
>  		.sof_tplg_filename = "sof-arl-es9356.tplg",
>  		.get_function_tplg_files = sof_sdw_get_tplg_files,
>  	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = link_sn6242,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-arl-sn624x.tplg",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = link_sn6244,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-arl-sn624x.tplg",
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
> index 937a74a5d523..845d10575459 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
> @@ -215,6 +215,27 @@ static const struct snd_soc_acpi_endpoint cs42l43_amp_spkagg_endpoints[] = {
>  	},
>  };
>  
> +static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
> +	{
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
>  static const struct snd_soc_acpi_adr_device cs35l56_2_l_adr[] = {
>  	{
>  		.adr = 0x00023001FA355601ull,
> @@ -482,6 +503,24 @@ static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
>  	}
>  };
>  
> +static const struct snd_soc_acpi_adr_device sn6242_single_adr[] = {
> +	{
> +		.adr = 0x0000000496624201ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device sn6244_single_adr[] = {
> +	{
> +		.adr = 0x0000000496624401ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
>  static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0[] = {
>  	{
>  		.mask = BIT(0),
> @@ -684,6 +723,24 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt712_vb_l2_rt1320_l1[] = {
>  	{}
>  };
>  
> +static const struct snd_soc_acpi_link_adr link_sn6242[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(sn6242_single_adr),
> +		.adr_d = sn6242_single_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr link_sn6244[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(sn6244_single_adr),
> +		.adr_d = sn6244_single_adr,
> +	},
> +	{}
> +};
> +
>  /* this table is used when there is no I2S codec present */
>  /* this table is used when there is no I2S codec present */
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
> @@ -796,6 +853,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
>  		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg",
>  		.get_function_tplg_files = sof_sdw_get_tplg_files,
>  	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = link_sn6242,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-lnl-sn624x.tplg",
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = link_sn6244,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-lnl-sn624x.tplg",
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> index 2e4222456f27..542e56c65715 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> @@ -233,6 +233,51 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
>  	.group_id = 1,
>  };
>  
> +static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
> +	{
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device sn624x_single_adr[] = {
> +	{
> +		.adr = 0x0000000496624401ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +	{
> +		.adr = 0x0000000496624201ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_link_adr link_sn624x[] = {
> +	{
> +		.mask = GENMASK(3, 0),
> +		.num_adr = ARRAY_SIZE(sn624x_single_adr),
> +		.adr_d = sn624x_single_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
>  	{
>  		.adr = 0x000030025D071101ull,
> @@ -1487,6 +1532,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
>  		.drv_name = "sof_sdw",
>  		.sof_tplg_filename = "sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg",
>  	},
> +	{
> +		.link_mask = GENMASK(3, 0),
> +		.links = link_sn624x,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-mtl-sn624x.tplg",
> +		.get_function_tplg_files = sof_sdw_get_tplg_files,
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> index f7694b2a2b02..2bac02de3d55 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> @@ -160,6 +160,27 @@ static const struct snd_soc_acpi_endpoint cs42l43_amp_spkagg_endpoints[] = {
>  	},
>  };
>  
> +static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
> +	{
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
>  static const struct snd_soc_acpi_adr_device cs42l43_3_agg_adr[] = {
>  	{
>  		.adr = 0x00033001FA424301ull,
> @@ -301,6 +322,33 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
>  	}
>  };
>  
> +static const struct snd_soc_acpi_adr_device sn6242_single_adr[] = {
> +	{
> +		.adr = 0x0000000496624201ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device sn6244_single_adr[] = {
> +	{
> +		.adr = 0x0003000496624401ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device sn6247_single_adr[] = {
> +	{
> +		.adr = 0x0003000496624701ull,
> +		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),
> +		.endpoints = sn624x_endpoints,
> +		.name_prefix = "sn6242",
> +	},
> +};
> +
>  static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[] = {
>  	{
>  		.mask = BIT(3),
> @@ -437,6 +485,33 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l3[] = {
>  	{}
>  };
>  
> +static const struct snd_soc_acpi_link_adr link_sn6242[] = {
> +	{
> +		.mask = BIT(3),
> +		.num_adr = ARRAY_SIZE(sn6242_single_adr),
> +		.adr_d = sn6242_single_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr link_sn6244[] = {
> +	{
> +		.mask = BIT(3),
> +		.num_adr = ARRAY_SIZE(sn6244_single_adr),
> +		.adr_d = sn6244_single_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr link_sn6247[] = {
> +	{
> +		.mask = BIT(3),
> +		.num_adr = ARRAY_SIZE(sn6247_single_adr),
> +		.adr_d = sn6247_single_adr,
> +	},
> +	{}
> +};
> +
>  /* this table is used when there is no I2S codec present */
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
>  /* Order Priority: mockup > most links > most bit link-mask > alphabetical */
> @@ -531,6 +606,27 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
>  		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
>  		.get_function_tplg_files = sof_sdw_get_tplg_files,
>  	},
> +	{
> +		.link_mask = BIT(3),
> +		.links = link_sn6242,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
> +		.get_function_tplg_files = sof_sdw_get_tplg_files,
> +	},
> +	{
> +		.link_mask = BIT(3),
> +		.links = link_sn6244,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
> +		.get_function_tplg_files = sof_sdw_get_tplg_files,
> +	},
> +	{
> +		.link_mask = BIT(3),
> +		.links = link_sn6247,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
> +		.get_function_tplg_files = sof_sdw_get_tplg_files,
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);

It's a bit weird to see sometimes 3 descriptors, sometimes 2 and
sometimes 1. The only difference seems to be the partID, so wondering if
there's a better way to add more than one part ID to a descriptor.

