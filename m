Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5F1372EDE
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297754; cv=none; b=DjrO/0GoKyAZ7OlbPtAX4CLfEXmYcQSKWC3oirK8obKziUevSTosFAS/yBGzDy9VHhzK0fLNCnUreHjN0cOZ6Nb9wINjTAHTvaMiXxANUQctp4qFuhOXFPde2DnruZqZsDqBBued7mbRPBiy++WHmEKfMRRGXQmrQZh1fGuq+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297754; c=relaxed/simple;
	bh=A7mGkEciV7wC/7YN9mwtrL7GrYQRAWkhtFzZ01EeL78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOzGwE3gejpVm68SxsCLTkOxEt5r7c8GVZMvdo3aIDPMZbBLDu23S5i/6jtw3QOcvh+Cc+RoMVM8hgSFz91axV0dahXjGewIjJlvSo51kbKV0Z5uA+PLj6Nx674M2b5Q0X2RMhRIr0fy8aThydNSe4nlkr5SfXjlUheEwTXtRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M1wjCeZ4; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M1wjCeZ4"
Message-ID: <1e808962-9a8d-4b0b-ad3c-867de1555d9f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779297750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWY6YAf0a6LsPs2OJBME9DSMlQqnMosjoKE0NTzM+Ng=;
	b=M1wjCeZ49207QZ1YLtN3NgypmAOuWOofMAQO9puKxGqwzIRZgq4nwf0P6GX8Q2U2C4EloG
	LZYOS0uaEPrrAhMyPNNumbXcbhAuUdTu4aPr2nHiLFelIZVWU6DTyx2J8q15z97XgESa/r
	vjgId66EeLab8LBwOJeX2c1ANk6Ifrg=
Date: Wed, 20 May 2026 19:21:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: only handle alert events when the peripheral
 is attached
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/20/26 04:57, Bard Liao wrote:
> It doesn't make sense to handle an alert event when the peripheral is
> not attached. The slave->status could be SDW_SLAVE_ATTACHED or
> SDW_SLAVE_ALERT when it is attached on the bus.

How would you get an ALERT if the peripheral is not attached in the first place?
The status is only reported in a PING frame after enumeration.

Not following what this new test is needed for...
 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  drivers/soundwire/bus.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fe5316d93fef..0490777fa406 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1958,6 +1958,10 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  			break;
>  
>  		case SDW_SLAVE_ALERT:
> +			if (slave->status != SDW_SLAVE_ATTACHED &&
> +			    slave->status != SDW_SLAVE_ALERT)
> +				continue;
> +
>  			ret = sdw_handle_slave_alerts(slave);
>  			if (ret < 0)
>  				dev_err(&slave->dev,

