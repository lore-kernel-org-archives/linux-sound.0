Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5A3559DD
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342008; cv=none; b=RtJm4SgIbN32zzgG0O5AQyRHIWZstrI3AUg3YLqoUmPJTAJJtB0ol8G7T9m0/n6dgjLGWaIm0/n/1xsGN36sAdjaI8Wr2CKGzLKpqjgsk3Gm7gKIc9INqvYclKRzNPbPCguFsoT4i5sDQQxRr7H4cf6VFuOKqM5mB12tsQQIWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342008; c=relaxed/simple;
	bh=A8UcqDslZwGhFdLAJ5199EGrd66I1rgNC6x6R47PY1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXmt4PsaG/qwfNchVMmJYxgAcwXku9veTNkRkXBk7G2jb3J5qdgK4NR5QIsfEaN/66DpOmlkZ4doImU9UfPWlG564dSbkb4PJtE3U14cxP0RwqvVPe9tI0eTWAIlGYsF65wlOFtFzJQbOB7/ZGLcyr0w0GRAoaYc3HBB1LOS3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gkt5tPru; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gkt5tPru"
Message-ID: <70daa8bb-5dba-4ec3-ade5-d5ce57ca8b2f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768342004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXOvCC6UEsllLowojhM6LDjLHjcIjJrogtUS/SlY54Q=;
	b=Gkt5tPruT7cNaqQNVJtw8WeXRT3LtZFH+5bwunCK91xJqbd8VPc621b4sftPjTJx4S2q06
	vVbT76Vo+mxh0WQyJgI93dpdtIJ6qmh7ZvfO2YSQn7QtrXMqTiDU/YO9z331tnCrz0sh1U
	7lEvrFEVcDoRlo6U95+jDB3LMPfoRyw=
Date: Tue, 13 Jan 2026 22:39:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2 2/2] soundwire: amd: refactor bandwidth calculation
 logic
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 mario.limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
References: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
 <20260113141352.1940465-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260113141352.1940465-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/13/26 15:13, Vijendar Mukunda wrote:
> For ACP6.3/7.0/7.1/7.2 platforms, amd SoundWire manager doesn't have
> banked registers concept. For bandwidth calculation, need to use static
> mapping for block offset calculation based on master port request.
> Refactor bandwidth calculation logic to support 6Mhz bus clock frequency
> with frame size as 50 x 10, 125 x 2 and 12Mhz bus clock frequency with
> frame size as 50 x 10 based on static port block offset logic.

Consider rewriting this commit message, it's quite unclear how you went from 'no banked registers' to static mapping of block offset calculation logic. There's also a built-in contradiction between the need for bandwidth calculation and static mappings. If you force a specific port to use a specific part of the frame, then you don't really need to calculate the bandwidth, do you? Or maybe only to control that the space allocated statically for the port is enough for a stream.

In addition the text says both 6 and 12 MHz are supported, but....


> +			/* Static mapping logic */
> +			if (!amd_manager->port_offset_map[p_rt->num]) {
> +				if (bus->params.curr_dr_freq == 12000000) {

.... this only deals with 6MHz bus clock. 

> +					max_slots = bus->params.row * (bus->params.col - 1);
> +					if (next_offset[inst_id] + stream_slot_size <=
> +					    (max_slots - 1)) {
> +						amd_manager->port_offset_map[p_rt->num] =
> +									next_offset[inst_id];
> +						next_offset[inst_id] += stream_slot_size;
> +					} else {
> +						dev_err(bus->dev,
> +							"No space for port %d\n", p_rt->num);
> +						return -ENOMEM;
> +					}
> +				} else {
> +					amd_manager->port_offset_map[p_rt->num] =
> +									(p_rt->num * 64) + 1;

... and this doesn't seem related to 12 MHz.

> +				}
> +			}
> +			port_bo = amd_manager->port_offset_map[p_rt->num];
> +			dev_dbg(bus->dev,
> +				"Port=%d hstart=%d hstop=%d port_bo=%d slots=%d max_ports=%d\n",
> +				p_rt->num, hstart, hstop, port_bo, stream_slot_size,
> +				amd_manager->max_ports);
> +
>  			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>  					      false, SDW_BLK_GRP_CNT_1, sample_int,
>  					      port_bo, port_bo >> 8, hstart, hstop,
> @@ -1093,6 +1130,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  	default:
>  		return -EINVAL;
>  	}
> +	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
> +	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
> +						    sizeof(int), GFP_KERNEL);
> +	if (!amd_manager->port_offset_map)
> +		return -ENOMEM;
>  
>  	prop = &amd_manager->bus.prop;
>  	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index fe31773d5210..470360a2723c 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -66,8 +66,10 @@ struct sdw_amd_dai_runtime {
>   * @status: peripheral devices status array
>   * @num_din_ports: number of input ports
>   * @num_dout_ports: number of output ports
> + * @max_ports: total number of input ports and output ports
>   * @cols_index: Column index in frame shape
>   * @rows_index: Rows index in frame shape
> + * @port_offset_map: dynamic array to map port block offset
>   * @instance: SoundWire manager instance
>   * @quirks: SoundWire manager quirks
>   * @wake_en_mask: wake enable mask per SoundWire manager
> @@ -92,10 +94,12 @@ struct amd_sdw_manager {
>  
>  	int num_din_ports;
>  	int num_dout_ports;
> +	int max_ports;
>  
>  	int cols_index;
>  	int rows_index;
>  
> +	int *port_offset_map;
>  	u32 instance;
>  	u32 quirks;
>  	u32 wake_en_mask;

