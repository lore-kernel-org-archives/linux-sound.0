Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB82192F4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578772; cv=none; b=Gn+gKiIODMNv+FeomBH66Z7DWYLsqy6QSpCBQYZHHjusWLpbjv5S1C/Wy+GxLxlTV0WeUHhAcIbQaez9iq9bcupdQOjV0JP+JX68nkm061RvLGMOvvXPD66XGj0BWbsROHgmJeqvCznGKrPBtGJIHG1NEdobIpNZAYfdtji9muE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578772; c=relaxed/simple;
	bh=q2jt7HFFYcjcUTNvbImCY6F3nDu6Fz7PkvgS9S7nxts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeRMglBVuVa84rwDbHMqxT44GV/89bnxIGXYKPuGdiif0xjPrUoDWw6vwUY6CuUN6urIRQiT3mn50z3R7sPlfaxIkoLcpZbhREquI2WTg7QHlf0MypjMZnN/X8YtMkWfkP7tS7M8sLrW7FWgUdDI5blZQLbEHQYkZAynJe1Bmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUIYN8Hj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUIYN8Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740578771; x=1772114771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2jt7HFFYcjcUTNvbImCY6F3nDu6Fz7PkvgS9S7nxts=;
  b=dUIYN8HjXUWUAn8Eig+sZJjp1Vsi4wyCdkqgQJK33tF7vRG0ZpLt5w8U
   gJ4mRf/AHFPTScXQbz4YGoRfYmnxLCkroRsYdQW/GHwIaLAaaermafGIO
   6r+E/f7dkD0KTmGVUz56Vz3HIBiu66NdHpe/9khEJbk4Ve6E/+Fm2Ds0K
   9AmG8Yo0NLgSQhA3rEzptvnQv+8OIhj2U+F68BW5+F6oJfacOunCbEL7J
   f+sdH6Usv7IiYxROBya6nc/++FmJXsvWJjQk+rYd9aturTRju5gmpZGWU
   Q3EpVWf5yVfkaM9tKMlT7zS3UoCb8sDv6bWqalrKqjtyBRfczJbCzxmZO
   A==;
X-CSE-ConnectionGUID: eAA0pzluSaujfpmHv6S+WA==
X-CSE-MsgGUID: a/Ns4vR8QsC5AR/zHvizhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52414017"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="52414017"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:06:10 -0800
X-CSE-ConnectionGUID: nrP5ycs3TryKjbNHlWb7qQ==
X-CSE-MsgGUID: XAQrbxsdREKr1sq0K1OOGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121703631"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:06:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnI33-0000000FLGa-1ADx;
	Wed, 26 Feb 2025 16:06:05 +0200
Date: Wed, 26 Feb 2025 16:06:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, flove@realtek.com,
	oder_chiou@realtek.com, shumingf@realtek.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 22/22] ASoC: codecs: rt5677: Update definition of
 device_id tables
Message-ID: <Z78fzR8DOR8X1nh4@smile.fi.intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
 <20250226112612.166989-23-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226112612.166989-23-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 26, 2025 at 12:26:12PM +0100, Cezary Rojewski wrote:
> Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
> entries to the existing table.
> 
> While at it, there shall be no comma after the terminator entry

And there is none already.

> and
> initializing fields with 0 for statically defined structs is redundant.

-- 
With Best Regards,
Andy Shevchenko


