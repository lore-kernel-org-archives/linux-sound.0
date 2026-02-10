Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02B2FF65F
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770755304; cv=none; b=SrWB2A1ZWzCwlsMnjydvHbVs8RFgBNz96i1TvqGbwSWJsKAH/GE/u3aePq8PtlwLyuDFhceLsAgW6X7K9cbQVM2QfsRqcIOoyeZ2YYfPknWEcbdYd9OFa7dHWo3jyXEX+027Di/gj5tTP5OidA8vZXdjlD0i1Fz0q9tz+A1Ne80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770755304; c=relaxed/simple;
	bh=djN3UfH28Y3jTwd2PIdwXLEAHjrY1WYAJRWM9nL0/ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgGFLrf15AlKciJ9Rb9MZwG/kBbYnPyPcwDt1aQ4ZBlBU7gJSk8eIuA0irEAY7u/FqJXN1N0KAMX3CnqzAUV1wweSodfFxxQ9qv/TfVfagSFxhJaGutitoXgUQ3QuKsYWs+LxPxpvPkXBrOZdf9uU3EioE9Mg2fXb3jP6SIMsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=On1bYzjw; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="On1bYzjw"
Message-ID: <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770755299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZFKsGZKINNXpMort9l5e+tnM2VrkIRNhaNM+xFjftw=;
	b=On1bYzjwG91NyajeaUjPKRfrN9s9tIwxMcXwsBLmw64Ec9uFawAH6nnzEBpeauvwMC8ere
	kgNC0DjNE1gycj5ZyRYagkMMZM8IwFFQFx14sH4o6Kds0B9GJC7IyYHjSJ6dgOkXOaXLYz
	/Q5/1FtNKt+SEyU9XbUYN9HWnaFMkes=
Date: Tue, 10 Feb 2026 21:28:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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
 "Kasargod, Sandeep" <sandeepk@ti.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
 <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/10/26 18:29, Richard Fitzgerald wrote:
> On 10/02/2026 5:04 pm, Pierre-Louis Bossart wrote:
>> On 2/10/26 12:08, Holalu Yogendra, Niranjan wrote:
>>>> On 2/9/26 20:13, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> wrote:
>>>> Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare
>>>> command for Simplified_CP_SM
>>>>
>>>> On 2/9/26 08: 09, Niranjan H Y wrote:
>>>>> In TI device implementations, we've found that some devices with
>>>>> Simplified_CP_SM still benefit from receiving the Prepare command.
>>>> It would also be good to clarify when the device is actually prepared after the
>>>> bits are set, if the implementation cannot guarantee that the prepared status is
>>>> reached by the end of the frame where the write occurs, then it's definitively
>>>> NOT a Simplified_CP_SM.
>>>>
>>>> What happens is the simple_ch_prep_sm bit is not set for those devices, and
>>>> the regular state machine is used instead? Is anything broken?
>>>
>>> We need to use the same BIOS between Windows and Linux. The BIOS configures
>>> the device as Simplified_CP_SM. The device also expects the Prepare bits to be
>>> set. If the device is configured as generic CP_SM, the status "Port Ready"
>>> bits will not be updated and we end up with port prepare fail errors.
>>
>> Are you referring to the DPN_IntStat::PortReady bit? IOW do the errors during prepare happen because the interrupt is not generated?
>>
>> If that is the case, then you should be aware of the thread "soundwire: stream: Prepare ports in parallel to reduce stream start latency", where it was agreed that the use of the PortReady interrupt is broken. We do need to move to a different code where we have a polling loop on the DPN_PrepareStatus::NotFinished bits.
> 
> I made a patch to poll for DP prepare finished, instead of using the
> interrupt. I haven't sent that patch because this TI patch changes the
> same function. I was waiting for this one to be merged and then I would
> rebase onto that.
> 
> Draft review of polled DP prepare:
> https://github.com/thesofproject/linux/pull/5649

IMHO it makes more sense to fix first a conceptual issue, and then add whatever is needed for a specific vendor.
The second part could be a quirk to use the regular state machine, or this additional write if that's not enough.
