Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B7354ACC
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560745; cv=none; b=rOgGlJDtrFBaSS4Yaz6hI49oXxVtv2mEEURv05V9RMoZaLduJbNb3CRND1hKBTrWEV/jgRNROVw6ZnV8V1kUGTasiII62X2Yj+HBaKqudj9KryFVkBZChG9DtyUR4yC0tw76YTJ466+F3Y7xi/2jLq+vTeG3rD8W5es50qn71hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560745; c=relaxed/simple;
	bh=i4W7oGzzLB43RuWo1TUuZagSfA40j4h3wt5JvFX4riI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pb+TYQ2r66bx5hko7Em+RXBcD6UNMLCjyTV8faT2o3iRfKNpl+3/5RYB+5ssGKNvrcJqFw4EGF1dV7iWkED+OUoPuUCX9ryvMvyLyBKX6BbSvD6UqotNRhmGYqimJMWkpEqiwWmNVZhxmPOijDFlOdgkomf/M5L2eCyqJDOkOEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ul6R/SvH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ul6R/SvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763560743; x=1795096743;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i4W7oGzzLB43RuWo1TUuZagSfA40j4h3wt5JvFX4riI=;
  b=Ul6R/SvHxmNQck87+ytkxB37i2WUvx/2Cd6o/J5Qi19L83gnQFe34/cl
   x06UjUUAb4844D/2s1u+n7i7HAxFYTv7YGhydZE51Tx7Mskqfjo7CU0+K
   QT/W2eDqgxJf3PPgqcdQ6BD4cZAIbNYn4ba9qOVVNjdIqxvPOn272fdG0
   FEyfBsOBBOX7YsoAItiYDzpG35LAoyNpm/yLwnBspJF+NUiyKACQMrIen
   JnNO2IRY8gS2fuBsCIG9PsfCG1t1dPix++vcikD/nyLfXvOWulv1qP0PM
   BrpV6S2KeKwk3QfZY9tTtv7AJKFQNX6NNIqyHbd8gFk1fASuyz6LPT39B
   w==;
X-CSE-ConnectionGUID: Ap3cgZssQEu80Y0VcCF7RQ==
X-CSE-MsgGUID: Qx9Kwm1IQ6CavMTgcAx1rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76281053"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76281053"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:59:02 -0800
X-CSE-ConnectionGUID: a2+VRon7Smibtmn5NuwIUg==
X-CSE-MsgGUID: fEHZO1doTk2G8Yi8rc6/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196198814"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO [10.245.246.173]) ([10.245.246.173])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:59:00 -0800
Message-ID: <20bd03b6-6096-46fe-9e4a-c811e71dd373@linux.intel.com>
Date: Wed, 19 Nov 2025 15:59:13 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] Add SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/11/2025 13:44, Charles Keepax wrote:
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

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

-- 
Péter

