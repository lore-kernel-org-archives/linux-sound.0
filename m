Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1E30498E
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468506; cv=none; b=X9CGAL12AeDTVPLOQtXS7Ry7qaCe8Hr3YiXLKxPbf0uyu+Yo2CSplY36+2hoRDjSHR4VbOMFy+wXj04KXzZo+xmYqKt9LrDabOfj5cZbfBa2aujED1I6JAVLNr12cu6c7lPExTw2VfHuMGgcOKLgDsYkw+bGW24C2fWBKBmE2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468506; c=relaxed/simple;
	bh=cFaKaRtvcSZuYYrBoyX6A8LLl9WDveby/75BzhmwFJM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+igzHwxLCzzsKSoIEnDvXIks64URQJbsqs35CQ0BlUyW8fKeckz9G+gVy4zC0Lc0Vuhcqne6GeGY18XwJGEfQ9tmCWbl02C4Zzohxr/I4ZH0evS9SRpLflBg/eKHd4mexhri17pT9Uib+TUk+KOGv6t383TyqvKclI7wK9/HNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H1qzomQn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nyd4mdaU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H1qzomQn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nyd4mdaU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H1qzomQn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nyd4mdaU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H1qzomQn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nyd4mdaU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99E725BD76;
	Mon,  2 Mar 2026 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772468503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AABORxxqsx/AjlD779j7yMa8l0BRAbw7mzaFWb35r24=;
	b=H1qzomQnBOQ5+1zMePiCtLDftS7+IIDjNv4d+m83foNKn/7cu4epmID/LbZ0knjgd2EV0E
	5zLLV9H6teZ419mz2AzHm+zpX5CEpGDTJAolPUTb3q4IMdcqqhiwH3FfI00unnYhQmWlzr
	qDWlFQtXkLSywAieCZHBMBwdNc6NWAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772468503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AABORxxqsx/AjlD779j7yMa8l0BRAbw7mzaFWb35r24=;
	b=Nyd4mdaUNIHnrBwWmelmLOwxaJW9VBRbO2FYCrO7oBMhZAF+CX30gw51gBRmAAiPdKDhN/
	pJS5Xl0+vT+6QeBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H1qzomQn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Nyd4mdaU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772468503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AABORxxqsx/AjlD779j7yMa8l0BRAbw7mzaFWb35r24=;
	b=H1qzomQnBOQ5+1zMePiCtLDftS7+IIDjNv4d+m83foNKn/7cu4epmID/LbZ0knjgd2EV0E
	5zLLV9H6teZ419mz2AzHm+zpX5CEpGDTJAolPUTb3q4IMdcqqhiwH3FfI00unnYhQmWlzr
	qDWlFQtXkLSywAieCZHBMBwdNc6NWAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772468503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AABORxxqsx/AjlD779j7yMa8l0BRAbw7mzaFWb35r24=;
	b=Nyd4mdaUNIHnrBwWmelmLOwxaJW9VBRbO2FYCrO7oBMhZAF+CX30gw51gBRmAAiPdKDhN/
	pJS5Xl0+vT+6QeBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F5E23EA69;
	Mon,  2 Mar 2026 16:21:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rQDaHRe5pWkpNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Mar 2026 16:21:43 +0000
Date: Mon, 02 Mar 2026 17:21:43 +0100
Message-ID: <87qzq2kxrc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 99E725BD76
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 02 Mar 2026 15:30:31 +0100,
Gilberto Ferreira wrote:
> 
> Hi there.
> 
> This is my first post here.
> I have compiled both RC1 and RC2 for kernel 7 and after booting with
> it, no HDMI sound at all.
> This my laptop:
> 
> Operating System: Kubuntu 26.04
> KDE Plasma Version: 6.6.1
> KDE Frameworks Version: 6.23.0
> Qt Version: 6.10.2
> Kernel Version: 6.19.5 (64-bit)
> Graphics Platform: X11
> Processors: 12 × AMD Ryzen 5 5625U with Radeon Graphics
> Memory: 64 GiB of RAM (47.0 GiB usable)
> Graphics Processor: AMD Radeon Graphics
> Manufacturer: Positivo Bahia - VAIO
> Product Name: VJFE69F11X-B0411H
> 
> With kernel 6.19, even the RC's works perfectly fine.
> This is how I compiled the kernel:
> 
> git clone from Linus github
> cd linux
> make mrproper
> cp /boot/config-$(uname -r) .config
> fakeroot make -j$(nproc) deb-pkg
> 
> 
> Hope this can be fixed soon.

Could you give a bit more details?  How it "doesn't work"?
Is the device completely gone?  Or the playback breaks and doesn't
proceed or error?  Or does it output only silence?

You can check /proc/asound/cards and aplay -l output whether you can
see the sound devices at least from both working and broken kernels.

And, if they look different, compare the kernel logs (dmesg ouput)
between them to figure out any relevant differences.

And, beware that HDMI problems are often about the graphics drivers,
not the sound drivers.


Takashi
