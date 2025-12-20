Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165152192FA
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766231290; cv=none; b=M6yJnt2ccVDQIqs/HFYcwgPiBKGoxWYkcEo8RnKbUHzHWcjyHo/qLNDCKUuOiFb11W8iNJCNUAPp0+CXUVsrYVfxhMHpvhczYNOdxDquzihQeDufHUU8mkA15CCVGwmN7lr6bMCdlX0B0vMQCVZIRjEoaFpTglIh8/sdXh03o0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766231290; c=relaxed/simple;
	bh=J8NXUSa48qsMhY237E7DbuqJoayi/zMFuhOmJUwJqA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fw/jO1vx+i+B6OiqqBFq1MoKYm6QlXKhO8N03buEjKoDvLCLiIkGEw7SgExNGi9vhvXcjTYlNISDKvSmzq9CU6/5u4+4rzmZnIqJC26Nmn3SKYeRgHEWqCriS4H8+nQWxTDgREyCINtxSl6LIeYJeITGV8DZM4cUbeKcc/cm500=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uf52nndd; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uf52nndd"
Message-ID: <29a84319-39ff-4d45-a10a-1662985106b6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766231287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Amr7W94U/4OO7+WXCUI5CfEqc87lduzyErodgOsOM9I=;
	b=uf52nnddAeczo+R/2YWRtdabHkJEc04wa+MCgxU2TSpXPmjHPYavBSKQfF2pw6O2E+LFWS
	uYNfReBdXIz3d3Vel90zfmoETpwA1RvFomMxRQquYHAcjl71ZEevJ01t4I8bFRFjZOQPi7
	Ira/+jDTAOMl+awE/S5qeuWDE21jRlQ=
Date: Sat, 20 Dec 2025 12:36:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] ASoC: SDCA: Device boot into the system suspend
 process
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-7-ckeepax@opensource.cirrus.com>
 <c8448dc6-7a90-4eff-9758-146c8bb09c7f@linux.dev>
 <aTqyJe7t9cq1UUya@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aTqyJe7t9cq1UUya@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/11/25 12:59, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:18:09PM +0000, Pierre-Louis Bossart wrote:
>> On 11/25/25 15:21, Charles Keepax wrote:
>>> +	/*
>>> +	 * FDL has to run from the system resume handler, at which point
>>> +	 * pm_runtime isn't yet active.
>>> +	 */
>>
>> aren't there cases where FDL also needs to run in a pm_runtime
>> resume case?
> 
> Potentially, depends if someone builds a system that does that.
> 
>> My understanding of FDL is that the host would *always* check
>> if the device lost context and if firmware is required then the
>> download takes place. I am not sure why we need the assumption
>> that firmware is *only* required for system resume?
> 
> Mostly because it seems that is pretty standard for PC systems,
> to only drop rails on hibernate.
> 
> But the primary issue I have is the "check if the device lost
> context" part. I don't see a good way to implement that under
> SDCA. If we figure out a good way to do that then most of my
> objections to allowing the firmware download on runtime resume
> go away.

Wondering if the 'Needs_Initialization' bit could be used but not only initialization writes but firmware as well?
it could be device-specific, but IIRC that was one way to check if context was lost or not.

And there are other bits that tell you if the function was reset, see Function_has_been_reset in the Function_Status control.
