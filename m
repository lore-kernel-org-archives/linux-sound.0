Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDE31159C
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390271; cv=none; b=kgoe4C+hASWgCk2qGJOn8BnpPkEQGb2TOOueKfoOJk7rCym8CQo4m8wDoKFtiWrbaBIfXGHDlQutKKvFrQjc4T78mXNROvgyRnYP20JbHcmT48KYxdnAWQhNY+ABg6IfTH/6tStdZnG1+naMA4rIVPo0UFiclPzeoQhh89oTx2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390271; c=relaxed/simple;
	bh=tfyWVRBSz/WWZ1Fdt0CDkzYK6f0nEVlZGpv3s0FycXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZv66y/cLQ7BNAVc6PZcks8FIaPINd7RpKDmR0fV2YHVZQwzvfQmme1ewH7eJhWQZqoN5dIBT4UQssYbg1saRzAtdgqMFxKQe2znzVBpYN5eWd1xu7HxlnyUN0dYVk6BfnovFB4w94Xm2P0mX9l0EONYV1T1kv3E8kV5uzhppio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPAMB0gk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPAMB0gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390270; x=1811926270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tfyWVRBSz/WWZ1Fdt0CDkzYK6f0nEVlZGpv3s0FycXY=;
  b=IPAMB0gkfVckgesut30ZiLdaBd1pZOzefqaQTRJOmmaSWQ4Os/k86WWM
   zVCI/eMJtC6ox3kpW6jVs+5rOjrK7EODq8u1kSykwMAj3MASKQNziSYlC
   yQNfJZtdNMU/WdKheKS0kVhhSRTfKlNZ65IYr5+seOxsTbOEnJRnb/jvV
   cW4nzdEfG6zFOOg8HCjaFe6TjJXsR0vXzYMt2TraQm0iyC9pwg5M930lj
   hCOvIMbP6LY+WeEZ6Gu58L5cf11txQq1/97mD481lxOaxSiEL98SqMIAZ
   f72ZPQhuVGomBOrVYkW+/XqxnYFvHdkYRbCAQnH9tGlQHw/doRDj6CD7d
   A==;
X-CSE-ConnectionGUID: u+BfqLevR3qLgG6FFAfmCQ==
X-CSE-MsgGUID: g9zp4niHTgS78ic9z0rf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92281313"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="92281313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:51:10 -0700
X-CSE-ConnectionGUID: N0zoOJoJR3Ka/NOLPTcfxg==
X-CSE-MsgGUID: l22Os3+KRtCua3wq8n7jgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="239679129"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:51:07 -0700
Date: Tue, 2 Jun 2026 11:51:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: Intel: catpt: Utilize lock-guard helper
Message-ID: <ah6ZebU6gmbEyOdE@ashevche-desk.local>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601141031.1606847-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 01, 2026 at 04:10:25PM +0200, Cezary Rojewski wrote:
> The lock-guard helps simplify the driver's code.

...

> +	guard(mutex)(&cdev->ipc.mutex);

LGTM, however, I would still have a blank line here.

> +	return catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
>  }


-- 
With Best Regards,
Andy Shevchenko


