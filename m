Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C9314D16
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433917; cv=none; b=tnygCr/zbws0CDyjJgwvHR2dBZ4MbiumO5A9S+drrvbipcfG6as/ILBVZaw0oCkgjiMOMOF2j5CMlTWjAy4KyyNPar8IDMGWqshvGvsE+zjokYU7lPg0DIWV3/wUYFf0UyT9ma5hpW0NEWGyds5d/rqwN1vvGZWhdG9Wz6RdSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433917; c=relaxed/simple;
	bh=3ZIy5oZn6YlfgiJjFUg6yGYCtzDkP/YRJ/wWPwTOeEo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RO4WURbXWC17hz0m6zv0/UrHypuepI3S5XV3mV2A9U2/ymMztH55GqlGtWgb6H8NOzllRjonrK7f80B51eO58GEDIbRU3W0szN/0Eaz6iRxClgvS/aQZeBpMS4qt5Sjnq8IEN70oqA8xON/T8SS05NoCvErxcrBj/eUxh6jt+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hW+kEEdV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E2fpOAnV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hW+kEEdV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E2fpOAnV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hW+kEEdV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E2fpOAnV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hW+kEEdV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E2fpOAnV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49EF775C0C;
	Tue,  7 Jul 2026 14:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783433914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dev0HUUs+K7lVkqkcbJ4tyaqIpOYSHdHc+DHFn2YS5I=;
	b=hW+kEEdVu+dR+FxafQeYF4oKVrK0FKx84UDDpui6jgjRyL9OX3FBd2pJkV9znXawWduC5c
	ezBsqRKMwHTLpSgcjfydE6F5W4TTkmscqI20u0ywG4vtNR3MHvsIe1uUit9GTjjrqwGOR+
	ZtLZrj99oL0TBmeo7htEgUw62yazGLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783433914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dev0HUUs+K7lVkqkcbJ4tyaqIpOYSHdHc+DHFn2YS5I=;
	b=E2fpOAnVXY7k4+ZvLhkJjGf4dMCHDWpEXYXk4O6Ozr3iDpCYXEDK/oEnKho5MxXUrjd3fj
	G3EIa2YfnQ/L6YAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hW+kEEdV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=E2fpOAnV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783433914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dev0HUUs+K7lVkqkcbJ4tyaqIpOYSHdHc+DHFn2YS5I=;
	b=hW+kEEdVu+dR+FxafQeYF4oKVrK0FKx84UDDpui6jgjRyL9OX3FBd2pJkV9znXawWduC5c
	ezBsqRKMwHTLpSgcjfydE6F5W4TTkmscqI20u0ywG4vtNR3MHvsIe1uUit9GTjjrqwGOR+
	ZtLZrj99oL0TBmeo7htEgUw62yazGLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783433914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dev0HUUs+K7lVkqkcbJ4tyaqIpOYSHdHc+DHFn2YS5I=;
	b=E2fpOAnVXY7k4+ZvLhkJjGf4dMCHDWpEXYXk4O6Ozr3iDpCYXEDK/oEnKho5MxXUrjd3fj
	G3EIa2YfnQ/L6YAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31EF4779AE;
	Tue,  7 Jul 2026 14:18:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dxaHC7oKTWoiXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jul 2026 14:18:34 +0000
Date: Tue, 07 Jul 2026 16:18:33 +0200
Message-ID: <871pde7uiu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Fix headphone output on ASUS ROG Ally X
In-Reply-To: <20260707005615.52889-1-matthew.schwartz@linux.dev>
References: <20260707005615.52889-1-matthew.schwartz@linux.dev>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 49EF775C0C
X-Spam-Score: -3.51

On Tue, 07 Jul 2026 02:56:14 +0200,
Matthew Schwartz wrote:
> 
> The ASUS ROG Ally X (RC72LA, PCI SSID 0x1043:0x1eb3) with an ALC294
> codec produces no sound from the headphone jack, and unplugging the
> headphones can leave the speakers muted too.
> 
> The device uses ALC287_FIXUP_TAS2781_I2C, which chains into the
> ThinkPad fixup chain. alc285_fixup_thinkpad_x1_gen7() makes the
> headphone (pin 0x21) and speaker (pin 0x17) share DAC 0x03. That is
> correct for a ThinkPad, but here the shared DAC is exposed as a
> "Line Out" control that defaults to zero, so the headphones stay
> silent when plugged in.
> 
> Add a dedicated fixup chain for the Ally X that sets up the TAS2781
> amplifier and the headset jack without the ThinkPad DAC sharing, and
> routes the speaker to DAC 0x02 so the headphone and speaker get
> independent DACs.
> 
> Also, fixup the wrong product code (it's RC72LA, not RCLA72).
> 
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Applied both patches now.  Thanks.


Takashi
