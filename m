Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1323FC4C
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506162; cv=none; b=pKEpGfBD3d+KIr7qA/IwF3c9S91OjOvli7JaLw7FuZBnWe6u9EqFOlO5GoJxAsyjamhNSQmG5y6JGChUaJ0hN9d1RG8F3QeNSGj3q/NcHk80s8MTVCNL5yMTsS2TuJljKFIiJjGcNrgDBgtkNKbm9fVWbELzgwhjPXN3uNRD6C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506162; c=relaxed/simple;
	bh=zVbI3OLP7oRO2vJUZysMEniXlRCDTJI3ybbPZOGuFZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCZ3uSaELJ+4vnmKutA13c8Q2mITrU2dlclLOoOx8D/TxCC0z4at/aoUFztd4mLh2vnVQANgOeWJmwEVHg8poyHZjsJXNrCeX12VhoJPk8ySW7ZmD/0Zzb0h3FEpEHSreCdP/APiCA7f5nAkLCjuc4yvSCFoOei0582P6KELSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PGKyacuO; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PGKyacuO"
Message-ID: <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757506158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLuqgyIgEszQ8sxPSJ6y2LOVENn6KT3YWe6e67w58TA=;
	b=PGKyacuOXq5g35ByLD9r5j+qkX+o3BOUIOcUZG8BdYIHxE/33iipUuAJWxpCSBZCh9jp8/
	rDBuSMSVDHaHf4K3wyb8k35qjeZoC66Dqcv+ycILiDtFfErIXpMpB9YpJ0qlTu16TMZoEL
	b3PHuC/9i8iOW5NzjkX/mr8P95M3vxc=
Date: Wed, 10 Sep 2025 14:09:14 +0200
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aMBbavEX2RyzBy1o@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/9/25 18:52, Charles Keepax wrote:
> On Tue, Sep 09, 2025 at 03:14:00PM +0200, Pierre-Louis Bossart wrote:
>> On 9/8/25 15:15, Charles Keepax wrote:
>>> On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
>>>> On 9/5/25 16:31, Charles Keepax wrote:
>>>> 4. host detects ownership change or times out with a failed transfer error message.
>>>
>>> by receiving an IRQ on the owner control.
>>
>> but that IRQ may never come, in which case the entire protocol would fail.
>>>
>>> You might need to elaborate a little more on what you think is
>>> missing. The four functions implement the four operations that
>>> power a UMP buffer, checking you have ownership, passing
>>> ownership back to the device, reading data, and writing data.
>>>
>>> One could combine more of the functionality into a single helper,
>>> but then you start to hit problems where you need to do extra
>>> bits.
>>>
>>> For example HID, very simple just: check you own the buffer,
>>> read the message, and pass the buffer back.
>>
>> I remember one of the early implementations of HID support
>> in a Realtek driver needed some sort of timeout to reset the
>> communication in case the ownership change interrupt never
>> came. It's reasonable to expect that things will go wrong at
>> some point in the communication between host and device, isn't it?
> 
> I will have a look see if I can find that driver and see what is
> going on there. But HID seems like a good example (or at least the
> event part of HID) of why the wait isn't in the UMP code to me.
> 
> The only notification that comes from the device is the the
> UMP buffer is being returned to the host, which indicates a HID
> event has happened. But there is no time out on HID events, it
> could be months between HID events. Like one could set a timeout
> and at each timeout just verify the buffer is still set to the
> device but that seems very cautious. Or one could check the buffer
> is set as expected on boot, but I would really expect the SDCA
> reset/boot logic to ensure that is good.
> 
> If it is a UMP transfer where the host expects the device to do
> something and return that may need a timeout but as that is a
> subset of UMP transfers it feels like it makes more sense to
> implement the timeouts in the places that need them.

You have a point that in the case where the host waits for an event, then the notion of timeout is irrelevant.

What I was referring to was the case where the host writes a message and waits for a notification that the message has been handled. 
This could be a write to a buffer or a read from a buffer. That's standard IPC stuff, and all existing cases of such message-passing IPC do have a timeout built-in. The communication is serial by nature since there is a single signaling mechanism, so the host has to wait before sending another message.

I am not sure it's a great idea to leave the timeout handling at a higher level, because you will have to deal with other sources of information. Once a message has been sent with UMP, there will be additional signaling that the action requested by the host was completed on the peripheral side. In the case of FDL, once the firmware buffers have been transferred, possibly in different chunks, then the peripheral might have to perform an internal reboot/reset. That takes time and it's a different level of timeout.

My take is that the UMP should implement basic timeout capabilities for just 'buffer passed/ownership changed' transition. Things will go wrong and you want information on where they went wrong. Implementing timeouts at a higher level makes it harder to debug/root cause.
