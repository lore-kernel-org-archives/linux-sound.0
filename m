Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BACB34888F;
	Mon, 27 Apr 2026 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305503; cv=none; b=jXG+5cNQ8FmydzhdLXNbXkA3+TEBBiqFQqM7mnKPesdzEVcB3hsLoX1izNEBPuM6m+erKftuR6GGrQL4L13iZKUPBBihoPUNtHiTpF1J7pvPDVZXrD8TtOjW7nNpKCnQtcYS7furKAylYCyKKd2Qv6w7S+G4wCO87HfLu9TJM8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305503; c=relaxed/simple;
	bh=bRO0pft5QsUPW4LQyQOyXHgfHCTW8GGaobJi0FhQc0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+ViuPS51IE0y918ZlX6olmUH1a/uzqvds6KYHu/hvPM8rt/tb+6XDIkYeYLwhx0yNttmzgnCGFLhziErg7HIRmTZho9+JUwzFJPlgWehWJdVoRBjq/DgBJynoIiPqsu5DCygTKI6hr5LSo406bu8Re3Ibcd+vpy2feD3efbrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kkw2v6ze; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kkw2v6ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777305502; x=1808841502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bRO0pft5QsUPW4LQyQOyXHgfHCTW8GGaobJi0FhQc0E=;
  b=Kkw2v6zeDSIHV8ufpAjRVwM/ivSjVOp7HZceuGyv5KecmOhjuTymJfS5
   o48ikaQ8I9gg/iSJxPYSrcQg+GlZ3IVO/nCaON6RXk2T+pMS/Z9xjyhTF
   6DHt2kj+FSdK6e6em1WuPz7aeEcTLot5VCooMkWXbsFq6uc5YPh+wKHD6
   7/4UVo2mTcuZDutlLOWyxJ4kY3ZYS9uMZKj1mFV0IxRMNLQ9K+KLjcjt9
   WNVsLkdjbg3onmh8piQKXsPm0Hgg5D4vfbVg7EF+X7PWImLNM6J7YqEeU
   OEcd9kV04u2kKaugK8bf3ItL5pnj+eBK5nx6kEdUjfQAPHcHCRVq/NkEm
   g==;
X-CSE-ConnectionGUID: 6/5XiilYSLmyEvKQFSJpxA==
X-CSE-MsgGUID: 6CGzm+f+T7mQpgt67izthw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88510961"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="88510961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:58:22 -0700
X-CSE-ConnectionGUID: vlwi7aK4RPmb16kNrF4n+w==
X-CSE-MsgGUID: st8OBs88TvuijDWBDwdKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229115369"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:58:18 -0700
Date: Mon, 27 Apr 2026 18:58:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <ae-Hl4LZiZzCh8dy@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427144658.3609647-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Apr 27, 2026 at 04:46:30PM +0200, Arnd Bergmann wrote:

> There are no remaining static platform_device users of pxa2xx ac97,
> so the rest of that code path can go away as well.
> 
> Since nothing in the driver uses the gpio number now, constrain the use
> of the legacy gpio interface to the architecture specific code.

...

> +	if (cpu_is_pxa27x()) {
>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
>  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> +		if (IS_ERR(rst_gpio))
> +			rst_gpio = NULL;

Have you seen my
https://lore.kernel.org/r/20260415150412.365989-1-andriy.shevchenko@linux.intel.com
?

Perhaps you can incorporate it into this mini-series, as it looks like that one
hasn't been applied yet.

-- 
With Best Regards,
Andy Shevchenko


