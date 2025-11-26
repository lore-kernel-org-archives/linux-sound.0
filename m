Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AB30EF96
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174172; cv=none; b=HWOeLNRI5Oq/CH4UMjmz5Bgs26FoS5/B74sFx35Fl3vpIRl3Co0eGj5g73KOv7jFP7YimGz8yQ60utqVVJ+2DtPJBB5xraaxdR7gqee50zbmj2iiClf6Us1A3m6gIULo1Etr8ivZueUp9DP2AJQOpX1OVdau9wWLmlYKzkejYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174172; c=relaxed/simple;
	bh=ny0YDWS4a+6cbH2O6bKJwvOk6N/tgbaHP/LQmE1NrGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XghvqDrfoLm4ba76DiIqDR1XZ40TXyMgwqLp5Qt+Z0MqbDIc/upLSyZiew89AUMvQW2CF/gn6/FsDe5uemtgHz6QRwIYY4zAdljmnBl6/9IMekOp3Ebegf0hOvlfQd9obzeVc9wV4gtNJXAvKIno+HeMtQgehWAotp0zpkGd1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUYjIakF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUYjIakF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764174171; x=1795710171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ny0YDWS4a+6cbH2O6bKJwvOk6N/tgbaHP/LQmE1NrGo=;
  b=lUYjIakFPs0xpNSEQT9//IJ6D9dSPZHn8KlQuQSGyH2uQrhAjLqlUVx7
   GeizfWsjQpBF92NDFtue4XHravMSvgWjsS+f7FgNfu7LPbTCmnc3x5pR3
   2UbVUacXG0izLY6HA3DH8wbzmsVp+LBG+K4/1o2Za55XUoHTyTIlKxKfU
   jAl+l7hyXi5JbOarr9wiDFKXhfYgITcwHmAneTx8c1gIxT1SwYdaDh9E5
   HIqRAEjUvsRqi38jiUBxSvE/3XzISpM/YrT23uIKNHGbSJFi4ppxFOOiE
   dT17dK2AQaala2hMMsvkQ6I/NVFK4c4BB+iI4zEJPrZzjyl88bU5/kQef
   A==;
X-CSE-ConnectionGUID: ZwasccO2QB+ZCgKnfL4lLw==
X-CSE-MsgGUID: WofHp8enTkKujf+8BvTSDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66257391"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66257391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:22:51 -0800
X-CSE-ConnectionGUID: WGzDQhXcTtqj84BuTpvjlg==
X-CSE-MsgGUID: 1dZphLhfTAeJMOpJgzELPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192235050"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:22:48 -0800
Date: Wed, 26 Nov 2025 18:22:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/6] ASoC: Intel: catpt: Fix error path in hw_params()
Message-ID: <aScpVriYrHMD9OXY@smile.fi.intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
 <20251126095523.3925364-4-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126095523.3925364-4-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 10:55:20AM +0100, Cezary Rojewski wrote:
> Do not leave any resources hanging on the DSP side if
> applying user settings fails.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


