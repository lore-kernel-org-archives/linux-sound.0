Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1AF4071CE
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780825538; cv=none; b=jijWKmYy74GVixws4Zq9ycjoFgPrgwJhZZQFFFHpkKA+biQhqoOKZu+Hw8Nnp9a08q5Ew8DrOS1BAtvShC7NItH2xfFyz8CtAB8lK7i5izj4AdnM9sEiSUaYmVM0N9n+FBbWWqx+MXzgo99AvAtnu0zZkW8tOz/rEZHB8K2pZgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780825538; c=relaxed/simple;
	bh=lIiWgSID/xwMi+59IWKCPuqc22kL8ZE5lM2hOP1tO/M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q07QdyiXcaSB/iG8zpzmR5p5+yhGukJb6toLQfIpUMuWRj6xgfxL4gJa39GXf2tcVE+ZMWSjo0B3clzydhXQQxiIwAAgIkF6LTvCaFQmad9WXtMS0dXKrUg6nweRx3efP4yutdE8kW6Hz1AvW0CW8TUVQ2svCFugJpNFOAJvhdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s01ZUdqj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B4l+nRVe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s01ZUdqj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B4l+nRVe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s01ZUdqj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B4l+nRVe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s01ZUdqj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B4l+nRVe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 821B16AA4E;
	Sun,  7 Jun 2026 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780825529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=clU5o8M085Z8kf7IhVKxV6YyEfPfwP0ImtrG0Bw1nAQ=;
	b=s01ZUdqjhc5hfOkiP5FGQWZacOXWRekugFAM2/+ayJUCp8t2sa+a8HABW+YFoZCDL6u+vO
	PfOkX5HmSiIFyVsQjKz0s2v46IMiH39hh+1VKHgA4PW0JbnolwA4cSYcCGXVbjEooPGak/
	KQ6j0ncuel6cvXqliPzPG9vb6+qvmL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780825529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=clU5o8M085Z8kf7IhVKxV6YyEfPfwP0ImtrG0Bw1nAQ=;
	b=B4l+nRVeEJwKiMFPTNm1BUyTR4L4lZOV7YMSgTCu1QsCITaPGJsaXQAZgge3h89dZtyE6x
	KLfUbRew7Ie73VDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780825529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=clU5o8M085Z8kf7IhVKxV6YyEfPfwP0ImtrG0Bw1nAQ=;
	b=s01ZUdqjhc5hfOkiP5FGQWZacOXWRekugFAM2/+ayJUCp8t2sa+a8HABW+YFoZCDL6u+vO
	PfOkX5HmSiIFyVsQjKz0s2v46IMiH39hh+1VKHgA4PW0JbnolwA4cSYcCGXVbjEooPGak/
	KQ6j0ncuel6cvXqliPzPG9vb6+qvmL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780825529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=clU5o8M085Z8kf7IhVKxV6YyEfPfwP0ImtrG0Bw1nAQ=;
	b=B4l+nRVeEJwKiMFPTNm1BUyTR4L4lZOV7YMSgTCu1QsCITaPGJsaXQAZgge3h89dZtyE6x
	KLfUbRew7Ie73VDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D080779A7;
	Sun,  7 Jun 2026 09:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cgaPELk9JWo3PAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Jun 2026 09:45:29 +0000
Date: Sun, 07 Jun 2026 11:45:28 +0200
Message-ID: <87a4t6smyv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: es18xx: check control allocation before private data setup
In-Reply-To: <20260607074219.3-1-ruoyuw560@gmail.com>
References: <20260607074219.3-1-ruoyuw560@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 

On Sun, 07 Jun 2026 09:42:19 +0200,
Ruoyu Wang wrote:
> 
> snd_es18xx_mixer() creates controls with snd_ctl_new1() and then stores
> bookkeeping pointers or sets private_free before calling snd_ctl_add().
> snd_ctl_new1() can return NULL on allocation failure, so those writes
> can dereference a NULL control pointer.
> 
> Check the returned control pointers before using them and return -ENOMEM
> on allocation failure.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> v2:
> - Rebase on sound.git for-next.
> - Resend only es18xx; the other v1 patches are already in for-next.

Applied to for-next branch now.  Thanks.


Takashi
