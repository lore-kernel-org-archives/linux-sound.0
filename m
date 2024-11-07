Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3101EABA8
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730974482; cv=none; b=mL1NEtfJNViFKdMLrLSctYIJkhCiQDVX/gj9vhnUU5Wgqh/nza7rfMzJ480w+5xtNNtUC6q3QXer99UkfI5+bEFvYkvQg6kN4AYYdmnfsrsjTOtX4/salG6iU810bU1RIDbekljAZJsHH51n9u8ii2De+CUs9R0ZCBVh5HoU7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730974482; c=relaxed/simple;
	bh=ebYL/mD1+a6f7S7u/wpHDOzDJiCDt0aHLnEVLLUHvxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDStUbPEcRBHunXGcrHKG86+fmw/emJOS71PDOYkhQ7hjGLSm640TA7dcelpx48WSpUpmjUoLjRiYV3+wB79xkKiAUVDDz7kRtsQ9OPtqtJWZ5Wn0OxBEPuD0MpmtPPdut0bls8WfU3tUDqS6yhVy7XUwJh1lzC/bA/4UaY1SaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8t8r8+F; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8t8r8+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730974481; x=1762510481;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ebYL/mD1+a6f7S7u/wpHDOzDJiCDt0aHLnEVLLUHvxc=;
  b=I8t8r8+FHlV6BsQ2Gde3NHGZpC4nTOuKAd6T/Tz6V4depOrX3+FGoY1y
   dJppd6a+dyW5/6hU+l1Ggm691Qq8DjUwS6X9Ld8SHb65Tl9pN+9EH+O6C
   KW3KQY+70bMM4lMqvHzHBRbUChVx2DU9bKh+XzrinVafHLQ7TPRSS6OiC
   Qd5y65h5BLHXIV1NuSYNaX87khKKfMRWclOvME1voXSqSuAcX+JN+l3bd
   wrQQC4fBnKOwmZZ7CxBo05d2aC/wHajtXdhManGm2g/fWZ+KcsUVH1EN4
   o1lgmBkAmLymtDDdpnh3ATUFbl5hn+AtYZHlyF84q+58aIH+0l58KA8kZ
   g==;
X-CSE-ConnectionGUID: qlkD6c9eSiqJiilzWd25jQ==
X-CSE-MsgGUID: SwQtV6r+T0KN8Y1/W6xpcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30969394"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30969394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:14:41 -0800
X-CSE-ConnectionGUID: 8jTy9reiRyS0o2PDCncBcg==
X-CSE-MsgGUID: y8KgeD4qRDeaOk5IBVwHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85813203"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.247.80.3]) ([10.247.80.3])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:14:39 -0800
Message-ID: <8bbf5480-c630-4841-bfed-83804fd3c906@linux.intel.com>
Date: Thu, 7 Nov 2024 18:14:35 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: Intel: Kconfig: Revert make
 SND_SOC_ACPI_INTEL_MATCH depend on ACPI
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.dev
References: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
 <20241107100204.24952-3-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20241107100204.24952-3-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/7/2024 6:02 PM, Peter Ujfalusi wrote:
> The acpi-intel-match should be compiled even if ACPI is not selected.
> The ACPI is not compile time requirement, but the exported symbols are
> needed for other modules.
> 
> Fixes: b6bd3f3b6357 ("ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
