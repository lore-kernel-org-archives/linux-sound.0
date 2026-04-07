Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C33BADB8
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568950; cv=none; b=FJcsRmcCAohSnm2FNP2bpw8WtY/ZWUhlJRWn3+6l7bYFjsmd7rpYGXF22L0nGNSsbnxvOEyLbISe7n5tzjRjs56i1BhwB1A480pvRvsvKb+NRVdLeeZF36q6QVtE862Q+RlJUQwWuGI7LRAJ0HTNidVIir9p0sbY6QQDrYdBWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568950; c=relaxed/simple;
	bh=+jgmSHURZVmmy2VDbvj5IN01c/RlW0tnTNPjTwMboDw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6gSCXLFOWKbKy0uqXmqgbblMHDv9ADUyAUZ0VsWLbsGDfUeYnd6VUTRK+INPDJezsvABdzZmVnvzaQbLIN7SOU0RONtpApxA43RyQzQ1fw8k8r4CNeDzypBqAry608OeTp33NgWe+bMzwyMU6sPe9P/C8R4Xh4NoN1S1YLELBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FqKUCfV9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H7xUNlfW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FqKUCfV9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H7xUNlfW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FqKUCfV9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H7xUNlfW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FqKUCfV9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H7xUNlfW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B7D65BD6C;
	Tue,  7 Apr 2026 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775568941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8c/7TaD+qsOhX/6BsNn3bOVCAHIWo7oXU6AMSdFnzvw=;
	b=FqKUCfV9Oi9LE9R6coD8F3FMXf4yBQJYNY/OMKULeOscLWC5K7w144akL+qOAYn3shmlJ6
	O6Fyc36XRM/BEZ8A8MezC78iYnnjEV6OGQpu3jo6+j8aAhbUkOwmkBLz9yfkwIi3MBAKW9
	57j8yS1elXhtFU+8enk9pejNz/AZzWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775568941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8c/7TaD+qsOhX/6BsNn3bOVCAHIWo7oXU6AMSdFnzvw=;
	b=H7xUNlfW1BbFffJFoFyBVjf5Yp8JusdxuDQhZjV4QKR0Qf0MZ8je9SM7GuiTduc19+ektY
	TgfvKIljGNlWeMDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FqKUCfV9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H7xUNlfW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775568941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8c/7TaD+qsOhX/6BsNn3bOVCAHIWo7oXU6AMSdFnzvw=;
	b=FqKUCfV9Oi9LE9R6coD8F3FMXf4yBQJYNY/OMKULeOscLWC5K7w144akL+qOAYn3shmlJ6
	O6Fyc36XRM/BEZ8A8MezC78iYnnjEV6OGQpu3jo6+j8aAhbUkOwmkBLz9yfkwIi3MBAKW9
	57j8yS1elXhtFU+8enk9pejNz/AZzWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775568941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8c/7TaD+qsOhX/6BsNn3bOVCAHIWo7oXU6AMSdFnzvw=;
	b=H7xUNlfW1BbFffJFoFyBVjf5Yp8JusdxuDQhZjV4QKR0Qf0MZ8je9SM7GuiTduc19+ektY
	TgfvKIljGNlWeMDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 239E94A0B0;
	Tue,  7 Apr 2026 13:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SzsoCC0I1WkgWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Apr 2026 13:35:41 +0000
Date: Tue, 07 Apr 2026 15:35:36 +0200
Message-ID: <87bjfunb9z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: perex@perex.cz,
	tiwai@suse.com,
	chleroy@kernel.org,
	zzzccc427@gmail.com,
	nathan@kernel.org,
	mehulrao@gmail.com,
	bigeasy@linutronix.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] ALSA: pcm: Drop the space after ! operator
In-Reply-To: <20260403132301.2743319-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260403132301.2743319-1-claudiu.beznea.uj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,gmail.com,linutronix.de,vger.kernel.org,bp.renesas.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4B7D65BD6C

On Fri, 03 Apr 2026 15:23:01 +0200,
Claudiu wrote:
> 
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Drop the space after ! operator to follow the coding style.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In general we don't apply a patch only fixing the white-space or
trivial coding style issues alone, especially for the files that
aren't really much modified.

If you have a cleanup as a prerequisite for the further changes, I'll
happily pick up together, though.


thanks,

Takashi
