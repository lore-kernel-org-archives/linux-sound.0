Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD53D3306
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210429; cv=none; b=TWUpZOxXl1hu7768CLYZdc9EfDD6+k9zQDxIfVurnNnEtClNnp5LeayIAd287Yg180nq/1iaFAVQD8sNlRs6tH64wmggau93Qntz9Pc3lErFoqfTo0Nx/0+6dI9Q/FaKGxZA383GYJFly6ie+r25whas9YSH7Sa2nLb7d1xNFk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210429; c=relaxed/simple;
	bh=PqahvhZErE0Z8Nkd2vUz+NXMlrvB6l+GsM4GiLusWgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpWsQfs2YjnHnVsOF7BYQNsY6Q4TmROvHdYNgDtQ5XucDsAoHgjyCXTSrD7cDGRFdLU5/Wc9GAYrhS8x8G8YxPrdSWVqfKJZJx7pbuPQLhWSJ2GdOjx2btKPRqTaT7Wr4+SOhX3NdyxBcRaArebJULhfEclwwGNWeDK4KZJqzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blrazrwk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blrazrwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770210428; x=1801746428;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PqahvhZErE0Z8Nkd2vUz+NXMlrvB6l+GsM4GiLusWgQ=;
  b=blrazrwkIao75ugxk+f2L9AmwA+9tmIirF3x1SQwNhdWFno88YC4pMot
   k1R9HHB7i3LiZ2QWnLIBE3fi5LAVkYGi55tA/uI0DFRV+p+zApu4SFcg5
   tPiksW3sd4MrcfZniHTD0cIZkn6Hsf8JudJ5IpXWHEemq+B4HczSSY01z
   QY7PJr5S35ZR6dSzUYImSH72Ukh/9uCVNSJIMccGJzC2zeKxbZahgxdrX
   vDC2klmlZw43kEql0QCp57M+fnoMLQ+7aA+KuwG5QBdCG95IMjm0Ai0QQ
   DusXbDGhysLSiSo6l1iyL8m6lHKMcpz8kijg0/Vt72w6VBOjAprTT8pbR
   w==;
X-CSE-ConnectionGUID: 9r84FsY6TQCDukMIrk/Gfw==
X-CSE-MsgGUID: GpHIsQX0QVue0PN/MePvkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88817202"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="88817202"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:07:08 -0800
X-CSE-ConnectionGUID: GlVH4Q4ARCCwpphewWe2oQ==
X-CSE-MsgGUID: x4Kx0lsFSZC66j2sYVJaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="240843045"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO [10.245.246.245]) ([10.245.246.245])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:07:06 -0800
Message-ID: <92b7ddc4-3d22-4b15-8f54-799ccb429c42@linux.intel.com>
Date: Wed, 4 Feb 2026 15:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: soc-pcm2.c ?
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Linux-ALSA
 <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
 <12dddaf7-6834-4ddd-9578-6d4347def868@linux.intel.com>
 <87y0l9ezm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87y0l9ezm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

On 04/02/2026 09:28, Kuninori Morimoto wrote:
> 
> Hi Peter
> 
> Thank you for your feedback
> 
>> For me, current DPCM looks like forcefully expanded functionality.
>> I think support modern Sound HW on current DPCM is not impossible, but
>> unique implementation is required on each vendor driver side.
> (snip)
>> I'm not sure what you mean by this, but since there are several codec
>> vendors and they produce different codecs, they do need to have
>> different drivers. Some needs more complex, some simpler and DAPM
>> provides the functionality for the developers to not care about the
>> things that are generic (sequencing, path finding, register/bit flips, etc).
> 
> Hmm ?
> I   was indicating DPCM
> you are indicating DAPM ?

It has not been clean on what this proposal about, we don't have much
kcontrol or mixer elements to control PCM on SoC side, so kcontrol for
me is associated with DAPM mostly.

>> How would existing codec drivers be used in there?
> 
> Maybe reused, maybe not. Nothing is decided yet.
> That is the reason why I'm sending this kind of mail.

The maybe not option would be really bad for overall ASoC, I don't think
it is viable to expect two different 'generic' framework with duplicated
drivers.

>> This is why we have UCM, users should not need to know anything about
>> these controls, they should be able to say that I want to play audio to
>> headset and UCM will take care of the mixer changes.
> 
> Please consider about non PC user case, too.
> I have mentioned about this topic in other mail. Please check it.

UCM was created for non PC environment initially and later adapted to be
used on PCs as well.

> 
>> You cannot realistically do this, would you change all codec driver and
>> reduce their number of controls?
> 
> As I mentioned on previous mail, I have no plan to update existing drivers
> for pcm2. Maybe small update might be happen, though
> 
>> We could have several gain controls in a path, one main and then
>> separate ones per outputs/inputs, you cannot really remove these, you
>> cannot just control volume. What would you do if you play to two outputs
>> at the same time which shares one main gain control and gain on each
>> output? How to make only output 1 louder w/o changing output 2?
> 
> Sorry, my explanation was not clear for you. I never indicate to remove all
> settings. I have mentioned was like this
> 
> 	    [A]----[C]--[D]----[E] -->
> 	--> [B]-+/          \+-[F] -->
> 	                    \+-[G]
> 
> In current ASoC, it uses default settings. for example above case,
> we need to setup routing for [C] and [D], otherwise there is no sound.
> 
> Here, normal user who don't use advanced userland (= can't use UCM), need
> to get its datasheet and its board schematic. And investigate connections
> and amixer list, etc, etc, etc...

Well, if the driver is written incorrectly and needs user action to
connect C to D, then it is not a framework issue, but a driver issue.

static const struct snd_soc_dapm_route intercon[] = {
	{"C", NULL, "A"},
	{"C", NULL, "B"},
	{"D", NULL, "C"},
	...
};

If there are registers to flip, then a virtual widget and all works w/o
user interaction.

But you cannot aplay to G as such, that is true, but this is not a PCM,
it is how DAPM compares to your proposal.

DAPM uses graph as well, it will walk from source and enable things in a
path towards an output, if there is one. If there are multiple outputs,
it will power on all of the paths.

Your proposal is to create separate PCM device for each possible routes,
record what mixers/muxes/switches (if any) in the path should be set to
what value and if run that 'script' when the PCM is started.
In a way moving from DAPM to SAPM (Dynamic to Static Audio Power
Management).

DAPM would be able to do this if you have virtual PCMs, but the current
limitation is that a PCM is tied to a DMA channel, which is sort of
understandable as from ALSA buffer you need to move the data to DAI and
that is a DMA, but still, one can do this currently (I think
omap-mcpdm+twl6040 can do similar thing).
But it would be convoluted to say the least.

If I think about this, I think the topology is sort of provides this
description, which we use in SOF as well. It describes the path in
digital domain - within the DSP - and creates a DAPM path.
This could expose kcontrol or be a silent path without user visible
controls.

> And more, as you mentioned, let's think about for example [B] [C] [E] needs
> to setup volume. If normal user could setup routing connection, like
> [B][C][D][E], he still get zero sound, because it is using 0 volume as
> HW default. So he will think that the routing was still not good, and will
> change the correct routing settings.

Oh, how many times I have faced with this ;)

> This is not realistic. Please note that not all user can use advanced
> userland, and not all Linux users are PC user.

UCM is far from advanced userland...

For a board which is available for user, it is not a big ask to have UCM
profile, given if it can run Linux.
Average user will unlikely to create a custom board with audio and then
wonder how it works.

> But in above case, input of [C] is only [B], and maybe almost all user try
> to uses [E] as 1st for example. In this case, we want to have default
> routing settings for [C] [D] (without UCM), and default volume for
> [B] [C] [E]. This is under Card driver developer's design.
> In this case normal user can get sound from [E] without any settings.

Right, this can be already done in machine driver afaik?

> This doesn't mean pcm2 removes all settings. User or UCM can setup
> (= overwrite) routing of [D], and volume of [B] [C] [E], same as before.
> No need to setup [C], because it is fixed route.
> And it will not appear on amixer list.

As I said, C-D connection should not appear for user, unless you want to
expose a hard mute...

> Please check also my other mail, today.
> 
>> Codec drivers rely on DAPM + soc-pcm callbacks, how can they be re-used
>> in a different susbystem?
> 
> Why pcm2 can't call it ? 

Sure, but why pcm2 can use DAPM as underlying graph infra?

>> We use ASoC on non OF machines as well, I understand that the current
>> users will not be affected, but having a parallel ecosystem sounds a bit
>> scary proposal for ASoC to move forward?
> 
> Existing system will not be removed, and will not get damage/effect from
> pcm2. And, I will never forcing you to use pcm2.
> If you don't like it, you just ignore it and use pcm1, same as today.

And that is a bad target, having two incompatible susbsystems will cause
burden for maintainers, vendors, OEMs and contributors alike. Where to
focus on new development? Should we improve both or only one? how one
decides which is used for which SoC and board? Same SoC might need
different susbsystem because of other external factors (codec drivers, etc).

> We can just remove pcm2 code if it failed. It has zero effect to pcm1 user.
> This means, existing pcm1 user will get zero damage/effect from pcm2
> anyway whether it succeed or failed.
> 
> If pcm2 was failed, nothing is changed.
> If pcm2 was succeed, you will get +1 option.

Improving DPMC has always on the plate and given how basic it is (BE and
FE), it is a great idea.
In SOF (and in topology) we use DAPM within DPCM for route management -
but  not for it's Power control.

> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 

-- 
Péter

