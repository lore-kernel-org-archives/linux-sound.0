Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588201FF5E6
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 12:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141801; cv=none; b=AuV8QHyQpupncOpn9jHzXYurHMt5WSY4ZNmykZxxIfB5Aze7pmf+4e6r6uzKa7OSSnk/Z/MweXBGMCqv+StaAEQPUMgLSyeM84YPBFLYBj82hFL4RC9isYJSOlx/mR4OdwFweWHURQt+LUROJ19LMpL5S3p/39PlRTFKT/l1UZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141801; c=relaxed/simple;
	bh=0pfmklX+HqzTq2Mx+FMn+JiHEpY3rLVf3xLLCz4Y57U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wh8+iyRpC1LP3SP+rHdbNNmFVDO3uvHrg0oMAUEX4mPqhd+HKn/GCgAXdFh58PqDpf4+rjajPcZNw7XKFMGjtPcsWXt40trHfbmpNzAThF/99yWXjfVrpYF1rgxNee6hdPgW86QWzU/51QQJ6RNys0q/yM+shD6Ejp0pyyC3N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U6sTsa3n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qGax0j6g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U6sTsa3n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qGax0j6g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U6sTsa3n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qGax0j6g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U6sTsa3n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qGax0j6g"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 729D7211C6;
	Mon,  2 Dec 2024 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733141797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/uN5VruXdqRj+Ncyz5cR3G+bCx3+L019Bhl/FITbsk=;
	b=U6sTsa3nzuef/rscfv+20KPYEmLKQQyMPzWU3AsYd4HO77SB2Un1lnWLD5Yd7pe7LlF4m3
	4+5oqRec0H8vq7c4Mz7KpKMB4YAQEprC5jhUC1MHsbrclhnzwz38j+8kJRUn5xgMiE2/MW
	+USe/OkvqC138JXglCAUysbXc65ZAJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733141797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/uN5VruXdqRj+Ncyz5cR3G+bCx3+L019Bhl/FITbsk=;
	b=qGax0j6gehQzOPGOdEK2fR91sIPCsOtifYBecukaWmYcglOJWQjolfCP7ICtRLkQvpnOZd
	WCPf1Qlerzsp/EDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733141797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/uN5VruXdqRj+Ncyz5cR3G+bCx3+L019Bhl/FITbsk=;
	b=U6sTsa3nzuef/rscfv+20KPYEmLKQQyMPzWU3AsYd4HO77SB2Un1lnWLD5Yd7pe7LlF4m3
	4+5oqRec0H8vq7c4Mz7KpKMB4YAQEprC5jhUC1MHsbrclhnzwz38j+8kJRUn5xgMiE2/MW
	+USe/OkvqC138JXglCAUysbXc65ZAJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733141797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/uN5VruXdqRj+Ncyz5cR3G+bCx3+L019Bhl/FITbsk=;
	b=qGax0j6gehQzOPGOdEK2fR91sIPCsOtifYBecukaWmYcglOJWQjolfCP7ICtRLkQvpnOZd
	WCPf1Qlerzsp/EDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54AB813A31;
	Mon,  2 Dec 2024 12:16:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jFB5EyWlTWf0cQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Dec 2024 12:16:37 +0000
Date: Mon, 02 Dec 2024 13:16:36 +0100
Message-ID: <874j3mwa8r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Conner Knox <connerknoxpublic@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [bug report] ALSA: usb-audio: Add quirk to enable Avid Mbox 3 support
In-Reply-To: <47c421ab-f50a-486f-a7d9-da4df8afde1b@stanley.mountain>
References: <b53bc77b-6677-4dfc-b21b-77e725dc7541@stanley.mountain>
	<47c421ab-f50a-486f-a7d9-da4df8afde1b@stanley.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 02 Dec 2024 10:04:41 +0100,
Dan Carpenter wrote:
> 
> On Sat, Nov 30, 2024 at 01:01:49PM +0300, Dan Carpenter wrote:
> > Hello Conner Knox,
> > 
> > Commit b01104fc62b6 ("ALSA: usb-audio: Add quirk to enable Avid Mbox
> > 3 support") from Aug 18, 2022 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > sound/usb/quirks.c:1275 snd_usb_mbox3_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
> > sound/usb/quirks.c:569 snd_usb_extigy_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
> > sound/usb/quirks.c:944 snd_usb_mbox2_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
> > 
> > sound/usb/quirks.c
> >     1259 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
> >     1260 {
> >     1261         struct usb_host_config *config = dev->actconfig;
> >     1262         struct usb_device_descriptor new_device_descriptor;
> >                                               ^^^^^^^^^^^^^^^^^^^^^^
> >     1263         int err;
> >     1264         int descriptor_size;
> >     1265 
> >     1266         descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
> >     1267 
> >     1268         if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
> >     1269                 dev_err(&dev->dev, "MBOX3: Invalid descriptor size=%d.\n", descriptor_size);
> >     1270                 return -ENODEV;
> >     1271         }
> >     1272 
> >     1273         dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
> >     1274 
> > --> 1275         err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> >     1276                 &new_device_descriptor, sizeof(new_device_descriptor));
> >                          ^^^^^^^^^^^^^^^^^^^^^^
> > The comments in usb_fill_control_urb() say this has to be "suitable for DMA"
> > but this is stack data.  It has to be allocated with kmalloc() to be suitable.
> > 
> > I don't know why I'm only seeing this warning now two years later...
> > 
> 
> My script looks at the line number for the function and not for the buffer so it
> blamed the wrong patch.
> 
> Don't stress about this, I'll send a fix in a few hours.

Yep, the culprit is rather the recent fix commit b909df18ce2a:
  ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and
  Mbox devices


thanks,

Takashi
