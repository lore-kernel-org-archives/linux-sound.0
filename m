Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24490322C88
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859029; cv=none; b=UeXNabMbfwIsywVYRiwqMvZyaD8VUlQ8mPgnoSOoxZ8Zihobk9Mpgxab0xRT85lo75g6lNaL9Ije9grbcKz/C6ykVcTUVuLeRbiSB4nKLMZf/FUP7fVDzGu2FHfARcAC00XRk7+23raWyOpyFm+VTM7FcMVpdmBTINXSX9CAfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859029; c=relaxed/simple;
	bh=2zs8S0DvzYom5nXoMgQ4XRfqT0/l2/DH88hSXK51gMc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZfTfmHV5PqMljOxxz9rn9+BLsRtrJVDXw/I1QzaT/T8kK8iw+12jspbRcrkESC7ckBVFmq2leo9yrSkjnYMH7wn8yOb0y/lEddvwGCPIUe5ggLfRm+wyTt2IgDWNzQICET7novyIKBQgeTeLx6c8Jlr6jQ3izsaY/zoUOEYNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QB9968v7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WsA0CEti; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QB9968v7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WsA0CEti; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QB9968v7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WsA0CEti";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QB9968v7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WsA0CEti"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61C4F6D687;
	Fri, 19 Jun 2026 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781859025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfqYO1lQQpNAP9KRWIUid8yQ7vPVpUrXCzTVW0pCBIk=;
	b=QB9968v7WwnR3HvzP1RpInFGKo2h/PZYkID0ZdMRl19Zbf7imusAHEgP39RJ7tGXGiaRBm
	B91lp0tanUlVyhSj6t+OJtCW+gJPV4h644jLANwJbCQEGD3LFYgLX8oynpVThno6YYuOoq
	O6kWm45GI6NyB8ligcfZH0fgfEWGUSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781859025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfqYO1lQQpNAP9KRWIUid8yQ7vPVpUrXCzTVW0pCBIk=;
	b=WsA0CEticurlIYHwnBN7UPHWRKyYlRuHUOdvn9vGPG2NuZfnmcqEyR/7+SP9EMDpDqFBiR
	VF9P+rQE9cCsFpCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QB9968v7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WsA0CEti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781859025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfqYO1lQQpNAP9KRWIUid8yQ7vPVpUrXCzTVW0pCBIk=;
	b=QB9968v7WwnR3HvzP1RpInFGKo2h/PZYkID0ZdMRl19Zbf7imusAHEgP39RJ7tGXGiaRBm
	B91lp0tanUlVyhSj6t+OJtCW+gJPV4h644jLANwJbCQEGD3LFYgLX8oynpVThno6YYuOoq
	O6kWm45GI6NyB8ligcfZH0fgfEWGUSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781859025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfqYO1lQQpNAP9KRWIUid8yQ7vPVpUrXCzTVW0pCBIk=;
	b=WsA0CEticurlIYHwnBN7UPHWRKyYlRuHUOdvn9vGPG2NuZfnmcqEyR/7+SP9EMDpDqFBiR
	VF9P+rQE9cCsFpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1B12779AB;
	Fri, 19 Jun 2026 08:50:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NO8HOdACNWriSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 08:50:24 +0000
Date: Fri, 19 Jun 2026 10:50:24 +0200
Message-ID: <875x3ekj73.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ramcharan Rajpurohit <b23ci1032@iitj.ac.in>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LED on HP EliteBook 840 G6
In-Reply-To: <20260619062435.26256-1-b23ci1032@iitj.ac.in>
References: <20260619062435.26256-1-b23ci1032@iitj.ac.in>
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 61C4F6D687
X-Spam-Score: -3.51

On Fri, 19 Jun 2026 08:24:35 +0200,
Ramcharan Rajpurohit wrote:
> 
> The HP EliteBook 840 G6 (PCI SSID 103c:854d) has an ALC215 codec whose
> mic-mute and audio-mute LEDs are wired to the same GPIOs as the already
> supported EliteBook 830 G6 and 840 G7. Without a matching quirk the LEDs
> are never registered, so the front-panel mic-mute LED stays permanently
> lit and does not track the mute state.
> 
> Apply ALC285_FIXUP_HP_GPIO_LED, mirroring the sibling EliteBook entries.
> With this fixup the codec registers an "hda::micmute" LED class device and
> the LED correctly follows the capture-mute state. This was verified on the
> affected machine by forcing the same fixup at runtime via
> snd_sof_intel_hda_generic.hda_model=103c:8548, which made the LED work as
> expected.
> 
> Signed-off-by: Ramcharan Rajpurohit <b23ci1032@iitj.ac.in>

Applied now.  Thanks.


Takashi
