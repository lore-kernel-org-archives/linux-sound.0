Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9D29BDBB
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336342; cv=none; b=OvFXeSpKOPgY1WBA6bQDBT890xP/vmArAGx28daS1JKR6BI+F1ip3V1j7bJJ7ncCiARjUB5eoyxvlpDw2ebqEJ8imN1btxFveWFU0ZugMMJbMArPhBo8LTtfatQnZDGMFSmjRacWCzdPk4SjhQXpE6IcvKg3KkgryTOdHghCVpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336342; c=relaxed/simple;
	bh=XRacGBV8OYXae8LlOvhWtDtbl1mY0BWLksV3lr+az5s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TMNdvh1n+jJ278qK3ITcPHQI1r3UFS/7Yelb8Kkbc19qsdeH47WXoEaChJJbGIpiB+3FO3Lpykw85Ba9ZI3IpAVvQ/bgbiI3WvZSnJkUC2amZaQm5ONwuhpHyPaWa+cYmBzrJ8eoQEkcjdrsWtMxRvCv4FGdy4u5Qkug7yB1ES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqwND5dI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqwND5dI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774336334; x=1805872334;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=XRacGBV8OYXae8LlOvhWtDtbl1mY0BWLksV3lr+az5s=;
  b=kqwND5dIlgGtltOo1A0yODP+JtKapCrEF/K2jv3S7HusJ4E7nXnGUnHv
   eCatbOSkEovO8TuNDoGVFfwlYZN0mJJsqwa3QUTdEYRQF8EHxMn02zLhQ
   zblVhxHvBDfN7G49JU/rcDtkCwOxRfMPmbB/HKcCxbJIHkrU0tQZs3cBM
   k4rVdN1wpm7hthGaJu2yvFr6eXEQfrbjWyNCxHogxFsuARbi45YvvN9W0
   rfeEcXoPWC8sNGJwrDaHbBy6VxITYeYfSj6hEt0RaZi1/uvYeJE9wn5WT
   qIIbcsPTdu7uEDwwVJl/mkT1H63FpjHSbFVMCFBEuuTqbOq0yhCZzzLJM
   w==;
X-CSE-ConnectionGUID: JIK/9+I5T92/7mWGa1EN4A==
X-CSE-MsgGUID: ir7WddU9QTmAAsKrqJyfUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97964244"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="97964244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:12:12 -0700
X-CSE-ConnectionGUID: dlnejzdxQj6eDFbAvv9fGQ==
X-CSE-MsgGUID: 5TsicKkjSVWtiKBj6cZpnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254753048"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.138]) ([10.245.244.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:12:11 -0700
Message-ID: <c3867377-28bd-41c9-9a03-f646bea60704@linux.intel.com>
Date: Tue, 24 Mar 2026 09:12:27 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
Content-Language: en-US
In-Reply-To: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/03/2026 15:34, Péter Ujfalusi wrote:
> Hi,
> 
> for years the discussion around jumpy, bursty DMA have been popping up
> and we always concluded that we are missing a good definition and agreed
> way between kernel and user space to handle this.
> 
> In ALSA it is expected that the DMA (hw_ptr) moves in steady small
> steps. There is a BATCH mode which tells that the DMA cannot report sub
> period size position, progression.
> The DMA bursting fits neither of this, it moves in bigger jumps (bursts)
> and it can as well can report position in byte level.

I think it worth explaining why this came up again...
In SOF we have a concept of DeepBuffer PCM devices for which in topology
one can specify the size of the host DMA buffer size (this is in the
DSP), this is where the host DMA transfers data from ALSA buffer.

side note: The DeepBuffer PCMs are not used in Linux (pipewire for
example), so no immediate need

I'm changing how it is working in a fundamental way with
https://github.com/thesofproject/linux/pull/5673
from static to dynamic allocation.

The current, static mode is really simple: in topology the DB is set to
let's say 100ms and the this is how it will be configured.
For applications I place a constraint on the minimum period size to be
100ms.
Since Pipewire does not care about period size, but it needs to provide
at least DB size of data ahead of hw_ptr we have a temporary way to use
the minimum period size as headroom:
https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2548
This avoids xruns in PW and most ALSA applications also work fine.

But the change to dynamic mode will render the PW 'guessing' broken:
In dynamic mode the DB size will be configured based on the ALSA period
size, but caped at the DB value from topology. If DB was set to 100ms in
topology then this will be the maximum size of the DB, no matter how big
the ALSA period size is (see PR5673 for some numbers on how this looks),
but something like this:
ALSA period:    8 -> dma buffer:   4 ms
ALSA period:   10 -> dma buffer:   6 ms
ALSA period:   16 -> dma buffer:  12 ms
ALSA period:   19 -> dma buffer:  15 ms
ALSA period:   20 -> dma buffer:  20 ms
ALSA period:   50 -> dma buffer:  50 ms
ALSA period:  100 -> dma buffer: 100 ms
ALSA period:  150 -> dma buffer: 100 ms
ALSA period: 2000 -> dma buffer: 100 ms

Legacy applications should be fine with this, but PW still needs to
figure out the headroom andthe min period size will no longer aid that.

If we want to enable at some point the DeepBuffer PCMs for Linux via
pipewire, we need to have a way to communicate the DMA behavior.

I'm not keen on staying on the static DB as I see it as a limiting
factor. If we want a PCM with 200ms buffer (for audio playback) and we
want shallower one with 40ms for calls then you would need to have
separate PCMs and the period size would be constrained, so it is sort of
a headache for user space, while with dynamic DB you would have freedom
to use these as you wish and also benefit the power saving of the bigger
period sizes.

-- 
Péter

