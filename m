Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E0830F95C
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763360043; cv=none; b=fcRf9NgH26+KKcg49gOz99KL7uoskR1/mxn6fcezZR3PowgnmwSPOn3g5dGBoLVaWe/8JFuI9xacZSCpkCtmu10pZL+BGQWXqgAyTLFxEW89Qcew6Uti2c71jHJsiYGPkDYfTNo+PPFtfOYbeRHyBl97b3VnSdZbcMd5RO2Pnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763360043; c=relaxed/simple;
	bh=O0r5vqUKKMMi0iyGUaVoe6uoPj/jQOjbpSkO57gym2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ez9xY0aKBVbqngXq/kO8Zu9ZRX9FZ8ZjdbI8MTK3CqQyLnY6uOuIr66JKMbLcOhg2rN+wopCU2TntPxXbLMEPAi05DzEsb2Apa/oF0+RMImJ7hGDuWXZ9eG4eRCVVKuCj0BUaYVPg3nrBCWLNxzgPsphGCsQKQdMrJeY6pGR5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaW9QqJ+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaW9QqJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763360041; x=1794896041;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O0r5vqUKKMMi0iyGUaVoe6uoPj/jQOjbpSkO57gym2w=;
  b=kaW9QqJ+d/0+Z4cMayk2LOWT4SKkFdIbrYIyd0awP1ve/NgEMQYsoPW9
   wuw8maR2RClcyo/uJltKgVzfyB0vJPIj4hwCGPEzEpIK3mZF8JhKFd3jv
   Acjwn8L9KImpxwQQbM05+N2qIIz1AIW2IoeTxvQpxUJADtSCdbq2r8Y/U
   3yRrDfrPbUIJtmKERfCX+gN6GsPACajlV3HD7joiG8yM9LmsPet1VPscd
   9mOfHLqvITh9ZRPpNy2t7k7gwCKLxzSVenO3N9bMIRjuhhuiYDytygvj6
   0d3WY7l1ML5XFKr7eYX/BDj8o0M6ZwdZl8qonRJG3O3UsRDPX5mU3AczF
   A==;
X-CSE-ConnectionGUID: DY1uG2zjQD+oC2c7SHTh3A==
X-CSE-MsgGUID: R/Jh80kJTOaxJspgeB4zNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65385712"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65385712"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:14:00 -0800
X-CSE-ConnectionGUID: 7nLN5XZ7Rfixtxuu3EtWjg==
X-CSE-MsgGUID: 7V+jcbuGQX+dH9zEUP8Y2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190144849"
Received: from unknown (HELO [10.227.10.75]) ([10.227.10.75])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:13:58 -0800
Message-ID: <a77a5e35-9766-4375-8fba-bf2c9ab24023@linux.intel.com>
Date: Mon, 17 Nov 2025 14:13:49 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] Add SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: vkoul@kernel.org, pierre-louis.bossart@linux.dev,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/2025 7:44 PM, Charles Keepax wrote:
> This series adds an initial SDCA class driver, this consists of a
> primary driver attached to the SoundWire device, and auxiliary drivers
> representing each of the functions of the SDCA device. These drivers all
> use the APIs added over the past series's to provide the class
> functionality, as such these final drivers themselves are quite thin.
> 
> Also a few fix ups at the start of the series that have gathered up
> whilst the last SDCA series was in review.
> 
> Thanks,
> Charles
> 
> Changes since v2:
>  - Updated the locking in sdca_fdl_process
>  - Correct some spelling in comments
>  - Renamed suspend/resume functions to be a little short
> 
> Changes since v1:
>  - Add a bunch of bug fix patches
>  - Change some prints to dbgs
>  - Add some additional comments
>  - Flip order on regcache operations in resume
> 
> 
> Charles Keepax (12):
>   ASoC: SDCA: Remove duplicated module macros
>   ASoC: SDCA: Fix missing dash in HIDE DisCo property
>   ASoC: SDCA: Add missing forward declaration in header
>   ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
>   ASoC: SDCA: Add comment for function reset polling
>   ASoC: SDCA: Move most of the messages from info to debug
>   ASoC: SDCA: Use helper macros for control identification
>   ASoC: SDCA: Factor out helper to process Control defaults
>   ASoC: SDCA: Populate regmap cache for readable Controls
>   ASoC: SDCA: Add helper to write initialization writes
>   ASoC: SDCA: Add basic SDCA class driver
>   ASoC: SDCA: Add basic SDCA function driver
> 
> Pierre-Louis Bossart (1):
>   ASoC: SDCA: add function devices
> 
>  include/linux/soundwire/sdw_registers.h |   2 +
>  include/sound/sdca.h                    |  14 +
>  include/sound/sdca_regmap.h             |   2 +
>  sound/soc/sdca/Kconfig                  |  18 +
>  sound/soc/sdca/Makefile                 |  10 +-
>  sound/soc/sdca/sdca_class.c             | 304 ++++++++++++++++
>  sound/soc/sdca/sdca_class.h             |  37 ++
>  sound/soc/sdca/sdca_class_function.c    | 460 ++++++++++++++++++++++++
>  sound/soc/sdca/sdca_fdl.c               |   8 +-
>  sound/soc/sdca/sdca_function_device.c   | 117 ++++++
>  sound/soc/sdca/sdca_function_device.h   |  15 +
>  sound/soc/sdca/sdca_functions.c         |  52 ++-
>  sound/soc/sdca/sdca_hid.c               |   3 -
>  sound/soc/sdca/sdca_interrupts.c        |  39 +-
>  sound/soc/sdca/sdca_regmap.c            |  89 +++--
>  15 files changed, 1089 insertions(+), 81 deletions(-)
>  create mode 100644 sound/soc/sdca/sdca_class.c
>  create mode 100644 sound/soc/sdca/sdca_class.h
>  create mode 100644 sound/soc/sdca/sdca_class_function.c
>  create mode 100644 sound/soc/sdca/sdca_function_device.c
>  create mode 100644 sound/soc/sdca/sdca_function_device.h
> 

For this series: Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>

