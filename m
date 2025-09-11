Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB230BF7B
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594104; cv=none; b=Y8v6/N0q4rgVkCe9iR9aBbkDdL+f6hmDpjpubc1GMcablKRMFxFnVwfBQh04xFYzpCs6SW3YTqNYlvttFNAb2dHtgQUp/8Q/UloqdPvoWhKhj5j2QsohDB1Vf/HGP5oeTA0wmiNLLRIERZ5Irt4v1b+8nkvPJy+k5Vm2l+1ZCms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594104; c=relaxed/simple;
	bh=WasfT0KDeWnJw+1PMw5ytKd879SudBCaoQrdcsgpEZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzB2n9fcJIJi4i7JXaLcdcM+K/ZdCmL+tthPBYXKHR1vqj9KggtoYl63IvAYnB0eDllIh6JsKb68z7XyNG7AgDOMONnph9qBPGNJQCKTKvAnK5V2TLtaLDdWa2+Xa0ln0e74jU71IIQWxx728orYLyqaEJ/xcMQXF3uTRjxv/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E4JY5W/G; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E4JY5W/G"
Message-ID: <4ddd1987-427d-409a-af89-7b505df5fa34@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757594100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bp9o7Y638VazV0F2wGAp/zGDw4z1HcvJkHojHgTiKE=;
	b=E4JY5W/GLMpLK1wsfrc7I3MbToSsyRQcPFQBdS0zth7FuYGDwLBLHTxN2PsIbPeCFn2gBd
	uUxE9EIjSDvKmJbQE/2DLqFGo0diKdzYdJ5trP7Z+4tfUTOGwk1H4x9eVeTWNlXL3Evnka
	xbO/1d1A6zx97anJEREjVTrEareapAE=
Date: Thu, 11 Sep 2025 14:33:46 +0200
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
 <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
 <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>> Second question would probably be could we get a little more of a
>>> concrete example of what you are looking for. Options I can see
>>> would be to add the options of using a blocking type API, maybe
>>> something like:
>>>
>>> sdca_ump_notify_owner() - this could probably be part of
>>>                           sdca_ump_get_owner_host()
>>> sdca_ump_wait_for_owner()
>>> sdca_ump_send_message_and_wait() - this would like be a wrapper
>>>                                    for a write and the first two.
>>>
>>> But I am a little hesitant to switch the FDL process over this,
>>> has to start firing off work queues etc. and everything gets a
>>> little more complex.
>>>
>>> Or one could add something like:
>>>
>>> sdca_ump_cancel_timeout()
>>> sdca_ump_schedule_timeout(callback, timeout)
>>>
>>> This probably integrates nicer with the IRQ driven way the FDL
>>> is implemented at the moment.
>>>
>>> Would something like one of those be what you are looking for? Or
>>> are you really looking for a much higher level API with some sort
>>> of message queue? Although if going in that way I get very very
>>> nervous about all the SDCA weirdness.
>>
>> Oh I wasn't thinking at all of a message queue with a
>> higher-level API, more something along the lines of the SOF/cAVS
>> IPC based on doorbells.
> 
> I am not super familiar with the inner workings of SOF but at
> first glance it does look like exactly the thing I was hoping to
> avoid :-)
> 
>> You probably want an async mechanism where the set_owner()
>> returns immediately and is followed by a wait with a configurable
>> timeout. I don't really get the nuance between your two proposals
>> but they go in the direction I had in mind.
> 
> The difference was intended to be the first is a blocking API
> (ie. function returns on either owner being transferred back to
> you or the timeout expires). The second was intended to be async
> and based on a callback ie. returns immediately and the callback
> is called when the timeout expires so you can run whatever error
> handling you want.
> 
>> That said, I do think you'll have to deal with workqueues,
>> not sure how else to deal with the protocol. If you have an
>> interrupt that requires a follow-up UMP-based check, things
>> could get messy with an interrupt blocking another one. We had
>> similar problems with the SOF IPC and for the standard SoundWire
>> interrupts. Best to keep interrupt handlers simple and signal
>> stuff to do for workqueues.
> 
> Definitely agree that blocking in the IRQs is not what we want,
> hence my previous comments about preferring the callback based
> option.

ok

> For the most part HID and FDL are extremely device led
> processes. We don't really need to keep super complex state on the
> host side as we don't initiate anything, we are just responding
> to what the device wants to do. To my mind keeping complex state
> on the host side likely increases the chance something goes wrong.
> 
> I will have a think see if I can come up with a nice way to
> integrate a timeout to individual UMP owner transfers, but I am
> not exactly sure how much value this adds for the currently
> implemented features. HID won't use this, and FDL already has a
> timeout for the FDL process, so one still sees if it failed and
> as you can see the status and response pairs debugging should be
> fairly easy.
> 
> Once these timeouts exist we have to pick values for them,
> because SDCA is a huge huge fan of asking you to wait for
> something but not saying for how long. If you have any thoughts
> on this that would be appreciated too, but mostly I will just
> pluck some vaguely reasonable sounding values as I did for the
> existing FDL timeouts.

The SDCA 1.0 spec defines DisCo properties for UMP timeouts, just do a search for "ownership-transition-max-delay". Table 139 page 236 defines this property specifically for XUs and hence the low-level protocol FDL is based on.

The description reads:

"
The maximum time allowed for Device to change the
ownership from Device to Host in an Rx UMP when Host
Software is waiting for the owner to change back to Host.
"

As usual it's quite possible that platform firmware is broken with bad values, but the design intent was to provide a timeout value for software to use. Ignoring these properties doesn't seem quite right to me...


