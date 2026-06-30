Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A92386559
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812695; cv=none; b=unvYGDXoY3vPlLTHKNmPM0MeLAbTlmSIi5N8d+S/L8sg+biwszaBWxE+BgftEqZppqJ+Czy5vxdWAncUrpMrCZ/GmXTeWdgV2TxBsY4f5gGaLjNVFtmXjDvVKhBOVblibxvuCh9+e6caiWiTo+aEasc9Fde6JuC2dU2wUuZSdTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812695; c=relaxed/simple;
	bh=bhB2hvoYO7GIWUCXTxE0hKAX7TbD34vbEdXBRfffC1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjYWZvrmcW6JES8zwQvvpByhBvL7mtkYQxYXMBzlEW7Vh/+9w9naA6Dr6YIOLA5Ysm5HsBBgy6b0qyH4b0j4MjhYGuqPtrIZND0PXbvVAyBZmYcLQ+mDjetX1kOsqYiFV7eDQCoRaxfVb9BJpHvUR4OKp7KZNWVkE7IBHzh0DAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wxrPxqUB; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wxrPxqUB"
Message-ID: <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782812682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fGSx2wrdj7SQ5q8gsIg6m6R/pFV6cbcx6Q/y0r9P5w=;
	b=wxrPxqUB/BLnErzFBtHQ7CrUKIpthywuD9S094Bi9ivvPt38jNCQyXLdHs3FAppn4+fn5p
	pe+OfNVkYpv+8FnAPVECKYgUuNEDfelH3HaVNn5wTEwA/K7VCldhyg2nvmyFGWNtYujJ53
	6MChCgGiy3tvSeh6wdzEPjR5Kuhi/04=
Date: Tue, 30 Jun 2026 11:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/29/26 16:44, Bard Liao wrote:
> There is no need to keep the SoundWire clock active in system suspend.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  drivers/soundwire/intel_auxdevice.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 0b8107bec9ab..10fd27f4fe39 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -669,7 +669,8 @@ static int __maybe_unused intel_suspend(struct device *dev)
>  		return 0;
>  	}
>  
> -	ret = sdw_intel_stop_bus(sdw, false);
> +	/* No need to keep the SoundWire clock active in system suspend */
> +	ret = sdw_intel_stop_bus(sdw, true);

erm, are you sure about this change?

What this does is stop the SoundWire clock before entering system suspend. 
Is this needed? The whole point of system suspend is that the host will stop operating completely.
There is in theory no need to stop the clock because the clock restart capability will not be used.
Think for example of jack detection, it's supported in pm_runtime suspend with the SoundWire interrupt capability, but not in system suspend.
By changing the clock-stop argument to true, you are requesting the clock stop mechanism to be enabled even though you don't need it.

I do recall that in some generations it was actually not supported to turn off power to the IP while the wake detector was enabled.

>  	if (ret < 0) {
>  		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
>  		return ret;

