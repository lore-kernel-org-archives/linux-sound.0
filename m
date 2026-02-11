Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8162EC0A1;
	Wed, 11 Feb 2026 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808718; cv=none; b=qPxgB+x9mXJAmZs21hNJ6RBWrHmN4epBU/ynpwLiA4vsB+ihJpkrCRvorJ5fOHCrdj/9H8ZF0k1gnGSKMe7DtMU9b1OFhpWRxLyUw/ADHBh/93xN9DbM3YI76x2+oZCtKV9vhfTkXdxUcCZmsiNXYSMROCjIdLtNQhF2trjWkEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808718; c=relaxed/simple;
	bh=EhS8j+L5Dtsp6HnbHqSJyNxc2xzicirUWyUtlY5aYsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db/ST4/oxKfW9EPRmj37ge7OOGc+CXNB6CoiLH2jjZYiuQPnZwhur7IG8Xu4H8O+9kJiRk4XpXOFDEL8YBcdTDVV++1O5ck7qj/5zC1uY+84YFg7J3mws7CH5767vnwXu+Q3GNdjr6EjDHthEpLEEEoCrZr1W/Ed8JV8Vzm7BUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhXAE4pm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhXAE4pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770808718; x=1802344718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EhS8j+L5Dtsp6HnbHqSJyNxc2xzicirUWyUtlY5aYsI=;
  b=JhXAE4pmNHs4RkKoR65fqG8KPgyt5P7rkOAZm3Pte33t2QxqNpq+c8jn
   kK/flViu0Nkc47WLoRwnlYe/3uCHrg8nDhqxBk27DhcydiE/b0Dn/+B4/
   MQNOxl9nxgReH2WNQceywNY64y38OSyWHpvN8SponiSnY81MDaQtA8vrN
   18cC8X0IUfrnsGuIW4zdfz+YkrGIE7cY8VDQ/9R+i0Sg+r6OKUe8y8/vp
   XlXCJ3vShx9pQiBgk+EKgjoJWE0I+j0FukQXUgHTKWazwzmcGIPdyfLo8
   RRuJaZFhwvCnrGXuK2xYjNmpRdXpkwlxf1N971s11riutSJLzr/w/w+eo
   w==;
X-CSE-ConnectionGUID: YOdZ58avTuabUVLi9ioFbQ==
X-CSE-MsgGUID: ws2DPSckT4CuID/gSTfm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71996826"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71996826"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:18:38 -0800
X-CSE-ConnectionGUID: uSC3Mb+gQPC3tytdte9fIw==
X-CSE-MsgGUID: OR0WftgbS7O9wJdRmyMJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211166462"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:18:33 -0800
Date: Wed, 11 Feb 2026 13:18:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
	ckeepax@opensource.cirrus.com, nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH 2/3] ASoC: ak4458: Fix the supply names
Message-ID: <aYxlh2YDmBrvCOCs@smile.fi.intel.com>
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
 <20260211093527.2892297-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211093527.2892297-3-shengjiu.wang@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 11, 2026 at 05:35:26PM +0800, Shengjiu Wang wrote:
> According to the binding document, the supply name characters are
> lowercase.

...

>  static const char *ak4458_supply_names[AK4458_NUM_SUPPLIES] = {
> -	"DVDD",
> -	"AVDD",
> +	"dvdd",
> +	"avdd",
>  };

In kernel we also have

arch/arm/boot/dts/actions/owl-s500-roseapplepi.dts:123:                         regulator-name = "AVDD";
arch/arm/mach-s3c/mach-crag6410.c:631:  REGULATOR_SUPPLY("AVDD", "spi0.0"),
arch/arm/mach-s3c/mach-crag6410.c:632:  REGULATOR_SUPPLY("AVDD", "spi0.1"),
arch/arm/mach-s3c/mach-crag6410.c:655:  REGULATOR_SUPPLY("AVDD", "1-001a"),
arch/arm/mach-s3c/mach-crag6410.c:661:  REGULATOR_SUPPLY("AVDD", "1-003a"),

Are those related? Can they affect this one?

-- 
With Best Regards,
Andy Shevchenko


