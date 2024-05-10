Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6014D8F48
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715351413; cv=none; b=T3I6TdC6sriZhpLUx/kA7zol98qMDNjCftua9qtZT6fAPXa0yiQZ7rVzHeS1QOAerogMwHi0Omb3K36DtWLjixyvnTdTOnGctK39D737zLpG3a4WEd9sG9ZmcO8HQ7BhHJcdbuJ1Qh+whxhGUSf5Ck4Nbwfc9dw2Uh8RoBwo+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715351413; c=relaxed/simple;
	bh=Fa1MrvOpSYjRxsFPW8x9ZZX1bh46ZjyKhXfcDT9L+PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxPivIZlEsL32DjeTyAlwTXMZTn8301s+QVC+JaIcYebO1gIknePI12yMgOzIiAJqNly1r17EXFeiKBKt3BJBWSkWe/uiQ0UIB8zKGD3Up8P3BY2uj621wWNRkCLvzJzYDE4WaC923dGRPRKkCoHDtUk1LVyr1yLgWw+EMmqoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKI/JlL6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKI/JlL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715351411; x=1746887411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fa1MrvOpSYjRxsFPW8x9ZZX1bh46ZjyKhXfcDT9L+PM=;
  b=bKI/JlL63coP54vOhGLd1+T9pUy9TSTna3SFeZwdNuNS7RPnawcDlE3o
   woIgiD+bDEOwyoTRtpqbXQpNwgpvLGahKsQ3Ih6kliD8qj9OvX8ZNS2jJ
   iBRdWx6ooZ6ywq7TjkEd9kIui1Hjd2hLSMfHlx1F0mchqH74lqcWPAEub
   cKP6OQYkckVxjiKRbfvEZWq5kdqB08iN5Axu49kq0qF7WdL520GyckgNl
   GvliNsA/NsTd4ye7ir1BkUGviYjO5q4oX1gzStcgozjueqDW2PlNZcus9
   ZTj1JiRFA0FMMnSqMGZyf2eybHzdDjRwnVaEcqwp0nCm09bbGs05QoaU3
   w==;
X-CSE-ConnectionGUID: 8Y4JPGFyTSKW1xv+QO+PdA==
X-CSE-MsgGUID: E352P2M2R9iCIBWIOBwYUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15167416"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15167416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:30:11 -0700
X-CSE-ConnectionGUID: 4Y7k+8JQTIK9dosG0teBOw==
X-CSE-MsgGUID: 4AyLHN++SkqBH1p7vU6CdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29480918"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:30:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s5RGB-000000067zs-2rEb;
	Fri, 10 May 2024 17:30:07 +0300
Date: Fri, 10 May 2024 17:30:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/12] ALSA: hda: intel: Reduce CONFIG_PM dependencies
Message-ID: <Zj4vb33uz2rgX3tQ@smile.fi.intel.com>
References: <20240506161359.6960-1-tiwai@suse.de>
 <20240506161359.6960-2-tiwai@suse.de>
 <Zju6Rvh4Qlg9F0bJ@smile.fi.intel.com>
 <87edabbh2h.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edabbh2h.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 09, 2024 at 09:05:58AM +0200, Takashi Iwai wrote:
> On Wed, 08 May 2024 19:45:42 +0200,
> Andy Shevchenko wrote:
> > On Mon, May 06, 2024 at 06:13:44PM +0200, Takashi Iwai wrote:

> > > snd-hda-intel contains lots of CONFIG_PM dependent code although
> > > CONFIG_PM is almost mandatory nowadays, and it makes the code
> > > unnecessarily complex.
> > > 
> > > Let's reduce the dependencies of CONFIG_PM in snd-hda-intel driver
> > > code.  I left a few module options to be dependent on CONFIG_PM (which
> > > are visible to users), but other places are either enabled or
> > > optimized by compiler automatically.

...

> > > +static int __maybe_unused azx_resume(struct device *dev)
> > 
> > __maybe)unused is discouraged nowadays.
> > We have new PM macros (w/o SET_ prefix) along with pm_ptr() / pm_sleep_ptr()
> > macros. They are preferred. In complicated cases the PTR_IF() can be used
> > directly.
> 
> Yeah, it was a dilemma there.  There seems no standard macro to use
> pm_ptr() for runtime_suspend (there is only RUNTIME_PM_OPS()), so for
> avoiding __maybe_unused, I'd have to expand them manually instead.

I'm not sure I got the use case. If we have runtime PM, we use pm_ptr(),
otherwise pm_sleep_ptr().

-- 
With Best Regards,
Andy Shevchenko


