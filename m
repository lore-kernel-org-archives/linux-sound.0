Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9614553B60D
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871060; cv=none; b=ElQKVkKqUzF8dwCJretOWdcpJGubkG6QrZJrnohxccL11A93B0MFrWMbqDb/uge0bkvNz4BDF55Ib+qSIZh1wkc0NreEBM2sU/MafUJeiyW8/mFgANDGwrnUBZoETgWWaKDs0VD/+i+qFpyNOdpdyFQ5DLueQOD4hZcYn3SDV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871060; c=relaxed/simple;
	bh=ijQg5HD77ktkSklUP8GRHVZPQZjewFcjuvNYH1ck3Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq/XIECibHIJVecEdNoLuxpqZJOX3OCraXlaLBZMz/Rjtoz44h2tOSpg16Svqq5vWbr/nb0yMHgYQ2ISP852MCdc3OWJD7KOdFoOdRj85q6PRweLIVjoJ3nOARvH/rREuwpT8mDFrjJXK/qmi5hm0PsRPT0YLB+/4y1XU59sigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kB+C+wsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kB+C+wsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6505E1F00A3F;
	Tue,  8 Sep 2026 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788871059;
	bh=G+iVpi1YCcAKuYsaTUSnV5MYRw6JSXWsLFFH3BL1jWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kB+C+wsTu3T/h+9PpfsuIoGhzJ/uc0MxgIK5o1Lu7A+KC6RSdKcvvJv8uoIrkAhPq
	 L2FYquwy5ZjJiTZmOve824NR18/4KY7kXT9i5xTkWGRmIccF9+ll4Nmm55F0Nx/rkh
	 FDI9kl5SwiGUlFq2QEXuZJcy1a6Qj9B6lZo8+f3wnbNAgyIy0EjRMwl0rOwbNArstl
	 ZkS6BGgkcw3AS2l/gAb9KcFmXRgLSBs06gq43Yr4KvtEYvSM+gvxAnGp4Ok2q+5p0r
	 /DAPdEc92iXvnmEDg3EoP98nqJX1QrVSPf3ef0XnhDwU8SfE+btT4v6jZuCAji+4Bo
	 qz1Xi41yQrhQQ==
Date: Tue, 8 Sep 2026 18:07:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
Message-ID: <aqABhbYne6RIree6@parshuram>
References: <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram>
 <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>

On 08-09-26, 11:41, Péter Ujfalusi wrote:
> 
> 
> On 08/09/2026 09:58, Vinod Koul wrote:
> >> The only 'documentation' for the gapless (next_track + partial_drain)
> >> that I could find was the fcplay (and that could not have been worked
> >> (metadata and next_track was in wrong order).
> > 
> > Please see Documentation/sound/designs/compress-offload.rst, it has a
> > section on gapless with SM as well.
> 
> Thanks, for some reason I missed this, looks pretty well defined and
> written!

Thats okay, glad that you found it useful

> 
> > 
> >> But, reading the code it implies that gapless must support anything
> >> thrown at it in any order as for consecutive files:
> >> metadata
> >> next_track
> >> set_codec_params
> >> partial_drain
> > 
> > It was supposed to be in a specific sequence. See the sequence in the
> > documentation.
> 
> The documentation confirms that the fcplay was incorrect:
> https://github.com/alsa-project/tinycompress/commit/7d41dc4bcd39a1b2c449a6f87e827bdbd84d1213

OKay, feel free to send a patch, we should be consistent with above
documented behaviour

> 
> >> With IPC4 the NOP strategy works (just streaming the files without
> >> stopping, but they mus be of same format and property), but then you
> >> loose the position, so not so great.

I wanted to ask earlier, whats IPC4?

> >>
> >>> Note that the NEXT_TRACK only works if the two consecutive tracks have
> >>> the same format, if the platform wants 'perceived' gapless playback with
> >>> a x-fade then two devices are required.
> > 
> > Yes, same format always. Codec can skip the trailing and leading zeros
> > in that case. two different formats would need code switch/code setting
> > params, so it wont work and we would need two devices to x-fade as you
> > rightly pointed out
> 
> gapless looks to be straight forward fort he first look. What made me
> delay the implementation was the fact that I could not find any way in
> firmware to support the metadata as one - OK, I can just ignore it.
> second: in kernel and in firmware I could not figure out _where_
> actually is the end of the current file in the buffer. In kernel we have
> circular buffer for the DMA and userspace just fills it and since for
> the kernel it is just data, it looks continuous.
> The firmware can detect the end of a compressed file, so I can sort of
> support the drain and partial_drain but to get this whole thing working
> was just not something I could do blindly.

The kernel should view this as a continuous bit stream and wont know
EOF. Only firmware will know about it and with metadata, able to skip
those.

> Also: I have assorted ogg/mp3/flac in my music library and I tend to
> play them in random, which defeats the gapless.

You are a non typical users :-) To test this, we would same track in
album. A typical user would be running spotify with same format :-)

> The gapless support is not covered in this initial version, but can be
> added later.
> 

-- 
~Vinod
