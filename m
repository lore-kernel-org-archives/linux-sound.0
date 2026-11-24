Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524353;
	b=uNaWdqnhaIqUk0AQ21Dgh19Yuy4GuJXaxmwCf+A9S3f8tQAVIMzZM/Bw4cWRF7hQWTkF
	 JCystT6Y6ag5Kh0CERAgeazkFiKC1g7RGYxZln+kmP+W0BLAQCDprBQLdYCjWHi4Aduqq
	 AARE7m6xPYgz6UICEfcFJx1BZiTdXFNOOLZ/BzoUM9kawP9m5NP+WMOOmkuovzOnjg7+d
	 Yf687rHWjEL/s6TACDnBwWzcEs4Jx6uwyCTuReDYvJHrKCYVgxtINFfQRXD7DkEpn4c7t
	 +Bph+R9cpn7A+H0GSuXzhfLZ+W8IdaWT9REjI1fQzGLk/qqhzF+5dodZfOLL7PiX5Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524353;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=d8E/1Jnei5WuqV9NTVyJ6CiB7nLoqUAsL8copsL9Vlw=;
	b=PSD9tZV8w0KTn1engRWDVWilr0NWqcn1xYgiz9jnyfDmx2oScVc+/fUvgxOVixAANBSs
	 eBkKLvAL3zlxKdYa4jn7MOWszlHo1INkHWrh1KW0J20NN/5tz9JU2coYfrxRYVzT0dmh3
	 XCd1TUwN1RDFSzoR9ie4lduSTzUc0nkdCmkJdabTS3mpZTlFNrEjiuNmkYevliK5VTHk7
	 EP3aO5RpuCjaob4pLXdkwj1mhmgIM1moJnge7y8rjxYU3Qr7FNtxEiHdaWuVbTMkpv63C
	 gokSZGJMU2J2GwBGw3/VrclQCk0jBv809ERjLq0ql5fKC/eTizrNlJRmgfZ6acVo/yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FBCgFliQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EI5r9Lxu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FBCgFliQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EI5r9Lxu;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3DD606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3DD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FBCgFliQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EI5r9Lxu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FBCgFliQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EI5r9Lxu
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97B701F7B4;
	Tue, 24 Nov 2026 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8E/1Jnei5WuqV9NTVyJ6CiB7nLoqUAsL8copsL9Vlw=;
	b=FBCgFliQz9yQwB4wJR3lHV6lLEAyqjALOJ6oHYBaiUiVomuWAQnAXwsP5xId2m7lJjGZZq
	a9Ihtr87+t7odHdEfxud92443HNJrII6+OaOz9h7chyZ41Cxo2Plf88l1PS+W11RRsMUew
	NPXM9BAecJlWe5n6uclv//m7Uir49qE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8E/1Jnei5WuqV9NTVyJ6CiB7nLoqUAsL8copsL9Vlw=;
	b=EI5r9LxujsyoFarTZjYkXFzYhXc4W2SNkzXpTqAIe5Ex8oaXOq1TJlCBBYUvPkERL//+cm
	s8LpwDyRYFWPeRAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8E/1Jnei5WuqV9NTVyJ6CiB7nLoqUAsL8copsL9Vlw=;
	b=FBCgFliQz9yQwB4wJR3lHV6lLEAyqjALOJ6oHYBaiUiVomuWAQnAXwsP5xId2m7lJjGZZq
	a9Ihtr87+t7odHdEfxud92443HNJrII6+OaOz9h7chyZ41Cxo2Plf88l1PS+W11RRsMUew
	NPXM9BAecJlWe5n6uclv//m7Uir49qE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8E/1Jnei5WuqV9NTVyJ6CiB7nLoqUAsL8copsL9Vlw=;
	b=EI5r9LxujsyoFarTZjYkXFzYhXc4W2SNkzXpTqAIe5Ex8oaXOq1TJlCBBYUvPkERL//+cm
	s8LpwDyRYFWPeRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64FB31339F;
	Tue, 24 Nov 2026 12:45:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PKocEP+GBWvKFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:45:51 +0000
Date: Tue, 24 Nov 2026 13:45:51 +0100
Message-ID: <87zeuy9z40.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sophiel Zhou <sophiel@zzy040330.moe>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio: Enable native DSD for iBasso Macaron
In-Reply-To: <20261124090051.37375-1-sophiel@zzy040330.moe>
References: <20261124090051.37375-1-sophiel@zzy040330.moe>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Tue, 24 Nov 2026 10:00:51 +0100,
Sophiel Zhou wrote:
> 
> The iBasso Macaron (USB ID 262a:1a0b) exposes a UAC2 RAW_DATA
> playback altsetting (altset 4, bmFormats 0x80000000, 32-bit
> subslot), but ALSA reports it as SPECIAL without the DSD_RAW
> quirk, preventing native DSD playback.
> 
> Add the device to the quirk flags table with QUIRK_FLAG_DSD_RAW.
> This makes the altsetting available as DSD_U32_BE.
> 
> Tested with quirk_flags=262a:1a0b:dsd_raw and with the quirk
> enabled through the device table entry. DSD256 playback works.
> 
> Signed-off-by: Sophiel Zhou <sophiel@zzy040330.moe>

Applied now.  Thanks.


Takashi
