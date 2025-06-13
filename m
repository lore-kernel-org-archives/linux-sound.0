Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9829B233
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749808384; cv=none; b=APMtwrWoFjC4ypyoksmvIBfpHtHN/u5VHKjCwV0dx7kuyMZRlliYT6QeQeH5AyzIy83e5GNxEa5wB/0oGRX3Z4wRl78fCU9IrQKpWQU5/Ke8p0mjh9maynS8dOvsbqCNdr9p0xhpZhnw49HV5mY5CU95krvJSvsbWGd4/3wu2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749808384; c=relaxed/simple;
	bh=x62EadplCZWWsiLqnG3MrLqOBbJ0l5XToE1s9bI6e9E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6G08NPG7U/KyJqdojP+MVShazG9B0/S1ejXHquNXuwg71P8Xzw8HbSSm6/TTIftPO3toTm2jLpFndYew0HXQoIRGMNtvDLEjMsOHwgTmHdmnRmIc1KjIOUgwcg04WqhaXdkQDq+E2gwU6UadQ5cq7AGbF155EJT2RtW3CVVWmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hTMcXb8J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ewhLLmj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hTMcXb8J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ewhLLmj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hTMcXb8J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ewhLLmj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hTMcXb8J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ewhLLmj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A5D121999;
	Fri, 13 Jun 2025 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749808381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKeZgvkx7kTj0t5xUI/PYIHd7DiOi81o4Y/4g0AmZuk=;
	b=hTMcXb8JpCbYlA60rhC9UVdbfoPJMwvzg12NnfjiAEOGVE95L4zlm5JNgYCbsAK2ea76zu
	tuLUWYFgUNoLthFNjA1gPCgYHUK7/VnyWOrpQ59/vdBcpREtFID68uyDUg0odOWF0FLja6
	pp/MtYN07OBa1d2F0tbtxOskU97XCuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749808381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKeZgvkx7kTj0t5xUI/PYIHd7DiOi81o4Y/4g0AmZuk=;
	b=+ewhLLmjwq6cPkrjWlrfNI9Ckrvks0+XsAj+bFkbd+D9Rkf2tQOaW2Vz+50TKbZuvr409R
	ctux5J5uq1QUAFCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749808381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKeZgvkx7kTj0t5xUI/PYIHd7DiOi81o4Y/4g0AmZuk=;
	b=hTMcXb8JpCbYlA60rhC9UVdbfoPJMwvzg12NnfjiAEOGVE95L4zlm5JNgYCbsAK2ea76zu
	tuLUWYFgUNoLthFNjA1gPCgYHUK7/VnyWOrpQ59/vdBcpREtFID68uyDUg0odOWF0FLja6
	pp/MtYN07OBa1d2F0tbtxOskU97XCuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749808381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKeZgvkx7kTj0t5xUI/PYIHd7DiOi81o4Y/4g0AmZuk=;
	b=+ewhLLmjwq6cPkrjWlrfNI9Ckrvks0+XsAj+bFkbd+D9Rkf2tQOaW2Vz+50TKbZuvr409R
	ctux5J5uq1QUAFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A6B8137FE;
	Fri, 13 Jun 2025 09:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aoLjAP30S2jWQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 09:53:01 +0000
Date: Fri, 13 Jun 2025 11:53:00 +0200
Message-ID: <8734c4rmrn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix build with CONFIG_INPUT=n
In-Reply-To: <ef20f7e8-9d78-44df-9ee4-841e7634460e@collabora.com>
References: <20250613081543.7404-1-tiwai@suse.de>
	<ef20f7e8-9d78-44df-9ee4-841e7634460e@collabora.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Level: 

On Fri, 13 Jun 2025 11:37:38 +0200,
Cristian Ciocaltea wrote:
> 
> Hi Takashi,
> 
> On 6/13/25 11:15 AM, Takashi Iwai wrote:
> > The recent addition of DualSense mixer quirk relies on the input
> > device handle, and the build can fail if CONFIG_INPUT isn't set.
> > Put (rather ugly) workarounds to wrap with IS_REACHABLE() for avoiding
> > the build error.
> > 
> > Fixes: 79d561c4ec04 ("ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506130733.gnPKw2l3-lkp@intel.com/
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/usb/mixer_quirks.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > index a0ffe8b559dc..7cc27ae5512f 100644
> > --- a/sound/usb/mixer_quirks.c
> > +++ b/sound/usb/mixer_quirks.c
> > @@ -532,6 +532,7 @@ static int snd_emu0204_controls_create(struct usb_mixer_interface *mixer)
> >  					  &snd_emu0204_control, NULL);
> >  }
> >  
> > +#if IS_REACHABLE(CONFIG_INPUT)
> >  /*
> >   * Sony DualSense controller (PS5) jack detection
> >   *
> > @@ -788,6 +789,7 @@ static int snd_dualsense_controls_create(struct usb_mixer_interface *mixer)
> >  
> >  	return snd_dualsense_jack_create(mixer, "Headset Mic Jack", false);
> >  }
> > +#endif /* IS_REACHABLE(CONFIG_INPUT) */
> >  
> >  /* ASUS Xonar U1 / U3 controls */
> >  
> > @@ -4331,10 +4333,12 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
> >  		err = snd_emu0204_controls_create(mixer);
> >  		break;
> >  
> > +#if IS_REACHABLE(CONFIG_INPUT)
> >  	case USB_ID(0x054c, 0x0ce6): /* Sony DualSense controller (PS5) */
> >  	case USB_ID(0x054c, 0x0df2): /* Sony DualSense Edge controller (PS5) */
> >  		err = snd_dualsense_controls_create(mixer);
> >  		break;
> > +#endif /* IS_REACHABLE(CONFIG_INPUT) */
> >  
> >  	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
> >  	case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C400 */
> 
> I've seen the build issue report earlier today and planned to
> investigate, but you beat me to it, so thanks for the quick fix!
> 
> I reproduced the linker errors on a minimal kernel configuration with
> CONFIG_INPUT not being set and I confirm the build passes after applying
> the patch.
> 
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Thanks for confirmation.  Now queued.


Takashi
