Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE5B1F7916
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321184; cv=none; b=G55u4T6GP99vspSDOCtkpIGEvkUqrD3N8DFq13GTx5B6//Vk+XllXsjv5D/JznFvPjFjxgsMtrbjDr/KfAcHaY+51jxGB1h2ucY5TPNa4ogKQs2Yq5XCv689+6R4JxTGY8/1ys/rSgrvzD3o/O30BO6nXiDUSwHW4zkBkdFl4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321184; c=relaxed/simple;
	bh=v3hRN4Ut8kHdbbAmH9EN+J22Oj7NCqFlFJ6MRCGhQ3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqaDY+CWAZp6FJ80JmPFkPYGIaKiZGk8kPO95LgakO63xVvFq5ROBoYriUOm5G+bE2KVwapuGb1uIzkX9/FwsA1x3i82zn4Y3Kls7FmlBLm3z3mteCqkMeCqCP52SagNUIluMpfXTTVk9T7ziOUiXYJy0le7tAMPhT9B3bHcgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tr5Q+NeF; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tr5Q+NeF"
Message-ID: <df0e5e52-7c34-4d09-9de1-eafe0405c951@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784321179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+MOHjf9FtVAkAKqPPBXuItfUa3WeJASdds6TpCN+ag=;
	b=tr5Q+NeFI+xJ4sw80vRthCCDrqnOvhVOfsPjIWd0eL5FP+EEIcN/bi1wTzbuS1tGydQ2KW
	drXy+6REtJ/Uor7AYsqHKLtn2Zh2NtLfaeBRPl2mY3N6YwopkAjNIAad/GSNZFhLG+DqvZ
	99NTleDFYR3D74MAWMoEhtJP9qsOQ4s=
Date: Fri, 17 Jul 2026 22:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Add support for CS35L62 for SoundWire
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260715120135.939280-1-rf@opensource.cirrus.com>
 <20260715120135.939280-2-rf@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260715120135.939280-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
> index 0a55b93b96f96..1e442f43b306b 100644
> --- a/sound/soc/codecs/cs35l56-sdw.c
> +++ b/sound/soc/codecs/cs35l56-sdw.c
> @@ -457,6 +457,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
>  		regmap_config = &cs35l56_regmap_sdw;
>  		break;
>  	case 0x3563:
> +	case 0x3562:

nit-pick: is there any reason why 62 is after 63 instead of a regular
increasing order?

>  		regmap_config = &cs35l63_regmap_sdw;
>  		break;
>  	default:
> @@ -510,6 +511,7 @@ static const struct sdw_device_id cs35l56_sdw_id[] = {
>  	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
>  	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
>  	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
> +	SDW_SLAVE_ENTRY(0x01FA, 0x3562, 0x3562),

same here, the devices were in increasing order until this patch.

>  	{},
>  };
>  MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index d5817e4208479..f20bcdfd35af0 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -96,6 +96,7 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
>  					    ARRAY_SIZE(cs35l56_patch_fw));
>  		break;
>  	case 0x63:
> +	case 0x62:

and here...


>  	case 0x35A630:
> +	case 0x35A620:

here as well

Maybe it's because the 62 support comes later, but no one will remember
this timeline and the code looks odd to me.
