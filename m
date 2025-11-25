Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21B32B9A6
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095174; cv=none; b=UeIYQa4TJtmqNTBESQ5ZNPpc/dcZuXTuR4sWb25433lwV448ELhway+5OvlW31JyhvmobiFmWXuF4aPBP7h7X5PPnyOwFDTfKenv/9RbEiv/8esbGnM3PMtRNwJga3h7ndgrpzupg0Dfw11I6pBT4FRMJVgi0dug1aBb+Cyft/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095174; c=relaxed/simple;
	bh=AvYFGjon4v844iXLJ4YmKnkxVZkn+dW9MatwrPCcVA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7IScjH/2UDreLw2jdXNsV4J16gxyQk16WaPXAwkAsotPuBRePz7gnX/wRF96aqR5vyCblroUwj/HGs4jZtMSdHZ9J3JC3MayIMFliItyNXbuB43D182W9UENuAwRqzlU7aEatRihE6l3W5M/x/P1l2zGc9qIPEMK0Op7aby6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOy8YWua; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOy8YWua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764095173; x=1795631173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AvYFGjon4v844iXLJ4YmKnkxVZkn+dW9MatwrPCcVA4=;
  b=YOy8YWuaapuiAiMw8CvG3bBMyftlN3FlmWREefY7pXoec/8DW4MPEhRo
   +bs0sq5V/KxeTPeC3nGs7xdU7Wg+Qs7Rmhk8U0KZHoeKoPNlZr4eqH2Ql
   C1zZfySKQLguN1Gzz+8zzblx4TD0jof6DHwdtJErbPEnd4B7h62zHOzEK
   YLj77M46uRojLl6iRU0mn2W11Rfb4guCgS72Cdyst3+IqYavMW4RZL/qR
   qsqyl4YLmUtDHf3nmqj+JmVvkhesCn5VL6EHC6KoTq/bdGfhH22TErViX
   xsBkRL/I3ay9nEESFZB8BreQ1aun8s+8Xshhq9h3cWDVXboyBTDil5m8M
   A==;
X-CSE-ConnectionGUID: t1NAgUTFTaa7//Aw4Vo4bQ==
X-CSE-MsgGUID: LwFLPdg2Qre9SpkXdL/tGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66281333"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="66281333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:26:12 -0800
X-CSE-ConnectionGUID: ayDyJIJdQDShJL5Qd2yJFw==
X-CSE-MsgGUID: qBYBnAx9R9KkbQxi88ckVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192600689"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:26:09 -0800
Date: Tue, 25 Nov 2025 20:26:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
Message-ID: <aSX0vw0neU-l2t3i@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
 <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
 <e99d1131-0c7b-4cf8-8830-34f766bdfe6f@intel.com>
 <aSSsXgRjCiXFR04R@smile.fi.intel.com>
 <aSSsxz9hIavDhpgg@smile.fi.intel.com>
 <0be0219c-51f3-41f1-892a-45a6e5db6bc3@intel.com>
 <aSX0X3NbT6mMzMAL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSX0X3NbT6mMzMAL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 25, 2025 at 08:24:35PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 25, 2025 at 12:31:04PM +0100, Cezary Rojewski wrote:
> > On 2025-11-24 8:06 PM, Andy Shevchenko wrote:
> > > On Mon, Nov 24, 2025 at 09:05:06PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 24, 2025 at 07:20:48PM +0100, Cezary Rojewski wrote:
> > > > > On 2025-11-24 3:31 PM, Andy Shevchenko wrote:
> > > > > > On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:

...

> > > > > > > static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
> > > > > > 
> > > > > > >    		off = catpt_to_host_offset(info->offset);
> > > > > > > -		if (off < cdev->dram.start || off > cdev->dram.end)
> > > > > > > +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
> > > > > > >    			continue;
> > > > > > 
> > > > > > Hmm... I would rather do something like
> > > 
> > > > > > 		struct resource r;
> > > 
> > > You might need to nullify this as well:
> > > 
> > > 		struct resource r = {}; // or any equivalent
> > 
> > This made me realize variables 'r1', 'r2' and 'common' that are part of
> > catpt_restore_fwimage() are not zeroed and utilizing resource_xxx() API
> > without doing so is bogus. My plan is to the following: leave this very fix
> > as-is (without refactoring) and follow it up immediately with patch that
> > swaps manual manipulation with resource_xxx(), as you suggested.
> > 
> > Sounds good?
> 
> Yep! Thanks.

Just to add, you may also consider using the form

	r = DEFINE_RES_*(...);

which effectively will nullify untouched fields.
So, either it or {} or memset() whichever fits
better.

> > > > > > 		...
> > > > > > 		resource_set_range(catpt_to_host_offset(info->offset), info->size);
> > > > > > 		if (!resource_contains())
> > > > > > 			continue;
> > > > > > 
> > > > > > >    		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
> > > > > > 
> > > > > > OTOH it seems more invasive change for kinda a fix.
> > > > > 
> > > > > Looks elegant though. My idea was to avoid additional operations (which
> > > > > resource_contains() does), perhaps unnecessarily as readability suffered
> > > > > because of that. Ack.
> > > > 
> > > > Note, it's defined as static inline, if compiler can prove constiness of
> > > > something, it will eliminate the code. TL;DR: let compiler to do its job.

-- 
With Best Regards,
Andy Shevchenko


