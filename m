Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8A35B137
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994618; cv=none; b=TjZ12GXFxm5BLP5wECLUdtzayicDsKH0fPmi7frv0CYhI6t3bb/fvGuAdDGRjKDpN7x7vhpSwHlTf13/jjeJ/yvVBHujpaC7D96adBXseMXmPHRxeYHqBlhMXTZWqyMkbgEvZQX5KONUFEimKXgQbzgwmBkKP0CU23UvSiDrkRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994618; c=relaxed/simple;
	bh=UbyWwxwp22Y+6MQsco8eyEnd+wcTcmbaO4dzVdxuawY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7XOXqKipzfwJjdz+SdAmO7Iow2ZovXYhs/Hq9ylea0cKRuHMa+eeY17yBd3qIavO5UBffRHOf111sEOsZhf48CrTep4aUUkuOhgZNKWamm/POvt7ZDS7ejVgkya43ZM0g+RSFtTieTUipHLiNB2LcGgj6LI39hQqh2LjhP0yBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ppa2spSr; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ppa2spSr"
Message-ID: <f3a7b462-477d-459b-91ba-1ccf4bde5268@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770994613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ectMXPbSquiq9zXOoYBh3vT9HE72FpLY1ylwn5HS1Tw=;
	b=Ppa2spSrux2XmjsqHsR4Go5oTrel8g/nkGAFSyqge5+RWwC9eYFmcOrjiTi6uf1bTP9pc1
	5xpJ6MzayJcOOJLSQj3U0r8rM7+ZEhcHxZpRE2wM3+dVBnMdOSTLADB6aRLhtWESrfsbWv
	GWK8WOnTu2eAv52kTgDASsyqSpjhKaU=
Date: Fri, 13 Feb 2026 15:56:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [EXTERNAL] Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command
 for Simplified_CP_SM
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "Ding, Shenghao"
 <shenghao-ding@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kasargod, Sandeep" <sandeepk@ti.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
 <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
 <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
 <286c2158-5f53-42a2-a04d-e9bed3e7acf0@opensource.cirrus.com>
 <54a891e5ee36487d9b6665cd73a19af7@ti.com>
 <b1238db5-25ce-4046-9719-bd6fa8fbc82c@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <b1238db5-25ce-4046-9719-bd6fa8fbc82c@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


>>> Are you referring to the DPN_IntStat::PortReady bit? IOW do the errors during
>>> prepare happen because the interrupt is not generated?
>>> If that is the case, then you should be aware of the thread "soundwire:
>>> stream: Prepare ports in parallel to reduce stream start latency", where it was
>>> agreed that the use of the PortReady interrupt is broken. We do need to move
>>> to a different code where we have a polling loop on the
>>> DPN_PrepareStatus::NotFinished bits.
>>
>> Thanks for the info.
>>
>>> So is the problem in the interrupt generation, or is the problem with the 'Not
>>> Finished' bits?
>> Both, while using Full CP_SM on a simplified CP_SM device:
>> * First problem: the interrupt will not get generated on a simple CP_SM device.
>> * Second problem: even after timeout waiting for interrupt with huge delays,
>>    we can't rely on 'Not Finished' bits, causing timeout errors.
>>    In the current code for full CP_SM, 'Not Finished' = 0 is a good response even
>>    with timeout.
>>
> That's because it _IS_ a good response. If the part is reporting
> NotFinished=0, then it's good to go and we don't need to treat it as a
> timeout. The timeout is caused by the deadlock that Pierre mentioned.
> Full CP_SM will always timeout because that code is holding the bus
> lock, which blocks the interrupt handler.
> 
> Ignoring the timeout if NotFinished=0 was a workaround until I found
> time to fix the interrupt handling. Otherwise full CP_SM would never
> work.
> 
> We've now decided to replace that code with a polling loop instead of
> using interrupts.

IOW the suggestion would be to use Richard's patch and force the drive to use a regular state machine.
see https://github.com/thesofproject/linux/pull/5649

>>> If that works then an alternate solution to this patch would be to quirk all TI
>>> devices to use the regular state machine, and use the polling loop as
>>> suggested by Richard Fitzgerald.
>>> I think it's worth exploring what happens if the PortReady interrupt is not
>>> used. If that's broken as well, then your solution would work but needs
>>> more/better comments indeed.
>> Currently, we have one device which needs this workaround.
>> Initially, it looked like a generic solution to me. However, if it makes sense,
>> I can implement sdw_slave_ops->port_prep to make custom changes
>> for the required devices only, handle any errors and drop this patch.
>> Please suggest.

But if you want to keep following the CP_SM state machine, then you could indeed add the required write in a port_prep() routine.
That'd fine as well, you'd be relying on what the core SoundWire stream management provides - namely a means to do device-specific stuff before/after port setup.

