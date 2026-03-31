Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A261C862F
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968617; cv=none; b=XI9+6nKcqRK8FEfYmG6P77S1SMpa6V3HeV8hgqsxysUQJYJTWaZY37KYc10nDucolOhNh+qq0vCxlNln5jEy3OVB8qhckS4yCpsvoIm6xLmUpHKkHSbaHRHwLiFeuqqrzjGpn9kysF/gDew8C2gqw76n5JtX1mEt5uMddLjFoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968617; c=relaxed/simple;
	bh=FeDlvLtAoIfZynTPiceCpxqnTiKXB6F+ZPaEnwNcsLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvHL1nCORB+ntzCnuuBeWqS0xemKxbjqWtA9yjY22XhmL8G+wkCqBqYOc/HzukYF4fNR2mx9LmNJl20wb5ZatGwWFOGiR3vOxuBV00gME0Ia4pNDbX8jPJXAw3M9UvthMi185imvFaHaVEB0pwKYUirMQz2sz+v/cJmbr2EHzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GV6Na5b5; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GV6Na5b5"
Message-ID: <bfcf1f29-002b-4e99-a2e5-bcb29d23549a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774968614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMIkD2I2Qt3Nb5ZISeZq7OFYOO3XsMiKj5vuvyEO37I=;
	b=GV6Na5b5ZDs/YsnwA9P6ZpUEPlh39HbDABVS9aCoHTcGormAmA6jfj17GzzhU00CAcDLyb
	NqGxnu8WDD24OzlXjptYlDQwbf7vzjTnvbWpmrM2yjj1V8TyCiholx7l/p3vD9LnUnB9W5
	0kpj3DvDcBitIsmA3saHs294dxV98T0=
Date: Tue, 31 Mar 2026 14:27:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/6] ASoC: sdw_utils: add ES9356 in codec_info_list
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
 <20260327095954.3465-3-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260327095954.3465-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/27/26 10:59, Zhang Yi wrote:
> Add ES9356 in codec_info_list
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  sound/soc/sdw_utils/soc_sdw_utils.c | 49 +++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 75658148d..ea0e8969d 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -885,6 +885,55 @@ struct asoc_sdw_codec_info codec_info_list[] = {
>  		},
>  		.aux_num = 1,
>  	},
> +	{
> +		.part_id = 0x9356,
> +		.name_prefix = "es9356",

that part will conflict with the in-flight change to add the vendor id, no?

> +		.version_id = 3,
> +		.dais = {
> +			{
> +				.direction = {true, false},
> +				.dai_name = "es9356-sdp-aif1",
> +				.dai_type = SOC_SDW_DAI_TYPE_JACK,
> +				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
> +				.init = asoc_sdw_es9356_init,
> +				.exit = asoc_sdw_es9356_exit,
> +				.rtd_init = asoc_sdw_es9356_rtd_init,
> +				.controls = generic_jack_controls,
> +				.num_controls = ARRAY_SIZE(generic_jack_controls),
> +				.widgets = generic_jack_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
> +			},
> +			{
> +				.direction = {false, true},
> +				.dai_name = "es9356-sdp-aif4",
> +				.dai_type = SOC_SDW_DAI_TYPE_MIC,
> +				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
> +				.rtd_init = asoc_sdw_es9356_dmic_rtd_init,
> +				.widgets = generic_dmic_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
> +			},
> +			{
> +				.direction = {false, true},
> +				.dai_name = "es9356-sdp-aif2",
> +				.dai_type = SOC_SDW_DAI_TYPE_JACK,
> +				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
> +			},
> +			{
> +				.direction = {true, false},
> +				.dai_name = "es9356-sdp-aif3",
> +				.component_name = "es9356",
> +				.dai_type = SOC_SDW_DAI_TYPE_AMP,
> +				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
> +				.init = asoc_sdw_es9356_amp_init,
> +				.rtd_init = asoc_sdw_es9356_spk_rtd_init,
> +				.controls = generic_spk_controls,
> +				.num_controls = ARRAY_SIZE(generic_spk_controls),
> +				.widgets = generic_spk_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
> +			},
> +		},
> +		.dai_num = 4,
> +	},
>  	{
>  		.part_id = 0xaaaa, /* generic codec mockup */
>  		.name_prefix = "sdw_mockup_mmulti-function",

