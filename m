Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091659;
	b=TFL4AUkTl0weA5DtoFSDG7h/+4Lfc2O2JSPpYoxMJNN07MOeTM4xMXF0QPIiwlKGhCq+
	 YfQB0ph1CsZQmp0PoHD4WMDZGBH4iZ5GYdr2S0dey+jgFfxwAnB9+ss1BnZm/TfxjMhuf
	 xw22Z5yIsHV4CtY95jg0aitQFm2av2uAT3S6UYtOjisL/xWNijD/s+s2EcYqBKi45YK2+
	 enY5Fiz3Ligz24/EyvtEWBwLJ7M6WfCBhWqxs1HOgPYcS7cSToQNvjD5Z04KRsrnBgTkt
	 GDDLgfBWCc2Gq2vS/4azmgU2Cgnt92cb3sm9osnEhl9agBeE7UV7JUrEq31DVxsT3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091659;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=M1PIP2IRYlcbZMl3AAAXpIoMqxFIHAFUkh+SV5lQ3LE=;
	b=rigfGSQOtoRgu1kyITuh4EFfPrkT7jNJQe4xPPuTYAcZQWVd3ekoSZQVIStzk1Yu7tl4
	 gFIW5Qm8SrFlsZEsBAtOg8caQnibEN40QVXlV98Nc7AIn7+IcNIxo747Sq2+D4wmcSEXI
	 ydxp7Fxs1caiblcIUSihZBoOo7mRjniRgom7EL/4gzppBbO6xN4FBaM+jad/p96MpNliu
	 n/rapJw0ipB+Gyiy850ZibbsiFQyjpOcu//3xMeNWh4O1Koc3ia9yzFiX+BnEf/ka5Eda
	 H11h+/JSzu6JewTWz4jIojup+RXo6JrS5a8yfdtWQJnOHk6bGFwDFExHMkYgN6qxhIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JcA9lJO9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=de1NI2Oq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JcA9lJO9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=de1NI2Oq;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A687606A320;
	Thu, 19 Nov 2026 12:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A687606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JcA9lJO9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=de1NI2Oq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JcA9lJO9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=de1NI2Oq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35C57221A7;
	Thu, 19 Nov 2026 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1PIP2IRYlcbZMl3AAAXpIoMqxFIHAFUkh+SV5lQ3LE=;
	b=JcA9lJO9UkeXftfIFnolWWERNnKrW7AXDRNDjct+BEYxkPzRuWQs5tQanVdRBrLPWPuIVL
	GUIX6urTNKafp4nGFvUGa1d6UIJ5aLn3mTcC8xWpePnDfaiQcZaXUZkFCpY99qg7hst2v8
	8ARLNzZrb7bNwTYXs9w0AMTXsbTMLYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1PIP2IRYlcbZMl3AAAXpIoMqxFIHAFUkh+SV5lQ3LE=;
	b=de1NI2OqHzac5+qz02Kmj+ZSjwd14TM+1Pj3+CsYuP4GAaeH8d5/MLIpLSFYlZEXRlnXE1
	UnJ0A3Rjn1CaCjDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JcA9lJO9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=de1NI2Oq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1PIP2IRYlcbZMl3AAAXpIoMqxFIHAFUkh+SV5lQ3LE=;
	b=JcA9lJO9UkeXftfIFnolWWERNnKrW7AXDRNDjct+BEYxkPzRuWQs5tQanVdRBrLPWPuIVL
	GUIX6urTNKafp4nGFvUGa1d6UIJ5aLn3mTcC8xWpePnDfaiQcZaXUZkFCpY99qg7hst2v8
	8ARLNzZrb7bNwTYXs9w0AMTXsbTMLYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1PIP2IRYlcbZMl3AAAXpIoMqxFIHAFUkh+SV5lQ3LE=;
	b=de1NI2OqHzac5+qz02Kmj+ZSjwd14TM+1Pj3+CsYuP4GAaeH8d5/MLIpLSFYlZEXRlnXE1
	UnJ0A3Rjn1CaCjDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE3D51342D;
	Thu, 19 Nov 2026 12:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pxITLMjs/moPEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:34:16 +0000
Date: Thu, 19 Nov 2026 13:34:16 +0100
Message-ID: <87tslduhiv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: memalloc: Fix DMA allocation retry cleanup
In-Reply-To: <20261119104859.2807-1-sreekuttan2156239@gmail.com>
References: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
	<20261119104859.2807-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 35C57221A7

On Thu, 19 Nov 2026 11:48:59 +0100,
Sreeraj S Kurup wrote:
> 
> do_alloc_pages() retries allocation with lower DMA zones when the
> allocated address exceeds the device's coherent DMA mask.
> 
> However, the previous allocation is not freed before retrying,
> leaking the allocated pages.
> 
> Also, if no suitable DMA zone is available, the function can return
> an allocation outside the device's DMA mask.
> 
> Avoid retrying GFP_DMA32 after GFP_DMA has been selected, and skip
> the DMA mask check when the coherent DMA mask is unset.
> 
> Free the allocated pages before retrying and return NULL when no
> suitable allocation can be obtained.
> 
> Fixes: dd164fbfdc20 ("ALSA: memalloc: Drop special handling of GFP for CONTINUOUS allocation")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied now.  Thanks.


Takashi
