Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0297112C49A
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715350549; cv=none; b=JEipSEuF2zkwlqFc9BOREs/QCq/xMvdqynNpxGLqbgfiz5/qSQpzr0PT5U9oeBAC8UduNNSa96pbi+Wj+5+a6IJ+i411Z1aFyg+ktTb5DdASY7BtkJEtXH/+dn2C4xnhVDmLGwS55eQkrYYYAtV25dB1tObECECm7s29DFuUpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715350549; c=relaxed/simple;
	bh=xIzqxE3e05sIiufYjUPp1HzeUwPpiSjfHMK6JuJLQS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKQlQZeCEqT/9xe12KO5j4zSGq4xyGGwQwhobHvY1HXc06RWiUHAzF+vpfTRjMlvM0gA5XykHXfXyQiYUhGaHy00oXs0sdq6t0gw35/OSX7HNGYCeLAI+27zW5x2TgfiF+TGQXdvkXafcXAbuzJ9cwaS2bxiaj5/ZjMNrC9vZwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNg3a2Fn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNg3a2Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715350548; x=1746886548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xIzqxE3e05sIiufYjUPp1HzeUwPpiSjfHMK6JuJLQS0=;
  b=kNg3a2FntrgLju8Nk976qimspMmUAZGGxBmw+/X3fUEA43jB3cThFYQY
   tUWDWUg3jHw8JFCBzwHCw0lKHn6MW5aMwJUHWR36H+z0iB0UMJVVDYV/Y
   N/0GZ26znHfZEXHQU+q+ScH3B1SVFi/yaeWfYu6xo5VMiUHof/a4lHH5b
   BntQJ95eb8i3oNNiur7MpWEnN1K72MJwB0i70wypA/fuwok3w8jrb+9WR
   G3mOAYmZqUgMiZu8om/6mGpE/SWfmfapbx05PZjN49f8y6GKZRWjc7Ej9
   gtbFuzvfb21XnU7zElJeD2ZGWhuWQ71bepqIhdMW2sGCIEAkFn1Yzh5bP
   A==;
X-CSE-ConnectionGUID: dclhrWXCScS5DyHsyn4r6g==
X-CSE-MsgGUID: 5v9qtufdRBuePdjbh/Ly/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22731286"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="22731286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:15:47 -0700
X-CSE-ConnectionGUID: NytuFgOeQwCHa0OxqPeK1Q==
X-CSE-MsgGUID: Jddt3owLQYa6vuDSUj314Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29687720"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:15:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5R2E-000000067l4-2PNk;
	Fri, 10 May 2024 17:15:42 +0300
Date: Fri, 10 May 2024 17:15:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
Message-ID: <Zj4sDtKBNq7yJmk-@smile.fi.intel.com>
References: <20240507135513.14919-1-tiwai@suse.de>
 <ZjpQm-hxLQtpgkUx@smile.fi.intel.com>
 <ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
 <87ikzod6bt.wl-tiwai@suse.de>
 <dbee6345-1513-4b55-8f8f-d579d577a6d6@linux.intel.com>
 <87o79ealgv.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o79ealgv.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 09, 2024 at 08:28:32PM +0200, Takashi Iwai wrote:
> On Thu, 09 May 2024 18:10:39 +0200,
> Pierre-Louis Bossart wrote:
> > On 5/8/24 04:02, Takashi Iwai wrote:
> > > On Tue, 07 May 2024 22:53:46 +0200,
> > > Andy Shevchenko wrote:
> > >> On Tue, May 07, 2024 at 07:02:35PM +0300, Andy Shevchenko wrote:
> > >>> On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:

> > >>>> this is a series of trivial cleanup patches for Makefile in sound/*
> > >>>> (modulo ASoC -- which will be submitted later in a separate series).
> > >>>>
> > >>>> As Andy suggested in a patch review, *-objs suffix in Makefile is
> > >>>> basically a mis-use nowadays for kernel driver modules.  They should
> > >>>> be replaced with *-y suffix instead.  This is a result of systematic
> > >>>> conversions, separated per directory.
> > >>>
> > >>> I briefly looked at this and since it's a mechanical conversion I don't see
> > >>> any issues, so
> > >>>
> > >>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >>
> > >> Btw, make W=1 nowadays enables modpost checks, which complain about absence of
> > >> MODULE_DESCRIPTION().
> > >>
> > >> Example:
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
> > >>
> > >> I'm not sure what the case now for ALSA, just FYI.
> > > 
> > > Indeed there are lots of code that miss MODULE_DESCRIPTION().
> > ...
> > > There are too many stuff in sound/soc/sof/* and I leave them to SOF
> > > people (Cc'ed), while I'm going to submit the fix patches for the
> > > rest.
> > 
> > ok, I'll take care of it. I wasn't aware this was a requirement.
> 
> It wasn't, but now became so :)

Seems this is the result of fixing... the 2008 bug:
https://bugzilla.kernel.org/show_bug.cgi?id=10770

-- 
With Best Regards,
Andy Shevchenko


