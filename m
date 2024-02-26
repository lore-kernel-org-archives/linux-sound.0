Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED55DDA3
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944044; cv=none; b=cIiRcImoQRFchaab8OUFgVU84xqyeCLZBbbwx6T+Fgi0Fe7yXG9VYKaGTO6NYs+IipBellTl4SgsMxGRmaCH6Ta0fxkQU1WjfSfrnO+krUvBX43csqOkRdeZQFCWPYP8wXv0Ajm48cYq4HbPCrkwdRBle/YmYK9OO3z4uuYW90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944044; c=relaxed/simple;
	bh=DaawKgzre8sRBX+LnD3mVhbEc25B3Gz5fzha4m6cLRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVzwoi3bBj98fBsLMMNG50QFyGi/0iXe+SS0vxn3GEIM6IajIxDTGcCSHZiAtE34lW6ZYGZM63OYFINwzLqNBfOUP4hfjnhMjL8FRbzzoWCTiYndumJitf+lv2hMQP8n+vlwEcq9Wxdp+oIFGC1KVRpXhTC9cX292yfGhnwHLIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7pxcFAP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7pxcFAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708944041; x=1740480041;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=DaawKgzre8sRBX+LnD3mVhbEc25B3Gz5fzha4m6cLRg=;
  b=l7pxcFAPCvMrBCYSAF4i6/5622Sc9M7Ds0W5/iQ+xFhMeixFz/Nr/7ia
   8Vs0ylJm6ef6YYKxcXiFRb5fCoLl7BRLIKK3BFCl7K15amgogO7+8wSJz
   IXpt4ZgxhlJNiv/blyfgV4Ikkbgv42sUd6Lo6a12+QMczmcaYrlLWAzfc
   D1F5NScRy9UBYsPJztwZXVDQ37Tym6jiijUw97UubJAwa6LI3J1mkJvpG
   9zPbKAjFLw4sCCRbQ4pi05INnHfP76RN6YnTuiT7+7QOVhZPTexSP+wqV
   228Ji4hU/LhyqwtreNfoDUWr/2WbQI4N+6YvdLvhIWjF6eF/OtSAGY6m4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13772063"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="13772063"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11398714"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost) ([10.252.46.254])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:40:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 intel-gfx@lists.freedesktop.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, Cezary Rojewski
 <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 1/4] ALSA: hda: Skip i915 initialization on
 CNL/LKF-based platforms
In-Reply-To: <20240223114626.1052784-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
 <20240223114626.1052784-2-cezary.rojewski@intel.com>
Date: Mon, 26 Feb 2024 12:40:34 +0200
Message-ID: <87plwjo6e5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 23 Feb 2024, Cezary Rojewski <cezary.rojewski@intel.com> wrote:
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
>  sound/hda/hdac_i915.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 365c36fdf205..afee87bd0f2e 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -127,15 +127,41 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>  /* check whether Intel graphics is present and reachable */
>  static int i915_gfx_present(struct pci_dev *hdac_pci)
>  {
> +	/* List of known platforms with no i915 support. */
> +	static struct pci_device_id denylist[] = {

This should be const to place it in rodata, it doesn't need to be
mutable.

> +		/* CNL */
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), 0x030000, 0xff0000 },
> +		/* LKF */
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), 0x030000, 0xff0000 },
> +		{ 0 }

Nitpick, prefer {} over { 0 }.

BR,
Jani.

> +	};
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

-- 
Jani Nikula, Intel
