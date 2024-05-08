Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628B276413
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715161566; cv=none; b=eMMgKqdIzZ9fplbs4eyIB+P6EQR4cSbGngARRD49Aado0moT7tsZM6KqAuYea8Uqu3EKgglmwJTeDSBPXxqs1ayd9A9+kzrExGmX4pjbYysPYxSgYeSyE0PQlCDGx2FA4zVmvPVxOEuOs2wCSO+pcsEU1KBeW9BwJuaCQxLeKpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715161566; c=relaxed/simple;
	bh=SMpwBkOpnYkahAhuKZYAh1thtMZaTZRgtAAblOVt8vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTZ2yHc1d69/v+L+cneGEtR1lR/ov8kr51QOQCaHC9u0TjhDoBZUIDReAaDlB48U2AZnnneQ7FVQSQvsphghGqvdoKl/g4fDeuJwc/WfaGgGGN0s0pTZw1EuX7t5ygOr4GipbbbubmkLLGRGPDGRfoLpigAjfmjOTrn1+c/Dyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUMcUg84; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUMcUg84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715161564; x=1746697564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMpwBkOpnYkahAhuKZYAh1thtMZaTZRgtAAblOVt8vI=;
  b=PUMcUg84c+EbDBbAj93rw7c+0kY7s/173YAq1xjHBpeUetFvphKzF53J
   xTdPTw5SgxcYeEk8zrIcqmlC875kLvEOKBpGDGbbzuDeaMrOA9rTXOOAx
   0AKbyo17mJ+lqM5qQ0FR98QuzIjfyO4xvLENx2aA30LmiVYRI4tZHg0J3
   N6X0I4VBDV1OoCfr6KY8WU2BjdKi3FYyCuHIeB34h7Gp1zivJvcgkir4w
   misg3GMGB3VZZ5OwXKj8Wlo4BrE68iSKhp34gvukPKAzg/Fb3px3svde0
   wS829tRUJUndgIrO/YDZm2cDhorYeS5AUAxg2fJAiZ9eGowrubB+kRk3w
   w==;
X-CSE-ConnectionGUID: RSVSlGBKSw+VQfVj+b/6DQ==
X-CSE-MsgGUID: syLsund4T2e2yHJlZsHF2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22416954"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="22416954"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:46:01 -0700
X-CSE-ConnectionGUID: KUYyiqELS128gzxK7j3Gnw==
X-CSE-MsgGUID: MZHAiqdzSk24Lf5Z5ivkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="33354339"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:45:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4ds6-00000005NhU-0J7D;
	Wed, 08 May 2024 12:45:58 +0300
Date: Wed, 8 May 2024 12:45:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: Add missing module description
Message-ID: <ZjtJ1WOOmkSpEiLi@smile.fi.intel.com>
References: <20240508091128.25274-1-tiwai@suse.de>
 <ZjtHiq52po1kfZp2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjtHiq52po1kfZp2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:36:10PM +0300, Andy Shevchenko wrote:
> On Wed, May 08, 2024 at 11:11:19AM +0200, Takashi Iwai wrote:
> > Hi,
> > 
> > here is a trivial patch series for adding the missing
> > MODULE_DESCRIPTION() to the code that can be built as modules
> > where make W=1 starts complaining the lack of MODULE_DESCRIPTION()
> > since recently.
> > 
> > Fixes for ASoC follow later.
> 
> Probably Reported-by: fits better, but I'm fine with either.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

In case you decide to switch to Reported-by, replace also Link by Closes tag.

-- 
With Best Regards,
Andy Shevchenko


