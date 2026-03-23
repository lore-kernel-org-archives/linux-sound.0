Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BBF3AC0DF
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272842; cv=none; b=WkxIq31lmWVo7bbuSGARKAf3zHX60aK/FjT4YrwP91X4B5RbI+jxchkiBYmy7mTKIMfGDeTlW4vznLeHezvysHyg8xyC5676hxp0QEineCcdyL0ThzTW2IC/PIOikKw2Il1Jeot2o31Jo4UbCsNMJ2TNike8HD5R6PsAabYbGMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272842; c=relaxed/simple;
	bh=fJSe2c+5DKesNbsvyu7SGa5484mJci3yxmc25EHQhGA=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=LElfhp4X408EWl2bT8S2zvvX7KP0P2vB6SspBL7//W89tHDDwpNCMWxZ0DYvshVpt1O6TPmRrMW/uf49Dr/pOVNQ10V8JQkGKmeWzG2S5h6BQ+verH9A9bOn8hnATPsDo4p27Nb/zN1Wsn/Ng4UvcJaX6AVLVj+dZFKKw2bSkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1jiJkuN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1jiJkuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774272841; x=1805808841;
  h=message-id:date:mime-version:from:to:cc:subject:
   content-transfer-encoding;
  bh=fJSe2c+5DKesNbsvyu7SGa5484mJci3yxmc25EHQhGA=;
  b=U1jiJkuNL4dDqmYstgu15YTuwWzAl5mwU1uOO5CmEYPONn92jtqJwUcg
   JMnFVySxYg01NR6XH3r58NtwFxdzrzMqCXT7wFSQO+Hcnf6q7Ld+SanSc
   WzoAsfiU9w7T7Z2PJK1H7D2mgsXnAiweRlzQToHDJRkwGHf0nudn64L8A
   4cGcLwoJXdRcciA7uS3i269axUAR2c+GvcmH9SVGq6uZc9QjSStp++1/K
   xKzWS6wROH4ycb0HcIH32fIpWLvnRRfPg7npmKrVwfnz57wjE8MpzbyyN
   k0U9i8L7Yu6qz9zVicxgT4QkogvLSyEm6uJu5HFv/8Ia8ogYpht0HtHCz
   Q==;
X-CSE-ConnectionGUID: MyzgMpMKQTuTa/0xIaCzAw==
X-CSE-MsgGUID: bVGJRyqdQ+WXCyxYH4hQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75292647"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75292647"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:34:01 -0700
X-CSE-ConnectionGUID: QSg06LASS/WsCOWcasgIRQ==
X-CSE-MsgGUID: 3mlNk/pURpCFQtHz27MqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228502793"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.12]) ([10.245.244.12])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:33:59 -0700
Message-ID: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
Date: Mon, 23 Mar 2026 15:34:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
Subject: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for 'jumpy
 DMA'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

for years the discussion around jumpy, bursty DMA have been popping up
and we always concluded that we are missing a good definition and agreed
way between kernel and user space to handle this.

In ALSA it is expected that the DMA (hw_ptr) moves in steady small
steps. There is a BATCH mode which tells that the DMA cannot report sub
period size position, progression.
The DMA bursting fits neither of this, it moves in bigger jumps (bursts)
and it can as well can report position in byte level.

Typically these systems have DSP which can consumes data in various
chunks, making the hw_ptr to jump. Over time the hw_ptr do move at the
sampling rate, but when zooming in we can see:
initial jump of X frames, hw_ptr stays static for about ~X frame worth
of time then the hw_ptr jumps again ahead of X frames, and again, hw_ptr
stops, ...

This can be a problem for user space which wants to write samples as
close to hw_ptr as possible since if it is not aware of the bursty-DMA
than it is possible that a burst will jump over the sw_ptr, causing xrun.

I was looking at what, how and where we should add this information in
kernel and to take it in use by user space when I stumbled across the
'fifo_size' of hw_params struct.

It is only set by a few drivers:
sound/arm/aaci.c
sound/arm/pxa2xx-pcm-lib.c
sound/soc/renesas/dma-sh7760.c
sound/soc/starfive/jh7110_tdm.c
sound/soc/tegra/tegra_pcm.c
sound/soc/xtensa/xtfpga-i2s.c
sound/usb/misc/ua101.c
sound/x86/intel_hdmi_audio.c

It's definition is awkwardly a bit different in kernel and alsa-lib:
in kernel it can be in bytes or frames, but in user space it is always
in frames (snd_pcm_hw_params_get_fifo_size).

So far I could not find evidence that this is in active use by user
space. Not used in alsa-utils, pipewire, pulseaudio at least and web
search came back empty handed as well.

My proposal thus is to re-use, re-define extend the fifo_size as and
indication that the hw_ptr _can_ jump at least fifo_size number of
frames so applications must take this into account when doing direct
update in ALSA buffer for low latency.

Or should we add a new member (carved out from the reserved section of
hw_params struct) specifically for this purpose, like dma_burst_size,
which likely going to be equal to fifo_size if both is filled by the driver.

Or a new flag (SNDRV_PCM_INFO_) that PCM devices can use to indicate
that the DMA is bursting and in that case the fifo_size holds the number
of frames that it is expected to jump.
But we are slowly running out of bits and I'm not sure if it is a good
idea to dual use in kernel internal bits for user ABI
(SNDRV_PCM_INFO_DRAIN_TRIGGER, SNDRV_PCM_INFO_FIFO_IN_FRAMES)

https://github.com/thesofproject/linux/issues/5313
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4489

-- 
Péter

