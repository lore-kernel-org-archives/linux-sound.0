Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050F428852;
	Sat, 28 Feb 2026 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772277147; cv=none; b=Cd8Z2i+sQkBiZ4mT8WWmSjOngEWOjmyRgYgQSOAJPM+nptLK8nctccF7r/3NkdAcGzZfD92Z+9Y5x0WZuIspH1ogl25ynn67/9mkWUL5I8rFZjz9d06N9/wvpFc8Nt7m1x1DTxXZd61TccMS8dykMzrt8sS8mhiFwhFKDiCffeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772277147; c=relaxed/simple;
	bh=mUtDowZDqA0oBKwdrOYblxuFtFXR8pMwiMk2ClUuiDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8mLijp0rEBgSL7jSruxQAQYrNCnR3iNWbiS6TNZ4CXakSAJ9RIXMAuF38FibIiBpf+oGRrqGhNMGFx4wX2YaS4yNLvKZpckXlHcxwzNM63yKXq0joqCeTPFfNUV72C61BYPlKu+3i2djbB8tr/O6jid7saQdVxn4qfr3NF7cFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kblwvmNG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kblwvmNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772277146; x=1803813146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mUtDowZDqA0oBKwdrOYblxuFtFXR8pMwiMk2ClUuiDk=;
  b=kblwvmNGJXfuReAwVMk4NfIyUUNl6JrXNqKnUBen1IS8vQNlB9mAMgHF
   MdT+5O1juWtybVN26pr/KVZxjG9anJLUIaAiZKD5OxJu5VoUhiXqnpiij
   US/ASR6qulTD70PJDFcBJET/XC3qc1/pKdZWA6HLPHaJbuzBrxaT/wSjC
   RmH9JO3AeUd6XaqYk4Mnl8VJmaBuws1BciCguaSlhcpS5B364zYHJ0r+9
   9oXgMbWIYoxXHbvtQMV4ynsBbg+ZJAMIH6noGTO4/rqvsTA1bpT969p3Y
   yAPY1SGt5yfN94Y+uvJ6yCLbArkZv97Zr5bt1kS2YFmS8JOEF0fLzx2Tj
   w==;
X-CSE-ConnectionGUID: s1AG92wtQlanOsTCTBidCw==
X-CSE-MsgGUID: sWaDHw3wT5akTIuaAS09Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77218261"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="77218261"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 03:12:25 -0800
X-CSE-ConnectionGUID: 9lU5LI+nSCCFS1IJ6rJy2w==
X-CSE-MsgGUID: EImgYVglRc209T40J9PKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="221651691"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 03:12:23 -0800
Date: Sat, 28 Feb 2026 13:12:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Message-ID: <aaLNlJKommN4cDX-@ashevche-desk.local>
References: <20260129133340.302446-1-andriy.shevchenko@linux.intel.com>
 <PAXPR04MB845926A386618396ED8F0405889AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845926A386618396ED8F0405889AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 02, 2026 at 05:16:11AM +0000, Peng Fan wrote:
> > Subject: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use
> > devm_gpiod_get_optional()
> > 
> > No need to open code the devm_gpiod_get_optional() wrapper.
> > Instead of checking for a certain error code, check for NULL.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Thanks!

Mark, did this slip through cracks?

-- 
With Best Regards,
Andy Shevchenko


