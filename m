Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB61F09B3
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757327277; cv=none; b=IYigefAzK3TGUWi3MDIrnt8CcRF1SOkDdcQJ8oWIQHuGRZ+kZziGWqDhdhDpQkIZhvQW2quQWymBtXTCtY1dpJt1Qep9PC2AlUT6z35dsr3No1g48KCcX32KKUgLUMGqiglTMzOTRRuB3pKooIVuvKqXYaei6NhWugUKVia1TdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757327277; c=relaxed/simple;
	bh=Fs+zQmGTwzX9eK13KujdFaeg1k1LmkLfQ3WsRkyySMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWqMzLDz4TcNynfFTrVhcTKEf/mP8WwB6YLlz4z4revNEZCl3fellWUJS3rFB+0MYrwbiufyCUHZ0BFngZqOb5+Fm/T2YVhUHIcvFj7qi2s6A0cdNSXzpe5dX3P+xqg4hUzRjzVvGaXGGCpy+vwJZ/VCXiQraq48RaR82Qkf9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYwFDPGZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYwFDPGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757327277; x=1788863277;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Fs+zQmGTwzX9eK13KujdFaeg1k1LmkLfQ3WsRkyySMQ=;
  b=JYwFDPGZarixir+eEXYVUnn3njs7vS8L3d3AdA9m0cGvYbd4G77A72zh
   SO9RGIdWJewZA4LAmWwYfM0xx6/iYKGOfVHw+VpraSr+RXCGFHm1rQx/r
   xhGvr8wX1h+ntZRIXh8Y5Sf2f+4sGgh3Uiq78C2BYiwRc6YofFbqcy+yQ
   xRKG/Md+5iUAuAEDAsTFhto0sQxxj9e4hiGZ6jYwe+Ng2Dzv7Xmix9Bz6
   wE7tvItKomig1svQ8197HQNN9Z8Ul2B783WbsJv2NSwqFADif+I7mPY0p
   szCZ9hWzV+GZ0mRRJjVwmKKIg1I5Uaxdxs4MFTJpJJ8daBfJzMGFpyNQ1
   w==;
X-CSE-ConnectionGUID: GR5skLWyRgiTYHvnpFeI2A==
X-CSE-MsgGUID: /95nC1uWTkmNgWSCPkUwsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="62213257"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="62213257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:27:55 -0700
X-CSE-ConnectionGUID: oKzQBtFPRKeoh1kUVu2VGw==
X-CSE-MsgGUID: 68zXFG7pRqiyK8LnHpoynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="177981957"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.90]) ([10.246.104.90])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:27:52 -0700
Message-ID: <01bc3a67-6ed7-4bb5-8106-531af7f29d63@linux.intel.com>
Date: Mon, 8 Sep 2025 18:27:40 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, pierre-louis.bossart@linux.dev,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 bard.liao@intel.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/2025 10:31 PM, Charles Keepax wrote:
> In the future some IRQs (mostly File DownLoad) will need to run before
> the soundcard is constructed, as such refactor more of the IRQ handling
> to use raw device and regmap pointers rather than accessing things
> through the component.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

> -int sdca_irq_data_populate(struct snd_soc_component *component,
> +int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
> +			   struct snd_soc_component *component,
>  			   struct sdca_function_data *function,
>  			   struct sdca_entity *entity,
>  			   struct sdca_control *control,
>  			   struct sdca_interrupt *interrupt)
>  {
> -	struct device *dev = component->dev;

Previously, we assume 'component' will never be null.

>  	const char *name;
>  
> +	if (!dev && component)

But now we test 'component'. If we don't assume 'component' is not null
any more, we could test 'component' at the very beginning of this function.

> +		dev = component->dev;
> +	if (!dev)
> +		return -ENODEV;
> +
>  	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
>  			      entity->label, control->label);
>  	if (!name)
>  		return -ENOMEM;
>  
>  	interrupt->name = name;
> +	interrupt->dev = dev;
> +	if (!regmap && component)
> +		interrupt->function_regmap = component->regmap;
> +	else
> +		interrupt->function_regmap = regmap;
>  	interrupt->component = component;
>  	interrupt->function = function;
>  	interrupt->entity = entity;
> @@ -394,8 +406,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
>  			else if (!interrupt)
>  				continue;
>  
> -			ret = sdca_irq_data_populate(component, function, entity,
> -						     control, interrupt);
> +			ret = sdca_irq_data_populate(dev, NULL, component,
> +						     function, entity, control,
> +						     interrupt);
>  			if (ret)
>  				return ret;
>  

