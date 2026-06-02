Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A9175A72
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390658; cv=none; b=C5APtcIj1CiyaFu9uJclYONZ75Ocowbu5n/Clw0SKuHVSYP7LWt33uoraj0aPSM+ltBEkm8V/olADWKRc2D+oW/mVWqH0JekcHvT1VPXShjlaAW07UwWPpHVxUzwwqPGGMkjLWKfQs0+uIVS/1w3p32VqU9Hef6gjDAxsE+y2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390658; c=relaxed/simple;
	bh=raALobz2bWnHu3UJSZPIbt8XWCjqaYRCI4ELh62G8Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeA6Ubk+2kEkHz4suPUtxn5Y3JtnkFwFP7XqHochg0erME2VcdCKTKDw/JlbSkMJYmAshygwWnt3Pjlvu4moqrNmj71QQLx1anCsnIFsdRKVLAr7nWKJK/r8xgF5gdM0dhxYwVlN96+AiKQDhdAADA4rDVE6Qwcn93jHCwAuHiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOSshwVM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOSshwVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390657; x=1811926657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=raALobz2bWnHu3UJSZPIbt8XWCjqaYRCI4ELh62G8Js=;
  b=KOSshwVMx5B54kICqaG+tzVmnsA14XgzVIlzlDxXePJ0Lrr2kSuNywRK
   7aJZ1NROTff1+bvqQlmaKyu8mDK7q3TjgzZs3l4jIR7u1fzJbMkeKMsuH
   USDcY8t0I50ZizHUdKSUPlX3YFtrxCp0JftqwKjevQy937/s/3NWcMXNS
   MmJH8tGmn7IBAmcVkSiZ8mbfRhH5+0wMVeSHahKfNdDX8JMTAKXlbey+1
   XuNUzwZezsLlu9cRilllIVdu4ihyWKhwoch3iwKLlXU9Dn7BAHywG/xlj
   4E/gV4aiuwqga58cOOVLY3N2V4albYSMGYdq2XOc0/hamsNXX3j55NWOW
   A==;
X-CSE-ConnectionGUID: eAanq1eVTXOUoT69v9H9bQ==
X-CSE-MsgGUID: A9M690D+Rx2XxBbwUt0hbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98589143"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="98589143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:57:37 -0700
X-CSE-ConnectionGUID: VfpgGij3Slybsu0bsUJ1lQ==
X-CSE-MsgGUID: tNml0bI4T1+EY0bNE0X93Q==
X-ExtLoop1: 1
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:57:35 -0700
Date: Tue, 2 Jun 2026 11:57:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 7/7] ASoC: Intel: catpt: Cleanup components_kcontrols[]
Message-ID: <ah6a_OG6qSJ0lXJ4@ashevche-desk.local>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-8-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601141031.1606847-8-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 01, 2026 at 04:10:31PM +0200, Cezary Rojewski wrote:
> Fix alignment and drop redundant comments.

...

>  static const struct snd_kcontrol_new component_kcontrols[] = {
> -/* Master volume (mixer stream) */
> -CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
> -/* Individual volume controls for offload and capture */
> -CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
> -CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
> -CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
> -SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
> -		    catpt_loopback_mute_get, catpt_loopback_mute_put),
> +	CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
> +	CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
> +	CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
> +	CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
> +	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},

While at it, can't we simply do outside of this initialiser something like

static bool loopback_mute;

and here

	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&loopback_mute,

> +			    catpt_loopback_mute_get, catpt_loopback_mute_put),
>  };

-- 
With Best Regards,
Andy Shevchenko


