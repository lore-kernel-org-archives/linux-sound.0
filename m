Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3F20B1E1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578799; cv=none; b=nT2EM4RwdTVHhf6N/VJo7pWQs5NPfIJVXCfiA/piG/lEB8QmzyUObAxV8CepA2FiVMQkd0140Eim+ScrELL79x3wJ1cRX3Blt+/jXfdVzsFz2DRDthBVd9MOnrZq+vrZXzuVF3MxTSRLpdHWIEVtBvenBebsilMuaZAm+mCtwXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578799; c=relaxed/simple;
	bh=0D1oFChNq/VGmhxpp+PpHJmi+2BDuHoMaoDG544SXBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRZLb1lDh0vkk5Elt/rL9dVH+ZYXY2zNS1XUVj7a4GfBN1ju90A7AXPls8fsAiI7R14dt+d0PK/Llp7urS9xmnYzU6ByGbW/+FGnT6bGaoknTg+04tQU/IesK0bGxSPZ5RfcQ3tS68PLzxGlko7scvtLzNDYP/GShR5SU4R9nQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVkyqQVr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVkyqQVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740578798; x=1772114798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0D1oFChNq/VGmhxpp+PpHJmi+2BDuHoMaoDG544SXBI=;
  b=XVkyqQVriZ3Er9cpsDhW8pDVzhWFDXmZWgh0Swxtwe5wX77nTU5gIS3c
   dRfeUL1Li/ogqMEMzwkcDrp3OKSYWPS/RAQm6IlLLv4GuHrWef9Sa5zf0
   moQKKpuuWHpFq0IHQ0ILYL6A5guTtrHD0BZrM9P9OJdoZ6GzaY1lzNbQ+
   BWSpKnyqqEadcYqoIbqQ6SUQ1/R0RJkktlio02/jMa9Ff4q9L5K9VkpjA
   GmL3hUSGa2/7SRwsOrXLMnIS8RcjE2pkvNf5IDv/RQj/PQOftvKnrmkk1
   BqnzVuvFQUQ6dXGD4+zmSrnGKRPdGsW7owNMJjio5cfg+UWyHZpl2aOtw
   w==;
X-CSE-ConnectionGUID: 3XisLec3TcCSZHissViADw==
X-CSE-MsgGUID: fs0FV1jmQh2eFsD7SiPOhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58842413"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="58842413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:06:37 -0800
X-CSE-ConnectionGUID: pW3EY0nHR/uclBOdjhQHUg==
X-CSE-MsgGUID: QKz9PltpSz2g0jD+Y00zRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116897056"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:06:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnI3U-0000000FLH0-0agr;
	Wed, 26 Feb 2025 16:06:32 +0200
Date: Wed, 26 Feb 2025 16:06:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, flove@realtek.com,
	oder_chiou@realtek.com, shumingf@realtek.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/22] ASoC: codecs: Update device_id tables for
 Realtek drivers
Message-ID: <Z78f5wn0kqJTn4Bh@smile.fi.intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226112612.166989-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 26, 2025 at 12:25:50PM +0100, Cezary Rojewski wrote:
> The series aims to streamline the formatting for ACPI IDs so that a
> single pattern can be used to identify the device.
> 
> Work implicitly suggested by Andy Shevchenko - reading and learning from
> number of his reviews on the Linux mailing lists.
> 
> Several formats do exists, however, after technical discussion PCI-based
> format has been selected as the recommended one. For Realtek devices, it
> is going to be 10ECxxxx where 10EC unambiguously identifies Realtek
> company whereas the following 4 hexes specify the PART_ID i.e.: the
> device.
> 
> While at it, there shall be no comma after the terminator entry and
> initializing fields with 0 for statically defined structs is redundant.
> 
> Patches sorted into two groups:
> - fixes, no functional changes
> - updates: fix + addition of new ACPI ID entries

For all
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


