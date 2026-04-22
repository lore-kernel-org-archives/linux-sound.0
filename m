Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C03C3BFB
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850850; cv=none; b=jeb9dHXA5LsheaUjUoNoEFQlioj3F4X5WE16uVfyeCGHWm9ouPHNNq5LodYL3VYa0Qb27mbh2x9A6kfKodPxxDJ+oKKajvvieGKXgp5GEDI6BTLdkoNi/LbMdZNI96zeAkzSgAnkURb9yqO6LLE9zUuhc7jhblgAuS5iK1jPEfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850850; c=relaxed/simple;
	bh=dk/wYGMW3wmoNJipoBqxoQNsa9iIgHuOJa41086I1TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ04jLu+9/Ma4PYljs8zZrNnklQjSEoC1Ri8ZVXBu8IdBnLB0rEg+HGYweCyYm6KAZn5ATQChjs8I1OZmVHeEGW1xguSB6Gl0gFyIigq4k8ErqhprXn6Rh/KBcK29fZP7MxDWdAvXp3x3ZM7BoB04qgBy72Y73/8OfJlgFQTLig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2LOK7z8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2LOK7z8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776850850; x=1808386850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dk/wYGMW3wmoNJipoBqxoQNsa9iIgHuOJa41086I1TY=;
  b=W2LOK7z80O5C1wd8z+UpoIPezmTEwxnqxLn3DMt5IMsrau4ukkPw0ymP
   bPckBMtEK5zKhsFYkq//1yx8yYTc1nzxekzNKaWUfxqC4AJJYCOZOWJPh
   zA0hjV4UKxbqveohRCSEfuJBoxPRCg1jqhtKnDNYO9MxuVxaLtADC1xP7
   I2K3jQRG0kSA085TyceTE+b4o7sdfGaJqNlOLuyLA0HsyLc9Vkz+Q4Dew
   oGjbj3yJrEGX638uZRtzMHsLsV4EC5d67lfhwaP+1a3oNoy+dhorL/M+U
   cQznCKAUjDc5tR8HaGi9nrf4oG+0E20omHqj+5kJbR51Yp2sZMdBKhSVm
   Q==;
X-CSE-ConnectionGUID: +mYMJrbWRbuXK4kd44wh/g==
X-CSE-MsgGUID: MMEDfn7STTWl4tlK6Bthfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77504026"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77504026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:40:49 -0700
X-CSE-ConnectionGUID: gDWFnsNvRkm0E+n0Y9DamA==
X-CSE-MsgGUID: VCvhbwUrTduzuMioycwxTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="236307124"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:40:47 -0700
Date: Wed, 22 Apr 2026 12:40:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aeiXm6IUIK54iG21@ashevche-desk.local>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
 <aed_ZwYj_ruoTAZc@monoceros>
 <aeh2eXBdL3bfzXYR@ashevche-desk.local>
 <aeiElvAzJRPLKUeI@monoceros>
 <aeiJRw-I622NhiHj@monoceros>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeiJRw-I622NhiHj@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 22, 2026 at 10:40:09AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Wed, Apr 22, 2026 at 10:30:24AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > On Wed, Apr 22, 2026 at 10:19:21AM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 21, 2026 at 04:07:42PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > > On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> > > > > On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt wrote:
> > > > > > On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:

...

> > > > > Thanks for the references. It looks like there is not much to consider
> > > > > outside of mm subsystem. But I have some concerns if supporting
> > > > > ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsystem.
> > > > > 
> > > > > Any structures in UAPI header of this subsystem are defined with
> > > > > an assumption that the size of pointer in the existing System V
> > > > > architectures is up to 64 bits at most. We can see many usage of
> > > > > '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> > > > > structure). I imagine to need defining specific structures for this kind
> > > > > of 'fat' pointer. (The same assumption lays on compat ioctl.)
> > > > 
> > > > The Standard C answer to that is: The assumption that you can fit a
> > > > pointer in an unsigned long or u64 is not generally justified. This is
> > > > "only" given for all current Linux archtectures. And if you want an
> > > > integer type to store a pointer, use uintptr_t.
> > > 
> > > No, please don't. Linus was clear about this. Use `unsigned long` in that case.
> > 
> > On CHERI we have sizeof(unsigned long) = 4 and sizeof(void *) = 8, so
> > what Linus wants doesn't work.
> 
> Correction, we have sizeof(unsigned long) = 8 and sizeof(void *) = 16 or
> course.

CHERI is not specified for 32-bit platforms?

-- 
With Best Regards,
Andy Shevchenko


