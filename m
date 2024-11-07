Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDC11E7677
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730974450; cv=none; b=UOPikTr0PgDHzfqS5i6UjlOgbU47aD4M934yZ9dS+k+AeLzoWn4H0Ip76S7gIVdnYVSGoS96do3AZTiCsBribmB3BuEJNxeyvWcPZEKE4pVg5wSzmYxm0rG95dzp0L6FspiZsbyrxEg34FOPJu/blOiAruFTSUwRUlk/2vQK8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730974450; c=relaxed/simple;
	bh=1YiVRabrdhRemlqNfmCPzu+p9M1lPzZtrnbqda7I3cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNWPlUM3ccRU6NpjbsXacmnnPC4dKJSc82gk2SQjse7A54PZwnzHbTJ146oM4G8Yg4PjbQnY+7U9K2i72iQ4TjqOgvND3JLztYzXYnul+b1GSQ5yUoHwgPf5dHhr4A4HfKSKX9JGMieNp5FHLS9fRvDqb6s3Jo8wtDqmS2wbfAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7hInDR/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7hInDR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730974449; x=1762510449;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1YiVRabrdhRemlqNfmCPzu+p9M1lPzZtrnbqda7I3cQ=;
  b=Q7hInDR/VcrRYgAiWQtASzS/U2hhkwWMCopjEQMXOiXyZKCMkXA46Qh1
   x2gg4h4hG+8f6Gvb82Qqmcn5mZAq7LAJZG0ICs2NDMpqKFnV+K7riRxo6
   MeSqh7hkP4efjMCaw+SyeUKWaeZMomCbwjLmQuHKej6Mf+fsiquTzkV99
   1tdiCq5W3UvrDwJ5q1y+E6mryHCNsf5HqAj88LNEeGf1810CHkDZ9wnOa
   q7//CjoMcFLINLhcuSnA5rvWozYvVw9+0ryYoQOcvchMsG0QJM0j7vCyn
   ag1qtoE5AMm21VFqNBIAVMh08cBONaMw7pZp5gIqMjxtMt/hmO7FuFYTS
   Q==;
X-CSE-ConnectionGUID: 83q+CofYTluPBpQNv6EDiQ==
X-CSE-MsgGUID: 35H1Ebw4QDaKYb9CXlve+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30969321"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30969321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:14:08 -0800
X-CSE-ConnectionGUID: JV+jb2O1TjWkQZE9sorhIw==
X-CSE-MsgGUID: zKcC3NrHSlCjtTXrF17pzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85813152"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.247.80.3]) ([10.247.80.3])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:14:06 -0800
Message-ID: <2e83c621-42b7-42a1-b89e-2a97ee28a1ee@linux.intel.com>
Date: Thu, 7 Nov 2024 18:13:56 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: Intel: Kconfig: Only select SND_SOC_SDCA if
 ACPI is enabled
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.dev
References: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
 <20241107100204.24952-2-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20241107100204.24952-2-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/7/2024 6:02 PM, Peter Ujfalusi wrote:
> The SDCA module have hard dependency to compile on ACPI, it can only be
> selected if ACPI is also enabled.
> The SDCA header provides inline prototypes for other modules to compile in
> case SND_SOC_SDCA is not enabled.
> 
> Fixes: 845cb1ddf1fc ("ASoC: Intel: Kconfig: select SND_SOC_SDCA by SND_SOC_ACPI_INTEL_SDCA_QUIRKS")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>



