Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065E018733D
	for <linux-sound@vger.kernel.org>; Mon, 12 Aug 2024 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723479311; cv=none; b=h/I4d20Z2WUbjLh2vqIAAkrXv/JcodsmAEJwbENfnrHx7ju9LxxISocmQtQBmmgotGZ5GFqkU+rcp8LLZsRPcT13o5HMhjZ8Pm0JWPX/VCXLG1pMh8G98fBh1YKVeCJNh/ggsOnCFVJPVSIB+cKeJxDeicVKyJ0G7EBN5pJJSwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723479311; c=relaxed/simple;
	bh=C+REZLQz14gUYtQxBQ4k0O1BXwqSNt7VLHOsQU2J85Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwCjJETIDOxVmV7JlBEAy4VHT7FZEAFiF1wBOsdLs9vu2/tcbXKwnbMN36wjOmEJ6KUAaEB1c8z21XQkn1qJB5J1MF4EW5U4s7jQaXiU9Tj25i1cI+D/Xi42vKPWo96d7vPGjGDGThnx8rfdWmmAdTsFGFaDtvTth+E12eM78M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e94xp09h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e94xp09h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723479310; x=1755015310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+REZLQz14gUYtQxBQ4k0O1BXwqSNt7VLHOsQU2J85Q=;
  b=e94xp09hq515z1QzcPlYAAvGg8OULTf2lvIW3+OzM/3e2HA+DEJE8wEC
   uckg0kd3RPzGrHmbZ1/qK5Z+Fy7GxGBRyVD8hT3Eh28AGgAdWzTL/h/kN
   +G8VsJs5h4805doxXv28nrM7yq+bOcRSqRF9hhJw4589st3Jo2PMJ6iHH
   p7M2dPONxaZm4ibD7aByFFUIhlMtDAaBi/Hb3NM5mmIEp4viCc9BaV+JB
   /FrXjTq1rVwSZP7qOZC6P/3A/bodUlwseEkNXBrT95GEUTXYA1wTuPYWJ
   j3duf8ggE7sZKh6xmcENhZ3wZvB3MmMS6hry15ZXQVmD1N0siEdJazzHc
   g==;
X-CSE-ConnectionGUID: jl7USobITg6fPFxIeBJQnQ==
X-CSE-MsgGUID: wfMB+LVXSqq+KjjQG3WMEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32989736"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="32989736"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 09:15:09 -0700
X-CSE-ConnectionGUID: pwoS+pHUSRy6bZDQeJILNw==
X-CSE-MsgGUID: 4hPne9QIRm6PtY6nbvIJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63173826"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 09:15:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdXhG-0000000EPIo-2JWP;
	Mon, 12 Aug 2024 19:15:02 +0300
Date: Mon, 12 Aug 2024 19:15:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	cujomalainey@chromium.org, lmajczak@google.com
Subject: Re: [PATCH 00/12] ASoC: Intel: Remove skylake driver
Message-ID: <Zro1Bslw-L2FfC0c@smile.fi.intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 12, 2024 at 11:43:16AM +0200, Cezary Rojewski wrote:
> A spiritual successor to haswell/baytrail removal series [1].
> 
> The avs-driver found in sound/soc/intel/avs is a direct replacement to
> the existing skylake-driver. It covers all features supported by it and
> more and aligns with the recommended flows and requirements based on
> Windows driver equivalent.
> 
> The skylake-driver related UAPI has been removed with "ASoC: Drop
> soc-topology ABI v4 support" [2].
> 
> For the official kernel tree the deprecation begun with v6.0. Most
> skylake-drivers users moved to avs- or SOF-driver when AudioDSP
> capabilities are available on the platform or to snd-hda-intel
> (sound/pci/hda) when such capabilities are not.
> 
> For the supported trees the deprecation begun with v5.4 with v5.15 being
> the first where the skylake-driver is disabled entirely.
> 
> All machine board drivers that consume this DSP driver have their
> replacements present within sound/soc/intel/avs/boards/ directory.

I like the idea of having better and unified equivalent!
FWIW,
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


