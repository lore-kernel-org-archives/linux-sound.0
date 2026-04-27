Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2457535F19A;
	Mon, 27 Apr 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305154; cv=none; b=sufhJ7NM6wRPbrskwFHwtih129/kSdZU9itv42jNfHnMt8BvFAj+9+6V/jYMuLja4D0yhGi2wuFTV/SVSlJT715GE0dO5+KOurfK4rm1tDlBT3qxQ2zWgn3ZwR/2BivX0N4Yy2eykBevdTI/ioPxwbAqnDXok9f785I/tFs4APk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305154; c=relaxed/simple;
	bh=hZzygghIaYNoBXzjbpF+bp1gCuinbN7CeWYke3oLa4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljgzM6Ia6p5aTu5FVg2j0qaKQ4jqhgAMzgE94rRNJohSwowrzyYOb2+loTP8R1Ot5ZdLyglcKyd1h698YqwSjQ3hkYJP/OEIM2i4DAvG7qn1ddPwiCvlEY45SIwPfl9TKLgCbQ23LbDOglcgmysLBztLmbJfsjSgrrWoE+6HcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQBRBtYx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQBRBtYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777305153; x=1808841153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZzygghIaYNoBXzjbpF+bp1gCuinbN7CeWYke3oLa4U=;
  b=BQBRBtYxiA0xTSJWR54Zqk43OMcLIj+5CKxzgOD5wu9GxC0vgZ96WN7P
   hQHLabqyRGPxlYMLphXFqL/LYhQnWfkp0nCRBDbHtaue41Yk2HUlxb+2f
   0gx1Np1i++0fJlybiS0I5AV4AImnvDolHy4T+qQB3ldiTxE35CJpv8wRA
   Pk+cjofyohPSRdCq/vG7Yj9ZrXz1ilLtOihKKRo0faKZyb7Fz29ZUVooU
   Q/3gEKNuAKvnkyoPLsfNR/3O438BSDRGgrQA3pBzy/akyJ1BFpwUNE6aE
   6K1fDzfgrzFNCRX8INLLRIlG+KEG8ODJjD+Rbfy/jWqileCAtKpw0e4lI
   Q==;
X-CSE-ConnectionGUID: /OaEPrOCQ/iu0a/vIQNPNA==
X-CSE-MsgGUID: ZB6J95dDT0a7F8DRri4QqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65728611"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="65728611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:52:32 -0700
X-CSE-ConnectionGUID: QaxYEsZuSQqV1Lg0u0bCBQ==
X-CSE-MsgGUID: Uqme4H9aRTmYVVKbBLbUXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="233517889"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:52:28 -0700
Date: Mon, 27 Apr 2026 18:52:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: pxa: integrate sound/arm/pxa2xx into
 sound/soc/pxa2xx
Message-ID: <ae-GOQjD4Kq0ve8D@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427144658.3609647-3-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Apr 27, 2026 at 04:46:31PM +0200, Arnd Bergmann wrote:

> The pxa2xx sound library modules are only used by the ASoC driver since
> commit b094de7810f3 ("ASoC: codec: Remove pxa2xx-ac97.c"), so move the
> code into the one module that uses as a simpliciation.

Is this part of the series that touches UDC? Btw, the UDC one despite on being
mentioned as v2 in the changelog still have no versioning in the Subject.

...

What a lovely change! I would like to give a tag, but see a comment below.

...

> +#ifndef __PXA2XX_LIB_H
> +#define __PXA2XX_LIB_H
> +
> +#include <uapi/sound/asound.h>
> +#include <linux/platform_device.h>
> +
> +/* PCM */
> +struct snd_pcm_substream;
> +struct snd_pcm_hw_params;
> +struct snd_soc_pcm_runtime;
> +struct snd_pcm;
> +struct snd_soc_component;
> +
> +extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
> +			      struct snd_soc_pcm_runtime *rtd);

Can we kill 'extern' while at it?

> +extern int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream);
> +extern int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
> +				struct snd_pcm_substream *substream);
> +extern int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
> +				    struct snd_pcm_substream *substream,
> +				    struct snd_pcm_hw_params *params);
> +extern int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
> +				  struct snd_pcm_substream *substream);
> +extern int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
> +				  struct snd_pcm_substream *substream, int cmd);
> +extern snd_pcm_uframes_t
> +pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
> +		       struct snd_pcm_substream *substream);
> +
> +/* AC97 */
> +
> +extern int pxa2xx_ac97_read(int slot, unsigned short reg);
> +extern int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val);
> +
> +extern bool pxa2xx_ac97_try_warm_reset(void);
> +extern bool pxa2xx_ac97_try_cold_reset(void);
> +extern void pxa2xx_ac97_finish_reset(void);
> +
> +extern int pxa2xx_ac97_hw_suspend(void);
> +extern int pxa2xx_ac97_hw_resume(void);
> +
> +extern int pxa2xx_ac97_hw_probe(struct platform_device *dev);
> +extern void pxa2xx_ac97_hw_remove(struct platform_device *dev);
> +
> +#endif

-- 
With Best Regards,
Andy Shevchenko


