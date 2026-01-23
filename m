Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD8D248886;
	Fri, 23 Jan 2026 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193752; cv=none; b=fWCqe6f+al6SmchPbaU52LLMVqMtvJNLzNPeCyBmdb71LgFl+pV34wcQwUidQjmDt8Yy9SUkpSDS6s5rCaKR0GLcTeraAKby+AjgEvNiKHPq+RWCUqztAjYV5NvP/ZvK/9PsFBruXoxwmnUF0mTfMp93acGVK7NXAu64j+39gEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193752; c=relaxed/simple;
	bh=4zUeRC47Gzeol1unCqjvKdbt1M+5bM1fiRtIQrHcnlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTX9FL05kuwv+mqFgz4Q9rjV/MqgoNAYhILcr6Hui4o5pZ3OYxEzHoS+NrNqP/+ld5uu6WteuK7c5ACD8TNBU9mBvy+1M+RAD/wihFO5J658/pH7E2m/97r2rGQk9kkRQhqkHQ4e9nLlwjk+9sQRhz/oYjYKMv9TF6zeVj8MPo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqHvfqsg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqHvfqsg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854EFC116D0;
	Fri, 23 Jan 2026 18:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769193752;
	bh=4zUeRC47Gzeol1unCqjvKdbt1M+5bM1fiRtIQrHcnlI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KqHvfqsgQgUrefC1FP7WJuGRQVaH137C+FcGvPHieHGrHmbogQQiujodGvdg6EuxD
	 7NAQiJaFJ6JtR9/mSUP8ZMJWje9b9mcJx56ZgQScZcGnkUTMgBcjNxXdxn6xZRU53r
	 KUyvbJLpa2tUTVk/ZmvISlko/9SYUeUSLG/9u8B5a3EagKFFjJR4z1Ei/xXQ+2Fn9M
	 9ytWWZEeuP4aTMOQZa7bNwyHz2n4bOv+5OhtlmZtzWNrTTgd4uhHmTGaL6yu6Z3kd9
	 u68G5ObabN2N5QVKqvWOWZQIb8dfKIBB5btoYDG+ZBUkHhXgg2Uqw2f1JXVFbdNCHd
	 GC+tWA7zt7ksA==
Message-ID: <43754528-90ee-4c61-9b58-5717a7f5b84b@kernel.org>
Date: Fri, 23 Jan 2026 12:42:30 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] soundwire: amd: add clock init control function
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
 <20260123111233.3649153-2-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260123111233.3649153-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/2026 5:11 AM, Vijendar Mukunda wrote:
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

