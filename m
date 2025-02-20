Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B1F1B86F7
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060918; cv=none; b=AYh3q00UY0rj//8Qi45zOwfPMfUcqXu80RVTh8z1wOHsuy//FieNg+syMdj+0TBWGiOQ8xMXzPtuwggWe5Hjcd3+0/gFXCr8aap/M2t5f4jbBLcYTZ1avGynafQL9NXQp7B5vWhX/wZjbkmfx6zdc9WYp5M9oZNJ6Hix+WxlX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060918; c=relaxed/simple;
	bh=dZ1UnjK84GKbpplkerlfUVSmIfn90TTesUDxwspTnWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqCqRo4y2Ga3danGDj3g9MUjfPXQigv9sSXqW7syFJogfvVi+ZlrAsp7vXhjYkdN8Ar057/MafOATW7+KQJVFfWb8PXu0x/AQ61O/4lSbe8gRON5rA1lVdpWB0BgQH/EKdOKXkKpv2bx95MwSgyP8RzpcALLf38SRCINTpqKzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji7PlLsX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji7PlLsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060917; x=1771596917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dZ1UnjK84GKbpplkerlfUVSmIfn90TTesUDxwspTnWI=;
  b=Ji7PlLsXT2Vos3bJWxzCvlZ3u/6OTP1QxCeGoUL9/kSIsX1DH+uWMXcT
   wLDVJ+ZMppMqVzGlZSZ3jzW2Bqb1dKe82bt5dg/p8ILe+dbJkncUsjSn7
   TJFBm8eK2sMGIRLrsV/lNYNGB7LOqlRleYOT/mYZENRKEqt9jQnBIU+Yz
   yV0plYDTq6TePbBwY/R9NiAqSP+s8DPmmD/aaDdFsA/+9EMPk1Q0arCRU
   N7EF+HXj7/fi9eP/Iz/s191xJgI21JMalDYXrs25TSMl1rSPefWNSpDM4
   dv8y2K04roXH6Mx6c+fy4UnDQbIsV4yF/sAxKvQ28VNw876svHRfaUaSC
   A==;
X-CSE-ConnectionGUID: RyF0Ee5pSp2Jy27nZ1RW5A==
X-CSE-MsgGUID: JhqHgZGXQsqql+jCJTiSjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51053552"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51053552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:15:16 -0800
X-CSE-ConnectionGUID: /96gF00aTlyX8HWHKws+DQ==
X-CSE-MsgGUID: wzUdlP1JRu2ZCg7MCwTrQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115586548"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:15:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7KY-0000000DM8v-3yc5;
	Thu, 20 Feb 2025 16:15:10 +0200
Date: Thu, 20 Feb 2025 16:15:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	oder_chiou@realtek.com, flove@realtek.com
Subject: Re: [PATCH 00/24] ASoC: codecs: Update device_id tables for Realtek
 drivers
Message-ID: <Z7c47mtFOxgn2IEj@smile.fi.intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 12:26:19PM +0100, Cezary Rojewski wrote:
> The series aims to streamline the formatting for ACPI IDs so that a
> single pattern can be used to identify the device.
> 
> Work implicitly suggested by Andy Shevchenko - reading and learning from
> number of his reviews on the Linux mailing lists.
> 
> Several formats do exists, however, after technical discussion PCI-based
> format has been selected as the recommended one. For Realtek devices, it
> is going to be 10ECxxxx where 10EC unambiguously identifies Realtek
> company whereas the following 4 hexes specify the PART_ID i.e.: the
> device.
> 
> While at it, there shall be no comma after the terminator entry and
> initializing fields with 0 for statically defined structs is redundant.

I briefly looked at them all and found two issues I commented on in a couple of
cases as an example (you need to go through whole series) and one side note.

If you address those comments, I will give you a tag.

-- 
With Best Regards,
Andy Shevchenko


