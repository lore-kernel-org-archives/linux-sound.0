Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933B83431E4
	for <linux-sound@vger.kernel.org>; Tue,  6 Jan 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719413; cv=none; b=akH2YFIqGy3kDeh9C8d0Q+uoiAizqWuAgEqMkxL2RC7Wyrb2BK+SZbA5Ee9bSgLFbrK9emifFJgfZJx/EXNX1E1uUhjKWyiX2GgGYG6xep0Cy8qCTtsSWcF4TZUkTC+zTWXlSo9yONE4Y7PWt98xk65jc4AOI0zqDcdRipUlvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719413; c=relaxed/simple;
	bh=AXx7zwmjVQ4DCK9XSgMQTzYqnns9VkCCqkXQswPHNmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrLsElEPI5av6ldC7lNfs0Cmk0e4uwJzW/qsk6RVfJXCPzrpVQuIPwxGhz3KtixmsKSsE4Rjc3KMK2mqv7JP7sV19oXpkbOOXhhtJu6uE0hzq6NwrW8kQA2h7D3pVRUhATF7fbfAs95uw+zv2PNyE8Z6Kx9M339kWJmmrZY/Ah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b3sX46NX; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b3sX46NX"
Message-ID: <030c6d7f-cccd-414f-a2b7-51df88c7991f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767719409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCypChgGP3NBGCeWAi0SYU2zg0RI6U33QSPDsEAW0TA=;
	b=b3sX46NX7mBukzgPmhflcqDm9ufm533w0jZvgXqaVf2/rorSSMf32aZ64NNge/ASzKi+Ry
	j2Gubigzf+Z5O8BJEBYdj3a7Zg/CbCUp/wNfxA4Rvqt04+Y0eiD/j7L6fkB0neFQjgWUB5
	BLifG7Mtscco5jhFRDscid9/7USqSMM=
Date: Tue, 6 Jan 2026 18:10:06 +0100
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
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
 <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
 <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
 <aV0HDh57C2gdtYc5@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aV0HDh57C2gdtYc5@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/6/26 13:58, Charles Keepax wrote:
> On Sat, Dec 20, 2025 at 12:04:47PM +0100, Pierre-Louis Bossart wrote:
>> On 12/10/25 10:55, Charles Keepax wrote:
>>> On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
>>> Additionally, there arn't that many SDCA vendor drivers at the
>>> moment, a handful of Realtek ones and a TI one. If we wanted
>>> to standardise I would suggest standardising on the better
>>> solution, which to my mind is clearly this approach.
>>
>> I am not against having a single mechanism, and that change
>> would be relatively minimal.
>>
>> The only issue I have with it is whether one would deregister
>> the child device on a soft reset or whenever the device
>> loses sync? It'd be somewhat ugly to do so, but then again
>> we have the issue that for the second enumeration we already
>> have a probed child driver, which would bring us back to an
>> async model really. The 'beauty' of the current model is
>> that the probe does nothing really, everything happens at
>> enumeration/sync loss. If we dynamically add/remove child
>> devices it'll be 'fun' really quickly.
> 
> Yeah that is one of the questions I have pondered a few times.
> Were I usually get to is separating out expected cases of
> something dropping off the bus and unexpected cases. For say
> suspend/resume it is quite likely the device will drop off the
> bus and that is expected and probably shouldn't result in the
> child drivers being removed, as it will as you say become 'fun'
> very quickly. However, an unexpected drop off the bus during
> normal operation is really a pretty fatal error. In many ways the
> best thing to do is probably to remove the child drivers in this
> case, since that will tear down the sound card, and allow
> everything to be rebuilt. But these are far from fully formed
> ideas, for the most part at the moment we just report things went
> bad.

A device falling off the bus is not that rare in early bring-up or experimental platforms. 
IIRC some devices will require a full reset after firmware download.
Not to mention the glitches that can be seen consistently after clock stop on some platforms.

My take is that it's better to 'hide' some of the low-level detail and keep the card visible to apps, always. That means the drivers need to deal with cases where accesses to devices might be delayed due to slow sync or sync loss. As long as everything recovers we are good to go.

One way to test the recovery capabilities is to inject a bad sync pattern. The Cadence IP can do this manually, I vaguely remember adding a debugfs entry to test this but I don't recall if it ever made it in the mainline.

>>>> Note that things will be interesting when we use the new
>>>> ACPI aggregation information to create the card, we're missing
>>>> a means to re-trigger deferred probe checks as devices become
>>>> functional. I had a patch on this a couple of years ago, look
>>>> for "driver core: export driver_deferred_probe_trigger()",
>>>> we probably need to revisit the entire scheme...
>>>
>>> Apologies if I am misunderstanding but is this not another example
>>> of the advantages of probing when the device enumerates? If I
>>> understand correctly the problem those patches are solving is
>>> resources that become available outside of a probe break deferred
>>> probe. By tying the probe of the auxiliaries to the enumeration
>>> of the device, we ensure that link between probe and resource
>>> availability. I think the point Greg is making in that thread
>>> is that the kernel expects resources are available once probed,
>>> so if one is going to break that assumption it should really
>>> be handled exclusively in the driver that does that. But the
>>> simplest solution to my mind is just to not break that assumption
>>> then everything works as expected.
>>
>> That's precisely the problem, the model assumes something
>> that is broken left and right in practice.
>> Exhibit A is the PCI/HDaudio parts where we rely on an async
>> probe due to the module handling.
> 
> I think I am perhaps not totally familiar with the issues on the
> PCI/HDaudio side. What is the primary issue here?

The HDAudio side loads different modules, which can take a lot of time. For that reason, the driver probe returns immediately but most of the processing is done in a workqueue. This leads to two problems
a) if the processing fails for some reason, we have no way of signaling any error.
b) if the card is created independently from the PCI driver, e.g. with ACPI information, then we have no way of telling that the resources needed by the card are available.

That b) point isn't an issue at the moment because the PCI driver creates a platform devices which results in the card creation by the platform driver. But if that sequential part is broken then the deferred probe mechanism will fail by construction - it assumes that all resources are available when the probe returns.
 
>> You also have devices that require firmware download to be
>> functional, or some sort of internal ramp-up needed.
> 
> Yeah these can be fairly annoying. But both of these can be
> tackled with either handling the situation in probe, or if that
> makes boot too slow, moving to a similar child driver approach.

Both options are not so good IMHO...

>> Assuming a perfect behavior where all resources are available
>> at probe time is naive IMHO. In the specific case of the
>> machine driver probed with ACPI information that isn't tied
>> to the bus status, it's a guaranteed fail.
> 
> Well I do love a good bit of being naive until it bites me :-)
> Ultimately the machine driver has to call snd_soc_register_card
> which can probe defer if the card components aren't ready. What
> parts cause the issue here?

The issue is that the deferred probe mechanism revisits the list of needed resources when a new device is added or when a probe completes. When the probe completes 'later', then we are missing a mechanism to signal that a missing resource is now available.
