Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46361C860C
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722431; cv=none; b=qNeWcqoLBCqcLDSoBlTU09s/0Q7WjgnC2Ud0ZTFuMHu9x2FhzAWI6afQrzBz8MkETvY3gUwIyFgkR3tTtvTm3riYwO0RfK35qRX5JWrHtatDs8jXcNwdCfLxwiLv3eL0EE09+9an9N1kYyTkKAupymrIn148cfw0IA1a3PKJWxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722431; c=relaxed/simple;
	bh=KuLkxL7pIlaLGq72vXCfJgFxQ/plPTpvUosI7lr0SQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PH4f+gFy9HiID+1B3pA24iET2Ix8fDDevVXfDIV6yLZKznHEcd20dG+lWWeA8UnQl6u2jgpiWHD+dOaDfP+Jd3ejTHiokmzqR5QEs/gvDf23knCm+sSplAvZDNRuGWIgwKHEYJktqJ4jiWv+ooEiMNvGhUY478w3kzmUaxGo0Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHnoftbS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHnoftbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775722430; x=1807258430;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=KuLkxL7pIlaLGq72vXCfJgFxQ/plPTpvUosI7lr0SQc=;
  b=HHnoftbS0wjHORLdZ/fHqC+VQeNmMc4CUtAEuuh+9CK79ILUeoBagkKY
   kKqK3hOR4OHJ9gHBElNjIXHjF905cK0PqtVmqB0uKZBzS52IqPx62Ghti
   HC7wWULLU3e03reDqGxq13Xu8McuKXjVLy2mEiB0u3asmzRw6K+qLwXsI
   3tL3grhTCOQMLPOuudr9Gt44VFR2FPo/FmCFkn5VfavLHtyD5Thenf+y5
   k8E4iixh7a29MmKAhARKR+/HkJy+m4j01JB1ou3hz7TuZx2RNki5Fg05M
   AbKbYfTCbe+cRTq21ZvdPSuVG9NGAQ2UhJtqZgw+LBmscIZN1oyIAgd30
   w==;
X-CSE-ConnectionGUID: TX2vUU2hTCCl8vFzOQOptQ==
X-CSE-MsgGUID: EBDN7sgcQeWxrewg2LJ5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76624638"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76624638"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 01:13:50 -0700
X-CSE-ConnectionGUID: Qnlc8LkVQKmm8cm19UxUOw==
X-CSE-MsgGUID: 5UwXkDtlSUmCsMLr+Tg4FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="251848832"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.146]) ([10.245.245.146])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 01:13:47 -0700
Message-ID: <82c256e5-0af8-4ea3-ba5a-913a576b25cd@linux.intel.com>
Date: Thu, 9 Apr 2026 11:14:08 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/3] ASoC: remove card->pop_time
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/04/2026 07:36, Kuninori Morimoto wrote:
> Hi Mark, OMAP member
> 
> I'm now trying to cleanup snd_soc_card, and noticed that card->pop_time is used
> only from OMAP1 board-ams-delta.

The pop_time is an amazingly good tool to debug pop noise and is mostly
used via the debugfs.
You set the pop_time to non 0 and DAPM will 'slow down' and you can
identify the step which produces the pop.

Please, don't remove it!

> 
> card->pop_time user drivers are...
> 
> 	> git grep -w -l pop_time sound/soc include/sound
> 	include/sound/soc.h
> (A)	sound/soc/codecs/cx20442.c
> 	sound/soc/soc-card.c
> 	sound/soc/soc-dapm.c
> (B)	sound/soc/ti/ams-delta.c
> 
> Except ASoC framework, pop_time user is only cx20442 (A) / ams-delta (B).
> And board-ams-delta (Z) is using it.
> 
> (Z)	linux/arch/arm/mach-omap1/board-ams-delta.c
> 
> 	static struct platform_device ams_delta_audio_device = {
> (A)		.name   = "ams-delta-audio",
> 	};
> 
> 	static struct platform_device cx20442_codec_device = {
> (B)		.name   = "cx20442-codec",
> 	};
> 
> 	static struct platform_device *ams_delta_devices[] __initdata = {
> 		...
> (A)		&ams_delta_audio_device,
> 		...
> (B)		&cx20442_codec_device,
> 		...
> 	};
> 
> With off-list talk with Mark, this card->pop_time is is much less of a
> problem. So let's remove it. But it needs Acked-by from OMAP1 member.
> I added [RFC] on Subject.
> 
> Kuninori Morimoto (3):
>   ASoC: ti: amx-delta: don't use card->pop_time
>   ASoC: cx20442: don't use card->pop_time
>   ASoC: soc-card: remvoe card->pop_time
> 
>  include/sound/soc.h        |  2 --
>  sound/soc/codecs/cx20442.c |  3 --
>  sound/soc/soc-core.c       |  3 --
>  sound/soc/soc-dapm.c       | 43 ------------------------
>  sound/soc/ti/ams-delta.c   | 67 +-------------------------------------
>  5 files changed, 1 insertion(+), 117 deletions(-)
> 

-- 
Péter

