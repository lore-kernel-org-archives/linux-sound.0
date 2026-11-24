Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524821;
	b=eimvj1NDC3W912/83IWT1RSHE1mOQvV0urNIFLhzT3OMUlxVkkZxFPSXMp85jUx4+UBv
	 qm9b/c5rB2Sio4irE0fk/Iqj9O8JAKMPHxF42Ayvv9il6O1lkj1JH4cGhfnZmQ+0XOEwX
	 MAoXo3nJgRsd3wHXcOO6vzqumJ+/SM5k1omLsuL0PJfDjucXtT0671yqEUSF3ACSuv9BD
	 26JeRxmxaicTSV8aF3798R3RDZbb6CdzAyOU6CWHDOTYCoS9tBsNGDgKl4EvFPflXMmGt
	 Zhz2HLGkJ6JKLF82Lg0UUdaltVT3FsIpRGFBTm+786zEhuncz2iVHCShZ5V+QqwyCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524821;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=VL9qXUSR3ePJkYAq5CcsP8EWvXD4j+U/Z/1jGyCythI=;
	b=XPl+cJlHsxctPqvZ4zgTq4f7xblmqoVVOphzTmyOiW2VWsF2oGUxHCTmaRG4jLpRd+Vl
	 W7pHm6cldXhhiXXeUfSJdOzxtU13iN9iEK4/Bt8jTOHOEMl/JegJJQMMxtYcuewA0uC2C
	 RfbxCb0HlSS3U0u39AssPrTB3lROZJfwxofTHHoK4fAs0Mco3puLolsrdQZy9dPn8s7Q0
	 Q8tQcW2jbLpfA5v+D4v++DuU8GmoCv0rjGlqhizBkXBPXjZyYrC5fLiXeF4OM0UgUupUZ
	 g12/civbyRA2+To04SMC1RTg14jXTz2X97sJ85tEJLqxvB89LcJa/tV80QYhJgGKyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JKqkn6fI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pxJn+7+g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZN622UYi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0UmiXV1K;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D648606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D648606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JKqkn6fI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pxJn+7+g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZN622UYi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0UmiXV1K
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93D181F7BA;
	Tue, 24 Nov 2026 12:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VL9qXUSR3ePJkYAq5CcsP8EWvXD4j+U/Z/1jGyCythI=;
	b=JKqkn6fIpJlhubRX3NPTYbUl31ZTxM8n+oRmr4n4pQrfyufR7BrRe+Fz+/P3kRA6mZijgB
	bmzsG5roIGvK9JjNtw20ym1mUiVpv+Casd/9EQMh+ljP9bnbLgll2Su5tS8rCSX15Mq5JD
	GM3J3Up3z/oBwSKmszboOauleqJz2zQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VL9qXUSR3ePJkYAq5CcsP8EWvXD4j+U/Z/1jGyCythI=;
	b=pxJn+7+gu9O0KZbBikMihDExENEcfsj1WG7VyB20GPUAgxshp62/jKU2FXAQ6SpEJEZAgo
	Sx2oODVewIZj3tCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VL9qXUSR3ePJkYAq5CcsP8EWvXD4j+U/Z/1jGyCythI=;
	b=ZN622UYitv7hHyeUkwFlEkub+rmZpqva5Ys3CznbXuM0o2Ryt+HgI22r3gIAW838al6Dj5
	LU3mhgMDpRTIerxzcTc1ft2YGxunpAfg7aaBuVXUThhGAwAMFASNB8n8LgWxNmoil2gWAF
	6HTDlT9mpGAM5E8DBtpK4s5yB0kh9xs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524817;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VL9qXUSR3ePJkYAq5CcsP8EWvXD4j+U/Z/1jGyCythI=;
	b=0UmiXV1KHN5dMgNXk2PzUFmmCGLj6b1QCGiSSwCBlZfQ2YQAxi5kmAUycKQpFptZ/K2T5R
	4d9BCSirvmOZnSCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 607021339F;
	Tue, 24 Nov 2026 12:53:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xJsND9GIBWsEHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:53:37 +0000
Date: Tue, 24 Nov 2026 13:53:29 +0100
Message-ID: <87pkvu9yra.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Martin Szathmari <martin.szathmari@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker on ASUS ExpertBook B7402FEA after Windows
In-Reply-To: <20261122215857.4580-1-martin.szathmari@gmail.com>
References: <20261122215857.4580-1-martin.szathmari@gmail.com>
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

On Sun, 22 Nov 2026 22:58:57 +0100,
Martin Szathmari wrote:
> 
> On the ASUS ExpertBook B7402FEA (ALC294, SSID 1043:1b02), the internal
> speaker is silent after a warm reboot from Windows. The Windows driver
> leaves two vendor coefficients in a state that the generic init path
> does not reset:
> 
>   - COEF 0x66 bit 4 is set, which mutes the speaker.
>   - COEF 0x1b bit 10 is clear, which distorts the output once the
>     speaker is unmuted. This is the same bit ALC294_FIXUP_ASUS_COEF_1B
>     sets for the UX431DA.
> 
> A cold boot clears both. Comparing all 256 coefficients of node 0x20
> after a cold boot and after a reboot from Windows showed five
> differences; writing them back one at a time showed only these two
> matter.
> 
> Add a fixup that clears COEF 0x66 bit 4 and sets COEF 0x1b bit 10 at
> init, so they are also restored on resume. ALC294_FIXUP_ASUS_COEF_1B is
> not reused because it chains to the GA401 pin fixup, which does not
> apply to this machine.
> 
> Tested on a B7402FEA (BIOS 308): sound is clean after a reboot from
> Windows, and after suspend/resume with both bits forced back to the
> Windows values first.
> 
> Signed-off-by: Martin Szathmari <martin.szathmari@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
