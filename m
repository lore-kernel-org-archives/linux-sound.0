Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E9B20E30F
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729260996; cv=none; b=erGLKM5DdhDFhlVCT1zyDJXJ4pNga6u3VU6whr8gud5wROM1NmfFwNoZOozrjnuPze+STd5Mj8/T9T+AHIK/xkwUfmWVuPa9XNQ2RgHf5krLboe+ieCr19ofOhl+jSVDWCm3kuGyTTOyy0OxZKLGbLKR6y2XSOtIPwbuD+vjQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729260996; c=relaxed/simple;
	bh=kk7T02qQsvwiSjtoyzX+dsEaybVz3n2ehX5N2g0ByMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZU08z3f54Vzh/2S9chOjgHfbxXf5r1qCCZ6pTPveRYsI+8hgz1NvKaVxXLv6pb/V+sxCYdJG8En1y/aPeCviEP18/NKwPkrUVgzfGAGW44TZEPBBt42qKHiQp2XT8aCo6BKZZFLidkHbo4X2cuuunw1Vyzmow4YY6FwregE45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGh/yzfH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGh/yzfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729260994; x=1760796994;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kk7T02qQsvwiSjtoyzX+dsEaybVz3n2ehX5N2g0ByMQ=;
  b=mGh/yzfHXphCFnPvW1tWVi7ilBCRxNQztJX3wEgM5Nd+TQRWSpOgxtA5
   kJpqFLbnYU/aOiXZ2Jl9p8C9hnkN2YiGLODJAXhK9jt9q0W7ZjWOEjMIz
   AnlBO8KFtyPPgf1jA3tSwAlR5u0Ft2bNiDAR1b9DdQmVv3nKnTs+iUMcJ
   t3ZEJaVuYDYZr+bbzUTnIo64Wef7DP+v9+ZVS2oCUAXlkjHcg6JtHQxL3
   J08OZLxXqU2nfibS1NwRwIA3bGtNPilCUz+M9YfYnjrRbtPPGBA48L5MR
   P0H3suV02Ly/feXd/zbRoszXvziauidQOMNUZ1GlXMkAKt4HHSYH5Sr/t
   Q==;
X-CSE-ConnectionGUID: EyyqkKJaRQCorCjMDneVww==
X-CSE-MsgGUID: m4PisOtVRdOjGR4+TrfmdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32475943"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32475943"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 07:16:33 -0700
X-CSE-ConnectionGUID: qt6Zjm4CTSi0NJpnReoZ2g==
X-CSE-MsgGUID: qgGDGUdWT/uCQIiKjqmK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83943150"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 07:16:32 -0700
Message-ID: <57dbb306-cccd-4f5d-87d3-cab8aef85dda@linux.intel.com>
Date: Fri, 18 Oct 2024 16:16:29 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Add support for detection
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Cezary Rojewski
 <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
 <87y12ory4x.wl-tiwai@suse.de>
 <51db28da-7eb8-401a-b86e-98d95f896643@linux.intel.com>
 <87r08grwgd.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87r08grwgd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/16/2024 3:47 PM, Takashi Iwai wrote:
 > On Wed, 16 Oct 2024 15:29:35 +0200,
 > Amadeusz Sławiński wrote:
 >>
 >> On 10/16/2024 3:11 PM, Takashi Iwai wrote:
 >>> On Wed, 16 Oct 2024 15:02:24 +0200,
 >>> Amadeusz Sławiński wrote:
 >>>>
 >>>> There are some scenarios when using DSP where one may want to have
 >>>> partially active stream and fully enable it after some event occurs.
 >>>>
 >>>> Following patchset adds new "detect" state to ALSA state machine to
 >>>> allow waiting for condition to occur before fully starting a 
stream. In
 >>>> further patches the state is propagated through ASoC components to 
allow
 >>>> them to handling the state as necessary.
 >>>>
 >>>> Main goal of this patchset is to allow handling scenarios like 
keyphrase
 >>>> detection - where DSP analyses incoming signal and wakes userspace to
 >>>> consume stream only when keyphrase is detected.
 >>>>
 >>>> I'm sending this as RFC so we can discuss if this is the way to go 
or if
 >>>> there is perhaps another preferred way of adding such interface.
 >>>> Userspace part of implementation is available at
 >>>> https://github.com/amadeuszslawinski-intel/alsa-lib/tree/rfc_detect
 >>>>
 >>>> Amadeusz Sławiński (4):
 >>>>     ALSA: core: Add support for running detect on capture stream
 >>>>     ALSA: core: Allow polling for detection
 >>>>     ASoC: pcm: Add support for running detect on capture stream
 >>>>     ASoC: Propagate DETECT trigger
 >>>
 >>> Generally speaking, the addition of a new PCM state should be avoided.
 >>> It'll influence too badly on all user-space programs.  e.g. if an old
 >>> user-space program receives such a new state, what should it do?
 >>> How can it know it's a fatal error or it can be ignored / skipped?
 >>
 >> In this case it should not get into new state unless specifically
 >> requested from userspace, unless I'm missing something?
 >
 > Hmm, if the state is exclusive only for the requested program and
 > influences only on that program itself, why does it have to be a
 > global PCM state that essentially every program code has to deal with?

It is stream state, so we can have stream in detect state and wait for 
some event on DSP, it can be for example like detecting someone saying 
something above background noise threshold and then we want to process 
it in userspace, only when it happens and when there is no more 
interesting data we want to be able to return back into detection state.

 >> Goal is to allow something along the lines of following in arecord or
 >> similar:
 >>
 >>          ret = snd_pcm_detect(handle); // here only parts of DSP FW
 >> needed for detection are running
 >>          c = snd_pcm_poll_descriptors_count(handle);
 >>
 >>          pfds = malloc(sizeof(struct pollfd) * c);
 >>
 >>          snd_pcm_poll_descriptors(handle, pfds, c); // polling for
 >> detect event to happen
 >>
 >>          while (!detected) {
 >>                  ret = poll(pfds, c, -1);
 >>                  snd_pcm_poll_descriptors_revents(handle, pfds, c,
 >> &revents);
 >>
 >>                  if (revents == POLLERR) {
 >>                          error(_("poll, revents == |POLLERR"));
 >>                  }
 >>                  if (revents == POLLIN) {
 >>                          error(_("poll, revents == |POLLIN"));
 >>                          detected = 1;
 >>                  }
 >>          }
 >
 > It's too complex if it's needed for each program.
 > If any, it'd be easier to implement an ioctl() for triggering the
 > detect and the sync...
 >

Well we can implement custom IOCTL in HWDEP, but I'd rather prefer to 
have this functionality within machine state, so there is no confusion 
between state machine and custom IOCTL.

 >>          ret = snd_pcm_start(handle); // starts whatever else is needed
 >> for PCM to work
 >>
 >>>
 >>> And, if it's about the synchronization of the DSP readiness, can't it
 >>> be rather synced in each PCM open or prepare instead?
 >>>
 >>
 >> It's too early. We need to do it after hw_params as it needs to create
 >> all paths needed for full stream.
 >
 > It can be done in hw_params, too.  I don't mind where to put, but my
 > point is that the sync can be implemented internally without changing
 > the external API to user-space.
 >

hw_params is too early, as not all paths may be ready, additionally we 
need to allow for sending additional configuration from userspace in 
some use cases.

 >> During detection it just activates
 >> ones needed for detection and only after receiving detection event we
 >> want to start ones needed for draining.
 >
 > So if the driver needs the sync, it can be done in hw_params or
 > prepare, too.  Something like stop_sync stuff we introduced.
 > In the case of stop_sync, hw_params waits for the pending task by the
 > previous stop trigger.  In this case, the sync can be performed after
 > hw_params (if requested) instead.

I'm not sure where sync comes in here, maybe we are talking about two 
different use cases?

Our use case is to:
1. Program DSP with all pipelines it needs to implement whole scenario 
(hw_params)
2. Perform additional configuration from usespace
3. Start detection pipelines
4. Wait for event to happen (it can take however long necessary, for 
example hours)
5. When event happens start drain pipelines and process data in 
userspace likes in standard capture scenario
6. When no more data is needed, either stop drain pipelines and go back 
to 3 or just close stream



