Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68A430CF0
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507678; cv=none; b=W04cEJLlA+o6M3NZpH7CNDIC2lHWOmceAYd6Sf5OcljX/ekMXrGCT3VUNoblPOpGev6YrY+4v5Kw6bRQyGkl/VeXbOmSvwsX/vZmgcZlA1HWCU5TY8lhYpbaXFFKoxy4lhVEpmZAqN1DtoAi2/+N5i/qrMF1rYLhA+5PnYOajyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507678; c=relaxed/simple;
	bh=8DyqhQ+lCFC2LddAQIyTBxkA0FDSF1fi6D6rlYyYYe8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzCMZ+gb0hN75K5tRZobUnArsksMC0uEVUgaXXNyiFh3px/V+RrxtPy5zZh7ROuv5AyYpl6wMnCcxmkUDjQTL2Uq+59PNJgayUPDmp5zMbCtptHELCPjMShY5vqvIdtOpHiJvfDWf9EcR7MsTT/NvmbouXQ/k5JcJXKM3zcvfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TL5VuRd4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rb2bpuvg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TL5VuRd4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rb2bpuvg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TL5VuRd4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rb2bpuvg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TL5VuRd4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rb2bpuvg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CF0B75FE3;
	Wed,  8 Jul 2026 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lz/ya/EOjSeW1m2Yb1/kY/uLZ2WxMENC5BZut2Pu5iU=;
	b=TL5VuRd4Nb4oY8pqGHcorP8CD1wHNw61bHNJ3v1m+ITB5VwqridCQHkW/bCxj1yfnVUw7F
	mz1ymlademrHT1bXwm568ScdHH+YxVzYrtxNby+M+JNusf7GCW5b8al3m7jtY++VKlsZK2
	CPCT9tHerHkQv5jXYeKe51+1oF8CZCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lz/ya/EOjSeW1m2Yb1/kY/uLZ2WxMENC5BZut2Pu5iU=;
	b=Rb2bpuvgfFGj0aubar3GAPulfOhCNY78LUO35b4pguJCHYNflwin67OuXbuyhP/DJSrq8W
	54JT/4Vxj2PPEZAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TL5VuRd4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Rb2bpuvg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lz/ya/EOjSeW1m2Yb1/kY/uLZ2WxMENC5BZut2Pu5iU=;
	b=TL5VuRd4Nb4oY8pqGHcorP8CD1wHNw61bHNJ3v1m+ITB5VwqridCQHkW/bCxj1yfnVUw7F
	mz1ymlademrHT1bXwm568ScdHH+YxVzYrtxNby+M+JNusf7GCW5b8al3m7jtY++VKlsZK2
	CPCT9tHerHkQv5jXYeKe51+1oF8CZCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lz/ya/EOjSeW1m2Yb1/kY/uLZ2WxMENC5BZut2Pu5iU=;
	b=Rb2bpuvgfFGj0aubar3GAPulfOhCNY78LUO35b4pguJCHYNflwin67OuXbuyhP/DJSrq8W
	54JT/4Vxj2PPEZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FA5D779AE;
	Wed,  8 Jul 2026 10:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wtRpDtIqTmoMJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:47:46 +0000
Date: Wed, 08 Jul 2026 12:47:45 +0200
Message-ID: <87y0fl4v1q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Kshamendra Kumar Mishra" <kshamendrakumarmishra@gmail.com>
Cc: <linux-sound@vger.kernel.org>,
	<tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Add mic mute LED quirk for HP Laptop 15-fd0xxx
In-Reply-To: <DJSOWKFBTJH8.2Z7EPWX514QXM@gmail.com>
References: <DJSOWKFBTJH8.2Z7EPWX514QXM@gmail.com>
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
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5CF0B75FE3
X-Spam-Score: -3.51

On Wed, 08 Jul 2026 00:24:57 +0200,
Kshamendra Kumar Mishra wrote:
> 
> From: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>
> Date: Tue, 7 Jul 2026 22:07:44 +0530
> Subject: [PATCH] hda/realtek: Add mic mute LED quirk for HP Laptop 15-fd0xxx
> 
> The HP Laptop 15-fd0xxx uses GPIO bit 0 to control the mic mute LED,
> but currently the quirk only enables the speaker mute LED (via coef
> bit). Switch to the existing ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO
> fixup which additionally registers a GPIO-based mic mute LED, mapping
> to the same verbs (SET_GPIO_DATA/SET_GPIO_DIRECTION bit 0) that the
> platform firmware uses.
> 
> Signed-off-by: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>

Applied now.  Thanks.


Takashi
