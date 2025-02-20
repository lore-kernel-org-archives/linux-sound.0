Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB41FA851
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060684; cv=none; b=ePtJRcg7Alf2AJ4WH7ji6VUjqkfiJ7Ln6YXoZbRsI3YP9RO7jgCIqAi7+AtkFw1Qr7Kek6ssnjQZuFhdf87vFlJQU3nGs+N6G7e2TossT1NprvKxQwpatWHz43pIfEb6JhRnSNHGwUeECNKA93qEsv++tAqAI7g/6oyExpq+sqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060684; c=relaxed/simple;
	bh=Itu7ZdWViqNV7n0ZvNRXYpVeMiFgXeh1XjE84tCTdhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwHFr4S6Gn64n5KwUJp4DpVM6Iqld1KslGV3JR+PXlfCye7zoU0QPiZf9mMUi0oxGH8sLhIAe3Ow2WOBk4ZQ5R0s1wqmHG3sTKt/Vm5SBfWI6dZPLmN1dHagr6LTaH7F6S0cABbO86YxcqpTh5PnBXLf4tu+kvzHhuJ+JXl45jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WD9PLhGk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WD9PLhGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060683; x=1771596683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Itu7ZdWViqNV7n0ZvNRXYpVeMiFgXeh1XjE84tCTdhk=;
  b=WD9PLhGkYJ3YD7DtkjrjeWg4lke+tJqyUUnOXtZv7//XK0njoalwC8YS
   1HiSxhZ8LXjegmy9dOGITOits+3RluI691+M1+LIL9wWmgozk+27sYY3M
   nPJvzQyd8gpDB3OdJB179HL4QUsrJcQvX7YcNcJQ/EroBgDyHnBFrMkxn
   x7VAgnkhhdBalLvjV+bhIuJZRpj++XXDBrf7X6NfQH6wYHFRU4+6gTHew
   cYVLxptwlbVLblnOnHy3bqP4XdEC8uglr8Fj6NYnYtsNoLnkCRfMBrk9N
   l3ohIQrKkM52kuwvlunW2e7BVPpWwUxwYEbmkUnpWcPtvIfcJi1PiEXaF
   w==;
X-CSE-ConnectionGUID: LhK/SdsLSJaJEGlMsFUniA==
X-CSE-MsgGUID: k1KZCbvlQoq3UFM462zfbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43672532"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="43672532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:11:23 -0800
X-CSE-ConnectionGUID: aalzcGdWQT2qMhcPDDUaNQ==
X-CSE-MsgGUID: B8uLPA1KT3K8TJKZ7/KHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115954066"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:11:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7Gn-0000000DM5K-29mx;
	Thu, 20 Feb 2025 16:11:17 +0200
Date: Thu, 20 Feb 2025 16:11:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	oder_chiou@realtek.com, flove@realtek.com
Subject: Re: [PATCH 06/24] ASoC: codecs: rt1308: Fix definition of device_id
 tables
Message-ID: <Z7c4BaI8XgOoY7hz@smile.fi.intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-7-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220112643.3813295-7-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 12:26:25PM +0100, Cezary Rojewski wrote:
> There shall be no comma after the terminator entry and initializing
> fields with 0 for statically defined structs is redundant.

...

> +	{ }

> +	{}

I think you want a bit of consistency in the style of the terminator.
Preferable (by majority) is with space inside, but some are okay without it.
I have no preferences, just one style for all in the same driver.

-- 
With Best Regards,
Andy Shevchenko


