Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5855187543
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082073; cv=none; b=SQ08Rt/C+RyNdKHxqbW0eWoQdt2uhU6pRO29ipvZleHtM1G/ZoR/s5bj86Zbm9ene6ffintLLgs8kzOstv8yZlx70knyhS+Rq2rf5ApKAlbaWNCbiZw6otdHyJK41khvilqLnSr+5ovoYE/mXYZQ/MQ4Zj0pyk6p9kHfTlyBeyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082073; c=relaxed/simple;
	bh=CVgCg9EfLMmaKqwnwWtdE36V0JgfLTlJLjMttBV68fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzDKzQ56gW9GOcaS7Ja3iUOVZzXadRPUAMwB47Fid+MJW9T0hdq2Y9ocJwH2S4z5FJpggKoOnOBs2T28EXMKJBtKqT9qvYgGxZcuL9or0PF8ztbMlzDjP/a4PmmQcN1CYJ3+N3m1ZIRx3WMmOQ7zCMBSm1k4SRWkg0f/KZiZE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gapfIIrv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gapfIIrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717082071; x=1748618071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVgCg9EfLMmaKqwnwWtdE36V0JgfLTlJLjMttBV68fA=;
  b=gapfIIrv9+aoFG6hY/ztkjhAa+hlE+2UB4vwpkyChfbnyK5RARBiv419
   5zVHo4zs260wLq35ldtBM/KDNo4vhwUKJ0XefKwQuC5RD120EGRf6hVhY
   AQw4MVoP15TpnkIAu+XSSQLE7zZhHWfdEqG3XE34lb2taVKyr6qYhnpBH
   vyosUhqGK03QuraTRg+9oGS0vKRaEvp+rk4eztOpvIrJp8FKsIkEIFKpb
   XHRI2pvC6Wofmp+2MXJXC9TtZuh2x9ubLZ5G8YlNwM6ZSM42xZQQ86H8O
   O8O7I7gcoXOBP2/QeAwjdJH2Jl+a5et4H42cdllFNJdNWSLz0tpwPWaJ8
   Q==;
X-CSE-ConnectionGUID: JUhvkZcGSnOhZTvNkOOdxg==
X-CSE-MsgGUID: uJew5fgsQjS3rCRgU7Pieg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13756800"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="13756800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 08:14:31 -0700
X-CSE-ConnectionGUID: obUVKN+mSKWMG//lNbAeFw==
X-CSE-MsgGUID: zpuBX0b3RYK7C2vDOy9GXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="40315280"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 08:14:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sChU2-0000000C76U-3Ozg;
	Thu, 30 May 2024 18:14:26 +0300
Date: Thu, 30 May 2024 18:14:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, rafael@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH 0/3] ACPI/ALSA/soundwire: add
 acpi_get_local_u64_address() helper
Message-ID: <ZliX0juOs_A6A01T@smile.fi.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 02:29:32PM -0500, Pierre-Louis Bossart wrote:
> The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
> we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
> extension where the native 64-bits are used. This patchset suggests a
> new helper, acpi_get_local_address() may be renamed if desired in a
> folow-up patch.
> 
> The path of least resistance would be to merge this patchset in the
> ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
> Device Class) that depend on the new helper.

Perhaps we may rename existing one to _u32 or so.
Anyway, for this series:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


