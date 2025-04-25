Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1B1DC9AF
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745601269; cv=none; b=Fj9j0ZM8GtzuQOD8Oo3H8E6+peWNFTwSnj+XiBWSr5VzWHRunI/MQfi/L/JqU7/2+jxaGju5omMkWwHEDYIqNcJTRvBvKi/cai6NKDr1eq/6Ir1k6FdTRYQaScYEim1KDi3QLeqFO0hN/nmqrjGTvV/7Djonf0VPQDRpkGJOi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745601269; c=relaxed/simple;
	bh=RBMzeM9tJvuVDGfeEyOcUmqy7m5WIF//u9ooR1GJG0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loY3kETQctpNuhyshBFTD17IDNRerKMXFL5c9DCOSSINY756sWhcxRxHlImyKhxSJvCpI+bVyBZOQGQfSrkP5zw1btiYOs9qn225+/Qd8nFhenul7Q+vi5px37YicDqTrjpc2+diALNUgrnz+5UhjwgkksEwGN4297VlnUVRC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xkl/q4pz; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xkl/q4pz"
Message-ID: <323a9443-505e-451a-ba5a-38acb2c95f3c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745601265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1apAsbzSNVllJPm7ffOsuF66ITmZbx3KDWVRaC8OT4=;
	b=xkl/q4pzV1nPK0e5w+2C9u/lucvXj6XcqNH+tSrrvESB+V+2LhTRFdQZotkM5N0l7/0AAN
	nyH3/xLjXf8+g+scfT4hrQcyclL8ojfObxCmpDV1sRTc1qHnqYQ+LWlAgZuPdixT9wdmCl
	o+pCXJc9VrLiEZupqHfDvoAi+3Fmi44=
Date: Fri, 25 Apr 2025 18:53:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
 amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_wcheng@quicinc.com,
 mathias.nyman@linux.intel.com, Takashi Iwai <tiwai@suse.de>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <87v7rcwbyn.wl-tiwai@suse.de>
 <8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
 <87sem9xuxs.wl-tiwai@suse.de>
 <5f3c62e3-6993-4595-80fc-eb77c0c11f1d@intel.com>
 <a05a3419-8acc-47e4-bf06-8d87aca444cf@linux.dev>
 <6ae9b485-9c73-4a40-a958-8a72595278af@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <6ae9b485-9c73-4a40-a958-8a72595278af@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>> In regard to the HDAudio point, I see clear benefits by having HDAudio and USB aligned in the approach on ASoC side. It's a path that's known, works and is well tested.
>>
>> The current direction for HDaudio is to have the DSP handle ALL streams with DSP-enabled drivers (or none with snd-hda-intel).
>>
>> But for USB we absolutely need the ability to bypass the DSP when the resources are exceeded (too many endpoints, too many channels, etc), or when low-latency is required (lowering CPU utilization comes at the expense of latency).
>>
>> In other words, the USB solution MUST expose two PCM paths, a legacy one and a DSP-one, and a sideband communication between DSP and legacy drivers to manage resources.
>>
>> HDAudio has none of those concepts, which makes it hard to see what the suggested alignment is?
> 
> 
> Hi Pierre,
> 
> I see your point but the spec describes the exact opposite. The intention is to follow the Intel's software architecture specification for USB Audio Offload Link (UAOL). The high-level steps provided in previous replies align with the recommendations of the spec. The reservation of Audio Sideband resources and negotiation of audio format are part of that. There is no intention to offload every single USB device and the device is to be claimed for offload entirely or fallback to the classic, offload-unaware driver.
> 
> That design (UAOL) is known, well tested and proven on the market. It shares a number of logical flows with the HDAudio case and thus having similar programming on the software side both makes the code easier to understand and aligns with the spec's recommendations.

I don't know what specification you are referring to... We've consistently agreed with others that the use of the offload capability was a run-time decision left as an exercise for the application. The low-level details of the UAOL flows and IPC should not define how USB is used, they are a 'detail' that should be well compartmentalized in Intel-specific host configurations.

The main argument I would have to keep the legacy non-offload solution always available is that USB is the only solution for users if for some reason their DSP-based solution is not supported (missing or incomplete machine driver, missing firmware, etc). Forcing users to rely on offload is not a good direction, it has to opt-in for Linux distributions.

I should also point out that one key requirement is that the DSP-based solution does not degrade the quality with any asynchronous sample-rate converter, which requires firmware to be able to avoid working with the 1ms tick but instead adjust the amount of data processed per tick, specifically in the case of endpoints with feedback. If the firmware does resample with a TBD filter, then the performance of that TBD filter should be clearly documented. We had similar discussions in the past with MP3 offload, the expectation is that offload only improves power consumption but does not result in any quality shortcuts taken.
