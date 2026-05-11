Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD8233986D;
	Mon, 11 May 2026 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496884; cv=none; b=NNaqIvvkxPyrDqoiDAjhOXilfJRGAq4SRlS7VHHGMzfRo/CzSaPokzUp3GU5glP2j2WlddkTFzcdQKkrLCG2NFPU3eiNfDvDEMQn+F+FmXxuP9FKFmvY2biauk2NDWqcv8+PsRcC9apDGzHnfJZSlYbL66XJFyglMt3mNBaa+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496884; c=relaxed/simple;
	bh=GHHZLZWl6S09KnATPVzILpM2I/3DGISrKITE01RuORg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COp21jFyLLzPLGN1NfiwqEYMeCYHhNF4n8RZaww3bXNSeKNlgJxp/gYGkeAcHmiF0aOdeFJpkX8cXw1PCZFNll1j1OHEN8K5GmSPU7jDKuezcsWTwCfDEm/dg5qNoA4lQan5ZE1N8vWEH0yOJyFMaLvuP1YMcmRNi6tAlaz+DI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMLp+li1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMLp+li1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778496882; x=1810032882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GHHZLZWl6S09KnATPVzILpM2I/3DGISrKITE01RuORg=;
  b=AMLp+li1BV7fFD5MvG/ZiUSWrbU3U13bNIShMEAMfnQfqjvw4NbrGSyY
   TdrmDAzWMF3BEZe+eu/oCvfvhsiDjE6f2bc8IbuyxNYcNO6iyICkwdo3/
   E5Ot2UZa5UnKdX6wjIS6HM63B4cCpG6nCvFh9jiZ1Ylhxy58hEm4dHsy2
   29j9kbK72b5tbRSD25sHXKBRdGrQW6wKR85DjLfenW9Fbr+XCVuHDQBxg
   7ElHWIao6E6sL+UB7B9gqQHsLvjhdM2E3flvC+VRrSfzo8/NTMHXMzAdD
   Lxmf9R+UlPQtK42O6JWafafziZMmfXc3swYfX/Q5pTap7pr40jf8GDBNq
   Q==;
X-CSE-ConnectionGUID: zuAQiLrLT9+FdZ/YI8L2vA==
X-CSE-MsgGUID: qb3EXC2dSXWhGmambIBztA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78408480"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="78408480"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:54:41 -0700
X-CSE-ConnectionGUID: ZiGP2c7sTT2sU27iBi/yeA==
X-CSE-MsgGUID: PfHoAi3gTOy/ssoL9NMEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234364319"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:54:39 -0700
Date: Mon, 11 May 2026 13:54:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: Re: [PATCH v2 2/2] ALSA: firewire: Make use of ieee1394's
 .driver_data_ptr
Message-ID: <agG1bE_1RfrUR7zm@ashevche-desk.local>
References: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
 <6b7b7b3b8b54465ad5e7463412a202350fccbb62.1778494204.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b7b7b3b8b54465ad5e7463412a202350fccbb62.1778494204.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, May 11, 2026 at 12:45:03PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Recently struct ieee1394_device_id gained a new member to store a pointer
> to driver data. Make use of that to get rid of a bunch of casts.

...

> -	if (!entry->driver_data)
> +	if (!entry->driver_data_ptr)
>  		detect_formats = snd_dice_stream_detect_current_formats;
>  	else
> -		detect_formats = (snd_dice_detect_formats_t)entry->driver_data;
> +		detect_formats = entry->driver_data_ptr;

While at it, it can be swapped for better readability

	if (entry->driver_data_ptr)
		detect_formats = entry->driver_data_ptr;
	else
		detect_formats = snd_dice_stream_detect_current_formats;

-- 
With Best Regards,
Andy Shevchenko


