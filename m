Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9514B96E
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994729; cv=none; b=iAx6F3eWf53R+NEQwKyaQbUYv3kIUpOPz8HSv0lhCIlPHBUe86ANI486QGWJTY7olbRKrJQblxdSiIKY9ErL9mU8gQi2sFJz69SWOH2l8hmDOekV24DdgtKkksg58w/Vz9rBelJf3F8rGuBjIAWySOGsPVidmZXKGhNNOkhIR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994729; c=relaxed/simple;
	bh=A6Qv1Hj8FQn9BvEtYAFHtQOs67V8yWjLEh19jeZmBZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueQtHoxJb2+P+KKwCrGkVk7OYyu5ajGMtFw+1zHW0F3vXKx+QaJ/8o6nLircKKV8ntIB6rAvCTgw/S+naAiquTHRJ22P8cGvRs8HDQaHJaCA/H957hJnt+fKHaFadBbDiDuiUSNNKiopPNSWJxp9E7Xam0NFCsNe6+TEOUDoT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHRZdt2r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHRZdt2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763994728; x=1795530728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A6Qv1Hj8FQn9BvEtYAFHtQOs67V8yWjLEh19jeZmBZ4=;
  b=QHRZdt2r3q+HuO7zqypGkOuDxwEFdreRFvJ3pXTDWqc/45G7E0rRpuSc
   jCLPbuICMGqI+u+eCxLgjySrLH9NLKeZx1F+jKdR8Ambuddj1r+6kUZgb
   cxjenG3Yle7eiJ2TEpbimf2o+o8yqX7ncOcPxbqM391DMmnSjt8CDYkWc
   syG9o+j0fsmSFTf2On3l2S3OeegdYEIJhFP3qr9jhS+/+ruzlk1/J3WE3
   DwZL7PMLe6C6FV7y3tLodW8WE7wGJr2Rby+SCXG6jbZQgwcUWgcKrLddQ
   TBa6oc2jFwH3ss2o/3O4TCta+SXLKSEAGlwPbUD7TtHgoLxfKaRE02rBl
   w==;
X-CSE-ConnectionGUID: 8L5WyxiNRKOUQu7gYKgcSw==
X-CSE-MsgGUID: O3hZlXlHQwydacJcKU2bLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66069599"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="66069599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:32:04 -0800
X-CSE-ConnectionGUID: SmuKOpAaSIOYOgvJCX1oXQ==
X-CSE-MsgGUID: qOrObDIMRSyb9NES4KK4Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196801277"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:32:02 -0800
Date: Mon, 24 Nov 2025 16:31:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: Intel: catpt: Fix offset checks
Message-ID: <aSRsX9qlUVC7HHvA@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121114331.3841335-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 12:43:26PM +0100, Cezary Rojewski wrote:
> Verify if the entire block is found within DRAM, not just the start of
> it.

I would rewrap this to have less distant lengths.

E.g.,

Verify if the entire block is found within DRAM, not just
the start of it.

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

...

> static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)

>  		off = catpt_to_host_offset(info->offset);
> -		if (off < cdev->dram.start || off > cdev->dram.end)
> +		if (off < cdev->dram.start || off + info->size >= cdev->dram.end)
>  			continue;

Hmm... I would rather do something like

		struct resource r;
		...
		resource_set_range(catpt_to_host_offset(info->offset), info->size);
		if (!resource_contains())
			continue;

>  		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",

OTOH it seems more invasive change for kinda a fix.

...

> static int catpt_restore_fwimage(struct catpt_dev *cdev,

>  		off = catpt_to_host_offset(info->offset);
> -		if (off < cdev->dram.start || off > cdev->dram.end)
> -			continue;
> -
>  		r2.start = off;
>  		r2.end = r2.start + info->size - 1;
>  
> +		if (r2.start < cdev->dram.start || r2.end > cdev->dram.end)
> +			continue;

See above, but here we already good for use the respective resource_*() API.

>  		if (!resource_intersection(&r2, &r1, &common))
>  			continue;

-- 
With Best Regards,
Andy Shevchenko


