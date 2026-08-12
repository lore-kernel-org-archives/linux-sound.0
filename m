Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C846D399375;
	Wed, 12 Aug 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518753; cv=none; b=hmjQDJkubhMZvyM0i5fGSLLesx1UNBCKYeAsgI7AQzhGK1KCsay59KCGzOeHilZMsA8fYA0E7rLyrc2gEGPSDrAsDJqv5S0wBSW2UV9EyH18myWnSRD5WqJgh6asIkBhaqowS2XlOog4jjxEHPq2fpFJbURoiR5sJ0EDyYlEW8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518753; c=relaxed/simple;
	bh=ObzH5kp5CDfoiPaG75R9jdzEA4F1KXNwXB9PAHaeg7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCjcLRTmH6OTXT/ePgRofPd/yp+zJV+C2B2tnvx/uCK3Hy/g4w1Pk2obNDUJcnxJrJI3dH7rJyd6XVEQ1LA2GGGRJIsbhFLV8z8g0Iw4pSqlbsCwA9g6anrULXcEV2HaqAX1SWAbkIlI/pR/dQZRJsspQdM/kWIImpDG5YbRM2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEXFip7C; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEXFip7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786518751; x=1818054751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ObzH5kp5CDfoiPaG75R9jdzEA4F1KXNwXB9PAHaeg7Y=;
  b=kEXFip7CdejN1X/czKvc+UHkMtOeBWFwe/SEj3XXbpvEo74z6divaXf6
   34t7v/jo0Ah6Hii2zZl4gZIAgzUDKShUjFrzoHq4y/g4VE3n2QpUlQ+cN
   7dGKeJYQP+k1d/GkMlHDfCW7n1yWgnbych9R1S8Ffp5ofFAKgD4o3l+ni
   i/drfNeGT5T5zL5gOK2NgKbdgy10Iqz5MxJIS7DewkIteRJi7gCzKpK11
   lhxY1GmciruDb92kj6z9ORi2I4N1L2oI41H+AoTpo4rPadehh49R7T5TP
   HKkjiH3Xs9DUZjw+4EZIQhVHkhznj8jo4r07yJdZeE2/GxflqtcWt6ExE
   Q==;
X-CSE-ConnectionGUID: Czw70vK+R9KMbTSaTnmIkg==
X-CSE-MsgGUID: RQp+jP4DSDiVZX4Uue+lUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98575669"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="98575669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:12:30 -0700
X-CSE-ConnectionGUID: ZiPY7thgQhCNG8lO387vZA==
X-CSE-MsgGUID: GyFRDGk7SYeV1dCcYj1SBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="260936225"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:12:27 -0700
Date: Wed, 12 Aug 2026 10:12:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v1] ASoC: tas2783-sdw: add firmware download status check
Message-ID: <anwc1w5oCiU8qKMN@ashevche-desk.local>
References: <20260812052124.1843-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812052124.1843-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 12, 2026 at 01:21:24PM +0800, Baojun Xu wrote:
> Currently, the firmware download is unnecessarily triggered on every
> system resume from suspend, causing significant wake-up latency. However,
> this step is redundant if the AMP remains powered on. Furthermore, certain
> memory pages (addresses > 0xc60000) are skipped even after an AMP reset.

...

>  	} else {
>  		tas2783_update_calibdata(tas_dev);
> +		/* Mark the AMP firmware download as complete. */

> +		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 0x07),
> +			     0x22);

Make it a single line.

> +		tas_dev->first_hw_init = true;
>  	}

...

> @@ -1102,7 +1108,6 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
>  		regcache_mark_dirty(tas_dev->regmap);
>  		return ret;
>  	}
> -
>  	return 0;
>  }

Stray change.

...

>  static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>  {
>  	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
> -	s32 ret;
> +	s32 ret, val;

Why is 'val' signed? It should be unsigned int (which is what API requires).

...

> -	usleep_range(2000, 2200);

> +		usleep_range(2000, 2200);

While at it, replace with fsleep().

-- 
With Best Regards,
Andy Shevchenko


