Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEEF2D193F;
	Mon,  2 Mar 2026 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466487; cv=none; b=WU67YfZE2gzcBo1oRllavh0HxAcFzLoNoKg1b/xey3JNgvxOIH8PeXxZRGZNV7PoFWU8JeuOJ09hQtK9wwANLq2HvoBt9o//TDrMKopmo8sD5UfDv6AT1i3a7Dfljuk2s2GrEpogbwDopuR/SS1syAqsgsA+Ri53LGgnmqJPHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466487; c=relaxed/simple;
	bh=/Ik0FEZ/Fx1qd/1WkTDTvcvWQFYhpVIUxfqU+4daiFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbU9K1XsVIr9705c9GDr9Xrn59dhLl5KOSWszDEcAI62z9TrkKXDGwOjU9/npUulVcNOqEurCpHLCg3dLb4uPN6sTYcbv11mG3aUJuw+C/Bf4iPh71jaLyKfk7K4h65PqtzjI0fqL80NPOHGTaGWj6d7Uqh5+6bFtTSOASFU9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiF6fODL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiF6fODL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772466485; x=1804002485;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/Ik0FEZ/Fx1qd/1WkTDTvcvWQFYhpVIUxfqU+4daiFw=;
  b=OiF6fODLjsHdZC+F4I8MlejnSAxDqxwmecDK+J/uzqcHuqZsqI1mqPXJ
   YnHnbMwIFgrc+cRa7QhSBQQLbh60M+N/IXritTVQVL5gdKdYtPsrHUV+1
   MXe7W8oxDt/soDe5NolhI3mkiVpLkZhrWlryznavVeO7hkcZvAa5p77Kb
   snfPXtJVpYzse7eApEJicv5ppKNQXvRxT6kzrcAdg2viIbvg+hJeyAQFa
   aMybsgNlFx62c79htlT/gEI+3I9GoBWbGnlDFBOjhQka/aHFw54PdPS5I
   8QwgngwmAJtirpcAc5V5LhalKTc/cV6VUzGByrzMXdjQJLUIANs0RMulE
   w==;
X-CSE-ConnectionGUID: 0FaStUOPQU+z0TWNydvEEw==
X-CSE-MsgGUID: Y+FDPI9pSO6NqQeTuQaRvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84184602"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84184602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:48:04 -0800
X-CSE-ConnectionGUID: qsI3iNQ2RsaMwDfVOOuUTA==
X-CSE-MsgGUID: KftJ4SIfSwe6WLMe/Kkjww==
X-ExtLoop1: 1
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.232]) ([10.245.246.232])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:48:01 -0800
Message-ID: <f4742d1a-e8e8-4ef0-9919-7a0d02971a3f@linux.intel.com>
Date: Mon, 2 Mar 2026 17:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book
 entries
To: Yauhen Kharuzhy <jekhor@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-2-adcc7ed40985@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260301-asoc-yogabook-v2-v2-2-adcc7ed40985@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/03/2026 23:33, Yauhen Kharuzhy wrote:
> Lenovo Yoga Book YB1-X91 device uses a Cherry Trail SoC and has a valid
> ACPI DSDT entry for the RT5677 codec. This entry has some non-standard
> resource definitions, such as jack detection chip information, and
> hardware has some additional GPIO controls so use 'cht-yogabook'
> for the driver name instead of some default (like 'cht-bsw-rt5677').
> 
> Lenovo Yoga Book YB1-X90 device (Android version of the tablet) has the
> same hardware configuration but lacks a valid ACPI DSDT entry for the
> codec, so add DMI match data for it and use the same machine data as for
> YB1-X91.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 57097c1d011e..8673ade66e9d 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -17,6 +17,14 @@ static struct snd_soc_acpi_mach cht_surface_mach = {
>  	.sof_tplg_filename = "sof-cht-rt5645.tplg",
>  };
>  
> +static struct snd_soc_acpi_mach cht_yogabook_mach = {
> +	.id = "10EC5677",
> +	.drv_name = "cht-yogabook",
> +	.fw_filename = "intel/fw_sst_22a8.bin",
> +	.board = "cht-yogabook",
> +	.sof_tplg_filename = "sof-cht-rt5677.tplg",
> +};
> +
>  static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
>  	.id = "10WM5102",
>  	.drv_name = "bytcr_wm5102",
> @@ -33,6 +41,24 @@ static const struct dmi_system_id cht_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
>  		},
>  	},
> +	{
> +		.ident = "Lenovo Yoga Book YB1-X91",
> +		.driver_data = (void *)&cht_yogabook_mach,
> +		/* YB1-X91L/F */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
> +		}
> +	},
> +	{
> +		.ident = "Lenovo Yoga Book YB1-X90",
> +		.driver_data = (void *)&cht_yogabook_mach,
> +		/* YB1-X90L/F, codec is not listed in DSDT */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
> +		}
> +	},
>  	{
>  		/*
>  		 * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS
> @@ -121,6 +147,20 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>  		.board = "cht-bsw",
>  		.sof_tplg_filename = "sof-cht-rt5670.tplg",
>  	},
> +	/*
> +	 * The only known Cherry Trail device with RT5677 codec and 10EC677
> +	 * DSTD entry is the Lenovo Yoga Book YB1-X91. It has a device-specific
> +	 * driver, so check DMI and use a machine quirk to override the default
> +	 * (non-existent) machine driver.
> +	 */
> +	{
> +		.id = "10EC5677",
> +		.drv_name = "cht-bsw-rt5677",

there is no such driver exists

> +		.fw_filename = "intel/fw_sst_22a8.bin",
> +		.board = "cht-bsw",
> +		.machine_quirk = cht_quirk,
> +		.sof_tplg_filename = "sof-cht-rt5677.tplg",

There is no such topology exists

> +	},
>  	{
>  		.comp_ids = &rt5645_comp_ids,
>  		.drv_name = "cht-bsw-rt5645",
> 

-- 
Péter

