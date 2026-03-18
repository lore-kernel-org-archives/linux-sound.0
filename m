Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823E3DA5CF;
	Wed, 18 Mar 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845930; cv=none; b=o+lBrmf0n1IfqZIvKzEEM0jf35U9E2fOoP5FQP0nzNOqLldhK0tF+OL3itzket6afjh3x8I2zLOi2xPsM3wBim98mGOkbuBbxovxO1MZEICxHYiVcxdI/qk1Rs1ZgX01H7fYwAKfrAR4VwJ/HSgc6zupqOehJfHL8e2l/oI5rKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845930; c=relaxed/simple;
	bh=o2iDCU09TkLNCtHevuEEnfgvg2rEWWP+vxV6PlfCdLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsklCNBZQiO/92w1u0slpnEHlrOpuFjJy0mnGRvQD4VvFfARJYk+vRc9Rr+YSYaIuEHYc7vlJ3UOaY4gEXNefdBl5+rKOGnrvG3pdwRsh1vqWuXIfVJ5cucHnJeawgFOnAn8d0mgw4SyzCYbjZJJft/q51sx28wJKoOU4OpIkNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+spFiGT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+spFiGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773845928; x=1805381928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2iDCU09TkLNCtHevuEEnfgvg2rEWWP+vxV6PlfCdLc=;
  b=K+spFiGTiIE2MmxmXDkc6El2tU2j+oxUCRbaL330byAz4e1HFt0vzH3O
   WGb0s15mB/iOcN0vuW2A+ozlwc4Z6C2jy8tEXHoAGZ3s9thziq/wq9n7Y
   0Jktp3KfTYAqnIJ09Rx9QsOkUZq5Wnt3s7EeuCtEhMdcM3fhivAZu9lVn
   HETAUrxxWmpVEGMC6SzSfIqRKNmvvlKOtFG7iuD6sYX2Zqciu8KshQWfM
   5CXrEQ5mWpEGxp8xGoI4rM+nvF7vlTB6dtqwB+w3Jmkdv421DY+PfOcXy
   MgQoSyN2DO2NZZVzRxtxr7MSpljXPnOffl46oNvPVKIfaSMHqd6IEj075
   g==;
X-CSE-ConnectionGUID: JSjieQv0Q9mcKiRK2flWHw==
X-CSE-MsgGUID: /3twmoiLSpemZddcauP44A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92472061"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92472061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:58:48 -0700
X-CSE-ConnectionGUID: O3ynTGZcR46wY5Mle4i/gA==
X-CSE-MsgGUID: 9t+5v8boRw+ZqCq/5FIdLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253128214"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.240])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:58:45 -0700
Date: Wed, 18 Mar 2026 16:58:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Message-ID: <abq9o6OyYH9A-Y58@ashevche-desk.local>
References: <20260302152610.2498426-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302152610.2498426-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 02, 2026 at 04:26:05PM +0100, Andy Shevchenko wrote:
> No need to open code the devm_gpiod_get_optional() wrapper.
> Instead of checking for a certain error code, check for NULL.

Are we waiting for anybody from PXA to look into this? I believe it will
take too much time... (based on my experience with PXA related patches).

-- 
With Best Regards,
Andy Shevchenko


