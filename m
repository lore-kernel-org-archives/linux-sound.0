Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF413C670
	for <linux-sound@vger.kernel.org>; Thu,  2 May 2024 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714663636; cv=none; b=SIOIeJSWYjHdeYtRm8J9xqd7buaokfxQZF41l96GJpewv97bf0zR3JKao/EHqC+6G+UMrQCFLEosiMEqwSFC1zyKVNBfho889G07YfimgD8FjSe/Sb56CK0adrfN079Q8f8y2aYJLREn4D67WhcsDbRYuH5N94YOVxLuT5M/TSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714663636; c=relaxed/simple;
	bh=j7vODRgsuiB/Ca9qGwk+qpWBTaadhJpWpioZFTeJKwU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtYCv0a5VX4gw6yC/riNDfy5/YnSwJkxIRd8c/v7tkd5f1dDNMHE3jpfekVkv6XVpFG9UW1WUYRyxLTm6wtK4ceJy32HUtomR6gglqzCA299TJUK7EiBxxhOaV0XWIAJ5Z5EoJp9FvT2vTmZcIl0RfiTFZKZe5LAaU34sMrgXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxW/01zt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+1AjGP9A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxW/01zt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+1AjGP9A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxW/01zt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+1AjGP9A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxW/01zt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+1AjGP9A"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0DA31FCDE;
	Thu,  2 May 2024 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714663632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGJD/YyA4z6rkzoAH898JvRW14GwNoddsy8ZX0z3eok=;
	b=JxW/01ztpqQmgWHmPvAdIExbs/iEDFaGcNFt2gg26LVjMeZgpSuEUrCLpFZvZ1Rttod7aU
	FQMYztLq5dVH+npKNsOyiVjpOqdKNidNzasy1dvyV2SBMfAmYVhMIuIyy2+LeZqFXcw9SR
	C15XF9AtBadUEhyGKEMkrXA8iizAIrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714663632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGJD/YyA4z6rkzoAH898JvRW14GwNoddsy8ZX0z3eok=;
	b=+1AjGP9A2DF68BR3WLJdiUVYghTQOa5/OFik+LLYvwtGGs1KPJoEai3oOluVth/pUk7qT1
	ijHjLw5kYemM4rCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714663632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGJD/YyA4z6rkzoAH898JvRW14GwNoddsy8ZX0z3eok=;
	b=JxW/01ztpqQmgWHmPvAdIExbs/iEDFaGcNFt2gg26LVjMeZgpSuEUrCLpFZvZ1Rttod7aU
	FQMYztLq5dVH+npKNsOyiVjpOqdKNidNzasy1dvyV2SBMfAmYVhMIuIyy2+LeZqFXcw9SR
	C15XF9AtBadUEhyGKEMkrXA8iizAIrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714663632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGJD/YyA4z6rkzoAH898JvRW14GwNoddsy8ZX0z3eok=;
	b=+1AjGP9A2DF68BR3WLJdiUVYghTQOa5/OFik+LLYvwtGGs1KPJoEai3oOluVth/pUk7qT1
	ijHjLw5kYemM4rCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB6B513957;
	Thu,  2 May 2024 15:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jspZLNCwM2bndwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 May 2024 15:27:12 +0000
Date: Thu, 02 May 2024 17:27:25 +0200
Message-ID: <87o79oi68y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <a2fc16aa-387d-47e2-8000-1a502e6da7ac@perex.cz>
References: <20240430161012.4011064-1-perex@perex.cz>
	<87v83wk6ue.wl-tiwai@suse.de>
	<a2fc16aa-387d-47e2-8000-1a502e6da7ac@perex.cz>
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
X-Spam-Level: 
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Thu, 02 May 2024 10:02:36 +0200,
Jaroslav Kysela wrote:
> 
> On 02. 05. 24 9:31, Takashi Iwai wrote:
> > On Tue, 30 Apr 2024 18:10:12 +0200,
> > Jaroslav Kysela wrote:
> >> 
> >> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
> >> internal command"), there was a possibility to pass information
> >> about the synchronized streams to the user space. The mentioned
> >> commit removed blindly the appropriate code with an irrelevant comment.
> >> 
> >> The revert may be appropriate, but since this API was lost for several
> >> years without any complains, it's time to improve it. The hardware
> >> parameters may change the used stream clock source (e.g. USB hardware)
> >> so move this synchronization ID to hw_params as read-only field.
> > 
> > What's the benefit of moving to hw_params?  The current inquiry via
> > ioctl can also follow the dynamic change, no?  I'm not entirely
> > objecting to the idea, but need to understand better.
> 
> In the removed code, there was a comment from Abramo that this ioctl
> is not so much appropriate to carry this information because it
> depends on the runtime status. Also, this info ioctl is callable
> through the control API thus the result depends on the stream open
> state. The revert is just a simple solution, but given the fact that
> the API was suspended for several years, we can do this cleanup now
> IMHO.

OK, makes sense.

> >> It seems that pipewire can benefit from this API (disable adaptive
> >> resampling for perfectly synchronized PCM streams) now.
> > 
> > If the support by pipewire is planned, it'd be good to revive the
> > feature, yes.
> 
> Pipewire would like to be able to detect the synchronized streams and
> Wim is aware about sync_id API, but it does not work now without
> obsoleting this in alsa-lib. I think that we did a wrong job here.

OK.

> >> --- a/include/uapi/sound/asound.h
> >> +++ b/include/uapi/sound/asound.h
> > (snip)
> >> @@ -334,6 +334,7 @@ union snd_pcm_sync_id {
> >>   	unsigned char id[16];
> >>   	unsigned short id16[8];
> >>   	unsigned int id32[4];
> >> +	__u64 id64[2];
> >>   };
> > 
> > What's the reason for this __u64 addition?  For the easiness of
> > zero-compare?
> 
> Basically yes, but this extensions is aligned with other fields. Also,
> I think that it may be usable to work with 64-bit words here. Perhaps,
> other fields may use __uXX declarations, too.

IMO, if we are allowed to redesign, it'd be better to avoid a union
for an API call.  It's a nightmare if one needs a conversion of API
(e.g. between different endianess for emulator).


thanks,

Takashi
