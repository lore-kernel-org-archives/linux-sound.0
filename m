Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA39033A03D
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174142; cv=none; b=ouSmZStOnkmp2gz+2+jgWxQt+D4OGO6+NSESUReNAy+7PKt7f+KPENp+H3asX4DiC+r+DslsK7R971CeuQDTwL/o/6uhFyskJrCXW6cat+j47sttHfjrZnPZpgGJzUvzt5g/3CQvMolo82+RYnDwfxopMRVtUmcx5bOqzChQhms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174142; c=relaxed/simple;
	bh=WpGSKCpqL+pxzxfe6wNwmtBFDAbj6D5Y1ucsDZuQaUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR2VnbYov05aKr2JEyd37CaKXdsOk2V13AMR7bAj0c1IspdNbnK6A/b1IvLHjZEr6VLgzdvCJUCDg643i5QTBtNgmCb0li1OmQw7GpuVde626il/U3pFhsPxZcGl6tfVje3WHqZX6bofZ3w995FwhyH90WdkD5craSEN/4J85OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aq2nlB3G; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aq2nlB3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764174141; x=1795710141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WpGSKCpqL+pxzxfe6wNwmtBFDAbj6D5Y1ucsDZuQaUg=;
  b=Aq2nlB3GuqGrfn5I8PnSSevGJETmykdQV3wXkzFG8LOL9tJU5Ua7Pgzl
   dWKgfWLqTwa7C5ekyzpqwOBhFSH2UnA8GAp5Te7gvPTYdQ3Iq6YN4FkPS
   hPVcakxeBdHFLCRkqx7n3zIdcoeBGNuiCGwEbXQ6eT6kooL+6Gsyldu9A
   9tSUEfwDTtlLJ/+psMNSulAmCy52tp0pC/0NNNs5riQRRke/AmP3+74ws
   oeC6feBSmwmzS9LLJqHp2Gn7wdYCsUdCvoeo88obOPVag2rvMbe2/ytte
   8Z5GZhGaVdwEZ6XPllaypZIz8oinQTwvslz7RiJgYVdppBBN2wu0x+TKp
   Q==;
X-CSE-ConnectionGUID: 55MlJ3TjT2WdrE6y+ea32g==
X-CSE-MsgGUID: TOkR6cdPQ9Clhpaqcp54lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66257333"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66257333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:22:18 -0800
X-CSE-ConnectionGUID: IH2mwMEdQr6jN9EV9yWlIA==
X-CSE-MsgGUID: Z07K/vryQYeYZOQ3eC9USw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193212343"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:22:16 -0800
Date: Wed, 26 Nov 2025 18:22:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 4/6] ASoC: Intel: catpt: Fix probing order of driver
 components
Message-ID: <aScpNnDj6eUA4-QV@smile.fi.intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
 <20251126095523.3925364-5-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126095523.3925364-5-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 10:55:21AM +0100, Cezary Rojewski wrote:
> catpt_dai_pcm_new() is called during the bring up sequence of the
> machine board device which is a different device to the parent (DSP)
> device yet utilizes pm_runtime_xxx() against it in order to send IPCs.
> If the parent's pm_runtime is not configured before that happens,
> errors will occur.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


