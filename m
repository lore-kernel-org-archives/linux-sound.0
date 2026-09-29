Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293625437FD
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706956; cv=none; b=ZtHAHDhTj6bgqhOuuCsqxlQpjj1iEj2HTc36TUbhPcj0M9SQtPgAvFU78GCvOVKbzC+TurmJd0a0tbn0dNn6mSKDnwwKWKQZ93lhq/6itV45HSC0wAX3jltUft0VAHfNZ9k0bHdT6qY738w59rzzuTamqi6P9AMA41Ndxixnfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706956; c=relaxed/simple;
	bh=9ja1FgpbLiCsvQ+12yDPrg6EtvZUujsk6+F1ruTkNzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twqVxxGggHFMEjiM0r/ZKpjzVJzJoOB9VSHNF1GvVYLk2RW3HghCgZ9gOzVXQ/snJPgATjGLi74e+IXGdL1S8U9vNxa7w3e/NOHQZK5mURXApwxPexelAQ0bAwM+3yWJWbP44MxTSPhH2u40RaaOZaQQPptDg8aOXI8tNUM8r7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H0daHUMC; arc=none smtp.client-ip=95.215.58.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H0daHUMC"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9ja1FgpbLiCsvQ+12yDPrg6EtvZUujsk6+F1ruTkNzg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790706952; v=1; x=1791311752;
 b=H0daHUMCUjry5OmRTcLuWAP60MtOCzUQgZfUgygFv56lMOGdWORHtA0BO87f5xfrv33R6PTs
 BNnYRJALKdl5PEG+PrYO4vzxuWe11gCVhshqpl7Q/P3V0c7dV6FvMbqHQGOO4SScHPHWFC3Oi7l
 cROkdUTwtxpXQMdGDfzSLo6Q=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a1d09175ff48b6f;
	Tue, 29 Sep 2026 18:35:51 +0000
X-Mizu-Trace-ID: 9a1d09175ff48b6f
X-Migadu-Flow: FLOW_OUT
Message-ID: <6b7370d9-f913-42ab-9331-9614d149b7ec@linux.dev>
Date: Tue, 29 Sep 2026 20:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <2c4ea801-f048-405d-a163-e65691e93fc7@linux.dev>
 <aronxfoVEKfBm9Zb@opensource.cirrus.com>
 <db7d1d3a-1be3-466d-9f95-2dabe918e57e@linux.dev>
 <aruxv3Gy0yj5YzV1@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aruxv3Gy0yj5YzV1@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/26 14:40, Charles Keepax wrote:
> On Tue, Sep 29, 2026 at 10:34:16AM +0200, Pierre-Louis Bossart wrote:
>> On 9/28/26 10:39, Charles Keepax wrote:
>>> On Sat, Sep 26, 2026 at 05:55:06PM +0200, Pierre-Louis Bossart wrote:
>>>>  void sdw_bus_master_delete(struct sdw_bus *bus)
>>>>  {
>>>> -	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
>>>> +	sdw_bus_slaves_delete(bus); <<< this would be the second call?
>>>> +	sdw_bus_slaves_put(bus);
>>>
>>> Yeah seemed the simplest way to not have to change any existing
>>> drivers, the second call is a complete no-op if the first was
>>> done.
>>
>> humm, that seems to work but I get this layering violation after-taste,
>> and I wonder if this works for AMD?
> 
> Nothing should have changed from AMD's perspective. I do think
> perhaps a slightly better fix could be done moving significant
> amounts of the IRQ handling over to the IRQ framework,
> however that is a much bigger piece of work and more scary
> from a regressions point of view due to it being a much bigger
> refactoring.
> 
>> AMD use a platform device instead of an auxiliary one, but overall this
>> looks like the same problem of disabling interrupts before the
>> peripheral driver is removed, no?
>>
>> static void amd_sdw_manager_remove(struct platform_device *pdev)
>> {
>> 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
>> 	int ret;
>>
>> 	pm_runtime_disable(&pdev->dev);
>> 	cancel_work_sync(&amd_manager->amd_sdw_work);
>> 	amd_disable_sdw_interrupts(amd_manager); <<< SAME PROBLEM ??
>> 	sdw_bus_master_delete(&amd_manager->bus);
>>
>> If this is indeed the same problem then the AMD driver should use the
>> same solution...
> 
> I am not super familiar with the AMD stuff, so take this with a
> massive pinch of salt but it depends on if that IRQ is actually
> involved in SoundWire command transfers.
> 
> A quick look through amd_sdw_irq_thread() and amd_sdw_xfer_msg()
> looks to me like the IRQ is not involved there. So I believe
> the AMD host doesn't have the same problem as the Intel one.
> Although there is perhaps debate if SoundWire alerts should
> still function during remove, which would be broken on AMD,
> but I am not aware of any devices that need that right now.
I think you're right, the AMD messenging relies on polling, not on
interrupts, so they are 'safe'. I don't see anything that would prevent
communication with the peripheral.

For the alerts, I guess it's the same on remove, clock stop and system
suspend. When the manager made the decision to remove/stop the
clock/power-down, the transition has to happen. Alerts can only be
handled 'later'.
