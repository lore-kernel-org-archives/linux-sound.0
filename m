Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E12E7F39
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 06:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381476; cv=none; b=T1jif6H0iovDhmB/pVb4F26UdbEIDXT2odPUgWLEf1fNcNpmAA15L+wBXcAMOB0Uap/kcp9NEXZVo3suaIUvoBau+Kp4PQhkhV06EcwTUDWV7JpjYt6QAAFF/XqWJeydJt1HUXLQw+UXl28p5kUl3sp8DzNm5Y24Hjkxflz/GhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381476; c=relaxed/simple;
	bh=wBdIuJxmI2/j0lmTG8hdQI4Nn5KvuZQuD/xSL4T5L5g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrR1W/KMHKvITY4YqPzojyaQ8jBEC8/jQhzMRhlJIC0fj6aJQkk2459kAOh1vEV0ZI35sY9sw0F4nXg9nP5lrMQvB5eMwj5iKouOCXWyZJrU7JQO8IcHi4OhOdlY/u8FXg5N7A550/lwCsAyrXjTpe2WAK9MPwEgGgWlMaRoqHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dUNLUv5d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1RTv3QiN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ycdv6cX9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8yGGAiV1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dUNLUv5d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1RTv3QiN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ycdv6cX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8yGGAiV1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7EDB6833C;
	Tue,  2 Jun 2026 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780381473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUMw+B59gsHs7bQrZstQwCG73CaqVa+8VVIQxksux4o=;
	b=dUNLUv5dsbCpfqhbkNRZyO+LLjm3e5tbopmibtcqVu6aqYQ5X9nK9B4BUr0Ne897h9SNmv
	mzY7f3zgbmPdKO/BAjIHQ1Fda7Ql4BYD5i6ehiVj3KyBCpzdFpMTz1lPf+bAH+HWCuEMF5
	PdfV6+OS/uA2e+wr7Uazbp5vQH7ilYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780381473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUMw+B59gsHs7bQrZstQwCG73CaqVa+8VVIQxksux4o=;
	b=1RTv3QiNxgp6CnVUzRESp218GZQaQuopYTUyA9bVQom4o0qNZ3F2/AlFLMM/lsRIhUrQRf
	hpecXe30Cq8FPqBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ycdv6cX9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8yGGAiV1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780381472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUMw+B59gsHs7bQrZstQwCG73CaqVa+8VVIQxksux4o=;
	b=ycdv6cX9fxbRhvKsaCYnCuFRpqyGn3WhgGcrd+DTkApbJ6ZnnwQgNnbpunGUKSPQBr732O
	yCEj/hVRq9fX6bBBBM4Y7tZ0MTND3srF7REr9r4tIqt72TPxSdg1bM3MeYfSwrjxNXki3m
	GsQq/sp/ZzR/3KkMhV7h80PYsj3O7Lg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780381472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUMw+B59gsHs7bQrZstQwCG73CaqVa+8VVIQxksux4o=;
	b=8yGGAiV1HECarIw0hgW9AlYAlCl20Pdmjm2qubfDnYRsSNvreDqvkTo8qBEo9DwFSv5qgu
	fgnOMLhKD7+43oCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 856BB779A7;
	Tue,  2 Jun 2026 06:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JolIHyB3HmqrFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Jun 2026 06:24:32 +0000
Date: Tue, 02 Jun 2026 08:24:32 +0200
Message-ID: <87wlwhzcgv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ferus Castor <castor.ferus@gmail.com>
Cc: linux-sound@vger.kernel.org,
	clemens@ladisch.de,
	tiwai@suse.com,
	Ferus Castor <feruscastor@proton.me>
Subject: Re: [PATCH] ALSA: oxygen: add HT-Omega eClaro (7284:9783) support
In-Reply-To: <20260601015848.128566-1-feruscastor@proton.me>
References: <20260601015848.128566-1-feruscastor@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B7EDB6833C
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,proton.me:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 01 Jun 2026 03:58:48 +0200,
Ferus Castor wrote:
> 
> The HT-Omega eClaro is a PCI sound card built on the C-Media CMI8788
> (Oxygen HD) controller, with PCI subsystem ID 7284:9783.
> 
> Output hardware:
>  - AK4396VF stereo DAC: front L/R output, connected via SPI CE0
>  - CS4362A 6-channel DAC: surround, center/LFE, and side outputs,
>    connected via SPI CE1 with a 3-byte [0x30, reg, val] frame
> 
> The CS4362A uses inverse attenuation encoding (0 = 0 dB, 127 = max
> attenuation) and a 0.5 dB/step logarithmic scale. Volume TLV is set
> to TLV_DB_SCALE(-6350, 50, 0) to match the hardware. The channel-to-
> register mapping was verified by listening test:
>  - Pair 1 (regs 7/8):   side L/R   (ALSA channels 6/7)
>  - Pair 2 (regs 10/11): center/LFE (ALSA channels 4/5)
>  - Pair 3 (regs 13/14): rear L/R   (ALSA channels 2/3)
> 
> Input hardware:
>  - CS5361 stereo ADC: Line In and Mic In capture
> 
> GPIO assignments:
>  - GPIO 0 (0x0001): CS4362A RESET# (active-low, driven high)
>  - GPIO 2/3:        CS5361 M0/M1 (sample rate mode)
>  - GPIO 5 (0x0020): front output stage enable (driven high)
>  - GPIO 8 (0x0100): headphone amplifier enable
> 
> Signed-off-by: Ferus Castor <feruscastor@proton.me>
> Assisted-by: Claude:claude-sonnet-4-6

Applied to for-next branch now.  Thanks.


Takashi
