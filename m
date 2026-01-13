Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA702BD5B4;
	Tue, 13 Jan 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316384; cv=none; b=IBDFs+TKkseZWbcO1L29WoOzCuKBU29HvN1hVUMFcfKomO1F+J8GGLVTn5xhI9GCQ/N1kq4kKZdjfZKH418kn5rKaRFSoDcp3m/svbqrOvBM5N4znVhPcTsDJm8vBaK7cQeKdSa4FcBAqKGEW7nwh83YmrALWxIlHCpYL/KLh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316384; c=relaxed/simple;
	bh=kodL0uqaSiC0qxOh4VdO25yQak7i7gLqfbXklTSBVaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv64C0SslqvniduYO4czsLARfLT7jI2i0oVdTqqlnNW7OL/Rlh9Fhnz61p6DnZ6xJ5wqyE6Jn14j1lTLd0tXj6J1uCHxFBfojGVKCKGgqpTX6Mgf3YeLQHTYpcOTch0f1A7/QXfd3vnvOeI41sVJOYXDxALHJ0QTTKTsCMYmyME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoHro1B7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoHro1B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA912C116C6;
	Tue, 13 Jan 2026 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316383;
	bh=kodL0uqaSiC0qxOh4VdO25yQak7i7gLqfbXklTSBVaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OoHro1B7CYCnZCUqRAD1YXQt5oNCmV8fU6fVJ0OezKaSoZwSLCMT6b6TBjlvTxENZ
	 kead+F9epy0GQPOU01yAle01ufOiqJjIUAep1bmsSHoRqfa9sljUikYM4+WAKNvWRk
	 f+wJRGQYeGN34k3693NEEkB8N+s9zLomdOGej0NX3XLcXFhaqAqBYO8YiV4HcYf0U9
	 hWRx71ES1lYnREZu7E6SoK204mCT40iMVyLqGejXs8Z4TyQ93sftxpyjL+UL8SSUiI
	 znKWfqoRipp9ATYgKLyqQJ5jCtBo3Xyap3etQw+6X5/O3RnFTru+mpMFv0gFQP02dA
	 uZqiXnhjDIZIg==
Message-ID: <eab93ae1-d07f-4b6c-b642-46e0cf307f58@kernel.org>
Date: Tue, 13 Jan 2026 08:59:41 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] soundwire: amd: add clock init control function
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
 <20260113141352.1940465-2-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260113141352.1940465-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/2026 8:13 AM, Vijendar Mukunda wrote:
> Add generic SoundWire clock initialization sequence to support
> different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
> platforms and remove hard coding initializations for 12Mhz bus
> clock frequency.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/soundwire/amd_manager.c | 56 ++++++++++++++++++++++++++++-----
>   drivers/soundwire/amd_manager.h |  4 ---
>   2 files changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5fd311ee4107..ee3c37a5a48b 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -27,6 +27,49 @@
>   
>   #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
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
> +	return 0;
> +}
> +
>   static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
>   {
>   	u32 val;
> @@ -961,6 +1004,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>   
>   	prop = &amd_manager->bus.prop;
>   	if (!prop->hw_disabled) {
> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
> +		if (ret)
> +			return ret;
>   		ret = amd_init_sdw_manager(amd_manager);
>   		if (ret)
>   			return ret;
> @@ -985,7 +1031,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	struct device *dev = &pdev->dev;
>   	struct sdw_master_prop *prop;
> -	struct sdw_bus_params *params;
>   	struct amd_sdw_manager *amd_manager;
>   	int ret;
>   
> @@ -1049,14 +1094,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	params = &amd_manager->bus.params;
> -
> -	params->col = AMD_SDW_DEFAULT_COLUMNS;
> -	params->row = AMD_SDW_DEFAULT_ROWS;
>   	prop = &amd_manager->bus.prop;
> -	prop->clk_freq = &amd_sdw_freq_tbl[0];
>   	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> -	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
>   
>   	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
>   	if (ret) {
> @@ -1348,6 +1387,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>   			}
>   		}
>   		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
> +		if (ret)
> +			return ret;
>   		amd_init_sdw_manager(amd_manager);
>   		amd_enable_sdw_interrupts(amd_manager);
>   		ret = amd_enable_sdw_manager(amd_manager);
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index 6cc916b0c820..88cf8a426a0c 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -203,10 +203,6 @@
>   #define AMD_SDW_DEVICE_STATE_D3				3
>   #define ACP_PME_EN					0x0001400
>   
> -static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
> -	AMD_SDW_DEFAULT_CLK_FREQ,
> -};
> -
>   struct sdw_manager_dp_reg {
>   	u32 frame_fmt_reg;
>   	u32 sample_int_reg;

