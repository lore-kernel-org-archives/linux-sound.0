Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E122B9A4
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 01:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449407; cv=none; b=WZDShHIKaO5joi64Rgjzhfll90ACZ5UIkgReX8ohz/0ZPcLWRk844yA5TxfCxNhBQKAKGA4MZX39lzpIvz3Ce+III/8QFJPhk/F+LeX5gvbOfDvVKHWp9hxMemu7B+Lbb9k+nL7a93L4U082fiH0XK607tJVeEA3JEA73o5THhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449407; c=relaxed/simple;
	bh=laFxfyTeJR9r4sKqfGozI7Oj9WO30exV0D1+WCs6d9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6KH9kAH6Wk3XZcYyPX80k6bow2Vdr1lPRjySAuJK7kvqrT47Dpcfc5JSTt4ixSnuYbCMuq98ewXCd3Yl+81kXtfBajjgURQyaxqAcTGcMKFFf3XhXwdzET5gnS2jR9PnFsuelw8mS4l7UN5MyjG/kcs/ZgVUpU+GhxzHG6wYYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDrH6W2R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDrH6W2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780449406; x=1811985406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=laFxfyTeJR9r4sKqfGozI7Oj9WO30exV0D1+WCs6d9M=;
  b=aDrH6W2RgxeelWfpDuYCoI73z5cQ4UygYHlhBYQQsXKlSLF3kC1gijwD
   Bplb+FTCVWPIYxYMKyYOzraSGTUhMCZctsp5HHCGGvc01lo+gT3z3QZo7
   prLpo5kKZ2z22rwWtDp0nOZTjUAX258+ejf9Un+pYVp/rd1T+WSbzBDkw
   VKpWu4bmar6Iy6y2XCN++A5SS4uNrAPX6kskc9pfr6pLF4ZaPjPjOUSh8
   51ZMAFP9/F26lSHPOjsKazICL4+W6G3G3vnzh3N737SYfcAkP273jbftE
   yIm6EReSXiVSRIAh8QL9ocE6BkvesaN7u7UwuZymSGyYUG4U9WCQ9fEBf
   w==;
X-CSE-ConnectionGUID: fkchI/k/THa2T14bne1mrQ==
X-CSE-MsgGUID: 77PPOaGDQI26YzfnkPG2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91821226"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91821226"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 18:16:45 -0700
X-CSE-ConnectionGUID: 59/Tkor0Qm+nhUYO1NoCDw==
X-CSE-MsgGUID: lhnEykTxSoOSZnphl0nQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="267702730"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 18:16:44 -0700
Date: Wed, 3 Jun 2026 04:16:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
Message-ID: <ah-AeU24nP-nMK4o@ashevche-desk.local>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
 <20260602081350.1752773-5-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602081350.1752773-5-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 02, 2026 at 10:13:47AM +0200, Cezary Rojewski wrote:
> Code line reduction and more transparent variable naming.
> No functional changes.

...

> +	list_for_each_entry(stream, &cdev->stream_list, node)
> +		if (stream->info.stream_hw_id == stream_hw_id)
> +			return stream;

Seems there is still no blank line here.

> +	return NULL;

-- 
With Best Regards,
Andy Shevchenko


