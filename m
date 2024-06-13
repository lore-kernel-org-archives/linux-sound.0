Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3CE12C530
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288420; cv=none; b=DY/ys6f1mM2cqrtvmiCkD/0XqVDyhHwdkmpR/P+Zzxao51pT9sPNYKOTE7b/xevBLxqfKx3ncvh5lHeqzwJcFgOdw1rNkliKoAP6FJoK+EHFYCmQKezMD9aubwCL32PpwmHT/8XPhnL/QY9+u3o0/5V+C/yDdUqYYJyCe+LdBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288420; c=relaxed/simple;
	bh=+NyL6w53Ukmk4fvfi1kBX+yR4YVC7iq42OVzFhzx3s4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEhmaWFgfOKOjQTr8WNGm1eFOEiY+UHtIG5qVkGouX3NMPDCvHM8vInIIc6A8LXCdTl2qV8Od999lbvm8HN/tyhouv+af+4O2Eiuh7q5U/CYSkp85bdQlUY0qzAs5RCf7oFMaXmm1Ox0nfzP2k8L67/J3ttv36WkcWtct6Akfoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fYpP66YC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+Rp592o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fYpP66YC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+Rp592o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fYpP66YC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+Rp592o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fYpP66YC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+Rp592o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5019037283;
	Thu, 13 Jun 2024 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718288416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XahobGG7KWRe03jMpwfUmwnpd1x8abxx6qzR1lKPkkE=;
	b=fYpP66YCTwC9D7DcHfxJSCkSuD5aylhLh12+qiYM+Dd2+v0aJNqs9Z7/r6tVPDaQyMHc61
	HA3qCwXM2mGnNEj1a71ryLMR7xZHsPljiglUcS7JGtuUZlQMHZMxwMxhSpP1LsvendvvKx
	CVJ2BoKAjFZLIREhF+e0krVBgK8SacU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718288416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XahobGG7KWRe03jMpwfUmwnpd1x8abxx6qzR1lKPkkE=;
	b=M+Rp592oLJfeA6lumUyvxob8F+RXNVqn0/Ps9pK4VoODY8ZyhA+i0rTFTo5HtkfP5rPgwr
	kl3C6YsuIM12OWAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fYpP66YC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M+Rp592o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718288416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XahobGG7KWRe03jMpwfUmwnpd1x8abxx6qzR1lKPkkE=;
	b=fYpP66YCTwC9D7DcHfxJSCkSuD5aylhLh12+qiYM+Dd2+v0aJNqs9Z7/r6tVPDaQyMHc61
	HA3qCwXM2mGnNEj1a71ryLMR7xZHsPljiglUcS7JGtuUZlQMHZMxwMxhSpP1LsvendvvKx
	CVJ2BoKAjFZLIREhF+e0krVBgK8SacU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718288416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XahobGG7KWRe03jMpwfUmwnpd1x8abxx6qzR1lKPkkE=;
	b=M+Rp592oLJfeA6lumUyvxob8F+RXNVqn0/Ps9pK4VoODY8ZyhA+i0rTFTo5HtkfP5rPgwr
	kl3C6YsuIM12OWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2928A13A7F;
	Thu, 13 Jun 2024 14:20:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HrDkCCAAa2ZsTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 14:20:16 +0000
Date: Thu, 13 Jun 2024 16:20:39 +0200
Message-ID: <8734pgorew.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH v4 1/2] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <20240613125649.GA421852@workstation.local>
References: <20240507133551.607171-1-perex@perex.cz>
	<20240507133551.607171-2-perex@perex.cz>
	<20240613125649.GA421852@workstation.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.49 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.18)[-0.876];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5019037283
X-Spam-Flag: NO
X-Spam-Score: -3.49
X-Spam-Level: 

On Thu, 13 Jun 2024 14:56:49 +0200,
Takashi Sakamoto wrote:
> 
> Hi,
> 
> On Tue, May 07, 2024 at 03:30:50PM +0200, Jaroslav Kysela wrote:
> > diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> > index 628d46a0da92..c458172b32d5 100644
> > --- a/include/uapi/sound/asound.h
> > +++ b/include/uapi/sound/asound.h
> > @@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
> >   *                                                                           *
> >   *****************************************************************************/
> >  
> > -#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
> > +#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 18)
> >  
> >  typedef unsigned long snd_pcm_uframes_t;
> >  typedef signed long snd_pcm_sframes_t;
> > @@ -330,12 +330,6 @@ enum {
> >  #endif
> >  };
> >  
> > -union snd_pcm_sync_id {
> > -	unsigned char id[16];
> > -	unsigned short id16[8];
> > -	unsigned int id32[4];
> > -};
> 
> It can bring FTBFS for any userspace application which uses the
> structure. If getting rid of such public structure, we should have the
> term to deprecate it for a while.

A good point.  We can keep the union definition there but add a
comment that it's deprecated and not actually used in any code.


Takashi
