Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F7019004A
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842368; cv=none; b=LOFyNDHDf2wmWvO99iAWrI/vT8BHxc1JQ2FQ4x78PkpY3UUU043Ur55aIYQn2GTQop6l78SUD8/OcR9gbYc7NbrJ/WCHVHm2UCpZj57Dci3q96/c3fT4FE86oT1z38xyvrg8AImNg9JBCjIxiBWfUbN1hX+troC4hThg4ofNstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842368; c=relaxed/simple;
	bh=Eft15bv7A8W2OQP1Tdp2GQtadRoJL7xyxF++KF5gT1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RW98yhw0bw52gh2TPUb4Mca4L4N0i9LTOzMJ/AeU2tPTZcWHpwsL8FfYlz69jTHnt+E+cm94q5pEodoYgciCjR4teT35wyDeQFk992B0w35Sn3rG0ai4CoU1+tZcWiz9yA/DQFurATHIfPSLWy6JbS5JlK9W6H+whApX1PobWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuxTxGY4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuxTxGY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776842367; x=1808378367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Eft15bv7A8W2OQP1Tdp2GQtadRoJL7xyxF++KF5gT1A=;
  b=WuxTxGY4K0oWTANeTEaCnToAVhFPYv8Xjsy1iDiiW64iKJVssi55aHhy
   QZOrQbCsa2u2QI1CVn2MItHr0pHVO6EiDEOZCQ9D4TUDRCRig3gkX+zx9
   NMZ+lgu3PuTmcvYK4P8h/Nylnz6/8UEzT5dfo6ZCouaOAyyulvfSjFF9X
   0cPq4gb4r/PNVcJR/HAocxvLI6ASTm1plLKGRZPzteUYO2UJvYJPKrWrc
   nJ0WY5l/xYp25E5IkGdrbUJ0zLWrQW/c+dtIKggEsgClDnTAarodsKh3x
   KKT2TNIyQs0Dc6Q0Cr3hjIjnwYLGw1aV3ns91Q2D8yIyJ0ei2HQRjzn45
   Q==;
X-CSE-ConnectionGUID: /APIDV5YQfWYRfk77mvYzQ==
X-CSE-MsgGUID: +Gcm7Zz4QH6QyLkkr/OkDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81654361"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81654361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:19:26 -0700
X-CSE-ConnectionGUID: dmJRsXULQOWrYOLsT/oEJg==
X-CSE-MsgGUID: C4FqW8ofSlqHnn5lVgdXFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="236639063"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:19:24 -0700
Date: Wed, 22 Apr 2026 10:19:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aeh2eXBdL3bfzXYR@ashevche-desk.local>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
 <aed_ZwYj_ruoTAZc@monoceros>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aed_ZwYj_ruoTAZc@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 21, 2026 at 04:07:42PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> > On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt wrote:
> > > On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:

...

> > Thanks for the references. It looks like there is not much to consider
> > outside of mm subsystem. But I have some concerns if supporting
> > ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsystem.
> > 
> > Any structures in UAPI header of this subsystem are defined with
> > an assumption that the size of pointer in the existing System V
> > architectures is up to 64 bits at most. We can see many usage of
> > '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> > structure). I imagine to need defining specific structures for this kind
> > of 'fat' pointer. (The same assumption lays on compat ioctl.)
> 
> The Standard C answer to that is: The assumption that you can fit a
> pointer in an unsigned long or u64 is not generally justified. This is
> "only" given for all current Linux archtectures. And if you want an
> integer type to store a pointer, use uintptr_t.

No, please don't. Linus was clear about this. Use `unsigned long` in that case.

> (And my position is that
> you better try to keep pointers in pointer variables, though there are
> some situations where you don't come around the conversion to an integer
> type. That's why I introduced the union instead of converting to
> uintptr_t.)

-- 
With Best Regards,
Andy Shevchenko


