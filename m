Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC873939B4;
	Mon, 29 Jun 2026 06:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782713717; cv=none; b=A+9s+pIFwhH+NZKTTeEhD7tZcZ4ACNxBYi+CbX9XKdaf7SvOl7+uxeDQfeB7WrJ3L0+nszDXQ4TSzkluKXCaOL8X0OtJoXdlVyQgXGei2qGlvFCa7nRlE0b7Q/WCRO6Eh27dR96XP02ttbX9Eu+yIrW18bfATNlLkK464G12qhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782713717; c=relaxed/simple;
	bh=6g8pV5HsFV16uu1QcbkNKsU9WZvkLEX4mhCcxfmWeWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYbrOQtq39lVPALPuptdny0RVReeLHiqjo2dbQquErA3/zkOdvCkqGCEoa4zU0kUaJPsSS8dkvYlgaOstCnrIeo/ewHzT9QPsnP91wgzJM2r7zvRYpuXlc//c9HCXn/uy7ocgRWEcSfl4i4l1eOKegw6NVqZTXZoCKhtTqjmOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRLNR8+Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRLNR8+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782713716; x=1814249716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6g8pV5HsFV16uu1QcbkNKsU9WZvkLEX4mhCcxfmWeWk=;
  b=bRLNR8+Y1xIQBgdEJe9ePwu+Ze8W8t8NshLFW+biOt2Vky8lJorH9Bov
   xACEKL7+/p57+nBI6rumDXTqHnNq6tibKg+SCkWDcxFyjFYpVbMYdu/rf
   BRJ2UFwaIztSPuEHFzQPkwX9zX1n3fyiRYRsnQh0lKoNkzqGiqhXKRCvl
   A60rTXfhVlbSbxb4TZmCS4kPG8o5yhxPKDft6xrh7KHcuxnXKJsVRob40
   BW23YihU4Ish6W5flc+lHNIEFXBF/sTkQwMbiw4MUKQzuZOLRqBhWU3tU
   6mFyV4LvM8dPFdeNg/MsCnOz2efZL+B4+EwTzT9oXS4WOJShq8F9+d1mK
   g==;
X-CSE-ConnectionGUID: pnFzOwBtSwyhoVukVW5Ebw==
X-CSE-MsgGUID: xYQSx4CDR4CugWLrMJgwIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94544119"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="94544119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 23:15:15 -0700
X-CSE-ConnectionGUID: R98MbvrYRDGrG3RP9QnoXQ==
X-CSE-MsgGUID: ka4VC1jOSFavy5yPrjxCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256270911"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 23:15:12 -0700
Date: Mon, 29 Jun 2026 09:15:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com
Subject: Re: [PATCH v1] ASoC: Intel: soc-acpi-ptl-match: add tas2783 support
Message-ID: <akINbu52R7PJA65Z@ashevche-desk.local>
References: <20260628122543.757-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628122543.757-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jun 28, 2026 at 08:25:43PM +0800, Baojun Xu wrote:
> Added tas2783 support in some projects.

...

> +static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
> +	{
> +		.adr = 0x0000300102278301ull,
> +		.num_endpoints = ARRAY_SIZE(tas2783_endpoints),
> +		.endpoints = tas2783_endpoints,
> +		.name_prefix = "tas2783"

Leave trailing comma for the non-terminator entries.

> +	}
> +};

...

> +static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
> +	{
> +		/* left */
> +		.adr = 0x0000390102000001ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "tas2783-1"

Ditto.

> +	},
> +	{
> +		/* right */
> +		.adr = 0x00003c0102000001ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "tas2783-2"

Ditto.

> +	},
> +};

...

...and so on for Intel case.

-- 
With Best Regards,
Andy Shevchenko


