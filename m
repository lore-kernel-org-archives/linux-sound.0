Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F02405FD
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237381; cv=none; b=lWQOkjxqPmEtjTzQixgRGBo+DyttI3ON25yWJTVjOajrc2dIhts1yBwjjBy5J4baaaVgab0ii7zovB+rZYz45upDkOCktFStyE/Kl/2lByeLEgVu5leiCbemY7vUHaKnpeTd+qKulricJmoIab1xEIfLB3yXal/WGZAaXA+B3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237381; c=relaxed/simple;
	bh=LzcNWcUsVqQAWT7tVoXeU+SeX3zUboyyrl2eIyOOAdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSBU8wO+EHtcU1T0GxGyfCoJZ5tHbZGcZbsdBKQWF9iFRtN4hc7ms8MFfo+okW9pBD1cnshZaAYgxDLmJ75Sz/sooTnJSgYBouJXo9sR25V9vp6DvCKcQCQWkiwwFA7kLC6tTia2XMe1TYDtM0aYYd5Tf7phSA2Y/e/KGLsxRGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdCMwHWD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdCMwHWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750237380; x=1781773380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LzcNWcUsVqQAWT7tVoXeU+SeX3zUboyyrl2eIyOOAdQ=;
  b=SdCMwHWDbibJ+8KfvDLls+wWthopTG2Im2xwnJIqbd+FWTMcs7j3jArL
   tSz/DSMW77f/9rDl22Q/EdWJrH3peYIsuSL2tnqhRY/utbPuIkrU+jror
   RJijVOvcy7+DwwrDMJCqWe4Y1cHKjafrV5KQuC01vA56ze81hMrYJncWy
   OQ39IKiaL5vppvTXxUVP0ZpLLCunshQZ2AK2cqvNW6e2LlPz9OMHUkTYM
   OzocJp3FTYXuWdcT1kdyyWOaU1j1i2wvdfIywmGbOkXS9oWZti+2EooZL
   mSok2SH7cme64le6TNreE2grexaZit9YeySKvLSI7QItBPdG6BxrpX5rk
   w==;
X-CSE-ConnectionGUID: XN+RSBO9REm5AUAP/10N5A==
X-CSE-MsgGUID: aqmL9REOQoCJ6jBqgnrGpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="70023224"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="70023224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:01:53 -0700
X-CSE-ConnectionGUID: X229sU8ISB61mb47LvRFJQ==
X-CSE-MsgGUID: JCwgtFrlRzyHtQGvL6d5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="150176784"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.150]) ([10.245.246.150])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:01:51 -0700
Message-ID: <2f6d031c-5193-4c7e-9529-c8e2617f4fca@linux.intel.com>
Date: Wed, 18 Jun 2025 12:01:59 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] ASoC: sof: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87o6utzqef.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87o6utzqef.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/06/2025 04:42, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/Kconfig     | 4 +++-
>  sound/soc/sof/Kconfig | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 1b983c7006f18..ce74818bd7152 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -127,7 +127,6 @@ source "sound/soc/renesas/Kconfig"
>  source "sound/soc/rockchip/Kconfig"
>  source "sound/soc/samsung/Kconfig"
>  source "sound/soc/sdca/Kconfig"
> -source "sound/soc/sof/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
>  source "sound/soc/starfive/Kconfig"
> @@ -141,6 +140,9 @@ source "sound/soc/ux500/Kconfig"
>  source "sound/soc/xilinx/Kconfig"
>  source "sound/soc/xtensa/Kconfig"
>  
> +# SOF
> +source "sound/soc/sof/Kconfig"
> +
>  # Supported codecs
>  source "sound/soc/codecs/Kconfig"
>  
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 32ffd345e07fc..a487ab0b51c7e 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig SND_SOC_SOF_TOPLEVEL
> -	bool "Sound Open Firmware Support"
> +	bool "Sound Open Firmware (SOF) platforms"
>  	help
>  	  This adds support for Sound Open Firmware (SOF). SOF is free and
>  	  generic open source audio DSP firmware for multiple devices.

-- 
Péter

