Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A321AA1F4
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370703; cv=none; b=Uw8jQuf/gpI4Kt8d4m5kWvLtIt14qd+cq/yt5v+Ep0R8VoUIDTy70SRNIJzTcenF/ri8oyYos0JipQb6g8hiZpTteJ4vBT22e/nslnqIrBeW8jNPkY87YjqnDOikxuMwya0dLFIMgf/ySZAs4rsFf45bAXGQmKTNyBAFVzrvc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370703; c=relaxed/simple;
	bh=b/gm6POq7npycCXFpwidGS6CVmEDf7SwKphu0tCWQxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gh/5Py7JmwDt1V0k3xVrSjFGLW/okxiZB5azQes7LjVKm+al+xnd68Qnzu/TYnzsvZDjJhcCtLWv6/3nz9zTe68SYsdrA561D963PsuMMxQANYtpQh+oyiAZ+JswXcNYDgbingD/gGyi7EYJuPYhBZ9kltHulLI7Q2AaA2lrr7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BwX0kqZb; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BwX0kqZb"
Message-ID: <d6fd29ab-bf45-4349-a2f9-d0503b264d98@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779370699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiPzO+cwM2bZvQS+kI9eUiQPi4QtYTJRNtg2wRY38Ko=;
	b=BwX0kqZbSKhmS+ADviHpjPfBqFz+ePX/tTSEf8c/aegly/8kjre9hpmLQz7sxuxSLW9wib
	c9Za45aqEreXbvuyYBne+lYzb21s3xW5Ve2VJ8BiQ+kLgs5dY9iPfTT/X2+D3xTtQmj1rE
	bpJfPROLTPkFkjYUJos20XOj39zerYI=
Date: Thu, 21 May 2026 15:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: only handle alert events when the peripheral
 is attached
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
References: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
 <1e808962-9a8d-4b0b-ad3c-867de1555d9f@linux.dev>
 <SJ2PR11MB842444E0D5E021C967A6165BFF0E2@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB842444E0D5E021C967A6165BFF0E2@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/21/26 04:24, Liao, Bard wrote:
> 
> 
>> -----Original Message-----
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
>> Sent: Thursday, May 21, 2026 1:21 AM
>> To: Bard Liao <yung-chuan.liao@linux.intel.com>; linux-
>> sound@vger.kernel.org; vkoul@kernel.org
>> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org;
>> peter.ujfalusi@linux.intel.com; Liao, Bard <bard.liao@intel.com>
>> Subject: Re: [PATCH] soundwire: only handle alert events when the peripheral
>> is attached
>>
>> On 5/20/26 04:57, Bard Liao wrote:
>>> It doesn't make sense to handle an alert event when the peripheral is
>>> not attached. The slave->status could be SDW_SLAVE_ATTACHED or
>>> SDW_SLAVE_ALERT when it is attached on the bus.
>>
>> How would you get an ALERT if the peripheral is not attached in the first place?
>> The status is only reported in a PING frame after enumeration.
>>
>> Not following what this new test is needed for...
> 
> It could be a race condition. We meet the issue rarely when running
> suspend/resume test. sdw_handle_slave_alerts() is called when the
> peripheral is still unattached. Hope this patch can filter this corner
> case.

Humm, it doesn't seem like this patch fixes the issue completely.
Either the status read from the Cadence registers is wrong, possibly due to a power-up sequence that doesn't reset registers properly.
Or there's a race indeed where the enumeration happens but somehow the status isn't saved before the alert comes in.

At any rate this patch is probably not enough but it's not wrong either so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

>>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>> ---
>>>  drivers/soundwire/bus.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>>> index fe5316d93fef..0490777fa406 100644
>>> --- a/drivers/soundwire/bus.c
>>> +++ b/drivers/soundwire/bus.c
>>> @@ -1958,6 +1958,10 @@ int sdw_handle_slave_status(struct sdw_bus
>> *bus,
>>>  			break;
>>>
>>>  		case SDW_SLAVE_ALERT:
>>> +			if (slave->status != SDW_SLAVE_ATTACHED &&
>>> +			    slave->status != SDW_SLAVE_ALERT)
>>> +				continue;
>>> +
>>>  			ret = sdw_handle_slave_alerts(slave);
>>>  			if (ret < 0)
>>>  				dev_err(&slave->dev,
> 

