Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0971D1E78
	for <linux-sound@vger.kernel.org>; Sun, 17 Nov 2024 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731852030; cv=none; b=lOYQrXg5/ReXffVGe7yHmsez9OG5lv71CWhPdmxXRy8bCxvfayZClvewgop3OS2ukXtf1S+BbcsAmbJ1PsmyzUS7Vu591otULg1kWqvXQmPz7WdumNjZtZiGTTwgK/iNgR3sA1byeVej57I8rTl48hTCHK/vLCyPv6A7bfUjkKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731852030; c=relaxed/simple;
	bh=VsxmJmGA9GSRcwmca06SuS0sr94FqNuW4clXCIJiF1o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7TJ1R4gdtIwwBOWZm87EqxE1dPqYuAgz+x2DW6qxUOnFY7rFPHNZovNwd5DI3LA23Z9SZhqvzaBWSBO3Ox88vbImYeMqfI3ZvWJW+2kg6jHG2/oaDm5ZtNjWWdY0hG4xt2/Imyvwnu3bJ3EonbpMdw0NIGAzVFPK+gOjJj2T7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pow2Q7zh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dJt+HbB7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RLjsXT6h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vHbiUUyE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pow2Q7zh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dJt+HbB7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RLjsXT6h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vHbiUUyE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7780721219;
	Sun, 17 Nov 2024 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731852026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=to3UbYadeu/k5CUI+M43gaUG90KB2T28gdxcVPNYenA=;
	b=pow2Q7zh/sOtVLVneR3m/px8gGvku4Pv6Xn+LMKexK/jKJBEbWTFhQuZ4TQ3HDtAFVPCzY
	XMVfzdImC6VURZTRulwDBPa2xNhhwgTpIe6dN2j0UXx5bov4Z6F7vKK3whpIhQZLriHLsI
	vDWOPgm/RxvaC6tFyD0HYwRVUmimCOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731852026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=to3UbYadeu/k5CUI+M43gaUG90KB2T28gdxcVPNYenA=;
	b=dJt+HbB7If4axKE/QQLQ2qtzKB3M9f0RxCVRDwRS8NIm9Qpt93QJzOummdleskF29OrVE8
	u07tAyh4ryRVK8CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731852025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=to3UbYadeu/k5CUI+M43gaUG90KB2T28gdxcVPNYenA=;
	b=RLjsXT6hEPrtWR/SCq/X2Irr6CqmHJopBZEjpGT53M6K3nbGydIISSHrh2p1oj+I3BKlTW
	9neaqcCSV5ifeDcnFCu4j7COHUOfwhvzzzNKn34+e0gfm79l0QO2SrdzwVYriWsxXVRHFc
	WFdXQSClwIAN9r5aE7Yhfk0VVi08ov8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731852025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=to3UbYadeu/k5CUI+M43gaUG90KB2T28gdxcVPNYenA=;
	b=vHbiUUyEmjz2lSt8DBYc0OQe2qBMsxY5BvOQm+8OSKZ7o6BS8D8/vMHwA/BZB08yJyH4gy
	450SvLKxh5PmNqBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D725136D9;
	Sun, 17 Nov 2024 14:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eMeADfn2OWfidgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 Nov 2024 14:00:25 +0000
Date: Sun, 17 Nov 2024 15:00:24 +0100
Message-ID: <87h686q7t3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Benoit Sevens <bsevens@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lianqin Hu <hulianqin@vivo.com>,
	Manuel Barrio Linares <mbarriolinares@gmail.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy devices
In-Reply-To: <20241115130833.1077260-1-bsevens@google.com>
References: <20241115130833.1077260-1-bsevens@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vivo.com,gmail.com,kylinos.cn,vger.kernel.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 15 Nov 2024 14:08:33 +0100,
Benoit Sevens wrote:
> 
> A bogus devices can provide a bNumConfigurations value that exceeds the
> initial value used in usb_get_configuration for allocating dev->config.
> 
> This can lead to out-of-bounds accesses later, e.g. in
> usb_destroy_configuration.

It'd be more helpful if you can elaborate how it can happen; the code
you touched doesn't call much stuff, just send a boot sequence and
reset the configuration.  Yet your patch tries to overwrite a
usb_device field, which isn't really a task for the driver side.


thanks,

Takashi

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@kernel.org
> Signed-off-by: Benoit Sevens <bsevens@google.com>
> ---
>  sound/usb/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index c5fd180357d1..970d36d13ad8 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -555,6 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
>  static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interface *intf)
>  {
>  	struct usb_host_config *config = dev->actconfig;
> +	int num_configs;
>  	int err;
>  
>  	if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_OLD ||
> @@ -565,8 +566,11 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
>  				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
>  		if (err < 0)
>  			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
> +		num_configs = dev->descriptor.bNumConfigurations;
>  		err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
>  				&dev->descriptor, sizeof(dev->descriptor));
> +		if (dev->descriptor.bNumConfigurations > num_configs)
> +			dev->descriptor.bNumConfigurations = num_configs;
>  		config = dev->actconfig;
>  		if (err < 0)
>  			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> -- 
> 2.47.0.338.g60cca15819-goog
> 
