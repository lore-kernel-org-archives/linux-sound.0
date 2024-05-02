Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17958AC3
	for <linux-sound@vger.kernel.org>; Thu,  2 May 2024 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714644865; cv=none; b=dz4be/BBYnA4b3KvwNjUGbv2Qk+IfO4i55r/hiVW2yOEysdIHDy+5f3/ITIdJPuS+31qeGFNbztxN8sJR0snDA1aRpRqjLPEyA3Hy4DhQLkrC3G30wNjABorW9ge66+V4J5XqkXXnK9QPbbJPOzb2FsXaOrt7Nb8wElPd4cs64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714644865; c=relaxed/simple;
	bh=cAlBEvn7Zdg3rycQRTm8ybO0vKp0Bzcel9WMD2FX8MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egHFZCU7CLt81fQFsbTOXfzUNV+DJwJcw2xpS0V8QQKflKHpWOQRI7PSe4tHIq5ZdpcKd9o7WDJgtJkflMWX7ipJ/2kVjBH5qppJ6motUkCpWXSducSsDgOyD0t9ZcNfpwAcfKSLS443nSE9LTEn8DyWWCadTvCZR6XeKjmBaco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: hrAGkB62SEG6kyJQFjZugA==
X-CSE-MsgGUID: v6nJUTQfSuWXxcqxEk8HQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10263028"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10263028"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:14:24 -0700
X-CSE-ConnectionGUID: fnZO5GPrQnya113tbA4d3g==
X-CSE-MsgGUID: higjDwRMTc6kA2VzZ5EfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27477637"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:14:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s2TSE-00000003HFH-14oE;
	Thu, 02 May 2024 13:14:18 +0300
Date: Thu, 2 May 2024 13:14:18 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <ZjNnekOAhhjGh-Ph@smile.fi.intel.com>
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
 <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
 <6uj2suuiu7tpomecii65f5lxuwgkhxnqs3lrpa54s2ptsorkh3@lzmnapdw4cri>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6uj2suuiu7tpomecii65f5lxuwgkhxnqs3lrpa54s2ptsorkh3@lzmnapdw4cri>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 02, 2024 at 11:25:13AM +0200, Uwe Kleine-König wrote:
> Hello Andy,
> 
> On Thu, May 02, 2024 at 12:02:50PM +0300, Andy Shevchenko wrote:
> > On Thu, May 2, 2024 at 10:47 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > These drivers don't use the driver_data member of struct i2c_device_id,
> > > so don't explicitly initialize this member.
> > >
> > > This prepares putting driver_data in an anonymous union which requires
> > > either no initialization or named designators. But it's also a nice
> > > cleanup on its own.
> > 
> > There are some drivers that have other (than I²C) ID tables, which
> > follow the same format. Can you also do the same with them for the
> > sake of consistency?
> 
> I'm aware of these and plan to address them in a separate quest once I'm
> done with the i2c bits.

With this being promised, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


