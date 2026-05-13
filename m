Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC947CC86;
	Wed, 13 May 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692945; cv=none; b=DHUPOABdc4AmFpAJorQp8xoolpOosIVa09PR6Ijog0A7xjdoJkM11p0d0jG5TbAEbPktQV6sd8G0+cNuzwNSSuHHzUwS1AYMthLXx+/vxxM9Mg3hxaQjEiWGmWo/uLDZBkEHHRztjq1J1fWHnIAFgiMsvyBD9WS/HG3mZqqi9kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692945; c=relaxed/simple;
	bh=DGIz4CwKIJytiXhEYtk8UjkyDHCmZ3WhoSVhw+bbkt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCEgdMhbjfklI1t06PBGBlajVbvC08KRh1ek3ZmRHiEJZn662VpR53zHelYBCMp7KhLOu0Z9OxaIQL6vaBE4Ma+ga+oxkCvgjPZmP87gw9mLFQ+CTFgYxtt1R4PecqtnKFotLylOYaktzsfFipqjTG+uv6t3ENRQqDO1VWYxNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMmPTApW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMmPTApW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778692944; x=1810228944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DGIz4CwKIJytiXhEYtk8UjkyDHCmZ3WhoSVhw+bbkt4=;
  b=TMmPTApWrdNDffcu/ChI40ajUhYhx+pqNS1lR9tc0xYddUEHYyOFBSHZ
   UtJcqnYckasY3ki0G32DvKu6dOqVtCFLFKWpj/pBbnsQi4+lSkINKQS0J
   gjxfwwQRrPJp1+9MB+qhu9UZqYev9TeKB/L5RCQGWFVUd3b8rfqqf+Xiy
   1vTgP0zF6NIPPbgS5j6bNlnzKbjKEnl6NgVRasueOLgbnCDKW0OEg/jSK
   YSL9XQuu5ClBcbun2JwbbBS8UyU+7FGYBhtCsuavEdDulZBI/4tSbqhN9
   HJ3pxuUU3tT3IhnE853MjkZ48pvwl4oXL3MPD7ZxFP6Q+Suolw28a6mVH
   w==;
X-CSE-ConnectionGUID: Lw7Sp4CaQOurlBhNiQO0Ng==
X-CSE-MsgGUID: hlxkSq4VTQ2Q3AYf0nOJXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89935011"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="89935011"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:22:23 -0700
X-CSE-ConnectionGUID: lIN6VuzZSCeXR2HF6O318w==
X-CSE-MsgGUID: Dj/26CHQQBaMe6gJtStQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243100800"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:22:21 -0700
Date: Wed, 13 May 2026 20:22:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/cs35l56: Drop malformed default N from
 Kconfig
Message-ID: <agSzS1rdEOm_QeLM@ashevche-desk.local>
References: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
 <48cf7f5c-4135-4111-8222-659c07cd44bd@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48cf7f5c-4135-4111-8222-659c07cd44bd@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 05:46:03PM +0100, Richard Fitzgerald wrote:
> On 13/05/2026 5:27 pm, Andy Shevchenko wrote:
> > First of all, it has to be 'default n' (small letter n), otherwise
> > it looks for CONFIG_N which is absent and in case of appearance
> > will enable something unrelated. Second and most important is that
> > 'n' *is* the default 'default' already. Hence just drop malformed
> > line.
> 
> The redundant default was added intentionally to be explicit that the
> default really must be "no". But if that sort of thing is forbidden you
> can drop the line.

Torvalds gave his opinion on the Subject a few years ago, here is what he would
do.

0192f17529fa ("clean up x86 platform driver default values")

> I apologize for the typo, but that is why you shouldn't use case
> difference as language syntax.

It's not me whom you should ask for that :-)

-- 
With Best Regards,
Andy Shevchenko


