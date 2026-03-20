Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0983D1701
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035115; cv=none; b=QHTiqEKUz0cqR+bp8j7oNo/x6bWSnUg1Np6leurmbzzqduu0pcS+8s/fKynT9wAQXVBciB6agTeWqGMCQbRboYAC9MWb3dcntdapDhJk2bZc1IR45ckILxK3eqM4LPKu4+M7oHdTko5BzxiWNJEFTkgR4tq/eirpQEhRNq+JosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035115; c=relaxed/simple;
	bh=qSZ/8n64RKKks4Zl4kVtjSJyS7ZxSUatnzIqTvYrGgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLUOpEmF/nLZEHK81O+vIUC2Jlbf2pt6OdYIJaPcufBT9mSWw2cpiJuWKuTPV5uP/ibqn8NpMOWjWQ7p6JWtxSWte0xGrtNoRGu/YA+QLYyU/JgUx5GEC0855xUKsk67ifqTs3TtBET6fgu7iV0SaowriOLDC3CmnwpKmB7eZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jB+hPaTs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB+hPaTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774035115; x=1805571115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qSZ/8n64RKKks4Zl4kVtjSJyS7ZxSUatnzIqTvYrGgg=;
  b=jB+hPaTsC61zBjcySsnj9cs+Od33Yiop01YLdrX/GCgeZN2oAHtiGp71
   7lDnsIL2QeWyGyDeTPP95zRJzXmr+QoLsh5J4n9Ps0jRxbUtcLYZMpMI2
   DJLnFNMAExb5MxCdBMLg81bFe3J8q0rUau+g4CpNVXSRM8d8suCmghInp
   C9mNGRDUlzhcEQeYWkfxeSKNBBmvR+IOkx1XBqnCfS87w2zpN947Rd8oj
   be71tZH/GYdpmZh2wYo19AFe2U6PdYuw7V/uNSKE1Tr8CBTCLlprH0dlb
   2/8vrvj2VYMA5iPSmRkEeGXJSWK51tkjMW91P7pfKAGG/SEiEzTTkNy24
   A==;
X-CSE-ConnectionGUID: 9OcEidH8QtW7CiZU01PWzA==
X-CSE-MsgGUID: XFMUwpsITLyXQt0m6l3RPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86604707"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86604707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:31:54 -0700
X-CSE-ConnectionGUID: /q27Pd4bRv241LZnp0EPNA==
X-CSE-MsgGUID: GH83sIlXRQyE0lj4EKvJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222602865"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:31:53 -0700
Date: Fri, 20 Mar 2026 21:31:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: Intel: catpt: Fix the device initialization
Message-ID: <ab2gpg0jdzDcpr4z@ashevche-desk.local>
References: <20260320101217.1243688-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320101217.1243688-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 20, 2026 at 11:12:17AM +0100, Cezary Rojewski wrote:
> The DMA mask shall be coerced before any buffer allocations for the
> device are done.  At the same time explain why DMA mask of 31 bits is
> used in the first place.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


