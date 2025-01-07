Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A218C01E
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280769; cv=none; b=bo74DRx+dm3Rb/PBmO8Cxy+u51qUyLUrW33yiYhKwtaFsj3J/CzZRU+YSiWrEPyoRKNg+Pxk2T4ppHhygjHIYuSaHhvTgzA6jHkWt7IcSHn96cbtPVQ9PfF/zwDWx3fK8YThT8HSqZOWXCIKcw2GwyNsnMZ6V0X/+zq/Kxt6nbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280769; c=relaxed/simple;
	bh=QPS45R3yAkTLfyofdNYgr8HqYGUX2PWosRR0rAkn4bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fw09fhLKekPNu+zsl4pcChD68UWPyC19I5sM8yLkYBszanuPx53rEDlHOWJD+NYAijbaIWZViSXTC1xQLTdc/hbMQ1wBlV4vuCi3oGb9vUtjnKFon6aILbMW6i3xokiQoyQkfjp9LoiE5K5pInxMMFcuXSwNdadW/HI0Rgu27WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wQtYL8Le; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wQtYL8Le"
Message-ID: <5cf92557-06eb-4a17-a0f3-5c4268f5cffd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736280763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vC4YOAdE8kcmr4qABxw39qbkgjEugWIYaK2a0nLfTqI=;
	b=wQtYL8Legp8+0o0+eNkcx1B62pwco7vXOcFeQnBzi+M0ki8p8+P9tQjNqNdw9b9xD/ZDFK
	nq6iJ8u5XibLzSX+v4BRr+7iztexWmZtSjggCAkr3ktQRrUaLrVoJyB6MQh0MJJSXaMGNf
	h+j4IivZevxW9+Z7sJo7HU6WAA8VUiE=
Date: Tue, 7 Jan 2025 13:22:28 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Revert "soundwire: intel_auxdevice: start the bus at
 default frequency"
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20250107015824.5046-1-yung-chuan.liao@linux.intel.com>
 <20250107015824.5046-3-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250107015824.5046-3-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 1/6/25 7:58 PM, Bard Liao wrote:
> Now, we can support more than 1 soundwire bus clock frequency.
> 
> This reverts commit c326356188f1dc2d7a2c55b30dac6a8b76087bc6.

maybe clarify that this has no impact on "legacy" devices prior to LunarLake, where only one frequency is listed in the _DSD properties.

 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  drivers/soundwire/intel_auxdevice.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 599954d92752..dee126f6d9d5 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -222,30 +222,9 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
>  
>  static int intel_prop_read(struct sdw_bus *bus)
>  {
> -	struct sdw_master_prop *prop;
> -
>  	/* Initialize with default handler to read all DisCo properties */
>  	sdw_master_read_prop(bus);
>  
> -	/*
> -	 * Only one bus frequency is supported so far, filter
> -	 * frequencies reported in the DSDT
> -	 */
> -	prop = &bus->prop;
> -	if (prop->clk_freq && prop->num_clk_freq > 1) {
> -		unsigned int default_bus_frequency;
> -
> -		default_bus_frequency =
> -			prop->default_frame_rate *
> -			prop->default_row *
> -			prop->default_col /
> -			SDW_DOUBLE_RATE_FACTOR;
> -
> -		prop->num_clk_freq = 1;
> -		prop->clk_freq[0] = default_bus_frequency;
> -		prop->max_clk_freq = default_bus_frequency;
> -	}
> -
>  	/* read Intel-specific properties */
>  	sdw_master_read_intel_prop(bus);
>  

