Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA261FC3
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578718; cv=none; b=ZhHgD171zhcIPmRefjkpv/oFJrRyjNlEBBM8iXCZpNUAVQe22/yhbFaSKFjMgvES6fGvz4oWhibVgkIxdaWECTsfEaWCy+IUicMOAnEDv4Eo8OfYhPoTXCeWCu8msbox18d05MyOMJg/U+8xunSqR2UQznAL+S1cQakG+jUMXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578718; c=relaxed/simple;
	bh=RvlExb/QUBvuVlsgcTdHB9/OSS73nTDeMklz+rpaTns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjn87F5vuVQOzkiOX6PwSd4td/eGtd01FDqBSzu4Ebx219GgHLmDlbuECfixeU1Xk0sAT6WivjVcDIk6OoMMxiXgTWI5lHQ3qShFjnwUXY/6cQl3OY9w/z6KFaqnU6+cxvvG71ntS93NtzguT5YW78454nz8S/rVqx+BbYuCSsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vizRuQgF; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vizRuQgF"
Message-ID: <39108baa-b379-4171-8426-c3b00a94e5f9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761578713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/cmn7m07XJ28hqKVtW81bEo3jZbPI1gYoKGgoOY+a0=;
	b=vizRuQgFnY2JVXzhn8mbcEKjbEQQ6W7htWVZFsuAlpZXtqw+mCX5gXy5KMPxA+/8bsgmLE
	GzN2effYtOkf+HdtZe+lPc4ZHeqOqFmV1wM6SB0U5LmSmrg4UBaeebiAqaFcRPTm/DoXpg
	HAafa2SxyxTEl82pJBceMsHVKIU2j7A=
Date: Mon, 27 Oct 2025 15:39:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 RESEND 14/19] ASoC: SDCA: Add FDL library for XU
 entities
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
 <20251020155512.353774-15-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251020155512.353774-15-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +config SND_SOC_SDCA_FDL
> +	bool "SDCA FDL (File DownLoad) support"
> +	depends on SND_SOC_SDCA
> +	default y
> +	help
> +	  This option enables support for the File Download using UMP,
> +	  typically used for downloading firmware to devices.

nit-pick: shouldn't this option be selected by device drivers who need this library? There should be guardrails to prevent the fallback helpers from being used silently.

> +int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
> +			struct regmap *regmap)
> +{
> +	unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
> +					SDCA_ENTITY_TYPE_ENTITY_0,
> +					SDCA_CTL_ENTITY_0_FUNCTION_ACTION, 0);
> +	unsigned int val, poll_us;
> +	int ret;
> +
> +	ret = regmap_write(regmap, reg, SDCA_CTL_ENTITY_0_RESET_FUNCTION_NOW);
> +	if (ret) // Allowed for function reset to not be implemented
> +		return 0;

nit-pick: maybe document why this is allowed. This doesn't seem very good in terms of design.

> +
> +	if (!function->reset_max_delay) {
> +		dev_err(dev, "No reset delay specified in DisCo\n");
> +		return -EINVAL;
> +	}

nit-pick: or maybe fallback to a reasonable default? Making the entire download dependent on Disco correctness isn't going to work long-term.

> +
> +	poll_us = umin(function->reset_max_delay >> 4, 1000);

add comment on what this >> 4 means.

> +
> +	ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
> +				       function->reset_max_delay);
> +	if (ret) {
> +		dev_err(dev, "Failed waiting for function reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(sdca_reset_function, "SND_SOC_SDCA");

> +/**
> + * sdca_fdl_process - Process the FDL state machine
> + * @interrupt: SDCA interrupt structure
> + *
> + * Based on section 13.2.5 Flow Diagram for File Download, Host side.
> + *
> + * Return: Zero on success or a negative error code.
> + */
> +int sdca_fdl_process(struct sdca_interrupt *interrupt)
> +{
> +	struct device *dev = interrupt->dev;
> +	struct sdca_entity_xu *xu = &interrupt->entity->xu;
> +	unsigned int reg, status;
> +	int response, ret;
> +
> +	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
> +				      interrupt->function, interrupt->entity,
> +				      interrupt->control);
> +	if (ret)
> +		goto reset_function;
> +
> +	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
> +			   SDCA_CTL_XU_FDL_STATUS, 0);
> +	ret = regmap_read(interrupt->function_regmap, reg, &status);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to read FDL status: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "FDL status: %#x\n", status);
> +
> +	ret = fdl_status_process(interrupt, status);
> +	if (ret < 0)
> +		goto reset_function;
> +
> +	response = ret;
> +
> +	dev_dbg(dev, "FDL response: %#x\n", response);
> +
> +	ret = regmap_write(interrupt->function_regmap, reg,
> +			   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set FDL status signal: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
> +					interrupt->function, interrupt->entity,
> +					interrupt->control);
> +	if (ret)
> +		return ret;
> +
> +	switch (response) {
> +	case SDCA_CTL_XU_FDLH_RESET_ACK:
> +		dev_dbg(dev, "FDL request reset\n");
> +
> +		switch (xu->reset_mechanism) {
> +		default:
> +			dev_warn(dev, "Requested reset mechanism not implemented\n");
> +			fallthrough;

this fallthrough looks odd since it forces a check on the reset a second time ...

> +		case SDCA_XU_RESET_FUNCTION:
> +			goto reset_function;
> +		}
> +	default:
> +		return 0;
> +	}
> +
> +reset_function:

... inside this function call

> +	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");

