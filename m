Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE4392C2D
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113419; cv=none; b=ezORcRvnFxy7/OCxNBeVa4QtTcLxGGJLLfU4U2ZvJhW6fkDYQc6tXQA2GeSrYeCK4m/n+93/BkoyLFJle06DKk4ORCmy9NRaUDPjlRYhW0AIIQVDfdmfaMAp7Vd2nM7wt80JdQ5TNIPw6gqmNF2sk4iFw0pCMWUwDMDnAxPi2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113419; c=relaxed/simple;
	bh=7A3xec1rBih5kTY3KXPh4mhhvetXTobzWt+VVWy/bok=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TAOU27MgIuxRSGtO7mUji2C9ZKCEqMCtlfUNcYulVKjRFGEd/9530urIwszcKGbmT2a2RHSM78WHi/8x/aWrzeV0i1MlQ9CXIAXGcaWDDRSomzId2da1Fq5FzEsoii/7XbFxLbQmLOyrU61eHSq5QQK7MpZ3FpsI3crwEivdM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpuQzkiG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpuQzkiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770113417; x=1801649417;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=7A3xec1rBih5kTY3KXPh4mhhvetXTobzWt+VVWy/bok=;
  b=FpuQzkiGCBIz4+/Xr6YwWrZzYbJAPBGM4Z0l9STWpl8XS0MAxuxa/Vls
   rQ0JTbOzJebqDYaSFGWbY3mo+DkgT2bEe3TSx07dz1hax5MNJbDN6xFoc
   wIGajIpB1yKQ08e/2MxfJ2yRgkZNCnCurDye31sD3J83YX0NHNj/A6vVJ
   kUxCPOvZB7dARVBvdKmh4QTI9yL9KyMYZyij1LDXhHYDpYV86l3A0NSP0
   aIPWaWp7sn4D4M6qSk8BeyrCQuJ3iEl9ojhUIOeUSIayvWTlRfslWLQI6
   H1djtHdI4+bnXgNKCl8iZVqkIElB2bWtqhKZVOAjejBMzbMj0RQ1A58hp
   g==;
X-CSE-ConnectionGUID: sp8zI0BtQxSirB95kUhoog==
X-CSE-MsgGUID: nOO+H/X8TKiYoLZjiM9BiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73875961"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="73875961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:10:16 -0800
X-CSE-ConnectionGUID: sVWGH7wpSOiu6RfNowjx/Q==
X-CSE-MsgGUID: vWcxJ5TlQEm5Hlzbgfd1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209823192"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.191]) ([10.245.246.191])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:10:16 -0800
Message-ID: <12dddaf7-6834-4ddd-9578-6d4347def868@linux.intel.com>
Date: Tue, 3 Feb 2026 12:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: soc-pcm2.c ?
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
Content-Language: en-US
In-Reply-To: <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/02/2026 09:45, Péter Ujfalusi wrote:
>> I'm now thinking for soc-pcm2 is that we can use "graph" and "routing" ?
>> Here "graph" means, physical HW connections, like below
>>
>> 	+---- CPU ----------+    +----- Codec -------+
>> 	|                   |    |                   |
>>     -->	| [A]--+-[C]-+--[D] | -- | [a]--+-[b]-+--[c] | ->
>>     -->	| [B]-/             |    |             \-[d] | ->
>> 	+-------------------+    +-------------------+

In a simplified way we have similar setup with SOF where we can have as
many PCM devices (A/B/C/D) mixed within a DSP and sent to a DAI and to a
codec, each PCM can have different properties, even you can havce a
compr device sent over and mixed.

>>
>> This is very simple graph image.
>> [C] is Mixer
>> [b] is selector
>> Others are some kind of features.
>>
>> And "routing" is for example
>>
>> 	1: [A]-[C]-[D]-[a]-[b]-[c]
>> 	2: [A]-[C]-[D]-[a]-[b]-[d]
>> 	3: [B]-[C]-[D]-[a]-[b]-[c]
>> 	4: [B]-[C]-[D]-[a]-[b]-[d]
>>
>> In Codec, each [x] connections are handled by DAPM, in my understanding,
>> but we don't have such code for CPU side today.
>> I think DAPM is for "Power Management", but is same as "routing".
>> I think we can expand it or create similar system for CPU too ?
>>
>> Anyway, both "graph" and "routing" are fixed, not changed after boot.
>> No need to search path in runtime in this idea. So no need to call amixer
>> (for path setting. It wil be setup from inside kernel, etc).

I see, so basically you want to scan the DAPM graph on boot and create
as many PCM devices as many DAPM route can be built (platform/cpu_dai ->
codec_dai -> codec_output and same for inputs) by walking and tracing
the mixers/muxes?

Create virtual PCM devices which would map to real PCM device underneath
(which is a platform+cpu_dai as this is the constraint to move data
from/to host).

I guess it might be an interesting experiment to wrap the current ASoC
inside of a virtual PCM wrap and expose paths as PCMs. probably can be
done with asoundrc magic as well.

>> Above "graph" is good match to modern Sound HW ?

Depends on the definition of modern sound hardware ;)

In SOF we kind of doing similarish things for PCM devices and DSP
topology, but we don't want to rewrite the codec side of things.
PCMs are 'linked' to DAIs on the other side of the DSP and the path
within DSP is sort of static, we could do dynamic path changes, but so
far this has not something that came as a need.
We use DAPM for graph for the in DSP path.
Something like this for example:
https://sof-ci.01.org/linuxpr/PR5647/build10053/devicetest/PTLH_HDA_AIOC/sof-hda-generic-ace3-4ch.png

host-copier.0 is PCM0 (playback, normal)
host-copier.31 is PCM31 (playback DeepBuffer)
both is route to one HDA analog and from there it is the codec who does
the routing to speaker/headphone, we don't care.

We push this a bit further for few setups, like:
https://sof-ci.01.org/linuxpr/PR5647/build10053/devicetest/PTLH_RVP_NOCODEC/sof-ptl-nocodec.png

Probably the path walk would be possible to be done during probe and
then just run through the list, but this is just how things are
currently and 'simplifying' this would limit future possibilities which
we don't see yet to come.

We might want to divert, add/remove component in the path, we might want
to move the stream from one endpoint to another within DSP and w/o
closing the PCM device, I don't know. Might not happen at all...

>> In this case, device number = path, like this
>>
>> 	> aplay -D hw:0,1 // path 1:
>> 	> aplay -D hw:0,2 // path 2:
>> 	...
> 
> With current setup you only need to flip a control to move the audio
> from c to d which would be as silent affair as possible thanks to DAPM.
> With separate PCM devices you would need to close stream 1 (shut down
> codec) then open another stream (seek into the audio where you closed
> the stream 1), this would likely cause pop issues and other issues.
> 
> It is another matter when you need to have separate PCM devices per
> endpoint (like with soundwire). There we use DAPM as well to make sure
> that the path is powered on.
> 
>> It will just fail if some path can't work in the same time,
>> for example above 1 vs 2.
>> Good point is that no runtime search is needed (= can be simple code),
>> Bad point is that number of "routing" can be explosion, but it is very
>> rare cases ?
> 
> apart from the explosion you also need to enforce some sort of standard
> on PCM device indexes and names which would scale to a system with only
> single jack to one with 10 jack and speakers and S/PDIF and coax and HDMI.
> 
> You would always need user space to handle this and UCM is the current
> solution for abstracting the complexity. Yes, it has it's limitation,
> but covers most of the cases pretty well and if not, can be extended.
> 
>> Sound HW/system is very complex, and ASoC allows .trigger and .hw_param
>> etc in the same time. So we need to have many locks (for each modules, for
>> routing, etc). Because of this, current ASoC has tons of locks, and need
>> complex lockdep ?
>>
>> I know this is not so good idea, but how about to have only one lock, like
>> "graph lock" ? This is just opinion, but having one large lock is not so
>> good idea, but better than very complex and un-controllable code.
>> I don't think .trigger and .hw_param are called frequently in the same time...
>> Yes, maybe realtime side can be problem though...
> 
> ALSA have per PCM lock to open, triggers, but ASoC and DAPM can reach
> out from one PCM lock to a path which is protected by other PCM lock and
> could do a mess of things.
> With SOF we deal with DSP topology on top of all this and needed another
> set of locks to tame the concurrency of ALSA and ASoC...
> 
>> I think we can use existing Codec driver as-is in soc-pcm2, but, CPU driver
>> needs to be re-maked (?), especially DPCM user. But not sure...
> 
> Codec drivers rely on DAPM + soc-pcm callbacks, how can they be re-used
> in a different susbystem?
> 
>> If I create soc-pcm2.c, I will create sample CPU driver and its sample DTSI
>> file, like ${LINUX}/sound/sbboc/generic/audio-graph-card2-custom-sample1.dtsi.
>> People can easily try/test it by just including it in your DTSI file.
>> No HW / no implementation is needed for testing. And I think it can be good
>> sample code to create new CPU driver ?
> 
> We use ASoC on non OF machines as well, I understand that the current
> users will not be affected, but having a parallel ecosystem sounds a bit
> scary proposal for ASoC to move forward?
> 
>> I have indicated many random topics, but these are just my idea.
>> My motivation is I want to cleanup ASoC framework, but can't on soc-pcm,
>> especially around DPCM. There is no guarantee I can create soc-pcm2, but
>> have interesting. But what do you think ?
>>
>> Thank you for your help !!
>>
>> Best regards
>> ---
>> Kuninori Morimoto
>>
> 

-- 
Péter

