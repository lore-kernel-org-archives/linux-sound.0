Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE6147DF9B
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867619; cv=none; b=TqhharH1RxkTo8dUAjlMP+X3m4mt9Pxpx3mLVzobj0pOXjT8IX8rnkp0AFlj9VY3BeZIh17tiWsJgwJt3OQNNQ7myxR7Xai5KBZ4fMi+ptVKoPglcUAtbUNndSEnwlwuQsNz3nTiZVaEguPzsthQU2w9R2fixgihDqkAZNUj1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867619; c=relaxed/simple;
	bh=MiEHAPVjkUWXWu+fHvlQwkuQFhA8aaY/ZpL6KqNQzNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRPpYmRVCDx+M/qrgFiuVnvEB/LcR6Cgb51ApA2fVkOB5m9hNA9Mj36fXkJADN/84fT2pHyQUk02a2F5Mhgv+O16pppgbnQahko4Y3RqEn0K5/LEI/xgmhzA5IjLhh+BU/vrPLOVFMdY+TKoFcIUDSOF2EUYuYW75KnagsLBWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aoznoDw3; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aoznoDw3"
Message-ID: <b257ebfe-06b9-4a18-b713-33d20aa9fb12@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767867612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDwx4D8CLHOK2onJkLpJQBmoozwA+hJ3d5BYM7YKtlI=;
	b=aoznoDw3UpGYVRL8O1hBPzskcdf3oCAcTpzZPZJDzTybD3KS53170yp3so4KH20u+EWrcW
	ke6EyR+dSE3n0pf/Sh+3VCrAb64hgEA0d1ZH5Rscwo5KwkM69oi7bIRAx8IMasYhiEyjbP
	Ol4l0NPK14lQx8+HBtQxG1LCdvf6kd8=
Date: Thu, 8 Jan 2026 11:18:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] ASoC: SDCA: Add basic system suspend support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 shumingf@realtek.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
 <20251218113520.1287693-3-ckeepax@opensource.cirrus.com>
 <720ffab9-1c09-433a-b3a0-40ed496119fb@linux.dev>
 <aV4vlfWtVUMEcCpD@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aV4vlfWtVUMEcCpD@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/7/26 11:04, Charles Keepax wrote:
> On Tue, Jan 06, 2026 at 06:23:17PM +0100, Pierre-Louis Bossart wrote:
>>
>>> +static int class_suspend(struct device *dev)
>>> +{
>>> +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	disable_irq(drv->sdw->irq);
>>> +
>>> +	ret = pm_runtime_force_suspend(dev);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to force suspend: %d\n", ret);
>>
>> suggestion: since this is going to be fairly generic code
>> used by multiple devices, it'd be useful to add a device
>> identifier or string to the error log, no?
> 
> Doesn't the dev_err already do that, it prints the device name in
> the log?

Yes but the device name could be confusing, not everyone can figure out what "sdw:0:0:025d:0711:01:" means

>>> +	if (drv->suspended) {
>>> +		sdca_irq_enable_early(drv->function, drv->core->irq_info);
>>> +		sdca_irq_enable(drv->function, drv->core->irq_info);
>>
>> maybe add a comment on why the two calls are done
>> sequentially. You did mention it somewhere, it'd be good to
>> capture the design.
> 
> Yeah can do, its a little bit of one of these intermediate step
> things. Becomes come clear in the next patch.

ok
