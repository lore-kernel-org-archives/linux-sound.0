Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C433F8D4
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883727; cv=none; b=uixK/Hwz6+0rfYtWImP/FvdADclCLrJQ0PYantM3o0DGal50Slb1ej4LkYENrO9eZrQKmI+uaQwho+evQH8M7Vvj7LGxywwjOPPzZfOgilJkoWIa7L4nWz8IbcB+0LD2Ys1GYRRgBvKsVBpt/M/b/i7p9aa46rbHlhJekh9Pl8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883727; c=relaxed/simple;
	bh=PKNUCePXCjzDc9dM2FdtEZ/Ozzr24NKKzl0tB2sVhlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGMOvjYQLoRRVfuJhyLckFHZKtYbBXNUn8lnvMTVN1mvaGNetn28yxGwpNdTrd95ljMRyOKWn42UBvJVA9Emn0AsnK+nXPhLwrj0GDJ6dK3dSKkFMHTu7KUvwfJjFvg2x5WpoAE8q96VILLJDveN4LAlh7FPVT45HtoJzZUg/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyofxwRj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyofxwRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774883726; x=1806419726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PKNUCePXCjzDc9dM2FdtEZ/Ozzr24NKKzl0tB2sVhlk=;
  b=jyofxwRjHmBSQVAIROrhPzPPRR7dn/Xe1SNK5CkVbbhmSEq8NtaT9wKF
   KPSqCGAjS+N0V3PfWr354aXYKGX9p4h+9mWlrq8piQ0wybZIuaiHvWFI0
   6EiQLWO0eTyKGbj1R8h2rR1L/4LGtIzTcUVwfCPVyRYyoSdfH8FGywV9z
   2pELZVUd2yj/T///CjganlIzr/Vg7EkVPSkIJoxYf/MDTG+ds2UREQ8RV
   ofLqqTrJAIkCEeylEHsEsJ3ijVVM4C7vwqPfWmeksNMRutMXLE/KSQwFE
   kFwMSb7W1DZqXzbIagPdUEJN0XB/+E4awStI8Rrd7N84SLuhJNkeYBdtD
   A==;
X-CSE-ConnectionGUID: cSSHCaeuTOaiXNBYES/MwA==
X-CSE-MsgGUID: yF/ZWtrRSbih3nXQ57ldHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79743161"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="79743161"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:15:25 -0700
X-CSE-ConnectionGUID: BVTVLSKQRBeOldDlGRWNkw==
X-CSE-MsgGUID: YFQby36KQB6V8g65YV0r2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230903400"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.70]) ([10.245.245.70])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:15:23 -0700
Message-ID: <67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
Date: Mon, 30 Mar 2026 18:15:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <87se9htms4.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87se9htms4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/03/2026 17:27, Takashi Iwai wrote:
>> https://github.com/thesofproject/linux/issues/5313
>> https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4489
> 
> Sorry to be late in the game as I was off in the last weeks, and
> slowly catching up.  So, I'm reading this thread from the beginning,
> and wondering what is needed from user-space API POV.

This discussion is stretches back a decade or so, few weeks do not matter ;)

> First off, we do already have a way to report a fine-grained playback
> pointer as "delay" even in jumpy hw_ptr updates as long as the driver
> supports it;

The delay reporting with the jumpy hw_ptr works great, most application
on Linux uses it (mplayer, mpv, vlc, pipewire, pulseaudio, etc).
Chromium's alsa_conformance ironically did not, but it is for some times
now:
https://chromium.googlesource.com/chromiumos/platform/audiotest/+/eccd8be776d45a2e3b3006d74f174ff216cb01d8%5E%21/#F0

> e.g. a few drivers for hardware with packet-based
> transfers like USB-audio support that mode.  Doesn't it suffice for
> your need?

There is no real way to express the jumpy hw_ptr, it is not really
packet mode (while in some sense it is, but rather not) and the BATCH
mode certainly not a fit.

> And, if a more different parameter is required and defined, how an
> application can use it?  An application can read/write PCM parameters,
> write PCM data (either via mmap or write/ioctl), and sleep/wakeup via
> poll() -- basically that's all.  Would the new parameter influence on
> the poll wakeup behavior?  Or who controls in which way?

The main target at the moment is pipewire in Linux, it uses mmap and
timer (no period wakeup) to process audio in the most efficient way. It
can fall back to non mmap and poll, but that comes with lots of drawback
in power consumption and CPU use.

We have the default configuration of SOF working now fine with it's
jumpy-DMA, which is:
4ms host facing buffer inside of DSP and 1ms DMA bursts every 1ms.
This translates:
when audio starts, before 1ms elapsed the hw_ptr will be pointing to the
sample at 5ms, 4ms has been sent to the DSP, when 1ms elapsed from the
playback, the hw_ptr is at 6ms, you can say that it is 4ms ahead of the
playback progress viewed in the host facing buffer of the DSP.
But, this 4ms is not the delay, the delay is a different thing, which
includes the 4ms plus processing path within the DSP.

The issues at hand is that we need to tell the applications about this
so they can work out how to manage the mmaped area.
They must provide enough data on start - 1ms is not enough as the DMA
jumps 4ms, 4ms is likely not enough, unless the application can be sure
it can provide more data with 1ms - when the DMA will move 1ms ahead.

I have other examples in later mails for different configurations.

This is not really about delay, it is not really fits into BATCH mode
either.

-- 
Péter

