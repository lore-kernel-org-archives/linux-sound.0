Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0E3E7179;
	Fri, 15 May 2026 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830007; cv=none; b=CQ97SZUCgZGfDeatWyLWFQFHUe1bboDw5aseVqLhAf7LG7VWXbFv/fjDGjxz+g95YoGWhZ3SNnYoaFxlrwK0wybYrkbGGyddPK9iwcevsG/iBGWH13n4TnXd/5vEuu/8aHLbf3MFOXw2uCC94YneZ0fVHomWcI5/TrvIiwcoyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830007; c=relaxed/simple;
	bh=S9FSpb5pKnWHX1eaw0nIPQK4r4f31V1oUh588SRp4P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGsBjTN3r0sxT8wL2sp7j2eQ1zaO900nkcDthA8IVBaai7snqf+oQoB3JniYFqbzw0yWqRhEk3/lDJZgTMO9lsFawB+p29CRNCoHXBAVcBd1QWJAFupY891h3guqJu43a2KsjpKwhR+19S3Y9YamVtQe7zwl6BBIwq9PmUiv5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHugPB0H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHugPB0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778830006; x=1810366006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S9FSpb5pKnWHX1eaw0nIPQK4r4f31V1oUh588SRp4P4=;
  b=oHugPB0HExOVosGsGSBjli/BralOKBaNwGx0FLzhZeEwq+U8/myLj9RN
   4jNQwBNDCUVncQVHA4DbmLKxM5YmRaHSzkws8nLp/yPqgtT+k0ek+3xlq
   L7HXmCVWsUdBKSgM6ue2f8hu6thTr1NuBva/2SWlM/BdB32vIRqimIOeq
   tg7Sqnz+CqB6Tmjd8EnKw4F/B4EwxTaXkbjG5k6KYn5riBUabc/BVTzl0
   +YvB81Saox42m6DESbGWCBVGfLCszt2VAvykXrdixqMi+TTStZDuEUOI1
   HXuWdmBGXh9GIhtQDyQp1ndeaFDRXmWH+k4WMs7E2f2fJCvEThjfn167n
   A==;
X-CSE-ConnectionGUID: Q6v1hr72SMK26xwVO4Lffw==
X-CSE-MsgGUID: rh6kmFyTSZanW9/JGZoIPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79823956"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79823956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:26:46 -0700
X-CSE-ConnectionGUID: InwWtiOMSJmCSvypo7xbFA==
X-CSE-MsgGUID: U79ow2+wRradIoaWZ+YHNg==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:26:44 -0700
Date: Fri, 15 May 2026 10:26:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/cs35l56: Drop malformed default N from
 Kconfig
Message-ID: <agbKsYLJOCw8dXNP@ashevche-desk.local>
References: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
 <73f69782-2758-495f-8086-e971483133a0@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73f69782-2758-495f-8086-e971483133a0@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, May 14, 2026 at 04:04:00PM +0100, Richard Fitzgerald wrote:
> On 13/05/2026 5:27 pm, Andy Shevchenko wrote:

> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


