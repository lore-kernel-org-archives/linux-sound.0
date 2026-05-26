Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C9274670
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774343; cv=none; b=j73n8XEtWZdCEscbBrjZAFSX62h6LhRcXHclAsUHuu7ByLZHRdv6Z6Dh/rCHCfdH0pQxuVm7bYkXlJ6aZkUvYARYBYnjsxd+KhyEHdf7KJO0gPDO6T/tX1vUUCpK09yCo7UO4z8BI6PUp7so4y0wclawuhP5lwexc/0v4tV9acU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774343; c=relaxed/simple;
	bh=BvVyl/xPR5P5ExPkDIL9htQkyxvhRUdBaeXMfVowqSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTMTbde4J3TjfD36RRkIFvAArpDXBunN8AmfgrviZMzZCxtlCZ1mEd7G4Xqd3pwxkY2mrRzyiCkS/u8cAtmYqbs2IMSE0oPH4DKSaYX/LfvR/9qD4GytzZXy0FwxmSMSc8Np/ZgEA1aodgLgqOaAtYUu30lp+YFe2EtQTxcKgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDUfGcgQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDUfGcgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779774341; x=1811310341;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BvVyl/xPR5P5ExPkDIL9htQkyxvhRUdBaeXMfVowqSI=;
  b=TDUfGcgQ8ehO3PugmSNVorekUqJXQDeQ8fDud0HlGgLzXTjuW72Yqgnh
   /l9DM5GPDHGa4HPuRndx/AVbcjr7w7fz5y5bNO4r6DO9FITHtVjMBVTnE
   A9sXVsS8fhDOoQi5Ul9B/RBNuSKdex3ErDi48p1ln7EK8cvUczTVRkNOV
   0lKm7TRHx52E/ST1upM0Iug0EVzQGKyf9WGzkhx6hmfD/XriMBD3sWKb/
   GVNbcPMVWH4FXfbgO8Qtnx1U9HmEd9xOfQGNQFfIU3SN7FrSkqvrKN0tt
   g6j60VZfhmpKHaGZzghtVWaQtuGPPmT6H53847+Zsm0Doath6qKMTQLwb
   Q==;
X-CSE-ConnectionGUID: 5JmQCFigThm+37oDZubIKg==
X-CSE-MsgGUID: 0d/5u/eZQ8yq9ecK3NxeRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80765855"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80765855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 22:45:41 -0700
X-CSE-ConnectionGUID: SLojk9DQTFymOSsQT7LTdA==
X-CSE-MsgGUID: 9MYF/jYCSc6LaEUdWh6uSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="237633174"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.49]) ([10.245.244.49])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 22:45:37 -0700
Message-ID: <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
Date: Tue, 26 May 2026 08:45:48 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
 linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
 "Vehmanen, Kai" <kai.vehmanen@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
 <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/05/2026 18:06, Mark Brown wrote:
> On Mon, May 25, 2026 at 03:48:36PM +0300, Péter Ujfalusi wrote:
>> On 22/05/2026 17:58, Mark Brown wrote:
>>> On Fri, May 22, 2026 at 04:32:03PM +0200, Cezary Rojewski wrote:
> 
>>>> The question on the table:  Do we revert the change temporarily, fix the SOF
>>>> first and then re-apply the patch again?
> 
>>> Given that there's two drivers we managed to turn up bugs in already I'm
>>> inclined to leave the patch there so it's more likely that any other
>>> issues get found.  It's a bit annoying for SOF CI but I guess a revert
>>> can be merged locally there?
> 
>> It is not really the SOF CI but the users. it looks like all codecs
>> using SDCA infra is affected and will fail to probe audio on boot.
> 
> Hang on, are you saying you don't test -next or my ASoC branches at all?

We sort of test -next audio stuff in daily bases, but this would have
not been caught if I did not happen to be debugging something on a PTL
system with Cirrus codecs, using SDCA infra.

We do approximately weekly merges of -next audio branches to our sof-dev
working tree, our pending patch deficit usually pretty shallow to allow
testing before sending them upstream (we have sof-dev-rebase branch as
well to see them cleanly).

> It sounded like this was the result of a merge with some out of tree
> stuff you have with Cezary's change but it sounds like you're saying
> there are issues independently of the merge.

No, it is not out of tree stuff, it is upstream stuff already in use for
SDCA proper codecs, but I think what really triggers this is
c5ae3d8bc968 ("ASoC: soc_sdw_utils: partial match the codec name")
which is in 7.1-rc1, so not next stuff either.

I think the issue boils down to the fact that we don't know the exact
name of the SDCA codec and DAI for the function before they have been
created, thus the sof_sdw machine relies on deferring to 'see' the names
they got.

I think Bard and Charles are the best persons to comment, but atm Cirrus
codecs are the ones pioneering the use of generic sdca codec class
driver with Realtek and TI preparing to enable it.

I also think that detaching from driver defer and use internal card
defer is a much better approach, but when majority of new PTL designs
will be broken with no patch in sight to prepare the SDCA class stack is
a regression.

Charles, Bard, Richard, Simon, any thoughts on this?

-- 
Péter

