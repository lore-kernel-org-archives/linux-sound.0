Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2F10A3E
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749519190; cv=none; b=B6qySH/v6LifKmjpFQlUM0mD7j6LydeYhhxjqNKOLl+WljWuCg4n1wfgHRIedyfULzvUJ0jAMX/WlLlXm+g1uG4VRMbiiExsmJif/kTb7CzwIU/4lH0yv6LgzqvfPGNjJvDHICsw64lsGkuFLbyi79soTxn6EVOWkkKPXuZ1Tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749519190; c=relaxed/simple;
	bh=VwPUy2pyIzJrdmfDIrSpPoB7u4xMYozqmto8sOZ2eqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+PgLvBGVHeCUHJCUcD149mjO1HKHkFa9he9tiB6O4tzYobK8NZwsQ6mJL+BdVYBfKg4pAXQBOqR3E/5DLRUl6pY3EDQzrehMNT/0f3TZ9FoilVjaksT5wOY6nrR9/b6DGz4g1MOAnKL4m6H3b0NQn17cprvI6sLL80BIc0S8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYqOCMRm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYqOCMRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749519189; x=1781055189;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VwPUy2pyIzJrdmfDIrSpPoB7u4xMYozqmto8sOZ2eqU=;
  b=PYqOCMRmBOjl9H71nKzI9cWkrqZ9QYzhzMmvdVsXq/xZ+N4qbKU+3mAc
   zB4pLcNs5KJxt8GpS1KN0YuLk67fLdKC0hEm8VU7gQBx8kGqWFFGvmNLE
   kyi7kIeu8vH3DYecR8NxisgQnq2c/Y9WXp5k6nQ98IFoJXeOHDLJ6l/sE
   xlFiYiT8RTJLq0wx9x+weKAXV61CvrVOOcpbuxPXxf0t4DNjfLZBouaQp
   2MeQNPfI7kZgPuO5LX33uONIuu4aVaVTytceYw7menmdQoaEUjMHbLjlT
   ul7mKDrHd59ffGNGdjr+q1FACUX22dTarEvLgtuZYuOf2+5YkSSuCu01/
   g==;
X-CSE-ConnectionGUID: YB0cOTGgRp2e5+Doco6vHg==
X-CSE-MsgGUID: Jm6AS2KCRKWOekPcxE/+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51323618"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51323618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:33:08 -0700
X-CSE-ConnectionGUID: jJ5VyqpzRby9bhpUcQ3G2w==
X-CSE-MsgGUID: dL2g6p6hT2S4yCZ0IV9lRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151482542"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.105.120]) ([10.246.105.120])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:33:06 -0700
Message-ID: <d3c6686f-c57c-4607-b517-cb3f2e08c2a1@linux.intel.com>
Date: Tue, 10 Jun 2025 09:32:54 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add SDCA IRQ support and some misc fixups
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, pierre-louis.bossart@linux.dev,
 peter.ujfalusi@linux.intel.com
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/2025 8:39 PM, Charles Keepax wrote:
> Add a maintainers entry for SDCA, do a couple of small fixups for
> previous chains, and then adding the beginnings of the SDCA IRQ
> handling. This is based around a regmap IRQ chip and a few helper
> functions that can be called from the client drivers to setup the
> IRQs.
> 
> Thanks,
> Charles
> 
> Charles Keepax (6):
>   MAINTAINERS: Add SDCA maintainers entry
>   ASoC: SDCA: Add missing default in switch in entity_pde_event()
>   ASoC: SDCA: Fixup some kernel doc errors
>   ASoC: SDCA: Minor selected/detected mode control fixups
>   ASoC: SDCA: Add flag for unused IRQs
>   ASoC: SDCA: Add some initial IRQ handlers
> 
> Maciej Strozek (1):
>   ASoC: SDCA: Generic interrupt support
> 
>  MAINTAINERS                      |  11 +
>  include/sound/sdca_function.h    |  11 +
>  include/sound/sdca_interrupts.h  |  77 ++++++
>  sound/soc/sdca/Kconfig           |   7 +
>  sound/soc/sdca/Makefile          |   2 +
>  sound/soc/sdca/sdca_asoc.c       |  19 +-
>  sound/soc/sdca/sdca_functions.c  |   2 +
>  sound/soc/sdca/sdca_interrupts.c | 437 +++++++++++++++++++++++++++++++
>  8 files changed, 560 insertions(+), 6 deletions(-)
>  create mode 100644 include/sound/sdca_interrupts.h
>  create mode 100644 sound/soc/sdca/sdca_interrupts.c
> 

For this series
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
