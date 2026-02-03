Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E462ED17C
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770104706; cv=none; b=mKpwXusjfr9LczRMMnoNlTpfLsL4m5CFvJ/+w8wBc2ZToxXfP47Jm48VL6/Xs4+pWC/KvjBSLmdTCaeL40fQcQTJgyFIe3VT15oG5eu6tzLJ2Psz7kb6U8EchCTaxHUlofnreFe8AXQkzsF/nrxaj3oxlD9XMoRn0kV256dQuVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770104706; c=relaxed/simple;
	bh=6xq6t0d6HPk2ilk5HUW5JfwFeEGMbsQlyLWlCVBzlFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBalRMAXvTW3rhKr2nEFV0ZWynzfcbNith2hz+NQfrv2JxuhDvEL7kM/ZONveAZQFmoiE1VW2b1/R0ifiT1CSDRM8PAF/XykGglAk5NmKKIm+fkYX6tFyc3Hd9JhCXywkSDAp9f3N1JuC37+4ip/VnHehSLC0xwplA1m1PDi9SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPIH01wV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPIH01wV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770104704; x=1801640704;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6xq6t0d6HPk2ilk5HUW5JfwFeEGMbsQlyLWlCVBzlFw=;
  b=EPIH01wVA3GYkSeSVa0IpvLtGC8UvzNHAbMn7RIUukZMYoncle509BSf
   oOE9lGWDY2wj9UoeK31W0qge8We/KiEL9cPHwBD1ab82R786ywDr6I9dI
   Ayr1qtdjDJgHnqMb0qui6vkb0jdEeqiv2ZoMuRpKTemYP3vHNI/yHAQX9
   Ws1u0Up84EijQxyQvGTxwfuut5nX7LoI7aq4tnB0lOvGg6JWKUus5Ke6c
   v6/WDUhJHyWQj294X21E154qUprl6CjKjAoPxCfwnZKnIHSPy+I02E5j+
   Qvof4lEhJhfpzGQRfbUlkKQKiIFxA0VdfSW5GXTc6gHZfBUBm3kyfdYaT
   A==;
X-CSE-ConnectionGUID: Y9IMYZxKTdqrzRhdSwhtrA==
X-CSE-MsgGUID: s1L7W6RyR5mI1ng3UFCaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82693196"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82693196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 23:45:04 -0800
X-CSE-ConnectionGUID: 7hm+KKLwSbC1p7KmX5oBAw==
X-CSE-MsgGUID: Zas8bcpSQveUnmPrPRVBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209554552"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.191]) ([10.245.246.191])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 23:45:02 -0800
Message-ID: <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
Date: Tue, 3 Feb 2026 09:45:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: soc-pcm2.c ?
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/01/2026 08:41, Kuninori Morimoto wrote:
> 
> Hi ASoC ML
> 
> I have been cleanuping ASoC framework.
> I have started it after seeing Lars-Peter's presentation at ELC-E (almost
> 15 years ago ?). It was for updating ASoC framework.
> I have very agrred his idea, but I worried that it will be very difficult.
> Because in my opinion, controlling complex HW by complex SW is inpossible,
> and ASoC framwork was very complex. So I started to cleanup framework to
> help him.
> 
> I want to keep cleanuping, but one of the file which I can't cleanup is
> soc-pcm.c, especially around DPCM. I know how to use it, but I still can't
> undersand how it is working. I have talked it with Mark at OSS-Japan last
> year, and he had same/similar opinion.
> 
> For me, current DPCM looks like forcefully expanded functionality.
> I think support modern Sound HW on current DPCM is not impossible, but
> unique implementation is required on each vendor driver side.

I'm not sure what you mean by this, but since there are several codec
vendors and they produce different codecs, they do need to have
different drivers. Some needs more complex, some simpler and DAPM
provides the functionality for the developers to not care about the
things that are generic (sequencing, path finding, register/bit flips, etc).

> I think keeping cleanup/update current soc-pcm.c, and makes it more modern
> style is impossible or very difficult, and/or it may become irreversible code
> in worst case.
> 
> So may I suggest to create new soc-pcm2.c, like below ?
> 
> (A)	  soc-pcm.c
> (B)	+ soc-pcm2.c
> 	  ...
> 	  audio-graph-card2.c
> (C)	+ audio-graph-card3.c
> 
> All existing drivers uses existing soc-pcm.c (A). Nothing changed.
> And create new soc-pcm2.c (B) and new card driver, for example
> audio-graph-card3.c (C).
> audio-graph-card3 (C) user only can access to soc-pcm2 (B).
> 
> In this case, existing user will get zero damage from new soc-pcm2.c (B).
> We can just remove (B) and (C) file in worst case, it is easy to rollback.
> But what do you think ?

soc-pcm is much much more than just PCM, it is the 'backbone' of ASoC if
you will. It works tandem with DAPM, CPU/platform/codec drivers are part
of the system.

I'm not sure if I read this right, but the proposal is to create a
parallel and incompatible susbsystem?
How would existing codec drivers be used in there?
The promise of ASoC is that an OEM could pick any SoC and wire it up
with any codec and that will 'just work'.

> In my understanding, current DPCM searches path and power via DAPM in
> runtime. Because of it, the code become very complex. We would like to have
> more simple style in soc-pcm2.
> 
> OTOH, we need to call amixer to use Codec, like this
> 
> 	> amixer set "Mixin PGA" on
> 	> amixer set "Mixin PGA" 50%
> 	> amixer set "ADC" on
> 	> amixer set "ADC" 80%
> 	> amixer set "Aux" on
> 	> amixer set "Aux" 80%
> 	> amixer set "Mixin Left Aux Left" on
> 	> amixer set "Mixin Right Aux Right" on
> 	> amixer set "Mic 1" on
> 	> amixer set "Mic 1" 80%
> 	> amixer set "Mixin Left Mic 1" on
> 	> amixer set "Mixin Right Mic 1" on
> 
> This means, user need to understand Codec circuit and/or board schematic.
> Even if the path setting was correct, we can't get basinc sound without
> each volume settings, because default value is zero settings. We need to
> setup both "path" and "volumes" to use Codec.

This is why we have UCM, users should not need to know anything about
these controls, they should be able to say that I want to play audio to
headset and UCM will take care of the mixer changes.

fwiw, on one of my laptop (soundwire with Cirrus codec):
# amixer -c0 controls | wc -l
184
and I have never figured out how to switch manually as other laptop
needs completely different mixer changes for the same functionality,
lost cause w/o UCM.

> But it is not realistic premise IMO. I don't think *all* user understand
> it by themself. I think user don't need to care detail of HW. It should be
> handled by Kernel (= Kernel developer), not user, at least basic path and
> volume settings.
> At least, default path and default volume should be set by default without
> any settings from user, I think.
> 
> So I want to reduce amixer use case as much as possible somehow.

You cannot realistically do this, would you change all codec driver and
reduce their number of controls?

> Not zero, but volume control or some kind of feature

We could have several gain controls in a path, one main and then
separate ones per outputs/inputs, you cannot really remove these, you
cannot just control volume. What would you do if you play to two outputs
at the same time which shares one main gain control and gain on each
output? How to make only output 1 louder w/o changing output 2?

> (= for example "noise cancel") ON/OFF only, etc.
> 
> 
> I'm now thinking for soc-pcm2 is that we can use "graph" and "routing" ?
> Here "graph" means, physical HW connections, like below
> 
> 	+---- CPU ----------+    +----- Codec -------+
> 	|                   |    |                   |
>     -->	| [A]--+-[C]-+--[D] | -- | [a]--+-[b]-+--[c] | ->
>     -->	| [B]-/             |    |             \-[d] | ->
> 	+-------------------+    +-------------------+
> 
> This is very simple graph image.
> [C] is Mixer
> [b] is selector
> Others are some kind of features.
> 
> And "routing" is for example
> 
> 	1: [A]-[C]-[D]-[a]-[b]-[c]
> 	2: [A]-[C]-[D]-[a]-[b]-[d]
> 	3: [B]-[C]-[D]-[a]-[b]-[c]
> 	4: [B]-[C]-[D]-[a]-[b]-[d]
> 
> In Codec, each [x] connections are handled by DAPM, in my understanding,
> but we don't have such code for CPU side today.
> I think DAPM is for "Power Management", but is same as "routing".
> I think we can expand it or create similar system for CPU too ?
> 
> Anyway, both "graph" and "routing" are fixed, not changed after boot.
> No need to search path in runtime in this idea. So no need to call amixer
> (for path setting. It wil be setup from inside kernel, etc).
> Above "graph" is good match to modern Sound HW ?
> 
> In this case, device number = path, like this
> 
> 	> aplay -D hw:0,1 // path 1:
> 	> aplay -D hw:0,2 // path 2:
> 	...

With current setup you only need to flip a control to move the audio
from c to d which would be as silent affair as possible thanks to DAPM.
With separate PCM devices you would need to close stream 1 (shut down
codec) then open another stream (seek into the audio where you closed
the stream 1), this would likely cause pop issues and other issues.

It is another matter when you need to have separate PCM devices per
endpoint (like with soundwire). There we use DAPM as well to make sure
that the path is powered on.

> It will just fail if some path can't work in the same time,
> for example above 1 vs 2.
> Good point is that no runtime search is needed (= can be simple code),
> Bad point is that number of "routing" can be explosion, but it is very
> rare cases ?

apart from the explosion you also need to enforce some sort of standard
on PCM device indexes and names which would scale to a system with only
single jack to one with 10 jack and speakers and S/PDIF and coax and HDMI.

You would always need user space to handle this and UCM is the current
solution for abstracting the complexity. Yes, it has it's limitation,
but covers most of the cases pretty well and if not, can be extended.

> Sound HW/system is very complex, and ASoC allows .trigger and .hw_param
> etc in the same time. So we need to have many locks (for each modules, for
> routing, etc). Because of this, current ASoC has tons of locks, and need
> complex lockdep ?
> 
> I know this is not so good idea, but how about to have only one lock, like
> "graph lock" ? This is just opinion, but having one large lock is not so
> good idea, but better than very complex and un-controllable code.
> I don't think .trigger and .hw_param are called frequently in the same time...
> Yes, maybe realtime side can be problem though...

ALSA have per PCM lock to open, triggers, but ASoC and DAPM can reach
out from one PCM lock to a path which is protected by other PCM lock and
could do a mess of things.
With SOF we deal with DSP topology on top of all this and needed another
set of locks to tame the concurrency of ALSA and ASoC...

> I think we can use existing Codec driver as-is in soc-pcm2, but, CPU driver
> needs to be re-maked (?), especially DPCM user. But not sure...

Codec drivers rely on DAPM + soc-pcm callbacks, how can they be re-used
in a different susbystem?

> If I create soc-pcm2.c, I will create sample CPU driver and its sample DTSI
> file, like ${LINUX}/sound/sbboc/generic/audio-graph-card2-custom-sample1.dtsi.
> People can easily try/test it by just including it in your DTSI file.
> No HW / no implementation is needed for testing. And I think it can be good
> sample code to create new CPU driver ?

We use ASoC on non OF machines as well, I understand that the current
users will not be affected, but having a parallel ecosystem sounds a bit
scary proposal for ASoC to move forward?

> I have indicated many random topics, but these are just my idea.
> My motivation is I want to cleanup ASoC framework, but can't on soc-pcm,
> especially around DPCM. There is no guarantee I can create soc-pcm2, but
> have interesting. But what do you think ?
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 

-- 
Péter

