Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2C1990C7
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774938992; cv=none; b=bUHQHV2ozfaTYEy3dwQodd8VnaAkbeHne81t8aRZ9Dr8ajDK9Xyo4SbW4bamZ0PAceRzEe4KNAjv3BX0W3iU63UMq7dtU8u+a8qvLZgEBHatocqwDIGTMAJbQdOf6kMgba3AOc4qumCoadHa2fhn+CLFBX5zgXiV/pDJgJAgSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774938992; c=relaxed/simple;
	bh=kJ3Bk6M2MTNQgL1/ZGB8PoT58cFcVJQUR5MirL31AQc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLLddXKp+3l/3fFhf2gCez9+GPrkbhU8IzlDE6C1Rz3DU58locDBbaImKe/+XeVE/1v6fxjsALPHnpjB5NVyDuSMRfVv6dJwvifhYlLpunNrZkjaIcvDgoYu0Xmr8yjITKApAgf+S8AYwUf1ueYyR9CADK/Mg7vYjbbFPnvTYgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dTBJfDJZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gpbmHWIz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dTBJfDJZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gpbmHWIz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dTBJfDJZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gpbmHWIz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dTBJfDJZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gpbmHWIz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8382C4D541;
	Tue, 31 Mar 2026 06:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774938989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2woUnOnzHe2oo5TWd+W+6ys8rxmRo3CGNSJi1h73a6o=;
	b=dTBJfDJZ15L+FeLm7QHXmJ0wjz3V1S5QPJt9lxjYN904KBW4I1W9g6tv5JRYn9mMIzTIbU
	NtDHDKarVEv1fmlU79W+OaRroaa70t4r8L6Tj4/kEtSd68FW/8kksOvqZa/1KWxPK8YWA5
	M79CrDushBOywiyk/xC9BcrLs3MGbb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774938989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2woUnOnzHe2oo5TWd+W+6ys8rxmRo3CGNSJi1h73a6o=;
	b=gpbmHWIzpddcDxanFd+HA9y6kn61DS4P6o8FtwutrWsbNKzvFc8kpbL4KwQjlmIvsIiQRr
	2kArs1D9yPed5zBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774938989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2woUnOnzHe2oo5TWd+W+6ys8rxmRo3CGNSJi1h73a6o=;
	b=dTBJfDJZ15L+FeLm7QHXmJ0wjz3V1S5QPJt9lxjYN904KBW4I1W9g6tv5JRYn9mMIzTIbU
	NtDHDKarVEv1fmlU79W+OaRroaa70t4r8L6Tj4/kEtSd68FW/8kksOvqZa/1KWxPK8YWA5
	M79CrDushBOywiyk/xC9BcrLs3MGbb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774938989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2woUnOnzHe2oo5TWd+W+6ys8rxmRo3CGNSJi1h73a6o=;
	b=gpbmHWIzpddcDxanFd+HA9y6kn61DS4P6o8FtwutrWsbNKzvFc8kpbL4KwQjlmIvsIiQRr
	2kArs1D9yPed5zBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BD384A0A2;
	Tue, 31 Mar 2026 06:36:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DuJJDW1ry2k1IwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Mar 2026 06:36:29 +0000
Date: Tue, 31 Mar 2026 08:36:28 +0200
Message-ID: <878qb8tsib.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	arun@asymptotic.io,
	wim.taymans@gmail.com
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for 'jumpy DMA'
In-Reply-To: <dadef18b-1c2e-4c0d-8ae8-2e4b8ad75d04@linux.intel.com>
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
	<87se9htms4.wl-tiwai@suse.de>
	<67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
	<87ikadtgpe.wl-tiwai@suse.de>
	<dadef18b-1c2e-4c0d-8ae8-2e4b8ad75d04@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,kernel.org,linux.intel.com,alsa-project.org,vger.kernel.org,asymptotic.io,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, 31 Mar 2026 08:00:56 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 30/03/2026 19:39, Takashi Iwai wrote:
> > OK, then I'd say that the existing fifo_size doesn't fit fully for
> > this kind of stuff.  e.g.
> 
> We came to the same conclusion with Jaroslav, and the plan is to
> introduce two new parameter in hw_params:
> init_chunk and step_chunk, both in frames.
> init_chunk - is the size of the hw_ptr jump right when the start happens
> step_chunk - is the runtime jump size which happens every step_chunk time.
> 
> for example:
> init_chunk = 100ms
> step_chunk = 1ms
> hw_ptr moves 100ms on start (pointing to 101ms), after 1ms of time the
> hw_ptr will move 1ms ahead to 102ms, in another 1ms it again moves 1ms
> to 103ms...
> 
> init_chunk = 100ms
> step_chunk = 96ms
> hw_ptr moves 100ms on start (pointing to 101ms), after 96ms of time the
> hw_ptr will move 96ms ahead to 197ms, in another 96ms it again moves 1ms
> to 293ms...

In the second example, where does 1ms offset comes from?
  hw_ptr moves 100ms on start (pointing to 101ms)

I thought that this 1ms is the step_chunk size in the first example...

> Note, the first is theoretical, with SOF 1ms step is used only with
> 'small' DSP side buffer:
> 
> init_chunk = 4ms
> step_chunk = 1ms
> hw_ptr moves 4ms on start (pointing to 5ms), after 1ms of time the
> hw_ptr will move 1ms ahead to 6ms, in another 1ms it again moves 1ms to
> 7ms...

So, init_chunk is the size to be filled up at the start, something
similar like sw_params.start_threshold, but it's rather a hardware
requirement.

And step_chunk is essentially the hw_ptr granularity?

> I'm not sure if we want these to be snd_pcm_uframes_t types in
> snd_pcm_hw_params or should be u32 simplify the shrinking of reserved..
> 
> -       unsigned char reserved[48];
> +       snd_pcm_uframes_t init_chunk;	/* in frames */
> +       snd_pcm_uframes_t step_chunk;	/* in frames */
> +       unsigned char reserved[48 - 2 * sizeof(snd_pcm_uframes_t)];
> 
> with u32 we can simply change the reserved size to 40, which is anyways
> going to be the case for the snd_pcm_hw_params32{}

In my idea, it may be configurable, hence it belongs to interval, so
it's two in ires[9] for the reserved intervals.

> > if a device allows a different queue size, it should be configurable
> > via hw_params.
> 
> I'm not sure if I follow this statement. the fifo_size is a driver to
> user space information, driver fills it and user space ignores it ;) - I
> cannot find any evidence of it's use.

If a chip has a similar constraint but the init and step sizes are
adjustable, they should be configurable via hw_params procedure --
that's my point.

> The init_chunk, step_chunk would be similar, the driver sets it and user
> space would use it.
> 
> In SOF this will be dynamic and it will depend on the period size:
> https://github.com/thesofproject/linux/pull/5673/commits/18f3ba5e42212d77019d79ec09b7057a7703d361

Well, so even in your case, the driver can implement the hw_constraint
for coupling those numbers, too.  Then application may choose the
init_chunk or step_chunk, which restricts the period size
automatically.  If application doesn't choose those, the hw_params
engine will choose depending on the period size, and application can
see the values after hw_params call.


thanks,

Takashi
