Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90728E0F
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326716; cv=none; b=ASA7RVd9YcTQOMZD+faBhBKA1jelP/I75GlEmu9cebF3mxVNEkniTjocZLGu+Hta0On+pFoTTWiCtp85BurkOJfQ3TyJundSBiz456B1Ga1fmMA09C5yZKIa5YyxK+w4uzlovXNwIrTxMoatAcju2DJyedY9fEWk0Mh3aEkIbv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326716; c=relaxed/simple;
	bh=vCX/w1nc4YYB0GwuZHB5hXeYkOqG9Am8UmDXVHXWt2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdxHnRP6dwe+3HTsRf44K5PNWuXzDoeEnTZrlHTaRUDsdvso4MW4S/HaJHh9Wsnbx+n8qKUNiPxV8Lmc8gM77evEb11ornShnGw1b5dvUJXRvzFWGWQSQmHv44hNV0wZsORAmMRszu5m592hzIGceTxYlIZuJoOkoyLz+KIlGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ma2S5QqT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ma2S5QqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764326715; x=1795862715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vCX/w1nc4YYB0GwuZHB5hXeYkOqG9Am8UmDXVHXWt2I=;
  b=ma2S5QqTK08T4nGR6u8Ac7UeUFVuBN41DVsNSdyWLyzvFiQYQD7iiWu9
   7QDqYcz1b4JJaMiNGu3HGCNLmWIhC6Nit8DRGFaz5l+SjlhBSFsUnsQwA
   tPahsJXBFbTHZHnrA3YBcpKbNJCNQrFDrrgz+ECvzrOta0mMHJLbNaopu
   qvdNFP2/j3eK0cxFDCNhbJ4NOMnsKcnB9D+/Fg5iANTZ4uHAsQjkQiZLa
   NHIDZFLvxWo5fICnZOvBMIc+T1KJawuX2c/0aD71SjiZC8UF8k6e+XWvK
   dGBhPOnl0v/gL4XNm0Or5MUnuqc46ooTw428XriZGbpeCj8BFkjmilSzE
   A==;
X-CSE-ConnectionGUID: pCq/reKEQ6qiCaLUeimK6w==
X-CSE-MsgGUID: kOzD/8LcSASkJMHUuRqXMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77719538"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77719538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:45:14 -0800
X-CSE-ConnectionGUID: KR9FVnBkTqqwwDYPJ9ZUwg==
X-CSE-MsgGUID: aX6f0syIR9y5kQbp7AjwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="224139592"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:45:11 -0800
Date: Fri, 28 Nov 2025 12:45:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: Intel: catpt: Round of fixes and PM changes
Message-ID: <aSl9NZ7YUao1NGNQ@smile.fi.intel.com>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128093412.3949374-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 28, 2025 at 10:34:06AM +0100, Cezary Rojewski wrote:
> Set of changes addressing gaps in DRAM offset checks, error paths and
> PM.
> 
> Three fixes lead the way, all straight-forward. Followed up by a small
> refactor to replace manual arithmetic with resource_xxx() API. The last
> two relate to the power management.
> 
> The standing out PM change is removal of the catpt-driver as a
> system-suspend (S3) blocker. This is a suggestion from Andy as indeed,
> audio is not a critical component that should prevent the system from
> going into S3. Whatever happens, the driver can recover on a follow up
> resume (S3 -> S0).

v2 had been applied AFAICS.


-- 
With Best Regards,
Andy Shevchenko


