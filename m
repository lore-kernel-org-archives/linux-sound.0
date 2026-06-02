Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4128370AD5
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 22:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441165; cv=none; b=P1M3J1NjFJ+o/azLdisAfkX4M4t0EowOPVCL+MKa1bYPiqGMckgdZ8VE3CNiFt5LE3TTSOrV6uNKBPwfruVMt50Rn3QhHS146iwhSzkQU+WAmRXGphXLLwOfUU7Z/LFXSm9hkORN9yTJfRoRqK0ZcVQsjiHyi5eNGw+/f8F248c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441165; c=relaxed/simple;
	bh=bOZDoCCEOsPC+2J28NUKU7U200TY3Dj99UCmNyhcwZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibGO+sNdTIAiUJjZIsUwRViBxXk6mTH+4hwclCMRXYBBnDe2FKMusbAJoAldpQ/Heb13MFHqYqBjfSPPXPl3U8Y1am9NvPVyOmCD2E/491wTQEAj0FsglQ2uH6s6kvBAEg/oe9/44PPmBRK5UN8zpqGdNujAg0MdtYvme18mt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9EMEFLj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9EMEFLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780441164; x=1811977164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bOZDoCCEOsPC+2J28NUKU7U200TY3Dj99UCmNyhcwZg=;
  b=j9EMEFLjgu7OCuZ+PuyscNhid1qsSgY3cGzWSt7+xBIh4uQw+a6rgS8P
   Xn+Brk2t0YFlR7iKUH81tDHL1HUwR/5l6wPzjzSERTQvtMVwwGhp+vhQe
   Uhx6dvkiH2JuRKGj+/M3fOH5xPT5d0VU0UTzJRIpEha4EeOD5GSs132ly
   Lu2TTGuAwLXgwMO2mNXaQXxW2mVe8amr2AeWK6WKPL3TAmQTz63CN/IMM
   VZj8XnWIZNOiPEa0N3bvH8ELkyJtmjcPxNZZOCf8qGUURahUv9pXlDIXM
   RShQMGvChe50Rk4czx8uzdXOCkimPm0gn/AuHxiHDCBt7R51pw5HMYLjg
   w==;
X-CSE-ConnectionGUID: r+G1fWiyQWypUtOq+JIDKw==
X-CSE-MsgGUID: K/D+4XCWRsS+U+KeMxMtyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="84866062"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="84866062"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:59:24 -0700
X-CSE-ConnectionGUID: vwg6lGoZQX6DHCU2tKgCYg==
X-CSE-MsgGUID: u2v9FseTQ5Cy/P7QrhphoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="241560159"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:59:21 -0700
Date: Wed, 3 Jun 2026 01:59:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org, krzysztof.hejmowski@intel.com
Subject: Re: [PATCH v2 3/3] ASoC: Intel: catpt: Print error code if
 board-registration fails
Message-ID: <ah9gR3qlJj7ca_i4@ashevche-desk.local>
References: <20260528083444.1439233-1-cezary.rojewski@intel.com>
 <20260528083444.1439233-4-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528083444.1439233-4-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, May 28, 2026 at 10:34:44AM +0200, Cezary Rojewski wrote:
> Message alone without the code does not tell us much.

...

>  	if (IS_ERR(board)) {
> -		dev_err(cdev->dev, "board register failed\n");
> +		dev_err(cdev->dev, "register board failed: %ld\n", PTR_ERR(board));

Why not %pe?

>  		return PTR_ERR(board);
>  	}

-- 
With Best Regards,
Andy Shevchenko


