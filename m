Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1951FBC8C
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995082; cv=none; b=qHxwGAIK25NYZvNzApn9kjprr6SVtzcNGlm9PdSDwojbWODxUks8RmLClpjBmPd+PF53teunLO4wFjVpQPdxdJKo88N486d3CREoe0aWFef7wFzPQho06X6C0NFtqq70qMIQTzflrezrvYs1dlu8Inhe9zt5nQlbUP4RO5lCtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995082; c=relaxed/simple;
	bh=vsz43pB9pbAKVcfDWwa5EuKc9rCqUV8ifdkpFZtv7B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqHkhWkqG9LoCN5AJ37QvFGHJSPmwgE5KwRA/6HQNRH0+Y51Drma99BwBfdk6xTe4MgPPJCAXBoA7vwqKiOGuna7ytsgxQ+8eX4Akn1gURIJ8KYJM4UlpwORgVY+PWHKKqg6x6p0sU76pEZFJ1vHpiT6p2s3x+OXyOogKCqfsU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J39Akkc2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J39Akkc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763995080; x=1795531080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vsz43pB9pbAKVcfDWwa5EuKc9rCqUV8ifdkpFZtv7B8=;
  b=J39Akkc24jdGZa+8mDlflR7SWUib3JVgY6hJf8wow1rJ0NROYXFWEJZS
   bOa/ET7wNnUB/b/w8vDHOErSzhqaU8bPTkNfpTkBjZteg/eNm0lX/hHez
   2Tr/63E/f65G5ce09y4BEntxyO0EVGl1EBFb1fAjf/B3GVmANK5GYnXPu
   RFRTgL8EDOexhznDlGTaoOn38/4UGh3yv1fUsRxtjbCQ5JzEStDNcWL2Y
   LeVPnsfqV4KPsFtxfzySTlAmflc1jantubUs71neqfMyoTV1rO0Mwh5SD
   H4+FgGay17NyvP/i0wB45UyNmVumd64mTKCd4TEiG7Kvh0T2/T8EHp3pH
   g==;
X-CSE-ConnectionGUID: wOVA2hs2QEWgq2+HXlPYRg==
X-CSE-MsgGUID: wDPPoCCERh+4Ov1g3MuRZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65177659"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65177659"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:38:00 -0800
X-CSE-ConnectionGUID: lo8S6KktS62+ZFPZkUk6WQ==
X-CSE-MsgGUID: KfyXz1hzSuC/18biE5mJqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197277600"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:37:58 -0800
Date: Mon, 24 Nov 2025 16:37:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: Intel: catpt: Drop catpt_runtime_resume()
Message-ID: <aSRtxKLlbc1FomOL@smile.fi.intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
 <20251121114331.3841335-7-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121114331.3841335-7-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 12:43:31PM +0100, Cezary Rojewski wrote:
> The function provides no value over catpt_resume(), use the latter
> directly.

This makes code understanding a bit harder in my opinion. I would not apply
this patch.

-- 
With Best Regards,
Andy Shevchenko


