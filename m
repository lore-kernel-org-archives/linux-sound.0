Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1552E92BE
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094211; cv=none; b=AF0wOKQoXn4Dg2sdp5JO7lZSsIWieelJi5agUk91TJUkyu1HP0gf+/AWxmGzGik4VxIwusYkE1H6Sj6cDFUPWUvOY+z82lViDRs27BkS/lSOSE79hQhk5nttEAH2H6qbsldqZOJKMFbg/cBmJDogvoX1AJQN9zCTfyFBv9LaTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094211; c=relaxed/simple;
	bh=n53TZBrLmxeuN0FP9R0mmn0f/eXUhy2THZ62A3C/WR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYBklTDVY2VHCmUqoIWxQ0M3zqrGZqCZnMHQNBIIrN9MdsVz+n3PilDgVSzUGDs9m5u9p8LMItRBygzHp3RaMSpesKs6F7Al41bhn4jcRjGr6S/Ndm3I8JHg+9UfrLMXVMeDz9SrhVybWvThwLQ096Y4XkexY9PkHrZTd8rYfyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3H2AiJt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3H2AiJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755094210; x=1786630210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n53TZBrLmxeuN0FP9R0mmn0f/eXUhy2THZ62A3C/WR4=;
  b=L3H2AiJtOyUkm0swzt7FY+6bD/ydR2u/2zEV/dzlsCk8oRgTGD7DYYp6
   jZW643VyepU4PyN1bzTNJoBO+KHE45PPdarjKHgFN5HjFUcgXUUSat+iU
   FFGfXbx3jC5y9/LKhh5Udp1A/3Nw6i6QyIqp8U+nNZXrRsgwXJLsUHiPd
   /UkbPcKmGb0kJl85CLvTaN1zD+SQ78WGIb5dF1WmhWSiNk7zS/jLaepND
   lONppn1yEnfSyICMFPZyxRYHczeLsaerrownwL8P77yk3/G3QtSYjAvf9
   F81aareQxnYMeCyfKb7ahIAwEMFMTc62pr0hh9ibSmP+fb6m+Cj/sBAtL
   A==;
X-CSE-ConnectionGUID: ml+ysw5dQIeBwm9ESvrG9A==
X-CSE-MsgGUID: 3W/GRW3dQRCY9FjffBLWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="82822702"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="82822702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:10:09 -0700
X-CSE-ConnectionGUID: yJfZQ+gyT9KRdYzl6S7/pQ==
X-CSE-MsgGUID: z0A3vIoFSJuaj64uykCihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166853649"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2025 07:10:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 027FD93; Wed, 13 Aug 2025 16:10:06 +0200 (CEST)
Date: Wed, 13 Aug 2025 16:10:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH 23/25] ALSA: hda/core: Use guard() for spinlocks
Message-ID: <aJycvcDOWJ4L96QD@black.igk.intel.com>
References: <20250811100807.7962-1-tiwai@suse.de>
 <20250811100807.7962-24-tiwai@suse.de>
 <aJycGg2zItImFTL0@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJycGg2zItImFTL0@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 13, 2025 at 04:07:22PM +0200, Andy Shevchenko wrote:
> On Mon, Aug 11, 2025 at 12:07:57PM +0200, Takashi Iwai wrote:
> > Replace the manual spin lock/unlock pairs with guard() for code
> > simplification.
> > 
> > Only code refactoring, and no behavior change.
> 
> Wishful thinking :-)
> (At least) this broke my builds
> 
> /sound/hda/core/stream.c:954:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>   954 |         guard(spinlock_irq)(&bus->reg_lock);
>       |         ^
> /include/linux/cleanup.h:405:2: note: expanded from macro 'guard'
>   405 |         CLASS(_name, __UNIQUE_ID(guard))
>       |         ^
> /include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
>   290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>       |         ^
> <scratch space>:36:1: note: expanded from here
>    36 | class_spinlock_irq_t
>       | ^
> 1 error generated.
> 
> `make W=1`, clang-19.

Need to add this is with patches applied from
https://lore.kernel.org/lkml/20250804220955.1453135-1-dan.j.williams@intel.com/
as otherwise it doesn't compile differently (in other places).

-- 
With Best Regards,
Andy Shevchenko


