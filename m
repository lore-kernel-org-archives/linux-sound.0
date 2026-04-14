Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544C1A681B
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170797; cv=none; b=ZVRAcTq+Dtj8MAejab+FthcRm9TlX9jrZUufJR+CgqJ3w3HMvDVmUit+k992s0uZfD1MpwRe6+JpnxrQyJFcptVnAlDNkAGPPwDz5W0svIe/2z0mMjlqjYtvqiBh+9qZtcEwPvVupXLyIGxjjkoPK5qpv8+tZ7lKEYBLgGfYGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170797; c=relaxed/simple;
	bh=5KbtOu4Z4oRI7V8O9+vZbFrHTBC7tClNZEtE/BWKtaA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CcZTfOn7gBdsbAfeEYRPOyh8gQanCWH5yMfR8PxTct3hgIjXqJndwS/xgACfPvQZA0H+9MNn2qqb9IBuXBCauYfcQOPTT+TychBonuT74x76FPggT7GIk1QWf3V+1+ei38xLMRIU1vvXNhDCqqYKOteM7zDUqZljIY9mblHBqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lADZYXKV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/OohrSoZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lADZYXKV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/OohrSoZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lADZYXKV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/OohrSoZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lADZYXKV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/OohrSoZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A073E5BDC6;
	Tue, 14 Apr 2026 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776170794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jILoBgHzUVrworLFFhrOkYIcUNfCXHuDp/eqhCKFFy8=;
	b=lADZYXKVwwZk3eOAS6lbeq4ASK3IIECKfr2AMVGVxz4lIo0FyFqNa+CI5UOZnvm+KTExEG
	oJ6C4G/dR04kj38RqCifn68wA0evYRP0GQVyRSfVx++oRo7dHE0dzDKFbGXeOCFlAYyzTI
	0KNBoV1EyTSimpzovsHk1MZdj+NZ530=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776170794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jILoBgHzUVrworLFFhrOkYIcUNfCXHuDp/eqhCKFFy8=;
	b=/OohrSoZlpQ7iRbVE3stUQZAGPFy7pXCgTIzJUcnAgsT7zsdnULGSRJDEDXqSgnblgR1no
	i0q3vHmucr/9CwBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lADZYXKV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/OohrSoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776170794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jILoBgHzUVrworLFFhrOkYIcUNfCXHuDp/eqhCKFFy8=;
	b=lADZYXKVwwZk3eOAS6lbeq4ASK3IIECKfr2AMVGVxz4lIo0FyFqNa+CI5UOZnvm+KTExEG
	oJ6C4G/dR04kj38RqCifn68wA0evYRP0GQVyRSfVx++oRo7dHE0dzDKFbGXeOCFlAYyzTI
	0KNBoV1EyTSimpzovsHk1MZdj+NZ530=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776170794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jILoBgHzUVrworLFFhrOkYIcUNfCXHuDp/eqhCKFFy8=;
	b=/OohrSoZlpQ7iRbVE3stUQZAGPFy7pXCgTIzJUcnAgsT7zsdnULGSRJDEDXqSgnblgR1no
	i0q3vHmucr/9CwBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79FD84B455;
	Tue, 14 Apr 2026 12:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Bh9/HCo33mlUFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 12:46:34 +0000
Date: Tue, 14 Apr 2026 14:46:34 +0200
Message-ID: <878qapso9h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix missing error handling for get_min_max*()
In-Reply-To: <8768d96b83029325707a43904766651a3e4de362.camel@rong.moe>
References: <20260414093336.305464-1-tiwai@suse.de>
	<8768d96b83029325707a43904766651a3e4de362.camel@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A073E5BDC6

On Tue, 14 Apr 2026 14:17:28 +0200,
Rong Zhang wrote:
> 
> Hi Takashi,
> 
> On Tue, 2026-04-14 at 11:33 +0200, Takashi Iwai wrote:
> > The recent fix to add the error return value check from get_min_max*()
> > missed one case in build_audio_procunit() where no error value is set.
> > This may lead to an uninitialized variable and confuse the caller
> > (although this wouldn't happen practically because err is set for the
> > loop of num_ins at the beginning of the funciton).
> > 
> > Fix it by setting "err = 0" properly at the missing case, too.
> > 
> > Fixes: 4f55a85cd4fc ("ALSA: usb-audio: Add error checks against get_min_max*()")
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/ad36dGpCBTGsyFr_@stanley.mountain
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/usb/mixer.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index d4ef45bf53d7..aa6ea3be100a 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -2687,6 +2687,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
> >  				cval->max = control_spec[0];
> >  				cval->res = 1;
> >  				cval->initialized = 1;
> > +				err = 0;
> 
> Whoops, it's my fault that I didn't noticed the code path.
> 
> I think we can make the UAC_PROCESS_UP_DOWNMIX case fall through the
> default case so that we can move the error check into the latter and get
> rid of all `err = 0'. Doing so also improves readability and prevents
> similar mistakes in future changes. Perhaps I should have done this in
> my previous refactoring patch...
> 
> I just noticed that you've applied this patch to your tree. If my
> proposed refactor makes sense to you, I will send a patch for it.

That was my another idea, too.  OTOH, I thought handling the success
error code explicitly makes it clearer that the code handles it.

It's pretty nuance, and I'm open for either option, so feel free to
submit a cleanup patch on the top.


thanks,

Takashi
