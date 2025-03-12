Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682524168E
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778096; cv=none; b=MOoZurjTv3WhtoQIt3r5GEP7O9vYuWeoICQe2ZZV+xL3338slkDGcgzwb+9pJ7DbFf2Nz/RwPYXdx/as2e1GokL3dIGqUH4zN4GkGXBFHAoi+cyTfvdHNsEAABZFIf5w01fuc43pnDRc68CZysszwFGysvnBaRjzo0sUmeV4kOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778096; c=relaxed/simple;
	bh=i+LkKRNdeeL3VFtnapOxKJLOexWc9Q1/OeRoAJxxYtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6DCzWflNJB8VNiz+dTo19adi1w2bekyZzzr4BHevuH2huj1rKsfEbr/Gy7k0nBnXQS4Sme+c5UIlwiRlrWz8wYnLU+/o6z1rRah3P8OZ24W6N2LeLuHTCfY8gdFOax8Hpvf9HIhy4jEQPBDUpGUN42pYgOPKfcQ8QJ1rYczQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcyDxSRg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcyDxSRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741778095; x=1773314095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i+LkKRNdeeL3VFtnapOxKJLOexWc9Q1/OeRoAJxxYtQ=;
  b=lcyDxSRgTqjZdlN17ysZjDwvIcKJM2GnFB/hfIhlA7s/6wxIeS1v+Hq1
   edKXE1Keu42Ny+HHN1cjfb1Ydscp/0WACxrp9G+Fmucf6Jj+NzLZ0N3CO
   DWfruqOaTvDPET62XNd2lpInxNZbHZpIQWARv5RYZ09EFmb782WVEtrsf
   xQyDOOBpP1PpOx66+BkjOURu25HgIPA3bib2yALWS1cabS8wndAtseoyP
   9ajeeVVcJOqfi5rv/o3et0IAgC1LkoDReroikFqrmRBs47zPPIXCrY0AK
   Sownl5ElRIyiumbsA+i4mfpl3ZLWrBnbvSpoo0rOi6LMZA/FZxr0vdhzz
   g==;
X-CSE-ConnectionGUID: 9AQKNCdyQ2WEhHQ4O5XPhQ==
X-CSE-MsgGUID: uOE6VeWXQOO8tWrC9yDnpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="43031377"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="43031377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:14:54 -0700
X-CSE-ConnectionGUID: Jla/u6+YRpCja9pYKtxDOA==
X-CSE-MsgGUID: hDPNxpQ9QJOQQuXfIDEkhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="143798233"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:14:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsK2z-00000001qFE-3SId;
	Wed, 12 Mar 2025 13:14:49 +0200
Date: Wed, 12 Mar 2025 13:14:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: samsung: speyside: Free gpiod table
Message-ID: <Z9Fsqa9O4Z9qPWFc@smile.fi.intel.com>
References: <20250312-cleanup-table-v1-1-1d9a14464482@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-cleanup-table-v1-1-1d9a14464482@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 11:02:25AM +0100, Linus Walleij wrote:
> We create a gpio descriptor table but it needs to be free:ed
> when the module is removed. Add a devm_ action to do the job.

As the fix this is fine, but I'm wondering if we want to have
devm_gpiod_add_lookup_table() in the GPIO devres,c/h?

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


