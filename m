Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7332BF21
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095077; cv=none; b=GeJ2Xy0W4aWoDGo3kTGE4xfamoBZUe4iMMxskWqIg8DISwgaxC7F7FfX0U4cgqUq9fyvJ6bBYBZUaz4Un8wFr/W2A+JLDwcMHpZ4s0PonpQNVj+FajY555WXzo2vRo8fTdDvVBfQhn9fZyTOZc4K4cnKlW++h0fwVdfznUD2jGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095077; c=relaxed/simple;
	bh=0mdqU7LOlLSJMcT1ThqF2ZpC41WYeIWzlMRhyDIQqq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUJ3hP9L29uj2OYNAGhVmtgtaEZVF97anCGnrOtr4gZ1o5K/vLGwdkoSbSDb61OlnH/pfoQpUTDdwqsdUKSXbjUriegJzrcnZHdge6pP/d5QM6tvdsDKNWH1yb04OVv4Ip3gfnqynAEOc7PaiU0mCFS3JKn2U2joVQsftAOFBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHMEOY4G; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHMEOY4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764095075; x=1795631075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mdqU7LOlLSJMcT1ThqF2ZpC41WYeIWzlMRhyDIQqq0=;
  b=FHMEOY4GtkguANVA+uxyHbGZGDZcaAczqRI3UskBElAXdMjQQ/YWJoIo
   kDKwK55MBxDwDC9Z/1ILmnLNtSAJyyNTBwKWNsO26aPkd9GMgykTGhs7M
   7tS5SUUZb0WDbNY8TY+E8Wi8UnDFDAns1Lc6sbapqSwdZrzWqTHk1VEn9
   9ZEGZJUg317Cl7wYgswQTfw7Hy2ltk2E3flLDJKvsFpfIZuYcM0W07A0Y
   T1lq79RGqwD+66HC29Z26ENvvepGPrYQusGrWUVFlJ//T41QSsCQLSM1d
   DQ5uA2Cu3QEVeVXDh3af1GvIF8gaIE9F3hwrEn867P1K3Kp89jx8ld0j/
   A==;
X-CSE-ConnectionGUID: IpDAx8sMRb2VyFFLMl/sXQ==
X-CSE-MsgGUID: o4Ib0UbbRimfw1NpkPClDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77598635"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="77598635"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:24:35 -0800
X-CSE-ConnectionGUID: CCY7GbiWSEWTiiYUM68rFQ==
X-CSE-MsgGUID: t/mlILRdS6an2JhGpJ1Y7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="197637440"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:24:33 -0800
Date: Tue, 25 Nov 2025 20:24:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
Message-ID: <aSX0X3NbT6mMzMAL@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
 <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
 <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
 <aSSsXgRjCiXFR04R@smile.fi.intel.com>
 <aSSsxz9hIavDhpgg@smile.fi.intel.com>
 <0be0219c-51f3-41f1-892a-45a6e5db6bc3@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be0219c-51f3-41f1-892a-45a6e5db6bc3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 25, 2025 at 12:31:04PM +0100, Cezary Rojewski wrote:
> On 2025-11-24 8:06 PM, Andy Shevchenko wrote:
> > On Mon, Nov 24, 2025 at 09:05:06PM +0200, Andy Shevchenko wrote:
> > > On Mon, Nov 24, 2025 at 07:20:48PM +0100, Cezary Rojewski wrote:
> > > > On 2025-11-24 3:31 PM, Andy Shevchenko wrote:
> > > > > On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:

...

> > > > > > static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
> > > > > 
> > > > > >    		off = catpt_to_host_offset(info->offset);
> > > > > > -		if (off < cdev->dram.start || off > cdev->dram.end)
> > > > > > +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
> > > > > >    			continue;
> > > > > 
> > > > > Hmm... I would rather do something like
> > 
> > > > > 		struct resource r;
> > 
> > You might need to nullify this as well:
> > 
> > 		struct resource r = {}; // or any equivalent
> 
> This made me realize variables 'r1', 'r2' and 'common' that are part of
> catpt_restore_fwimage() are not zeroed and utilizing resource_xxx() API
> without doing so is bogus. My plan is to the following: leave this very fix
> as-is (without refactoring) and follow it up immediately with patch that
> swaps manual manipulation with resource_xxx(), as you suggested.
> 
> Sounds good?

Yep! Thanks.

> > > > > 		...
> > > > > 		resource_set_range(catpt_to_host_offset(info->offset), info->size);
> > > > > 		if (!resource_contains())
> > > > > 			continue;
> > > > > 
> > > > > >    		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
> > > > > 
> > > > > OTOH it seems more invasive change for kinda a fix.
> > > > 
> > > > Looks elegant though. My idea was to avoid additional operations (which
> > > > resource_contains() does), perhaps unnecessarily as readability suffered
> > > > because of that. Ack.
> > > 
> > > Note, it's defined as static inline, if compiler can prove constiness of
> > > something, it will eliminate the code. TL;DR: let compiler to do its job.

-- 
With Best Regards,
Andy Shevchenko


