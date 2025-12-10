Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05C15ECCC
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765373962; cv=none; b=baZmeuihfMQofAqqB8BlDD7Q09sHsnLMx2syPr91VBYaU6h0r2ga2ZQvKoXn+k60sboMX+uN9M/gWgLghEfLbSBUaIjywtaKob6Yz7Oh4iLzun+OUzSTqXtjSGwzKkrbQIjROuKFpteQGaaIoCL+wEqbErUSK0hgjU3E9abvZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765373962; c=relaxed/simple;
	bh=xI8DTo119y2RXhYk5giNngcIprKazHeNum3kpVtjdJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRi9Nv1ehGCbow02b7K18WvbqIZc2vXijnZTpHPqelauT+wztHuPPdJjnPI2w5h2KI/SafUffTSkDHDpAGClSDD4aQRtgLfNKpwGtb0u764glb81RSWhH0W7tJcX55it86b9FIBANh3JZHd3Az26jUYiHMqqGWlEnrcaJLUER8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IC4kyDuN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IC4kyDuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765373960; x=1796909960;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xI8DTo119y2RXhYk5giNngcIprKazHeNum3kpVtjdJE=;
  b=IC4kyDuN/538ePJ0KNKvIjYl/D5RwgytSj33eo8XbuOsFRSUuKjaHSiy
   PXgZQ7ycjYELOh8U/bT7z5LgmXC96vQHwlVTZxKRy8S/2idRnvlc3KIAz
   AxC3zcIsESfrk3/FqVFtXg2pu4IONUCcMceSTHxlnq/KTCNxQgDi3KeeU
   OTcMWTAm3hp6s/Jm4UEm45yLCNh+/FnzsJZuvdFqbDOV707BQe7W6vlbf
   S1Jtwe12UyXrbuaT32cijKrFLe3KOu6TSEsqoPTSYIJiY35ESiwk60jaL
   t+jeblgqaZHo1qSE18bbr5cUfg+lllnhoJV22lHuizySejOyheCT/Myqx
   Q==;
X-CSE-ConnectionGUID: PkeKn+OaQayNM05tidTH6Q==
X-CSE-MsgGUID: AoR1hYDqQpevVKIi3N28nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54888711"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="54888711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:39:19 -0800
X-CSE-ConnectionGUID: je2GOBwvTdO83senBq6sRg==
X-CSE-MsgGUID: sOtAju3AQRO/W4J9Des9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201632822"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.191]) ([10.245.246.191])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:39:18 -0800
Message-ID: <92f98115-9b3c-4e63-b6fc-f5ce119f0545@linux.intel.com>
Date: Wed, 10 Dec 2025 15:39:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Prefer legacy driver as
 fallback
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org, Askar Safin <safinaskar@gmail.com>
References: <20251210131553.184404-1-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251210131553.184404-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/12/2025 15:15, Takashi Iwai wrote:
> When config table entries don't match with the device to be probed,
> currently we fall back to SND_INTEL_DSP_DRIVER_ANY, which means to
> allow any drivers to bind with it.
> 
> This was set so with the assumption (or hope) that all controller
> drivers should cover the devices generally, but in practice, this
> caused a problem as reported recently.  Namely, when a specific
> kconfig for SOF isn't set for the modern Intel chips like Alderlake,
> a wrong driver (AVS) got probed and failed.  This is because we have
> entries like:
> 
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
>  /* Alder Lake / Raptor Lake */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
>  	},
>  ....
>  #endif
> 
> so this entry is effective only when CONFIG_SND_SOC_SOF_ALDERLAKE is
> set.  If not set, there is no matching entry, hence it returns
> SND_INTEL_DSP_DRIVER_ANY as fallback.  OTOH, if the kconfig is set, it
> explicitly falls back to SND_INTEL_DSP_DRIVER_LEGACY when no DMIC or
> SoundWire is found -- that was the working scenario.  That being said,
> the current setup may be broken for modern Intel chips that are
> supposed to work with either SOF or legacy driver when the
> corresponding kconfig were missing.
> 
> For addressing the problem above, this patch changes the fallback
> driver to the legacy driver, i.e. return SND_INTEL_DSP_DRIVER_LEGACY
> type as much as possible.  When CONFIG_SND_HDA_INTEL is also disabled,
> the fallback is set to SND_INTEL_DSP_DRIVER_ANY type, just to be sure.

Makes sense.

> Reported-by: Askar Safin <safinaskar@gmail.com>
> Closes: https://lore.kernel.org/all/20251014034156.4480-1-safinaskar@gmail.com/
> Tested-by: Askar Safin <safinaskar@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> ---
>  sound/hda/core/intel-dsp-config.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
> index c401c0658421..0c25e87408de 100644
> --- a/sound/hda/core/intel-dsp-config.c
> +++ b/sound/hda/core/intel-dsp-config.c
> @@ -718,7 +718,8 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>  	/* find the configuration for the specific device */
>  	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
>  	if (!cfg)
> -		return SND_INTEL_DSP_DRIVER_ANY;
> +		return IS_ENABLED(CONFIG_SND_HDA_INTEL) ?
> +			SND_INTEL_DSP_DRIVER_LEGACY : SND_INTEL_DSP_DRIVER_ANY;
>  
>  	if (cfg->flags & FLAG_SOF) {
>  		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&

-- 
Péter

