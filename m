Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF87A139
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709580840; cv=none; b=ejD+u1stZ6A5clXPtccDOakJkPZI2NjPKs0ZRAOAb0oHswUdULgICLn7+KLITUdWd2pYKMFZmAPnFNXz9VEStp/qHS3IMAGNlmAzONRkCIkXOBsztp+Zjl/Rm79skiPa/cdYuS2232fGjQHSIpGZA2KJZbFjvb9MY93h4vAnDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709580840; c=relaxed/simple;
	bh=7WE0+iAlu1u9SUqlD/cOnSeRnpt1WFGDjFhFu5ds4mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLr/aejYxMk9YLym56vxsPR9wl/tLRLOG0VPjEU3Tf/9hLJKM4bEhgo8fdPOyTVW6XXy6OSsmVLdMaPDu0WjlSzWqxRptuCgFlPQjgDyeP2Z3USH1Ca+xe668VXysEE46/maJ/sbnbfMw77eVbAcGPchJonhrsTa+UgEm3XInnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwQPZQnn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwQPZQnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709580838; x=1741116838;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7WE0+iAlu1u9SUqlD/cOnSeRnpt1WFGDjFhFu5ds4mo=;
  b=UwQPZQnn9tgV58enZL7NGl6nbJRA+jaR5xndupLQPd3z5bQTsrsvcsM2
   bltEO96UGN5BIJFpYZ8PC/Y2Ay/DI9XbRY+Fs8d+FIU2JnwafYAY1XqdD
   Vr763m3/WijRK0wojvNz9jIwLORcweOXtns/G2EumPjSdS8h26pSIxvsD
   1VLtWU5gmvl4m0TXYeq+aFAQOHBWi9Tf0MRcLCj3Ixbox4rmEp+xxXtfO
   TXjC+vCUlMrHroiZzy8BjR8Knz3O3FE1sAZ18DPsANF3ZL2EksKk9j6Rz
   ubHDNbCedS3yziU0eOMpzncpAy1JbugnF1SCdmwLpJdG8f2rITcmV5hHH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15500693"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15500693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13599728"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160]) ([10.212.71.160])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:33:57 -0800
Message-ID: <ff674cfa-19d4-4de4-80ec-9be88f8cb4a4@linux.intel.com>
Date: Mon, 4 Mar 2024 13:28:41 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: Intel: Disable route checks for Skylake boards
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240304190536.1783332-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/24 13:05, Cezary Rojewski wrote:
> Topology files that are propagated to the world and utilized by the
> skylake-driver carry shortcomings in their SectionGraphs.
> 
> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
> failures for Intel boards have been partially addressed by commit
> a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy devices")
> and its follow up but only skl_nau88l25_ssm4567.c is patched. Fix the
> problem for the rest of the boards.
> 
> Link: https://lore.kernel.org/all/20200309192744.18380-1-pierre-louis.bossart@linux.intel.com/
> Fixes: daa480bde6b3 ("ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/boards/bxt_da7219_max98357a.c       | 1 +
>  sound/soc/intel/boards/bxt_rt298.c                  | 1 +
>  sound/soc/intel/boards/glk_rt5682_max98357a.c       | 1 +
>  sound/soc/intel/boards/kbl_da7219_max98357a.c       | 1 +
>  sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++++
>  sound/soc/intel/boards/kbl_rt5660.c                 | 1 +
>  sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 ++
>  sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 1 +
>  sound/soc/intel/boards/skl_hda_dsp_generic.c        | 1 +

This HDAudio machine driver is shared with the SOF-based solutions and I
see no reason to change the route checking...

I don't agree with this change. Why can't you fix the broken topologies
instead, if indeed they 'carry shortcomings'?

Same for glk, this an SOF-based solution.

>  sound/soc/intel/boards/skl_nau88l25_max98357a.c     | 1 +
>  sound/soc/intel/boards/skl_rt286.c                  | 1 +
>  11 files changed, 15 insertions(+)

