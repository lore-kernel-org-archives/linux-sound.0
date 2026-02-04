Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966363D413B
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200245; cv=none; b=rQ1FzWKpYDV1pyJYJfZ6Y7O90/9hWfSj85YIOzelJy055cOdN96Jhsw+pL6kE8vxz9oS66w4YsOM0fTi0QhczOo0XLGtEUimWuuAVHdEJnrETOUW7JB9zUGjRZvi/cQIw0Caf8aWGTv4sbQVvX3efZcGVfg/oSmUUHSg28qoYUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200245; c=relaxed/simple;
	bh=RX1/s3f6CztCawa4rJTOqT2taa/kXdGjmcqz67Peeuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmT5YkLACCV0clUH7mA3o0zmn/oEaadVzLcAGkw+zxbBY5uWrVC7DOXPxoa+IGXEweMIQZuVaX7sFCT7feEraplSoJEojgFJWp1atXDsBep6yG3mHZDb2Ulq+m4Sww6TGW7Ys2uMoTxp4WSB9Is4K034Ai+iV8/Vb0Sw9UJm3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JA4Cenq/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA4Cenq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770200245; x=1801736245;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RX1/s3f6CztCawa4rJTOqT2taa/kXdGjmcqz67Peeuw=;
  b=JA4Cenq/NYKMU3UypSgoaHz2Iqiv2lPkjm/+h3nL4MEOvD+Wtrc3UM7C
   xE1U67gyvuE8tO3I2cyXEid3xAyfCzpPebrcGMnm8JX/ktfyfh2x6FPL/
   Cmja0ADmdXZcpYO4wEvbeektuYG3uzyFAxK1dy1BRDqUe5yB7x3LVJzUq
   Tz4DGLWnTvHEYzpoLMk78gysVQG2OVYgJn8JLj8vs/vQiHLkCxZP6WMm0
   pAX7CZVITs9Zr7jncCBIrSWlFuVHGhxB8Yi5lxkNtFcgqHYw1ZsQFqj7k
   nWT4H+n82qiQvZukhzXbH6E+mW5ThF/YIgWjdBChoJnTHfcg4pOln2YtN
   w==;
X-CSE-ConnectionGUID: +yHsWV7dS7GhN4tiJtFhfA==
X-CSE-MsgGUID: LyGSWKVIS7uL81V/Js5NJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71468232"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71468232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:17:25 -0800
X-CSE-ConnectionGUID: RwfT9EpOTmejpkyKfgoJGw==
X-CSE-MsgGUID: BG09Wj6fRKqFvoev8RuiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210223317"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO [10.245.246.245]) ([10.245.246.245])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:17:23 -0800
Message-ID: <235a8a0a-eb3a-4dba-adce-98f9f214976e@linux.intel.com>
Date: Wed, 4 Feb 2026 12:18:13 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: soc-pcm2.c ?
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-ALSA <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
 <f9cfdd9c-3299-4231-8d1f-d014da49700f@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <f9cfdd9c-3299-4231-8d1f-d014da49700f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/02/2026 18:18, Mark Brown wrote:
> On Tue, Feb 03, 2026 at 09:45:50AM +0200, Péter Ujfalusi wrote:
>> I'm not sure what you mean by this, but since there are several codec
>> vendors and they produce different codecs, they do need to have
>> different drivers. Some needs more complex, some simpler and DAPM
>> provides the functionality for the developers to not care about the
>> things that are generic (sequencing, path finding, register/bit flips, etc).
> 
> AIUI the issue referred to there is on the SoC side - DPCM doesn't
> support SoC drivers as much as CODEC drivers due to the lack of
> framework features for dealing with digital parameters.

That is true, within SOF framework we have our own implementation of
passing PCM parameters along the path and modules can change those -
8KHz mono from aplay leaves the DSP as 48KHz stereo and from there it
goes to the codec.
We pigyback on DAPM/DPCM for some graph work.

>> I'm not sure if I read this right, but the proposal is to create a
>> parallel and incompatible susbsystem?
>> How would existing codec drivers be used in there?
>> The promise of ASoC is that an OEM could pick any SoC and wire it up
>> with any codec and that will 'just work'.
> 
> AIUI the idea is to only rework the SoC side.

Up to DAI, including DSPs?
SoC side is in simplest term is platform (DMA) + DAI, when it becomes
more interesting/challenging is when you have platform (DMA) + DSP + DAI
on the SoC side - and then another DSP on the codec side.

>>> If I create soc-pcm2.c, I will create sample CPU driver and its sample DTSI
>>> file, like ${LINUX}/sound/sbboc/generic/audio-graph-card2-custom-sample1.dtsi.
>>> People can easily try/test it by just including it in your DTSI file.
>>> No HW / no implementation is needed for testing. And I think it can be good
>>> sample code to create new CPU driver ?
> 
>> We use ASoC on non OF machines as well, I understand that the current
>> users will not be affected, but having a parallel ecosystem sounds a bit
>> scary proposal for ASoC to move forward?
> 
> We'd have to work out some way to flip the switch for ACPI systems at
> some point, I guess there it'd be either a command line parameter or a
> build option (which we'd probably end up with at some point for DT
> systems once things are more ready).

My concern is more of a parallel and incompatible ecosystem which might
force duplicated drivers. This is what is not clear and could cripple
the benefit of ASoC and we are back in sort of pre ASoC tightly
integrated world.

-- 
Péter

