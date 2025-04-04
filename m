Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC02E62A0
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764778; cv=none; b=ox81Hh/zQOry4yZxjgRX9gt0hiT/96MWhcbr8owU9y/flag4MI0eV1q2hrWgvgMMir08msLlUWvCXR1GDKYTiYOMYsiK364fAwrArDrR/ixkCqyvH4hH7tPRVbMYeEYzWu8akytGeO974FxxAeahPnpq07ISd2KXW8mavYon3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764778; c=relaxed/simple;
	bh=1elJ04tI4GMyWL9IMtnlXKAU6XHMAYSi6HkMJw2Um0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6R0GuR7BLsE1T1RH0EpKoW5gudpcb+BNSVwJ7238vgt/IEhtO93+3DyhZpAdD8MYSNctHUndzqsNLJkbeor/ENvKYBgbqf/g6mUwBH8an6miZISeIFIivsC7uFOzxTqICyH5XmLeozrmuklq9Ba6QnuCcSBRn1AzQ1UXJLMQuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvtNa2K8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvtNa2K8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743764776; x=1775300776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1elJ04tI4GMyWL9IMtnlXKAU6XHMAYSi6HkMJw2Um0E=;
  b=EvtNa2K8BXxtBno5xQEJsgxlFNqvM9WFP45VcYi/gRa9Hx8HuawULUAj
   LZJrPMhrfp7z58CNPY0oeIcPZ6hailHjO13TrQhDT4LQE31oOzLrJIH05
   HC/VCY/ARl2ruHXusQsuYwUQcpe7wVyLgka3ZsdsxtblxkdBUnysUj2mw
   fC40V5YIM0qnAd9hdVbauWb+sBWVjZgU+Owd37Iwvr5TcLMI//XsCqCjO
   tjKQKOUNTJ2OTqJpgmvCwbAKTpL/Vl9CEliGrBQXKrQJzAwvf15B0ZCnx
   jEONmPRlz9GydTk2octVRdPqbiQZ3RqFn1AaVeXaoid1LYMLfU+2MmdeM
   A==;
X-CSE-ConnectionGUID: +zgNPzw0TPmM8rCiEk1s/Q==
X-CSE-MsgGUID: +LOr8EGRSBm0BC1asv4Pcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44450091"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="44450091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:06:15 -0700
X-CSE-ConnectionGUID: lgPOMxdwSCW2jtxXNaNp7g==
X-CSE-MsgGUID: 8pCM8brgQIqDEi3SrFoC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132404466"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:06:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0esF-000000096oX-19hU;
	Fri, 04 Apr 2025 14:06:11 +0300
Date: Fri, 4 Apr 2025 14:06:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	hdegoede@redhat.com
Subject: Re: [PATCH 1/8] lib/string_helpers: Introduce parse_int_array()
Message-ID: <Z--9IwA15IymHTiI@smile.fi.intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
 <20250404090337.3564117-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404090337.3564117-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 11:03:30AM +0200, Cezary Rojewski wrote:
> Existing parse_inte_array_user() works with __user buffers only.
> Separate array parsing from __user bits so the functionality can be
> utilized with kernel buffers too.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

But do we have a user for this? I believe we don't accept code without a user.

-- 
With Best Regards,
Andy Shevchenko


