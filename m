Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5491635C2
	for <linux-sound@vger.kernel.org>; Thu, 25 Apr 2024 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714082348; cv=none; b=T9QNk1EnXnQtRoDKovgZlKpHkTwktF+6yJmb7MbW8e6MNbSwiHIEcaJL5GnqVetluXiAHXdn/PFN3ST9B8yW9IyoykrFFHSlabPk1GuOkBIQLmSmENvFTAQvSgs6EEvvi5xMPIDL5DVKXiMNedyrE4EzySGy06SfEqoKVSesovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714082348; c=relaxed/simple;
	bh=o9KSTJFxVxkC/2zpLND+WBnpa99h44cUt3h8M5U7thQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PHfhySMqv8aZCVSwOBZ2a2lVSX2vz7eEm+m+GqOnnNxayVFprCeBYs8wUY4F/6EXqwtOuccb0Ap7lSmp4INiUCr55hWQAz1+ulon4KqGzqfvKXKOWPUzX0+GBMc7saEa+zaHx2dLfczc+M4VRIrAgvJPSx5HrfauP7GA/clM7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLcLkv+J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLcLkv+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714082347; x=1745618347;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=o9KSTJFxVxkC/2zpLND+WBnpa99h44cUt3h8M5U7thQ=;
  b=fLcLkv+JVpnRvu35nwPKozntC97xVVmXT7gBY1XpE9jdPBODcY4Pm8mq
   eYcRha1a4o26cvFTNX42nwqLMeRUm/NTAyM7lS6mTvKSF1l6t0T14KVXn
   l0xaU/wabj/arH1+RJIQxWxi+MN+48m7OaTo/FImBfh4tCBsEuD6FBWE8
   mN7DPrvvNJnHjbtwWZLmdMh9nf8NoH2KIgVPtxm5fW+r+xNSwfmlKSzYp
   ie0qaEAyhjIWgZ0p0tRYCs9vg49aN7g32trZEJV6vgFGJ04hHlkGaA+g0
   lq2ytHk7PVTimZr/4gnuExFXMvNJOJ4dfuX9GKm3Rss9IXYfpn1nz4mJV
   g==;
X-CSE-ConnectionGUID: qoTwCjxJSraEGgdRSmV94w==
X-CSE-MsgGUID: rsS3JrXJR/qxDCix2vvxlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20355663"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20355663"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:59:06 -0700
X-CSE-ConnectionGUID: 2Qq/ilTSTEC7XEdh5FlKFg==
X-CSE-MsgGUID: g08zHUITSoyoXKghXI76bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25222489"
Received: from mhillikx-mobl.amr.corp.intel.com (HELO [10.212.81.51]) ([10.212.81.51])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:59:05 -0700
Message-ID: <bdf31350-1f99-4588-8d6d-f4b9c8bad96f@linux.intel.com>
Date: Thu, 25 Apr 2024 16:59:05 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
 <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
 <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
 <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
 <87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
 <93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
 <87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
 <87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
 <f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> But because we have been used dpcm_xxx for 10 years since (B),
>> I understand to feel anxious to suddenly remove dpcm_xxx.
> 
> Indeed we err on the side of paranoia with such changes!
> 
>> I think it should be removed anyway, but want to have grace time ?
>> If so, the idea is that we can use it as "option flag" instead of
>> "mandatory flag" for a while, like below
>>
>> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
>> 		playback = (cpu_dai->driver->playback.channels_min > 0) ||
>> 			   rtd->dai_link->dpcm_playback;
>> 		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
>> 			   rtd->dai_link->dpcm_capture;
>>
>> * maybe we want to indicate message like "place re-check the flag and
>>   remove it" via dev_info() if dpcm_xxx flag was used ?
>>
>> I think +2 kernel version or so is enough for grace time ?
>> After that, we can remove dpcm_xxx flag.
> 
> I am good with that plan, but I'll need to investigate first why we had
> a failure with one of the Chromebooks on this v3 patchset. That may give
> us some insights on "special" uses of those flags.

I found the reason why this patchset failed on Intel CI: a dailink
direction is deemed supported only if ALL cpu- and codec-dais support it.

That is a stricter criterion than in existing code. This was a good
intention based on symmetry, but in practice there are exceptions to the
rule...

On some Chromebooks, we tag a dailink as supporting capture for echo
reference, but that echo reference is generated by the Intel firmware.
The amplifiers only support playback.

see https://github.com/thesofproject/linux/pull/4937 for details, I
added a clear log:

[  807.304740] kernel:  SSP1-Codec: CPU dai SSP1 Pin supports capture
but codec DAI rt1011-aif does not

So I think for now we probably want to avoid this stricter criterion and
only check the supported direction with the cpu-dais. Or we add an
escape mechanism to let the core know that the capture support was
intentional.

Also we relax the checks to go back to (E)
4f8721542f7b75954bfad98c51aa59d683d35b50
("ASoC: core: use less strict tests for dailink capabilities")

"
This patch modifies the snd_soc_dai_link_set_capabilities() helper so
that the dpcm_playback (resp. dpcm_capture) dailink capabilities are set
if at least one [cpu-]dai supports playback (resp. capture).
"

We tried checking all cpu-dais before and found issues, so "at least one
cpu dai" seems the strictest test to apply without breaking legacy.
