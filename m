Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD4451A745
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879375; cv=none; b=WzpCbelFJF9iCUQPUu4OfglD9CFTO4Q/1vIFZUz+HkNwVLPIhPMAHemhcXxI5ajBKq0v5QkzFx9HTqh8Mj24P0UVOzwyl0gcasiAfLTSqH8XHPfHP1QL3vR3UAGXjr+QxeLm+Lrq65GWPzSZc4OtgHPzVUj6/tIWspgqPzrNydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879375; c=relaxed/simple;
	bh=6U8ZV8SEO3mlN9gCQI1bSyCz2rrBBGl0S6laYgZcDn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6u//5iLHnqf03DAHqgj10Bs6sEzQIMAxMgocyyWp40gX3ia5ty+ZrtKB9sxD67uBzrDxjUsI/Fa3hS46DmkDY5fPM5KWPQVogGt8hSTpyyPyEWa4/qER87u1al+x3upUVj0sC9OjRan6B6uoLu8GUfof0vqNQNHtw/B5dFKDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jc7L+LK+; arc=none smtp.client-ip=95.215.58.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jc7L+LK+"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6U8ZV8SEO3mlN9gCQI1bSyCz2rrBBGl0S6laYgZcDn4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788879365; v=1; x=1789484165;
 b=Jc7L+LK+H2k4ahe7ZQnkKlThHeskRnrWEWFsSu95n0um+8wwg5kQeeAKoU182ggxmqyptMiT
 +hQ8Eioio/2+hlwgCoUX65HlqUjrP/qFRVpTwzCqTNm32fRoCojjCJl3w1YA7kewvhBqHChH6u0
 AjnDZ3J6OCrzfC3ptB8JikgI=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4edf502799cf2d89;
	Tue, 08 Sep 2026 14:56:05 +0000
X-Mizu-Trace-ID: 4edf502799cf2d89
X-Migadu-Flow: FLOW_OUT
Message-ID: <e5f6d6a3-27e4-49ce-9340-9722380312a9@linux.dev>
Date: Tue, 8 Sep 2026 16:54:37 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <7f5625fa-d391-406c-ba75-4df526af903c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> I see, the issue is that I cannot find any way to give the metadata to
> the decoder module, it is a black box to us.

The metadata is typically handled *outside* of the decoder library by a
memcpy-based wrapper or modulo pointers.

For example due to the filterbank, the decoder will generate N zero
samples in the first frame. If you know the value of N thanks to the
METADATA ioctl, you can discard the first N samples in the wrapper.

Likewise at the end of the track the wrapper can skip the last M samples
which were padded to make the initial soundtrack a multiple of the frame
size (e.g. 1152 for MP3). the value M is the encoder padding.
> Also I'm not sure how the fw could get any idea where one
> flac/vorbis/aac/mp3 ends and where it starts, the black box does not
> seam to be able to detect this or if it does, it will not emit this
> information to outside.
I must admit I don't fully remember the details on the start/end
position. IIRC this isn't strictly required for elementary streams such
as MP3 or AAC ADTS, you could cat the streams together and that'd be
just fine. you would have a slightly different transition by blending
the two streams in a common filterbank history buffer but that'd be
nearly impossible to detect...
But for streams with a header such as WMA not sure how this might work,
I think you do need to know the buffer position, reset the decoder and
restart from that position.


