Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A3379EDC
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 06:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170810; cv=none; b=TPBKBgdqK6mt+K64p8OWg6ukEvOpyKqwb8uPppGCAuYy3KafPKbIuMgWn++TI5Yd8dssVFPmi9pXqn6wua6EEAr22WdTWjpfsdaRo2SQG7fJTgWyi7IurWbUhY/o5dGecLXPUEn7Nt1MpZH254RsViO3q+ga0D0f5CK76yEFBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170810; c=relaxed/simple;
	bh=AHgy8MKDeT806wsyFNUkoJ8pRolw2iTwf+mi602TDGI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVDjE7WMJ2QVF3M1nOR2OSsFOMwVPwqyp19c/4Pv+MW1usBcoLRqKQl9CLPa/mBR2GPKr0VIuKiL9psOHw5SONF8au6YRgTdfVlOATQ4W5kMzu14D4wNFndTgPqI+IFI63v9w6EGzm1GR9JPcX/EzmnluuMyUINI4CNLzghC2jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vy4/ortU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OOAGOVyf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vy4/ortU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OOAGOVyf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vy4/ortU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OOAGOVyf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vy4/ortU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OOAGOVyf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 839995DC4D;
	Tue, 19 May 2026 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779170807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+yMEB2+ZvDznLCzG2LayW0U8gbhhHBhKawEZpTGVEfM=;
	b=vy4/ortUZvebSDI3of+ZgNI2SAlLAGSctQNEYHpmpPH/E4zpYo36TPqg+VuEnUE4ynrVbl
	9jSBcxw0iVukayfaUWA/3LKi7vgfMD2Z8QTKeBGPqjyUK2iH1Ss1s8DmIqWY7lfmQkEVMU
	bPdsJtched+41R63OnXDSeXWBb8Snvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779170807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+yMEB2+ZvDznLCzG2LayW0U8gbhhHBhKawEZpTGVEfM=;
	b=OOAGOVyfbJ2sOvMZOdThK4XlNkWzwN1VUr1zgzBr+HsMTJwXdF3NKK+rVtnQ+tTVaJN1wr
	Rn93fy6suIye12CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vy4/ortU";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OOAGOVyf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779170807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+yMEB2+ZvDznLCzG2LayW0U8gbhhHBhKawEZpTGVEfM=;
	b=vy4/ortUZvebSDI3of+ZgNI2SAlLAGSctQNEYHpmpPH/E4zpYo36TPqg+VuEnUE4ynrVbl
	9jSBcxw0iVukayfaUWA/3LKi7vgfMD2Z8QTKeBGPqjyUK2iH1Ss1s8DmIqWY7lfmQkEVMU
	bPdsJtched+41R63OnXDSeXWBb8Snvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779170807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+yMEB2+ZvDznLCzG2LayW0U8gbhhHBhKawEZpTGVEfM=;
	b=OOAGOVyfbJ2sOvMZOdThK4XlNkWzwN1VUr1zgzBr+HsMTJwXdF3NKK+rVtnQ+tTVaJN1wr
	Rn93fy6suIye12CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69BB4593AA;
	Tue, 19 May 2026 06:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ixEgGff9C2o1fwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 06:06:47 +0000
Date: Tue, 19 May 2026 08:06:39 +0200
Message-ID: <878q9g3pcg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: usb-audio: Use flexible allocation for FCP packets
In-Reply-To: <20260519004834.627676-1-rosenp@gmail.com>
References: <20260519004834.627676-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 839995DC4D
X-Spam-Level: 

On Tue, 19 May 2026 02:48:34 +0200,
Rosen Penev wrote:
> 
> Allocate FCP request and response packets with kmalloc_flex() for
> the trailing packet data instead of passing the computed struct size
> directly to kmalloc().
> 
> Keep the computed packet sizes for the USB transfer length checks.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
