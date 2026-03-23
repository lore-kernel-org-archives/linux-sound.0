Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2B3BE62B
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282602; cv=none; b=C1DRqVtbSHaOAEwDPZbDO6Ax6ql92O2LKP0cmcGa/k0RRGBNjRRuseqjzmej4HxihIV9koV/Y7tGwNAaBus/HuO+s7Dx7I4t7hoO7OvZVZ6eCsO9Q99n6A93WcXHMnc/ZT1mkhP0dARG37lV7S/qbF2UrLdoXWIRVoYAinJ0LqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282602; c=relaxed/simple;
	bh=3hwIS+zPCLF5vniCygeT0FvF1Fbn5HwfJaoUULVHv8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXi1wFm/E+rZThNttnMqH4j1QlygIK8VCI6NOHl77MoC5Ph9UkEXvjaOGJI+bfy7UDWIu8/MyC0ZmqsUKg9w4HJmJQfLqy8WpMqFnF7qrS0qMxEIzO7U6LjX2b2aC8St3Z3Zau7dG6ePiZtpy420dv/SBk4qVJjWb3s2AqIf7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtRjbgXq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtRjbgXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774282598; x=1805818598;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3hwIS+zPCLF5vniCygeT0FvF1Fbn5HwfJaoUULVHv8w=;
  b=MtRjbgXqImuylp5KEEWo/Bz4E7efhr9CVzDp2rGQJvQ+2Izw5mhwtnSZ
   qVZcaxm3MCy/XPgml06bQr4uycQzHSCT7lWag3MObSG7iR4AVzu8o5a4k
   bZSNdvspb7w40NSf34edyPBgIjHmt7vRH3qy4CYyNygefKFC8juXkwdkq
   0jpAAh1CMu3axkRJIOYcUpoO3DiS3AROUV7IW4sRfMRAF+/o2y5+4/pPI
   xSnqKKqQUgJ4lpGS8IVvG9Ddp0MKmDQlYQfFhFfFm40hPlK0j4YjCN94I
   ap0yEZGOBpLY0dmzRA95EZlwcug6VSR7ZL8HzL8Zb2CsUAA1u9ER8+OgA
   w==;
X-CSE-ConnectionGUID: EyLnydZvSneUC+f3De1hHA==
X-CSE-MsgGUID: 2LTjJBhlQ8KG2ShccvXkFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78881714"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="78881714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:16:37 -0700
X-CSE-ConnectionGUID: g/nGMyQVSX6hNJiwE2B0zQ==
X-CSE-MsgGUID: PiHb+PFGQyu+4CeuaRI2JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219228521"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.12]) ([10.245.244.12])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:16:35 -0700
Message-ID: <8fe7f61b-dae4-4ae6-aa96-7e604a37e624@linux.intel.com>
Date: Mon, 23 Mar 2026 18:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <c521e0d9-4d69-4fd4-9c29-bb9b62c93310@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <c521e0d9-4d69-4fd4-9c29-bb9b62c93310@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/03/2026 16:54, Jaroslav Kysela wrote:
>> Or should we add a new member (carved out from the reserved section of
>> hw_params struct) specifically for this purpose, like dma_burst_size,
>> which likely going to be equal to fifo_size if both is filled by the
>> driver.
> 
> I would not change the fifo_size definition at this moment. It's not
> directly related to the sample transfers. This value just describes the
> additional latency for streaming.

Aren't we have the delay reported for this reason, which is actually in
use by user space?

> The new member seems like a good way to go with more universal name like
> 'chunk_size' (in frames) defining the transfer granularity information
> for the PCM buffer I/O.

right, but (I think these are the main issues that blocked any progress
on this) this is not really about the chunk_size, it is telling user
space what is the safe distance from hw_ptr to modify samples without
the DMA jumping over the area.

I know how SOF and tlv320dac33 does this, they have one overlapping and
one-one different modes

A. nSample mode (SOF with bigger than 8ms host buffer or dac33 MODE1)
initially fill the FIFO, then when only threshold amount of data remain
in FIFO, read N number of samples then wait for the threshold to be reached.

B. keep full (SOF with less than 8ms host buffer)
initially fill the FIFO, then whenever 1ms is free, read 1ms

C. two threshold mode (dac33 MODE7)
initially fill the FIFO up to upper threshold, then if the low threshold
is reached start reading data until the high threshold is hit, then wait
again for the low threshold to burst again.

The initial burst for A and B is equal, it is the size of the FIFO, in
case of C it is somewhere above the upper threshold as while filling the
FIFO there are samples played out, so it is a moving target, sort of.

But consequent DMA activity is different:
A: it is nSample, which is smaller than the fifo size
B: it is 1ms
C: something about the diff between the two thresholds

There could be different FIFO and burst setups out there, but in all
cases the fifo_size is something which is a hard safety limit that
applications must be aware of.

Fwiw, ASoC collects the delay from CPU driver, codec driver and also
from platform (DMA) driver, while the fifo_size never been configured,
afaik.

And the fun comes when we give numbers to these! Let's say the FIFO is
100ms long and we have the low threshold at 4ms (start DMA when only 4ms
left in FIFO).
A
start: read 100ms, wait
after 96ms read 96ms, wait
after 96ms, read 96ms, wait
The hw_ptr after 20ms after the start will be at 100ms
The hw_ptr after 70ms after the start will be at 100ms
The hw_ptr after 100ms after the start will be at 196ms

B (theoretical as SOF only uses this in 'small' FIFO case)
start: read 100ms, wait
after 1m, read 1ms, wait
after 1m, read 1ms, wait
The hw_ptr after 20ms after the start will be at 120ms
The hw_ptr after 70ms after the start will be at 170ms
The hw_ptr after 100ms after the start will be at 200ms

C
More like A, with reduced fifo_size, but that is a variable size.

Application must keep 2x fifo_size distance initially, if you plan to
check back in fifo_size time, B will be at one fifo_size ahead already
for examplem, but with A if you check at fifo_size time again, you risk
to race with the coming bursts, so you should not poke too close either..

My idea is to tell user space to keep fifo_size of data as minimum, but
initially this should be 2x fifo_size. How to document and do this is
still not clear, but the only thing the driver can tell: this is my
fifo_size, I burst based on this number.

And I'm really bad at naming things ;)

-- 
Péter

