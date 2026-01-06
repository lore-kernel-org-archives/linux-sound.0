Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933C7355034
	for <linux-sound@vger.kernel.org>; Tue,  6 Jan 2026 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720213; cv=none; b=XSRwyhUjQdQ6tEbh+m2lpSYdu31d0DrYF9qQsT8I1k9oOSzCajPiRAjx0dSjJu/aZwoqd4yjex4KuO7eeZao8cIwM+ZDRsbiXCv9IIa9mS4jLSRXStS0pHdlfgCzKR2/9z6hVKzk2NsNP+goa/0PeYRtH7UGQw2qOaEpA8ILLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720213; c=relaxed/simple;
	bh=rZV9X0mpL/iO2R1TZZ83RnGTkanecYwG82AdTASji6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrWkU+WuFT1J91GqJEC3OzLKGX/tBdky4AIB2HisD3bmkXxqPutisF5gj29fvlNYVm4iyJlHRQitw76XInM/YhApZ8NPVMRuDZTWVy84AVik96g1Pwo036yLypR4ChAW8Ykh9NiYrt7ICt+HKeJ0tisCXboz8vyn2iNmme4NAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BO98uYUr; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BO98uYUr"
Message-ID: <720ffab9-1c09-433a-b3a0-40ed496119fb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767720211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjr+9ohpJAA6KoO1MNNpZAynzkOfJHqWDVtfPMfnJBA=;
	b=BO98uYUrMBN7fH2sVMG60w0UonwY6ySiJk9wFB7KsSZxGQlINvYA4q3EJp+O+PkDKp9x/P
	ZQU7JgBlrUW2a+AJ9AC6kIjZILXchYV+gSO3bZErEAFFlW6DjD1FuUw91e5g2x+WlXFgDP
	9YfZsoG3NgFJlVWyDpJgjryttH4FJY0=
Date: Tue, 6 Jan 2026 18:23:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] ASoC: SDCA: Add basic system suspend support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
 <20251218113520.1287693-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251218113520.1287693-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +static int class_suspend(struct device *dev)
> +{
> +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	disable_irq(drv->sdw->irq);
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to force suspend: %d\n", ret);

suggestion: since this is going to be fairly generic code used by multiple devices, it'd be useful to add a device identifier or string to the error log, no?

This can be done later in a follow-up patch if agreed.


> +	if (drv->suspended) {
> +		sdca_irq_enable_early(drv->function, drv->core->irq_info);
> +		sdca_irq_enable(drv->function, drv->core->irq_info);

maybe add a comment on why the two calls are done sequentially. You did mention it somewhere, it'd be good to capture the design.

looks good otherwise.
