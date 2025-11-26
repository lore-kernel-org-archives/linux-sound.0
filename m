Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC53101D8
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180554; cv=none; b=RTHjRCs0+q8dxqiNZ6zQGVOa7WwrOY7+4ws97bC51Hn3qkJfiTQNRqt8skTfPXDGvzB3I6xYrM8wrY4vtLKnSyJ9HuYZcVH6kRsxvMKHmiiZUsC3u25Zrj1Vd93ldKGUKPn8DyJBg/RhmOux7eeG1I+C7tcNMmgZgzmrmS0XnHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180554; c=relaxed/simple;
	bh=noa1ATZKRi2M4q45umQhe0FmeRH/Fv9xfkGUfN8eTj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bncz/npCQMlA0DUE7UllH5is+gvqdll1cIJtmp57HUteMSjEcGqrgBboG6JdFZQ0wCF+O28zEYbhFs42OdE6WQo5VNPJ/eQJTG1pY64+cdmMZbyjO4lqiLF65sPZ/AaYTJSHg3JkMZ8JuCRYQwagHVAKFzJ9SvM5u0uJBEJbGeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8QCGZgu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8QCGZgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180552; x=1795716552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=noa1ATZKRi2M4q45umQhe0FmeRH/Fv9xfkGUfN8eTj0=;
  b=Y8QCGZguvOJwEpLijaFG6YsOmKEhJeBi/KY2xQeOzLHMngQvm5Eh+ds7
   Q58fHgldpscMPrHgfW7yz+h5XlR8qcciQvKzTFQDMhkLZ8/YZM7fg8usF
   v5liYqEjf9z5YDzjKRSCClyAxXI2uqnyyeKedGm6xGlbp20XcB3/iWVpU
   H/vLDJndLoRcXkVoPlO27s9Ayyk8+ZbvSRe/G9SCprLauBCj9XKk9iIIV
   uHDxzupaPMLjxgIkh32zoktoyet1df3bkA7Rw+8fCMvgMn2YYYo8dtnBo
   uUJnIE5GeNRhLDyvKQC/5Se37EGc088pFdqJrvxzjQMiUG1G8in7pCjc4
   w==;
X-CSE-ConnectionGUID: h4JpHbwVTt+wNbD7aWQqVQ==
X-CSE-MsgGUID: AIQXLvE1TC+uLMrKdm59xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69848139"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="69848139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:09:10 -0800
X-CSE-ConnectionGUID: wDfrSd9UTmO4QlBUe+eFDw==
X-CSE-MsgGUID: kvOO6vFsROi4zIOVJBRAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192137054"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:09:08 -0800
Date: Wed, 26 Nov 2025 20:09:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: Intel: catpt: Fix offset checks
Message-ID: <aSdCQiDphJLMe2sC@smile.fi.intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
 <20251126095523.3925364-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126095523.3925364-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 10:55:18AM +0100, Cezary Rojewski wrote:
> Verify if the entire block is found within DRAM, not just
> the start of it.

Don't we want a Fixes tag?
If not, perhaps make it go after the fixes in the series?

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


