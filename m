Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F80DDCD
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674936; cv=none; b=ADY3vme+zdPjBpcnIGvka4tuQR0Q9igldegzIobExHmHAKhT5hpMFAZ0/PznaB/uHCBJQcWevAAdoksb43ak6wg9XNCCK4RGEJ/HlPKkQlsyFGrrKHGs8AZ5kPsrL+esq3p21psoL/eLstmy8J4Ga7ZsyeU1O+qNzITxG66Je2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674936; c=relaxed/simple;
	bh=o8anHnN2PfgzZJ8I700vRINdD0gek3h+mFvUxOWgh0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPoVAjb2BoSzZMftXrMRP4lJfJGNIMrnuF0v2JpCuya4Yxg/JCeHJuZnfJGia91ZThek4zobAP7wQs29KXqcgCzwPYrwtlq4z9fcX3Bi+Si6adeI1JCD/k+fqSgT9Mz1xvLrpC3nnJnvMILfRe5eqTuMrNdJWAZOy2eBKs43gvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxYrSEL+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxYrSEL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776674934; x=1808210934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o8anHnN2PfgzZJ8I700vRINdD0gek3h+mFvUxOWgh0s=;
  b=dxYrSEL+E6WEq/yMB5onPdKaP4GdOR2vWAlWCnK+6p1FecL8xRuHtDAf
   hSXtu70e3spAO5/4m1cM+MVAMG//lx1IzTl2NppCcbdVPYEyI/CTpHT6p
   VnEKzOAljE1Ozd+kvKlJ4Lfxh5IjOUu40myiNTn0xHaFaK9rbKNttUg1n
   I1SoDesU2qFsd0ZB9xggl3lAE353cAceD0cLZXxpOq7LPSuHESB5Q9htC
   pzHpxrDBF7+BMyjr1ugvH33NtFE4gF93jXc4B2eoR+lfqV54zB0hc5C/Z
   qKik7untRfV3ffZ9T2KG5in3O26ond4ktqkE3Eci9zoEYYtSG9CnDUk7I
   Q==;
X-CSE-ConnectionGUID: IyhBVQUgSfm48zcSquqoFQ==
X-CSE-MsgGUID: 8PX8nl6ITrOFHIMzjTYI7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87886890"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="87886890"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:48:54 -0700
X-CSE-ConnectionGUID: vGed6IlWTE+E+0AeHEp17A==
X-CSE-MsgGUID: Csav2yzWTm+ahdi+TzWvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="236648170"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.90])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:48:52 -0700
Date: Mon, 20 Apr 2026 11:48:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1 2/2] ALSA: firewire: Make use of ieee1394's
 .driver_data_ptr
Message-ID: <aeXocWviro6NNnw5@ashevche-desk.local>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <7b7040a9c1f3152f9ef7994613ddfb201ca9b94d.1776579304.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b7040a9c1f3152f9ef7994613ddfb201ca9b94d.1776579304.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Apr 19, 2026 at 08:42:14AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Recently struct ieee1394_device_id gained a new member to store a pointer
> to driver data. Make use of that to get rid of a bunch of casts.

...

> -	if (!entry->driver_data)
> +	if (!entry->driver_data_ptr)
>  		detect_formats = snd_dice_stream_detect_current_formats;
>  	else
> -		detect_formats = (snd_dice_detect_formats_t)entry->driver_data;
> +		detect_formats = entry->driver_data_ptr;

While at it, I would negate the conditional:

	if (entry->driver_data_ptr)
		detect_formats = entry->driver_data_ptr;
	else
		detect_formats = snd_dice_stream_detect_current_formats;

-- 
With Best Regards,
Andy Shevchenko


