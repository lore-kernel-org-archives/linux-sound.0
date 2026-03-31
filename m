Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505E3A381F
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953770; cv=none; b=paaiGp12cPRP1wFM0GB8WKFGt7LIAqhLS9SphgfidFstWTq7u+fOCGeAhumsQBmhu2sQA6xfv7thnHFQwW3vWOOBPlpu6P/a10B2Sg8BzrLGsZhfAgIw59IQCGofb+c4zKDfGweC+QF1Iriu8yIa9RlVB8sEQMacUWDeDmb7c9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953770; c=relaxed/simple;
	bh=4j+xpLGVS8SWxR8qK58YPeKfoNjHd4nUWFjd8/QcM90=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=A2Oozz5DPaWwrNKZMe3hmu3HOxoIH4+GTR065v1gK+y3ZAk4f9xSJyWGLn3V+Vn167ZZesWpWKWMU4h2+6KHbT9rU3HDEfv0NGoQ17xa4IRQHVigmujQO0L4vIF9vNGjjh62Evh30k7KsE40uwThv8+NSIJGR11baOxW3Y9CjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxGHJ8Ck; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxGHJ8Ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774953769; x=1806489769;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4j+xpLGVS8SWxR8qK58YPeKfoNjHd4nUWFjd8/QcM90=;
  b=BxGHJ8CkHItaphX9/Gjj3+SOBf8XZMILH69vtiWlkJzA19MKPFPGtFyb
   n9joF3qi6xQuKO4THP4q/a68xBQBldtIKuAW19PfijL9jCTY5Br3CAHgK
   tJeqessdKshFTbp9o7ZZdMGkhv9/9ZOVs1hHPMLduoujuqKFLbJR2pFZv
   8Dd+8mQHIO9ukcsZlujiYc/UPTW4BhDSdVAgkjP1JM3m0VjACvzfxMpfp
   CaIRWvnIEkzzQkc+nckdHO+Jbc0ffe1jjHgnqLisdy1AbJN6k+Dgwdt1c
   6BQrpIE9moVnTT7+2E/wOeEMc5AzpOTlmdC/MlYvpXv7WmvXzIb6Lhw7T
   Q==;
X-CSE-ConnectionGUID: rebSkV03QKiYJvrEHquOSw==
X-CSE-MsgGUID: APooR5dBReaD6mO9MkBFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86657059"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86657059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:42:48 -0700
X-CSE-ConnectionGUID: qWKtq/uHRs2xP1J0RGZLrw==
X-CSE-MsgGUID: 8YD4GSSTQvOV0blXn973UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226580018"
Received: from slindbla-desk.ger.corp.intel.com ([10.245.246.72])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:42:44 -0700
Date: Tue, 31 Mar 2026 13:42:28 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>
cc: Takashi Iwai <tiwai@suse.de>, 
    =?ISO-8859-15?Q?P=E9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
    Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
    Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
    Linux-ALSA <alsa-devel@alsa-project.org>, 
    "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io, 
    wim.taymans@gmail.com
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
In-Reply-To: <88979231-caef-4eaa-b89d-22e6973c92f9@perex.cz>
Message-ID: <1f08dea9-f117-ea7a-c9e2-cc163dedb770@linux.intel.com>
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com> <87se9htms4.wl-tiwai@suse.de> <67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com> <87ikadtgpe.wl-tiwai@suse.de> <dadef18b-1c2e-4c0d-8ae8-2e4b8ad75d04@linux.intel.com> <878qb8tsib.wl-tiwai@suse.de>
 <88979231-caef-4eaa-b89d-22e6973c92f9@perex.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hey,

On Tue, 31 Mar 2026, Jaroslav Kysela wrote:

> So, perhaps, the only flag may be added notifying that the (first) minimal
> period is processed immediately after start. It's also common situation for
> other drivers with double buffering in the driver like USB, maybe FireWire,
> right ? Note that this flag won't be the BATCH flag. Or we can just add a
> field notifying how many minimal periods are queued at start to be more
> universal (apparently SOF requires this, because the initial chunk of queued
> samples is bigger then the later chunks - so the first transfer will go over
> more periods).
> 
> We may discuss if small periods are efficient. We have already mechanism to
> disable period events (SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP) and drivers don't
> do usually deep buffering, so they program DMA transfers with smaller (or
> equal) chunks than period size.
> 
> It seems to me that we are trying to design another layer on top of the
> current just to satisfy the improper current PCM API use.

btw, I think this is a bit of a chicken and egg problem. Hardware may have 
deep buffering capability, but it's difficult to enable via ALSA without 
breaking applications with current interfaces (and how they are used).
There could be more drivers that enable deep buffering if the semantics
were clear.

E.g. with SOF firmware, the buffering behaviour is completely 
programmable. E.g. we could have a 100ms buffer between main CPU and the 
DSP and still report accurate delay with snd_pcm_delay(). In most cases 
the FW support is there anyways and one could enable this just by 
modifying the DSP topology file (which is basicly an alsaconf file). The 
hw_ptr will move in bursts, and will move faster-than-realtime at start. 
And it's important to note, to maximize power benefits, the exact size and 
timing of the bursts may be driven by what else is going on in the system. 
The audio DSP of course knows what is the maximum size of a burst (as the 
DSP needs to have local memory to receive the transfer), but we can't 
guarantee the acual burst (as seen as hw_ptr movement) is always of the 
same size.

We do already honor period size configuration set by applications and SOF 
never allows DMA bursts to exceed period size.

But once we increase the buffer size beyond a few milliseconds, 
applications start to break and we see the interpretation of the ALSA 
period semantics becomes less and less clear.

PS The DSP code that decides on DMA reloads in SOF (this is called every 
1ms, hd->dma_buffer_size is buffer towards host, this can be tens of 
msecs):
   https://github.com/thesofproject/sof/blob/main/src/audio/host-zephyr.c#L570
   .. this is common code in SOF, not specific to any one vendor.

Br, Kai
