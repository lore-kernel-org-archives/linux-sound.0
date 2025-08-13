Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D561F582E
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101727; cv=none; b=NGEFg3k2IIu5SOc5cGDKw8sLXp6BluFUI/dRcrrWALLF71StU8VHob6+WPUCFSJfcfUNLFq6EzmLX1AzY8zkjb+sn1hWbM7OiEeL6xRXjOc1Wpr+m0jxIQM1JUF3EsNWYO/FxI6Bs6B+9Q7ynQrmO4Exjp5h2WcdRoPtjT9Hvtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101727; c=relaxed/simple;
	bh=hl4zEs2VwJkIoJCfTzZ52JO80/R8mSsbV+enovnWwwk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iqL81aXcSmLpMSLNeHoUSunte+0tmVvRfYrzstlqC1rTquMhPQXtOs7C0y5Q8dAoQUGsphJToSdt+yeR6yobrojrnvJ6m3sIvkHjpflg6XF472BIS4cTidBO5sIs4ZJTtO91VLT4UmKYVeGDQD5BsnTL0/6zYrcS5M1s7kD+988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eXnesF8N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F8LwuPol; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eXnesF8N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F8LwuPol; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eXnesF8N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F8LwuPol";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eXnesF8N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F8LwuPol"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7785421ACE;
	Wed, 13 Aug 2025 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755101723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Qze8q5H3Rg3WuFji103xXFFxL7DtXvtqLH5aoey5xc=;
	b=eXnesF8N/c1d2uH99cRRYjJiy4JwYskDQWN3gkTM26n+ImLJgqBV/Duw/3eLMSe4KQlern
	7zFCfKDfJVTlZ+czbWakCPpr/Xsvp7nZkL3jK2dbFtWRSo8IfvTEATgm0YPgczX8YyyHPA
	6wg+4+JBqBUgbUnQ/YDGG1lALJzYw/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755101723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Qze8q5H3Rg3WuFji103xXFFxL7DtXvtqLH5aoey5xc=;
	b=F8LwuPol8bOMpHqSc7rWhWb3NxWMQOUbCW9cCRu7VAF7pF16aJygp3mGktElIjmovzR2cl
	p5/1lKt7F8q+1oDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755101723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Qze8q5H3Rg3WuFji103xXFFxL7DtXvtqLH5aoey5xc=;
	b=eXnesF8N/c1d2uH99cRRYjJiy4JwYskDQWN3gkTM26n+ImLJgqBV/Duw/3eLMSe4KQlern
	7zFCfKDfJVTlZ+czbWakCPpr/Xsvp7nZkL3jK2dbFtWRSo8IfvTEATgm0YPgczX8YyyHPA
	6wg+4+JBqBUgbUnQ/YDGG1lALJzYw/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755101723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Qze8q5H3Rg3WuFji103xXFFxL7DtXvtqLH5aoey5xc=;
	b=F8LwuPol8bOMpHqSc7rWhWb3NxWMQOUbCW9cCRu7VAF7pF16aJygp3mGktElIjmovzR2cl
	p5/1lKt7F8q+1oDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5668B13929;
	Wed, 13 Aug 2025 16:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xj6OExu6nGheDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 16:15:23 +0000
Date: Wed, 13 Aug 2025 18:15:22 +0200
Message-ID: <874iubw63p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: Fix compile error with CLASS() after label
In-Reply-To: <20250813161209.GA627603@ax162>
References: <20250813090039.20064-1-tiwai@suse.de>
	<20250813150131.GA2842554@ax162>
	<87h5ybw921.wl-tiwai@suse.de>
	<20250813161209.GA627603@ax162>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 13 Aug 2025 18:12:09 +0200,
Nathan Chancellor wrote:
> 
> On Wed, Aug 13, 2025 at 05:11:34PM +0200, Takashi Iwai wrote:
> > Thanks for the review and explanations.
> > 
> > But I decided to drop the whole series for now (and fold the fix into
> > the original patch), as there are another issues that are caught with
> > clang.
> > 
> > Namely, when you have DEFINE_GUARD() locally in the *.c file, this
> > will lead to error with W=1 because of the unused inline functions.
> > 
> > Currently, I paper over with the change like:
> > 
> > --- a/include/linux/cleanup.h
> > +++ b/include/linux/cleanup.h
> > @@ -347,7 +347,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
> >  	})
> >  
> >  #define __DEFINE_GUARD_LOCK_PTR(_name, _exp)                                \
> > -	static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
> > +	static inline __maybe_unused void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
> >  	{                                                                   \
> >  		void *_ptr = (void *)(__force unsigned long)*(_exp);        \
> >  		if (IS_ERR(_ptr)) {                                         \
> > @@ -355,7 +355,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
> >  		}                                                           \
> >  		return _ptr;                                                \
> >  	}                                                                   \
> > -	static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
> > +	static inline __maybe_unused int class_##_name##_lock_err(class_##_name##_t *_T)   \
> >  	{                                                                   \
> >  		long _rc = (__force unsigned long)*(_exp);                  \
> >  		if (!_rc) {                                                 \
> > 
> > But I'm not sure whether that's the best way to go.
> 
> Yes, that is the subject of another thread right now, which is likely
> going to result in the "flag unused inline functions within .c files"
> part of clang's -Wunused-function being moved into W=2 but we will see
> how it develops.
> 
> https://lore.kernel.org/20250804220955.1453135-1-dan.j.williams@intel.com/

OK, I'll keep eyes and wait until those get resolved in the upstream.

> Another issue of the same vein that I saw, just in case you didn't:
> 
>   sound/hda/core/stream.c:954:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>     954 |         guard(spinlock_irq)(&bus->reg_lock);
>         |         ^
>   include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
>     401 |         CLASS(_name, __UNIQUE_ID(guard))
>         |         ^
>   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
>     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>         |         ^
>   <scratch space>:86:1: note: expanded from here
>      86 | class_spinlock_irq_t
>         | ^
> 
> Which I worked around with:
> 
> diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
> index 503bb3fcacc2..711da67d7506 100644
> --- a/sound/hda/core/stream.c
> +++ b/sound/hda/core/stream.c
> @@ -951,8 +951,8 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
>   error:
>  	snd_dma_free_pages(bufp);
>   err_alloc:
> -	guard(spinlock_irq)(&bus->reg_lock);
> -	azx_dev->locked = false;
> +	scoped_guard(spinlock_irq, &bus->reg_lock)
> +		azx_dev->locked = false;
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(snd_hdac_dsp_prepare);

Yep, I applied locally the very same fix :)


thanks,

Takashi
