Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6769E2FF15B
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411910; cv=none; b=k+fO1o11gb3OrFAfbl2k0BihRz4CD1TCvxEP9+WTpjJ2AfSCq7pKFvOnHMlkZqm+eebpa+B4hcg6EM3DRZXCEyRM9jKURqNYqKRESBaibTRH8PPckYSATaGd/+p3QwDV3mSWC0p248QeyPHorChBRWiwjDEp4ZgBtrfeMolP/78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411910; c=relaxed/simple;
	bh=6s0HiMjKkH/OtIii2L6WxdujFZmQ1b4094l15QjMjNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8Z+jb6XqFLo+KKr2WsG1hEZ+dtoRbF0maPENXjHSlXu7wELimbGGc131TNeoktS6DD3pXe45ODmZ12Gmr5BlvdGw8xgI6AWszZQIk818QTKrRhyEMOCOkGlzeDyDD69xniiHSR/EQZvmZWeoHARXsPFu9VptEGeAHfcPQ/GfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p/qeWoKF; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p/qeWoKF"
Message-ID: <3ff76f35-be88-4281-be92-ec8f1e160651@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771411905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0K+5+N3x0TQW/n9+HmxQMWV6rAr/G8Db3LHTRDzDw/Y=;
	b=p/qeWoKFUirsRfz0agFS0hrAg7/h5ask7YVF7Bj1LOv9wP2GhRG7FuZksvafGKUGCFthBR
	SH3gkeC5vJyVg7K4szf8ad7y0EKnKKDi+SG5P7i7QdlHCuvB1+M8/jBBx6Rk4M5r/v1rTq
	RaZNy4EeQvNon5SnAswMEoERL7FB8C0=
Date: Wed, 18 Feb 2026 11:35:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/2] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book
 entries
To: Yauhen Kharuzhy <jekhor@gmail.com>, linux-sound@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20260217231324.1319392-1-jekhor@gmail.com>
 <20260217231324.1319392-3-jekhor@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260217231324.1319392-3-jekhor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/18/26 00:13, Yauhen Kharuzhy wrote:
> Lenovo Yoga Book YB1-X91 device uses a Cherry Trail SoC and has a valid
> ACPI DSDT entry for the RT5677 codec. This entry has some non-standard
> resource definitions, such as jack detection chip information, and
> hardware has some additional GPIO controls so use 'cht-yogabook'
> for the driver name instead of some default (like 'cht-bsw-rt5677').
> 
> Lenovo Yoga Book YB1-X90 device (Android version of the tablet) has the
> same hardware configuration but lacks a valid ACPI DSDT entry for the
> codec. To match this device, extend the existing quirk designated for the
> Lenovo Yoga Tab 3 Pro YT3-X90 and make it more generic: select a matched
> machine using the dmi_check_system() quirk mechanism.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>

Looks ok to me, but since this is touching 10-yr old stuff maybe it's worth having a patch that only merged the existing quirks together.
Then you can add a new set of entries. Easier to review/test/bisect.

> ---
>  .../intel/common/soc-acpi-intel-cht-match.c   | 144 ++++++++++++------
>  1 file changed, 94 insertions(+), 50 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index e4c3492a0c28..cadb7790d86a 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -9,13 +9,47 @@
>  #include <sound/soc-acpi.h>
>  #include <sound/soc-acpi-intel-match.h>
>  
> -static unsigned long cht_machine_id;
> +static struct snd_soc_acpi_mach *cht_quirk_mach;
>  
> -#define CHT_SURFACE_MACH 1
> +static struct snd_soc_acpi_mach cht_surface_mach = {
> +	.id = "10EC5640",
> +	.drv_name = "cht-bsw-rt5645",
> +	.fw_filename = "intel/fw_sst_22a8.bin",
> +	.board = "cht-bsw",
> +	.sof_tplg_filename = "sof-cht-rt5645.tplg",
> +};
> +
> +static struct snd_soc_acpi_mach cht_yogabook_mach = {
> +	.id = "10EC5677",
> +	.drv_name = "cht-yogabook",
> +	.fw_filename = "intel/fw_sst_22a8.bin",
> +	.board = "cht-yogabook",
> +	.sof_tplg_filename = "sof-cht-rt5677.tplg",
> +};
> +
> +static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
> +	.id = "10WM5102",
> +	.drv_name = "bytcr_wm5102",
> +	.fw_filename = "intel/fw_sst_22a8.bin",
> +	.board = "bytcr_wm5102",
> +	.sof_tplg_filename = "sof-cht-wm5102.tplg",
> +};
>  
>  static int cht_surface_quirk_cb(const struct dmi_system_id *id)
>  {
> -	cht_machine_id = CHT_SURFACE_MACH;
> +	cht_quirk_mach = &cht_surface_mach;
> +	return 1;
> +}
> +
> +static int cht_yogabook_quirk_cb(const struct dmi_system_id *id)
> +{
> +	cht_quirk_mach = &cht_yogabook_mach;
> +	return 1;
> +}
> +
> +static int cht_yt3_quirk_cb(const struct dmi_system_id *id)
> +{
> +	cht_quirk_mach = &cht_lenovo_yoga_tab3_x90_mach;
>  	return 1;
>  }
>  
> @@ -27,29 +61,57 @@ static const struct dmi_system_id cht_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
>  		},
>  	},
> +	{
> +		.callback = cht_yogabook_quirk_cb,
> +		.ident = "Lenovo Yoga Book YB1-X91",
> +		/* YB1-X91L/F */
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
> +		}
> +	},
> +	{
> +		.callback = cht_yogabook_quirk_cb,
> +		.ident = "Lenovo Yoga Book YB1-X90",
> +		/* YB1-X90L/F, codec is not listed in DSDT */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
> +		}
> +	},
> +	{
> +		/*
> +		 * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS
> +		 * has a buggy DSDT with the codec not being listed at all.
> +		 */
> +		.callback = cht_yt3_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
> +		},
> +	},
>  	{ }
>  };
>  
> -static struct snd_soc_acpi_mach cht_surface_mach = {
> -	.id = "10EC5640",
> -	.drv_name = "cht-bsw-rt5645",
> -	.fw_filename = "intel/fw_sst_22a8.bin",
> -	.board = "cht-bsw",
> -	.sof_tplg_filename = "sof-cht-rt5645.tplg",
> -};
> -
>  static struct snd_soc_acpi_mach *cht_quirk(void *arg)
>  {
>  	struct snd_soc_acpi_mach *mach = arg;
>  
>  	dmi_check_system(cht_table);
>  
> -	if (cht_machine_id == CHT_SURFACE_MACH)
> -		return &cht_surface_mach;
> +	if (cht_quirk_mach)
> +		return cht_quirk_mach;
>  	else
>  		return mach;
>  }
>  
> +static struct snd_soc_acpi_mach *cht_quirk_nocodec(void *arg)
> +{
> +	struct snd_soc_acpi_mach *mach = cht_quirk(arg);
> +
> +	return mach == arg ? NULL : mach;
> +}
> +
>  /*
>   * Some tablets with Android factory OS have buggy DSDTs with an ESSX8316 device
>   * in the ACPI tables. While they are not using an ESS8316 codec. These DSDTs
> @@ -75,38 +137,6 @@ static struct snd_soc_acpi_mach *cht_ess8316_quirk(void *arg)
>  	return arg;
>  }
>  
> -/*
> - * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS has a buggy DSDT
> - * with the coded not being listed at all.
> - */
> -static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
> -	{
> -		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
> -		},
> -	},
> -	{ }
> -};
> -
> -static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
> -	.id = "10WM5102",
> -	.drv_name = "bytcr_wm5102",
> -	.fw_filename = "intel/fw_sst_22a8.bin",
> -	.board = "bytcr_wm5102",
> -	.sof_tplg_filename = "sof-cht-wm5102.tplg",
> -};
> -
> -static struct snd_soc_acpi_mach *lenovo_yt3_x90_quirk(void *arg)
> -{
> -	if (dmi_check_system(lenovo_yoga_tab3_x90))
> -		return &cht_lenovo_yoga_tab3_x90_mach;
> -
> -	/* Skip wildcard match snd_soc_acpi_intel_cherrytrail_machines[] entry */
> -	return NULL;
> -}
> -
>  static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
>  	.num_codecs = 2,
>  	.codecs = { "10EC5640", "10EC3276" },
> @@ -137,6 +167,20 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
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
> +		.fw_filename = "intel/fw_sst_22a8.bin",
> +		.board = "cht-bsw",
> +		.machine_quirk = cht_quirk,
> +		.sof_tplg_filename = "sof-cht-rt5677.tplg",
> +	},
>  	{
>  		.comp_ids = &rt5645_comp_ids,
>  		.drv_name = "cht-bsw-rt5645",
> @@ -208,14 +252,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>  		.sof_tplg_filename = "sof-cht-src-50khz-pcm512x.tplg",
>  	},
>  	/*
> -	 * Special case for the Lenovo Yoga Tab 3 Pro YT3-X90 where the DSDT
> -	 * misses the codec. Match on the SST id instead, lenovo_yt3_x90_quirk()
> -	 * will return a YT3 specific mach or NULL when called on other hw,
> -	 * skipping this entry.
> +	 * Special case for the Lenovo Yoga Tab 3 Pro YT3-X90 and Lenovo
> +	 * Yoga Book YB1-X90 where the DSDT misses the codec. Match on the
> +	 * SST id instead, cht_quirk_nocodec() will return a machine-specific
> +	 * mach or NULL when called on other hw, skipping this entry.
>  	 */
>  	{
>  		.id = "808622A8",
> -		.machine_quirk = lenovo_yt3_x90_quirk,
> +		.machine_quirk = cht_quirk_nocodec,
>  	},
>  
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)

