Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76919310636
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387424; cv=none; b=JrMQyLT/wqoMTTBZhx3F/l3yPwyABreDZAL01FWN9XMInr2/QtYnwLl6kK47BlRsx5rgEsS2gikOmQBgSuzuowKO86Km5wW7LPjFysTGi2o1MNU7fFF4U2q3TFFnyzKQ0eRMlZh2G/r8QmKDucGUpdGbvJi3YhAAT9GFnfBP5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387424; c=relaxed/simple;
	bh=1lUR/zSfZFwROkI7ec9aAoy0rtinbosJrIFD88B4m4I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EGXBSW9wHIdcjilGUowXaAxKh2rcZw2XR48xJq5tcAcP+PG24Iqzi6pcDt+VS97rXGaMIUcHK8RK2NF8MmVp00Bw19nEyNs0mBCV+poaP7vd0vmbINWsyhucqNnDaYc7/3Yh+8glKv08MstxvkTvChQ6AkL9GvlKoai0CGhj9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HGJ4qU80; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dtdCe5Pl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HGJ4qU80; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dtdCe5Pl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HGJ4qU80";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtdCe5Pl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HGJ4qU80";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtdCe5Pl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7ABF720BDA;
	Thu, 28 Aug 2025 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lwvr7Z1Rk2ECDA06Sq5KxeaQYDyOTRytlGkHLaDEHZY=;
	b=HGJ4qU80KdVPbGV/9nfeYs0lJZ7m+alj6LQ71XqQIpIbRH40NE2wqjCIvyKvBYrfyQTthR
	GpktuobT5tXa08b/qL21NZF1Ma8IDGkT0Edf9B//LeQp1mfnp89h37PdlGQqQiC4IiIhpZ
	graHZUKwLNhR2Hr7chxfn/Cc/lORdd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lwvr7Z1Rk2ECDA06Sq5KxeaQYDyOTRytlGkHLaDEHZY=;
	b=dtdCe5PlbBgQwyeVlW2xF1nGO8jenvhoH/QE7SJy2zcNznfs9U21kh2SdPeDgNiuFuWC0U
	tpo0TTW6YTcS4ECw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lwvr7Z1Rk2ECDA06Sq5KxeaQYDyOTRytlGkHLaDEHZY=;
	b=HGJ4qU80KdVPbGV/9nfeYs0lJZ7m+alj6LQ71XqQIpIbRH40NE2wqjCIvyKvBYrfyQTthR
	GpktuobT5tXa08b/qL21NZF1Ma8IDGkT0Edf9B//LeQp1mfnp89h37PdlGQqQiC4IiIhpZ
	graHZUKwLNhR2Hr7chxfn/Cc/lORdd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lwvr7Z1Rk2ECDA06Sq5KxeaQYDyOTRytlGkHLaDEHZY=;
	b=dtdCe5PlbBgQwyeVlW2xF1nGO8jenvhoH/QE7SJy2zcNznfs9U21kh2SdPeDgNiuFuWC0U
	tpo0TTW6YTcS4ECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56B1813326;
	Thu, 28 Aug 2025 13:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hQ3NE1xYsGjJDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:23:40 +0000
Date: Thu, 28 Aug 2025 15:23:39 +0200
Message-ID: <87plcfeg10.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH 00/19] ALSA: firewire: Use auto-cleanup macros
In-Reply-To: <20250828125623.GA346302@workstation.local>
References: <20250827092017.29014-1-tiwai@suse.de>
	<20250828125623.GA346302@workstation.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Thu, 28 Aug 2025 14:56:23 +0200,
Takashi Sakamoto wrote:
> 
> > Takashi Iwai (19):
> >   ALSA: firewire: bebob: Use guard() for mutex locks
> >   ALSA: firewire: dice: Use guard() for mutex locks
> >   ALSA: firewire: Use guard() for mutex locks
> 
> The patch title misses 'digi00x: '.

OK, will fix.

> >   ALSA: firewire: fireworks: Use guard() for mutex locks
> >   ALSA: firewire: motu: Use guard() for mutex locks
> >   ALSA: firewire: oxfw: Use guard() for mutex locks
> >   ALSA: firewire: tascam: Use guard() for mutex locks
> >   ALSA: firewire: fireface: Use guard() for mutex locks
> >   ALSA: firewire: isight: Use guard() for mutex locks
> >   ALSA: firewire: lib: Use guard() for mutex locks
> >   ALSA: firewire: bebob: Use guard() for spin locks
> >   ALSA: firewire: dice: Use guard() for spin locks
> >   ALSA: firewire: digi00x: Use guard() for spin locks
> >   ALSA: firewire: fireface: Use guard() for spin locks
> >   ALSA: firewire: fireworks: Use guard() for spin locks
> >   ALSA: firewire: motu: Use guard() for spin locks
> >   ALSA: firewire: oxfw: Use guard() for spin locks
> >   ALSA: firewire: tascam: Use guard() for spin locks
> >   ALSA: firewire: lib: Use guard() for spin locks
> 
> In my opinion, 'scoped_guard()' is available without blaces when the
> inner component is just one line, however the above patches include
> such lines. Additionally, some parts of scoped_guard() are followed by
> useless blank line.

OK, will fix in v2, too.


thanks,

Takashi
