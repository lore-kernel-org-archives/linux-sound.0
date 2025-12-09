Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448473314CD
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285532; cv=none; b=ICU5zI3VGu0W+5yo2cIL/HaJaAPeJbJ76o80NVUgLePukzoTIvxV75UnqAB/LpJcnH9iXjPes4KWCuEPQW2VSxv0oj1TWdH5gYOezVTz1C011GBqyBVPee7+SLyVlz1JMNcvRupd9HyroX7bpm6cr2CNf1uXZpD3i1TiygaQjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285532; c=relaxed/simple;
	bh=bZvxC5wKv3wMpm7sp43fh55Vl/PxdhyN02TGW+JmuBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWMXAY9cTtQaJGyz3hc3sKrLPJkz0amXOYxfQaW/Tr/l4SALFBt7FC5miZTLLoV0Iku1OS8T5VQPG4Y1WFgxjtPCQ51OYXBiHn35hvC4T6nOWOUIWgEhVdcNmmzvLCExquEYBpXXy/JqJr+2EFv2/THLn3uwayFUUM1rKXtIw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kp2gh8uK; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kp2gh8uK"
Message-ID: <b4e00b53-c87d-48e5-9e95-18531a23bde8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BM06WkFKWIDHvhF9hbc/lenjVbjcr32JWHJf7q4KlH0=;
	b=kp2gh8uK7FpkV3tj7I/nGzSr7XegOapEFBKmsd7jpfdzRfNVQa9kvyMnSpPFwuavZCAIxA
	FGbvrLVhWER1go2oCh4H335Pp9VhB8up566Ik3LgA2Ae0I2ocJkMRIIbs6x575JhvA1yh+
	+oH7ZgAqvW+KXkz9rQXL6tlgPQKySZI=
Date: Tue, 9 Dec 2025 12:00:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] ASoC: SDCA: Factor out jack handling into new c file
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251125152128.274808-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +	switch (val) {
> +	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
> +	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
> +		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
> +				   interrupt->entity->id,
> +				   SDCA_CTL_GE_SELECTED_MODE, 0);
> +
> +		/*
> +		 * Selected mode is not normally marked as volatile register
> +		 * (RW), but here force a read from the hardware. If the
> +		 * detected mode is unknown we need to see what the device
> +		 * selected as a "safe" option.
> +		 */
> +		regcache_drop_region(interrupt->function_regmap, reg, reg);
> +
> +		ret = regmap_read(interrupt->function_regmap, reg, &val);
> +		if (ret) {
> +			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
> +			return ret;
> +		}

The detected_mode is reported by hardware and copied into the selected_mode, but that's not the end of it.
We should capture with at least a comment that the intent of the SDCA design was to let the user or additional vendor-specific override the selected mode. If/when we have to deal with the complicated multi-jack topologies it'll be required.
