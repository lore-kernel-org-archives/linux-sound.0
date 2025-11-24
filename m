Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3594323D7D0
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011110; cv=none; b=aUU2K7vuQNAoaHZtRo9HDjPj9fpzZW+OAXTol36T0GFnTD1dB6EFsLTb+zVZNS4hRM6flw7t/Ktrc9+Hk4lQ+Y7TJtoxecC3VTWeafjngAgbgJmbLA4cnDf4MeXTih0DdTGA45+fGolO45S7lZ80Sq3Oob/SYsM7y56VNYlYc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011110; c=relaxed/simple;
	bh=4z076sDyNA49xAzucCxjt0OdHrsojqyjwGNLsQxgPRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4rEPxZ3SqrxIGA1iT0vycu/7h2xK5fqJSM8kGBqHvwFLxYSsW9dhLsoioebpUtuvQHvjST6fipZwlzW91iu68lfPgm2v4A3GWOmKqj2rIZAX9e2cZKb/rIQQ2JBa9QIsvB2PPE+AwDdkv1q4lj6Mo7oZcngMlhQCV0a5XlpPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyqKftvX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyqKftvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764011108; x=1795547108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4z076sDyNA49xAzucCxjt0OdHrsojqyjwGNLsQxgPRM=;
  b=WyqKftvXPjTadsZ5w04PHCdCVHS1xXpv9zegBOFP953PVzPesTFxmas7
   EO2AbtTTIKQDN7Oy6uIMBNFem+QayDck1VyC9cku6yNPOBunvOWqeu7Zw
   E3xPuIPB5y1WNJIUtoBdmo/29mhdIa4MXglKG+taGXLP5BsWeg1ePMr5s
   mZN3Quu0o9kwPuHnsAydz2zGjEIzKGnJ1nCqqdWidZeig4/5AWPDgd/Ts
   +z+jFcy9HHTPGKiJhQwfvJKBqebRz1H2Z0rcNGEcET9S4BNKqxSxM1hAL
   O3DjMUr8Zty5QgJBQgv4PUF+uZvou52c8aJLD8kFaMHITEcabfOdUpQzD
   Q==;
X-CSE-ConnectionGUID: kzv5uf5oQCuuGEODfbyzTw==
X-CSE-MsgGUID: 7Gr+esheRJmjk78yUBuXnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77385228"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="77385228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:05:07 -0800
X-CSE-ConnectionGUID: AMlysqEOQ1WuwN4CxZqpKg==
X-CSE-MsgGUID: OZZFkDCnSiOh4F4x8SkwKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192663017"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:05:04 -0800
Date: Mon, 24 Nov 2025 21:05:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
Message-ID: <aSSsXgRjCiXFR04R@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
 <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
 <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 07:20:48PM +0100, Cezary Rojewski wrote:
> On 2025-11-24 3:31 PM, Andy Shevchenko wrote:
> > On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:
> > > Verify if the entire block is found within DRAM, not just the start of
> > > it.
> > 
> > I would rewrap this to have less distant lengths.
> > 
> > E.g.,
> > 
> > Verify if the entire block is found within DRAM, not just
> > the start of it.
> 
> Sure, will do. Typically I just do 72-chars per line and whatever happens,
> happens.

Understand, but here is a corner case, I usually rewrap a bit when it's line
out of only a couple of characters.

...

> > > static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
> > 
> > >   		off = catpt_to_host_offset(info->offset);
> > > -		if (off < cdev->dram.start || off > cdev->dram.end)
> > > +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
> > >   			continue;
> > 
> > Hmm... I would rather do something like
> > 
> > 		struct resource r;
> > 		...
> > 		resource_set_range(catpt_to_host_offset(info->offset), info->size);
> > 		if (!resource_contains())
> > 			continue;
> > 
> > >   		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
> > 
> > OTOH it seems more invasive change for kinda a fix.
> 
> Looks elegant though. My idea was to avoid additional operations (which
> resource_contains() does), perhaps unnecessarily as readability suffered
> because of that. Ack.

Note, it's defined as static inline, if compiler can prove constiness of
something, it will eliminate the code. TL;DR: let compiler to do its job.

-- 
With Best Regards,
Andy Shevchenko


