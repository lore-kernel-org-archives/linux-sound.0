Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B343314CC
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285543; cv=none; b=TARPDtlRTYidIVA7sp/LDOPsTahUTSNvD4QQwQ+RRAkbunNq+UP74Kd6lWubTUOISRFLsdTyLdHGIr8lIv2jDpf3HgU/q/Ba0yr11uSMfnHNHy7lcx60LUFfpmUZ3Vr0Hy/n7+K8TMc2Uj/aqPVf4e0lNJ4ekvZBCim0J4S3VP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285543; c=relaxed/simple;
	bh=HQTI1ooWMuCzYuNNU8i9hAnUNC8E+9jMH47vaWcYKeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGy9FM4a44znLrmuc0NCxoY+ZxUubF2byXEgOXx7yLJpMPofQGVArN9HQjwi/xn3oQmhgsXK9sHYb69xwPSoMikdi2Nq4qIXUa+jH40R5JOHTLDoZaK+lc6P3taEt/pxCPEeNJsCLv5wzVKXDzgps26mk9pyWIFpcVFECndrKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nNBTTpo6; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nNBTTpo6"
Message-ID: <c8448dc6-7a90-4eff-9758-146c8bb09c7f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESVlgz04RxnMCY8yBy9BKh/G70A6Zp0N46ShARtn9Wg=;
	b=nNBTTpo6TBF0OpLHPQ8JTCgREQFA6swvC/hnUeAhMHT2l3r8eyys6/oHGJdpRMEcXKNdW6
	bMzNQSAB47ApazqJ/Fho7HS2BJtgnoOvHbbFjGL7HqaBNcEfZ6KUK0+BGoiBmptg5P++0/
	Wj6Sa1omZp1kKiWNiZg48yq1c0243hM=
Date: Tue, 9 Dec 2025 12:18:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] ASoC: SDCA: Device boot into the system suspend
 process
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-7-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251125152128.274808-7-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/25/25 15:21, Charles Keepax wrote:
> When system suspending the device may be powered off, this means all
> state will be lost and the firmware may need to be re-downloaded. Add
> the necessary calls to bring the device back up. This also requires that
> that the FDL (firmware download) IRQ handler is modified to allow it to
> run before runtime PM has been fully restored.

Sounds good indeed.

>  		sdca_irq_enable(drv->function, drv->core->irq_info, true);
> +
> +		ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
> +		if (ret)
> +			goto err;
> +
>  		sdca_irq_enable(drv->function, drv->core->irq_info, false);

This answers to my comment on the previous patch but you could make it easier on the reviewer with a better description of what the next patches add.

>  
> +		ret = regmap_write(drv->regmap, reg, 0xFF);
> +		if (ret < 0) {
> +			dev_err(drv->dev, "failed to clear function status: %d\n", ret);
> +			goto err;
> +		}
> +

> +	/*
> +	 * FDL has to run from the system resume handler, at which point
> +	 * pm_runtime isn't yet active.
> +	 */

aren't there cases where FDL also needs to run in a pm_runtime resume case?
My understanding of FDL is that the host would *always* check if the device lost context and if firmware is required then the download takes place. I am not sure why we need the assumption that firmware is *only* required for system resume?



