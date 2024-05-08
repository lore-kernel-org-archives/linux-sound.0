Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D112B175
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190348; cv=none; b=mHsXB7vOqlkP2jVC/4jkAIr1ApTbqU3mtKEAjExwsqPnB91MkAlvPWz8GTc72+Z4i7wqJzXn2S4qkic0+aeVoSUqeN9SWYLPVbFIvSkDpTYQH/psx1IXVtpq3M/zTz+UxuG4yh1Jj07Wlk/cUwDcm2tgc1enYNmrSY4Q4yVNzxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190348; c=relaxed/simple;
	bh=5gj1fExbks9Fy978Yk/hHFZBNq8ScZxLpX0KhrmI1Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/W0uKTkbp/7ri0DBcK1udtMRTNrDsbJjt/UThxeWLhBKzyGA73Lqg15XGhYLxVEd3ywNHzn2c/7XNNjiuI8gwR4QAuMjQRcOnflG4QM+dnZ/dIWkUUiQGKYNrU/tNnFSGGOCXddGLGH179Pc8QrNs8vquoe7NdC/jGyrKD8lHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkQob59o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkQob59o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715190346; x=1746726346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gj1fExbks9Fy978Yk/hHFZBNq8ScZxLpX0KhrmI1Z4=;
  b=RkQob59oqgqAiYtp+gA8dQFhHlq6Sgkk8QtDSMl4u5q7m54WeQnKTEym
   sgX8rzerwaCLYa2P7cnALDZcEKhogb16W7dttpMYhbMn0oJAVzAHl8+Q5
   jMHVFtGZpUeMZKB3w3EkgxyAOsBKrgyRAbs45/zSMNqSGepLtT7cAbry5
   ICrwenXrNa8FioQ6fBgDhSqyHem6aRMBAuf4dXDA5AmT5KYBubNp6Bytj
   WVKD51jL50ftwTnt+2J15xfghoNSGbbY8MZQYYqDYAGUGGPL4oMSIabLA
   yucgztf2Ypx0J1HTVlpC9FWbuWKoBZnNx84vWG6hthN4WrmXnoyJoGvoJ
   Q==;
X-CSE-ConnectionGUID: 8JF1fvcCSHyuN8XVkZRjjA==
X-CSE-MsgGUID: czH3FzPfR5GvUxWQxZ4loQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22474955"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="22474955"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:45:46 -0700
X-CSE-ConnectionGUID: BZTeAkJ6RQGqd2mt7vtl/w==
X-CSE-MsgGUID: NjoaYhNYR2+e3xEs0feFtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="66401174"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:45:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s4lMM-00000005WiA-3ylR;
	Wed, 08 May 2024 20:45:42 +0300
Date: Wed, 8 May 2024 20:45:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/12] ALSA: hda: intel: Reduce CONFIG_PM dependencies
Message-ID: <Zju6Rvh4Qlg9F0bJ@smile.fi.intel.com>
References: <20240506161359.6960-1-tiwai@suse.de>
 <20240506161359.6960-2-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506161359.6960-2-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 06, 2024 at 06:13:44PM +0200, Takashi Iwai wrote:
> snd-hda-intel contains lots of CONFIG_PM dependent code although
> CONFIG_PM is almost mandatory nowadays, and it makes the code
> unnecessarily complex.
> 
> Let's reduce the dependencies of CONFIG_PM in snd-hda-intel driver
> code.  I left a few module options to be dependent on CONFIG_PM (which
> are visible to users), but other places are either enabled or
> optimized by compiler automatically.

...

> +static int __maybe_unused azx_resume(struct device *dev)

__maybe)unused is discouraged nowadays.
We have new PM macros (w/o SET_ prefix) along with pm_ptr() / pm_sleep_ptr()
macros. They are preferred. In complicated cases the PTR_IF() can be used
directly.

-- 
With Best Regards,
Andy Shevchenko


