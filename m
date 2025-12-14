Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C1219EB
	for <linux-sound@vger.kernel.org>; Sun, 14 Dec 2025 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765698764; cv=none; b=dlzt0mtbAEN4kRwpilt6SdnPfuejJDVm0cdw+EMTssPNjAwjmpqkX7s3URkv+0FSwOzQGV4UV3wjhc1lSMgq/kq5zwJzLEvERXL9fnspC1nrkz3+aQy4hOImpaeyWOU25JzFwAr5cFKY6MxvZkCMAR7B700nooR+Cw0UowHU5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765698764; c=relaxed/simple;
	bh=yGq7BVcBBtjuE+pXWYlrOjhcYvgcQGyXhIChxlvBzQs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=riWZ81qTH40frDDcbP6UmgbK9oZw/vlBl+HhdCSGRJy6N1xD5XMUtRJqaGQ2iomkLuJ6A6KnNABgpOWXs6uyJnY8tYFuBufMSLDQQDxrnpC0geBTKQL/sfBlaWV8KvrIdw//q3tWHk8W+nO9g1JZgPvdHu5esx95va+7osduh9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rbPjnp88; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wQmjcVuc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SQV3fvzW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kcTqNg5s; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rbPjnp88";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wQmjcVuc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SQV3fvzW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kcTqNg5s"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1B8833763;
	Sun, 14 Dec 2025 07:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765698754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw8mDbj2eP6ODK/vd9F7gMILKUAJRATow274Rgg/SGg=;
	b=rbPjnp88BBdQD33gVGA4UwJCaUiaPrLC/cXWXDua2t+JwMxrK4SWKl3HX3AzXaimshnxpL
	lA2bcDFxhPnQgfXs3zL4Zrs3LSOOYVWfkAMJpJQYXIb/ywpYYy+LNKJ7GP4DscgJYlIqwT
	dDSGzp7WYusImAJLVZSezafr2IQpSY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765698754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw8mDbj2eP6ODK/vd9F7gMILKUAJRATow274Rgg/SGg=;
	b=wQmjcVuccnfLIOvjB/S1VBjw6qievlOBhoXXYWY8wtpH87goG0WDZuzN7pEtrokNp4Bh3J
	1yJl2ANEpJuuCVBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SQV3fvzW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kcTqNg5s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765698752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw8mDbj2eP6ODK/vd9F7gMILKUAJRATow274Rgg/SGg=;
	b=SQV3fvzWGM5yhJ2aMQ44UXVx8e3H97mLMq+ZhJECRqYSbcuHri4HmVHXipBNu8U5VK8ANG
	g2aTGaIQUvXeDk/VKCnmXUGtsW7yoI5baVFI9HoVk8+q8Y47DuM0Bde5l1cRqt/FKO37ZP
	z5/TdS1avVZ7ep532cNdwEwk/YnLlaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765698752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw8mDbj2eP6ODK/vd9F7gMILKUAJRATow274Rgg/SGg=;
	b=kcTqNg5sPv3+EhnHZe+9R6/niITr00gkhktQAkiGxxF7q7YP7WV2mkoYhx2JgXIEPBEUuc
	gL+0H1mzYXL7fUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A024C3EA63;
	Sun, 14 Dec 2025 07:52:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zp0/JcBsPmnXJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Dec 2025 07:52:32 +0000
Date: Sun, 14 Dec 2025 08:52:32 +0100
Message-ID: <87fr9d8pq7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Junrui Luo <moonafterrain@outlook.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH v2] ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
In-Reply-To: <20251214015741.GA665386@workstation.local>
References: <SYBPR01MB7881452C84016B3F21975947AFA2A@SYBPR01MB7881.ausprd01.prod.outlook.com>
	<20251214015741.GA665386@workstation.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: D1B8833763
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	FREEMAIL_CC(0.00)[outlook.com,suse.de,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,outlook.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Sun, 14 Dec 2025 02:57:41 +0100,
Takashi Sakamoto wrote:
> 
> Hi,
> 
> Sorry for my late reply, but I always postpone my review work during the
> merge window.
> 
> On Mon, Dec 08, 2025 at 08:09:09PM +0800, Junrui Luo wrote:
> > The DSP event handling code in hwdep_read() could write more bytes to
> > the user buffer than requested, when a user provides a buffer smaller
> > than the event header size (8 bytes).
> > 
> > In the put_user() loop that copies event data, when the user buffer
> > size is not aligned to 4 bytes, it could overwrite beyond the buffer
> > boundary.
> > 
> > Fix by:
> > - using min_t() to clamp the copy size
> > - Adding a bounds check before put_user()
> > 
> > This ensures we never write more than the user requested.
> > 
> > Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > ---
> > Changes in v2:
> > - Also fix the similar issue in the put_user() loop suggested by Takashi Iwai
> > - Link to v1: https://lore.kernel.org/all/SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com/T/#u
> > ---
> >  sound/firewire/motu/motu-hwdep.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Indeed, I admit my below lines are enough rough. Thanks for your correction.
> 
> > diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
> > index 981c19430cb0..89dc436a0652 100644
> > --- a/sound/firewire/motu/motu-hwdep.c
> > +++ b/sound/firewire/motu/motu-hwdep.c
> > @@ -75,7 +75,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
> >  		while (consumed < count &&
> >  		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
> >  			ptr = (u32 __user *)(buf + consumed);
> > -			if (put_user(ev, ptr))
> > +			if (consumed + sizeof(ev) > count || put_user(ev, ptr))
> >  				return -EFAULT;
> 
> I think it is too strong when there is no rest to store the event data
> after filling some events on the given buffer. Let us move the size
> check to the loop condition? Like:
> 
> ```
> while (consumed + sizeof(ev) < count &&
>    snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
>     u32 __user *ptr = (u32 __user *)(buf + consumed);
> 
>     if (put_user(ev, ptr))
>         return -EFAULT;
> 
>     consumed += sizeof(ev);
> }
> ```
> 
> We can guarantee the space for one event at least in every iteration of
> loop.
> 
> >  			consumed += sizeof(ev);
> >  		}
> > @@ -83,10 +83,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
> >  		event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
> >  		event.motu_register_dsp_change.count =
> >  			(consumed - sizeof(event.motu_register_dsp_change)) / 4;
> > -		if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
> > +		if (copy_to_user(buf, &event,
> > +				 min_t(long, count, sizeof(event.motu_register_dsp_change))))
> >  			return -EFAULT;
> >  
> > -		count = consumed;
> > +		count = min_t(long, count, consumed);
> >  	} else {
> >  		spin_unlock_irq(&motu->lock);
> 
> In my opinion, if there is no space for data header, the overall copying
> should be canceled in advance, thus:
> 
> ```
> } else if (has_dsp_event(motu)) {
>     size_t consumed = 0;
>     u32 ev;
> 
>     spin_unlock_irq(&motu->lock);
> 
>     if (count < sizeof(event.motu_register_dsp_change))
>             return 0;
> 
>     // Header is filled later.
>     consumed += sizeof(event.motu_register_dsp_change);
>     ...
> ```
> 
> (In the case of failure to access to userspace for the data header, the
> underlying layer for register DSP event should have peek/ack mechanism,
> however I'm too lazy...)

It's a question of API design, after all.  If the size shortage
shouldn't be  treated as an error, it can be as your suggestion.
Feel free to submit the change :)


thanks,

Takashi
