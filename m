Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217F43DA7EC;
	Tue, 28 Apr 2026 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370849; cv=none; b=oAWqMLZcRPw6XVYv+fzrzuCPt/mohRqDrD/UneXHHe4WEVRjAAggo99vttHQVROcfXII7bFFh/gTTDCo+FeJhCqpJsTNBVttER2tZ9umietv6Eiv+mQay1WOE5lxxRt65Qp6tByTLs8Lu6CmbM6XgTT79NuXHv0O2vJb/87s4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370849; c=relaxed/simple;
	bh=AF2fENPpU43wpFTBNcPRe7V90eWsDczoR0wOepmviiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoWmLHz+1l+JRGXrXxkvePcKaupmYj9sXVKoYBIXnZT4kHqm6k6zqyZQrHlhZRfy6msa47/+ZNDtTPyFe2ZQD+H35LpDQpECpx4LuU6i9HhmYnjKny5tsJYen+SHrOit0JpcjggLuojb/gik6Q1X0OnETozM2P1P7GYkf9tqXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6Orqgs9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6Orqgs9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777370848; x=1808906848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AF2fENPpU43wpFTBNcPRe7V90eWsDczoR0wOepmviiw=;
  b=l6Orqgs9k+UpDqn6ct0vlT7a+V0fmyZ4ihs0tZTJOFX4xgNtocCHH2ad
   VnHdYsfc75fo4gkxrqFHMT/kg+UlBEgMXVDPhsGBeouQc2yiGtl6ARUts
   FbBPBlHwF5q4QSkP4LxmhctdNYEfnC/GGk0Fn+YekO/t9C9O90XmvqO8c
   QvrhVsD1D+K8VcrN1acx806iGLZk+VuqBAAHu6adpG8xCUyiVY3GOvnFW
   4s06ncQ/0Jd7E+7aQJwaLXMxKWLpXhYFiOAnhzXzoW5wDnKEZC00Atr+X
   XeVbBCELDko75AUyF0ZsR6JQnl8Uo0D6lZGQxdfOnlN1apfFiRV5Dqd4H
   g==;
X-CSE-ConnectionGUID: A4+iag5wQ4+Bls7YotNmow==
X-CSE-MsgGUID: Wl6F/qLBSBm6nVP96lAwAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78337280"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78337280"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:07:28 -0700
X-CSE-ConnectionGUID: QKI+ZT00TEikEBZa5RdgvA==
X-CSE-MsgGUID: IEAPSMdYQvWx/YyP4k3Xpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229345121"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:07:25 -0700
Date: Tue, 28 Apr 2026 13:07:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL
 checks
Message-ID: <afCG2hkbC7c6mCxZ@ashevche-desk.local>
References: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
 <afBqy-LWQ6th2S9v@sirena.co.uk>
 <afBs-GWQYIdcv0zM@ashevche-desk.local>
 <afBx2D_hwLccJj3v@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afBx2D_hwLccJj3v@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 28, 2026 at 05:37:44PM +0900, Mark Brown wrote:
> On Tue, Apr 28, 2026 at 11:16:56AM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 28, 2026 at 05:07:39PM +0900, Mark Brown wrote:
> 
> > > There's also the fact that as part of support for optional clocks the
> > > clock API will quite happily consume NULL clocks.
> 
> > This clock is not optional, it's always retrieved with devm_clk_get().
> > When the flow runs into these code pieces the mclk != NULL, and always
> > valid (excluding some unrelated to this driver strange data corruption cases,
> > of course).
> 
> > But yes, the CCF APIs are NULL-aware for a long time.
> 
> My point is that it makes no difference if the caller does the NULL
> check.

The dead code or always-true one is not welcome in the kernel, it increases
unneeded burden on maintaining and understanding. While your point is correct
the lesser the code base the better. I don't believe we ever get this clock
become conditional (optional) again.

-- 
With Best Regards,
Andy Shevchenko


