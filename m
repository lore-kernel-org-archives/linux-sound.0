Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA313A86A
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236335; cv=none; b=JyNT5sj2uQVPLsIraNtO+s0hL8sRLpqlJiFMF1IjT6t6nQifN7gdWeHNm8Q0ADBbsljTCGNwTP4LgJQ08Lf3/F4+SS6wQL2h49hXZ6igyJGakDdmb7Rljh1WfGntinNPnpAMkNN0gbHMXg5fRT3ltBLczZKCGMl1nGYV5Xdyj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236335; c=relaxed/simple;
	bh=ZmPymmWaPZBLqiPmZArq/wN0XJQKImTcYKdSX45SEpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/LdUHsqrrQhjveLFOarN3meotqw+Eq0VO/jVvfyZBsJerHQgD6jOxVsZ97Ooo9vW0numyNnl7Ybdf82PF2lboXp1m1EGtB7DzpzJ1nIt9szw2nEgpdY74FVFCqMjjQGYxhMqP/hRXAHVQh1iI2cv266lcHdvBqhtL/cDd0wIb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrzF2F/a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrzF2F/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719236334; x=1750772334;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZmPymmWaPZBLqiPmZArq/wN0XJQKImTcYKdSX45SEpo=;
  b=YrzF2F/aFSmKnq2goIC+qD6Z4T0LMCPy8DCaVnuQH/2jaoYQ1+QKhRIx
   Ti/Q0wXVu7+XVUaGIZUlnJ5D3PLOep6xFJd55l6dZFywYh4cyoj5wXPRg
   4JeMuhZdN7OchGO9XwUQMsjTJc1d+IIuLZerRGM5xC38/5odioeLXqKz/
   dEtsOxdoa8aCYaW3HNcf0LVtukWX0CUJEEfhuQL8OcLiJfbnmewPBL4CU
   DhOl/eBseDpElAeW7cjF6mZRQk1OdfG6iTZGq10Ser13p/A1QptrEH+TB
   89xcyrQuh3w59y8eUQ2HsSkwBc5MzGBjUfz4sZ7xdXgk5SxxdprVHwy2g
   w==;
X-CSE-ConnectionGUID: v7vhRuYGQOOMtCEx6F4nDg==
X-CSE-MsgGUID: fj0V5LFUQj2ST6Ro3mZuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="27611009"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="27611009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 06:38:53 -0700
X-CSE-ConnectionGUID: voJgqMPNTHywfPC9Ntz8Ig==
X-CSE-MsgGUID: 0lWvD4ioRhWSpXDW1yQPgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="44003664"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 06:38:51 -0700
Message-ID: <28a5fde3-a02a-45c1-b3d7-25ae3fcfcfcc@linux.intel.com>
Date: Mon, 24 Jun 2024 15:38:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ALSA: pcm: reinvent the stream synchronization ID
 API
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <takaswie@kernel.org>
References: <20240624131127.498605-1-perex@perex.cz>
 <20240624131127.498605-2-perex@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240624131127.498605-2-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/2024 3:07 PM, Jaroslav Kysela wrote:
> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
> internal command"), there was a possibility to pass information
> about the synchronized streams to the user space. The mentioned
> commit removed blindly the appropriate code with an irrelevant comment.
> 
> The revert may be appropriate, but since this API was lost for several
> years without any complains, it's time to improve it. The hardware
> parameters may change the used stream clock source (e.g. USB hardware)
> so move this synchronization ID to hw_params as read-only field.
> 
> It seems that pipewire can benefit from this API (disable adaptive
> resampling for perfectly synchronized PCM streams) now.
> 
> Note that the contents of ID is not supposed to be used for direct
> comparison with a specific byte sequence. The "empty" case is when
> all bytes are zero (driver does not offer this information)
> and all other cases must be only used for equal comparison among
> PCM streams (including different sound cards) if they are using
> identical hardware clock.
> 
> Cc: Takashi Sakamoto <takaswie@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---

(...)

>   
> @@ -420,7 +420,8 @@ struct snd_pcm_hw_params {
>   	unsigned int rate_num;		/* R: rate numerator */
>   	unsigned int rate_den;		/* R: rate denominator */
>   	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
> -	unsigned char reserved[64];	/* reserved for future */
> +	unsigned char sync[16];		/* R: synchronization ID (perfect sync - one clock source) */

If it is introduced as new API, can't this be done better? Maybe like:
struct sync {
	char cardnum[4];
	char id[12];
};
or maybe just:
struct sync {
	u32 cardnum;
	char id[12];
};
or something like that? It is bit hard to follow in next patch all this 
params->sync + 4 and memset/strncpy. And having named fields would help.

Thanks,
Amadeusz
