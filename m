Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145323C8C71
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390474; cv=none; b=DFXX8ko+JcsSfQ0HiFhPB/pnI1NrarTl7KsUmdjmFthWsWv5iwJ6uhZY3eEL8nc9ZF70RXRPQ/mtQgg+KyGk+z0NgEjIEvLBTrfDlDoBexvC0it2doFwq0/lRAhULjYaSL4w6yXcWBBiWH6QCpMNm6QmqgvW4lQyEEOcXJGDzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390474; c=relaxed/simple;
	bh=ajTUdPOLZlwFEerLJI7QTR0inQfHdWTV1YGMqa9Una4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB1UkMSs+Wtgzi5NEIrtwHy2LMaNaHWtMFrsrmu8oOncNtcmkTmPJXHpPYobiTvlPXLtymxii4qJh0lZrGkhg5E6y4pmH795DVISLKtQOgtNDIic9u6yGfckYWX4y6bb4GthyiJg0dBsALU0qySfi9llfzQNrCxcS9u5uJTaZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWReCCWN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWReCCWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390466; x=1811926466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ajTUdPOLZlwFEerLJI7QTR0inQfHdWTV1YGMqa9Una4=;
  b=QWReCCWNmljKmyVhmw2Y/VaTrBuxIzerZ7bDZzkQNvBbqvMR/ij5JQdt
   pHaKv4b7mtm9n4u3FHtM9wu1GmJfQcOxEshz1PyFTaDnVURr+e6SOe+jB
   IGYsjOKsq1EaL6gDfPNk2Hnzz5/8arjxFuWliuWY8YczKX0oNSXNj4tUi
   O9DokkdqwaHA/ZiDeC/zEQiChRUjp9YE0rsNM6ZTtvhpTORzxAA1jecKm
   DVpbIkqXav8Jm+5xXZ2Zza0faytAzTi44g9L66bjMZUQqm9s5eBdfw1PE
   ApGlJ5QboabOU0NA6IyDTHyTcmEnL+80jAg9O118f2gMKuuJhP4tuTmDw
   A==;
X-CSE-ConnectionGUID: vWIYPjPETlK2yBhSMl+Fjw==
X-CSE-MsgGUID: 5zuTY/BaQcCTgYTTLbby2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106616604"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="106616604"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:54:25 -0700
X-CSE-ConnectionGUID: HybkWwTcRyC8ZA8KBFC//Q==
X-CSE-MsgGUID: 9WUSNKTjSZuiBqJr/5Uiqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243950168"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:54:23 -0700
Date: Tue, 2 Jun 2026 11:54:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/7] ASoC: Intel: catpt: Remove unused WAVES controls
Message-ID: <ah6aPMMlOwCRHDkK@ashevche-desk.local>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-6-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601141031.1606847-6-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 01, 2026 at 04:10:29PM +0200, Cezary Rojewski wrote:
> Support for the WAVES module was not officially published. The kcontrols
> are here to retain 1:1 uapi when transitioning from the haswell- to the

I'm not sure I got the 'haswell-' part, if it's a name of the driver, spell it
fully. Otherwise it sounds like a codename, which spells Haswell.

> catpt-driver. The catpt-driver is very stable and several years passed
> with no WAVES users so it is save to remove the code.

-- 
With Best Regards,
Andy Shevchenko


