Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9932A80B
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514590; cv=none; b=Pq5jiPVXJa6Iww2rtyw0fan7l/G3JFeQ97CMI0zdDM64hYQD/zvwnfPhOS3aXE0qL0k91Ix4vNhF71QWrHmln3+0+1FXBU0kMKW/bmDCys6AhoWO64Rd3JLh9YD2buMXla2ePiAXFcvaP5R6Gska8QRhQNHzwZe0EBrFeokLYp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514590; c=relaxed/simple;
	bh=NMh5tKmvpjcD0r/4A6nnSz07soU96pTxo3kddwJY45U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEMoGIlh1ASESToo6jdbEuu07i3X1oeLkp6odeahuIlowDxGCSgiidWErXB04ksX0f6xIrVis4CsWddZh/1wXv2AcY7UiFD45xp0Y+O95nuvuEAA+s/+/V26Vyd2YLXNj2DNntbyTfaDnX67qVQhbf2lWhbFq7FEPd/AIksHuyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wOYlt/Px; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wOYlt/Px"
Message-ID: <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757514586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8G79vDCUt4UyC4s1DtNMljEoMBWSpcFqwGka08SIiQ=;
	b=wOYlt/PxlDzqbW3F8Fht1ZdbzyxBaYDK3U/HcHdgAraYGjlAV8ff255L9o52v51JM6Mp/w
	6JcYnOAeV7wBZ5d3RlkfBWc1kHSJ3GLGPJCuhHbrLnZCRT77Xf8uOhApW5JAw1q96qUkB1
	+tBzk4ffUi7+MprG8t1DzZKqz8jsa3Y=
Date: Wed, 10 Sep 2025 16:29:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
 <aMF/H8yejQ51B65X@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aMF/H8yejQ51B65X@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/10/25 15:37, Charles Keepax wrote:
> On Wed, Sep 10, 2025 at 02:09:14PM +0200, Pierre-Louis Bossart wrote:
>> On 9/9/25 18:52, Charles Keepax wrote:
>>> On Tue, Sep 09, 2025 at 03:14:00PM +0200, Pierre-Louis Bossart wrote:
>>>> On 9/8/25 15:15, Charles Keepax wrote:
>>>>> On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
>>>>>> On 9/5/25 16:31, Charles Keepax wrote:
>>> The only notification that comes from the device is the the
>>> UMP buffer is being returned to the host, which indicates a HID
>>> event has happened. But there is no time out on HID events, it
>>> could be months between HID events. Like one could set a timeout
>>> and at each timeout just verify the buffer is still set to the
>>> device but that seems very cautious. Or one could check the buffer
>>> is set as expected on boot, but I would really expect the SDCA
>>> reset/boot logic to ensure that is good.
>>>
>>> If it is a UMP transfer where the host expects the device to do
>>> something and return that may need a timeout but as that is a
>>> subset of UMP transfers it feels like it makes more sense to
>>> implement the timeouts in the places that need them.
>>
>> You have a point that in the case where the host waits for an
>> event, then the notion of timeout is irrelevant.
>>
>> What I was referring to was the case where the host writes
>> a message and waits for a notification that the message has
>> been handled.
>> This could be a write to a buffer or a read from a buffer.
>> That's standard IPC stuff, and all existing cases of such
>> message-passing IPC do have a timeout built-in. The communication
>> is serial by nature since there is a single signaling mechanism,
>> so the host has to wait before sending another message.
>>
>> I am not sure it's a great idea to leave the timeout handling
>> at a higher level, because you will have to deal with other
>> sources of information. Once a message has been sent with UMP,
>> there will be additional signaling that the action requested by
>> the host was completed on the peripheral side. In the case of
>> FDL, once the firmware buffers have been transferred, possibly
>> in different chunks, then the peripheral might have to perform
>> an internal reboot/reset. That takes time and it's a different
>> level of timeout.
>>
>> My take is that the UMP should implement basic timeout
>> capabilities for just 'buffer passed/ownership changed'
>> transition. Things will go wrong and you want information on
>> where they went wrong. Implementing timeouts at a higher level
>> makes it harder to debug/root cause.
> 
> I guess my slight concern here is that SDCA is a huge fan
> of corner cases and everything being slightly inconsistent
> with itself. So for example we add two things in this patch
> chain HID and FDL. HID very clearly wants no timeouts, there
> is no waiting for responses, its just get event, do stuff.
> And for FDL the vast majority of the signalling is outside of
> the actual UMP buffer through the FDL state control. I am sure
> once we get around to Algorithm Extension, History Buffers and
> Device-to-Device messaging they will have their own set of odd
> requirements. So I liked the APIs being fairly low level and
> implementing the basic operations, as it leaves space for
> implementing the weirdness.
> 
> I guess perhaps the first question here, is this something we can
> add incrementally or are you seeing this as a bit more fundamental
> and needs done before we progress this chain?  (we are getting
> a little nervous that devices are going to be shipping in the
> not too distant future that are going to require this stuff).
> 
> Second question would probably be could we get a little more of a
> concrete example of what you are looking for. Options I can see
> would be to add the options of using a blocking type API, maybe
> something like:
> 
> sdca_ump_notify_owner() - this could probably be part of
>                           sdca_ump_get_owner_host()
> sdca_ump_wait_for_owner()
> sdca_ump_send_message_and_wait() - this would like be a wrapper
>                                    for a write and the first two.
> 
> But I am a little hesitant to switch the FDL process over this,
> has to start firing off work queues etc. and everything gets a
> little more complex.
> 
> Or one could add something like:
> 
> sdca_ump_cancel_timeout()
> sdca_ump_schedule_timeout(callback, timeout)
> 
> This probably integrates nicer with the IRQ driven way the FDL
> is implemented at the moment.
> 
> Would something like one of those be what you are looking for? Or
> are you really looking for a much higher level API with some sort
> of message queue? Although if going in that way I get very very
> nervous about all the SDCA weirdness.

Oh I wasn't thinking at all of a message queue with a higher-level API, more something along the lines of the SOF/cAVS IPC based on doorbells.

You probably want an async mechanism where the set_owner() returns immediately and is followed by a wait with a configurable timeout. I don't really get the nuance between your two proposals but they go in the direction I had in mind.

That said, I do think you'll have to deal with workqueues, not sure how else to deal with the protocol. If you have an interrupt that requires a follow-up UMP-based check, things could get messy with an interrupt blocking another one. We had similar problems with the SOF IPC and for the standard SoundWire interrupts. Best to keep interrupt handlers simple and signal stuff to do for workqueues.
