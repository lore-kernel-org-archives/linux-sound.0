Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB81383BD
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271044; cv=none; b=kx22wiwOMsiQcyN9UTa7FRuelIe9a9PQWgRxhVTwFne8KT9B97DqmCR3AyYh5Dco63h+fdxGW6o2cVf//0W79XZLLeOnU+Fg71YxQoEUGH6/CN8qSGjCDQ80GVaqT8e4/VL3dD1JoTRi1lI3WqmgaZqWz/k2Yuo9tZeqiC8TcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271044; c=relaxed/simple;
	bh=WHlfvHEJ+CNdeAX6LHChxwwTI5WHSfz6FJqxc2EqGLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiXTWyJ2qtF4jFT27kOYt0BLd3aULkdKWflzrVFFxbtJ8JDIsWBCfoAXHwwhBYGWIkYekRnFtCxZ19NyUn5O0n9smrx7hMliUJctSJsZWzc4o7Tzl+qyEWVGL054umJkHqRit4OErtfm41FDquaJRCMuMzHIrvOnY9kjW1OJT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niqUIdQM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niqUIdQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715271043; x=1746807043;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WHlfvHEJ+CNdeAX6LHChxwwTI5WHSfz6FJqxc2EqGLQ=;
  b=niqUIdQMVLhYNIERSw5QGgtUiuyeSX6qtzteiE3Ffw7cgY74gRYLOoTO
   hKfPEtlkrCTKBDaQRhBMtt+XA0UgWJebNzKYqBf+v9Eu6qtTIdY50cJap
   4pWDyPbE05za1g0iY8z/Agdez6UDn6B36ItsPovhVZwk3BWq/kQbSkcSG
   lka6oqMLKfzY7Avcokw1uxCEjVh/H4baKA7zntjmI7mwBLFS5bXKDF5kD
   /8EHtQgggujo2VeFntpVyks0hd49XyTo7b7iPiYjCv4erCSDYg1i6EqNL
   lD/4hy/Vm9WKN7bSlJQ5Bsf2/blCe/U/uDGeN7jOQWoOPAn3fE5qTSKdW
   A==;
X-CSE-ConnectionGUID: EkvNX2GiRLCF6y6OJWX+wQ==
X-CSE-MsgGUID: t5SueYqOT/GkrxicQG0N/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11038880"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11038880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:10:41 -0700
X-CSE-ConnectionGUID: qyQ24vBCTw2gQO2EnRfM6g==
X-CSE-MsgGUID: 7PbqfrG8R5GkY9l72lkMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29395572"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:10:41 -0700
Message-ID: <dbee6345-1513-4b55-8f8f-d579d577a6d6@linux.intel.com>
Date: Thu, 9 May 2024 11:10:39 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
To: Takashi Iwai <tiwai@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
References: <20240507135513.14919-1-tiwai@suse.de>
 <ZjpQm-hxLQtpgkUx@smile.fi.intel.com> <ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
 <87ikzod6bt.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ikzod6bt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/24 04:02, Takashi Iwai wrote:
> On Tue, 07 May 2024 22:53:46 +0200,
> Andy Shevchenko wrote:
>>
>> On Tue, May 07, 2024 at 07:02:35PM +0300, Andy Shevchenko wrote:
>>> On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:
>>>> Hi,
>>>>
>>>> this is a series of trivial cleanup patches for Makefile in sound/*
>>>> (modulo ASoC -- which will be submitted later in a separate series).
>>>>
>>>> As Andy suggested in a patch review, *-objs suffix in Makefile is
>>>> basically a mis-use nowadays for kernel driver modules.  They should
>>>> be replaced with *-y suffix instead.  This is a result of systematic
>>>> conversions, separated per directory.
>>>
>>> I briefly looked at this and since it's a mechanical conversion I don't see
>>> any issues, so
>>>
>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Btw, make W=1 nowadays enables modpost checks, which complain about absence of
>> MODULE_DESCRIPTION().
>>
>> Example:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>>
>> I'm not sure what the case now for ALSA, just FYI.
> 
> Indeed there are lots of code that miss MODULE_DESCRIPTION().
...
> There are too many stuff in sound/soc/sof/* and I leave them to SOF
> people (Cc'ed), while I'm going to submit the fix patches for the
> rest.

ok, I'll take care of it. I wasn't aware this was a requirement.
