Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA02F6904
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885356; cv=none; b=JoGKRFM+rdzstbv0LCQnr8HfqSXEFOJqQDx5nzfELGIOvg5+5oDLWf4IKPppXSRO6tVF3+GFx8WjZy7Vbp/CX4g1pQ/eGjj0kds0yOLfrCACpK8bltTbcQJy9xKgmxGzqy3vzifs+kBORSu3qLjJHPnNOOnshWR4/gSxzpm8wm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885356; c=relaxed/simple;
	bh=UQgltvYJzqfKcZenT406bSjT4reIr//L1UKzEQ1hTaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FogM/ZkJJl7leWLEfUWkMtmJqfLQNY2BbPLSlqNgX16QdTSd1N9ov25pJ9BpR8Et2XxTm803oPG/p+HztQYR30g0IsCum6eiW+7IJWXaZ4zw1q6ZAR1UCYDIk0EgKH8h17HRtw9JxnWt8MaXe9nbnKPUpRdIcOcWZN0tlxKIiQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ebO9upCi; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ebO9upCi"
Message-ID: <6a488f20-3c58-458f-83fd-2e19a2ecaa9b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767885352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ba/rHL+sZFb4kBEy64UTgKQYRr2bUguwKGRUo4tipZ0=;
	b=ebO9upCiWobuAuFLN0tUdz3so/y/1Cxe6bOYAHdNfvqNqQj/IT9/cSACgRtLfpTbpFD7ra
	2/JcZfSaMEYr0FqKAPG9e3fRvWPqmsfZHLZ5nDV+YNqnzC0yc0qzLYDNdFJ6X0jsxH73hi
	2MRHPn5Jn76T9yZSTAWHKwxvRLfNza4=
Date: Thu, 8 Jan 2026 16:15:11 +0100
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
 <b257ebfe-06b9-4a18-b713-33d20aa9fb12@linux.dev>
 <aV+Jpig/liLPn2Lx@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aV+Jpig/liLPn2Lx@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>>>> +	ret = pm_runtime_force_suspend(dev);
>>>>> +	if (ret) {
>>>>> +		dev_err(dev, "Failed to force suspend: %d\n", ret);
>>>>
>>>> suggestion: since this is going to be fairly generic code
>>>> used by multiple devices, it'd be useful to add a device
>>>> identifier or string to the error log, no?
>>>
>>> Doesn't the dev_err already do that, it prints the device name in
>>> the log?
>>
>> Yes but the device name could be confusing, not everyone
>> can figure out what "sdw:0:0:025d:0711:01:" means
> 
> Personally I think if you are interfacing with these things you
> need to be able to interpret that anyway, since it will affect
> things like finding things in debugfs or sysfs as well.
> 
> However, if we do want to update the error messages to include
> some additional identifiers that should really be done for the
> whole class driver. So it would make more sense to do as a
> separate patch chain, rather than as part of this suspend chain.

Yes agreed, my suggestion was for future work.
The main thing was that for a class driver it's a bit odd that all the messages refer to the manufacturer and device ID. The two-level device structure will become even more confusing...
