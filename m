Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03BB18C01E
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280765; cv=none; b=EX8Dqoa3Q3G3omoOK6ge1bubghQySVlIGyGkAV+Kd3x/otw7tTOzXiyk51buwiOlqWWobNAyyAgTeHx/HUqJXYPA3zD0sUlxokWvOs2U80kpQ1XVvJktfJm5JLckZXaEqJ6mUh8x5mltL+BLfgCA+HQEg5bA5GXQenImrpPx0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280765; c=relaxed/simple;
	bh=hNVntCJTqpKhccUVuhsBlDiepyArOitSGObYea6s708=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djWmZZa2yiAGTtIF9Jf/9ML+zjD14YNwo/a3kO0Rbz8l+YSWpibmYOhlywckPa9CeTz229X/xexKt3WjaYUN5A1i0GgHIVGCmGgD7Yo1F02WK/HYBapwzDY444AQcGCjV0npdCelh/5UNwTEuh0npBow/KlGzu9D7Sj/TKH9m68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iKOWaTgh; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iKOWaTgh"
Message-ID: <ff37ea9b-e162-4d6f-ae33-26ec2e342cc6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736280757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JR6j7O/1Z5m7w5RFyBZOylj7dsYAQGii5MAMZCleq8=;
	b=iKOWaTgheLk3XWGYYjf/iwxR5mA9L+JEBv4H5v3taPwqg18D9TeudR2uBOiQPE9vlhmr43
	E3bbThiQdceLc8kTJPtMJBKN2FbdduLnZ25TWSwAzfZoUut+HqmibUn6YcooVL4TulPhDf
	4HykgZ21Bgc5dVLsRxaudQE2APayUK8=
Date: Tue, 7 Jan 2025 13:19:54 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] soundwire: cadence_master: set frame shape and
 divider based on actual clk freq
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20250107015824.5046-1-yung-chuan.liao@linux.intel.com>
 <20250107015824.5046-2-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250107015824.5046-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> -static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
> +static int cdns_init_clock_ctrl(struct sdw_cdns *cdns)
>  {
>  	struct sdw_bus *bus = &cdns->bus;
>  	struct sdw_master_prop *prop = &bus->prop;
>  	u32 val;
>  	u32 ssp_interval;
>  	int divider;
> +	int freq;
>  
>  	dev_dbg(cdns->dev, "mclk %d max %d row %d col %d\n",
>  		prop->mclk_freq,
> @@ -1356,13 +1357,25 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
>  		prop->default_col);
>  
>  	/* Set clock divider */
> -	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
> +	divider	= (prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR /
> +		bus->params.curr_dr_freq) - 1;
> +	freq = bus->params.curr_dr_freq >> 1;

do you actually need this intermediate variable? see below [1] ...

>  
>  	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
>  		     CDNS_MCP_CLK_MCLKD_MASK, divider);
>  	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
>  		     CDNS_MCP_CLK_MCLKD_MASK, divider);
>  
> +	/* Set frame shape base on the actual bus frequency. */
> +	if (!prop->default_frame_rate || !prop->default_row) {
> +		dev_err(cdns->dev, "Default frame_rate %d or row %d is invalid\n",
> +			prop->default_frame_rate, prop->default_row);
> +		return -EINVAL;
> +	}

maybe check the values before writing the divider registers?

> +
> +	prop->default_col = freq * SDW_DOUBLE_RATE_FACTOR /
> +			    prop->default_frame_rate / prop->default_row;

[1] ... this is the only place where 'freq' is used, and you multiply it by two after dividing it by two.

couldn't this just be:

prop->default_col = bus->params.curr_dr_freq /
		    prop->default_frame_rate / prop->default_row;


