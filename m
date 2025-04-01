Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D91C8612
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527985; cv=none; b=XrthCmStnCxWw5i2WknTPBV4SmX1WVaMo6QUiRSlCymoP8on2F4yz7BeTYiXU3pJ8u3+Ye8/P/dlA1q0cWq6yNWkQ598f4OwF+3ZyqyofWh7e/6rjHTkzvUxegOlNx4sxM+Etgxgq0vZAws3zaqezI/5UdqtZo6+CTACAb8+vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527985; c=relaxed/simple;
	bh=bPOPIUSOeWhzJQSRnBFgc1EUw345CobiDjs1EktyxFY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l8Dv16g6QHhdq1fq/ju8BuWqbqz4k2ei0hM4OAewjqEu23qbrqr7UFM45BgXv2fAKxce46eClpl/O/HdeTUD9NNEMTGr8XGEJQiq6kXeulDLZrzQRciN5oaxsZoBvSzyPWc9c5H9XcyF2mEoKuQ8IjYa/KEJtyR/VzHoZ+X7Bb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0jF8I20x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qxDI0Hvo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0jF8I20x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qxDI0Hvo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0jF8I20x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qxDI0Hvo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0jF8I20x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qxDI0Hvo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCBC91F38E;
	Tue,  1 Apr 2025 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743527981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tnurEgIPsT0KRR+RMu/gExqmwYF9Kg6CRULnSXydapc=;
	b=0jF8I20xMiqeWBin+ZUV2Ec+43xo/7gLYlKDKQeadZcVwS7foAyXwcReolhinIfinEtQKy
	P6utRA3rynlAS7rrD1haVJGSMwES0m0sINxqC9EqWjXWhD5zKyZHBFD/hmf918PVMu0gNK
	XJAOJjBk1RuJQk/wqEZaE0sSb+3mMlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743527981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tnurEgIPsT0KRR+RMu/gExqmwYF9Kg6CRULnSXydapc=;
	b=qxDI0Hvo1HXcixsbJRAgfbOLtKt6XJfNUFSKo2yhUEXqS6jYfUiQRMh/E6tjjp/pkXm/1y
	8J0jZUA6OyVKilBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0jF8I20x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qxDI0Hvo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743527981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tnurEgIPsT0KRR+RMu/gExqmwYF9Kg6CRULnSXydapc=;
	b=0jF8I20xMiqeWBin+ZUV2Ec+43xo/7gLYlKDKQeadZcVwS7foAyXwcReolhinIfinEtQKy
	P6utRA3rynlAS7rrD1haVJGSMwES0m0sINxqC9EqWjXWhD5zKyZHBFD/hmf918PVMu0gNK
	XJAOJjBk1RuJQk/wqEZaE0sSb+3mMlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743527981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tnurEgIPsT0KRR+RMu/gExqmwYF9Kg6CRULnSXydapc=;
	b=qxDI0Hvo1HXcixsbJRAgfbOLtKt6XJfNUFSKo2yhUEXqS6jYfUiQRMh/E6tjjp/pkXm/1y
	8J0jZUA6OyVKilBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 658CF13691;
	Tue,  1 Apr 2025 17:19:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MRqCFy0g7Gc4HQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Apr 2025 17:19:41 +0000
Date: Tue, 01 Apr 2025 19:19:40 +0200
Message-ID: <87jz83ztn7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BCBC91F38E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.intel.com,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,intel.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 01 Apr 2025 18:58:40 +0200,
Jaroslav Kysela wrote:
> 
> On 01. 04. 25 16:49, Takashi Iwai wrote:
> > On Tue, 01 Apr 2025 15:36:52 +0200,
> > Peter Ujfalusi wrote:
> >> 
> >> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
> >> does not support RESUME then on system resume the RESUME trigger is not
> >> sent, the stream's state and suspended_state remains untouched.
> >> When the user space releases the pause then the core will reject this
> >> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
> >> 
> >>  From this point user space will do the normal (hw_params) prepare and
> >> START, PAUSE_RELEASE trigger will not be sent by the core after the
> >> system has resumed.
> 
> Why you expect to see PAUSE_RELEASE trigger before SUSPEND trigger
> when resume is not supported ? I think that the driver has complete
> information:
> 
> PAUSE -> SUSPEND [-> no RESUME]
> 
> The driver should stay in the suspend state until a new stream
> re-initialization is invoked.
> 
> It looks like that other logic should be moved to the end driver (if
> some parts must be reinitialized in the suspend phase when the resume
> is not supported). I don't think that this is job for PCM core nor SoC
> PCM core routines.
> 
> The SUSPEND trigger is always invoked, isn't?

No, that's a part of the problems.  The ops->suspend is called only
for the running state, while at snd_pcm_post_suspend(), the state is
changed to SUSPENDED.  The original state is saved as
suspended_state, and this can be restored via snd_pcm_resume(), but
only if the driver supports the full resume.

We may allow calling ops->suspend also for PAUSED state, too.  But
then each driver would need to have to handle this state change, too.
Currently, when snd_pcm_prepare(), *_drop() or *_drain() is called at
PAUSED state, the core automatically releases the pause beforehand.

> >> To fix this issue, release the paused stream before handling the suspend
> >> if the resume is not supported.
> >> This will ensure that the stream is properly suspended for suspend entry.
> >> On resume no attempt will be taken to resume the suspended stream as the
> >> resume is not supported, userspace will eventually going restart the audio.
> >> 
> >> Link: https://github.com/thesofproject/linux/issues/5035
> >> Link: https://github.com/thesofproject/linux/issues/5341
> >> Suggested-by: Takashi Iwai <tiwai@suse.de>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > 
> > Applied now.  Thanks.
> 
> I would consider revert if my objection is appropriate.

OK, I dropped the patch for now until we get agreement.


thanks,

Takashi
