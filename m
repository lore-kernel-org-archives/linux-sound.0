Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B91AAA22
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 22:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735856126; cv=none; b=WIYfvVLRR/HJ/fwBTc4CqeDa+62iKNOCoh9oU4SAS/VC7xbEB6Qxgm2r5qdxMOIm70z6a62A0xqQhmLUE4HR4mGL+vThBH5SKYOBHhAAN9ZVK2Q4TC8WKK9kiivStWYl4wbFgzoBsy7jc+QaQJXBCkCd24cEOStbhRiOeXHelEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735856126; c=relaxed/simple;
	bh=cwRGEm2GhTUfMvix8X67k91V2kCHX8lGZZobR7umEuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXov7yxi2BL+lEgSXVKbGz0FJ/hxQ6vEJnc+zVWrKS9qIsInvu+fbCQSaLbzCxTShhE3ffr1F5iViuWIOlLEGJR7WraqWqZ1Wlz1Xu03T9d4cg7Glv47XyqCcBnOPjMGXQj6R9ipKYkA3TSrnhfLj46OqK6szQ2Bc7XpIDzSaKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mbFrkboc; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mbFrkboc"
Message-ID: <b6908879-363a-4abf-9cb7-767fff6d35a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735856121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1cKW18Q8+vmV8j7UqoBxkkoauvhuXssjAFbv0nq/ps=;
	b=mbFrkbocyzEOJDgfHEbDpSYc44K1OrlDLwJZtL0+WYuD0umjZxJ6Qs18+LX6EDM2hV5BwU
	t6iMU1DIl88EHwfD0TNSm5v/rvtXUiy6UCgbfMp8Wp41JHGV7T4riDGGYqlOiuJBts/N2p
	axG8NbHmpk0G41MHtHp2W2XWQD55u4w=
Date: Thu, 2 Jan 2025 16:14:11 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
 <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
 <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
 <7479a25e-6729-4aa0-b67e-7781bf8232da@linux.dev>
 <9b8ef4d2-e4bd-4336-8980-0fb59d672631@linux.dev>
 <Z2P1KVLFig0Kh1h2@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <Z2P1KVLFig0Kh1h2@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 12/19/24 04:27, Charles Keepax wrote:
> On Wed, Dec 18, 2024 at 04:40:22PM -0500, Pierre-Louis Bossart wrote:
>> I agree that the device should be reachable during the remove(),
>> but I believe the scope of expected interaction should be limited
>> to a strict minimum. To be clearer, so far not a single device had
>> a requirement for any sort of interaction on remove. You would need
>> to clarify which codec driver needs this.
> 
> Ok I can add that to the commit message.
> 
>> I don't see how the 'link_lock' and 'bus_lock' are at different
>> levels of the stack, the 'master' device and the 'auxiliary' device
>> are both quite thin and I don't quite see what's different between
>> the two.
> 
> Not sure I follow that, like for example I assume I could just make
> the code use the bus_lock instead of adding a lock but to me that
> feels like a layer violation, you have a driver directly taking
> framework locks. But I guess I don't totally object if everyone
> else prefers that.

To be clear, I am not sure if the bus_lock is enough, I was only asking 
what the differences are.

> In terms of other solutions, I could look at redoing more of the
> IRQ handling. If rather than using a hard coded linked list, the
> IRQs were properly registered as IRQs with the IRQ framework then
> we could simply add and remove them using the normal APIs, which
> would be a lot cleaner. Of course, fundamentally that is pretty
> equivalent but it will then just use a lock from the IRQ framework.

You would have to review this with Bard, the IRQs for the SoundWire IP 
are "interesting", and things started to work reliably only when we 
ended-up with with a single IRQ that would then check if every manager 
IP reported something. It's not really possible to view SoundWire 
interrupts in isolation and deal with the IRQ framework, it's really 
best to deal with the PCI interrupt and work from there.

>> Having looked at the code in more details, I think there are other issues,
>> see e.g. this part of the code called from snd_bus_master_delete().
>>
>> static int sdw_delete_slave(struct device *dev, void *data)
>> {
>> 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>> 	struct sdw_bus *bus = slave->bus;
>>
>> 	pm_runtime_disable(dev);
>>
>> 	sdw_slave_debugfs_exit(slave);
>>
>> 	mutex_lock(&bus->bus_lock);
>>
>> 	if (slave->dev_num) { /* clear dev_num if assigned */
>> 		clear_bit(slave->dev_num, bus->assigned);
>> 		if (bus->ops && bus->ops->put_device_num)
>> 			bus->ops->put_device_num(bus, slave);
>> 	}
>>
>> So at this point an interaction with the device is not longer possible, even
>> if the Cadence interrupts are kept active, since there's no valid device
>> number to use...
>>
>> 	list_del_init(&slave->node);
>> 	mutex_unlock(&bus->bus_lock);
>>
>> ... but this is where the .remove() will take place.
>>
>> 	device_unregister(dev);
>> 	return 0;
>> }
>>
>> What am I missing?
> 
> Hmm... yes that is a good spot, I will investigate that further.
> Certainly I do see these operations happening in the wrong order
> but it doesn't seem to cause the register transactions to fail.
> Most likely it is best to reverse these two, it makes sense
> to not clear the device number until we are finished with the
> device, but would be good to understand what is going on first.

Yes, I think reversing the two parts should be enough. It makes no sense 
to clear a device number since that's not a desired SoundWire operation. 
But we absolutely want to release the IDAs and make sure there are no 
leaks during bind/unbind tests.

