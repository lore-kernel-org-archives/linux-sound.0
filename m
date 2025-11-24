Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BE27FD5D
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995334; cv=none; b=WcRe00RN1bv99B4ASNt6rvh8Q6lDYOC/fY1ka+kB2c9TNfd6fdLVEHe+J/FS0LtEPWS5NFjfrV+6166pFT9jXeNTgwOUMDXNXC+rgPBQ06MdiiLlL6UQzFJY8P7CSQURURa6KeAjK2Yf5AxvBQuYeOXHeScspy6tvqzXdjAps/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995334; c=relaxed/simple;
	bh=6DFNBl15qZFBVZT626I2QCaODRxWDa2/EZfXugOI7TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOXDlFU+eWeUJ9wB62y0GtVeS6XmlmB+79yrz/iJsulxCS6utSALw2m4+0lGZyWJ6pDxT2eBWgtQABafGm0nXUlhJKEaYSy8OJtGSHXb2bs9C7yQnPRqN9gPTkBRI5Sv0dMumnze0M1wE/lCCTBMa5n3AY0plYmyhN2t7xOH+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gW7Y/skc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gW7Y/skc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763995332; x=1795531332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6DFNBl15qZFBVZT626I2QCaODRxWDa2/EZfXugOI7TY=;
  b=gW7Y/skcCYJ2XzKjRDOkc2ikCL0KNKHWtWgAyIZcB58yVuWI5GmSEibv
   wvTiD2Cd0XQaVuLo82cOC8+X5w4VP7DzGi1aVOtapv9ilXOSC3tmdDmgM
   64SfS4vw632vJYn4CHFvBpW1b/VuMuOMemYlgmVMYIW8jid/ryDrxXCF7
   lwzjcrW+/x4uqVjHv/VZx5xz4z6AeseZlv4/k28nqkjj4bqHbam/W9z/J
   c/O1WH6SwlY1tf+aytcENBc19c/s6BeOk54HTPqSs6X+1V7MI3WqSAzTj
   jkqf4UFqBCq/GShf3QGE3hzhhcxEpbt7QZ237vsUUaLVlnxY4hArsCI+g
   w==;
X-CSE-ConnectionGUID: UgUoeM6iR3ecH1JsmIZLxw==
X-CSE-MsgGUID: znKMDOPWTOKxrO5H/awkAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53558746"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="53558746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:42:09 -0800
X-CSE-ConnectionGUID: s0A9XceyTEuK6xcFByUMlg==
X-CSE-MsgGUID: aTBwpOt6Q4igGv17/4oj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192814568"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:42:07 -0800
Date: Mon, 24 Nov 2025 16:42:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] ASoC: Intel: catpt: Do not block the system from
 suspending
Message-ID: <aSRuvUeGS-v2s8nT@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-6-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121114331.3841335-6-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 12:43:30PM +0100, Cezary Rojewski wrote:
> Even if something goes wrong when performing suspend on DSP, from the
> system perspective the component is not critical enough to block the
> suspend operation entirely. Leaving recovery to next resume() suffices.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +/* Do not block the system from suspending, recover on resume() if needed. */
> +static int catpt_suspend(struct device *dev)
> +{
> +	__catpt_suspend(dev);

Can we use catpt_do_suspend() name? Or something with a better suffix?

Wouldn't be useful to have some debug message to be printed in case of failure?

	ret = catpt_do_suspend(dev);
	if (ret)
		dev_dbg(dev, ..., ret);

?

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


