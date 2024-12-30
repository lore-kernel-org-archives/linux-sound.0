Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB501A00D1;
	Mon, 30 Dec 2024 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551477; cv=none; b=pnuUHtVAGWATeP6UP67gH72zNc1zj9vdWdu/tvn7Ph+HCZUd34/5ik2q4byLhFXZnMYNzXLWO0GuT6Ih5yKBo7CcJSmzhApylwfXHt/OvkJZFMbQgSCvPWaoCtgpvMfZ5n4S5SbxXwR8XKeEdH2ZlsZC9P7NKaFFJaJ5XOd+CQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551477; c=relaxed/simple;
	bh=SLRti5QVJTl0BtMiWYP6CN2Bhck587QWT59CodA/t04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAoIUV7/aQtdm1HEL4KIcH5SHXwJ7HDJYWrtuPnclXg21+BXXR5uHwoSHQsG0quQjl0I3zBE4CP54Px/cKk6CI0RGNo7XpZwiOLrWF6XeY2IWtcwha1kxwpZIe/r4kkwmaJlGHbi1uE1fajedbbogUQv8IKP5rjSEzvvzfIX7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuZOe4px; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuZOe4px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735551476; x=1767087476;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SLRti5QVJTl0BtMiWYP6CN2Bhck587QWT59CodA/t04=;
  b=DuZOe4pxSkPg1UBz0BAIVVx5TRR9cfMqGkz6XK4gtJrro2zPuI3nFmxr
   NslMZkd62os7N67CUEWpbgLumIUaCzlhUO6vNttmJ5XeCTm6Doa2IQNyh
   mUhLurthDIq0YIocXqvtRKfnv9g4ceLCXsy3Iu6VdFxzITzPcV3CgtDkM
   CLwi/rGbyaQfiKutOte/kXbDjmIVt9LIE5ZVLcLgcz4jN8qFO6pSfiVR4
   h4oHzECpv8J1s/n/X1dz3Vtd5GZ54fHxDlfLaoqQeMZ7cTP2vzZIX8uIu
   wrb4tNH7e6r+PL7t49CVQgT+evDsoeCitykTZJIN/5hxjD3WOfOoRvmpx
   Q==;
X-CSE-ConnectionGUID: v4FlosnGSjeaCYhhM0E2IQ==
X-CSE-MsgGUID: K826Cn2tTpitkEMU9Nl50Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35548341"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35548341"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 01:37:55 -0800
X-CSE-ConnectionGUID: 1eWO/bIEQSWCexjUv/In1g==
X-CSE-MsgGUID: pFsQI7R/SZuxbZjuMYNb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101241318"
Received: from mbanciu-mobl.ger.corp.intel.com (HELO [10.245.244.218]) ([10.245.244.218])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 01:37:53 -0800
Message-ID: <16db44f0-38a7-48c6-a7f5-5d200acd9868@linux.intel.com>
Date: Mon, 30 Dec 2024 11:38:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] ASoC: SOF: Intel: Use str_yes_no() helper in
 atom_dump()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241230085717.785718-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20241230085717.785718-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/12/2024 10:57, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  sound/soc/sof/intel/atom.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
> index 30e981c558c6..0d364bcdcfa9 100644
> --- a/sound/soc/sof/intel/atom.c
> +++ b/sound/soc/sof/intel/atom.c
> @@ -78,20 +78,20 @@ void atom_dump(struct snd_sof_dev *sdev, u32 flags)
>  	imrd = snd_sof_dsp_read64(sdev, DSP_BAR, SHIM_IMRD);
>  	dev_err(sdev->dev,
>  		"error: ipc host -> DSP: pending %s complete %s raw 0x%llx\n",
> -		(panic & SHIM_IPCX_BUSY) ? "yes" : "no",
> -		(panic & SHIM_IPCX_DONE) ? "yes" : "no", panic);
> +		str_yes_no(panic & SHIM_IPCX_BUSY),
> +		str_yes_no(panic & SHIM_IPCX_DONE), panic);
>  	dev_err(sdev->dev,
>  		"error: mask host: pending %s complete %s raw 0x%llx\n",
> -		(imrx & SHIM_IMRX_BUSY) ? "yes" : "no",
> -		(imrx & SHIM_IMRX_DONE) ? "yes" : "no", imrx);
> +		str_yes_no(imrx & SHIM_IMRX_BUSY),
> +		str_yes_no(imrx & SHIM_IMRX_DONE), imrx);
>  	dev_err(sdev->dev,
>  		"error: ipc DSP -> host: pending %s complete %s raw 0x%llx\n",
> -		(status & SHIM_IPCD_BUSY) ? "yes" : "no",
> -		(status & SHIM_IPCD_DONE) ? "yes" : "no", status);
> +		str_yes_no(status & SHIM_IPCD_BUSY),
> +		str_yes_no(status & SHIM_IPCD_DONE), status);
>  	dev_err(sdev->dev,
>  		"error: mask DSP: pending %s complete %s raw 0x%llx\n",
> -		(imrd & SHIM_IMRD_BUSY) ? "yes" : "no",
> -		(imrd & SHIM_IMRD_DONE) ? "yes" : "no", imrd);
> +		str_yes_no(imrd & SHIM_IMRD_BUSY),
> +		str_yes_no(imrd & SHIM_IMRD_DONE), imrd);
>  
>  }
>  EXPORT_SYMBOL_NS(atom_dump, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");

-- 
Péter

