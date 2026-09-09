Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA653FD2B
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961997; cv=none; b=GA/kQw5tFd1dRj9TYgJgw9qCeAyGV4etYaAng0R1WwYXexGbOvqY4+rXJqY6TIvP4N0WD0BG778fP/if8gytYurD7tZmG0mZTOMOUvA9RhHroRCN4/UXKxvuGGvyMCNXYUlnMsFT0tuOAdMonv30gtTWolUJcSqLVnkdzS+m9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961997; c=relaxed/simple;
	bh=clHv+5MdGzCyQc1/qdfqerXhaNr3BVXMXEghFYYfB7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSqdCRD7dz5fjjZCBWmSHbfEdOLgrKnQc7hPIuT7/oaPniegvRtSkSknnlEnMPxbEiPoz5zjdoH6qmAlOX0XOC3vStMd1UCgZtdAQLUdpCxO4sPWX0EkSRPkWdty1QHw7JmprmEe941xEi4RrIbMgZ6LaHUf6+p5ot95HE9t82c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEIZkAMY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEIZkAMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788961995; x=1820497995;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=clHv+5MdGzCyQc1/qdfqerXhaNr3BVXMXEghFYYfB7U=;
  b=ZEIZkAMY+23Rz5AXXBA+ay8yh4qIarwVhNndlqA87P6wC0vo4dlaOIOF
   TF4JzFslxvKpt4OJI+ukCoB1g/j94GqzWk9RxmEPCymudvA+Y79FftqJY
   VfXypw5C2SJ2c3rioF5TJzzKizGDYWVqsvs3/OORo45OI1PeFK6acL6Rv
   x9W+1CIaRtvLHxALfgd43L1faS5HFPpjtLHkM6M4motx6sV+fmYq9H9L6
   IQAJ4u7hA+IR/HfP8dkAoHgRWTGF9jXBnxUbLu7c6rbACXz7+k6HHIH2n
   AXiCApPvZT/bGxkBhyce12tQTRDNOOTogtrACcnABTpGumXNpzFfmrdw2
   g==;
X-CSE-ConnectionGUID: Z3syW9ZBRuS1xCElRJfW5w==
X-CSE-MsgGUID: 2UuFIBJyRuqD8xh3etEMrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89407438"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89407438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:53:14 -0700
X-CSE-ConnectionGUID: zPoQD/RJTh6DmPLD9ehkpw==
X-CSE-MsgGUID: fdv1U0Q0SfOGekfUlPpxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268071605"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.252]) ([10.245.244.252])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:53:11 -0700
Message-ID: <9b2eea34-a04d-4124-8f76-ebfde6df67fc@linux.intel.com>
Date: Wed, 9 Sep 2026 16:53:22 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram> <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
 <aqABhbYne6RIree6@parshuram>
 <7f5625fa-d391-406c-ba75-4df526af903c@linux.intel.com>
 <e5f6d6a3-27e4-49ce-9340-9722380312a9@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <e5f6d6a3-27e4-49ce-9340-9722380312a9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/09/2026 17:54, Pierre-Louis Bossart wrote:
> 
>> I see, the issue is that I cannot find any way to give the metadata to
>> the decoder module, it is a black box to us.
> 
> The metadata is typically handled *outside* of the decoder library by a
> memcpy-based wrapper or modulo pointers.
> 
> For example due to the filterbank, the decoder will generate N zero
> samples in the first frame. If you know the value of N thanks to the
> METADATA ioctl, you can discard the first N samples in the wrapper.
> 
> Likewise at the end of the track the wrapper can skip the last M samples
> which were padded to make the initial soundtrack a multiple of the frame
> size (e.g. 1152 for MP3). the value M is the encoder padding.

I got this part, but I have no idea how the wrapper could know this.
It can be only _after_ the decoder to do the fade out/in/mixing, but so
far I have not seen any way to actually pin-point the exact time.
And not just exact time, but T minus something to T plus something.

>> Also I'm not sure how the fw could get any idea where one
>> flac/vorbis/aac/mp3 ends and where it starts, the black box does not
>> seam to be able to detect this or if it does, it will not emit this
>> information to outside.
> I must admit I don't fully remember the details on the start/end
> position. IIRC this isn't strictly required for elementary streams such
> as MP3 or AAC ADTS, you could cat the streams together and that'd be
> just fine. you would have a slightly different transition by blending
> the two streams in a common filterbank history buffer but that'd be
> nearly impossible to detect...

and there is still the monitoring of the progress of let's say 6th track
in the stream.

I was planning to revisit this sooner than later when I have a moment of
'free' time, but for this initial series, it is not promised and should
not work at all.

> But for streams with a header such as WMA not sure how this might work,
> I think you do need to know the buffer position, reset the decoder and
> restart from that position.

Luckily no one has such files anymore ;)

-- 
Péter

