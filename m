Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBBF2E2DC0
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094048; cv=none; b=G+hrbM5siz6DBZgSYha31hUMiVFzVCD6w39TJbvdBb1ZwjIr81bh9MSBLkfv4JjWj2blm6mL9oDL2X/bD21P7F4UlK6EmQU8/qYtvDIqmpNPa/focs3jFBNxlqFpxEM5cpB2/3bETFTuZBf7+Jlat+zOe7TwAivKZWRUyN3duj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094048; c=relaxed/simple;
	bh=N8DFsiQNYFR09qeJ8qHaUTwo6iLl+SUsLO71eImroHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb45Yg06j8Gip40jfLC3VyQ47b19/NRslc9bXN77Ie+ZPqnMTv20LSaLKpBqEGI5LHaUlUUjr6QsKKYBxdEDelyJQSS21ZWpp23nRKnDYKXnuaFbcMVv527rI13FgwY3zJns09sLV95kB6zUbSy1T2sJ5qXNJiO9E2SFELkzVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifL3AYde; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifL3AYde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755094047; x=1786630047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N8DFsiQNYFR09qeJ8qHaUTwo6iLl+SUsLO71eImroHs=;
  b=ifL3AYde8OaYUrVbDA8xER7xNe2I6kBx4/32uDpGFRFeWkdenxSsK5yI
   k2AXeRdxvX5JbbD392P5ABBn59Tb5zHTsIW2+75nmwBL19rJnO6x3oRam
   +GZBdxjgsZEFpEtLxuGtu43Ey0qrmifjtTRb111HDCal3GLESlyw1RH5O
   tCKyVBh0RXVQWQjeBtJ2ItAK59CUDnrxyi+Uo0a8CXkcRWoapfj8++/BJ
   WuDxSnbqSurkP5Mx/TKPwFyJQSv8zrybU+ytJGEg+0/CWjKc4vcCXRrW/
   7//IYereIafNvoirkmVO+uor7pO6g2iv3pL+xZphF29HY719bgXBZgD4I
   Q==;
X-CSE-ConnectionGUID: W4aNaC0eQ4WuCXyWrLJErg==
X-CSE-MsgGUID: b9ofcTvXRNK5vf7D2gy4/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67991628"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67991628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:07:26 -0700
X-CSE-ConnectionGUID: 13hSyKceR/STvdfyuzIrjg==
X-CSE-MsgGUID: IF8n4BwoTmSD0BSfOxSyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="167275619"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2025 07:07:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9A37A93; Wed, 13 Aug 2025 16:07:22 +0200 (CEST)
Date: Wed, 13 Aug 2025 16:07:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH 23/25] ALSA: hda/core: Use guard() for spinlocks
Message-ID: <aJycGg2zItImFTL0@black.igk.intel.com>
References: <20250811100807.7962-1-tiwai@suse.de>
 <20250811100807.7962-24-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811100807.7962-24-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 11, 2025 at 12:07:57PM +0200, Takashi Iwai wrote:
> Replace the manual spin lock/unlock pairs with guard() for code
> simplification.
> 
> Only code refactoring, and no behavior change.

Wishful thinking :-)
(At least) this broke my builds

/sound/hda/core/stream.c:954:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
  954 |         guard(spinlock_irq)(&bus->reg_lock);
      |         ^
/include/linux/cleanup.h:405:2: note: expanded from macro 'guard'
  405 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^
/include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
  290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
      |         ^
<scratch space>:36:1: note: expanded from here
   36 | class_spinlock_irq_t
      | ^
1 error generated.

`make W=1`, clang-19.

-- 
With Best Regards,
Andy Shevchenko


