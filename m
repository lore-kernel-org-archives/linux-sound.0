Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127727E076
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140552; cv=none; b=Wuw439ez0hu+UXZNS3KI43I7Luece3x/bXzlJ9LGBaYo7eqU0OQh73vy9B2iFjSNJ+w5FT/I/agoA1sQ8NXVCA34MJNtcmJxd2DRhCp4YNitNTpqITNdsXvIgKPHRgvX9b/uFX9KG6R2ugjF+ZJ+fLGnmq3y/32sQJ6AWwwwZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140552; c=relaxed/simple;
	bh=+Oec/anKKhY/LgRXUFAMRdaXEP8lNdyEVLAwFENhAso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qodn1+bvBNADa9ACZENiCz5zzki//fTrLLu900x9pdncPeh5CQ8dchH3nT+WPNjsTBU6BYz0XwcIAEQmtzsxmXcscBQsSYL2jDw8RU1rGtoGsVK8OehWg3YFfdjnv4Mt62vCqmlWUfJymwqeKWvZLMD7fDMW7EVAUGvalXUPmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tgK9KaD8; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tgK9KaD8"
Message-ID: <10209600-42bf-4be1-8ad4-bf60db6f3d28@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758140548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzYeFgrXdFsy/4Y/7OxV8rlI2OrIBRIhnSs9x+Z82OA=;
	b=tgK9KaD8WvqEwaXlabcz9VjjV2eDx414O+B4YZ0IKJgx9ycbyu3gw03hksCdUi0YVouvB+
	rTMz2oCL1ogFhbxGdmYYb61sJ1rZESVA/UaaNGiF3Fzu/7pIRPdTTTtGgG4G9JwL9LCQVr
	v6bsAAc85LispQjFOCTgKStQ6LIyZ6M=
Date: Wed, 17 Sep 2025 20:58:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/19] ASoC: SDCA: Parse XU Entity properties
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-11-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250912103504.2679226-11-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +/**
> + * enum sdca_xu_reset_machanism - SDCA FDL Resets
> + */
> +enum sdca_xu_reset_mechanism {
> +	SDCA_XU_RESET_FUNCTION				= 0x0,
> +	SDCA_XU_RESET_DEVICE				= 0x1,
> +	SDCA_XU_RESET_BUS				= 0x2,
> +};

It'd be worth explaining how the last two might work? The RESET_BUS is puzzling, if the controller performs a hard reset then in theory the device should lose all context. Likewise a RESET_DEVICE should cause the SoundWire device to fall off the bus and lose context as well, and in the case of a multi-function device it could be fun if each function causes a device reset. This could end-up in a boot-loop, no?

> +static int find_sdca_entity_xu(struct device *dev,
> +			       struct fwnode_handle *entity_node,
> +			       struct sdca_entity *entity)
> +{
> +	struct sdca_entity_xu *xu = &entity->xu;
> +	u32 tmp;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(entity_node,
> +				       "mipi-sdca-RxUMP-ownership-transition-max-delay",
> +				       &tmp);
> +	if (!ret)
> +		xu->max_delay = tmp;

maybe add a sanity check on the value?

> +	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-FDL-reset-mechanism",
> +				       &tmp);
> +	if (!ret)
> +		xu->reset_mechanism = tmp;

same here?

m

