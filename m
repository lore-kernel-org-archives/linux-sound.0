Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD21FA178
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237380; cv=none; b=EjI4SQpRTYIBExoQTruetJ8mWLzUE73kWmIcruoTZLCM/EjflCygqE9PaS+ytRRr6pn8dzmm6yg9IAuaN2HzbeGaCXuvFMVo2X1zH3L1nelbxa5MapEUCa4XiCPW0VjcUt0Qjzs4EvdZiQGoaaBZh5ogpTQCF8niLrBGH14UBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237380; c=relaxed/simple;
	bh=SoJl2MOiyoVNT/tGCWkJL+YhC8NfTrqawTUWX0wnqNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyGjEB0LMA6CJ0IlLeQsEPmxsejBs285CCcb5u/XytieGoATwku7Rj3t4FN109MEaZQjvzt2dNUXGmIaEqQAuGJv5b0qfgKLnTiI2uR+U3Fg8czAxpeAQKUl2BHogCHKzhK2VkZ3/HDqJ15kG9zK88YkXOmPy0ySVhT9Mi0+8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuT/Jpgq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuT/Jpgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750237378; x=1781773378;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SoJl2MOiyoVNT/tGCWkJL+YhC8NfTrqawTUWX0wnqNU=;
  b=fuT/JpgqrM/0CDyotRLu2dAYRlIdm9ZbRDnmnHYU4ZIdRoIQjlfIps6q
   RlirD/lU1HfmXjA0aaVjKcuBvIA+hOkD/d4x2C6ubFefn46z2smVQbI3S
   BvMnfpyweM0iKHlqiHMRr8y29xDTZKr1oGAmgt/7cb6fBRkYF9PcoR5dY
   Ih/p8cH9N6NsKC+Iam41/m1N2fdDy4HSqF9kTZGD9nfd20DH6MvdIV5yh
   d4xpLohQwZkhw0JudwF6dylGsSu63oL9FWJF9fCc5QjkwCZhmFpp/wC96
   zA0vQ+zb1t7vayv7KrcmdWm1U94jNHhUsLQt2lvFIzSHYLDodUTbHfACB
   g==;
X-CSE-ConnectionGUID: Jb9owfWkTCWnjpaXasUk2g==
X-CSE-MsgGUID: nZYYp0QMSPqswaynyGjoYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="70023205"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="70023205"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:01:48 -0700
X-CSE-ConnectionGUID: u54erCKvRz23q6W67EIzxA==
X-CSE-MsgGUID: V4f7i/KVRdqw6QneObDbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="150176722"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.150]) ([10.245.246.150])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:01:47 -0700
Message-ID: <4fb5e2b8-5cc3-47f2-a6b3-760f07fd62a5@linux.intel.com>
Date: Wed, 18 Jun 2025 12:01:53 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/39] ASoC: intel: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87cyb9zqde.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87cyb9zqde.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/06/2025 04:43, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/intel/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index 2db494b0e3cff..412555e626b81 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +menu "Intel"
> +
>  config SND_SOC_INTEL_SST_TOPLEVEL
>  	bool "Intel ASoC SST drivers"
>  	default y
> @@ -115,3 +117,5 @@ source "sound/soc/intel/avs/boards/Kconfig"
>  
>  # ASoC codec drivers
>  source "sound/soc/intel/boards/Kconfig"
> +
> +endmenu

-- 
Péter

