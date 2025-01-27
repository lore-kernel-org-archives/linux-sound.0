Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E41FC08
	for <linux-sound@vger.kernel.org>; Mon, 27 Jan 2025 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989132; cv=none; b=GDJX2ui8dVdjJM+tsiy2ke1KmerHViAP3NHccvaiu1SR6GVP3BZkogPPrXI2GY5WYS0hUJZAKRhtXl6sIHDDQCJwqCRx2gXCKI1b1Vj5jwfalcUitpP350bpOeEPDUhnoPymTjZ7SXhCen8Zl4/a6B7jT/FVKTb5vsSL1voEQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989132; c=relaxed/simple;
	bh=n+JVVNlZ3r3KXwE2cblD73OOfCi0J2JMNc/f/exzQFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOVXM0WpXijHMbBbNv4Q5f5ZMrOziqx7I04RzUHkYNIsdpSdpVEyV5Ud5q8c8hfqTNokRGocPmFwsiGpsiR3nv45LYaSLUqaP8lnB4UpUQIZyv+Cd8V+8oKsWwUup0J/1RwtWbpGfWVK6kqyrKcYSKe0Xsm948Qu+XrJB3RTqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcCTY0jn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcCTY0jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737989130; x=1769525130;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n+JVVNlZ3r3KXwE2cblD73OOfCi0J2JMNc/f/exzQFQ=;
  b=RcCTY0jn6WB98DSCY7jFjk9HFlumpvS7uQ0A4Bv0ExKckbXG60PhnywH
   e4yJztpiIbd8Rb7iM9NJqzXkMJXdUP1t+Kqnq4ePJxZ3DxHdeprhRBgJ4
   RC4DyB2QbEquhYy9kEjtR/jvOxxSPVJildmwBjEP3uTN7+HtOsAU7/bcb
   S3kv1ksfF5FTES9pT5VyQ+jTLUZyK5mzXYgq2cqL2NiItVtEddi5vHthL
   vFXSZud5qAFkofsxceAqN97bfdsQNZ6xpo6ysnbvrNn/Xnkg24maKG8gI
   y7dsMMAZcPvi4ETQGg7+4xhb3863nz0r6oUIutpYLHgMvNWO523Lqf23q
   w==;
X-CSE-ConnectionGUID: vy5XrcnzQIKxjwX1xD2jFA==
X-CSE-MsgGUID: R5WmvmA4R5qv7q91G0c+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38151286"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38151286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:45:29 -0800
X-CSE-ConnectionGUID: NJ7Y62X9TTCFiNK8Nw8huQ==
X-CSE-MsgGUID: nYvD+RJoTS2F3NFwUI2Iww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131748367"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:45:27 -0800
Message-ID: <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
Date: Mon, 27 Jan 2025 15:45:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/27/2025 3:44 PM, Amadeusz Sławiński wrote:
> Currently ASoC cards when enumerating create CPUs rtds first and CODECs
> rtds second. This causes device number on cards to not start from 0, but
> from number of present CPUs. During that it does count number of rtds
> and uses it as device number visible in userspace.
> 
> This patch changes device visible to userspace, when listing cards:
> 
> Before:
> card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI1 (*) []
> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI2 (*) []
> card 1: hdaudioB0D2 [hdaudioB0D2], device 3: HDMI3 (*) []
> 
> After:
> card 0: hdaudioB0D0 [hdaudioB0D0], device 0: HDAudio Analog (*) []
> card 1: hdaudioB0D2 [hdaudioB0D2], device 0: HDMI1 (*) []
> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI2 (*) []
> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI3 (*) []
> 
> It is done by skipping back end devices and only counting front end
> ones.
> 
> Now there are few concerns I have:
> - while rtd->id is not used much, few drivers seem to be using it as
>    index into a table, above may break this use (although
>    "include/sound/simple_card_utils.h: * the ID stored in rtd->id may not be a valid array index."
>    suggests that maybe it is a bad idea anyway, but I'm not sure how
>    generic that comment is)
> - this will break user scripts, with hardcoded device IDs
> - this will also break some UCMs with hardcoded IDs
> 
> Now my main question is, if such patch would even be considered?
> Perhaps device IDs are not considered as "stable" interface and can be
> changed and my above worries are unnecessary.
> 
> Patch is a result of discussion from:
> https://github.com/alsa-project/alsa-ucm-conf/pull/499
> and as such I may consider others ways of fixing the problem.

And it should've been RFC in topic... :( Sorry about that.
