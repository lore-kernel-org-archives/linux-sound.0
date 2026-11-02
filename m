Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609741;
	b=TpEHYK3nicNuxo4BQFuc+0jqlNRsAdM7k7gQm0zW/kcZsmsCWaddnhKY4X6UVYQ2MHF/
	 oWTdU3uLLJHjgWngr0K1obYhgc8bXaXLMdGx2stiiRI+/BVTnyDrA8RsasHEBFEQypMrH
	 nVRMchNaGLpBPN4t40W1sNfN0+lGuIcAegynWSnxe6O4KGt5+W98YwUQqUN72ypM8R/+m
	 FntaGjRME15RR9zHJz3C+/UT+oEUMx56Oz3lgFvsPRrHVfjPMDaxx2Inl/DCaXxZqRUvr
	 gaA5cH4vmRLG/6DdNPjjXDxDzVF/wB/K+7ESfrl+me4a73QI1O6x6z4wGQkD6/4xR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609741;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=g0/75vdTqHQhzUZUM80fEQxy+/X2m35s7yPUNuGalAM=;
	b=vj+RcnJ9iyPNY7i4EJZW1YnSQZDR+Ub1yVcVOHz9FpMGv0Js/iK5MAmZf5sVefwicNbL
	 6pDdh8tiwS4M2C6iM8CxSJMoobdKR1JDZcwUyYiNl4cn+YmtGe7y8C4H2AYdnquDW7vh8
	 X+h9PbO0iw/SnBVfbko1c3mlz+kiJ+tAVegEEGp4kKm/VsWDFSVbWSiw/aJSMnVv8sqSz
	 x+olg8DHNjgN39nR6SIRHbe3BvVM/cNIYImMnkU/5jxr8u6yYKIWWc0G/MSirCWwsdgoa
	 wQoR59HXzEtjxVJT2kc7kUEIEc+fx7OmJTi/lzZtFfy6vN/NfPJHOWv8kSYrlY53TDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=alscqv24;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=32yGXRdM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yy++OhSQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jP9GE0Ne;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3A606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 08:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C3A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=alscqv24;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=32yGXRdM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yy++OhSQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jP9GE0Ne
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1122B1F7A5;
	Mon,  2 Nov 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0/75vdTqHQhzUZUM80fEQxy+/X2m35s7yPUNuGalAM=;
	b=alscqv24IKG9KflMQ79E78O3zZOae6VVZ2flaBeWQAkVfZKxSvrDKw/gqSFL3nEM4Em3k0
	/4cKIxgP4PBUaswhnhkeV046xesKIrFz2b/D7BIb6G3KKLB+3nLh6NDi5StRrq7nf4UuMD
	FoFDdeIf6rAV1Uj22SdRCjFHcrH11mQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0/75vdTqHQhzUZUM80fEQxy+/X2m35s7yPUNuGalAM=;
	b=32yGXRdMI12/W3kPwnr2DuovRWdfbjKSOZhN88LyMHeLQvx7be3d2bSo5HbaHCLasCKsWp
	3HYiEJXG6qW3NXBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0/75vdTqHQhzUZUM80fEQxy+/X2m35s7yPUNuGalAM=;
	b=yy++OhSQe4WB7/mmrEwyn5UXJLonvs9gJBOUdg5TmWLJDQMoqyVqwHx48Su5P5s22YPWPy
	eRXwuy3Gbg0wu9EU1pl4WZrC7XZ5AbBNvCNe1H/kTCo+GWIK1IOW81HxKefwPtzg69CetZ
	BFcsYTGWAALG5D3dNJdPDoe9vcCU25Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0/75vdTqHQhzUZUM80fEQxy+/X2m35s7yPUNuGalAM=;
	b=jP9GE0Ned0ivc9Q088FIO1M5Ze4QWufjSsPPWcFbuBj7prP7vZFv12Vk2ytkcQM9waGxsI
	mnd/PjcGoGFozsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2FF6134B8;
	Mon,  2 Nov 2026 08:55:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RQM6JglQ6GosTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 08:55:37 +0000
Date: Mon, 02 Nov 2026 09:55:37 +0100
Message-ID: <87fqxj4np2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Davide Gironi <davide.gironi@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2 0/2] ALSA: ice1712: support the TerraTec PHASE 88
In-Reply-To: <20261028183155.787599-1-davide.gironi@gmail.com>
References: <87y0bk6gfn.wl-tiwai@suse.de>
	<20261028183155.787599-1-davide.gironi@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 28 Oct 2026 19:24:08 +0100,
Davide Gironi wrote:
> 
> The TerraTec PHASE 88 uses different front-module hardware from the
> EWS88MT even though the ICE1712 driver identifies it as an EWS88MT variant.
> The PHASE 88's write-only expander does not respond at the EWS88MT
> addresses, and its EEPROM advertises a consumer AC'97 codec and one MIDI
> UART that are not representative of the board.
> 
> Changes since v1, following Takashi Iwai's review:
> 
>   - Add an early, card-specific EEPROM initialization callback and move the
>     existing DMX6Fire fixup out of generic chip initialization.
>   - Move the PHASE 88 AC'97 and second-MIDI UART EEPROM fixups into the EWS
>     driver callback, which runs before generic hardware setup.
>   - Drop the consumer-capture NULL guard: the early EEPROM fixup prevents the
>     nonexistent consumer PCM from being created in the first place.
>   - Use snd_ctl_boolean_mono_info for the Line/Mic boolean control and fix
>     the PHASE 88 initialization indentation.
>   - Give TS88 its own model string, and update the PHASE 88 expander shadow
>     only after a successful write so an I2C error cannot corrupt it.
>   - Updated comments style to fit better the other on the module.
> 
> The series has two patches: the callback/refactoring patch first, then the
> PHASE 88-specific changes.
> 
> Testing on the machine with two PHASE 88 racks.
> 
> The patch series applies
> to the Linux 6.18.58 source. It was built and hardware-tested against the
> running Debian 6.12.113 kernel.
> 
> Thanks,
> Davide Gironi

Applied both patches to for-next branch now.  Thanks.


Takashi
