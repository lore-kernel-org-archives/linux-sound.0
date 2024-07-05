Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBD27452
	for <linux-sound@vger.kernel.org>; Fri,  5 Jul 2024 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165223; cv=none; b=hTNtKhjvv8W5AwpkEiPi5jQkfjhQ+Ku88GWt1ipmgswN9LVcrSdOwzL0IMkpyzGkjPyYavQFPG8c2bOelqv52p16KH8hIS2YDojL9nipFiUphjOWzV5rIPwWBoEVLRkQndTtBehMZparKvQgWWhKeXwHlO/rjxcRmyCZm67U2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165223; c=relaxed/simple;
	bh=kBK4Fm+sgi7Hu9j4PmrBzwoE81fnCZ8C8ZIxknGA1NQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bB08rcfNnndhMAwPPlLhglsxCC53LofAbqaJni2cy1VQ9ispUStPLaohAeB/naDZCO4dMgpzZUfLHZFGpDXCGupWXKmfropQVDhRDLIbyDZyKaFTEMtUMC/jhSt4o317osXMo5AsZWSsJ2mOMr2dOyHZSc1lBIoGrWYRd91doaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KeemNrqR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dvXqpSMF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KeemNrqR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dvXqpSMF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KeemNrqR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dvXqpSMF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KeemNrqR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dvXqpSMF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A60E81F826;
	Fri,  5 Jul 2024 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720165219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVXLAZmX3SBAOjVpHWTOoMrMy3qFR3HaRUriUWp7OAE=;
	b=KeemNrqRUIlOlXYa5UjmdM9X5KPlDE/9CdiB2+pkNwbaaBHRwN4GsuY3+KWbizowiLoj21
	bfthGxdA4FsjEfxhpMCvsvjsKrlwNuSSaF/CPjfbSiu4aicVzVwE6poklGLtDSkpuR0eIU
	NOnUYSV4QUBWHujhnLCWHy1TY0HBzpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720165219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVXLAZmX3SBAOjVpHWTOoMrMy3qFR3HaRUriUWp7OAE=;
	b=dvXqpSMFth7KzVdANkjQtj1tuabip0cNdu1fPTZ8jt66kxuXUhdJFicqT9uP7ny7OAVN05
	s+jhZDYGMDJY6pCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KeemNrqR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dvXqpSMF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720165219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVXLAZmX3SBAOjVpHWTOoMrMy3qFR3HaRUriUWp7OAE=;
	b=KeemNrqRUIlOlXYa5UjmdM9X5KPlDE/9CdiB2+pkNwbaaBHRwN4GsuY3+KWbizowiLoj21
	bfthGxdA4FsjEfxhpMCvsvjsKrlwNuSSaF/CPjfbSiu4aicVzVwE6poklGLtDSkpuR0eIU
	NOnUYSV4QUBWHujhnLCWHy1TY0HBzpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720165219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVXLAZmX3SBAOjVpHWTOoMrMy3qFR3HaRUriUWp7OAE=;
	b=dvXqpSMFth7KzVdANkjQtj1tuabip0cNdu1fPTZ8jt66kxuXUhdJFicqT9uP7ny7OAVN05
	s+jhZDYGMDJY6pCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8763413889;
	Fri,  5 Jul 2024 07:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MwPfH2Ojh2ZxLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jul 2024 07:40:19 +0000
Date: Fri, 05 Jul 2024 09:40:49 +0200
Message-ID: <8734ooi8vy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Add tempo base unit for MIDI2 Set Tempo messages
In-Reply-To: <ee552fa6-9987-4ff4-b769-6ee00add99c8@perex.cz>
References: <20240704123549.13485-1-tiwai@suse.de>
	<ee552fa6-9987-4ff4-b769-6ee00add99c8@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A60E81F826
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

On Fri, 05 Jul 2024 09:37:15 +0200,
Jaroslav Kysela wrote:
> 
> On 04. 07. 24 14:35, Takashi Iwai wrote:
> > MIDI2 Set Tempo message defines the tempo in 10ns unit for finer
> > accuracy, while MIDI1 was defined in 1us unit.  For adapting this
> > different unit, introduce "tempo_base" field to snd_seq_queue_tempo
> > struct so that user-space can pass the proper tempo base unit.
> > 
> > The accepted value is limited, it must be either 0, 10 or 1000.
> > 
> > The protocol version is bumped to 1.0.4 along with this.
> > 
> > The access with the older protocol version ignores the tempo-base
> > value in ioctls and always treats as 1000.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >   include/uapi/sound/asequencer.h |  7 ++++---
> >   sound/core/seq/seq_clientmgr.c  |  4 ++++
> >   sound/core/seq/seq_queue.c      |  6 ++++--
> >   sound/core/seq/seq_timer.c      | 21 +++++++++++++++------
> >   sound/core/seq/seq_timer.h      |  4 +++-
> >   5 files changed, 30 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
> > index c85fdd8895d8..c7acfeb514a3 100644
> > --- a/include/uapi/sound/asequencer.h
> > +++ b/include/uapi/sound/asequencer.h
> > @@ -10,7 +10,7 @@
> >   #include <sound/asound.h>
> >     /** version of the sequencer */
> > -#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 3)
> > +#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 4)
> >     /**
> >    * definition of sequencer event types
> > @@ -523,11 +523,12 @@ struct snd_seq_queue_status {
> >   /* queue tempo */
> >   struct snd_seq_queue_tempo {
> >   	int queue;			/* sequencer queue */
> > -	unsigned int tempo;		/* current tempo, us/tick */
> > +	unsigned int tempo;		/* current tempo, us/tick (or different time-base below) */
> >   	int ppq;			/* time resolution, ticks/quarter */
> >   	unsigned int skew_value;	/* queue skew */
> >   	unsigned int skew_base;		/* queue skew base */
> > -	char reserved[24];		/* for the future */
> > +	unsigned int tempo_base;	/* tempo base in nsec unit; either 10 or 1000 */
> 
> Perhaps unsigned short value may be enough to carry this settings? The
> two bytes will be always zero for unsigned int.

True, it's unlikely that the value will be more than 1000.


Takashi
