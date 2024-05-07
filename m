Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46279CF
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715115232; cv=none; b=QxY9DmceiS6J4tPTVieW9JHNtS/SNk9nMm6C9KStjCCt9m+h5v7ql/1LDj5lkSvrEkZg7ReQdIJm5dgpddVBNMX9SRbC+UhR9khzoFe45tr7X8ndyA6xU1XDUsAxIfZZIw8vPHb5Iv9xInlY+28G/RoF23JT8qb80Os9FH9h2Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715115232; c=relaxed/simple;
	bh=zcQsc0UnPtgxRXAzYk6DMoKDePWWzPwSHIYvQ9R6PH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2OAoi+j0i0gvwJUAQ20ExxqQjaSRdH9Zc2BTJJXAq5/CYmc61z5jN4Gn5rrkU4xdS12k5akuCPiGPM7xBNQvemoSRi1AwvRX9BOIJU1LqfHJEF/tpAcgduKyJCilVKJYi8zbD/yTNiXbKfQ6Ic5Q5x5xkcZZpN/yvgOaTYRj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWv/1b43; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWv/1b43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715115230; x=1746651230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcQsc0UnPtgxRXAzYk6DMoKDePWWzPwSHIYvQ9R6PH8=;
  b=FWv/1b43MJ1buW8JmtV2Xlu2z3/xSiTxRKPPiaZVo17vVfb8eMbxVkF8
   NwdQ6rSmwGdj5ssEAnhA2RfzrFE/3jxVTYwVlzlrLaTZcz/CfxDxuHLq1
   Kk7vdpEk0ln4oZepsLqHFMwxaW66JWfh2v6V7jbFjHQ0ORByPl20sWTSg
   u8EUVIZqjGeuFkRkIvWBS3T+2hHUMvc7sQiSbr+hdRsrI0y76QJxC9iql
   UDGPZ/eXDn2pivkNbBTQbYLR+dZqaYXgjIrw4Lpoz3A3I2NAb57n9aSI3
   HTPRVWxvRzC7o4ABnuO8kWLoK8pHDQ65/YJsYUUhHzJrJMUPf+NSSBoou
   A==;
X-CSE-ConnectionGUID: gvbHMbhyQ5qlx+WD4eSJfQ==
X-CSE-MsgGUID: 7dG74yGeTAKZHoNzzCFhGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10809553"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="10809553"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 13:53:50 -0700
X-CSE-ConnectionGUID: 6CndkeQBQT+vwNmeRCbHqw==
X-CSE-MsgGUID: A7fGgvubTV6Gb+rSer7t3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="29205516"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 13:53:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4Roo-00000005Cul-18Zq;
	Tue, 07 May 2024 23:53:46 +0300
Date: Tue, 7 May 2024 23:53:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
Message-ID: <ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
References: <20240507135513.14919-1-tiwai@suse.de>
 <ZjpQm-hxLQtpgkUx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjpQm-hxLQtpgkUx@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 07, 2024 at 07:02:35PM +0300, Andy Shevchenko wrote:
> On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:
> > Hi,
> > 
> > this is a series of trivial cleanup patches for Makefile in sound/*
> > (modulo ASoC -- which will be submitted later in a separate series).
> > 
> > As Andy suggested in a patch review, *-objs suffix in Makefile is
> > basically a mis-use nowadays for kernel driver modules.  They should
> > be replaced with *-y suffix instead.  This is a result of systematic
> > conversions, separated per directory.
> 
> I briefly looked at this and since it's a mechanical conversion I don't see
> any issues, so
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Btw, make W=1 nowadays enables modpost checks, which complain about absence of
MODULE_DESCRIPTION().

Example:
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o

I'm not sure what the case now for ALSA, just FYI.

-- 
With Best Regards,
Andy Shevchenko


