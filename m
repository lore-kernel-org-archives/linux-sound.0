Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A347F41
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715161034; cv=none; b=NPhkcxTRyp2Gx95QEk360XvZSUi9Lkmo9ORQbiZImvu1x2Qr7kuf+It9E2y8Qrm9p/yi/Qj/Zb1DyD2iPoBWHsjV4QQ+WPEpzUWdl20ufrSfzKgczDRSJOV+c5oQcB5vLyeZEGllQu+NmAUhigyQby4r2BXOH7XEF5+CCzov+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715161034; c=relaxed/simple;
	bh=qDXuJW+/izeREQ4WO/ikXFnKjAvPGHbtJoujgoytAO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV0LKQvgpFEI4nCE+Nvb1XGO56XBrzVZnGZSRWkqcZLx7ykM+LuDZmgZPywTw8svWFfkQm9uslEYbicDw8Hfwzuzq1Ctg/6Vl69myVY2wNZnpTZCicZQNU857LsBkwHeu3GSNY5+8nNwKsU9j54t78KyO0Bn4JL+Y1ejkiHl2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPwTsqIs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPwTsqIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715161033; x=1746697033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qDXuJW+/izeREQ4WO/ikXFnKjAvPGHbtJoujgoytAO0=;
  b=LPwTsqIs5S/BAOjXf2I9GQ3Ni+px933urdKkka1hRH8NMtenXeiTA3TD
   d3h1sHkuK494HyFlQntJkgPkSCtDhW500N8svAI3//axazk+I8iPEc382
   YPHBW1xjFtPn2ukBwJjXSybjZdkG362szlVBlK6IMyBE5GKGphAsv2RVO
   Cmu3dfZsqelmTXsfG8Izib7kvz8XWhuJEQqcUk7ZbHY/40wIMJ72rw4o+
   PAz2QBXh96H7C9VlAmdPL+tJh6z1GqHpT5Vid+9Sfq7PKeMyNPRp2z+Yu
   L3E7ZzMKOdHxhf+dyGBuZ1sW/ZByAYAgr4yIqAYm2mKrpi/vVMAykI9/a
   Q==;
X-CSE-ConnectionGUID: u782v5sNQr6bMadjaBAx8g==
X-CSE-MsgGUID: FxvssHsbRwm4mDy0HxKvVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11172067"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="11172067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:37:12 -0700
X-CSE-ConnectionGUID: K3pGP0CeRH+ElMm8DkGuwA==
X-CSE-MsgGUID: FPnragd5TQGAa7cmix482Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28700976"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:37:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4djK-00000005NXX-2D5k;
	Wed, 08 May 2024 12:36:54 +0300
Date: Wed, 8 May 2024 12:36:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: ab8500: Add missing module description
Message-ID: <ZjtHtmZQ3nUtxJAM@smile.fi.intel.com>
References: <20240508091909.27062-1-tiwai@suse.de>
 <20240508091909.27062-2-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508091909.27062-2-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 11:19:00AM +0200, Takashi Iwai wrote:
> Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
> let's add the missing information.

Probably Reported-by: fits better, but I'm fine with either.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

P.S. I don't see cover letter, so the tag applies to all patches.

-- 
With Best Regards,
Andy Shevchenko


