Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644261C862F
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713311; cv=none; b=nU4MA0qJxccMX5sLyxVScFuONeciC1GFdM4B+RZ07VKHmNdCDMV95PMZMnsy1NfRRM37z9Evhn1HjSwEwnDxTRcoCanGJd3scHFC4awlmWxaIYapdFGzkSJCj/abLECSAbQn7FJLxR3J670VMoQ0CiA9X21hgNne6fn3HJEPMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713311; c=relaxed/simple;
	bh=5dtBI51k6eZnfsdzxy28mXMrmCd37AaN7bKEFxcOacE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swPh4EnTLd2D3sLxpLFJUtwV3jawUkRntaVdhp/kHqVD7V8PK3WPByFQF5w/MxC2yi1ITdCyVC+QY+pM2AOohqAFAh7hpvi2J6/QuSDG4w8WBbdcZDUTtFZjdwQHKeBXozQtPvAidPXYLN1nZBUI2nPZkPcMcgJ1uT6zxpBJKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m51HcIwK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m51HcIwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779713310; x=1811249310;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5dtBI51k6eZnfsdzxy28mXMrmCd37AaN7bKEFxcOacE=;
  b=m51HcIwKDHfzoecV8a5HZKNg/wr2nwY59XNAt6lFrrtP5Lgu0hfAclgG
   a9YMU0SGLV/sk6G7be3+t1oMFCBisRtKdvRxr8nON2kagHnFENqwkwcSI
   JapRV5fBdDOqA+wZZQ8dHmoz9VZwZ43K89RU3ZcRFd9YG3hG9EHRgYELZ
   o7MkTaEs4jWy9aNS4o9uSkKoV7Fg/jJip3H5W4+cRiG6RsDj6OZ/ZjkoC
   1gAs3CZDiaR8ClWzDpc1sSWVUwzCcTwHSFB/WOCD41VHpuVexW9aP9IIn
   kjJRPFdGQUlG9N5RZGlXtOhAc6oL0Z/jO+bHWP+ZslTNjt1gd5LAvxE8Z
   w==;
X-CSE-ConnectionGUID: q2JSUiXQSsWnUXcz1lRnkA==
X-CSE-MsgGUID: VmKOsmKVTcWDI3HS3L/FnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83111637"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="83111637"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 05:48:29 -0700
X-CSE-ConnectionGUID: wIr+9x0JRxOzWKeRKAKi7Q==
X-CSE-MsgGUID: dgz02TjHTLSRvuqnkH46rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="235235221"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.187]) ([10.245.245.187])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 05:48:26 -0700
Message-ID: <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
Date: Mon, 25 May 2026 15:48:36 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 "Liao, Bard" <bard.liao@intel.com>, "Vehmanen, Kai"
 <kai.vehmanen@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/05/2026 17:58, Mark Brown wrote:
> On Fri, May 22, 2026 at 04:32:03PM +0200, Cezary Rojewski wrote:
> 
>> The question on the table:  Do we revert the change temporarily, fix the SOF
>> first and then re-apply the patch again?
> 
> Given that there's two drivers we managed to turn up bugs in already I'm
> inclined to leave the patch there so it's more likely that any other
> issues get found.  It's a bit annoying for SOF CI but I guess a revert
> can be merged locally there?

It is not really the SOF CI but the users. it looks like all codecs
using SDCA infra is affected and will fail to probe audio on boot.
I did not has time to fully debug it, but how the currect system works
is that we don't and cannot know the DAI name of an SDCA function, they
are parsed and created by parsing the DiSCO table and they will have
FUNCTION_NAME.index, then index is a running number.
If the table has different ordering than for example UAJ can be
UAJ.1/2/3/etc.

The current way is to wait for the codecs (SDCA stack) to probe and
create the DAIs then we check and adjust the dai_link in the sof_sdw
machine driver.
If the SDCA function probes after the machine driver then we will never
have match for the dai link.

At the moment I don't see a reasonably quick workaround for this, but I
let Bard and Charles to comment.

Users of PTL are likely to be affected as their design seams to be
closely identical with most of them having cs42l45 codec for Jack, which
is SDCA only.

-- 
Péter

