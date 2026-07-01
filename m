Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731F2C15BB
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914980; cv=none; b=K/sMrmXlEXhMQlytSCg84ZtYDaFciPRkOKnRn8jf7Xvhc3Nm7oPXYSQ7gN3ReiAvoWVdXkEO/jlnQaPcEGc6qv/Z/jpxBX2YARWyjkT/h2NiBsI67RHxJYPW+aNhn3v659wxs1aPc1MVL9nv6+e6O0zxmQlKmGz6lL0RUhpJGHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914980; c=relaxed/simple;
	bh=MgSX4iHYSypcnMMrYECfZYByDNPGGiZe07CrRfa7bww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLrmJIkrFC+0jzjfCcaKiTXtG01+4/Wod8N7CCb0WU5sbILQ9//flbz+xBuYNpSW5z/w95MwKzz5VLMpFI6ZmMjigzOcc0JWlHZAvftf39/ffGySnbKzxMdr51oBHBpCzo83ohLZH30MC3vkWWGTtFM4d8Hl6U4AEMqIToNmd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XDXomvDC; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XDXomvDC"
Message-ID: <ddc5fd9b-84ae-4180-a470-679d5cc3d629@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782914976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mxUoHumCuK9vzNQT5wBkpHIrGsQSBmoZs1SqA5qW4d4=;
	b=XDXomvDC3u4CjmiIU7tQ8BswpZnDdNjI3hQPe9wgJjw0fI/YoIcktMqtMUqE4bciR6vCyw
	OPXNnTg7nX2zAZumZzo26SQnv5a+kiY07Jc3DtyNqYrcJ2lt7ub2mg13lv6W2/DySqHr1c
	KBl1K9Nqj9EvamrTTQ4FaJEa28PZdxA=
Date: Wed, 1 Jul 2026 16:09:32 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 Richard Fitzgerald <Richard.Fitzgerald@cirrus.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
 <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
 <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
 <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
 <f895956a-a5fb-4b52-813c-110dfce8549d@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <f895956a-a5fb-4b52-813c-110dfce8549d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/1/26 14:15, Richard Fitzgerald wrote:
> On 01/07/2026 12:55 pm, Pierre-Louis Bossart wrote:
>>
>>> If the Manager doesn't send a clock-stop, the peripherals don't get a
>>> notification that they can enter a lower-power mode. The clock suddenly
>>> disappears without warning and without the peripherals being notified
>>> why, so they don't have any information to know what is happening.
>>
>> that's not quite right, see below.
>>
>>> The Manager should send a clock-stop notification before stopping the
>>> clock.
>>
>> That's exactly the existing logic in drivers/soundwire/bus.c, the core does notify all peripheral drivers of a clock stop transition.
>>
> 
> It's been observed with logic analyzer captures on real hardware
> that the clock stop is only being sent in runtime suspends, not
> system suspends.

That's the expected behavior.

> Because of this, if the bus was in a runtime-resumed state when
> system suspend started the clock would stop without warning.
> 
> Bard - that's the observed behavior this patch is fixing, right?

I think you are confusing 'clock stop' and 'clock pause', this is a well-known confusion in SoundWire. See Section 8.1.2.2 Clock Pause in the 1.2.1 spec.

The clock stop mechanism refers to the ability to remove all transitions on the clock line, but restart the transitions when the data line is driven high for some time.
In other words, the "clock stop" used in pm_runtime suspend will also arm a detector on the data line. That's the problematic part on the host, this detector cannot be kept alive in system suspend since it has standby power implications.

In addition, on Intel platforms, there's a well-known issue where you cannot remove power to the SoundWire IP while this wake detector is active. That's the reason why we introduced a pm_runtime resume before the system suspend, the transition from pm_runtime suspended to system suspended is not supported. see intel_pm_prepare().

the 'clock pause' is what you see with a logic analyzer, it's not the same as the full blown 'clock stop' mechanism because there is no handshake to prepare the wake, and no support for the detector. There is indeed no signaling or known timing on when this pause occurs in the system suspend phase.

But again such signaling is not required: if you want to enter a lower power mode prior to system suspend, you can do so in your peripheral driver. You do not need to know if/when the clock will be paused. Just add the relevant programming sequence before the device transitions to system suspend.

