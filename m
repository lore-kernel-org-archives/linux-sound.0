Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101D369991;
	Wed, 12 Aug 2026 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521023; cv=none; b=vC2J/X0JKPi1EKA1cr40JfaJ4u9NCarUenaM3tvsV+XZDupaewcMyi7VILWdDGcfKizLmUpsn7aXJi5zNtWqTJcUfEgg9bVSWJWjc5NE0Gl7rnmM7szEhsaD5y9AIpMjb5KbTnlEfe63oukFlkEXE4Km36MkAQpksgAqUGPf6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521023; c=relaxed/simple;
	bh=0M8EPOozk0baMwQ9QgOC3yhO1Np/yAQ4I+P4H+q1n30=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDsFLfMKBhYau4/GAittMZ342e8LFFcEXTwCoEzyUsbGHe/2ecLP7OCpNX9sjtQzHRNdwXU4zpRezUXArdFYdDocqqAJs2pN6XkC79ZJDIGp+joqCUL6aMMT43YngqRgilJgklxqcpgtBUCcr6DcN2WqcsUYYXLFI6hEdwn1u6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rYMg/PLb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=psyFg2Oq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TgPFOeW+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TQJWviWM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rYMg/PLb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="psyFg2Oq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TgPFOeW+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TQJWviWM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81AD082164;
	Wed, 12 Aug 2026 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786521015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q9YeOVBZugLiRHnBOuuDwP+5hlgTO1vNVII5mxTkWk=;
	b=rYMg/PLbDqryFc8YxfSkTMRobJCB03mKKR4oNRTqeHTNrr/CGuN075TVB04SLOQaSheye/
	vIvkfNRI39Pbb3G45IOIaARatVfdSv0eqhGFMOZYPfPpVVQuKQVkdauFJf2ZJ+1uVwGNn8
	bp75YkKFgPAs2uG6aK+PMzOfcvJLGCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786521015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q9YeOVBZugLiRHnBOuuDwP+5hlgTO1vNVII5mxTkWk=;
	b=psyFg2OqrXcm5c2zj1pPYbMnnIiFG9VElGrFmmNn2oebodVvb062jpnPobnrC4JifwmjIA
	urgyp/Mk0cK7NnAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TgPFOeW+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TQJWviWM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786521011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q9YeOVBZugLiRHnBOuuDwP+5hlgTO1vNVII5mxTkWk=;
	b=TgPFOeW+MjmsP8LGJUtGPCPudtPGBM8EPMKcwY6ogucjV5panmgQzFqoyjlSfN+HhFjarR
	zK7U4xlrbaEjGDp6bXw4dG3AZ85QAF5Fc/NQa2FZlxOzAanSl3bGaaz/tPBy9uyKCSDIPE
	RXHDWAlKcctS9X1t0BtWbzL6NmgvKJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786521011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q9YeOVBZugLiRHnBOuuDwP+5hlgTO1vNVII5mxTkWk=;
	b=TQJWviWMdR/5cFH+kX8v6+DGoyu1mn5f+E7p6gTAsSGZI/ST003JNsRtL4Wiy5Ktys75jl
	w5nHVxc96lgtnNBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 519CB779B1;
	Wed, 12 Aug 2026 07:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1Y+YErMlfGryHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 07:50:11 +0000
Date: Wed, 12 Aug 2026 09:50:10 +0200
Message-ID: <87a4qr22x9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: songxiebing <songxiebing@kylinos.cn>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/ca0132: replace sprintf() with snprintf()
In-Reply-To: <20260812082108.67db969b@pumpkin>
References: <20260812033030.635417-1-songxiebing@kylinos.cn>
	<20260812082108.67db969b@pumpkin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 81AD082164
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Wed, 12 Aug 2026 09:21:08 +0200,
David Laight wrote:
> 
> On Wed, 12 Aug 2026 11:30:30 +0800
> songxiebing <songxiebing@kylinos.cn> wrote:
> 
> > From: Bob Song <songxiebing@kylinos.cn>
> > 
> > Replace six sprintf() calls that write to
> > SNDRV_CTL_ELEM_ID_NAME_MAXLEN-sized buffers with snprintf() to avoid
> > potential buffer overflows.
> > 
> > Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> > ---
> >  sound/hda/codecs/ca0132.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
> > index 424224ef4621..d3ac29fd5780 100644
> > --- a/sound/hda/codecs/ca0132.c
> > +++ b/sound/hda/codecs/ca0132.c
> > @@ -5788,7 +5788,8 @@ static int ca0132_alt_mic_boost_info(struct snd_kcontrol *kcontrol,
> >  	uinfo->value.enumerated.items = MIC_BOOST_NUM_OF_STEPS;
> >  	if (uinfo->value.enumerated.item >= MIC_BOOST_NUM_OF_STEPS)
> >  		uinfo->value.enumerated.item = MIC_BOOST_NUM_OF_STEPS - 1;
> > -	sprintf(namestr, "%d %s", (uinfo->value.enumerated.item * 10), sfx);
> > +	snprintf(namestr, sizeof(namestr), "%d %s",
> > +		 (uinfo->value.enumerated.item * 10), sfx);
> >  	strscpy(uinfo->value.enumerated.name, namestr);
> 
> Why not snprintf() directly into uinfo->value.enumerated.name ?
> 
> >  	return 0;
> >  }
> > @@ -5840,9 +5841,9 @@ static int ae5_headphone_gain_info(struct snd_kcontrol *kcontrol,
> >  	uinfo->value.enumerated.items = AE5_HEADPHONE_GAIN_MAX;
> >  	if (uinfo->value.enumerated.item >= AE5_HEADPHONE_GAIN_MAX)
> >  		uinfo->value.enumerated.item = AE5_HEADPHONE_GAIN_MAX - 1;
> > -	sprintf(namestr, "%s %s",
> > -		ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
> > -		sfx);
> > +	snprintf(namestr, sizeof(namestr), "%s %s",
> > +		 ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
> > +		 sfx);
> >  	strscpy(uinfo->value.enumerated.name, namestr);
> >  	return 0;
> >  }
> > @@ -5894,8 +5895,8 @@ static int ae5_sound_filter_info(struct snd_kcontrol *kcontrol,
> >  	uinfo->value.enumerated.items = AE5_SOUND_FILTER_MAX;
> >  	if (uinfo->value.enumerated.item >= AE5_SOUND_FILTER_MAX)
> >  		uinfo->value.enumerated.item = AE5_SOUND_FILTER_MAX - 1;
> > -	sprintf(namestr, "%s",
> > -			ae5_filter_presets[uinfo->value.enumerated.item].name);
> > +	snprintf(namestr, sizeof(namestr), "%s",
> > +		 ae5_filter_presets[uinfo->value.enumerated.item].name);
> >  	strscpy(uinfo->value.enumerated.name, namestr);
> 
> That is silly, why is the sprintf() there at all?

Right, there are lots of rooms in this driver code for optimizations.
I took the patch for now as it's pretty idiomatic and safe, but we
should go for further cleanups.

Bob, are you interested in it?


thanks,

Takashi
