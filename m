Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542540B396
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822227; cv=none; b=RF3ONbnJTyzUz69K10Y+yoUUE7dTVNTkURvu/nRUNZRNleqHiyMBotHBTX3B4JxfuulHfrzDpTf8qTh6kaxKCacN6APbZoOiYXITqED5dX2wpBZibxtDfhUSXfYrgjDWKdF+v7oKwqYCQfOrNw9GxhXN9NLlkgp05+y+XKuQjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822227; c=relaxed/simple;
	bh=lSumlC0DP83SWrMT7wqm4zyWpbRy8eY3mxe9BCnunfQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcXjgoN0mg+gF9PgJF68UyD7gqn44DtSzY0mevON8dqx8jU9jgHv8s8x2Z0O5g3B5YRLBJOPD4tK4IXazWM4GbyktkXxEftMbq36yv2Xd6Em+WLMJSA2uK14tec3zfNFTudYmABASsm6i/iuuhlM8l0iYI9JC420t51FqD9n7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SbJfHOmF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FD4tq0Qg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SbJfHOmF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FD4tq0Qg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SbJfHOmF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FD4tq0Qg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SbJfHOmF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FD4tq0Qg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8ACC075D45;
	Tue, 30 Jun 2026 12:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782822224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KcFzUicltkjauG70eIfyl96YIYpqYecHdvyzuLwmAg=;
	b=SbJfHOmFJNfwf3fJaLZId6Of3hfcEBe/VLIQ8e8gGLOfGZFf34eG/KUSKkFZZZmJdlNdRD
	OK6tfdfv/R0ld4Zqwcp272pUeUEbtNb4sn1VQGjoECAh+sDsPAjVi768/R07RrkMr1YXWL
	AAkIgldFiTEBKkvUlhpLBeikp99eyJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782822224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KcFzUicltkjauG70eIfyl96YIYpqYecHdvyzuLwmAg=;
	b=FD4tq0QgxGkSBhWQjn7AAYB7UFSNo+cQbNacl6l/sOfg/NL6tOF90d+OBoE/EohDEcEDWa
	isvSYDHDdG2tkfCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782822224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KcFzUicltkjauG70eIfyl96YIYpqYecHdvyzuLwmAg=;
	b=SbJfHOmFJNfwf3fJaLZId6Of3hfcEBe/VLIQ8e8gGLOfGZFf34eG/KUSKkFZZZmJdlNdRD
	OK6tfdfv/R0ld4Zqwcp272pUeUEbtNb4sn1VQGjoECAh+sDsPAjVi768/R07RrkMr1YXWL
	AAkIgldFiTEBKkvUlhpLBeikp99eyJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782822224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KcFzUicltkjauG70eIfyl96YIYpqYecHdvyzuLwmAg=;
	b=FD4tq0QgxGkSBhWQjn7AAYB7UFSNo+cQbNacl6l/sOfg/NL6tOF90d+OBoE/EohDEcEDWa
	isvSYDHDdG2tkfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70EF1779A8;
	Tue, 30 Jun 2026 12:23:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aXfxGlC1Q2o5AgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Jun 2026 12:23:44 +0000
Date: Tue, 30 Jun 2026 14:23:43 +0200
Message-ID: <87jyrgw71s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: "Geoffrey D . Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: scarlett2: unwind notify URB init failures
In-Reply-To: <20260629160232.29158-1-alhouseenyousef@gmail.com>
References: <20260629160232.29158-1-alhouseenyousef@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, 29 Jun 2026 18:02:32 +0200,
Yousef Alhouseen wrote:
> 
> scarlett2_init_notify() stores the newly allocated URB in mixer->urb
> before allocating the transfer buffer and submitting the URB. If a later
> step fails, the function returns an error while leaving a partially
> initialized notification URB attached to the mixer.
> 
> Clean up the URB and transfer buffer locally on those failure paths.
> Leave mixer->urb NULL so later cleanup or retry paths do not see a
> stale notification URB.

Those are released by the common snd_usb_mixer_free() in the error
path of snd_usb_create_mixer(), hence no need to do here.


thanks,

Takashi
