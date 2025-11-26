Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2027145F
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180488; cv=none; b=kU2mBYKMrAjHqRMFCi7lUgwZ6xZ6iW90XBvO+oq9jz6tf+8ao904YL+LXM028MO5In5Fyi81aQLnqhY2pypihphAXyYhSnsBe+1m2IImtW1neeYoggx33b5R90mIsmJMjvQuu6iEDeR2HZ+8SnfscNEDF72GfORxpN/is/qSeVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180488; c=relaxed/simple;
	bh=EES1hMZA6Occ5ocgXjczAbLiDSj9n2ZWhGWnT6INKlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJb+xsgQYrJUuLW/DC5FTJx0l7QusK/AsVcbJa5cu+aCaZZRSuMsuIItQYmQt4PHoWErz92o7hHlBSrBqAkGwcgFXeUDa0EOqtJY5OWl3JEjYWjUmH1UsABGjsUOWs2lGD0AFRTxoKYfovv6e/9mSfChIBWpF2HYilWqB3Kc9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebyfpY6l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebyfpY6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180487; x=1795716487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EES1hMZA6Occ5ocgXjczAbLiDSj9n2ZWhGWnT6INKlA=;
  b=ebyfpY6ljZPVB+Ku4UK5WBtJNolVKT0xdGIkDDuC3c159a0i7THe4kbS
   kJZKHlEYe0YdOruq+VrG7hBLzK3cDThKAeImQWC5ShcxafoOcEqh3kxER
   I/3jrjYUbDpjY0SQ6QdwM12zgoirG4y1bXNTmBg5nHjp8sVh7RTUQCzo3
   TSwuEav8WEMjPcxzWYD/SnKWxclcYIA040KTU9vzog/3CVcZXiePc5z6Q
   +XuIUaAxiT2YX/xtZlkLbWdGbS/5xvtSxdcx493fkz1qrxcsD6lH6Vgmw
   0UbTSgHTGd9TcQNBwk58zxq7oZmmMdMWL1mpobTdUUoVVxXA3/eVVW+CM
   g==;
X-CSE-ConnectionGUID: fwRm2raUS++s2+4GVfV61A==
X-CSE-MsgGUID: jZRLBiXmQr2wvBbUTlAuDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69848085"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="69848085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:08:06 -0800
X-CSE-ConnectionGUID: OWuC3hKfRLu/DtFju8XjkA==
X-CSE-MsgGUID: v4rw3vm1Q+GnDRalsxAb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192136939"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:08:04 -0800
Date: Wed, 26 Nov 2025 20:08:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ASoC: Intel: catpt: Switch to resource_xxx() API
Message-ID: <aSdCAp-clmwmkumW@smile.fi.intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
 <20251126095523.3925364-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126095523.3925364-3-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 10:55:19AM +0100, Cezary Rojewski wrote:
> There is a number of interfaces available for manipulating instances of
> struct resource. To improve readability, move away from manual editing
> in favor of the common interface.
> 
> While at it, adjust spacing so that both code blocks, while found in
> separate functions, looks cohesive.

A nit-pick in the other mail, but in general

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


