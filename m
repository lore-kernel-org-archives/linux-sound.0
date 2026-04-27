Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349A2E5B02;
	Mon, 27 Apr 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312077; cv=none; b=TeybLPw4jO78DRqBsFkbhTmyPfwpbnaUJsH/6NnjAR9R/u6AzoDAaObh60XPfBGe28kxfkDlvyU8g+2BdjZdk6prIRN/213SqJJuh5apsrcG3hDIfkP4xhGCBXHq/pbv0wUYxmpx5+i4irAu2/aXx6oCPlQcM3v3s9AWcZ4vt+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312077; c=relaxed/simple;
	bh=e+J+iOPJfP6z+ZH6Ruj8nWFBBRT4ttpezIBE6Sl1LSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtISpXe2g950jjFmsxEM9mcKfGd9Q2cYD2JLVQxkM0dXZC15VgvaL9vi9/vy5qMyVX2cW4dbQ8Qx6hSAS48zYoLUlM/ppfv5FS1JE3ZyGI4nNAvDDWVpHONzsaRZLf9YfpKDMSUadO43KpBFgSy8xVdc9QgppU5lgO/+ixlU4M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFQ/5glX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFQ/5glX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777312076; x=1808848076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e+J+iOPJfP6z+ZH6Ruj8nWFBBRT4ttpezIBE6Sl1LSc=;
  b=HFQ/5glXuj8lsBEAUBCBNjOOByOW4vvcUskGlqQWz2gvLK1hJIMImFTE
   gwhASMYQm0P0TK7LMzAUJ+jeHLyHh0gj3Sd5wyImpN6GHOC4iwkKiChk7
   DvZn0ldg/XRJpbnvANbibXcjZZh/1ysWtR9qtlu9kGXJ5D3R4gG7wye2c
   4L3WYeXF5mQ4pwkDu0VERIEIXrx1W4uHwZEuOhw3/7EsjTHtdVe6VKaci
   H72P5w7O7TO1QNhBK0tMUHz163MUKMkrLzXYmsDdBy0eaA7pCZmngSF8d
   h0RvhivKyD14tblNz1B08yIV/2o+xGT0MSotp4duaX1fZtqostAhdye5i
   A==;
X-CSE-ConnectionGUID: SW69WRxIQiWI3lct2rYs6Q==
X-CSE-MsgGUID: Rd7M56wfR4yW+dI1gLH9UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="80784606"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="80784606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 10:47:55 -0700
X-CSE-ConnectionGUID: bdt4f1QrSvqbpmLyWvoIuA==
X-CSE-MsgGUID: NZEGh0wLSNqo3U3TR5hHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229156488"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 10:47:51 -0700
Date: Mon, 27 Apr 2026 20:47:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: pxa: integrate sound/arm/pxa2xx into
 sound/soc/pxa2xx
Message-ID: <ae-hRXdoVCeNhNSm@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-3-arnd@kernel.org>
 <ae-GOQjD4Kq0ve8D@ashevche-desk.local>
 <2e77971c-ce4d-4489-9e8a-7766c6576a39@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e77971c-ce4d-4489-9e8a-7766c6576a39@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Apr 27, 2026 at 05:58:00PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 27, 2026, at 17:52, Andy Shevchenko wrote:
> > On Mon, Apr 27, 2026 at 04:46:31PM +0200, Arnd Bergmann wrote:
> >
> >> The pxa2xx sound library modules are only used by the ASoC driver since
> >> commit b094de7810f3 ("ASoC: codec: Remove pxa2xx-ac97.c"), so move the
> >> code into the one module that uses as a simpliciation.
> >
> > Is this part of the series that touches UDC? Btw, the UDC one despite on being
> > mentioned as v2 in the changelog still have no versioning in the Subject.
> 
> Both patches came out of my work to hide the last users of GPIO numbers
> behind CONFIG_GPIO_LEGACY that I first posted last year. A lot of my
> patches got merged (or replaced with other work) in the meantime,
> so there are only a few drivers and platforms left that won't use
> GPIO descriptors any time soon.

I'm fine with that, I just got patch for UDC and patches 2 and 3 out of 3 of
some series related to ASoC PXA. I was wondering if they are coming from the
same series. Anyway, it's not so important.

...

> > What a lovely change! I would like to give a tag, but see a comment below.
> 
> >> +extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
> >> +			      struct snd_soc_pcm_runtime *rtd);
> >
> > Can we kill 'extern' while at it?
> 
> I can change that, though I usually try to minimize changes to
> code that I just move around.

I don't see the point to have another patch to drop 'extern' while we anyway
move the code around and all those are being touched.

-- 
With Best Regards,
Andy Shevchenko


