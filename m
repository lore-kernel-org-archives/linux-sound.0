Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FDB1D67B8
	for <linux-sound@vger.kernel.org>; Fri, 13 Sep 2024 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228510; cv=none; b=bd1WsKCYHfdw9Tmws9NitN7A2tJprBTkzfX3UxkNoUHHw5o729l1mKmKkvQMuUze1QKZnzOfVtvi5IWVBmpGFkSVgpB5soEmZC7Uwxl+W8G3JD9emoCbgOfeHtDhwMCZkE/YlyDtDh5Ov/6ao3ImJ9dZiHVSc0/ZEvnEtxVsEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228510; c=relaxed/simple;
	bh=xmNpzz3+CRNT1fZuUU5bLVTxfrWUCEeO6BuVYA1S9u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzcwWezXK8ZY9UsgrAdpwdhn44YlEbfbvJX4psEZwZSsu5YABqAVeoUDqHQxOVNDRrWsHaiOQR/OeZz2EUF7UtWUyYEN4ukTLBONZ29aSkcXBRtDsolGi3inD+KBuYxZrjkRDA0/eW0qxkcblYlQ6kLmsH+7GSJ67Mn5trPSpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hq01GJTk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hq01GJTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726228509; x=1757764509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xmNpzz3+CRNT1fZuUU5bLVTxfrWUCEeO6BuVYA1S9u8=;
  b=hq01GJTk9u4sV8T46xrOgPWzLKmBCZwfF1hWwyP9yfpUZBhWLU4xs1bl
   Oed6nRXbs4ev2Z14FAAW4Hxw3mhZvud4qZoB3HwQ3CnipRUATILXjg00x
   fqRmLkgTaOS1p3VItpMbIadbO+NmVwCuT0ornhnpIC5/N7EPq9R2CfYqc
   WuWJdSgpi8GlLqH8mNZ17ws/WMr2fscU9XYL/QPUAFSfO+BVLQP5jD/xj
   687g/OwH24bQ/JU45IZs2Z/VPdUo4LLFhdrtnbVRorT0OKYecM9OG4CWV
   0F9WUNQK5U35/86cCSQa1JYxujUbEL6GNc3e3jmdLtk9lZYkO53tnqmwW
   w==;
X-CSE-ConnectionGUID: SPWM8PabQ1i3jOWB2AZ8/g==
X-CSE-MsgGUID: aNyussSAQ9eBlpFdHbVmKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28871335"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28871335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 04:55:08 -0700
X-CSE-ConnectionGUID: CT1q92YtQoykMmigt+VuQw==
X-CSE-MsgGUID: tOSe+rmwQhaW2Sv/49p8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68285580"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.106]) ([10.245.246.106])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 04:55:04 -0700
Message-ID: <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
Date: Fri, 13 Sep 2024 13:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
 <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
 <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/13/24 12:59, Cezary Rojewski wrote:
> On 2024-09-10 10:14 PM, Mark Brown wrote:
>> On Thu, Aug 22, 2024 at 03:57:22PM +0200, Cezary Rojewski wrote:
>>
>>> You've shared many scenarios, I do not think we can cover all of them
>>> here
>>> and while I could agree that current FE/BE (DPCM?) design did not age
>>> well,
>>> we're entering "rewrite how-to-pcm-in-linux" area.
>>> If general opinion is:
>>>     it's too much, we have to rewrite for the framework to scale
>>>     into the next 20 years of audio in Linux
>>
>>> then my thoughts regarding current review are:
>>>     if the avs-driver needs sideband interface, so be it, but do it
>>>     locally rather than polluting entire framework. Switch to the
>>>     framework-solution once its rewritten.
>>
>> On this bit as I mentioned in the prior reply there's been ideas for
>> redesigning how we tackle digital audio which I think there's general
>> agreement would be the best way forwards.  DPCM is very fragile and
>> creaking at the seams, it can't really represent scenarios like the
>> sideband case you've mentioned well.  OTOH a redesign is a very big lift
>> and there's never really a point where it seems constructive to actually
>> block things on it so long as everyone involved is OK with what's going
>> on.
>>
>> The upshot is that while I'd be *really* happy to see investment in the
>> framework side of things I probably wouldn't block a driver specific or
>> DPCM solution simply on the grounds that it's messy.  DPCM would need
>> buy in from other people using DPCM of course, and hopefully at some
>> point someone with one of these issues will find that the cost of
>> maintaining a bodge is going to be enough to push them to do the work
>> (or someone will have free time to just work on the issue).
> 
> From my experience when it comes to redesigning/rewriting entire
> project, the "upgrade an already running train" strategy does not work,
> so I'd not recommend that.
> 
> Instead, I'd suggest to have a second, separate DPCM implementation
> present next to the existing one and have users opt in during a so-
> called deprecation period of the existing one. Once certain amount of
> time passes, switch all of them. Clean slide also makes it easier for a
> developer to be creative.
> 
> Do you view the second option as viable?

Classic problem without a good solution. In practice new features or
corrections get added to the 'old' framework and the new one is not used
by anyone just yet so it keeps running behind in terms of
features/maturity. And due to limited validation resources or limited
access to a wide variety of hardware, no one is quite ready to enable
the new framework on 'old' platforms because that would break quite a
few devices.

The other problem is that the 'switch' would mean a compatible solution,
but the problem is to get rid of the very notion of front- and
back-ends. Existing users of DPCM have undocumented hard-coded
dependencies on the order in which callbacks are handled, it's not easy
at all to change the routing engine.


