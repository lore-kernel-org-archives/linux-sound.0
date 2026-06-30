Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1333A1A58
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812688; cv=none; b=A1UTXxNSnGNEVua+9hkdyyD+/D0De4YYLut7ZA5FemHG4rBa+DeAXjR+U0HFmCm8D9wADdefevgXmnTXeaPrXfhbYJvQnLyzApqR+CprWnE8QaqzORlN7ysIKCuk4fKH9pE9Wqz8Is/GX3e4TPYZuoUta49qKispK9P2afU4DLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812688; c=relaxed/simple;
	bh=tQSLkJy5Rd1l9NtUckxT1AInGUiKvmg7ELIqi/PFI6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RH0x18onLDK9woyMsyvOkkuXbOuM/mZajsjSQfe7WfESyaEdbY3VJM/IrPqfrbL5Kh2eFkCTF3Ik7eSWY7pf9vBrTfNQNyOQfjX0w2dDUkPNGie8n9XsRhdXhGvAwSAFVNaWppRSTaKuEp/Bo0lM6hOF/9c9Hs2w+claqHFXeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ghiVG2nk; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ghiVG2nk"
Message-ID: <ca8eb233-0e40-4900-aaca-69b8fe783f06@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782812685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cg7pDGrSUrNha2ltpI0ocvZ0kO7l4Ce+GQS9ztoo1n0=;
	b=ghiVG2nkOMFWi3Qhe/7OkWmBPLu/WtWmRsBDKLWYDc8M9U69lXzgiWs1PZJwEHRVYzySmC
	NydMugSqFUhNMqcxQ1zIxMS4GE2npg3qPWx7AlHH1vlqkA4L7v3t36/wNakubaljfH20wH
	bc13fxdqcC1xxbsBh/VKsgIuCwRQc4o=
Date: Tue, 30 Jun 2026 11:42:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] soundwire: bus: add CLOCK_STOP_MODE1 support back
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-2-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260629144450.2096823-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/29/26 16:44, Bard Liao wrote:
> CLOCK_STOP_MODE1 is used when the Peripheral might have entered a deeper
> power-saving mode that does not retain state while the Clock is stopped.
> It is useful when the device is more power consumption sensitive. Add it
> back to allow the Peripheral use CLOCK_STOP_MODE1.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

This patch looks fine with the understanding that the DisCo property is defined on a system-by-system basis and isn't a codec property extracted from a datasheet.

If it was a codec property, this could be problematic in some cases. For example in a latency-constrained environment, the host could require peripherals to use the clock-stop mode0 to restart faster, even if this means writing-off power saving that the peripheral supports.

In other words, if the OEMs use a copy-pasted DisCo definition this could be problematic, and at some point we may have to discard the codec property. For now it's fine, so here's my

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  drivers/soundwire/bus.c       | 45 +++++++++++++++++++----------------
>  include/linux/soundwire/sdw.h |  4 ++++
>  2 files changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 0490777fa406..21d8d6d7147a 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -956,8 +956,22 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
>  	mutex_unlock(&bus->bus_lock);
>  }
>  
> +static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
> +{
> +	struct device *dev = &slave->dev;
> +	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
> +
> +	/*
> +	 * Query for clock stop mode if Slave implements
> +	 * ops->get_clk_stop_mode, else read from property.
> +	 */
> +	if (drv->ops && drv->ops->get_clk_stop_mode)
> +		return drv->ops->get_clk_stop_mode(slave);
> +
> +	return slave->prop.clk_stop_mode1 ? SDW_CLK_STOP_MODE1 : SDW_CLK_STOP_MODE0;
> +}
> +
>  static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
> -				       enum sdw_clk_stop_mode mode,
>  				       enum sdw_clk_stop_type type)
>  {
>  	int ret = 0;
> @@ -969,7 +983,7 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
>  		struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>  
>  		if (drv->ops && drv->ops->clk_stop)
> -			ret = drv->ops->clk_stop(slave, mode, type);
> +			ret = drv->ops->clk_stop(slave, slave->clk_stop_mode, type);
>  	}
>  
>  	mutex_unlock(&slave->sdw_dev_lock);
> @@ -978,7 +992,6 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
>  }
>  
>  static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
> -				      enum sdw_clk_stop_mode mode,
>  				      bool prepare)
>  {
>  	bool wake_en;
> @@ -990,7 +1003,7 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
>  	if (prepare) {
>  		val = SDW_SCP_SYSTEMCTRL_CLK_STP_PREP;
>  
> -		if (mode == SDW_CLK_STOP_MODE1)
> +		if (slave->clk_stop_mode == SDW_CLK_STOP_MODE1)
>  			val |= SDW_SCP_SYSTEMCTRL_CLK_STP_MODE1;
>  
>  		if (wake_en)
> @@ -1078,9 +1091,9 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
>  		/* Identify if Slave(s) are available on Bus */
>  		is_slave = true;
>  
> -		ret = sdw_slave_clk_stop_callback(slave,
> -						  SDW_CLK_STOP_MODE0,
> -						  SDW_CLK_PRE_PREPARE);
> +		slave->clk_stop_mode = sdw_get_clk_stop_mode(slave);
> +
> +		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
>  		if (ret < 0 && ret != -ENODATA) {
>  			dev_err(&slave->dev, "clock stop pre-prepare cb failed:%d\n", ret);
>  			return ret;
> @@ -1090,9 +1103,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
>  		if (!slave->prop.simple_clk_stop_capable) {
>  			simple_clk_stop = false;
>  
> -			ret = sdw_slave_clk_stop_prepare(slave,
> -							 SDW_CLK_STOP_MODE0,
> -							 true);
> +			ret = sdw_slave_clk_stop_prepare(slave, true);
>  			if (ret < 0 && ret != -ENODATA) {
>  				dev_err(&slave->dev, "clock stop prepare failed:%d\n", ret);
>  				return ret;
> @@ -1130,9 +1141,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
>  		    slave->status != SDW_SLAVE_ALERT)
>  			continue;
>  
> -		ret = sdw_slave_clk_stop_callback(slave,
> -						  SDW_CLK_STOP_MODE0,
> -						  SDW_CLK_POST_PREPARE);
> +		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);
>  
>  		if (ret < 0 && ret != -ENODATA) {
>  			dev_err(&slave->dev, "clock stop post-prepare cb failed:%d\n", ret);
> @@ -1204,8 +1213,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
>  		/* Identify if Slave(s) are available on Bus */
>  		is_slave = true;
>  
> -		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
> -						  SDW_CLK_PRE_DEPREPARE);
> +		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_DEPREPARE);
>  		if (ret < 0)
>  			dev_warn(&slave->dev, "clock stop pre-deprepare cb failed:%d\n", ret);
>  
> @@ -1213,9 +1221,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
>  		if (!slave->prop.simple_clk_stop_capable) {
>  			simple_clk_stop = false;
>  
> -			ret = sdw_slave_clk_stop_prepare(slave, SDW_CLK_STOP_MODE0,
> -							 false);
> -
> +			ret = sdw_slave_clk_stop_prepare(slave, false);
>  			if (ret < 0)
>  				dev_warn(&slave->dev, "clock stop deprepare failed:%d\n", ret);
>  		}
> @@ -1243,8 +1249,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
>  		    slave->status != SDW_SLAVE_ALERT)
>  			continue;
>  
> -		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
> -						  SDW_CLK_POST_DEPREPARE);
> +		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_DEPREPARE);
>  		if (ret < 0)
>  			dev_warn(&slave->dev, "clock stop post-deprepare cb failed:%d\n", ret);
>  	}
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index b484784e2690..c1d2fc69bed5 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -612,6 +612,7 @@ struct sdw_bus_params {
>   * @update_status: Update Slave status
>   * @bus_config: Update the bus config for Slave
>   * @port_prep: Prepare the port with parameters
> + * @get_clk_stop_mode: Get the clock stop mode of the Slave
>   * @clk_stop: handle imp-def sequences before and after prepare and de-prepare
>   */
>  struct sdw_slave_ops {
> @@ -625,6 +626,7 @@ struct sdw_slave_ops {
>  	int (*port_prep)(struct sdw_slave *slave,
>  			 struct sdw_prepare_ch *prepare_ch,
>  			 enum sdw_port_prep_ops pre_ops);
> +	enum sdw_clk_stop_mode (*get_clk_stop_mode)(struct sdw_slave *slave);
>  	int (*clk_stop)(struct sdw_slave *slave,
>  			enum sdw_clk_stop_mode mode,
>  			enum sdw_clk_stop_type type);
> @@ -643,6 +645,7 @@ struct sdw_slave_ops {
>   * @node: node for bus list
>   * @port_ready: Port ready completion flag for each Slave port
>   * @m_port_map: static Master port map for each Slave port
> + * @clk_stop_mode: The clock stop mode of the Slave
>   * @dev_num: Current Device Number, values can be 0 or dev_num_sticky
>   * @dev_num_sticky: one-time static Device Number assigned by Bus
>   * @probed: boolean tracking driver state
> @@ -677,6 +680,7 @@ struct sdw_slave {
>  	struct list_head node;
>  	struct completion port_ready[SDW_MAX_PORTS];
>  	unsigned int m_port_map[SDW_MAX_PORTS];
> +	enum sdw_clk_stop_mode clk_stop_mode;
>  	u16 dev_num;
>  	u16 dev_num_sticky;
>  	bool probed;

