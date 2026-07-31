Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BE3909AE
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490248; cv=none; b=ZIrR6z7aggJXXYoxnPgl1jW8l21Ycgf+Sekic0cHhC4UvjgmgrHUT0fNmZAwMuakGV0xQoOTHrZ293xXP22PzVwInI5T7isOB488H4hlF+tycfJgfnPF1/YjSUmPmuDQ1hNoaCeg39LVrngev0JZ1LDk/+0W2Tm90KeA5y0cSGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490248; c=relaxed/simple;
	bh=v0szyNmkYkanBtp1l00WD20PEDWD6JZumPozBX+1f9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAmXxSQrRtair7NJJgd7TrhgkhKGp2l0zGdwy4picDCYwy6aqlzqF31ly85Vq5LmKeVBlu3xMYDTJWVA1ZqCq2BuIKAYOt2P59u4mZ+L5zb5IP2mOi+2DoIq4BpORNgcAxQ/keFZG75lC5wUPMo4Dtsdlyv9Lyk+b+cuRrD4FNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFW0e+6s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFW0e+6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785490246; x=1817026246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v0szyNmkYkanBtp1l00WD20PEDWD6JZumPozBX+1f9A=;
  b=kFW0e+6sNJ6iAxa+5DAhEMBpnAi4vEDtKc/mMTIEf83epYPLX6M4yXc0
   4pRxDCR1DJ7BRpSnz8Js+0eNI49q2MxaHx13clb+nVTWlv2Q0NLBmEUt9
   GKgeBsElZUbSnz0twPsJKTIJfWHqZ73MW/ikCMeZ1bmgqan2BG21i5zVp
   db2DAmthOHEGqxmIap0Rn+sB0I9HeyFRMEBzaYSh+qtbK+OfhmJOrJxKW
   XpkoV7IqsfLG+gbKksDl+HIbqKfzDpcSFavjjCVKkpr0+nsg3yLc2InnI
   UwxzfDjuS5bbj30xdnErIXSTXl9iNcGCzdxLgbXQRfUQzdz9oGXGAFOCX
   Q==;
X-CSE-ConnectionGUID: yfSwWDI4RHylz1jsn59bzQ==
X-CSE-MsgGUID: 7JZQSvc5RlubuGfeBV8e9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88647981"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="88647981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:30:45 -0700
X-CSE-ConnectionGUID: Ecrt6ov1Q/WMd2igBlT6LQ==
X-CSE-MsgGUID: DWlzEmxBSiW4PCZn9qA6Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="259292911"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.111]) ([10.245.246.111])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:30:43 -0700
Message-ID: <f51125d2-b961-4224-81d0-86e622c00ace@linux.intel.com>
Date: Fri, 31 Jul 2026 12:31:19 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period
 elapsed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yuhsuan@google.com
References: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
 <c1ed5264-9a03-4436-b17c-8c1f59289b5e@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <c1ed5264-9a03-4436-b17c-8c1f59289b5e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/07/2026 12:20, Pierre-Louis Bossart wrote:
> On 7/30/26 15:04, Peter Ujfalusi wrote:
>> From: Yu-Hsuan Hsu <yuhsuan@google.com>
>>
>> The snd_sof_pcm_period_elapsed function currently schedules work on the
>> system-wide workqueue. This can lead to potential delays or jitter in
>> audio processing if the system workqueue is busy with other tasks.
>>
>> To improve real-time performance and ensure timely processing of PCM
>> periods, we can use the system_highpri_wq instead of the default work
>> queue.
>>
>> In performance testing, this change significantly reduced the observed
>> scheduling delays. For instance, under load(stressapptest -M 15000 -m
>> 60), the maximum delay dropped from 9ms on the system workqueue to 5ms
>> on the dedicated high-priority workqueue.
>>
>> Suggested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@google.com>
>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> Sounds good but should this higher priority queue be used for other
> things as well?
> 
> e.g.
> 
> period-elapsed for compressed streams:
> schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
> 
> and the SoundWire interrupt handling with additional workqueues:
> schedule_work(&amd_manager->amd_sdw_irq_thread);
> schedule_work(&amd_manager->amd_sdw_work);
> schedule_work(&cdns->work);

we also have:
sound/soc/sof/core.c:           schedule_work(&sdev->probe_work);
sound/soc/sof/intel/ptl.c:      schedule_work(&hdev->mic_privacy.work);

> Not sure what the rules are to define what's high-priority and what's
> not... It could be that different systems have different requirements...

I think the 'rule' is that what is time critical and what can tolerate a
bit of a delay. The PCM period is time critical while the others are not
that much, that includes the compress elapsed, it is not that real-time
as the PCM.

But fair point, I will check if anything else would needs to be higher
priority than what they are.

> 
>> ---
>>  sound/soc/sof/pcm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
>> index b2071edeaea6..f748d072109a 100644
>> --- a/sound/soc/sof/pcm.c
>> +++ b/sound/soc/sof/pcm.c
>> @@ -62,7 +62,7 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
>>  	 * To avoid sending IPC before the previous IPC is handled, we
>>  	 * schedule delayed work here to call the snd_pcm_period_elapsed().
>>  	 */
>> -	schedule_work(&spcm->stream[substream->stream].period_elapsed_work);
>> +	queue_work(system_highpri_wq, &spcm->stream[substream->stream].period_elapsed_work);
>>  }
>>  EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
>>  
> 

-- 
Péter

