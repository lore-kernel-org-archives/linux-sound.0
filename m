Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AA3939CE
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679951; cv=none; b=SxlhbXIX3T9yZbxsnaP3r+x+sv4f44aGqbvSN97vif1iX6Lyba+kwAbMpq6453BxrpXWaY8u4F0j9SuG4QDZruUSQiHOIWvdATojFimiypUKse8tlalZFJm0ZHwBBLWh5elXB/nrZkdVt7NeNjv3MsVS/Mc+qaSY5qS7op8S1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679951; c=relaxed/simple;
	bh=ihsdermmAsXkJT9H1WLsp9uum6mNrl84CiMORoNVYiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvblMCf95mZ4DiEhzTCt0WOa8RPOIhCS76IXd0bJzpsv3mwaySfK93/ORc4wx346M3+2E6fh8GBD/tFk7qwtic4nDlihG4JgFGZUeW5G85NWXbUxF2Q/nc8U3BySno27GztwmS1GDtNl1+TMhwIh/V9irQb9YE+ke+At2vDtDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xgrARsOg; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xgrARsOg"
Message-ID: <6b72e996-a2dd-445b-b145-82644a6df8eb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776679946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yu26+HFv9TOn1Hjsrl8bbm9+KBXVC400LIdFArSs2Ts=;
	b=xgrARsOg7UETiwgLlWUoZvgACz54DIuhBKqQryi1pOdGLNjiMZthewtdRrpiCeaHEM1YvL
	/L6QxcDeLSt81IeEFvrNrXs40ykQaZSjkBZOWWc3oBvhfrK0T+QtXecxBpMxqEPu8WSZLi
	eL/AkGqrL5BnjcjAcHzllWR0IBNolQc=
Date: Mon, 20 Apr 2026 11:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification reusable helper
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260417131401.3104-1-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260417131401.3104-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/17/26 15:13, Niranjan H Y wrote:
>   Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
> power state transitions. Per SDCA specification, after writing
> REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
> is reached.

Good initiative to introduce a new common helper...

> +/**
> + * sdca_asoc_pde_ensure_ps - Verify PDE power state reached target state
> + * @dev: Pointer to the device for error logging.
> + * @regmap: Register map for reading ACTUAL_PS register.
> + * @function_id: SDCA function identifier.
> + * @entity_id: SDCA entity identifier for the power domain.
> + * @from_ps: Source power state (SDCA_PDE_PSn value).
> + * @to_ps: Target power state (SDCA_PDE_PSn value).
> + * @pde_delays: Pointer to array of PDE delay specifications for this device,
> + *              or NULL to use default polling interval.
> + * @num_delays: Number of entries in pde_delays array.
> + *
> + * This function polls the ACTUAL_PS register to verify that a PDE power state
> + * transition has completed. Per SDCA specification, after writing REQUESTED_PS,
> + * the caller must poll ACTUAL_PS until it reflects the requested state.
> + *
> + * This function implements the polling logic but does NOT modify the power state.
> + * The caller is responsible for writing REQUESTED_PS before invoking this function.

Erm, why not dealing with the write to REQUESTED_PS in this helper? You have all the 'to' and 'from' information in the parameters.

> + *
> + * If a delay table is provided, appropriate polling intervals are extracted based
> + * on the from_ps and to_ps transition. If no table is provided or no matching entry
> + * is found, a default polling interval is used.
> + *
> + * Return: Returns zero when ACTUAL_PS reaches the target state, -ETIMEDOUT if the
> + * polling times out before reaching the target state, or a negative error code if
> + * a register read fails.
> + */
> +int sdca_asoc_pde_ensure_ps(struct device *dev, struct regmap *regmap,
> +			    int function_id, int entity_id,
> +			    int from_ps, int to_ps,
> +			    const struct sdca_pde_delay *pde_delays,
> +			    int num_delays)
> +{
> +	static const int polls = 100;
> +	static const int default_poll_us = 1000;
> +	unsigned int reg, val;
> +	int i, poll_us = default_poll_us;
> +	int ret;
> +
> +	if (pde_delays && num_delays > 0) {
> +		for (i = 0; i < num_delays; i++) {
> +			if (pde_delays[i].from_ps == from_ps && pde_delays[i].to_ps == to_ps) {
> +				poll_us = pde_delays[i].us / polls;
> +				break;
> +			}
> +		}
> +	}
> +
> +	reg = SDW_SDCA_CTL(function_id, entity_id, SDCA_CTL_PDE_ACTUAL_PS, 0);
> +
> +	for (i = 0; i < polls; i++) {
> +		if (i)
> +			fsleep(poll_us);

This solution will loop for up to 100 times, and the sleep duration could be questionable.

Say for example you have a 10ms transition, do you really want to read ACTUAL_PS every 100us?

If the pde_delay is 1ms then a read every 10us makes no sense, the SoundWire command protocol would not be able to handle such reads.

A minimum threshold on poll_us would make sense IMHO.

> +
> +		ret = regmap_read(regmap, reg, &val);
> +		if (ret)
> +			return ret;
> +		else if (val == to_ps)
> +			return 0;
> +	}
> +
> +	dev_err(dev, "PDE power transition failed: expected 0x%x, got 0x%x\n", to_ps, val);
> +	return -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL(sdca_asoc_pde_ensure_ps);
