Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F4264A88
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105449; cv=none; b=OvyonozQYGSszybinKRvuTX3kqCqZ9OFjwifddf67WF0m6eajJTKMHjxVngZmFGGfUTw0/VPeQaf41sDyYud9s5jib5nSTDcdAzcIXaotIspz54eWszzwn8xB8L+uBCxciTvJmxt1MhyNgu7NTkMCJ4vEH9TLI4dU9l6EXs7Ny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105449; c=relaxed/simple;
	bh=n6G7AjsoQcR++01gNulEmXLHUtsHDKIY44kSn2/eNbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q090PRVqOYFxDsuKOU7ZSDSjWB5ZDn3fQYmv+9tlnDYAncpa8NHIgU5+wnsmkG3HygzsNg+mEI5jykyEJf1AA8KF5JwBv+2pp4QqOghYxaOcO/DXnqO2fl+r0oL8hauwLluRGDYNa+n+bRRxz9rAmsv4ypDUQ+eu9cZk5hgXeHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEmY6dom; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEmY6dom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744105448; x=1775641448;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n6G7AjsoQcR++01gNulEmXLHUtsHDKIY44kSn2/eNbE=;
  b=hEmY6domlR0GosOsj6aNJckymBUd9bQ2l8ESGEQtU1ibS1+30J9UU8+K
   vFEacVRbg/p0YTtwjj3Sru0+cLUbtmGRelTqIHIpLt75KlmgSspfWTWGI
   nkN2WAoWSSww2FdIhplDR2/T5b1a9yV6suq2G2GEEJdxCkdPHMeGwNYXY
   KioHPEEMi58snpXV1tYOetdUPZ4Fx7nohFB/eK4hVXiyUlXd/R0iETvjx
   QT0YNV+OV4mhSwsRzzvtBUu58OXNQszoLoQ+x+xBFQYSnEe136irF3jBb
   iGwcx1N8yiBk1yrySao26S+Yl/p0QlGB3pbjLbvWkmmE0zRcnDlnFpJn2
   Q==;
X-CSE-ConnectionGUID: mBOftEnfSHm1E3wwyaqriw==
X-CSE-MsgGUID: bylEdpuhS6SVhNDecq/BBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44668879"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="44668879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:44:07 -0700
X-CSE-ConnectionGUID: BbJg7EjDT8O9UEhHLSrXCw==
X-CSE-MsgGUID: prdIu1/nQWWbiQ07Scp9vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="151402757"
Received: from unknown (HELO [10.245.248.64]) ([10.245.248.64])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:44:04 -0700
Message-ID: <2f456ffa-72f0-4efd-be26-f96249d2d1ee@linux.intel.com>
Date: Tue, 8 Apr 2025 12:45:00 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
 <87v7rmylc5.wl-tiwai@suse.de> <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
 <87o6xeyfkk.wl-tiwai@suse.de>
 <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
 <87jz82ye7b.wl-tiwai@suse.de>
 <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
 <87o6xe7l4q.wl-tiwai@suse.de>
 <51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
 <871pu95oon.wl-tiwai@suse.de> <2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
 <87plht447q.wl-tiwai@suse.de> <b9d457b9-4645-4876-b6a1-82bb658a3b8f@perex.cz>
 <d084dff6-6a25-4f84-879c-15c108c9c141@linux.intel.com>
 <0cada872-b247-49f4-9684-b168a7425956@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <0cada872-b247-49f4-9684-b168a7425956@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/04/2025 11:51, Jaroslav Kysela wrote:
>>>          bool no_device_suspend; /* don't invoke device PM suspend */
>>> +       bool do_suspend_and_resume_in_pause; /* allow direct PAUSED ->
>>> SUSPENDED and
>>> +                                               SUSPENDED -> PAUSED
>>> transitions */
>>
>> I think the issue is bit different than this.
>> What needs to be flagged is that the driver is not treating the PAUSE
>> trigger in the same way as it treats the STOP or SUSPEND, in other
>> worlds, the PAUSED state is not equal to STOPPED/SUSPENDED.
>>
>> If the PAUSED state is equal to SUSPENDED state, then the trigger could
>> be skipped (as it is ignored before my patch unconditionally), but if
>> the two states are not equal then the SUSPEND must be sent, but the
>> patches from me and Takashi-san stil can be used as fallback in case the
>> RESUME is not supported as in that case the driver will certainly not
>> going to be able to resume to PAUSE_RESUME, so stopping a stream in that
>> case is appropriate.
> 
> The question is if the fallback is required when we had this issue for
> years.

This discussion is a proof that we might want.
We ended up disabling testing the suspend while paused case entirely for
quite some time and I could only get it working with my RFC attempt
before Takashi-san suggestion to do this in core level.

I agree that this is a rare corner case, more academic than not, users
will likely not going to face with as none of the audio servers use
pause so the chances that the system goes suspend while audio is paused
is close to zero.

> Using only a new trigger - to not release pause but directly do
> stop from the pause state - is acceptable for me. It should be easy to
> fix affected drivers. But on other side, the allowing state transitions
> (and even multiple triggers for finer driver notifications) may have
> also benefits for drivers.
> 
>> Side note: I think we might also have broken case when we stop a PAUSED
>> stream if the driver's PAUSED state is not equal to STOPPED/SUSPENDED.
>> It is just that applications never do this, at least I ave never seen a
>> missing STOP trigger. aplay is doing a pause release before stop at
>> least.
> 
> Aplay implementation is just about simplicity. The pause is handled in
> one routine which releases pause at the end. When the file descriptor is
> closed,
> snd_pcm_drop() is called and the pause is released there, too.
> Logically, it's not 100% correct thing. We know that we want to stop
> stream before the pause release is called.

The assumption is that PAUSED == STOPPED == SUSPENDED is not correct
either. This is not true for some drivers or devices.
I would go as far as to say that most drivers are mishandling the PAUSE
as stop, they likely cannot resume from the exact place where the pause
taken - they stop and if they have FIFO, they drop that as well...

> 
>                     Jaroslav
> 

-- 
Péter

