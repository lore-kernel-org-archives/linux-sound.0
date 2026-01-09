Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BE35CB79;
	Fri,  9 Jan 2026 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767980409; cv=none; b=lfhcS7IRfsqxMpQGLdUTcTiib3CcmjYs6gzryqE8btD/yzHI+AKDAGrq9Yz1F8gCQLtoShep7xqvzRBniDE38m2nDe53cFayf++APMnWHsZtJWfI7Qwg3sRpNuuvzLE08FprIBOzbT2Q2mEF8iwqk5BLzdX0aC3wgWAQYkISfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767980409; c=relaxed/simple;
	bh=I+Q8UMo+dL57MHVZIc+6o7RdCPqujFpj67OPj1VMvEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uND+JLO2nf3V0bwNexvAS5nBcs7JkPcxwGstpz69BzAZaiZ+CWEUhxrL7861bDoyDS5nC/nw7m0fmnTvcRBbOwE621zlk3jC7jEe1ZP9ngjw1T91/lu+5jtGzKTMKgOieNO+tnrDUJllMlttP8h/M7nZSjqEA0szlorcEa32TTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX13VKO9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX13VKO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFF3C4CEF1;
	Fri,  9 Jan 2026 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767980408;
	bh=I+Q8UMo+dL57MHVZIc+6o7RdCPqujFpj67OPj1VMvEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NX13VKO9qgwhzVIocJ0EC3XE74+X//uLxarirPu1oK9kJaw1dowfHEVrhyvERjxol
	 oBSIP7amwq8+OHUgJSsusWlmbidRT2VKK9iPn4Yk1uSMLcG5ehG3+JweqvPtSp42yQ
	 IKDWWlUGpYFym80tIpNePfvZPr6+UCwLFMNDNQh8l6tn9N08c2RqrMKXCb9vJYNP14
	 EJJoAgYWEyctXXSTyEsiUWSaGKP9r6BZiYEEaquYEV2LAbMC07EiFR0m7elbF1le1a
	 I2bcexvqJZS5iJIywyvfvOHsQRd+VRsReTEA3j/P7oQmpIMMlWTfLxpOzkqwMpD/qB
	 N6vgm6hUATkfA==
Message-ID: <17e27498-5da7-4abe-8ce7-a2f828dd6468@kernel.org>
Date: Fri, 9 Jan 2026 11:40:07 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: amd: refactor bandwidth calculaiton logic
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
 <20251222074847.7270-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251222074847.7270-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 1:48 AM, Vijendar Mukunda wrote:
> For ACP6.3/7.0/7.1/7.2 platforms, amd SoundWire manager doesn't have
> banked registers concept. For bandwidth calculation, need to use static
> mapping for block offset calculation based on master port request.
> Refactor bandwidth calculation logic to support 6Mhz bus clock frequency
> with frame size as 50 x 10, 125 x 2 and 12Mhz bus clock frequency with
> frame size as 50 x 10 based on static port block offset logic.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---

You have a typo in the subject "calculaiton"

One more minor comment below. With those fixed you can add to next version:

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>   drivers/soundwire/amd_manager.c   | 52 ++++++++++++++++++++++++++++---
>   include/linux/soundwire/sdw_amd.h |  4 +++
>   2 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index ee3c37a5a48b..4e4fd4c31019 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -480,27 +480,66 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>   
>   static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
>   {
> +	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
>   	struct sdw_transport_data t_data = {0};
>   	struct sdw_master_runtime *m_rt;
>   	struct sdw_port_runtime *p_rt;
>   	struct sdw_bus_params *b_params = &bus->params;
>   	int port_bo, hstart, hstop, sample_int;
> -	unsigned int rate, bps;
> +	unsigned int rate, bps, channels;
> +	int stream_slot_size, max_slots;
> +	static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {0};
> +	unsigned int inst_id = amd_manager->instance;
>   
>   	port_bo = 0;
>   	hstart = 1;
>   	hstop = bus->params.col - 1;
>   	t_data.hstop = hstop;
>   	t_data.hstart = hstart;
> +	if (next_offset[inst_id] == 0)
> +		next_offset[inst_id] = 1;

This seems like pointless check no?
You initialized

 > +	static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {0};

So all offsets will be 0.  Instead this can just be:

	next_offset[inst_id] = 1;

>   
>   	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>   		rate = m_rt->stream->params.rate;
>   		bps = m_rt->stream->params.bps;
> +		channels = m_rt->stream->params.ch_count;
>   		sample_int = (bus->params.curr_dr_freq / rate);
> +
> +		/* Compute slots required for this stream dynamically */
> +		stream_slot_size = bps * channels;
> +
>   		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> -			port_bo = (p_rt->num * 64) + 1;
> -			dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
> -				p_rt->num, hstart, hstop, port_bo);
> +			if (p_rt->num >= amd_manager->max_ports) {
> +				dev_err(bus->dev, "Port %d exceeds max ports %d\n",
> +					p_rt->num, amd_manager->max_ports);
> +				return -EINVAL;
> +			}
> +
> +			/* Static mapping logic */
> +			if (!amd_manager->port_offset_map[p_rt->num]) {
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
>   			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>   					      false, SDW_BLK_GRP_CNT_1, sample_int,
>   					      port_bo, port_bo >> 8, hstart, hstop,
> @@ -1093,6 +1132,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>   	default:
>   		return -EINVAL;
>   	}
> +	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
> +	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
> +						    sizeof(int), GFP_KERNEL);
> +	if (!amd_manager->port_offset_map)
> +		return -ENOMEM;
>   
>   	prop = &amd_manager->bus.prop;
>   	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index fe31773d5210..470360a2723c 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -66,8 +66,10 @@ struct sdw_amd_dai_runtime {
>    * @status: peripheral devices status array
>    * @num_din_ports: number of input ports
>    * @num_dout_ports: number of output ports
> + * @max_ports: total number of input ports and output ports
>    * @cols_index: Column index in frame shape
>    * @rows_index: Rows index in frame shape
> + * @port_offset_map: dynamic array to map port block offset
>    * @instance: SoundWire manager instance
>    * @quirks: SoundWire manager quirks
>    * @wake_en_mask: wake enable mask per SoundWire manager
> @@ -92,10 +94,12 @@ struct amd_sdw_manager {
>   
>   	int num_din_ports;
>   	int num_dout_ports;
> +	int max_ports;
>   
>   	int cols_index;
>   	int rows_index;
>   
> +	int *port_offset_map;
>   	u32 instance;
>   	u32 quirks;
>   	u32 wake_en_mask;

