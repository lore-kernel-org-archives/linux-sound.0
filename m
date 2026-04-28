Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6E3AA187;
	Tue, 28 Apr 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364224; cv=none; b=ro5soEbeFa0bft6Sa/JXhQ2I01ZK4HxmImkPUgwPcRfCOcgrgivEljda+brXDXlEMmQAkA4Fz+Hk1qwss5GVFKpXNPf5b6HxAwdCQZfd/VMNkxFDFZ4vikMvfei4VBsV2e++d1hLi12bxC41dUfpnB78T3nn68alSmWgphcEVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364224; c=relaxed/simple;
	bh=NffJV9927dT7rL6wOI2jZY/JNaOI2+xtGL0rewEq1d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1xFGhudXWiPhOJgfKrKqXmfY1G97Dy+Qlrx8ktO5EPTeaJ0ge53XnRmCesnCKzl73cQGCTnl20hPs72cnLBExnDsHx2+AyZCxs/3IFNLXhMZcYlYNmeRQSJleJh2w/Sx2eyakCgGYqbUe+Jj0qF+y+OGe64NVfrhVCW+TQzWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/3jeMMt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/3jeMMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777364222; x=1808900222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NffJV9927dT7rL6wOI2jZY/JNaOI2+xtGL0rewEq1d4=;
  b=d/3jeMMtLnOq/z63/Zd2kUFGaRfWxM/IpKejM3cjiuJNX3ZuFYjR5WM8
   9azioQg71laQJ2fmHq2mpC4+8eeNi/HqWxRJN2vBfwqX5GYiQv384t0Zf
   9ETbOfjYcOhmQFXrNIeNDP2UqlyTfpUmle/aL4/BTwxMN0LA6KwxFcJc0
   qGBJvTNfi+3DUmZhNRtNeOY4yYzaV7J0MAi7Z+3DLzawdNId2ix8gYbuo
   ZoqLsAn+Cmh8FjbHA21qiFpLEVcJoqTRxIJHt3OuGg/coYmqcOZhISv/i
   KnKZcbcL0BMub+dgdZTv9z0fsjkrH9jUxGqKEW6HEXHm0E20k3+oZpLof
   w==;
X-CSE-ConnectionGUID: bb1EGTXRTXujaVOpwarY+A==
X-CSE-MsgGUID: EV/p61A9Qdi/cpY+4jk0gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95679810"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="95679810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:17:01 -0700
X-CSE-ConnectionGUID: REh0jLZkTJ21zB9AO5OwMg==
X-CSE-MsgGUID: aX95HfucTu6V/6B5SZgmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="237841606"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:16:58 -0700
Date: Tue, 28 Apr 2026 11:16:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL
 checks
Message-ID: <afBs-GWQYIdcv0zM@ashevche-desk.local>
References: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
 <afBqy-LWQ6th2S9v@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afBqy-LWQ6th2S9v@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 28, 2026 at 05:07:39PM +0900, Mark Brown wrote:
> On Tue, Apr 28, 2026 at 09:47:58AM +0200, Andy Shevchenko wrote:
> > After the commit 7735bce05a9c ("ASoC: Intel: boards: use devm_clk_get()
> > unconditionally") the driver assumes that mclk is always provided, hence
> > no need to check for it being NULL anymore.
> 
> There's also the fact that as part of support for optional clocks the
> clock API will quite happily consume NULL clocks.

This clock is not optional, it's always retrieved with devm_clk_get().
When the flow runs into these code pieces the mclk != NULL, and always
valid (excluding some unrelated to this driver strange data corruption cases,
of course).

But yes, the CCF APIs are NULL-aware for a long time.

-- 
With Best Regards,
Andy Shevchenko


