Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E6827FD76
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 19:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011259; cv=none; b=j5sW5D6b5b7A/8uVkmYWlBMu5RqE7+sCFuIvv7vs9QIihsl/WAEbcRez2ZeWTUK8BMyRvyOe7lHEhX0okGJPxFmDLuJB73Rp5v0KFyYF9VwuDvbCnFy2gNVM3orSmsLaZixSo4mloxBzKExhizN5utAKwsUmYjNg2tjqSqaJgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011259; c=relaxed/simple;
	bh=iqhcpWQRDMcpirSGVb87yzbkxLPkvkyTFxt7Rt1UUaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+3Hedz8zKz9ivsXkWNqR+JnFmOWV5nytUvhfLCSfjL8u7si4my4Wr0zPMNADhpaAIVCh49eo7rjo5gm7lFhn7T89yqmQIJXrcy/WNwV4Qv3ZXKvoJIWrP/W/Kc66hOkYnDJwZoCRC7f+M19/cCIl3dVnT4JdYLjtRI/+BFFapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qf9e4j0t; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qf9e4j0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764011257; x=1795547257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iqhcpWQRDMcpirSGVb87yzbkxLPkvkyTFxt7Rt1UUaQ=;
  b=Qf9e4j0tSDszfdXCwZ8iSW+MQ6GzOKOsx4X9YXnNk7L+W08a2m3Me8Jq
   xfEHYKkvbUr7zoY1g2ChiwTB24XW5trYiGq0dc5uSkF626+oh6e8otJXw
   Ob5z5N/NF1OtuBxafWpKcX+EScDYfsTX2dMNA+8Pir9InEdBD2RvBj3/u
   m2ec4lVYF6V07Xti5A8lKnSesN1lDd0IjR3KDJNS4NVYGVBY6Mjbmn++k
   t60cBY2/J6gn0qlGCHZ/pTfRbItGnHFK2+er/I4ePhlE5bZRGA3E8gcY6
   54WHrz6iCwyAEU8M09B6yubXTYOs5k4eDBrSF4gO1LyfWONyeDoqQbXgi
   Q==;
X-CSE-ConnectionGUID: K1/67JeXS52gJXC+TsTdCw==
X-CSE-MsgGUID: H9EbMRfuQLGmsIdbJjQ6ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66095400"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66095400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:07:37 -0800
X-CSE-ConnectionGUID: C2HuJbvYRIO/PnwLdsq+yw==
X-CSE-MsgGUID: sYYT60l8TOeId1QjLoro5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="197535606"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:07:35 -0800
Date: Mon, 24 Nov 2025 21:07:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] ASoC: Intel: catpt: Do not block the system from
 suspending
Message-ID: <aSSs9FEH4ROt_KMx@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-6-cezary.rojewski@intel.com>
 <aSRuvUeGS-v2s8nT@smile.fi.intel.com>
 <b4680b57-742d-4e2d-847e-fc8722cf7011@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4680b57-742d-4e2d-847e-fc8722cf7011@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 07:05:55PM +0100, Cezary Rojewski wrote:
> On 2025-11-24 3:42 PM, Andy Shevchenko wrote:
> > On Fri, Nov 21, 2025 at 12:43:30PM +0100, Cezary Rojewski wrote:

...

> > > +/* Do not block the system from suspending, recover on resume() if needed. */
> > > +static int catpt_suspend(struct device *dev)
> > > +{
> > > +	__catpt_suspend(dev);
> > 
> > Can we use catpt_do_suspend() name? Or something with a better suffix?
> > 
> > Wouldn't be useful to have some debug message to be printed in case of failure?
> > 
> > 	ret = catpt_do_suspend(dev);
> > 	if (ret)
> > 		dev_dbg(dev, ..., ret);
> > 
> > ?
> 
> No problem renaming the function in v2. As for the debug print,
> __catpt_suspend/catpt_do_suspend() would dump enough information already. If
> I get failure from powering up DRAM/IRAM banks or an IPC failure, additional
> "failed" message on top won't add anything useful.

Okay, then no need to add a noise, indeed.

> > > +	return 0;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


