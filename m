Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F5D37F10D
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 16:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803396; cv=none; b=hzxt2NZp/YN60R/+U0iNB6Id2L8oYrIvia4DLrpBwTTU16bELrCbTB7cuRtZg+3RU00xJ2GcrpdG+YJdBVRkoKTHkKsS0ZAQc8g49v+OaLg+xHzM94YQSE1auYosgMMj18c6BAGLwlPBvBwQvONV9l8lPJhLxJE6NsRxFui2b2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803396; c=relaxed/simple;
	bh=8RL6R6fM/VegbwzUO2GuiTngOFstVDZ2M4+SFkOn6HY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcYi6fW3FDcXHSFU8q/QVzgnLx6zbdNXzyJSUDBmjJYcsImLxyyFvwi3XpJyZN4lXfyFo/STZVWbys4S1h9X3TzqAQKRy/tQ6/yv3ZF/G1zmv/t9HBlQ0C3QWfQWmlhkGJNIu8Pb0sLUtHJK+8LlyWu/+vEXc/VbWFv4hTt98fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SviSeoGK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5oWKOJe9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SviSeoGK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5oWKOJe9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SviSeoGK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5oWKOJe9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SviSeoGK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5oWKOJe9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 521B73406E;
	Wed,  7 Jan 2026 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767803381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5G/1EToJIT2/9Lu/JaS0G3U4+J0vly2eYW/i6/Fux8=;
	b=SviSeoGKtGzf0deufsxXs0zxIzTWYdlalARQhD54hleFbBEXlxmGtF9f7ZrZ7aF+ZzU+cj
	BrdFi4NkPjzwopGZwvvekv6IJc6m+g2s8buhMuxmeLWH+mFNU084PHPRuzYQwG9p8mj4MC
	dmgbpdzQGg6QIK4gRgGlAjuMFcjdHzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767803381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5G/1EToJIT2/9Lu/JaS0G3U4+J0vly2eYW/i6/Fux8=;
	b=5oWKOJe9B6VOD4SIWggs9liPg2pd4eiNExUDngX7X8A6+iAHeMNIS4cqDT+O638KbZ4kFe
	UcDxCD1XZGtDMsCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SviSeoGK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5oWKOJe9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767803381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5G/1EToJIT2/9Lu/JaS0G3U4+J0vly2eYW/i6/Fux8=;
	b=SviSeoGKtGzf0deufsxXs0zxIzTWYdlalARQhD54hleFbBEXlxmGtF9f7ZrZ7aF+ZzU+cj
	BrdFi4NkPjzwopGZwvvekv6IJc6m+g2s8buhMuxmeLWH+mFNU084PHPRuzYQwG9p8mj4MC
	dmgbpdzQGg6QIK4gRgGlAjuMFcjdHzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767803381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5G/1EToJIT2/9Lu/JaS0G3U4+J0vly2eYW/i6/Fux8=;
	b=5oWKOJe9B6VOD4SIWggs9liPg2pd4eiNExUDngX7X8A6+iAHeMNIS4cqDT+O638KbZ4kFe
	UcDxCD1XZGtDMsCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 179B03EA63;
	Wed,  7 Jan 2026 16:29:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BC9rBPWJXmmpPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Jan 2026 16:29:41 +0000
Date: Wed, 07 Jan 2026 17:29:40 +0100
Message-ID: <87pl7lgzd7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karsten Hohmeier <linux@hohmatik.de>
Cc: carnil@debian.org,
	1121535@bugs.debian.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de,
	waxhead@dirtcellar.net
Subject: Re: Bug#1121535: UBSAN: array-index-out-of-bounds in [...]sound/pci/ctxfi/ctamixer.c:347:48
In-Reply-To: <20251226172103.5473-1-linux@hohmatik.de>
References: <aSqpiDfrvIyUt813@eldamar.lan>
	<20251226172103.5473-1-linux@hohmatik.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 521B73406E
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Fri, 26 Dec 2025 18:21:03 +0100,
Karsten Hohmeier wrote:
> 
> Hello. I am another affected user.
> I applied the suggested patch by Takeshi on top of 6.18.2 (in case it got already fixed).
> 
> But this just gives
> 
> > Dez 26 17:24:13: dtest kernel: UBSAN: array-index-out-of-bounds in sound/pci/ctxfi/ctamixer.c:344:48
> > Dez 26 17:24:13: dtest kernel: index 10 is out of range for type 'unsigned char [9]'
> 
> as the error. Making the struct even larger gives
> 
> > Dez 26 17:39:35 dtest kernel: UBSAN: array-index-out-of-bounds in sound/pci/ctxfi/ctamixer.c:344:48
> > Dez 26 17:39:35 dtest kernel: index 32 is out of range for type 'unsigned char [32]'
> 
> Could you take another look?

OK, then we seem scratching a wrong surface.
How about the changes below?


Takashi

-- 8< --
--- a/sound/pci/ctxfi/ctamixer.c
+++ b/sound/pci/ctxfi/ctamixer.c
@@ -205,6 +205,7 @@ static int amixer_rsc_init(struct amixer *amixer,
 
 	/* Set amixer specific operations */
 	amixer->rsc.ops = &amixer_basic_rsc_ops;
+	amixer->rsc.conj = 0;
 	amixer->ops = &amixer_ops;
 	amixer->input = NULL;
 	amixer->sum = NULL;
@@ -367,6 +368,7 @@ static int sum_rsc_init(struct sum *sum,
 		return err;
 
 	sum->rsc.ops = &sum_basic_rsc_ops;
+	sum->rsc.conj = 0;
 
 	return 0;
 }
