Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA5E1BD9FA
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060586; cv=none; b=Kd5PPaxtgFPNHJShC+Tuer8dQ/yW2qFZ4carKlzZI2H6wPwiOpHBRhdeetG6ioX1egKFAg3UziEM4dPTZ6xc7WKnnCgZDi8/DZQA4eHDNy+lYsieoJ4qAoWnfMSXt87WhUkF2mb7vis5iYHhLeVtdlFgKItXjLzffg+acDfArXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060586; c=relaxed/simple;
	bh=g7v12vt9e8MKexgw3ZfrO5ejhn5gDJxR6HnVjPT0FeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGiRb3dLONPa4gAPkamslakUebnw0sOsVJ2Rd6qd01KhYbAUve8hdG/eimZmToaHxOcTXHY/nu4RZ9jPj3okBnxNvYhGJy+Iju3m9mASGLQLbWgJ7cU1VSuI7fI5+AVS0pUWhNiQ6hLEfIzCjLZVPmC+Qa4phTH7FTlSZ7HIJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7UM6Tpu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7UM6Tpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060585; x=1771596585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g7v12vt9e8MKexgw3ZfrO5ejhn5gDJxR6HnVjPT0FeQ=;
  b=A7UM6Tpuwjadne8TjAQJaiCe+gF3BVDgHVIk6uuo1hAWQGRyoYZ5pZwB
   AoyVYayqc47WwljtM6yIrxc5xeaAx+7SFxeTO6pKGjXA4KV9OzJ0A2ZK5
   ucQ+yxwGdAiy/YOIVwXBpjKv15Z51twFbWq9grgXSBDDpmPYDYZqSIzHM
   KkUHv/v1Jvgh8VV4SZO87CYlFVc8e5r3n4jo3o4bR0bZTQEUpbHCnFjgs
   WwktSqdeh0HIQKmVr73iGXErxwzevrtKI8/H6Hv0z9i28f2i54lqmQ7BE
   +nqqPa0by5+XKXc8Szk61592YWW7tVXb5/6HZoPKIoNDY/WGOn+D2yuJ4
   Q==;
X-CSE-ConnectionGUID: rJ0oEZ4IQheJv/oVrGYC+w==
X-CSE-MsgGUID: /X7x5Rd6T8q+bqV2juhmZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66200423"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="66200423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:09:45 -0800
X-CSE-ConnectionGUID: 2iok5xPVTee/GC0vqYO4PQ==
X-CSE-MsgGUID: P1f7ZCI7RsWFtd/B1cxJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115721347"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:09:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7FD-0000000DM3x-2JkJ;
	Thu, 20 Feb 2025 16:09:39 +0200
Date: Thu, 20 Feb 2025 16:09:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	oder_chiou@realtek.com, flove@realtek.com
Subject: Re: [PATCH 00/24] ASoC: codecs: Update device_id tables for Realtek
 drivers
Message-ID: <Z7c3o6ajInD0ay5Q@smile.fi.intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 12:26:19PM +0100, Cezary Rojewski wrote:
> The series aims to streamline the formatting for ACPI IDs so that a
> single pattern can be used to identify the device.
> 
> Work implicitly suggested by Andy Shevchenko - reading and learning from
> number of his reviews on the Linux mailing lists.
> 
> Several formats do exists, however, after technical discussion PCI-based
> format has been selected as the recommended one. For Realtek devices, it
> is going to be 10ECxxxx where 10EC unambiguously identifies Realtek
> company whereas the following 4 hexes specify the PART_ID i.e.: the
> device.

> While at it, there shall be no comma after the terminator entry and
> initializing fields with 0 for statically defined structs is redundant.

I should add that the latter one (removing '0':s) is basically Uwe's idea
in a long-term conversion driver_data to become a const void * instead of
kernel_ulong_t (in some cases).

-- 
With Best Regards,
Andy Shevchenko


