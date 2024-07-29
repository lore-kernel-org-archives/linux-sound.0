Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0D15697B
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281367; cv=none; b=C5PBS+8KR8HJxLOp9JDRhxpk9zhg6zpr8NZFJKcTM34j1Mh/bdWh0RFG3KIb5PBaUK3CAfuee+Go38L+zYuFehU3IAyor+QbaJ5xmACIjhv47QgyBLh77lqf1YVHG03NciL6vyJBX+Z8Lwj4sQtX9rQEKlA4ZbGMZZJN7NYdPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281367; c=relaxed/simple;
	bh=kzN90049AUSqKKQ2CQw3h2XR4U8mtPMVmobBbaLjizU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFz29pWBJ7KXjHYG415REdKp8hpOvTiW+9YZ/p3z7mSFBfIqxqCP8/eWLgJ7DMKCajWyW/sgDSyKQWsyXoawu7hwz+WQ70pUjRlcQTSwhyJdMa9AApbUVjBrWJzkxJtQFJNz0vOamBdTUkIQz7MeM4a+WP+hTpgNuJpUQZjQVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QaMkQ8I6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4B8b8He1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QaMkQ8I6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4B8b8He1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QaMkQ8I6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4B8b8He1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QaMkQ8I6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4B8b8He1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F2661F7BB;
	Mon, 29 Jul 2024 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722281364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYqzRVgnCjQsP5OQIZlzhPDjx/YQNL7L7Nni9jDBg7o=;
	b=QaMkQ8I6bvSd5y8IQZCerEyyDAjzgJfDFCJMpjN+DS9kB4Rgd727bpuKQZhnsXDn6o+Lq/
	HLgaa+KK0XFju+4m+NRUxAmR1debAz8VRIa3fQI3ZA+e2D4NpF5Bg1ZnbInMRr2xdtDBdI
	VA9AA9jb+8jaNhPF62EK1N9mU0XlE+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722281364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYqzRVgnCjQsP5OQIZlzhPDjx/YQNL7L7Nni9jDBg7o=;
	b=4B8b8He1bABspXBKW1PQycETEmJcPrxINL97KhMSf+VFBHg67pkbfCwEqmYjkNx/Um6r3j
	C+AE72Mbd9NNoGBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QaMkQ8I6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4B8b8He1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722281364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYqzRVgnCjQsP5OQIZlzhPDjx/YQNL7L7Nni9jDBg7o=;
	b=QaMkQ8I6bvSd5y8IQZCerEyyDAjzgJfDFCJMpjN+DS9kB4Rgd727bpuKQZhnsXDn6o+Lq/
	HLgaa+KK0XFju+4m+NRUxAmR1debAz8VRIa3fQI3ZA+e2D4NpF5Bg1ZnbInMRr2xdtDBdI
	VA9AA9jb+8jaNhPF62EK1N9mU0XlE+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722281364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYqzRVgnCjQsP5OQIZlzhPDjx/YQNL7L7Nni9jDBg7o=;
	b=4B8b8He1bABspXBKW1PQycETEmJcPrxINL97KhMSf+VFBHg67pkbfCwEqmYjkNx/Um6r3j
	C+AE72Mbd9NNoGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C351138A7;
	Mon, 29 Jul 2024 19:29:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zbMpDZTtp2acPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 19:29:24 +0000
Date: Mon, 29 Jul 2024 21:30:00 +0200
Message-ID: <87ikwo9etj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker thread
In-Reply-To: <ZqfHC7IodobTlVT4@opensource.cirrus.com>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
	<87plqw9no5.wl-tiwai@suse.de>
	<ZqfHC7IodobTlVT4@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6F2661F7BB
X-Spam-Score: -3.31
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,gmail.com,vger.kernel.org,opensource.cirrus.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

On Mon, 29 Jul 2024 18:44:59 +0200,
Charles Keepax wrote:
> 
> On Mon, Jul 29, 2024 at 06:18:50PM +0200, Takashi Iwai wrote:
> > On Mon, 29 Jul 2024 17:59:32 +0200,
> > Charles Keepax wrote:
> > > 
> > > The microphone/speaker privacy shutter ALSA control handlers need to
> > > call pm_runtime_resume, since the hardware needs to be powered up to
> > > check the hardware state of the shutter. The IRQ handler for the
> > > shutters also needs to notify the ALSA control to inform user-space
> > > the shutters updated. However this leads to a mutex inversion, between
> > > the sdw_dev_lock and the controls_rwsem.
> > 
> > That's bad, how does the mutex inversion look like?  Generally
> > speaking, a call of snd_ctl_notify() from an irq handler is a very
> > standard procedure, and it should work without too much workaround.
> > 
> 
> SoundWire IRQs are called under the sdw_dev_lock, and then in the
> IRQ handler we call snd_ctl_notify which takes controls_rwsem.

snd_ctl_notify() doesn't take rwsem but ctl_files_rwlock.
And rwlock isn't taken except for two cases, at a list traverse at
enumerating from user-space and at the device disconnection, so it
shouldn't race.  Anything missing there...?


thanks,

Takashi

> On
> the other side, in the ALSA control handler which is obviously
> called under the controls_rwsem, we do a pm_runtime_resume, which
> causes SoundWire stuff to happen that takes the sdw_dev_lock.
> 
> Thanks,
> Charles
