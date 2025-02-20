Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F3433BE
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060822; cv=none; b=W4Gil1HL5UPlD0kJB41Jd4vyX+LXJmAYtW/sg6uYycu8u/rML9CBgZ4FmoaWRhPVNu0bTKfGaHTolbp2+BXVwXl4Cp8kN9xXY026M9OLo+5EQkSrO9muWsqnBLpd2/KGCVGCmjuSBG57rLftua8uZnJwpD+gq8vRFzhumgts3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060822; c=relaxed/simple;
	bh=rn2h8nuZkpJ7NiAlucJy9bJwdRlkZA523OBvtVPJX1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLPwQc73m1oWPrAfFFE1csNOVmvlG+6yA8TTK9jhZhAdPQQaJiBB9qp7c40t4OtOL/Ys882DasbRgnSV+Q1Yv4eIwgYUBRS4eNLfz1w/40uBhllRNJTIZEkDO8qEnzkglwp2u+LTE9e1zKVF4tBXx34IKHEbKI3DMU/IvyfkDYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0puQRLg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0puQRLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060821; x=1771596821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rn2h8nuZkpJ7NiAlucJy9bJwdRlkZA523OBvtVPJX1A=;
  b=P0puQRLgQAqBKCTdJejqMKua2ypDx/QFJNmBUxQHVLTokC1YEoYVhqfv
   aeK1B0pGIfQP3gR2VqGOxZYC3+5A/hSa5iW6ieOeqL/WgY4wlGQn07bbA
   YsvniX5VRoiLQmdK7DmxJKAzPbGDXTtXNMpmTpqu8NuiOSnoSRUwnjX/I
   uDhr286nepbi0ANp7Eek1JUMR9C972vJ2VmilGvJtB1H+N2AXHTCpC2dY
   lyfg5RShtTAoeKc7mN4kty7hKPPv5de2P1YuvD7NdzcD+/bTTamZzN+V/
   SfPivOIHqlTRk46lOb8uY5YkTLa6V93H2thrwVd2gWTYLoRoVm55McRgP
   Q==;
X-CSE-ConnectionGUID: N0Kw3jvGR1aO1madsIptuQ==
X-CSE-MsgGUID: lBqLN+hATWKXvEtF1DLW0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28438110"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="28438110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:13:41 -0800
X-CSE-ConnectionGUID: W1Q3PdnaT1KDRixrkS5NuQ==
X-CSE-MsgGUID: 4rTbm/2vRbKa3qILiAqCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="138250006"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:13:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7J1-0000000DM7o-2pk9;
	Thu, 20 Feb 2025 16:13:35 +0200
Date: Thu, 20 Feb 2025 16:13:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	oder_chiou@realtek.com, flove@realtek.com
Subject: Re: [PATCH 14/24] ASoC: codecs: rt5660: Fix definition of device_id
 tables
Message-ID: <Z7c4j74gUjtbvgo8@smile.fi.intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-15-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220112643.3813295-15-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 12:26:33PM +0100, Cezary Rojewski wrote:
> There shall be no comma after the terminator entry and initializing
> fields with 0 for statically defined structs is redundant.

...

>  static const struct acpi_device_id rt5660_acpi_match[] = {
> -	{ "10EC5660", 0 },
> -	{ "10EC3277", 0 },
> -	{ },
> +	{ "10EC5660" },
> +	{ "10EC3277" },
> +	{}
>  };

While at it, can you sort them alphabetically?

Also, a side note: perhaps at some point you are going to remove those ugly
ifdeffery around them along with unuseful ACPI_PTR() / of_match_ptr() calls.
With that in some cases we can get rid of unneeded of.h and/or acpi.h inclusions
(the ID table definitions come from mod_devicetable.h).

-- 
With Best Regards,
Andy Shevchenko


