Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E61DF73A
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364799; cv=none; b=OCi69fqIjDSZ0uO5fMFXxnLgvLzbY7xaG0xBoOtCMk5dXGAHCwExCtwltEEwBa3lJ8VOTElIg/WMkItgrT7aSsXTSDFrgc29x/QFz2Wq9n+ZILFE4r7x9O0/1rJH6BiP+sGZ6fVy76i/cZfz7PlogXEM2CMZXyssrl+otjiM61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364799; c=relaxed/simple;
	bh=XKJyrMOXRuagXNXyeh+l5NoElX0043tbbtAPNdQByys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfZM9S5DRiRTQ3jrt8Li9XNXmVtVkr37OO9oY88M1uUKMFf3WSrANJ35Oy1NujnidhKJiSKRxD+Z3+WBj82jIUCj4BXW1iQd5ycwRnYJZaoNEKP7Nnjm0nUHxntd3Huxpxc9SIZlXjaMga/eFv0v33hQ9+c8/9awsnPHInV8C9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v9qof302; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v9qof302"
Message-ID: <6e9878bc-856c-4319-b535-ab8f565f2460@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751364784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHxgwfULYqm3aiDalEcyK5ldoUUbN+9vxlVnjrjQsPo=;
	b=v9qof3028NM5Dw6ka9WO5ZPzWmR18G3M0bXU+kOuRbmKGg5qf39iXdCrPcLgGIsj16KY9N
	OSwmOSm0et3AHYiC6h0dMJwk8wwG0vJvkzwztOsrnhBE7richi3mt2blor8c+dfFO87pSW
	LoMr7FuwbeQYPBbvdoRVKcGODlB9FCM=
Date: Tue, 1 Jul 2025 12:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
 <f95f6777-7445-46dc-be53-b3ae5594bf39@linux.dev>
 <SJ2PR11MB842425A1CE631E71E4AF26F0FF45A@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB842425A1CE631E71E4AF26F0FF45A@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>> The current code waits for the codec initialization in the resume
>>> callback. It could cause the resume takes a long time while waiting for
>>> the codec being attached and initialized. Move the waiting to the
>>> hw_params callback when the driver really needs it and shorten the
>>> resume time.
>>> The change is mainly on the ASoC tree. Let's go through the ASoC tree.
>>
>> While I certainly understand the desire to make the resume time lower, is this
>> approach desirable in all cases?
>>
>> My main worry is this: not all functionality in a codec is related to the
>> hw_params. One counter example would be register settings related to jack
>> detection. You would want the regmap settings to be correctly applied in
>> hardware registers even in the absence of any streaming request, no?
> 
> Right, not all functionality is related to the hw_params However, the
> codec need to be attached first if the functionality needs to access the
> codec. That's the reason we do io init and regcache_sync in the
> update_status callback when the codec is attached. Take the jack
> detection as an example, the codec will be attached first when the JD
> event happens. At that point, the driver will do io init and regsync and
> then handle the interrupt.

We agree on that part. The initialization is done from io_init. The disagreement is whether we have to wait in the resume() for the device to be fully initialized, see below.

>> The other weird thing is that historically the codec initialization was never on
>> the critical path, it was several orders of magnitude faster than the controller.
>> It wouldn't hurt to provide broad-brush information on what a 'long' time
>> means for a codec resume, so that we can really see the pros/cons of moving
>> all the regmap initialization.
> 
> The main issue is that the codec could be attached after the codec resume.
> Sometimes, it could take 100 ms or longer.

I don't really see the problem here. The codec device (in the Linux sense) is trying to resume, and you want to wait until the hardware device is fully configured, no?

Moving the waiting part is asking for trouble: the device will be reported as pm_runtime active, but it may not even be attached on the bus, and thus any register access will lead to invalid read/writes.

For example, starting a register dump via debugfs would fail if the codec is not attached. The machine driver could also set jack status that would fail as well.

>> Another open is that SDCA defines the notion of 'blind writes' which would
>> typically be done during a resume if context was lost. If we start moving some
>> parts of the initialization to the hw_params and others remain in the resume
>> flow, that will quickly lead to complexity in managing configuration.
> 
> I am not trying to move the initialization to the hw_params. The
> initialization is still done in the update_status() callback. Waiting on
> hw_params is just to make sure the codec is initialized before the
> audio get started. And currently, Realtek codec drivers do blind writes
> in the io_init function not resume.
> 
>>
>> The last point is that this is a change for Realtek codecs only, would other
>> drivers for other vendors require this change? And if I may ask is there any
>> merit in speeding-up resume times even for 'legacy' non-sdca parts?
> 
> IMHO, yes, other drivers for other vendors require this change.
> I don't see any difference between non-sdca and sdca codecs.
> They both could be attached after the codec driver resume.

I really don't see the rationale for 'speeding-up' the resume and losing the guaranty that the device is fully operational. The whole point of the wait_for_completion() in the resume part was to avoid any problems between the pm_runtime state machine and the asynchronous nature of the bus attachment at the hardware level.

Unless I am missing something big, it feels like you are playing with fire to speed-up a resume time that was not reported as a problem. You may be right that the SoundWire setup needs to evolve, change is the only constant in this world, but from my perspective it's not clear if the benefits offset the unknowns and potentially racy behavior introduced by this resume change.

>>> Bard Liao (15):
>>>   soundwire: add sdw_slave_wait_for_initialization helper
>>>   ASoC: rt722: wait codec init in hw_params
>>>   ASoC: rt712: wait codec init in hw_params
>>>   ASoC: rt1320: wait codec init in hw_params
>>>   ASoC: rt721: wait codec init in hw_params
>>>   ASoC: rt715-sdca: wait codec init in hw_params
>>>   ASoC: rt711-sdca: wait codec init in hw_params
>>>   ASoC: rt711: wait codec init in hw_params
>>>   ASoC: rt715: wait codec init in hw_params
>>>   ASoC: rt700: wait codec init in hw_params
>>>   ASoC: rt1316: wait codec init in hw_params
>>>   ASoC: rt1318: wait codec init in hw_params
>>>   ASoC: rt1308: wait codec init in hw_params
>>>   ASoC: rt5682: wait codec init in hw_params
>>>   ASoC: rt1017: wait codec init in hw_params
>>>
>>>  drivers/soundwire/slave.c          | 17 ++++++++++++++
>>>  include/linux/soundwire/sdw.h      |  1 +
>>>  sound/soc/codecs/rt1017-sdca-sdw.c | 32 ++++++++++++++++----------
>>>  sound/soc/codecs/rt1308-sdw.c      | 32 ++++++++++++++++----------
>>>  sound/soc/codecs/rt1316-sdw.c      | 32 ++++++++++++++++----------
>>>  sound/soc/codecs/rt1318-sdw.c      | 30 ++++++++++++++++--------
>>>  sound/soc/codecs/rt1320-sdw.c      | 32 ++++++++++++++++++--------
>>>  sound/soc/codecs/rt5682-sdw.c      | 29 +++++++++++++++--------
>>>  sound/soc/codecs/rt700-sdw.c       | 27 ++++++++++++----------
>>>  sound/soc/codecs/rt700.c           |  6 +++++
>>>  sound/soc/codecs/rt711-sdca-sdw.c  | 28 ++++++++++++----------
>>>  sound/soc/codecs/rt711-sdca.c      |  6 +++++
>>>  sound/soc/codecs/rt711-sdw.c       | 26 +++++++++++++--------
>>>  sound/soc/codecs/rt711.c           |  6 +++++
>>>  sound/soc/codecs/rt712-sdca-sdw.c  | 28 ++++++++++++----------
>>>  sound/soc/codecs/rt712-sdca.c      |  6 +++++
>>>  sound/soc/codecs/rt715-sdca-sdw.c  | 37 ++++++++++++++++++++--------
>> --
>>>  sound/soc/codecs/rt715-sdca.c      |  6 +++++
>>>  sound/soc/codecs/rt715-sdw.c       | 27 ++++++++++++----------
>>>  sound/soc/codecs/rt715.c           |  6 +++++
>>>  sound/soc/codecs/rt721-sdca-sdw.c  | 29 ++++++++++++-----------
>>>  sound/soc/codecs/rt721-sdca.c      |  6 +++++
>>>  sound/soc/codecs/rt722-sdca-sdw.c  | 26 +++++++++++----------
>>>  sound/soc/codecs/rt722-sdca.c      |  6 +++++
>>>  24 files changed, 320 insertions(+), 161 deletions(-)
>>>
> 

