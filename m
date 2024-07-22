Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A458F5E
	for <linux-sound@vger.kernel.org>; Mon, 22 Jul 2024 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721657225; cv=none; b=ZL+YjPvk13exTuN5WquZJRQyyxmXoRtzZwi6D7HeUIBoOhImJsO13lK5vtBeySjQXyvZxPlPBxzZCmq/Y5Co40D42YedphfQxLbXwwExDzCH9FD1vz5hitVXXIWIfSVbWPPSnZMArUTIlqd8D4KcUCAhvht+kuyy2/zr8JWBLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721657225; c=relaxed/simple;
	bh=BZ9zVGteGyw7KM+ePl27FW6gWSzQRxLfIhCKf+ZtPuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsfW/twMSz+wjIe99byGVXZljC1ANOudmRyWmZi1FJMLa7XuXPUXs24KZHY04lpGed4g3IWm4Yeq6HcLhqgKIROLOL5Xule3WVg86pZZT6faJvth71skwevtbKQhF05Di/+aYYezuuhyQlNe8wNbE+PnAKgw4aEy09fZnj/kavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uvu3fZUF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uvu3fZUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721657224; x=1753193224;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BZ9zVGteGyw7KM+ePl27FW6gWSzQRxLfIhCKf+ZtPuM=;
  b=Uvu3fZUFpHFa4SL+Bv17BTjGGPcgDEMzHOicKIWgm/TF1RqykwVqfJtV
   SIFoHNQTOg5yXLFYKmT25F4D6VyDeN2BozT5z9OLWSKUZfP+T4Saa1BmM
   i/SuszgG1mLn9EesJCVBHZwHYK9D6o/4peR+BaHMwvaXoC0BFclxr8eIa
   KdtB/8C5cllGFyhn17AiGjGAF26jL9Qemc1cO3jhh8ES/I1mXeg9gqENA
   q4FCvygZo5AOJsQBaE4Nw2RCmrAFyYc5Yrsa0wUUfSzlUzLyEHsH+8Bhp
   fgx9bpdzkRYRkwH5hC7t5sPWsAoKg/6GyjkXiOjwQRw5fbfk2vigM+hN1
   A==;
X-CSE-ConnectionGUID: HxH1IgQJR82xP2r8aqdPtQ==
X-CSE-MsgGUID: TAbuVk8xRXKIXXySKejCiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19042528"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="19042528"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 07:07:03 -0700
X-CSE-ConnectionGUID: sIn4xKfaSBu87WaP9FFVog==
X-CSE-MsgGUID: AZpDnaaHRrqUDj+rsfTi8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="52630203"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.242]) ([10.245.246.242])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 07:07:01 -0700
Message-ID: <c7572302-7d78-4e72-a470-57f2aa0c8537@linux.intel.com>
Date: Mon, 22 Jul 2024 16:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: Intel: cht_bsw_rt5645: Set card.components
 string
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Dan for the report.


> Commit f87b4402163b ("ASoC: Intel: cht_bsw_rt5645: Set
> card.components string") from Nov 26, 2023 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	sound/soc/intel/boards/cht_bsw_rt5645.c:587 snd_cht_mc_probe()
> 	error: we previously assumed 'adev' could be null (see line 581)
> 
> sound/soc/intel/boards/cht_bsw_rt5645.c
>     570         /* set correct codec name */
>     571         for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
>     572                 if (cht_dailink[i].codecs->name &&
>     573                     !strcmp(cht_dailink[i].codecs->name,
>     574                             "i2c-10EC5645:00")) {
>     575                         dai_index = i;
>     576                         break;
>     577                 }
>     578 
>     579         /* fixup codec name based on HID */
>     580         adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
>     581         if (adev) {
>                     ^^^^
> The old code assumes adev can be NULL
> 
>     582                 snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
>     583                          "i2c-%s", acpi_dev_name(adev));
>     584                 cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
>     585         }
>     586         /* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
> --> 587         codec_dev = acpi_get_first_physical_node(adev);
>                                                          ^^^^
> Unchecked dereference

This looks like a problem in multiple machine drivers sharing similar
code, if we want to consistently check the output we probably need
something like https://github.com/thesofproject/linux/pull/5117 ?


