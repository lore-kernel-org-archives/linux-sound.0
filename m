Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C74DBD67
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194553; cv=none; b=gEx2DrhaBp5E1thRsOhCEnILUc5NVGTp9oRPWIOFTZn6rX0ftYu+t4quaYQYK1Ilp9G4QLwOE/04aRV6Xvdre4q8898gVAJ8OcuofwBIguGE24NkQsyWiWtDaCne6DlZQ7cL6FKoQ2O3GrWvB7Jp5bCcnAH1KVtH+CTKIK6cOIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194553; c=relaxed/simple;
	bh=EIQdru2t2P7kMw7hW/xx+naY1oH+dPM+jGFBQ3JOh68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rf56hGqXbPdejN10mZQP4si1CrYAPkNsJ4kj19Q3e1kjlfhcNDHTuWWBY0S/szq38IHmzm2ahOjIa62SqmNz5gF/dFAV/JY8AKujjuNPo+hFEJGVGC1Agzzw4gCHHMiNywxtWmGiWPvz10ahTosONLdi3K4kCop+RYkGMCx3NsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KaNG9BOL; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KaNG9BOL"
Message-ID: <22c7d187-b696-4411-99db-3af470f5fcab@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779194548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/UffwdBOgAGYGfRZLLw5Jsr65D5kqMWFuTYXKJprS4=;
	b=KaNG9BOLsgrkZMJK2ukexjKh9if5oTzXNgTSoV9WfOcgD/AOBfGg2ToQJRH1XZFOb0kcrf
	laS0vo/q4lQokkQjAC1MOM+L8OJCoIdlCt5devZ3M4hluqEkvvaq6SxJM++yvP0uOY//dV
	OEYG5czDrjt4SvTUNpdnAg36x7+qLUg=
Date: Tue, 19 May 2026 14:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Nathan Chancellor <nathan@kernel.org>, Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com, vkoul@kernel.org
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
 <20260518224657.GA536765@ax162>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260518224657.GA536765@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/19/26 00:46, Nathan Chancellor wrote:
> Hi,
> 
> On Thu, May 14, 2026 at 03:52:03PM +0800, Zhang Yi wrote:
>> This is the codec driver for es9356-sdca.
>>
>> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ...
>> diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
>> new file mode 100644
>> index 000000000..78fddd9d0
>> --- /dev/null
>> +++ b/sound/soc/codecs/es9356.c
> ...
>> +static const struct snd_kcontrol_new es9356_sdca_controls[] = {
>> +	SDCA_SINGLE_Q78_TLV("FU41 Left Playback Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU41 Right Playback Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU36 Left Capture Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU36 Right Capture Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU33 Capture Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33, ES9356_SDCA_CTL_FU_CH_GAIN, 0),
>> +		ES9356_GAIN_MIN, ES9356_AMIC_GAIN_MAX, ES9356_AMIC_GAIN_STEP, amic_gain_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU21 Left Playback Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU21 Right Playback Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU113 Left Capture Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU113 Right Capture Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R),
>> +		ES9356_VOLUME_MIN, ES9356_VOLUME_MAX, ES9356_VOLUME_STEP, out_vol_tlv),
>> +	SDCA_SINGLE_Q78_TLV("FU11 Capture Volume",
>> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11, ES9356_SDCA_CTL_FU_CH_GAIN, 0),
>> +		ES9356_GAIN_MIN, ES9356_DMIC_GAIN_MAX, ES9356_DMIC_GAIN_STEP, dmic_gain_tlv),
>> +};
> 
> The use of SDCA_SINGLE_Q78_TLV() can break the build for architectures
> that do not support ACPI, as CONFIG_SND_SOC_SDCA depends on ACPI and
> the driver does not actually select it, so it might not be enabled if
> another driver that does select it is not enabled:
> 
>   $ printf "CONFIG_%s=m\n" SOUNDWIRE SND_SOC_ES9356 >arch/arm/configs/repro.config
> 
>   $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper defconfig repro.config all
>   ERROR: modpost: "sdca_asoc_q78_get_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
>   ERROR: modpost: "sdca_asoc_q78_put_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
>   ...
> 
> Maybe something like this is needed?
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 5fdd0334c355..b9e8df5ddfd5 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1302,7 +1302,9 @@ config SND_SOC_ES8389
>  
>  config SND_SOC_ES9356
>          tristate "Everest Semi ES9356 CODEC SDW"
> +	depends on ACPI
>          depends on SOUNDWIRE
> +	select SND_SOC_SDCA
>          select REGMAP_SOUNDWIRE
>          select REGMAP_SOUNDWIRE_MBQ

Maybe this instead?

depends on SOUNDWIRE
depends on SND_SOC_SDCA

  


