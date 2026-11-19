Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106014;
	b=bdYuWBLGwkzqq72EEjtXrqiT7YUE0N8SE98J0l/09M+NwHUrzOFZx8RSwZW0VkIlrypp
	 11uJa/3VRFW29+eG9HxinvFD2BC4r5xzP/ZproBTAap6y83TkjIY4f4Hc+34eQB3Io4w9
	 IKJVzFnPhFyZRjEdQxcGtH9Y4V0oQsl2D3Jnov1IFJU3uwqj2HGoV80iUQvJXhuid9CeO
	 mbdnJB+QSw21nOklRQYvxQbo2Ivh7YV6GBFIR8FFUup/pGtrksoMaPH4ySvGcNBcy2sJ/
	 f3cGOXhINuvoNIhGI5y4wqrQvDRE0+GaaVEPOmZLItOkcXog1nVZQnk1GG4EAawkK6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106014;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=MnqdMlsMyoHo/aeHf2HFxQk8pjQB8y9HqpPfMquVksw=;
	b=pjQnbBspKCDRHM7Jt3eV7xObwW2edfztMUd6uANabIRT42kHFwfZZxUK3ZHocIgz7odp
	 NvLyxnskTaHtUZNuoCAMfGCb+gAWLrgtxL1NjFRpqf8+jf9QTaniEl4yvVGZT4EpRzjCP
	 1x7pno2h8yXE4JmB0ZxAhw6ukCI8237zKAxAm+nhsZuvSiNAziKfrjB6NHCcocy0OGR13
	 snegHSG9vaaGWquDaunognAFcHzwo6GugkjWMz+9gkfvsYgj1LpkidUXtT0uQ1MUd0HC8
	 YYwB9gFn32WZBx0xNycnLUajWistwcyF/qU6JJDwRHrmG4Cm9Vbwl5LQZ9/uXcNj3pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QeRe5Iaq;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A25606A325
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A25606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QeRe5Iaq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106013; x=1826642013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SvZcvblxlqvNXaDNrdgGKTrIiqru0qCO/BoBUiT9+PY=;
  b=QeRe5IaqiNfrb0sE1GE1JCIevX0HHhia/4RG88h2x9L6KpBuDCYL9Twt
   ruyyjarkvr1MwXaHbWap+HMEv6NQsWUmS/bGe8XnCJu4mVty700TuSO6+
   UHZ4Dp3aAyv184ngWOLjr82Vs2qtZyu8UOCWMd1YM053bmT35k9Qu20b0
   pxNb/RbXrRZCGk9SxoLjhKLMd9bE1Va/X2F/ja6PWvOjpwzWUm5b0Jn2Q
   UyrkQfFM1H8OmYvVu04ct+F7SCOJYAhroaL9ct4cuP+TpHWzogageHyFC
   FnG/R0mIoxGrVtc9qy2E7m7brFyZ82WgRx8ZXvL6jUgYgfSUyYHL/a+FT
   A==;
X-CSE-ConnectionGUID: v84ohSINRMCqyIkxde+oIA==
X-CSE-MsgGUID: 8QSbiNOxSv2wTdQ9AlwKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3998444"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3998444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:33:33 -0800
X-CSE-ConnectionGUID: nhot5MnpQuO5eN7iUI0T1A==
X-CSE-MsgGUID: E4U10gDSSL27aeVIRu+oyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10505638"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:33:31 -0800
Date: Thu, 19 Nov 2026 17:32:54 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Michal Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH] ALSA: hda: intel: Release i915 component when delayed
 probe fails
Message-ID: <7e2ix26eed3ocen42w6txv5pzz557xjhwixsqjhtsrmcs4omki@7ld7wxz6c7nm>
References: <20261119162253.1779252-1-kai.vehmanen@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119162253.1779252-1-kai.vehmanen@linux.intel.com>

On Thu, Nov 19, 2026 at 06:22:53PM GMT, Kai Vehmanen wrote:
> Commit fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe
> work") stopped freeing the card from azx_probe_work() when the delayed
> probe fails, and only disconnects it, leaving the free to azx_remove().
> This avoids the double free, but the resources that were released by
> the card free via azx_free() are now kept until the PCI device is
> unbound. In particular the display power reference and the audio
> component binding to the graphics driver stay held for a controller
> that will never become operational. This blocks unloading of the i915
> driver, which breaks display driver reload.
> 
> Release the display power and the i915 audio component in the probe
> work error path. Both snd_hdac_display_power() and snd_hdac_acomp_exit()
> are safe to repeat, so the later azx_free() call from azx_remove() is
> not affected. azx_free() can't be called directly here as it would
> run before the codec instances are released by the card free.
> 
> Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17751
> Reported-by: Michal Grzelak <michal.grzelak@intel.com>
> Tested-by-by: Michal Grzelak <michal.grzelak@intel.com>

nitpick: s/Tested-by-by:/Tested-by:/

:)

BR,
Michał

> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  sound/hda/controllers/intel.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 0a62723b3454..73ff42faccb7 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -1740,9 +1740,21 @@ static void azx_probe_work(struct work_struct *work)
>  	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
>  
>  	if (azx_probe_continue(&hda->chip, false) < 0) {
> +		struct azx *chip = &hda->chip;
> +
>  		hda->init_failed = 1;
>  		complete_all(&hda->probe_wait);
> -		snd_card_disconnect(hda->chip.card);
> +		snd_card_disconnect(chip->card);
> +
> +		/*
> +		 * The card itself is left to azx_remove() to free, but the
> +		 * graphics driver must not be kept bound to a controller that
> +		 * will never become operational; this would e.g. block
> +		 * unloading i915. Both calls are safe to repeat from azx_free().
> +		 */
> +		display_power(chip, false);
> +		if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT)
> +			snd_hdac_i915_exit(azx_bus(chip));
>  	}
>  }
>  
> 
> base-commit: ec925d3740159f4b4bd3b7640be5d0d2b4664106
> -- 
> 2.43.0
> 
> 
