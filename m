Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22984153BF3
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708622653; cv=none; b=VYJ71SwNodZY6sSOKDLfCVm+M6Kqvv7g/Cu6768DUnNFebdIX50O9plErqnO6XO2v4DkXc0YPEWlP7mUNxgYhYHJ7+sqlo/zdjtuaNlSRV+sQzWYAGyzcaOhj6BsgDgcOM5Vj5dthQRTUSBXvf62N+n6QDsI7V4KHfDVAjNTajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708622653; c=relaxed/simple;
	bh=O3uHuGWYyUwgjvH7biobNF6h6KtGzRh7j+XvF7DazPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hw4f9AaK7Y9z5PD/JTzvGK8pl+eCV0vF3uVvVo081IGXKxk72jThqnHfX7Pv063EMgHBed1VoD3ErhCPJnPsd1hML4087t1ErP2Ba2GwF7ukTLQj3yip5k2UtvYggMGfhZ5Nn5wsEpv+ZfFJ7iwem9FurCyVb6OHng2n3YwGktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDucSesx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDucSesx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708622653; x=1740158653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O3uHuGWYyUwgjvH7biobNF6h6KtGzRh7j+XvF7DazPI=;
  b=CDucSesxKwVvDZehG/MePtl+j+dPDfWfN4mE7hT5hW5Fi7dNh/34cDup
   CC8UgvDT3JvzFFiQ9o0W1rPFZWoYMbWeHKlduXZVHlfmZTgMi+TguRD7I
   WgcMmwpxIBXiNwDN0OHwi4xuuQY9dyxE0jYttj6pxzLTqGQZTpqXObGdj
   Cd1Z9otc+95RxE1d1c0UBPwMbAOlGgql7++sjpt3/05C4aH/M//cxUwmE
   JgPCRy/ngEYM+aUsspEoqe40YHZgjM9GnW2MvQ7jWirmmomaLf2Qltg91
   Z32WMV//8Poz9aAilb0dwE2+AGb6Z6JQ5FSI8VWU5E+xW63Hoik3agJDK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14286954"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="14286954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 09:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827577568"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="827577568"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 22 Feb 2024 09:24:06 -0800
Received: by stinkbox (sSMTP sendmail emulation); Thu, 22 Feb 2024 19:24:05 +0200
Date: Thu, 22 Feb 2024 19:24:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based
 platforms
Message-ID: <ZdeDNT5jCgXAP16Z@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
 <20240222170614.884413-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222170614.884413-2-cezary.rojewski@intel.com>
X-Patchwork-Hint: comment

On Thu, Feb 22, 2024 at 06:06:11PM +0100, Cezary Rojewski wrote:
> Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
> removed support for i915 for all CNL-based platforms. HDAudio library,
> however, still treats such platforms as valid candidates for i915
> binding. Update query mechanism to reflect changes made in drm tree.
> 
> At the same time, i915 support for LKF-based platforms has not been
> provided so remove them from valid binding candidates.
> 
> Link: https://lore.kernel.org/all/20210728215946.1573015-1-lucas.demarchi@intel.com/
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/drm/i915_pciids.h |  4 ++++
>  sound/hda/hdac_i915.c     | 18 +++++++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index fcf1849aa47c..04172b541ee7 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -582,6 +582,10 @@
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info)
>  
> +/* LKF */
> +#define INTEL_LKF_IDS(info) \
> +	INTEL_VGA_DEVICE(0x9840, info)
> +
>  /* EHL */
>  #define INTEL_EHL_IDS(info) \
>  	INTEL_VGA_DEVICE(0x4541, info), \
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 365c36fdf205..07861f9fc491 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -6,6 +6,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <drm/i915_pciids.h>
>  #include <sound/core.h>
>  #include <sound/hdaudio.h>
>  #include <sound/hda_i915.h>
> @@ -127,15 +128,26 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>  /* check whether Intel graphics is present and reachable */
>  static int i915_gfx_present(struct pci_dev *hdac_pci)
>  {
> +	/* List of known platforms with no i915 support. */
> +	static struct pci_device_id denylist[] = {
> +		INTEL_CNL_IDS(NULL),
> +		INTEL_LKF_IDS(NULL),
> +		{ 0 }
> +	};

I thought these don't actually exist in the wild?

>  	struct pci_dev *display_dev = NULL;
>  
>  	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
>  		return false;
>  
>  	for_each_pci_dev(display_dev) {
> -		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
> -		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
> -		    connectivity_check(display_dev, hdac_pci)) {
> +		if (display_dev->vendor != PCI_VENDOR_ID_INTEL ||
> +		    (display_dev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
> +			continue;
> +
> +		if (pci_match_id(denylist, display_dev))
> +			continue;
> +
> +		if (connectivity_check(display_dev, hdac_pci)) {
>  			pci_dev_put(display_dev);
>  			return true;
>  		}
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
