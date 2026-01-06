Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D5F355024
	for <linux-sound@vger.kernel.org>; Tue,  6 Jan 2026 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720212; cv=none; b=DGyoPehT0z3wK0pe0+6s/1MHT6dztj/m14DzZKsj2Pw8u//4SlkX22V9vj5hbdYL+qVOSY26NRLCs4lr9DWTpXY+awEil+1E45fzwuDvqYgk8YXGAISID0xg84MBR55fyFzy8YcD95XNgaOngb0Y7Shi0FktfRdqETLdHKqVdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720212; c=relaxed/simple;
	bh=F8ngVJOU4u8mpmoa2Y0S1SJhJUq8K4MBC7hxv4ewARY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEh0rdOFn3ZKKAJzTKYilRV+bEwZ9i1iumjLL0Znrb34ESjWZtclXFRXUVEjJwf4pgZ5Mj/5aLPvmZVzG70PUlUJagJQ1oyftg92DG+DvOY3/IpOobsrvbWHN+x3Qt8h2JfLRG3EaqGyEf+MLs4Dz7ddqvaQT9QxkES9HBHm650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XqoQJfni; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XqoQJfni"
Message-ID: <b09dc2bc-43dd-48c5-b0f8-ed75bbf50a1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767720209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urWIhnk9x/INDK34Lm7zgXieG+kabtXunpnNaxArpW8=;
	b=XqoQJfnimhRgdYfRL7/ZnYCUj7RBZ5x7bAf9ZYD2wnW+AKzenksaOZMKDc8V/i0sbsj+PH
	u7ho4tjsyJDKqBJXZdP334opqjB9tIV2ZfDn1RXlbdrkzZ+6oL6Gx3X74aAhZqGvGSKvcm
	9xbbO9gcsFDZQ2c0WAAhUNIYumgv3Jk=
Date: Tue, 6 Jan 2026 18:17:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
 <20251218113520.1287693-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251218113520.1287693-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

only a couple of nit-picks below:

> +/**
> + * sdca_irq_enable_early - Re-enable early SDCA IRQs for a given function
> + * @function: Pointer to the SDCA Function.
> + * @info: Pointer to the SDCA interrupt info for this device.
> + */
> +void sdca_irq_enable_early(struct sdca_function_data *function,
> +			   struct sdca_interrupt_info *info)
> +{
> +	irq_enable_flags(function, info, true);
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_enable_early, "SND_SOC_SDCA");
> +
> +/**
> + * sdca_irq_enable_early - Re-enable SDCA IRQs for a given function

copy-paste from above making this kernel-doc description incorrect.

> + * @function: Pointer to the SDCA Function.
> + * @info: Pointer to the SDCA interrupt info for this device.
> + */
> +void sdca_irq_enable(struct sdca_function_data *function,
> +		     struct sdca_interrupt_info *info)
> +{
> +	irq_enable_flags(function, info, false);
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_enable, "SND_SOC_SDCA");
> +
> +/**
> + * sdca_irq_disable - Disable SDCA IRQs for a given function
> + * @function: Pointer to the SDCA Function.
> + * @info: Pointer to the SDCA interrupt info for this device.
> + */
> +void sdca_irq_disable(struct sdca_function_data *function,
> +		      struct sdca_interrupt_info *info)

maybe explain why we have an _early version for enable but not a _late for disable?

> +{
> +	struct sdca_interrupt *interrupt;
> +	int i;
> +
> +	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
> +		interrupt = &info->irqs[i];
> +
> +		if (!interrupt || interrupt->function != function)
> +			continue;
> +
> +		disable_irq(interrupt->irq);
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_irq_disable, "SND_SOC_SDCA");

