Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1DB2957A8
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558912; cv=none; b=RuLQE4zhfJ74thaxCz/dHO5ajYM1uJQXYtHsSIyVuRV6PmaJ9fN9N0KCffXd55ysd/fqHBZ+lp2yxNo9MNd4/rHTPxUD/OOwhiKvfDuiCS4hjyLtZ/df7HizleiNr5j7d0ziO30iV+IDV8Jbt7SRczjeo+IpzFSVBCA3iM7ZtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558912; c=relaxed/simple;
	bh=eiTlyvMCjvnBvvqqqeJb7WUrSXAfu8/bfU9CBF+8niE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQ2DJ5PKY2hVr6oQNAtPmrbygh1Elakjb8ylpe7FEZF3tv7RXWoHe+Pf4Chui6H5eddDFdN0VgXs0f2gGopaVARSjb3APoV4Xz6rJZTBUM886f1o5q1erZAg4XN1E3T0xT7IgU/wlKo8hleDVmug//jmL314fBdFKtNb0SVuwFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkHkpgsR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkHkpgsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749558911; x=1781094911;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eiTlyvMCjvnBvvqqqeJb7WUrSXAfu8/bfU9CBF+8niE=;
  b=QkHkpgsRIsy9DbNqjSXR6m5Co+YkcHDtxNZxvVofeqsh37kkLpCIxR5H
   lguUKeCLQkrzH9KA510sRUPLq+RPYuCDoMOM11mmh2mrgbPJzDNjtfsHL
   pb4k9e95q3GEiQGufP4ZdV3OS6IdaXFfLz6YcezjwJWQjIXxB9pZZBJeP
   Yzg+uGTZRr08ghP/ZebmjKM4QOhTPayJGmldflfdJuQkjqcy3hRoBv1kL
   EcOb1jx/LOMBanSBRopwxeCO4zIcu8whkUi2g7rWo5QL1omq7+fGiAdUj
   Fv1OLjjXDXw8qsgH3rKL2GmvBnxXfgQ4rcKTyo+9SrH+NvYYzJxlJSjX8
   w==;
X-CSE-ConnectionGUID: oILw+1QETxOdXnlkcgHNjQ==
X-CSE-MsgGUID: vZ8XG91vTeyps9nMF7WicA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51809095"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51809095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:35:10 -0700
X-CSE-ConnectionGUID: grchrimAQa2/9jQnv9v4Ew==
X-CSE-MsgGUID: ZvHr8S3FSLKvCPXJJyZgYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147395935"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.170]) ([10.245.246.170])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:35:08 -0700
Message-ID: <11029ccf-5128-4fe8-bef8-9fd6de316e37@linux.intel.com>
Date: Tue, 10 Jun 2025 15:35:09 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
 <cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/06/2025 14:07, Mark Brown wrote:
> On Tue, Jun 10, 2025 at 11:51:41AM +0300, Péter Ujfalusi wrote:
>> We have quite menu empty sub-menus, partially because they would include
>> something which would not be select-able in this arch (Apple, Au1x, etc)
>> and things that does not even have select-able options (SoundWire things
>> for example).
> 
> It'd be good if we could hide those, indeed.
> 
>> I personally would prefer to keep the 'Sound Open Firmware Support' as
>> it was, probably moved above the CODEC drivers. SOF is more like a small
>> subsystem within ASoC and the stack supports various vendors (Intel,
>> NXP, AMD, Mediatek atm).

With some internal discussion about the menu entry name change for SOF,
we concluded that it would be better to use the following to imply that
it encompasses multiple vendors and platforms:

'Support for Sound Open Firmware (SOF) platforms'

>> The other awkward thing with this change (which was awkward before, but
>> going to be double awkwarded) is that the Intel Machine drivers will be
>> quite detached from SOF, not visible of hinted that they are now under
>> "ASoC support for Intel"
> 
> That does make things in line with other platforms, though (as you
> mention later).  The issue I guess is to an extent that people might not
> know that SOF is important for a given platform, prehaps it should be
> selected by platforms that need it similarly to what we do with CODEC
> drivers?

At least the match modules are selected from SOF stack and if I'm not
mistaken some or most machine driver will be selected as well, likely no
need for users to hunt down the needed one.

But this is the reverse I guess than what you suggest, The platform
selects the machine driver and not the machine driver the platform(s).
We have generic machine drivers for SOF, used on several platforms (HDA,
SDW as main examples).
Probably this can be reversed, but touching Kconfing never goes without
regression ;)

Apart from this, we also discussed that from our side it is OK to move
Intel SST, AVS (and it's machine drivers) and the 'Intel Machine
drivers' under ASoC support for Intel.
This Intel submenu is going to be a bit unorganized as it will contain
only a portion of the drivers for Intel hardware and some of the
platform drivers (SST/AVS), but we don't want to move things around at
this point.

> 
>> The other thing which made me wonder is the 'ASoC support for' repeated,
>> would not be simpler:
> 
>> --- ALSA for SoC audio support
>>       Analog Devices  --->
>>       AMD  --->
>>       Apple  ----
>> ...
> 
>> The title already tells that this menu is for ASoC.
> 
> I don't have a strong opinion on that one.

I'm not sure about this now, probably it is better to keep the 'ASoC
support for' in case one searches for symbols? But that will show t*he
path to the menu entry, indicating that it is ASoC.
GPIO for example adds a postfix, some subsystems do not add the
subsystem name in entries.

I guess whichever looks better?

-- 
Péter

