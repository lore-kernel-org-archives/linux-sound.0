Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D0315D46
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333681; cv=none; b=k4pc3GyXM3vVmLMcS3Fh9Iowv6eGmH2JCnACQB9CTx1qTuXNg3pUcnOPl2MwNVb+DHJqmFRC25h4kq1a3ehNaZROPnPGZz+VMiFRN2GduK5Nyh5nt9GtLAAf4pvz3O3l52twLRBc8tVBwUt2dE/jBq64GGkhW/idC1UH4XhEq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333681; c=relaxed/simple;
	bh=FjBZrbe/7x+tmMNoW9XotM8qDBvyrj6MFGhdRWZW3is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBy9rHYb/I4JnTY0ICr8iPzATKmDxbDNDRuP/3wyjJryfBN8YSrXwNlZ7b4VgT3G7ERWwSJoYoE1L7Orn5ZgquTSdIOPVic8kJd6w9SLivTdc+WRw19JmCxVnSLxQsyosYCeRgIu/lZZfHrKCci9WLcsUANjEmapmDK4Ogc0ttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wyW6gniT; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wyW6gniT"
Message-ID: <2f9bffb7-1f89-477e-b2f2-09974b189d57@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757333677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzP6IJFDW4Ca2zr905XrzcZPs5ecV0dNIAfA1wFH+V4=;
	b=wyW6gniTd0qqSfHbzZuUq8uYgJdHlIlsRjznSX3mJ/y1yOm6f3AUQxvoJvz2QjM9Q3yyp4
	MlpdO79FpDCXE1d7F9MviOoT3/xQO4gjLxX15zZy9ub5zAaZjH4n4lqr+MPLsAS15Ubm1l
	qnB706ahf+aGpqVprnKRzOimc8TkivA=
Date: Mon, 8 Sep 2025 13:49:43 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 04/15] ASoC: SDCA: Pass device register map from IRQ alloc
 to handlers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-5-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250905143123.3038716-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/5/25 16:31, Charles Keepax wrote:
> Store a copy of the device register map in the structure for the IRQ
> handlers. This will allow the individual IRQ handlers access to the
> device level register map if required.

Sorry, not following how you plan on sharing access to regmap between parent and child devices.


> @@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
>  
>  	info->irq_chip = sdca_irq_chip;
>  
> +	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
> +		info->irqs[i].device_regmap = regmap;
> +

Lost on this one as well. A child device could support multiple interrupts, e.g. for buttons and jack, not sure why each interrupt needs a separate pointer to the same identical information.
