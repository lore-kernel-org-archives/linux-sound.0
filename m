Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1E41A50A
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500416; cv=none; b=JlMya+obMZq9Bn4aDJXsLWFWgAeXmODHnmsdfaUlfAfd9O3feO/AeBizZOq6oAOuey+yCcWqFS+TDEDrSohTLxKYwvUykYiI9Ls8L7/AqMIpJKlHfqu0AZl5pWYFnoXAv436HriNZiTcF4pMKEii+2dn6yZhNWwzz4rQL7R+33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500416; c=relaxed/simple;
	bh=7HfCg0dTq+0MusMuc1cIC67rJQtjUQ7T2vpANkjH6OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBBfSnxANjWhy6TOlohQPeRGWMs/07+UrI3oPlj2rwdHPlUf6WtcdMffoiYi0Njojidiyr+fU50p0FO7TOkPCAgHXNmhRkgXlRl//tvsJ0FdYDt0E4YY5WRKYU45j9q1mzmiHqtfxF2Mty3CUxLMiIQcanV1H1uUzq+kw44n7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pMuRz6IC; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pMuRz6IC"
Message-ID: <d8e791ba-ed68-4c42-8ce6-fecf7af4c699@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785500411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlAuk46rfYul/RocxmhwintES2QB3paeSeu9QANKL5g=;
	b=pMuRz6ICmgaUVb2L3izBwFN06FGbPYCV74BUUrFHF4mprgbrT587MhiDhdXdjDZ0nBW345
	Oa+WP2c27VOZjhU0Ruiwv6jvrUKHR22wjZNu7TsKmTlSSYMbqfhNFntzPvKmGyqery6rOS
	2Q/hOkXeLYQlbWRFZpnAJg0o7GRsJdo=
Date: Fri, 31 Jul 2026 14:19:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period
 elapsed
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yuhsuan@google.com
References: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
 <c1ed5264-9a03-4436-b17c-8c1f59289b5e@linux.dev>
 <f51125d2-b961-4224-81d0-86e622c00ace@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <f51125d2-b961-4224-81d0-86e622c00ace@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 7/31/26 11:31, Péter Ujfalusi wrote:
> 
> 
> On 31/07/2026 12:20, Pierre-Louis Bossart wrote:
>> On 7/30/26 15:04, Peter Ujfalusi wrote:
>>> From: Yu-Hsuan Hsu <yuhsuan@google.com>
>>>
>>> The snd_sof_pcm_period_elapsed function currently schedules work on the
>>> system-wide workqueue. This can lead to potential delays or jitter in
>>> audio processing if the system workqueue is busy with other tasks.
>>>
>>> To improve real-time performance and ensure timely processing of PCM
>>> periods, we can use the system_highpri_wq instead of the default work
>>> queue.
>>>
>>> In performance testing, this change significantly reduced the observed
>>> scheduling delays. For instance, under load(stressapptest -M 15000 -m
>>> 60), the maximum delay dropped from 9ms on the system workqueue to 5ms
>>> on the dedicated high-priority workqueue.
>>>
>>> Suggested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@google.com>
>>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>
>> Sounds good but should this higher priority queue be used for other
>> things as well?
>>
>> e.g.
>>
>> period-elapsed for compressed streams:
>> schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
>>
>> and the SoundWire interrupt handling with additional workqueues:
>> schedule_work(&amd_manager->amd_sdw_irq_thread);
>> schedule_work(&amd_manager->amd_sdw_work);
>> schedule_work(&cdns->work);
> 
> we also have:
> sound/soc/sof/core.c:           schedule_work(&sdev->probe_work);
> sound/soc/sof/intel/ptl.c:      schedule_work(&hdev->mic_privacy.work);
> 
>> Not sure what the rules are to define what's high-priority and what's
>> not... It could be that different systems have different requirements...
> 
> I think the 'rule' is that what is time critical and what can tolerate a
> bit of a delay. The PCM period is time critical while the others are not
> that much, that includes the compress elapsed, it is not that real-time
> as the PCM.
> 
> But fair point, I will check if anything else would needs to be higher
> priority than what they are.

My point is that this change isn't bad in itself, but maybe some systems
don't care and have other subsystems (graphics, networking, etc) that
should be given preferred access to the high-priority queue.

Same for the SoundWire workqueues, one could argue that the command
protocol overhead is significant for all the device initialization and
firmware download. Using the higher priority queue could reduce the
initial 'cold latency' for interactive sounds in a busy system.

Going back to the PCM stuff, the period_elapsed stuff is also not that
relevant with timer-based scheduling which relies on snd_pcm_delay().

Could it be that the level of priority should be configurable (Kconfig,
sysfs, kernel parameter) to let distros pick what they need?
