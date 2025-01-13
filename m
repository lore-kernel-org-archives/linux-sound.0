Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0335233D92;
	Mon, 13 Jan 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757482; cv=none; b=YMLYdjrHCMWGa7TPGbZyS5N2YSC4wqM4uKAkVcKWbzHaEJP+y77RCp3DJJvZlgYuRiB3iu9W4z2v/YRypRk54Bxo6WPGQ0NyvDiAyRTj3jDxWsjwXniuMOBuxTeagwXV7jEHXxOF3avWePJoYXOi6mow5qLWToYuNN8BARhZVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757482; c=relaxed/simple;
	bh=dNt/Knv/oiJrtIA5tD/IWHWcOQNPGsUyaW4STrL37wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZ2BBhZnBANT3IifLv7M34ZOp1XBH5u778Z7t623mfBTCW+5karFYrmpRi2+Bt4xersUE8xWKsg7Jyho8Wm/X+L2pLAut4ckMn1TBRWuKCI//TjgskGg1yGYHmt8EGf/FPqndIxxuVHD3Tu5ItLvwUaMAs26Lr5VP2O96X6yxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZn56HT+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZn56HT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736757481; x=1768293481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dNt/Knv/oiJrtIA5tD/IWHWcOQNPGsUyaW4STrL37wI=;
  b=UZn56HT+NMKq4+7275+pI7+DH21Ujy9LUzju99BK1oKHsVaie1PmnAzB
   L6Hyko2RXuHhIaXflwDcxgE23M/Ovwn2bhy3mVHbfd8dEZDJBYyyvOzZ/
   DOwHrqXu/DVtCJp2R8llZJae+dTtG7TDYEVJ/Kp0ujghDuSHSJi4XxmtR
   2cwieNQbAyAy9hdHFSTaTiu3VcNFPN/xNeIpS1MeUeNMz7LT2mwDD97jM
   vr6RzFqgUTjUaP7zPPcv/iCLH2bQXf7scPU0tvb9ylcsFnwqOL9rzTT8P
   Z7aQnMjTOIhWoswzX+6J07UCOSNL2mdMKSj7HCF53fxp6LuSRG+p5cs6P
   Q==;
X-CSE-ConnectionGUID: vlybIMsgSBSnonruRY1KXA==
X-CSE-MsgGUID: lkkTjYcAQhCryNQBQlNwZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48004451"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48004451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 00:38:01 -0800
X-CSE-ConnectionGUID: TYXyBtskS0qGJR0YL/CQpw==
X-CSE-MsgGUID: UhjKpc89TBuSODLGnmEyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109037435"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 00:37:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXFxJ-00000000Nxf-0tM5;
	Mon, 13 Jan 2025 10:37:53 +0200
Date: Mon, 13 Jan 2025 10:37:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-hampiholi@ti.com, v-po@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org,
	antheas.dk@gmail.com, stuart.a.hayhurst@gmail.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for
 tas2563 projects
Message-ID: <Z4TQ4MAjFwVOjWtt@smile.fi.intel.com>
References: <20241230064910.1583-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230064910.1583-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 30, 2024 at 02:49:10PM +0800, Baojun Xu wrote:
> Driver will return error if no SUBSYS_ID found in BIOS(acpi).
> It will cause error in tas2563 projects, which have no SUBSYS_ID.

...

> +		/* No subsys id in older tas2563 projects. */
> +		if (!strncmp(hid, "INT8866", sizeof("INT8866")))
> +			goto end_2563;

Is this ID was used on old platforms?

-- 
With Best Regards,
Andy Shevchenko


