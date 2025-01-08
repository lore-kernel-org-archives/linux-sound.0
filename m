Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F21A76BC
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325886; cv=none; b=drwHUvGkUpvTNvIiSUCjXocKHdC/PMSPOJORCMlN+UnSUAbcJ7DsOwAfvtGMHAYU3rxeJGuajhGrtrBH1B52wsmX3nBoEGXYdwn4A4ibq0ArXg59bu9hNU7LHj2YRKxrPAMAo+OfCnkBVriYQ0pwBkTqcvgnWCoZ5wXS2qYFpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325886; c=relaxed/simple;
	bh=sD/bZn0QUtrZTSwaNDBHD5ixzhyJvRYo1m8i+M9VrYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8wUO7OLKY7NQMwBT/YPvb5Ii8iSPF6xznBgFgLptxP4wfnx6Q9CiGqvM7mEo/2rfD9l2Cd/IzLE64kqgXv7NE3qRgYbr+aTI5XGcdiRV6nkTW4WEgZ6ByAbNQDiopSaWz9tmEZB9ysH7Gp7jvtVQIP2mV1AWSGbIpoRhuxLx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UL4uuN0z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UL4uuN0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736325884; x=1767861884;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sD/bZn0QUtrZTSwaNDBHD5ixzhyJvRYo1m8i+M9VrYU=;
  b=UL4uuN0zMSBX1v5WJyOSYMbnQAhly6PcbMmpjvKA28vXxZyuxUoPY+dU
   TY7rH4M2TpoQXOXec8a1STHbacRZ/fMPof0Zng1ko6vRz/urbeQ96V719
   dTweX/YHV1NCcxVeZPLY4Gl9mw63mBvb6ynW9r8eKvCO2tYeTH/92oaON
   gTkGI+3IWkxq6CgGIA+T8BvGcvz7cTz4kbJZeotZZuhMqF7YjdLo/ln3t
   6zwzmYdzQ8VqBDcfY3bbwSNyqIsbA9gQCH3cVQb/k+wmgsETC2d2U/9a3
   8vfTebfHRz/KxhZiGX9tJ32PVyTn1zkjY4Omc8NABcXMgqxzoqYQNZJPw
   g==;
X-CSE-ConnectionGUID: Y/HTrAyVTxCJeHuUdRc0sQ==
X-CSE-MsgGUID: Gz1SVoMjSqyLO69A+6tfrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36702397"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36702397"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:44:41 -0800
X-CSE-ConnectionGUID: ZB+59M/TR3+VStgUjZ3+iQ==
X-CSE-MsgGUID: sA/FT5aKSmuzOEzHvMJuow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107648597"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:44:39 -0800
Message-ID: <c0c0d0a7-4272-4e2f-b128-b72b9f9f8f8e@linux.intel.com>
Date: Wed, 8 Jan 2025 09:44:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-core: add
 snd_soc_dapm_add_routes_with_card()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
References: <87ldvmknrz.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ldvmknrz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/2025 4:06 AM, Kuninori Morimoto wrote:
> Some device want to ignore snd_soc_dapm_add_routes() error, thus
> card->disable_route_checks flags had been added for such purpose. Because
> of this, ASoC has duplicate code for it. Let's adds new
> snd_soc_dapm_add_routes_with_card(), and share the error message handling.
> 
> We don't need to indicate error message on this function, because it will
> be indicated from snd_soc_dapm_add_route().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

card->disable_route_checks is a leftover from skylake driver which had 
partial routes in some topologies, as skylake driver was removed, 
perhaps we can remove the field altogether?

Quick grep shows that there is only one board left which sets it:
sound/soc/intel/boards/skl_hda_dsp_generic.c: 
card->disable_route_checks = true;
and it only does it after checking that parent driver isn't SOF, and as 
skylake driver was removed it is dead code (it was shared between SOF 
and skylake drivers).

As such I would recommend removing whole thing altogether ;)
