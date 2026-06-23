Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797BC364028
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207991; cv=none; b=WmA/npShgTeGtRaM9GCBaMnr4UDzufZCFhcKVFZiCIL2/91Oymb1OPrQYJhx+QGuwXA00cV/VIa+BD0+CSDJbm9ctXcT4b+xuojSGjSI5ix4jwgDQzfdI1NInEhjISeXv5J2IqMayp2UjskRhdFdYh1MkdBvRAHd4H23BR3QoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207991; c=relaxed/simple;
	bh=gGbpQQ2bEGaM5w6jkn+D5xEsWR8ZqmxfpKVXbJgQgi8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrczQtyhhdcfq7f7Tpq0AQnRu9c3Whh15KnLQY8HzimWDx58J3YUSbdAt4IVKwMV77USvHu2KWZJcqJEc5MJFEZQt/DVvLxL1RLBMVesEk+oGWnFkJ1RuSb6RGdAXPo/2fuDMztJf5igbYyt+hr5BNI/VX4ZmBIhUGhl1oCLSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Bv6lIfn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qBq3hG5J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Bv6lIfn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qBq3hG5J; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Bv6lIfn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qBq3hG5J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Bv6lIfn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qBq3hG5J"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B44C75B70;
	Tue, 23 Jun 2026 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782207988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9nUw6pwSv/c7bT4NtnIMidTVYn91vMYZXpCUQQCiRw=;
	b=2Bv6lIfni2Ei7Ygr2yL9JApSma1VxPWdQbw5i3hqp9dowDl+I0awG7rTlVAFtL9pa8tT1o
	nHcKro1CVu10bAPyA8Y8K+NTUMYCBF8lf9GIlSpdrtaPHPz85EKZ1fw5xBX3YrZ1wYyBKO
	qdjqRFTheX8+XvO/CaKwz2aVK1wQwOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782207988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9nUw6pwSv/c7bT4NtnIMidTVYn91vMYZXpCUQQCiRw=;
	b=qBq3hG5JlpAAvkkrrGlG9OrtH57DzJ8Wh7Kh8WDHE+brgRIsd0gCSKtYzXvM4bbuTfibAl
	oLR+eBN2ZzGccsDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2Bv6lIfn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qBq3hG5J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782207988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9nUw6pwSv/c7bT4NtnIMidTVYn91vMYZXpCUQQCiRw=;
	b=2Bv6lIfni2Ei7Ygr2yL9JApSma1VxPWdQbw5i3hqp9dowDl+I0awG7rTlVAFtL9pa8tT1o
	nHcKro1CVu10bAPyA8Y8K+NTUMYCBF8lf9GIlSpdrtaPHPz85EKZ1fw5xBX3YrZ1wYyBKO
	qdjqRFTheX8+XvO/CaKwz2aVK1wQwOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782207988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9nUw6pwSv/c7bT4NtnIMidTVYn91vMYZXpCUQQCiRw=;
	b=qBq3hG5JlpAAvkkrrGlG9OrtH57DzJ8Wh7Kh8WDHE+brgRIsd0gCSKtYzXvM4bbuTfibAl
	oLR+eBN2ZzGccsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75C93779AB;
	Tue, 23 Jun 2026 09:46:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oXbWG/RVOmqkFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Jun 2026 09:46:28 +0000
Date: Tue, 23 Jun 2026 11:46:28 +0200
Message-ID: <87echxd1xn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: FCP: Add Focusrite ISA C8X support
In-Reply-To: <ajlw4HK+2RSW3nUl@m.b4.vu>
References: <ajlw4HK+2RSW3nUl@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8B44C75B70
X-Spam-Score: -3.51

On Mon, 22 Jun 2026 19:29:04 +0200,
Geoffrey D. Bennett wrote:
> 
> Add USB PID 0x821e to the list of devices handled by the Focusrite
> Control Protocol (FCP) driver.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> ---
> Trivial new-device enablement: the ISA C8X uses the same FCP control
> interface as the Scarlett 16i16/18i16/18i20 4th Gen, so only the USB
> PID needs adding. Device attach and device-map retrieval confirmed on
> a pre-production unit.

Applied now.  Thanks.


Takashi
