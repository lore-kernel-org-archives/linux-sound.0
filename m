Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312F23A9BD
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051950; cv=none; b=I2Luz7Z0cBahTFQmwAhBmNbfbHiJnZCU8Yk2749Ge+4kmR7Y69q7v6iNh49PRRUFv43OL6fGEHtyVWq4aasXh2R6M5K+6GCGPvT06qYCZ5E3PIyzUuQgL+0ZxkU6rV0ole8I97NGCndGrYb6Y3oHeFDpRlB8yeU2X/8u4lpzLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051950; c=relaxed/simple;
	bh=E6i+AMT4gmIURDcq1w8l1tp0Ep//O1ASaXzsGr93Qqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCdRjbcUPnHrECP9Jpe9hv2rFX4E10VxnWfSUDWSoA33E2S+v/3vbcPbisJ/3ZKRiqcOFjHF6TVJepV9akfDtfx4wSqqtJQn5L6CT4BwwOlrAOVzu+HTOZCYLSVsMelUNRL22gintkdwT+XC/FDC8UCzA6T8829S56JmLIf01Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uhJ+RFmL; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uhJ+RFmL"
Message-ID: <a3605fc2-8080-46b9-8c30-a5c38a4f70a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770051945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPAqzFOiXd5OxWdVia0WgdEo0dMwZAlXms6OTi4vUoA=;
	b=uhJ+RFmLF6wQ9xK4XKs0JYvJOO9owaW1mmT1wnrvHIhNNcfAQPWaEvcvAAILzALRDVcbdf
	wpFF4PhfOfiau3h777ehhZz/h2hGHDAcggOQhFd7j5G8V/OnTe7g53ppgyutuCLw81sd0I
	rw3Hp3wYIWkQ5DOvCjHsK0p4ytYIsJ8=
Date: Mon, 2 Feb 2026 18:05:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] soundwire: amd: refactor bandwidth calculation
 logic
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
 <20260129061517.38985-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260129061517.38985-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/29/26 07:14, Vijendar Mukunda wrote:
> For current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
> doesn't have banked registers for data port programming on Manager's side.
> Need to use fixed block offsets, hstart & hstop for manager ports.
> Earlier amd manager driver has support for 12MHz as a bus clock frequency
> with frame size as 50 x 10 with fixed block offset mapping based on port
> number. Got a requirement to support 6MHz bus clock frequency with
> different frame shapes 50 x 10 and 125 x 2.

the two frame shapes don't carry the same number of bits (500 v. 250). There's probably an additional variable at play, maybe frame rate? Or is 50x10 for 12 MHz and 125x2 for 6 MHz?

> For current platforms, amd manager driver supports only two bus clock
> frequencies(12MHz & 6MHz). Refactor bandwidth logic to support different
> bus clock frequencies.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c   | 57 ++++++++++++++++++++++++++++---
>  include/linux/soundwire/sdw_amd.h |  4 +++
>  2 files changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index b53f781e4e74..7cd95a907f67 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -476,12 +476,16 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>  
>  static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
>  {
> +	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
>  	struct sdw_transport_data t_data = {0};
>  	struct sdw_master_runtime *m_rt;
>  	struct sdw_port_runtime *p_rt;
>  	struct sdw_bus_params *b_params = &bus->params;
>  	int port_bo, hstart, hstop, sample_int;
> -	unsigned int rate, bps;
> +	unsigned int rate, bps, channels;
> +	int stream_slot_size, max_slots;
> +	static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {1};
> +	unsigned int inst_id = amd_manager->instance;
>  
>  	port_bo = 0;
>  	hstart = 1;
> @@ -492,11 +496,51 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
>  	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>  		rate = m_rt->stream->params.rate;
>  		bps = m_rt->stream->params.bps;
> +		channels = m_rt->stream->params.ch_count;
>  		sample_int = (bus->params.curr_dr_freq / rate);
> +
> +		/* Compute slots required for this stream dynamically */
> +		stream_slot_size = bps * channels;
> +
>  		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> -			port_bo = (p_rt->num * 64) + 1;
> -			dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
> -				p_rt->num, hstart, hstop, port_bo);
> +			if (p_rt->num >= amd_manager->max_ports) {
> +				dev_err(bus->dev, "Port %d exceeds max ports %d\n",
> +					p_rt->num, amd_manager->max_ports);
> +				return -EINVAL;
> +			}
> +
> +			if (!amd_manager->port_offset_map[p_rt->num]) {
> +				/*
> +				 * port block offset calculation for 6MHz bus clock frequency with
> +				 * different frame sizes 50 x 10 and 125 x 2
> +				 */
> +				if (bus->params.curr_dr_freq == 12000000) {
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
> +					 /*
> +					  * port block offset calculation for 12MHz bus clock
> +					  * frequency
> +					  */
> +					amd_manager->port_offset_map[p_rt->num] =
> +									(p_rt->num * 64) + 1;
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
> @@ -1089,6 +1133,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

