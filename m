Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675A22A4E9
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140553; cv=none; b=V3ittYlSWWe5viqTsFB0GbhxZ9sBF63G94myKmLy8WhTsSY3Lje0VGDR954b87o+GP/2X9hATNr47gUJUcA35LWdjPSA8sKyJL6/lViURaeCYl/yo5LyJYuWCJqwhkV0lSjTl1KtnfvP1qB854qpLzsfrE648t1ig9gKmC2Kd9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140553; c=relaxed/simple;
	bh=wRgdaxvGUnSSZNzqYzwl2hua5GmZ7+kI1YZs+3RcKCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7ViUpYIwhJawuLeNXRuT6XfmJDtbq4u397oaj9Ht6zVa+q2fSVP/Us2seZPYMcfsiT2O7GMV7uHBzsMDvtm9JIULuP6wLU9EBIbJhfvZTyeLVUqs6atGE4eFZNDXnXGOA13vaoDe24Q8/XJsW6vQiG6eCZf24iFfxJv2Fp9xyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u9A2NLL7; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u9A2NLL7"
Message-ID: <b1d1d507-1a34-42b2-b154-5c4ba100cc83@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758140550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOvrY0sYM/KTQt7EX/DkqWTWCRimrWmCbwg/VqD/ORk=;
	b=u9A2NLL7cjEKFhz5/AknnOs2emDyElLeL0LINJ529yfnDUjLGYvLGpDcWBh9YYevO7+PfO
	aiYx6Ujnxz4sH6WH1fyBOnFyU/gcFWyilrf6Qbxwg1mfC9C/7BJW7hpC/zorfNM8xb1Xe8
	K8GqpzBX2zx3YEPAIPLJZlm8ejBCb5Y=
Date: Wed, 17 Sep 2025 21:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 12/19] ASoC: SDCA: Add UMP buffer helper functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-13-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250912103504.2679226-13-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +int sdca_ump_get_owner_host(struct device *dev,
> +			    struct regmap *function_regmap,
> +			    struct sdca_function_data *function,
> +			    struct sdca_entity *entity,
> +			    struct sdca_control *control);
> +int sdca_ump_set_owner_device(struct device *dev,
> +			      struct regmap *function_regmap,
> +			      struct sdca_function_data *function,
> +			      struct sdca_entity *entity,
> +			      struct sdca_control *control);
> +int sdca_ump_read_message(struct device *dev,
> +			  struct regmap *device_regmap,
> +			  struct regmap *function_regmap,
> +			  struct sdca_function_data *function,
> +			  struct sdca_entity *entity,
> +			  unsigned int offset_sel, unsigned int length_sel,
> +			  void **msg);
> +int sdca_ump_write_message(struct device *dev,
> +			   struct regmap *device_regmap,
> +			   struct regmap *function_regmap,
> +			   struct sdca_function_data *function,
> +			   struct sdca_entity *entity,
> +			   unsigned int offset_sel, unsigned int msg_offset,
> +			   unsigned int length_sel,
> +			   void *msg, int msg_len);

I am still missing the big picture on when/where the timeouts read from DisCo properties are used.
I looked at patch 14 and I don't see any timeouts used except for the reset.

> +/**
> + * sdca_ump_read_message - read a UMP message from the device
> + * @dev: Pointer to the struct device used for error messages.
> + * @device_regmap: Pointer to the Device register map.
> + * @function_regmap: Pointer to the regmap for the SDCA Function.
> + * @function: Pointer to the Function information.
> + * @entity: Pointer to the SDCA Entity.
> + * @offset_sel: Control Selector for the UMP Offset Control.
> + * @length_sel: Control Selector for the UMP Length Control.
> + * @msg: Pointer that will be populated with an dynamically buffer
> + * containing the UMP message. Note this needs to be freed by the
> + * caller.
> + *
> + * The caller should first call sdca_ump_get_owner_host() to ensure the host
> + * currently owns the UMP buffer, and then this function can be used to
> + * retrieve a message. It is the callers responsibility to free the
> + * message once it is finished with it. Finally sdca_ump_set_owner_device()
> + * should be called to return the buffer to the device.

Maybe I misunderstood something in the UMP spec, but I could see a different flow where the host does a set_owner_device() and later reads the buffer updated by the device once the ownership is given back to the host.

I think you're assuming that a read is always initiated by the device, but what if the host wants to read something (volume/acoustic levels, etc) without getting any notification? 

IOW, will a read only happen when the device throws an interrupt on its own? The spec doesn't seem very clear on this...


