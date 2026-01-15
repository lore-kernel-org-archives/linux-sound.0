Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8564720C00C;
	Thu, 15 Jan 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483906; cv=none; b=FZBnRf9cdWDg1gDfAPwt5I53eIY+UERi86zKxQAc9fsQAXl2tkHFKo1aBrjmrALs/MSCmWYhM6Sst7pb5GSwf1SKr9Jr8yRdhanvgSdZAuFpEvmszBtJ1EdGLev5gQ8zS50S2P3mih6yBAXKE3rMaDbVeo7267+ucp1AJfRHXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483906; c=relaxed/simple;
	bh=j1wiepT+hzeg7Y1djEHsSLAONuKihZ6Pn/rPYeqsOWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxzTtvpMzyDl51b7ETOJiRPmbvbTi3OXZmNpaDmfT3d2ea7j9NajRXEml4Uj8iuHI1iFFv401imVXGWLJsUFCjGRbi/kouUl9tEe4OZUevsVHzQkt1IcbCtwYl5L5xcr37ulkpzwxwn1fW5TWRbY2xX8PhFZpp0WvrBhEUqyIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKi267M9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKi267M9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768483906; x=1800019906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j1wiepT+hzeg7Y1djEHsSLAONuKihZ6Pn/rPYeqsOWY=;
  b=XKi267M95143E6R08qqIp0AZJqA+dAWQmaNJDRfKYOJY+fVcYBNNro+T
   i2Hd7+PsO8XuyKgd7w7fYnY6zPhQRkTg+mVDC9YbDrtbXAjx1WDsRLa/v
   KU3YjJgOx/Kg14KY5BqWALcJGlcF+TZ+IBaqGfWHw3oZ/DVPGz0j3dU0Z
   s2ggVysdS8tqfKbq/7j+Wk0j8rMClaWxC9djpKTgzIBNW/SzOvB7jtfXD
   JMD53yAWIqF0E2Zn2ouqMGWDr8m+USGyMHySyFGQOawjTl54X4jtSimy0
   9D+jw7DULnmHeUFfsXahzu18xb6OcdBLde6fjGqyYh69FpyY9vuclkK13
   Q==;
X-CSE-ConnectionGUID: bPdnycq+TFaV1t4G5ZqoXQ==
X-CSE-MsgGUID: NTWHF++eRBuPKDUUGKLZAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69767855"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69767855"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:31:45 -0800
X-CSE-ConnectionGUID: utDa7AUNQoGjbUFx+TyNLg==
X-CSE-MsgGUID: fKEOryDMTvq7e9/QkkTjKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205233698"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 05:31:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9EF4F98; Thu, 15 Jan 2026 14:31:41 +0100 (CET)
Date: Thu, 15 Jan 2026 14:31:41 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jon Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5640: Fix duplicate clock properties in DT
 binding
Message-ID: <aWjsPfGO75DzjWhb@black.igk.intel.com>
References: <20260114-asoc-fix-rt5640-dt-clocks-v1-1-421d438673c2@kernel.org>
 <176848231789.253446.13860422269412592694.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176848231789.253446.13860422269412592694.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 15, 2026 at 01:05:17PM +0000, Mark Brown wrote:
> On Wed, 14 Jan 2026 22:08:35 +0000, Mark Brown wrote:
> > Not quite overlapping changes to the rt5640 binding resulted in duplicate
> > definitions of the clocks and clock-names properties. Delete one of them,
> > preferring the simpler one.
> > 
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: rt5640: Fix duplicate clock properties in DT binding
>       commit: be5a39e7994ec9f003c8569b670c794a4e5d1551

Note, in the repository the change has duplicate SoB tag. IIRC Linux Next validation
complains (used to complain?) about inconsistencies or this kind of issues with tags.

-- 
With Best Regards,
Andy Shevchenko


