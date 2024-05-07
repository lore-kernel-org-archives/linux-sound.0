Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089116D4CC
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097761; cv=none; b=U6mAKBZbtEMvSkIiZ/1jZrfVEd4DlecrZmutb7eGw/IhOVvyz0EcX+emqoO/SQEE2hqNoWXGeo4xE/nbjbG8Q6VK9eo6TXh3efCDpggIzWI/Qb157agrZNZ1jmK9ijkWIdcK3nn5iLBzyn/L1nHOokRVliD8/5pc6zIvo+Gg2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097761; c=relaxed/simple;
	bh=pSZGI1umZ2YKrSkFRYTsqxJLn45cQtmW1QjZxg03j3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/tBYWOab+FMdViNwBXaMVPx1fYjivAZSgEGJZ533huaddSgntJSyaFvRr434DvxxksqgjPRzOHvSIMz3eHJhFjUdJWBliBjgBcCQwF7z86mYF0V/I47dM4Ks/kalEF1H7e8dPKQDir2X45V5N6SlNmdm3Kh4FBIwwmd4OfQbQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGkeMtZ7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGkeMtZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715097760; x=1746633760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pSZGI1umZ2YKrSkFRYTsqxJLn45cQtmW1QjZxg03j3I=;
  b=iGkeMtZ7C5/XApNDzfF0tpKX5bI8qZsEVIunezbToXvCVvKpXo1ZL1Ez
   63SCQG/FReNuIOzUInQexfNJAuhrsun+z4iE9iqVcGOlhaNwuy7e49Wx6
   vS3Zbg1HjIFfDEmYTv2SukjeIcElPw11iyWIyVbHSpP0Rfy//Ow0tGZw0
   TiKdcrGUxPJCE0Zf4k8eVvSmKXogxpQL0Uxh4a3qv6Yx0j5S5I4fuSvmw
   MnrRriRHgZx/lM6kFadJfVFGt8Ht2H2mI25vkKj1P29WSTplssP0MolDU
   UqoEl5BouXneG6xzdhbpuFJYVgrHLhrmPrQtvoB/3yxJqdnRexHyrWlVv
   w==;
X-CSE-ConnectionGUID: 2h2dZzySSFSqNEFByUV3pQ==
X-CSE-MsgGUID: aj/rn58jRVS1MCfkwULU+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28419907"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="28419907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 09:02:39 -0700
X-CSE-ConnectionGUID: c42o0PcZQeC7UNZjjHnwWA==
X-CSE-MsgGUID: 0E0oaZmeQKiFevoOe0Hv5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="59417877"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 09:02:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4NH2-000000056C1-07a0;
	Tue, 07 May 2024 19:02:36 +0300
Date: Tue, 7 May 2024 19:02:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
Message-ID: <ZjpQm-hxLQtpgkUx@smile.fi.intel.com>
References: <20240507135513.14919-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507135513.14919-1-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:
> Hi,
> 
> this is a series of trivial cleanup patches for Makefile in sound/*
> (modulo ASoC -- which will be submitted later in a separate series).
> 
> As Andy suggested in a patch review, *-objs suffix in Makefile is
> basically a mis-use nowadays for kernel driver modules.  They should
> be replaced with *-y suffix instead.  This is a result of systematic
> conversions, separated per directory.

I briefly looked at this and since it's a mechanical conversion I don't see
any issues, so

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


