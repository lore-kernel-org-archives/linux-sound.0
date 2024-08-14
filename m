Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E11B4C3F
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723646534; cv=none; b=HFcGJonrT5DEPERu0qrOKcJgTWXTzFV2nhnDOWEEZOiGXvPQKx9SGQSBmZQf7RNGVTXxQpXWM3/5i+Glyab5x930sIFtiMo6k8u0nR9pLMcilAWzQJRYvshAfH3eaR3lMFpV4ONtMdFGLKtg/hjtfQRCLpAgX36NfC9bcHuZ870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723646534; c=relaxed/simple;
	bh=UH8ERZHpu09gaKw5cfQYegffINpwUR6Q3dI7YPU4/FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8yq8s9xQ3rDQqEs20jLy7A2TgsW7eYQyZe3QNvqm4azKaT/DpJSbR0dq3O3zVla3PZjhJefXa0kgVkrEQRRjldftrMTZqTJXSKZ9PMjeVGGp2aZOU+lU6sE0qzHNnECVIoflRUlAmC+B9pSqYcz83vL2OMfmCuD21GHUdnI0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnQuabUq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnQuabUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723646532; x=1755182532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UH8ERZHpu09gaKw5cfQYegffINpwUR6Q3dI7YPU4/FM=;
  b=hnQuabUqCQqLriSbBWFP4dHj8SmhUldGv9cMtcfXgUJzFOKDpnl/TAqk
   QLadur2wAR+hlaVRvKep5qADa+CbUnnX3VzLqG7GDwmL3MVnjLswJvXtF
   TSGGDFM/aYiCZaEqr3At3N7ZcUIuYL8S5Q0p2tDE9uyKx8z3aIw9iKNcs
   ifrOwaxj3/P08aIFdzDMGafG1KFswIt4WN2AL9M6NdDVlXgj8CsCpz/JR
   xFFZgpaJHf+SwbujDJDhho6LzZ7PGhXUOflHlXPTp9Dym8QIo3a1XY4aN
   1tNdLyv4Gk3uIy9OVd4vzAHtr1dQVVp4TsRGvTnCrhFjTaABN/QTrZE9h
   Q==;
X-CSE-ConnectionGUID: kgS75vXGTX6cGqH8iPWiDw==
X-CSE-MsgGUID: iOtJ5CQAQX2dVmBYwIop0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39374766"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="39374766"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:42:11 -0700
X-CSE-ConnectionGUID: IYrCMSIHSN6ZrAy6YlH5mQ==
X-CSE-MsgGUID: o0TrAn8ORrOTVjWvHBxY8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63922633"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:42:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seFCP-0000000FDLZ-1211;
	Wed, 14 Aug 2024 17:42:05 +0300
Date: Wed, 14 Aug 2024 17:42:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	cujomalainey@chromium.org, lmajczak@google.com
Subject: Re: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
Message-ID: <ZrzCPfagF7ezdzMq@smile.fi.intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 14, 2024 at 10:39:15AM +0200, Cezary Rojewski wrote:
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

> Changes in v2:
> - added two new patches (leading the series)
> - the first moves all device entries previously under the skylake-driver
>   dependency under the avs-driver
> - the second patch drops struct skl_machine_pdata usage to fix
>   compilation errors as pointed out by IKP
> - no further changes, retained Acked-by tags for these

Hmm... Have you received my tag for the v1?

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


