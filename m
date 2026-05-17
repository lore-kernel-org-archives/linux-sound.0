Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B754502F
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779047372; cv=none; b=ehIL8oxJonew8iHTHMylnm3DOTrC35japO1fRnnW2KBzwuPaZe1JPlVTMHObKif/h2nKL5afsz6Vqhv/oFzD9xioojF3b1lID/9m4VXjaZ6Ygo1br+FqqIlq3lQOlUEnhsZNpVooZdMG0yrePX8N9xPB5Cwz9hOf+jiDdaEugQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779047372; c=relaxed/simple;
	bh=ED/IhnZmfmk340VQ7v/DrnYNmuNCn8kVEfpdVrH06g0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAF1nYcgjiELsR95dUmZ7Kwgn4rXki7pCsFlE44+3gWw7QiONApnc0mmf4eo6gBCAM9h0xRX6V2Pn9zVnPJ3tLjDIheX34tm87fp9UOBoCkqsIkDfzlci2ixIfo8fwZvCa6HIGcQ7DPxHQ9AVRe4/UJvNzb+1+olWi0cGKwEAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vDigHXol; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v3KERloS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vDigHXol; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v3KERloS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vDigHXol";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v3KERloS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vDigHXol";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v3KERloS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8BA906AD5B;
	Sun, 17 May 2026 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779047369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUDOpbtBBLCesti4O1F32n9KZv1NZ5UKAxativOCUf4=;
	b=vDigHXolKhhMcSwRggAd8U7glkDnA5LhBbJGbSJGFZaOnMSw+8+24KSmZbmlk6wi0nLMR6
	ZrUDu7S+TwXwLntmnzHufH9UUTmisRZGqQRfQJr/Kl2R+kHAFnGZQsiR39ANMR2HBIQI6V
	xP1GyrttwavNv3a5bjg0+H7ukUldH1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779047369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUDOpbtBBLCesti4O1F32n9KZv1NZ5UKAxativOCUf4=;
	b=v3KERloStdjzUsJZuNvGlcW1eBwpJTl3xJPiyvhKmuUHIRTQQk3j3bEMsRutEfupRYGq9F
	RaEQiA8sz1BUsWBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779047369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUDOpbtBBLCesti4O1F32n9KZv1NZ5UKAxativOCUf4=;
	b=vDigHXolKhhMcSwRggAd8U7glkDnA5LhBbJGbSJGFZaOnMSw+8+24KSmZbmlk6wi0nLMR6
	ZrUDu7S+TwXwLntmnzHufH9UUTmisRZGqQRfQJr/Kl2R+kHAFnGZQsiR39ANMR2HBIQI6V
	xP1GyrttwavNv3a5bjg0+H7ukUldH1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779047369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUDOpbtBBLCesti4O1F32n9KZv1NZ5UKAxativOCUf4=;
	b=v3KERloStdjzUsJZuNvGlcW1eBwpJTl3xJPiyvhKmuUHIRTQQk3j3bEMsRutEfupRYGq9F
	RaEQiA8sz1BUsWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71257593A8;
	Sun, 17 May 2026 19:49:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mfaoGckbCmqmYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 May 2026 19:49:29 +0000
Date: Sun, 17 May 2026 21:49:29 +0200
Message-ID: <87ik8lerzq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: grxp <grxp323@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add HP OMEN 16-n0000 mute LED quirk
In-Reply-To: <20260516190734.34721-1-grxp323@gmail.com>
References: <20260516190734.34721-1-grxp323@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Sat, 16 May 2026 21:07:34 +0200,
grxp wrote:
> 
> The HP OMEN 16-n0000 laptop uses an 
> ALC245 codec with a mute LED controlled by a coef register.
> Add the corresponding quirk to enable the mute LED.
> After testing, the LED brightness is consistent with Windows.
> 
> Signed-off-by: grxp <grxp323@gmail.com>

The Signed-off-by tag (and From tag, too) must be with either a real
name or a known identity as a legal requirement. 
Please correct it and resubmit.


thanks,

Takashi
