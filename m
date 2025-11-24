Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D7137C52
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011213; cv=none; b=pN0whmNHawhVuiBMhirlKx0+VVPhkhjVkyKf1RoYK5HkarkTWMw0wUo/NreQTOVP7bm8NL8t0BKiJs1LUNITXcaa2+bnwZHTBnGW44WhwSZ7fuzRfXxZBwUoeUTh5kxD5XHjNihyeFiqIa0D1LSLkcsP2VT/NP3sosAvvz+QxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011213; c=relaxed/simple;
	bh=u1lwGR9eXc/hTjMW/gycywWPDTNJdNpWNI4gdyVI/5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwR9cjxHx6xJVR4J/RsNe545+oKp3e7FMH7pnyKm+9WAz5ntdzEu7fgcl3MgPwp9o+D1tweSwtis+AKVc9yMLGMNsOT5zOOAqrBxE8nZwHUNfp8TDSDIlqnMIB8qbxbHvEBBe8w/zugRtLp4WjboNn0xIm/h9Guu4tetGW0EIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOF8Q74g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOF8Q74g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764011213; x=1795547213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u1lwGR9eXc/hTjMW/gycywWPDTNJdNpWNI4gdyVI/5E=;
  b=ZOF8Q74gVsv6RSs0v7YvedMYe8Jfddkdn4VcdRkOq++jTbIn8MVRdw8Z
   oAhSRUnL0TD+sJprajbCNiZVy+vC7J/TVGVz2qLNl5yKLn/NHBfkMTWVD
   6Ob9bIfqBp/EanLlnpQw4qiAOPbc5dtHsueN8cFsJ0PGFM4P2c9H23X2S
   +YFnexZST4TbJ+11Xq/cn8ak9upde72zwbPvPrBfxUw7AyESrGlrpRPmd
   NMu171zxgSUxP8NV0LejNLOjBQgOeJpk/3WrybY0VGaDNYnp9BaZ28Z//
   rt6TkU0D5vj0LX2/2v7YRFWYF5k1VUsrn8j9SErThPpN5qk0qHK9zHToQ
   A==;
X-CSE-ConnectionGUID: EgqenwFLTwm7DBUmEgL/0A==
X-CSE-MsgGUID: mh/Jz1hFSfe3n+Q0X2/+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65721696"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="65721696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:06:52 -0800
X-CSE-ConnectionGUID: JzNvJ5SrRR2sBDSNc/5ffw==
X-CSE-MsgGUID: 3PuOnw9bTEGe0S/ZkkCThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192499616"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:06:49 -0800
Date: Mon, 24 Nov 2025 21:06:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
Message-ID: <aSSsxz9hIavDhpgg@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
 <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
 <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
 <aSSsXgRjCiXFR04R@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSSsXgRjCiXFR04R@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 09:05:06PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 07:20:48PM +0100, Cezary Rojewski wrote:
> > On 2025-11-24 3:31 PM, Andy Shevchenko wrote:
> > > On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:

...

> > > > static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
> > > 
> > > >   		off = catpt_to_host_offset(info->offset);
> > > > -		if (off < cdev->dram.start || off > cdev->dram.end)
> > > > +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
> > > >   			continue;
> > > 
> > > Hmm... I would rather do something like

> > > 		struct resource r;

You might need to nullify this as well:

		struct resource r = {}; // or any equivalent

> > > 		...
> > > 		resource_set_range(catpt_to_host_offset(info->offset), info->size);
> > > 		if (!resource_contains())
> > > 			continue;
> > > 
> > > >   		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
> > > 
> > > OTOH it seems more invasive change for kinda a fix.
> > 
> > Looks elegant though. My idea was to avoid additional operations (which
> > resource_contains() does), perhaps unnecessarily as readability suffered
> > because of that. Ack.
> 
> Note, it's defined as static inline, if compiler can prove constiness of
> something, it will eliminate the code. TL;DR: let compiler to do its job.

-- 
With Best Regards,
Andy Shevchenko


