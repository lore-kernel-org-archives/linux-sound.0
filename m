Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E08F7D
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 21:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735854412; cv=none; b=nkkCsMLS89tHQPVfqr0rDfFeaQ5HRerYUaF3uVAuWIPi4/t32vYxnpC9l57cj9SAfDI87WFJeXNU9V0p5Yqn4jCFvmeHLKc6rA3PIaqtM/B9gu43jjVsBs2xCpf9WW0J7FneFnHQNKD360qtSVcjhkkFJ3gYNCOm8v6RqditvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735854412; c=relaxed/simple;
	bh=4PLlb1Lv4l3qcRFD2HggIdgPR0aA+/HZX4xOhDWQql8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQde3MzyucKUP4tvpao1bLxvyNM88/gnQJ1MqwWdR6Ftma5noWrVFH38Pq00Omw71IwAO5O6kahZdWUGkZ07AQ9RpJ0MO2kYRFDz1o/HpftZeEvr5kwCli2SUgiPuBQ/6BCR5gCUx0OcLh8f9cI7vSzZDETweLFBVarGZoSSp74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bhW4vS++; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bhW4vS++"
Message-ID: <ee83bf81-dc3f-4452-8ae3-4c4762ad7b86@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735854407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08XiV5K0xxVwVoEGzWp/Tgjh0gbMRkaptA7gAaGLJh8=;
	b=bhW4vS++7MgoDUt1JSeWDTZlJDpukpD4OIM3PTawYh6IJBJ8i06uVRMbb1+MRP2GZDhxow
	h3cOnk6ljsyULFGJpcvG1s0cFHWo9I8awol+9DHpyixyFaNhM9mzOE6r2OY2ekAcyCBXHs
	iWTEwPzElp8raAQV75KkXcZIieSLiaY=
Date: Thu, 2 Jan 2025 15:46:40 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
To: Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
 <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 1/2/25 06:33, Bard Liao wrote:
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> Update the DMI match for a Lenovo laptop to the new DMI identifier.
> 
> This laptop ships with a different DMI identifier to what was expected,
> and also has the DMICs connected to the host rather than the cs42l43
> codec.

If the DMICs are connected to the host, isn't there NHLT information 
telling the OS how many dmics are connected? If yes, then the 
machine-level DMI quirk isn't really needed, all you would need is a 
rule that sets it unconditionally when mach->mach_params.dmic_num is 
non-zero

> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Fixes: 83c062ae81e8 ("ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops")
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>   sound/soc/intel/boards/sof_sdw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index 9f721b88e606..d054be360d28 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -620,9 +620,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
>   		.callback = sof_sdw_quirk_cb,
>   		.matches = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "3832")
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83LC")
>   		},
> -		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
> +		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
>   	},
>   	{
>   		.callback = sof_sdw_quirk_cb,

