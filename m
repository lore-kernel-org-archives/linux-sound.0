Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA993E274E;
	Wed,  6 May 2026 08:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055319; cv=none; b=iwujQeAFZabZFrKr1JJFtMbROmxeS7239f7KTuSDLMDYd0MBMWgnsWUKJSOZZX7dWo+NOlDYuWU07yKyvjhyQW6EkiazykF1YH8WCo9mNyiUk03Wlti36jg/DDIPIzLNsK5u/gNF0YsgxN8dKHZwdxD3DxoPXbIAjlq1mde6Y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055319; c=relaxed/simple;
	bh=T80dOqr4anPkgiKzA+RtUt2kYySAP0UYfoKm1mXKHG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrIlVfnRdAOp47KaNK9hC+T7JEPNPpUbp+DBAPniEM1Uj3gXc7mInwE8TP/JBU4gdudRl6fvpgHxYpDGw4GCRDS0FCuVHDGhAdibIhyVlWoacgyMrWP/n2yoZVZrrEasTXf0SDatkwgZrLsNdaydKml2HYdqhTOZhXKEZTAyyNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOa90Xzs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOa90Xzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055318; x=1809591318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T80dOqr4anPkgiKzA+RtUt2kYySAP0UYfoKm1mXKHG4=;
  b=aOa90XzsY6bn9KR7ITvSyQ9tfjIZ58Dd1W8CIb0eJWNN/YtsG+UFWOcC
   Bt5PTad1ejarUDZA4QycBLx2q2nlcNgG9OoAxYcTHK0fRQq6F15K1UNMx
   9Cy8FalCjiFkeFaMfDs5b0SLEdYpqBHsKja0CF5xAzVk16g+JdO9wtuXJ
   7pdlqBkU9dCL44yqPjuvqrfmDsN9DYrmi0LCp0fB507pGuBqMKizxr9on
   rbRAUKUhCIhYbpQcHMHWeQIMogDHKZYlCRek9Mb51e2gjbVD9LzJpzotf
   eWE1OCUaGxn1GG51W59KZmtxMBlHWGnKbMWtIY64G0lEZOXEKCpq/zlzT
   g==;
X-CSE-ConnectionGUID: aqdB62ZNR+OE5IfdeVJUCA==
X-CSE-MsgGUID: 5Gq5IjuvSlyz22bKYMnzUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89288092"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89288092"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:15:18 -0700
X-CSE-ConnectionGUID: wAzjOWATQf2H5PkbEPLe0A==
X-CSE-MsgGUID: CVNeWIcST7az/6oW75+gCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259501423"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:15:15 -0700
Date: Wed, 6 May 2026 11:15:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afr4kOIVFif-iPJw@ashevche-desk.local>
References: <20260505202426.3605262-1-arnd@kernel.org>
 <20260505202426.3605262-2-arnd@kernel.org>
 <afqEHZSUCASXPUze@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afqEHZSUCASXPUze@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 06, 2026 at 08:58:21AM +0900, Mark Brown wrote:
> On Tue, May 05, 2026 at 10:24:25PM +0200, Arnd Bergmann wrote:

...

> >  #include <sound/pcm.h>
> >  #include <sound/ac97_codec.h>
> >  
> > -extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
> > +extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, bool to_gpio);
> >  
> >  #endif
> 
> You're adding a use of struct gpio_desc but not including the header for
> it or declaring it.  Which won't really matter here but still.

Usually forward declaration is enough (for clarity).

struct gpio_desc;

and we do that in many headers.

-- 
With Best Regards,
Andy Shevchenko


