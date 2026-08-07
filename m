Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51DA38DC4A
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091921; cv=none; b=Q17CxoLnyofA6qvTRgGNJeK/JThzlI3uUfxfNIjxGNdEmr8vW2TZsCsVex1rERe+NK4iwn/SEeXZN9FfJDLY06xB02gKpYpjjoaGLrKOgJ6KQnE92XG5NP2evL6xdOw9bXOq2j0rCvGSpNyDViBehM4VoBjYzttKUMUpFd3Nufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091921; c=relaxed/simple;
	bh=FRPcgNMUCC1J/wKodpMaAL+Y1woVkUudvq7PurSkvJQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUen+fPajiASNQlys8G/SwDuqvHKO5JRhMNhV6C1pMTAG1jMAF+9ygYhwI3Fr587zqNkq13dnrrd46Hqpo8q291JNxX8foGTIh3soXwTw0bImka+WFHbv1ga1eN8DlO3eeSXsZ7ZNJfW3+R5pdQSMdIG7Rx5SPxcZDjMcQfKjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TKL9Obow; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wv4l836u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9hDTXdq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ir6o0ljD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TKL9Obow";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wv4l836u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9hDTXdq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ir6o0ljD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B875804D9;
	Fri,  7 Aug 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9UoBC+y8jT1dnUXPwD/c2IM67/DLyYGltX7ylVnDmww=;
	b=TKL9ObowgazjkMiaNFZ1spULpaYsBBgW1yziPxEEM4fwbHEmdthMWvVBrHD/o8wuzKLo7P
	ch2KtV0ONft9UuJvOvuYvqlYIGAKb5SOXN5Zn80JhQ2FGF8MRFFWH2gGHGdmOj4MJjTm68
	oLRV7K1l+iQtj4xMTHyzZURK3FefPFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9UoBC+y8jT1dnUXPwD/c2IM67/DLyYGltX7ylVnDmww=;
	b=wv4l836uSrnap0qI0POXs2VTFDn904ji5v9x+yvWQ2NfFU7HhgdsQ/hAxXUtnJkeegin7v
	XQaKhetMr7ahnGDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f9hDTXdq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ir6o0ljD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9UoBC+y8jT1dnUXPwD/c2IM67/DLyYGltX7ylVnDmww=;
	b=f9hDTXdqXO67tgKWyePt0B6KjECIYGAfBplOtwbbKwS8FwtCxs1leazDwNK7qPL4Oohcmo
	kVULJab9zta3M1eC34qUg0lUHrc8fAZ1jTVUL6Ggfb8zlI8lQPScK+8PBlsTGUxA4XtlbP
	mSN6HkVLYnGac7CdZcxWDNl7uS/PAcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091903;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9UoBC+y8jT1dnUXPwD/c2IM67/DLyYGltX7ylVnDmww=;
	b=Ir6o0ljDcAeF3o6tNMxlkQdf+KpxJM2Ir2qlOYe/+Y1TWHiTPXmw+x7KMBkRFbu+V3Kmcg
	xmr5t5WY1xWCzFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69918779B6;
	Fri,  7 Aug 2026 08:38:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WUqFGH+ZdWohVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 08:38:23 +0000
Date: Fri, 07 Aug 2026 10:38:22 +0200
Message-ID: <87y0eiba0x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shang En Sim <sim@shangen.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP Spectre x360 16-aa0xxx
In-Reply-To: <20260807055139.58707-1-sim@shangen.org>
References: <20260807055139.58707-1-sim@shangen.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,shangen.org:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 8B875804D9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Fri, 07 Aug 2026 07:51:27 +0200,
Shang En Sim wrote:
> 
> The HP Spectre x360 2-in-1 Laptop 16-aa0xxx with PCI subsystem ID
> 0x103c:0x8c17 only gets the CS35L41 amplifier setup from
> ALC287_FIXUP_CS35L41_I2C_2, so the speaker-mute and mic-mute keyboard
> LEDs do not work.
> 
> Use ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX like subsystem ID 0x8c16 so
> the mute LEDs work.
> 
> Tested on HP Spectre x360 2-in-1 Laptop 16-aa0xxx.
> 
> Signed-off-by: Shang En Sim <sim@shangen.org>

Applied to for-next branch now.  Thanks.


Takashi
