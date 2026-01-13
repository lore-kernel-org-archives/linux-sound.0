Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BA1357A23
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342011; cv=none; b=C/HAWaZ6sc0tqSvi0PlaxR8j7MIUYxQH7UmDhsIipjH9KwOzHMKvkSYKRl+cfFZ7XfiWxFfG0Y04eN14tt5V8yFr2W3DwYJPWrksb/S65kd17mqDcIxYPtNwcxOFDbTTdCQfqOXyGHYp87wlmY9AxRmOw4Pi14fyI9G45emgG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342011; c=relaxed/simple;
	bh=Tjx0s03+5lLWXZOZHzjmbvqlS/yYehYhONKBGDwraQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpFPJSB76qxzHEHci0ZJYVZ2LU0d9WMDx0HIAFXJ/sR8COSWbaFXXRjg1hZIeKdbHeXes5yF89pF3dvAOndWDSkGCYW3YXIJHwe1zQz11ZEjxbVTesJAWWqQO1iDFjtfiwUmJndm2r1MMxR+NV/aaDVwtNm50vvPCbmyFTlOBrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fYiC3Src; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fYiC3Src"
Message-ID: <2ba6e4e1-1040-4eaf-ac2d-3a308866097c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768342008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZrlJnjtrfXLiGN5txaAYRGiKrsX+tYFn9O3nh3h6Nc=;
	b=fYiC3Src/FRrRQGs//pk5rs4XbEDw5S3tYYU1Di9FMUMCzzEsNEx0cloI3AYQOQwNM6UhG
	UZXlWj8GHD9xHX/AVq6gRVS1VPEi4+aVkBqtvquX7cfnxuNhiPqMAhZy7UA+dOsJLaVilO
	507Obhveqk/lr5peGKNeuO/3f2zVCP8=
Date: Tue, 13 Jan 2026 23:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
 <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
 <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
 <aV0HDh57C2gdtYc5@opensource.cirrus.com>
 <030c6d7f-cccd-414f-a2b7-51df88c7991f@linux.dev>
 <aWaAbaDiuJlCnL1Q@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aWaAbaDiuJlCnL1Q@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/13/26 18:27, Charles Keepax wrote:
> On Tue, Jan 06, 2026 at 06:10:06PM +0100, Pierre-Louis Bossart wrote:
>> On 1/6/26 13:58, Charles Keepax wrote:
>>> On Sat, Dec 20, 2025 at 12:04:47PM +0100, Pierre-Louis Bossart wrote:
>>>> On 12/10/25 10:55, Charles Keepax wrote:
>>>>> On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
>>>> The only issue I have with it is whether one would deregister
>>>> the child device on a soft reset or whenever the device
>>>> loses sync? It'd be somewhat ugly to do so, but then again
>>>> we have the issue that for the second enumeration we already
>>>> have a probed child driver, which would bring us back to an
>>>> async model really. The 'beauty' of the current model is
>>>> that the probe does nothing really, everything happens at
>>>> enumeration/sync loss. If we dynamically add/remove child
>>>> devices it'll be 'fun' really quickly.
>>>
>>> Yeah that is one of the questions I have pondered a few times.
>>> Were I usually get to is separating out expected cases of
>>> something dropping off the bus and unexpected cases. For say
>>> suspend/resume it is quite likely the device will drop off the
>>> bus and that is expected and probably shouldn't result in the
>>> child drivers being removed, as it will as you say become 'fun'
>>> very quickly. However, an unexpected drop off the bus during
>>> normal operation is really a pretty fatal error. In many ways the
>>> best thing to do is probably to remove the child drivers in this
>>> case, since that will tear down the sound card, and allow
>>> everything to be rebuilt. But these are far from fully formed
>>> ideas, for the most part at the moment we just report things went
>>> bad.
>>
>> A device falling off the bus is not that rare in early
>> bring-up or experimental platforms.  IIRC some devices will
>> require a full reset after firmware download.  Not to mention
>> the glitches that can be seen consistently after clock stop
>> on some platforms.
> 
> So doing a reset after firmware download should be fine, I would
> consider than an expected drop off.
> 
>> My take is that it's better to 'hide' some of the low-level
>> detail and keep the card visible to apps, always.
> 
> I would agree here, it is better if the card stays present and
> hides non-error states.

Sorry, I am not following what you meant by 'hide non-error states'

If the card stays present, that would require the child device to remain registered.
Otherwise if the child device is unregistered, the card would be torn down due to missing resources, no?
Or maybe we end-up with a case where the resource is already in-use so the child device cannot be unregistered...

>> That means the drivers need to deal with cases where accesses
>> to devices might be delayed due to slow sync or sync loss. As
>> long as everything recovers we are good to go.
> 
> Yeah that is a point we slightly disagree on, I really am not
> a huge fan of auto-recovery stuff. Been involved in too many
> situations where the auto-recovery recovers *most* of the time
> and takes a 1/10 fail to a 1/10000 fail.
> 
> Taking this case, if the device loses sync during audio that
> is gonna glitch the audio, which makes it a problem I will be
> expected to fix. I would rather get a report the audio stopped
> with a log up to that point, than get reports of audio glitches.

I don't disagree about audio glitches, my main problem is with sync loss during initialization or suspend-resume.

Maybe a tangent but if a device loses sync while audio is playing, there would be no xrun signaled to the upper layers. The bus allocation reserves specific slots for specific streams, and the data will be written/read whether there's a device or not. That's how we tested the 'virtual' devices to create pretend master-only audio cards with no actual codecs attached.
If we really want to report glitches due to sync loss during audio playback, we have some plumbing to do. I tested with a couple of years ago by forcing a device to reset with a debugfs command, it wasn't detected by any ALSA layers.

>>>> That's precisely the problem, the model assumes something
>>>> that is broken left and right in practice.
>>>> Exhibit A is the PCI/HDaudio parts where we rely on an async
>>>> probe due to the module handling.
>>>
>>> I think I am perhaps not totally familiar with the issues on the
>>> PCI/HDaudio side. What is the primary issue here?
>>
>> The HDAudio side loads different modules, which can take a lot
>> of time. For that reason, the driver probe returns immediately
>> but most of the processing is done in a workqueue. This leads
>> to two problems
>> a) if the processing fails for some reason, we have no way
>>    of signaling any error.
>> b) if the card is created independently from the PCI driver,
>>    e.g. with ACPI information, then we have no way of telling
>>    that the resources needed by the card are available.
> 
> I mean sure it does make the boot look faster, but is it really
> faster as the devices weren't actually ready when we told
> user-space they were? And now we have to deal with the problems
> outlined here, as well as what happens if user-space/another
> driver tries to use the device whilst it is in this
> not-quite-ready state. It feels like we sacrifice quite a lot
> for appearing faster.
> 
>>>> You also have devices that require firmware download to be
>>>> functional, or some sort of internal ramp-up needed.
>>>
>>> Yeah these can be fairly annoying. But both of these can be
>>> tackled with either handling the situation in probe, or if that
>>> makes boot too slow, moving to a similar child driver approach.
>>
>> Both options are not so good IMHO...
> 
> What is it you dislike about them? Just the slower boot, or
> something more fundamental?

The slower boot isn't going to be accepted by anyone, and in the specific case of HDaudio I don't think anyone has an appetite for changing the probe/workqueue approach that's been around for many many years.
I don't think creating a child device is much better than using a workqueue, in both cases errors during the two-step probe can't be handled, you end-up with zoombie devices that are probed but not functional.

The only benefit you get with the child device is that if it provides the resources required by the deferred probe you have nothing to do. the open is what happens when those resources are not present due to sync loss.
