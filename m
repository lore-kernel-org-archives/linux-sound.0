Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A291BC073
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735856124; cv=none; b=Dle3UmAmqtTg2PgKGI/RFe46tQb1QB4oXqjxDW731bG991UAGVDinIo3zLaKctRkcg6nhTZNkjWRJuiGCKRw55Arz4oTYpBwNMWaVU0DxvvTnQSx98nCh77/tj1OYVp5BisQmU5/kkTuKXVSpY6Lj6JhApEN5HTWfiglXWKtld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735856124; c=relaxed/simple;
	bh=nEerf2puQBdwBcW4SXWfgTFn++kXgAdCIREdgjGbHu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teiiWvFXV3g64EdUkpvlIO9dQmvoShfv+RPBitCquaVPgjvhM+LYdGfAsxp0NIRDzLmHBT2VPbqeRYvueWvuKpY4CxeNDnro7bXnRyDHNdXoCcEKFvRtNzsPaRRXkyLrjpfxP8I+xzfaG5P/D2KJfia6IwC0rDyLwNJmRcQk3kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UhlN/J9M; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UhlN/J9M"
Message-ID: <f2038977-4f5b-4a9a-bd5f-89e6839e1703@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735856118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4Li18FmBDwsKEGHXDYR1d3v0BjQC1ALcn/iCLqRoys=;
	b=UhlN/J9MeFkDmNp7t2BP86uoCi7m5wyQ14XqlQTXn8tl9RYNcKpGz5I3ePgDM1JdRiYrXa
	CaMdbYr3P+ucFRRZTq5L+nLHX0veJVJswPTk7UU1ad7SeESvmxYy/L/W6MUo/GCEtu7nd+
	Msf5nnExA0V+WdhUkQn8Y9k0D8MvSoU=
Date: Thu, 2 Jan 2025 16:01:19 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] ASoC: SDCA: Add missing function type names
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
 <20241220173516.907406-4-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20241220173516.907406-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 12/20/24 11:35, Charles Keepax wrote:
> It is not helpful to error out on some SDCA function types, we
> might as well report the correct name and let the driver core
> simply not bind a driver to those functions for which the code
> lacks support. Also given no functions currently have support,
> it seems odd to select some as unsupported.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   include/sound/sdca_function.h   |  1 +
>   sound/soc/sdca/sdca_functions.c | 12 ++++++++++--
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
> index 6943df0851a9..89e42db6d591 100644
> --- a/include/sound/sdca_function.h
> +++ b/include/sound/sdca_function.h
> @@ -42,6 +42,7 @@ enum sdca_function_type {
>   #define	SDCA_FUNCTION_TYPE_RJ_NAME		"RJ"
>   #define	SDCA_FUNCTION_TYPE_SIMPLE_NAME		"SimpleJack"
>   #define	SDCA_FUNCTION_TYPE_HID_NAME		"HID"
> +#define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME		"ImplementationDefined"
>   
>   enum sdca_entity0_controls {
>   	SDCA_CONTROL_ENTITY_0_COMMIT_GROUP_MASK		= 0x01,
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index a69fdb9c8b15..400763e056fa 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -75,12 +75,20 @@ static int patch_sdca_function_type(struct device *dev,
>   		*function_name = SDCA_FUNCTION_TYPE_HID_NAME;
>   		break;
>   	case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
> +		*function_name = SDCA_FUNCTION_TYPE_SIMPLE_AMP_NAME;
> +		break;
>   	case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
> +		*function_name = SDCA_FUNCTION_TYPE_SIMPLE_MIC_NAME;
> +		break;
>   	case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
> +		*function_name = SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
> +		break;
>   	case SDCA_FUNCTION_TYPE_RJ:
> +		*function_name = SDCA_FUNCTION_TYPE_RJ_NAME;
> +		break;

the changes above are fine...

>   	case SDCA_FUNCTION_TYPE_IMP_DEF:
> -		dev_warn(dev, "unsupported SDCA function type %d\n", *function_type);
> -		return -EINVAL;
> +		*function_name = SDCA_FUNCTION_TYPE_IMP_DEF_NAME;
> +		break;

but this one is controversial. We really have no idea what to do in this 
case. There could be completely different 'imp-def' functions that 
require different drivers. I don't know how the entire binding mechanism 
would work. Probably best to err on the side of throwing a 'not 
supported' error?

>   	default:
>   		dev_err(dev, "invalid SDCA function type %d\n", *function_type);
>   		return -EINVAL;

