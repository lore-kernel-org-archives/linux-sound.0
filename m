Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0961B21B4
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764819; cv=none; b=ojp0OAsN+ERDOyoLhVuseRvIOWectR1hVztPH1KBLWd+91Ir1uDPowZGTmPxVeXK+MUKNwf+t0/Sf8rMcQU6qSfqVCiGU7ryP7IOKHjQmV0ILdVyvojEGuVUNCXWomZ/wHHEiOVIYhZGB/5p2EjkvasVTStwgEV8lmkBeu+ftUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764819; c=relaxed/simple;
	bh=aBVYFdI7QA20lHCV5+VuZKwYgUz+f/5T+lGtQaIWlKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8GnPji1Ux7TH1PrUtdJkxP0bOwUHPMFErY1bWfLtbpjYntwyts5TngeCIne66KjfBpsF7DmwljaKsPs2kKJEbJqN26zpd53v/dRbdzkUsEQodj9t4ofBDfHuC/S2AkFLzqyIeRrbyuhnaRW0JuRuLWxnwv8ifTEAKyasNYbJ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMG5gdZg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMG5gdZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743764818; x=1775300818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aBVYFdI7QA20lHCV5+VuZKwYgUz+f/5T+lGtQaIWlKw=;
  b=UMG5gdZgJ7gX1dnwyQ+qRIh36bnTHULi1cAtUieEb3oSviKjaEUQuxOq
   v81k2zzyLAOC2zc8NH+O9UKBRrJNX1CBgYoJbLcHiK51MXRRtfvXvwLU0
   Fm6KJ2qGaoQICUDjV2QTLc4Vgf5e/WzfAWeCw3lUg4Oxr5S2165Bsv/uW
   C0HcG1iuzh0mG4M2eHVFs6gMMRuij6k3N+0JOo8wMVuoVB4Bn0GhrMeAe
   JhVr1ttMRsEWH0CLBzrxMaB9nEPEXKhKphvTrfR//h2OaE1cIiTn9gQGQ
   srOieRM+w95MNzsMhhxb5r0aAkCnR42XKpa/P8FHSSL4qfiqkJAn2cQFe
   g==;
X-CSE-ConnectionGUID: y9mSLaPvTEGxUitxdepj0w==
X-CSE-MsgGUID: WK8ENnteSCu/ztSAtBfo+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47914934"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="47914934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:06:56 -0700
X-CSE-ConnectionGUID: L/MD6M4IQZ2Y0aenNW3OhQ==
X-CSE-MsgGUID: vB8tSBRKR6qXB/sjrCyhfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="131988510"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:06:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0esu-000000096pA-0ClF;
	Fri, 04 Apr 2025 14:06:52 +0300
Date: Fri, 4 Apr 2025 14:06:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	hdegoede@redhat.com
Subject: Re: [PATCH 1/8] lib/string_helpers: Introduce parse_int_array()
Message-ID: <Z--9S6NtDEjvjlyZ@smile.fi.intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
 <20250404090337.3564117-2-cezary.rojewski@intel.com>
 <Z--9IwA15IymHTiI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--9IwA15IymHTiI@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 02:06:11PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 04, 2025 at 11:03:30AM +0200, Cezary Rojewski wrote:
> > Existing parse_inte_array_user() works with __user buffers only.
> > Separate array parsing from __user bits so the functionality can be
> > utilized with kernel buffers too.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> But do we have a user for this? I believe we don't accept code without a user.

Okay, this patch 1 out of 8... Next time Cc people at least to the cover letter
where it will be visible.

-- 
With Best Regards,
Andy Shevchenko


