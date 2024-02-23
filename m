Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B081AD2
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699809; cv=none; b=bX+ib3PNggvh9XMXl9+58JBdTl1Sj/CkSd9lRLCF9YLgFgE0WHIr39Myt7RORKefou6ynMeNPfatPOt3krEiWPr6El7AHqXN9rxtNJfrNVwmBQeCFY8Icc+mTfi0RSwRXv20zp9StZ1ttY1ARvMCNe8iWhoY/EaH0FeFu2oGmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699809; c=relaxed/simple;
	bh=ZHMRCL/USoNuXmlcg1B2bxpVq7YuRIiljBBwqbSTQHk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h14Fm7IS6miYDylfw45NDASfI5IHqXzC1iQsts8AMgyYHiFRotXivzROUiw/Kfe1QHvGyTCZaeaaLGlSTnAc48I2WCSWlsf+ONC78u47K8DPkGcUiLc+6F5/HDdR/reYTmpakT5jbhz15rp/svPA3ubYaVIX93HUuXg7KHbqfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePxqFOng; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WIcC01iy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePxqFOng; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WIcC01iy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePxqFOng";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WIcC01iy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePxqFOng";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WIcC01iy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41EDB221BA;
	Fri, 23 Feb 2024 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708699805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=ePxqFOngBvr8XRJJ8iI73u4U2zdvnPJBgItLRrF0VBNAjHP9P2h2ZdMy3BUfcy56BmefGs
	+X8GZ4vRHE9L8wHjPlfZHu2aymVZgBWMV2E9C7aRanlH8ilZsxOQ3lK7K83OT5+QvkiLLd
	kdGinvMUYDZ+6AK6M7Ez3/qaJLLlkA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=WIcC01iyCn2a9glzrhC7x4wjfgZ6cWTjgunVGqHgq0lleo6dQvVRrVw2Cj0334PEsMQsDJ
	c9mbLA9ZdaHd2ODQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708699805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=ePxqFOngBvr8XRJJ8iI73u4U2zdvnPJBgItLRrF0VBNAjHP9P2h2ZdMy3BUfcy56BmefGs
	+X8GZ4vRHE9L8wHjPlfZHu2aymVZgBWMV2E9C7aRanlH8ilZsxOQ3lK7K83OT5+QvkiLLd
	kdGinvMUYDZ+6AK6M7Ez3/qaJLLlkA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=WIcC01iyCn2a9glzrhC7x4wjfgZ6cWTjgunVGqHgq0lleo6dQvVRrVw2Cj0334PEsMQsDJ
	c9mbLA9ZdaHd2ODQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C95A5133DC;
	Fri, 23 Feb 2024 14:50:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v4OuL5yw2GUpGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 14:50:04 +0000
Date: Fri, 23 Feb 2024 15:50:04 +0100
Message-ID: <87msrr2q1v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH v2 0/4] ALSA/ASoC: Conditionally skip i915 init and cleanups
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[29.61%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.90

On Fri, 23 Feb 2024 12:46:22 +0100,
Cezary Rojewski wrote:
> 
> A small set of changes to improve initialization of the audio stack on
> HDAudio devices and pair of cleanups.
> 
> As the first change is the most important one here, following is the
> technical background for it:
> 
> Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
> removed support for i915 for all CNL-based platforms. HDAudio library,
> however, still treats such platforms as valid candidates for i915
> binding. Update query mechanism to reflect changes made in drm tree.
> 
> At the same time, i915 support for LKF-based platforms has not been
> provided so remove them from valid binding candidates.
> 
> The snd_soc_hda change is a follow up for the above and the cleanup
> patches do not bring any functional changes.
> 
> Changes in v2:
> - list of problematic VGA devices is now declared locally, no more
>   touching drm stuff
> 
> Cezary Rojewski (4):
>   ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
>   ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
>   ASoC: codecs: hda: Cleanup error messages
>   ALSA: hda: Reuse for_each_pcm_streams()

As far as I see, all those 4 patches are rather individually
applicable, right?
The essential change is the first patch, and the patch 2 is rather an
improvement (the driver gives -ENODEV as of now).
And the rest two are merely cleanups.


Takashi
