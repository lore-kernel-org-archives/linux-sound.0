Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03029AAFD;
	Wed,  6 May 2026 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055235; cv=none; b=rdKREmQxENyLUBW0NUbnNNSnkXxyYyoI/G7jqZxWSwxHUisMVHxdmp123+QmhD5k7PFBAtCQzIQjFLXi82w4+1itA59+i9EQ1wWLtSFtawtltZ6ngDqd9e93xz4xRZ0M9y0FwUQ4654/cAuda7hts9gr19jN3P+Bl6BwRSrAqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055235; c=relaxed/simple;
	bh=0FwViEFZHiQJ3iExOzuEZ2gtzbIGH5AsMXLZKpIKtCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNGh9z+5BqUnxoBQCy4U5fJByj+AX4VblDSui/cuHlYQmR1HpepM8oy40bXs1GCFIL70A5I24G8pwQsxKfG/k85UoedXWoUKle+Eh+AdiMF/N4qyGvUvt+VyBe6JtU/1FKcXJEMZ8n6c+eYV+iL8auNaxBpPNwSh5YzPdSB0764=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPZ7XkN3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPZ7XkN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055234; x=1809591234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FwViEFZHiQJ3iExOzuEZ2gtzbIGH5AsMXLZKpIKtCA=;
  b=cPZ7XkN3utKeFJ6cbSjXqDVYrmASOKZvsesTg8OmUkQotw2XlUZMweRk
   FcScHyErQYH8BY9oFVe/H1xPhiz14xuC7a9Qwc9dZ0hX0OxIVXKiav7LT
   yqfnkwCZb0lldfAxv/nS7pQ948ptvUN9V80H7l7sYW6Sa/c18fYHqYdhn
   YSsGfGjRrKqG7XMc9XIVtrXVbAbSjc7y/+SwqDr0QPqnfJsv/56NLiO4h
   td9WidCtCFoVjJfbZETo9Q2khTHX32uhFMFyAcYvpO2CR2idNAlYDnh7e
   YIpZa1IDaU06bFbZgT+wJc3lR3P6GGmoz4a+K7fUdpeopRn1tkJqg3NgT
   w==;
X-CSE-ConnectionGUID: exLhXIIXT5KbfU4BTj4FZA==
X-CSE-MsgGUID: Ii155yIAT/iiIDV/1MIcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89287889"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89287889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:13:53 -0700
X-CSE-ConnectionGUID: 6qVlkn3CTKCyNwjRFVC9cw==
X-CSE-MsgGUID: DEaDb42jRkelGndeWVrH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259500826"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:13:50 -0700
Date: Wed, 6 May 2026 11:13:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afr4PEk9OPpJnu49@ashevche-desk.local>
References: <20260505202426.3605262-1-arnd@kernel.org>
 <20260505202426.3605262-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505202426.3605262-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 05, 2026 at 10:24:25PM +0200, Arnd Bergmann wrote:

> There are no remaining static platform_device users of pxa2xx ac97,
> so the rest of that code path can go away as well.
> 
> Since nothing in the driver uses the gpio number now, constrain the use

GPIO

> of the legacy gpio interface to the architecture specific code.

GPIO

...

>  #include <sound/pcm.h>
>  #include <sound/ac97_codec.h>
>  
> -extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
> +extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, bool to_gpio);

Looks like this is the only useful line in the header, hence while at it we may
drop 'extern'.

>  #endif

...

> +	if (cpu_is_pxa27x()) {
>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
> -		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> -		if (IS_ERR(rst_gpio)) {
> -			ret = PTR_ERR(rst_gpio);
> -			if (ret == -ENOENT)
> -				reset_gpio = -1;
> -			else if (ret)
> -				return ret;
> -		} else {
> -			reset_gpio = desc_to_gpio(rst_gpio);
> -		}
> -	} else {
> -		if (cpu_is_pxa27x())
> -			reset_gpio = 113;
> -	}
> +		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +		if (IS_ERR(rst_gpio))
> +			return dev_err_probe(&dev->dev, PTR_ERR(rst_gpio),
> +					     "reset gpio failed\n");

I *slightly* tend to have my patch just as preparatory for this one as it does
one logical change, this one does another. But if you think it is not worth it,
okay then.

...

Now looking at this, I am not even sure that we need that if (cpu_is_pxa27x())
since optional GPIO will return NULL and everything should work as long as
there is no mistake in DT or platform code that provides the GPIO.

But such a change should be done carefully.

-- 
With Best Regards,
Andy Shevchenko


