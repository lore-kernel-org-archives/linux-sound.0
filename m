Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDC27A45C;
	Wed, 28 Jan 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589107; cv=none; b=tydYDVrUqBMsVXkB1cTXLwcY6SDcI9aCrySI/7yI7gWkVC4DD+9RjpxpCAlMv9F+NBvoZFIbB3kT/n8rN5SEETYl1vrUUZKCLyKadX0/h4TlKofTmXsnW0oG+JzulKIBRRainUeDkGRuzG4d+AtHoSCMsIdqhdLnTAIPle+no2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589107; c=relaxed/simple;
	bh=HRi4FLBBH3KRRahkmihrfK/GXBhp62A0MoCiB5QEjhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmvukeImfpRBiEj9x88KMfj90WX2qq+fjU71UWsf/tBuAXSw9OocEA5BJ9I7Hdrii6e/x4OeuGL5v+39ngISQ0931GMQrdBggMmzmW94+xZ3H/Ysta8CyKssEfRyQ6gGNSC0B6eNJ2P6C02zRv0dPrftq4GuVkgQiYQEull1fbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiO7phgu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiO7phgu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278F7C4CEF1;
	Wed, 28 Jan 2026 08:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769589106;
	bh=HRi4FLBBH3KRRahkmihrfK/GXBhp62A0MoCiB5QEjhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tiO7phguiVPnK/neFgqnELcQ+3O5fVCxHuDRKFt025evXtRKFlw3H7jJCyRnP1SaI
	 c02PyFSZTi45UhdOeq6t2ywNYKWW/K7NHVI28vHJ6Y38pzabdsSRB1n/B6vlCop6rv
	 hEMhRw4B4yoQpxF7qqV7jtcMfjaWDyMkcfHpt62VJi/isZbhwrgDde2693Ex9STLi/
	 7fXlqhvGipq13DqEbvl8NlO/8lxaVnVTzeFw6s4KU+mn6CglWruh85sC+xA1JCwxuG
	 z2lf2nxpkqZ5XLakpa+zkc2sqY08TI91pnX1EJvl0vKssRmdkTyFTcy1T+pRkXmfAw
	 iQecvXOzXsaJg==
Date: Wed, 28 Jan 2026 14:01:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
	venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] soundwire: amd: add clock init control function
Message-ID: <aXnJbqm6NNETpnWZ@vaman>
References: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
 <20260123111233.3649153-2-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123111233.3649153-2-Vijendar.Mukunda@amd.com>

On 23-01-26, 16:41, Vijendar Mukunda wrote:
> Add generic SoundWire clock initialization sequence to support
> different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
> platforms and remove hard coding initializations for 12Mhz bus
> clock frequency.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 56 ++++++++++++++++++++++++++++-----
>  drivers/soundwire/amd_manager.h |  4 ---
>  2 files changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5fd311ee4107..ee3c37a5a48b 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -27,6 +27,49 @@
>  
>  #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
>  
> +static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
> +{
> +	struct sdw_bus *bus = &amd_manager->bus;
> +	struct sdw_master_prop *prop = &bus->prop;
> +	u32 val;
> +	int divider;
> +
> +	dev_dbg(amd_manager->dev, "mclk %d max %d row %d col %d frame_rate:%d\n",
> +		prop->mclk_freq, prop->max_clk_freq, prop->default_row,
> +		prop->default_col, prop->default_frame_rate);
> +
> +	if (!prop->default_frame_rate || !prop->default_row) {
> +		dev_err(amd_manager->dev, "Default frame_rate %d or row %d is invalid\n",
> +			prop->default_frame_rate, prop->default_row);
> +		return -EINVAL;
> +	}
> +
> +	/* Set clock divider */
> +	dev_dbg(amd_manager->dev, "bus params curr_dr_freq: %d\n",
> +		bus->params.curr_dr_freq);
> +	divider = (prop->mclk_freq / bus->params.curr_dr_freq);
> +
> +	writel(divider, amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
> +	val = readl(amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
> +	dev_dbg(amd_manager->dev, "ACP_SW_CLK_FREQUENCY_CTRL:0x%x\n", val);
> +
> +	/* Set frame shape base on the actual bus frequency. */
> +	prop->default_col = bus->params.curr_dr_freq /
> +			    prop->default_frame_rate / prop->default_row;
> +
> +	dev_dbg(amd_manager->dev, "default_frame_rate:%d default_row: %d default_col: %d\n",
> +		prop->default_frame_rate, prop->default_row, prop->default_col);
> +	amd_manager->cols_index = sdw_find_col_index(prop->default_col);
> +	amd_manager->rows_index = sdw_find_row_index(prop->default_row);
> +	bus->params.col = prop->default_col;
> +	bus->params.row = prop->default_row;
> +	dev_dbg(amd_manager->dev, "rows_index: %d cols_index: %d\n",
> +		amd_manager->rows_index, amd_manager->cols_index);
> +	dev_dbg(amd_manager->dev, "params.col:0x%x params.row:0x%x\n",
> +		bus->params.col, bus->params.row);

Too many debug statements in this. These are good for initial debug and
bringup but very noisy in real production. I would add the applied
parameters for logging

> +	return 0;
> +}
> +
>  static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
>  {
>  	u32 val;
> @@ -961,6 +1004,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>  
>  	prop = &amd_manager->bus.prop;
>  	if (!prop->hw_disabled) {
> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
> +		if (ret)
> +			return ret;
>  		ret = amd_init_sdw_manager(amd_manager);
>  		if (ret)
>  			return ret;
> @@ -985,7 +1031,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct device *dev = &pdev->dev;
>  	struct sdw_master_prop *prop;
> -	struct sdw_bus_params *params;
>  	struct amd_sdw_manager *amd_manager;
>  	int ret;
>  
> @@ -1049,14 +1094,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	params = &amd_manager->bus.params;
> -
> -	params->col = AMD_SDW_DEFAULT_COLUMNS;
> -	params->row = AMD_SDW_DEFAULT_ROWS;
>  	prop = &amd_manager->bus.prop;
> -	prop->clk_freq = &amd_sdw_freq_tbl[0];
>  	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> -	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
>  
>  	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
>  	if (ret) {
> @@ -1348,6 +1387,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  			}
>  		}
>  		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
> +		if (ret)
> +			return ret;
>  		amd_init_sdw_manager(amd_manager);
>  		amd_enable_sdw_interrupts(amd_manager);
>  		ret = amd_enable_sdw_manager(amd_manager);
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index 6cc916b0c820..88cf8a426a0c 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -203,10 +203,6 @@
>  #define AMD_SDW_DEVICE_STATE_D3				3
>  #define ACP_PME_EN					0x0001400
>  
> -static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
> -	AMD_SDW_DEFAULT_CLK_FREQ,
> -};
> -
>  struct sdw_manager_dp_reg {
>  	u32 frame_fmt_reg;
>  	u32 sample_int_reg;
> -- 
> 2.45.2

-- 
~Vinod
