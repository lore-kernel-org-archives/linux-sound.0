Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFADD256C88;
	Mon, 24 Nov 2025 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763969815; cv=none; b=RL4jqFDoNbHRrSxP/KuRnAlCf26Yt6IewvsD5GZog19pEQAvluKWT9O6dTDT7h/zLWQNnRRvXdWpa/7NeCPSKq4Yg0sctY9qUhgdqZzWmJH73BcoAhCwPP8e0pzVaarD3jv9cZfo6X3JiqIuNjIEjAdgVbNeD7Dzpe2rKeIcU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763969815; c=relaxed/simple;
	bh=owh2dQTcZvus5C8V4A/hK3/MF41Gy0WTVum1crE0+9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzO5uohuBSV+lcLDC9YCZ5gTRFB3bgF0PvwgwTsWqmhdJ2jih7jugl4BkldwqfBOXiPNcWn52H0e0a16WW4olLWgM8qoiDjKDXMlwyb2oE0OqSTRZPfYpPCoLqo9to1qsv+RRRn9O4461CrDcxclGu+gowrDSInghOPZZ1P9hbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsOiWy5l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsOiWy5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763969814; x=1795505814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owh2dQTcZvus5C8V4A/hK3/MF41Gy0WTVum1crE0+9w=;
  b=MsOiWy5l4zOjguzWa/N7Hce0PvqanfdibYdQaMWcNQb5CeQ3kyfeCqQm
   Dy3N7xqYSsmA71SxEXn3PCh23pfvGP8UrYwVKRGXG+J24wmRC+pYY6wJi
   pgBibNHD1knC+sXRg+t/XI9vDL99U9R9w7CZa4PEGFIFHebs7Cvd2Rf9q
   tYO/IefFWtykA+lvJuXKIV1BKYfc6EulbNUlbwjH9a6ND0chCd4DRaZlx
   fWegfNlQZyyzR+xM+bHeOrpM07FmnwuN9ZxGwwsKvX5Vref3rNpq4AnxM
   q2IMMf/5y3vxRdgSN6FUVFcEqX9do5mkitm6823jsjqxEgOe4mFPA7mGi
   Q==;
X-CSE-ConnectionGUID: h5Jd9SKESGWflXGq+OUJWQ==
X-CSE-MsgGUID: Mw32dxDfRsqGSCWdfAwTMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91448800"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91448800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:36:53 -0800
X-CSE-ConnectionGUID: 36cD+iiFRBKDNRwZbusgNQ==
X-CSE-MsgGUID: vf+brltTSkiIVNRhZ4sAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197190315"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:36:51 -0800
Date: Mon, 24 Nov 2025 09:36:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore irq for I2C device
Message-ID: <aSQLEZCLM0t3BbHl@smile.fi.intel.com>
References: <20251122095903.2239-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122095903.2239-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 22, 2025 at 05:59:03PM +0800, Baojun Xu wrote:
> In some projects (HP Lampass), no GPIO was assigned for irq,
> it would be better to ignore it.

I don't think this is correct approach, but Hans probably knows better
the code.

Also when touching this kind of drivers, please provide ACPI DSDT excerpt
to show the Device object description in question.

-- 
With Best Regards,
Andy Shevchenko


