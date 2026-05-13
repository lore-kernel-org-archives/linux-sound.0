Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D04A13A1;
	Wed, 13 May 2026 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693057; cv=none; b=LUkdH/WmVznviPXvvpjkr4qlVdETx4hp7a1+ywSIdDmTsVxRYYUvCdn6/8o9hMLIiQ31ZKpBFVt5nlUMG/lSbgDel13le3Cdkz7kE2KHniz19LRaoAL80/jMczb0c9EBU8cJqCRmK9x3zqOlCbTUUdPAQ9x5+mzQaG52PZ6LwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693057; c=relaxed/simple;
	bh=0+15F8/N4iASyPv+juUa45quizQPBTSIncpyZwpj+6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo9SggzyagK7BAyb3Jkqq3qxFl4ZBMdyiZCYtbKm11cURexvHWPwBKjYmNeIXEMhsywL4YaZkScpffW1odF4LRWszmnPN29vsMpcJtqP4rTcm/tTyrkErsonH8AY54WTydWwqdu4opxRiTQdtKoomgTpAIe/J1pKGtHLFQqiMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+YtkJpX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+YtkJpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778693055; x=1810229055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0+15F8/N4iASyPv+juUa45quizQPBTSIncpyZwpj+6U=;
  b=g+YtkJpXsnoozAChcrGDGg8W1gqo5y1wmaCHYRphjubmUzg1pkKKfDmr
   Pu/qda3vARTqr4G0b3L75EzB981AinPbh5uHxXeMTjNZG4+fRzLpSTBlv
   +gJ0Fz2yt/8VuQeIqVAevmNjzBPEU8N+7f2Ok8nWWzGfNG65dKamtRnA4
   /GtA/3sGhASbT1HaJp5sFeENWY3kqKtDH18Dddo0PP1tENE2WEKXzsk3U
   4Ow8jNzBwKp0zKagyxB3sJIXHCzKZTLNxqx5aywOlOATAYDDmpO66/Nbg
   Lx2r/SM5H/jq/FnKIlWvK595KnZj7yZraVIBIcmaV01L9aJ0w6rG8A2Mr
   g==;
X-CSE-ConnectionGUID: hWBu9px4Q2Kr6d9QaHeDNg==
X-CSE-MsgGUID: hP+kBRUPTFqtuwS6Pz2i6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102296469"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="102296469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:24:13 -0700
X-CSE-ConnectionGUID: Avf8sdQMQhOgeEVmiJ85pA==
X-CSE-MsgGUID: iBIe0/ExSWuyK/HG2gZs8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238032201"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:24:11 -0700
Date: Wed, 13 May 2026 20:24:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/cs35l56: Drop malformed default N from
 Kconfig
Message-ID: <agSzuYtJxIKp8-TQ@ashevche-desk.local>
References: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
 <48cf7f5c-4135-4111-8222-659c07cd44bd@opensource.cirrus.com>
 <agSzS1rdEOm_QeLM@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agSzS1rdEOm_QeLM@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 08:22:23PM +0300, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 05:46:03PM +0100, Richard Fitzgerald wrote:
> > On 13/05/2026 5:27 pm, Andy Shevchenko wrote:
> > > First of all, it has to be 'default n' (small letter n), otherwise
> > > it looks for CONFIG_N which is absent and in case of appearance
> > > will enable something unrelated. Second and most important is that
> > > 'n' *is* the default 'default' already. Hence just drop malformed
> > > line.
> > 
> > The redundant default was added intentionally to be explicit that the
> > default really must be "no". But if that sort of thing is forbidden you
> > can drop the line.
> 
> Torvalds gave his opinion on the Subject a few years ago, here is what he would
> do.
> 
> 0192f17529fa ("clean up x86 platform driver default values")

Based on that, can you give your tag, please? (Also for ASoC case.)

-- 
With Best Regards,
Andy Shevchenko


