Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86C25DB0D
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171691; cv=none; b=OW3J4lw1x6rFhJxcKsY7ras1X7wDgGAcgDMpUCfdncT39ZhOMZtaKtofz0CqIsUw1xX9+oDJqpLeACyJjDsiJ3Jj6zvqe4LLE/7P/Uqyd8Le6+MXDGuTC90RRcSnb9SY/vpoSfCVUjP1aEkbvz4HGePEkRPiuihMk6IECsQrhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171691; c=relaxed/simple;
	bh=ccnMeCmuRth6YqA/BPZSxZoc6sMirxGQRRRdl9FDd9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3GSKlpAfipt9Jqxb3Qa+eotGX1Q2AZva5GgbxjZGnmYpVJL0UF459lUMf10DaQzfDziekMyjLuL9PanqXqv7UmLsm8kuEin2xWQEJiEM1lI7qFsqRZLD0qPxN9xbNrOQLpxsEYfBwSCr2ZD3Z5VJcTPxhu44eIT/NReZCtMbzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce3hjwmO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce3hjwmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764171690; x=1795707690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccnMeCmuRth6YqA/BPZSxZoc6sMirxGQRRRdl9FDd9c=;
  b=Ce3hjwmOdo0Y+dawCJWIAJotREUjsTCAvWyc/H1vrDU8Cftswk0XdGch
   rIuIz0/Tvi+V2MJctLdKS4SxcnGFftmPBqRt21KrpWKk7MHXspInOmAeb
   P6MOXMpdEOXf7hRTLDlWPKiep6tgZ8Aunvz4siLr1neSyzN/FYbyrD9k0
   8SN5AW8ahE3KyDlGoMfe6RjW8MmXDOi6jSn/SCVjtVpwS6cfJRu2VWRph
   js0POsJQYY6TboARlvFQsgEiJT52FpnjaS3vV3xAwFe3Y+3feMmKOxv/Y
   otMgLerqKtcGaHOohf/L18nr635crG6i8q4OEVSGW3DvXxmbOZr5IHSCD
   A==;
X-CSE-ConnectionGUID: z+UHS4rfQo2yyy2E2MLztA==
X-CSE-MsgGUID: aK7ulo/FSRyDe11CVq6/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76537331"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76537331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:41:30 -0800
X-CSE-ConnectionGUID: 8INnsf6dTmSEKxTfEF3HAA==
X-CSE-MsgGUID: 3ILksW0sSXiueE24yTqTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192855565"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:41:28 -0800
Date: Wed, 26 Nov 2025 17:41:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ASoC: Intel: catpt: Switch to resource_xxx() API
Message-ID: <aScfpoia9DMW5HP_@smile.fi.intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
 <20251126095523.3925364-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126095523.3925364-3-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 10:55:19AM +0100, Cezary Rojewski wrote:
> There is a number of interfaces available for manipulating instances of
> struct resource. To improve readability, move away from manual editing
> in favor of the common interface.
> 
> While at it, adjust spacing so that both code blocks, while found in
> separate functions, looks cohesive.

...

> -	r1.start = cdev->dram.start + blk->ram_offset;
> -	r1.end = r1.start + blk->size - 1;
> +	resource_set_range(&r1, cdev->dram.start + blk->ram_offset, blk->size);

+ blank line.

And strictly speaking we have resource_size(&cdev->dram).

>  	/* advance to data area */
>  	paddr += sizeof(*blk);

-- 
With Best Regards,
Andy Shevchenko


