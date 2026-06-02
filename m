Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0318DB1F
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390697; cv=none; b=skaHG7gvrM3OlXUGznLFmy/I8OyoVBwH/LdWjW6VXYtwW3sDfyfc7CJsQ5YgTIrOqLK3Xva+l0GoCwISP5AsyjcAK6HvxIIWw/23F+znJeyGIysTB9R5Qlsecip+As0sLJZBpQNQeC/LrtA7v06LuPRFCe/WSA/PH5DBMIL2I1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390697; c=relaxed/simple;
	bh=aikEc/uFAlevs9+c2HMeb0T7sHyBQWSIN8NqngPr6II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2e0XYLeov/knjZSDx79VH6DsBj9uxAZMwoLpGMjSB5jlu6+Yja0lpmvumklbeJAcaOQ2FTV13DtHWNquf65VDCjiIz50cdn6pZAUciiPHL/8ZHQC7EY22qcvt4+DQUViwkzoX6YFWlNJxxTX8g9hYmkUBtMB+YbpHK4JuBjoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnQELgId; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnQELgId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390696; x=1811926696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aikEc/uFAlevs9+c2HMeb0T7sHyBQWSIN8NqngPr6II=;
  b=CnQELgId1CeaOKyAD2Y6HjMmx8NM+f7Lx6cvjWATHPDBmI7/KgbjeZP3
   CtEWSXtH3Bg1OgQyjmtfNuH5RKIVMcS99+4t5CvFdws3YP7mjBKtjinfF
   QTGv4FVQ4KYKvCfY/WTz1pV0Ybf1BED0NjWBLeWYfgNeYOCPMJo76oA7E
   WeVYCqufp20YEoMas2ZQn2gLBLWCrzrIIqNlDK/vMv/gk/G31uQq86WtD
   ejWy1alGRsWeeX8WCsGnPnNW8vyUnhuwzYsX/tsXiKJgG6+IQVv9LLevr
   y7ngMG2EjLcM7EoScImlGlfIbshpKVv37H5iaRJC3XP9xtcnzOllBO58F
   w==;
X-CSE-ConnectionGUID: Ilq5tzfTSkGji0++ov5Lbw==
X-CSE-MsgGUID: eiecOeAfS9idT9xEOgLADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81032289"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81032289"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:58:15 -0700
X-CSE-ConnectionGUID: kwjs9Tj8ROW3Y6kjbXuF3A==
X-CSE-MsgGUID: iRndy03/T/u4OHD1sUAG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242822785"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:58:14 -0700
Date: Tue, 2 Jun 2026 11:58:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/7] ASoC: Intel: catpt: Code cleanup
Message-ID: <ah6bIynBFywX1JG5@ashevche-desk.local>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601141031.1606847-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 01, 2026 at 04:10:24PM +0200, Cezary Rojewski wrote:
> All of the changes found here are cleanups and from functional
> perspective, have no impact - either unused code is being removed or
> existing code is altered to use helpers/macros to improve readability.
> 
> Collateral of recent fixes [1].  There is one more patchset with similar
> goal following this one.  Before the team managed to actually fix the
> problem, a number of changes were added to make the code easier to
> understand for people who are not the author (me).

All makes sense to me, a few nit-picks though.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


