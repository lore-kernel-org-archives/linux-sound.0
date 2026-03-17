Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6A358394;
	Tue, 17 Mar 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738704; cv=none; b=OXQOVzhWEdLG9U5mKOJTF28LmSdzX5SA/oviHwz8mYWcrwIf910EiHTUO5EZ2BI4StHUlb+3FvJa0yet8TwpBQVNLOUIRy01kJi8DdP3dEVZ+9cQiv4BMzH52w6N6JWIdtyszoEF0KBA10kGirGK+tQbhdri68DlfFpcCvnQLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738704; c=relaxed/simple;
	bh=9zNCeRL4GHsn8w3mMwSC4KppE3LMlMGCnO3EZnFdpJA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FFehwM6xWHlTkMg+LJmJywu1zFkfUOGfWPAHWC4glfZAI0NrEOsBEUk5X1OmkzGfRFgh5B2vJe8IjCay0InidXUPs+pS6EagnNlL5suSDhNUUqfyF2vhJOce+OlG1ni0lP9WIhA8Tr3raRuaf9NZQr8++rLVV+26hnOENZslkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etWGX5ji; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etWGX5ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773738703; x=1805274703;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=9zNCeRL4GHsn8w3mMwSC4KppE3LMlMGCnO3EZnFdpJA=;
  b=etWGX5jiqeyDznvgB0hZ7GpBa7fBNqBD6sJWONLlIMJGSgsD9FahlH5n
   M/Rmx+XnQfc3ViS80xQg9yNMvXGbtt17vwovR18cKboai5QixR+sdq3ST
   WatspBHlikl+Ce8AbsAD1d6tgCgIJomOL+GYEbsUeGiDoiFdLG+P1DWsQ
   OkoPpIxH7eigYeMOE3p+4KI6gnBlRLMvU00D1+9vh6tWj1sCR9K7oMZBW
   vvXrYC10CSYRQtLejNL8hRd/XoM2jmeSUPvxJeILutYkkqz4RZKXp+0IN
   GTcSn7B6BMO0ueq4N+GRlE974gD6f1AQIa/01mFRQUwn/3mk3R+YTMW5p
   g==;
X-CSE-ConnectionGUID: aelSSArtTRGPzRccYlVHdQ==
X-CSE-MsgGUID: Jqy08LbaQkGEc4ta/0G4yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77375058"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77375058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:11:42 -0700
X-CSE-ConnectionGUID: MbmakDKiS7ahMLDOA3G1Ew==
X-CSE-MsgGUID: PdcyZTnyQ2OAOcRNOH1h6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252696645"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.84]) ([10.245.245.84])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:11:40 -0700
Message-ID: <52c48bf9-7fee-4c87-bf06-a9a7ebc8536f@linux.intel.com>
Date: Tue, 17 Mar 2026 11:11:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs42l43-jack: Remove manual pm_runtime get/put from
 tip_sense_work
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, linux-sound@vger.kernel.org, stable@vger.kernel.org
References: <20260316124924.31047-1-peter.ujfalusi@linux.intel.com>
 <abgTWxI1Q9M1o+ka@opensource.cirrus.com>
 <d5353ee4-1a3f-43a6-93ed-5127d666ad0b@linux.intel.com>
 <abgyboHV1jaWDUul@opensource.cirrus.com>
 <f461ba8a-4208-4dfa-aa70-e2c85ec2050a@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f461ba8a-4208-4dfa-aa70-e2c85ec2050a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/03/2026 08:21, Péter Ujfalusi wrote:
>> Fundamentally reseting a device right before checking what state
>> it was in is always going to be hard, so would be awesome if you
>> could have a look at how much of a problem removing that bus
>> reset would be.
> 
> I'm still not sure if I get the whole picture, but by the hints it looks
> like that on systems with cs42l43 we cannot suspend the DSP since the
> codec cannot be suspended?
> What is the difference between detecting the jack insert compared to
> detecting the jack removal and/or the HS button detection?
> Under the hood it is the same soundwire wake event then do what needs to
> be done to read the cause of the event, right?
> So, why it is OK to suspend the DSP when the jack is not inserted and it
> is not OK if it is inserted?

Using UI shows what you might be referring to.
with the codec powered on and pressing the button:
snd_soc_cs42l43:cs42l43_button_press: cs42l43-codec cs42l43-codec:
Detected button 0 at 8 Ohms
...
snd_soc_cs42l43:cs42l43_button_release: cs42l43-codec cs42l43-codec:
Button release IRQ

when the codec and DSP suspends when audio is idle:
snd_soc_cs42l43:cs42l43_stop_button_detect: cs42l43-codec cs42l43-codec:
Stop button detect
...
snd_soc_cs42l43:cs42l43_start_button_detect: cs42l43-codec
cs42l43-codec: Start button detect
...
snd_soc_cs42l43:cs42l43_button_press: cs42l43-codec cs42l43-codec:
Button ignored due to bias sense
...
snd_soc_cs42l43:cs42l43_button_release: cs42l43-codec cs42l43-codec:
Button release IRQ

and the first button press is ignored  - which wakes the DSP, soundwire
and codec up

So yes, there seams to be an issue with the headset button handling here.

> 
>>> Even then there is the issue of unbalance in runtime get on module
>>> removal when the jack is connected...
>>
>> Yeah that is a good spot, if we stick with the current code I
>> will get that fixed up.
>>
>> Thanks,
>> Charles
> 

-- 
Péter

