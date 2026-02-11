Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9C305E3B;
	Wed, 11 Feb 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808874; cv=none; b=GNA8V1D/4fn92RrGAtymlidh7+8MGhXaMvs2pAOakbfg+cRpl6QWrEc0i39pXgWrbc88IrwuojnjaWueuFrpmTl2pq8vkyht8ZLRT6lzqZqIYFxvGaTTquxGLFN23wipiMAMCjWa/cTNQOg4pkVV22P5QlKo32/5EFndL0Xx7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808874; c=relaxed/simple;
	bh=N22a4ERU0rZRWKf2k7RV1W6WDaBTnOHvktBbJ2ps/Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIRcxhGIzvUp+c6LpGztG3IYx0EiDGjI4HgpPmWDmLrlJ9aDNjxWiCkfKx40/gDKAevXCdbMU5gnOY0VKPiXE8o/4OFZfbuvWJ8b3VuybAht8vywpXKcojMBciZ1a+HXQvzScMqqGi5c5XWOcH5B+CjPlTKyHeZK+7vrQ2oFMgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJqHj0dj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJqHj0dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770808874; x=1802344874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N22a4ERU0rZRWKf2k7RV1W6WDaBTnOHvktBbJ2ps/Ho=;
  b=jJqHj0dj/s5KaGOaekObBmri4/mjJM3PCrw1j5uYJ1Odj2ZxMWCMcTrK
   SAj8pJZIm9jxj4NwLHHc83ys6r74n6fuy61gTRSmIFljDIkQl6sENoUrn
   tY5wtzUgbPhTkn2vtqueE8g1SfvUpqkLSdtQZp9CewwHCsNHyRdpe54LB
   JrThUF2mUML+/wmm58iXz0IbahFU5kMYQQznUCiqXa6UvAUDUuo6oa+3G
   6NkHA/LbWZMJjiJlT+C2SPx5eDOeoCnhe+F12zWlsXVaNqcH76m7Jknoj
   FIH3hJTfZi+HfjMlTBSihX+THXC5z0yrA6aXkn/eye6dSiOKpkbJI1TzH
   w==;
X-CSE-ConnectionGUID: GoAiJwryT2KBtAhOCNVyTQ==
X-CSE-MsgGUID: PuD3sgC2Qnqqx7yi7h99BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82683198"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82683198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:21:13 -0800
X-CSE-ConnectionGUID: 9RcQksSSQseO1vfWJn2yIA==
X-CSE-MsgGUID: Rq0H+k6WQ3O9Xt1XkLDhog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="235202045"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:21:10 -0800
Date: Wed, 11 Feb 2026 13:21:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, ckeepax@opensource.cirrus.com,
	nichen@iscas.ac.cn, kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH 3/3] ASoC: ak5558: Fix the supply names
Message-ID: <aYxmJOtquq9buee2@smile.fi.intel.com>
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
 <20260211093527.2892297-4-shengjiu.wang@nxp.com>
 <CAA+D8AOzSJPzBRfWwQnsASt=tPiuQcUvY=5MF0OXJuj5ymvyrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AOzSJPzBRfWwQnsASt=tPiuQcUvY=5MF0OXJuj5ymvyrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 11, 2026 at 07:18:26PM +0800, Shengjiu Wang wrote:
> On Wed, Feb 11, 2026 at 5:37 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > According to the binding document, the supply name characters are
> > lowercase.
> 
> According to the change history,  seems caused by the patch which
> converts txt to dtschema
> So should I fix the binding document for this case?

It seems I just answered to your question.

-- 
With Best Regards,
Andy Shevchenko


