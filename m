Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1F377038
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887925; cv=none; b=nlQk81ZtNv90w5RB+VgqrZ28SBkFSGcbXDyJvGd5Yl/XiTAYiqLXMYJCjuh7EHnLciu3F0XoB9KLW5RQk8y4vigSvx/pstkXShUYZ32YtxoZbVZXCdoZHzyvhiJ9gw2xdJDHmrAtajHux0AX4Nu1My9a4ntxSIVCkZr/3rw9KlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887925; c=relaxed/simple;
	bh=06E5l2ndugewl1bJB004Q/7wIIbYjdFExTSdUMR5aRQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IL7Ww9B8Y30+cZlC7+7VlbAnYL5wBVk7dDAmwH1q8kQtA9OlYqprMGEFNkm5SE10YMBes493quvDnwUFGRPmBzaVeBZeUjVtcRIpiV3zGbUCxHgd5dpk4JPTGsDZaS5Y1cE5mV1P6OR6Gez+GkQUPkAkBflcOIlJcSuzBIeWgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xjzYQ4bi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lSHieQ3S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xjzYQ4bi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lSHieQ3S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xjzYQ4bi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lSHieQ3S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xjzYQ4bi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lSHieQ3S"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A0114D2C1;
	Mon, 30 Mar 2026 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774887921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reIQMllxbHMg2x2pM1gGXG0QSbpo9Mbwpj5DUu9nze4=;
	b=xjzYQ4bikzifYpyo4a5A2A9W9n7fV0/BKBYqWuNV5PZVZ50vA9x0E/uqIIGNSbNAkQreon
	Y0Qrk08XGRycGYkaqJndCL1RZPQjhyFK2ockqb7ANPSqOrmgo/2oL20bhtPwvwoXkthCLR
	Uv0787JUjjEkrMRZ34fVL5PKdHmJ2rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774887921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reIQMllxbHMg2x2pM1gGXG0QSbpo9Mbwpj5DUu9nze4=;
	b=lSHieQ3SQxc5aJi2m2NKMLCnoDM/wrugBVVG2IqBsqj6Y5pckckwBPN6w0nHEnMiREZRDV
	weuNQib6+61PwZAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774887921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reIQMllxbHMg2x2pM1gGXG0QSbpo9Mbwpj5DUu9nze4=;
	b=xjzYQ4bikzifYpyo4a5A2A9W9n7fV0/BKBYqWuNV5PZVZ50vA9x0E/uqIIGNSbNAkQreon
	Y0Qrk08XGRycGYkaqJndCL1RZPQjhyFK2ockqb7ANPSqOrmgo/2oL20bhtPwvwoXkthCLR
	Uv0787JUjjEkrMRZ34fVL5PKdHmJ2rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774887921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reIQMllxbHMg2x2pM1gGXG0QSbpo9Mbwpj5DUu9nze4=;
	b=lSHieQ3SQxc5aJi2m2NKMLCnoDM/wrugBVVG2IqBsqj6Y5pckckwBPN6w0nHEnMiREZRDV
	weuNQib6+61PwZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D68984A0A2;
	Mon, 30 Mar 2026 16:25:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id md3gMvCjymmsVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 16:25:20 +0000
Date: Mon, 30 Mar 2026 18:25:20 +0200
Message-ID: <87ldf9thcf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Leonard Lausen" <leonard@lausen.nl>
Cc: sbinding@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	me@nicho1as.wang
Subject: Re: [PATCH] ALSA: hda: cs35l41: Fix boost type for HP Dragonfly 13.5    inch G4
In-Reply-To: <db84dcf91bc8dbd217b35572b177d967655ff903@lausen.nl>
References: <db84dcf91bc8dbd217b35572b177d967655ff903@lausen.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Fri, 27 Mar 2026 23:25:15 +0100,
Leonard Lausen wrote:
> 
> The HP Dragonfly 13.5 inch G4 (SSID 103C8B63) has _DSD properties in
> ACPI firmware with valid reset-gpios and cs-gpios for the four CS35L41
> amplifiers on SPI.
> 
> However, the _DSD specifies cirrus,boost-type as Internal (0), while
> the hardware requires External Boost. With Internal Boost configured,
> the amplifiers trigger "Amp short error" when audio is played at
> moderate-to-high volume, eventually shutting down entirely.
> 
> Add a configuration table entry to override the boost type to
> External, similar to the existing workaround for 103C89C6. All GPIO
> indices are set to -1 since the _DSD provides valid reset-gpios and
> cs-gpios.
> 
> Confirmed on BIOS V90 01.11.00 (January 2026), the latest available.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219520
> Originally-by: Nicholas Wang <me@nicho1as.wang>
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
> This is a reworked version of Nicholas Wang's patch from Nov 2024 [1].
> Stefan Binding noted that this laptop should have valid _DSD.
> 
> Analysis of the ACPI DSDT confirms the _DSD exists with valid
> reset-gpios, cs-gpios, and cirrus,speaker-position. However,
> cirrus,boost-type is set to 0 (Internal) while the hardware requires
> External Boost. The cs35l41_hda_parse_acpi() fallback also gets this
> wrong since it infers Internal from the non-zero boost parameters.
> 
> With Internal Boost, all four amps hit "Amp short error" at
> moderate volume. Overriding to External Boost (like 103C89C6)
> resolves the issue. GPIO indices are set to -1 since the _DSD
> provides valid reset-gpios and cs-gpios, addressing Stefan's
> concern about cs_gpio_index.
> 
> Tested on BIOS V90 01.11.00 (Jan 2026, latest available from HP).

Applied to for-next branch now.


thanks,

Takashi
