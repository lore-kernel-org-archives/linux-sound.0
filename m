Received: from mta0.migadu.com (out-108.mta0.migadu.com [91.218.175.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DB41D652
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985344; cv=none; b=G4GNQ9S9di2fty9RpFVYoqyEYSkJS9wFIg6g76ZyKdB8zllC7sXmNZMS+vXmXRypVO+QDQ6sJefqZFPhKi3TT0qMn3ZvPjYiIIc2reMJQYw54VQesniuunEnB45WJcqz3w6HnUwnzVXTJZ3GOpDjBkJK5v7554JSwPLc4Ryy/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985344; c=relaxed/simple;
	bh=cu3Jm7QmCMbLfHFVPAr0burQXfHT7lvirfauiXYobJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utrrHsIZahjVM+UJN9RWG2SdQsSFMumk0F9sUq5C+T+VdvtB0j7gq75o19mCTUU0h3RLMFzM3MyPioylJVCClJj3NzmsOdeMQdf4tgbu2ifFo37tuehmKoYiknnUlitXEyZwa3eh/NGACQUvFDSwWOSgf3MzifsylVLdPQZKer8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xKIRKDtV; arc=none smtp.client-ip=91.218.175.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xKIRKDtV"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cu3Jm7QmCMbLfHFVPAr0burQXfHT7lvirfauiXYobJk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788985332; v=1; x=1789590132;
 b=xKIRKDtV8pfYWfj38MeShfbOoAsgFHgyBeRJ21WFUJo0Xx+F3eK2OEKaEuUXsR+/e9ZT8JC6
 r2+dXx/1ZvjuVYs+ZLjRO6RO5GUqHOXdjYTD5R9SBnSy0By3hSd2FDgx5kYRjXo0qNfEnnB3/va
 wCTv1z1kfpz7sDUG1hmB7TWc=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 038407f55bc34093;
	Wed, 09 Sep 2026 20:22:12 +0000
X-Mizu-Trace-ID: 038407f55bc34093
X-Migadu-Flow: FLOW_OUT
Message-ID: <e0ca888d-6607-47b4-a470-564c34cfa0cd@linux.dev>
Date: Wed, 9 Sep 2026 22:22:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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
 <9b2eea34-a04d-4124-8f76-ebfde6df67fc@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <9b2eea34-a04d-4124-8f76-ebfde6df67fc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> I see, the issue is that I cannot find any way to give the metadata to
>>> the decoder module, it is a black box to us.
>>
>> The metadata is typically handled *outside* of the decoder library by a
>> memcpy-based wrapper or modulo pointers.
>>
>> For example due to the filterbank, the decoder will generate N zero
>> samples in the first frame. If you know the value of N thanks to the
>> METADATA ioctl, you can discard the first N samples in the wrapper.
>>
>> Likewise at the end of the track the wrapper can skip the last M samples
>> which were padded to make the initial soundtrack a multiple of the frame
>> size (e.g. 1152 for MP3). the value M is the encoder padding.
> 
> I got this part, but I have no idea how the wrapper could know this.
> It can be only _after_ the decoder to do the fade out/in/mixing, but so
> far I have not seen any way to actually pin-point the exact time.
> And not just exact time, but T minus something to T plus something.

It's not time you need to track but bytes, and the accuracy of the
next-track position is exactly a byte. If you're off by even one byte,
you probably lost a minimum of one frame until the decoder re-syncs for
an elementary stream, and the whole scheme is down the drain if there's
a header.

Also the decoder has to in a wrapper anyways, even without gapless
playback: the fragments used by the compressed framework may contain
more or less than a frame, so the decoder needs to deal with all cases
of 'no enough data available' and 'more than one frame provided'.
Likewise some decoder may not be able to generate data on initial calls,
and need to be called without new input to full internal PCM buffers.

then the logic should be:

(a) On a new track, for the first decoder you skip the first N samples.

(b) The end of track happens when all the bytes have been provided to
the decoder, and the decoder cannot generate more data. At that point
you would discard the last M padding samples.

(c) if there was a NEXT_TRACK, eset the byte counting for the track and
go back to (a)

That's the high level logic. Now for the positioning, I may be wrong but
I think there is a requirement that the NEXT_TRACK is only signaled when
all the bytes for the current track were provided to the driver. So on
the NEXT_TRACK you would need to record the number of bytes provided so
far by userspace, and forward that information to firmware. Then the
next write would be with the content for the next track. It could also
be the PARTIAL_DRAIN that does this, since at that point no new data
should be provided by userspace. Either way, do no write data in the
ring buffer until the firmware knows the total number of bytes in the
current track. If the app doesn't respect that then the accounting will
go sideways.

The last time I saw DSP code for this was in 2013 or so, take this with
a grain of salt. Vinod, if you have a better memory please do chime in...

>>> Also I'm not sure how the fw could get any idea where one
>>> flac/vorbis/aac/mp3 ends and where it starts, the black box does not
>>> seam to be able to detect this or if it does, it will not emit this
>>> information to outside.
>> I must admit I don't fully remember the details on the start/end
>> position. IIRC this isn't strictly required for elementary streams such
>> as MP3 or AAC ADTS, you could cat the streams together and that'd be
>> just fine. you would have a slightly different transition by blending
>> the two streams in a common filterbank history buffer but that'd be
>> nearly impossible to detect...
> 
> and there is still the monitoring of the progress of let's say 6th track
> in the stream.
> 
> I was planning to revisit this sooner than later when I have a moment of
> 'free' time, but for this initial series, it is not promised and should
> not work at all.
> 
>> But for streams with a header such as WMA not sure how this might work,
>> I think you do need to know the buffer position, reset the decoder and
>> restart from that position.
> 
> Luckily no one has such files anymore ;)

Hehe, the Zune music service only stopped in 2017...
