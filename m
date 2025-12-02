Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235931FD4;
	Tue,  2 Dec 2025 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684796; cv=none; b=k9yWOEDF5JOgbY6e0ldqbas25atAXjyoLWkBQ/9DzI1T6/K90ivl072MjQEaZf0zSKM7DKoUOL17s5GYHHFVIvn+B4DFr8WAM673jelxM/iWfLFNgMj5qTwhgUNbzu29fAgZr0RwbB9aZTK2wDqGOT1yWxptGlYnOUYJo3+UyaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684796; c=relaxed/simple;
	bh=XN8F73pqekmXRMGqPvdCNsjUvGtfall/cqrVowRFOn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdDW/C3Y5+WcDk3DeabAqL0v2pAkYP5Yabkc7xoZT1YfsmVHRGpJ8ZUzB7DRqHfEu6dg4NU1i2Dx16Vk3B3tC+VeWPQyUH0EqaDi/BKEeO5KDnVRyhDlUZ0c8+u9LU4oJ7lg7NKXrlGQbBlb+zJsVgNQBzHwjve/snqP4k4qRHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELf31zm8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELf31zm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764684795; x=1796220795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XN8F73pqekmXRMGqPvdCNsjUvGtfall/cqrVowRFOn4=;
  b=ELf31zm8wilTaNj1oVLnpZOSehAfV5CaJDkzoQaQyjbAfI5hXbo42lRd
   GT5vfkCuVpPQPxWun3+4w6cIcuJdPNNFD6mBqyYUEo+EG9wSGrBk9wrhy
   IX4+fsYaryTvx2k0nTL1cC+0SeM+amPwHeEa5jy80THRxy/6RN3bSo3LZ
   C6lwxisK7JrWPEkmuWLjLn6gMj8/hzjYdsIu5+6Lo99YjtK5Rt3SYVIu8
   oiDCNW7tTRpst1dJTRyzqCLWuA7pHz+ugpA34ciQ6UDhuD8KNOhVJWvDK
   EnoGjQlL+RRhIWj/dstBfztLm05JpM0rfvnsfBmIEDt+r7qMORHwg5+af
   w==;
X-CSE-ConnectionGUID: 0lBD/CJUREGVEPKZ5hI9iA==
X-CSE-MsgGUID: ZgWCtn8fSqmEdUWCHJ7aTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="54201810"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="54201810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:13:13 -0800
X-CSE-ConnectionGUID: J38pGt3jQyCupLPEllVi+w==
X-CSE-MsgGUID: t/7qF/bgSi6mAPVM86lUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199510141"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.91])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:13:11 -0800
Date: Tue, 2 Dec 2025 16:13:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com, nichen@iscas.ac.cn,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: ak4458: Disable regulator when error happens
Message-ID: <aS7z9D5upyOmAgmz@smile.fi.intel.com>
References: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
 <20251202083535.1985714-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202083535.1985714-2-shengjiu.wang@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 02, 2025 at 04:35:34PM +0800, Shengjiu Wang wrote:
> Disable regulator in runtime resume when error happens to balance
> the reference count of regulator.

...

> -	return regcache_sync(ak4458->regmap);
> +	ret = regcache_sync(ak4458->regmap);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +err:
> +	regulator_bulk_disable(ARRAY_SIZE(ak4458->supplies), ak4458->supplies);
> +	return ret;

	ret = regcache_sync(ak4458->regmap);
	if (ret)
		regulator_bulk_disable(ARRAY_SIZE(ak4458->supplies), ak4458->supplies);

	return ret;

is also okay in this case.

-- 
With Best Regards,
Andy Shevchenko


