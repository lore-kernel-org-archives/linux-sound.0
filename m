Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006147F41
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715160990; cv=none; b=sW1eMJ0m6ify12uBUn3xAzJP/Pn59kCvpaXFwgD16W+WtVNsMebPLLga/k0tglnQxlnDMrMrWtEhIKStfGod9uQUVpISL3CtX2YE7NO4IdZzQQPoneEorS7+wpxapw3WVWWlmZmmszLs4FF/7Z+334XJJrot47qGknEo0hv4qIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715160990; c=relaxed/simple;
	bh=uKsmLQG1UOzafQ3PD9waQrJ1WeN4JOW9UlivEijiZPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIVJauGCUVPDgU5egPqEpbZ4ikBcRmI27z8elnqfRxHT0pJs9Qrgn3L4h1WIBoDxNRsfTWxzKeom+MIiSoiWyX/bgUO031p0Z6rjF3upmugVK4Xiy73XUkRoHg+DdzDJfqbX3cEeLygl8C1ochRY7AMOXK9Y5NquHM6c7YPtvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVH7eOhn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVH7eOhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715160989; x=1746696989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKsmLQG1UOzafQ3PD9waQrJ1WeN4JOW9UlivEijiZPw=;
  b=PVH7eOhngg+txnc8UOQJ7BIrASd0v20Zy3dzE6EvuCdgUcwDKwPSAFBy
   x61GqGecsttW8qoddxo+7r+LwzcMwECQMarxK4uzPzBtb6nyrbQbxE8tQ
   yE6YrHet77jnbyb3EcSNrbF+Oqjp8TBP8u5k0jA3HxtACs/T2xQ3zaUe7
   NfJY0R8auSStty94eY/PDvnza3OUV/RTW7vng5KYLcwbn0yQQQWpJvkLZ
   g4AWH0oK/9A9svto0HvH1dnzxsHDbx6DknD6dVhldbeQ0numEprFLGu+8
   ct4QgAFOGBaxn0myu41Vt2AZCZhB60DMqAqyRKOpRSwxClSgWuTTtUkzf
   w==;
X-CSE-ConnectionGUID: tLgAvhsTSXKdf+Mu18E6zg==
X-CSE-MsgGUID: kGJmvNdCS+G521YHu/8SWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22415904"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="22415904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:36:29 -0700
X-CSE-ConnectionGUID: hN+rIm9bQAqM7PuzF9gQ5Q==
X-CSE-MsgGUID: zrrL6t3XQISy0HNso3QUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="33352599"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:36:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4dic-00000005NX8-2lsu;
	Wed, 08 May 2024 12:36:10 +0300
Date: Wed, 8 May 2024 12:36:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: Add missing module description
Message-ID: <ZjtHiq52po1kfZp2@smile.fi.intel.com>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 11:11:19AM +0200, Takashi Iwai wrote:
> Hi,
> 
> here is a trivial patch series for adding the missing
> MODULE_DESCRIPTION() to the code that can be built as modules
> where make W=1 starts complaining the lack of MODULE_DESCRIPTION()
> since recently.
> 
> Fixes for ASoC follow later.

Probably Reported-by: fits better, but I'm fine with either.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


