Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAA039CD18
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740837; cv=none; b=FEQ4tww1iGX4+7lL8jY5nrsIYWTbGB5+vHliuXXMO4OQTlI3YMDSWiE25arRuEjHbMnRUpVbKjRHkw/8uaPRSarbkubnNCh6XlqRb0OlfWtGSF8OLqWIFvIwS2Bad+/7KbCd37ZLC42TJ6vLI6AYdMuKv8gCv+BC0RwIobJd3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740837; c=relaxed/simple;
	bh=+NTz8/1j29aUgSnejWw5PsCZ0CKBcpmP3RyvWqndcjU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YiSi40yikRaUPinxjA8aC9AjdnkztRiiR5x/HCUkOEY6Fl4PJgCUsR+nWMD2e3x5Zux+qpgE0ejigb4gRwkHjSyugJwwwdvWYGkNujn4IN7gJxdJmzd4LoawWzwvp6FHec/R8ZiXbH+iN7aF/eBFqlSWcKxb+9h31ZKidRz7jAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q0+a3n7e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+fKeQ83; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gkkYuMXQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uGcO4jCg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q0+a3n7e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+fKeQ83";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gkkYuMXQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uGcO4jCg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 929EF4241;
	Mon,  3 Aug 2026 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6aGpvJ7Hltuqgkyp7JemdxBejdG2YvVnPgnsc2G1E=;
	b=q0+a3n7ej7iWekjoWmU8frHFbhAt+sls3pkUiRxkJrhWtSvcOVdDt+i9yzj9QbcUWCJ0wA
	M4klJc0hn3JlPxLqRYsqr7uu9RjVEV5f6C1oDsWIXt6gtT3Ps9MhsjDYP7mrbUtEaPbiH/
	sXIrxsVtGnadr2HfZpS40B/Tb9ofRFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6aGpvJ7Hltuqgkyp7JemdxBejdG2YvVnPgnsc2G1E=;
	b=M+fKeQ83+jIoAOGHjmyncOehdQqpbv8p1MwBX5wJoq8JRomA0sLMkoqk3Swm6pTeKLGuPz
	o49Bdg2C64nYHDAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gkkYuMXQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uGcO4jCg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6aGpvJ7Hltuqgkyp7JemdxBejdG2YvVnPgnsc2G1E=;
	b=gkkYuMXQRc5t0c3CLmU6HOm95RO9QNgVmlhXF6kNBbIEOgSOx/tqCi3KBl0XUb8fx6kMMf
	3cQohlYtnS72/OZKcFANub2VtA3LnqIwmwQ1yGTzmAp9Ay57bSgXNoT/r++F7FM0pxsh15
	K45BTHioMbZq8V3pm7qqDl2w2GM4gJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hy6aGpvJ7Hltuqgkyp7JemdxBejdG2YvVnPgnsc2G1E=;
	b=uGcO4jCgpM64MvcjVKpNHpqDzPfVNG/mvOIS1ZlAPKSBVxVJpbNLwQDaPvTWOeQS6Ppk0s
	DzxzARnSjL155WDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67773779A1;
	Mon,  3 Aug 2026 07:07:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xH3sFxg+cGqbDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:07:04 +0000
Date: Mon, 03 Aug 2026 09:07:04 +0200
Message-ID: <871pcfbs2v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jeremie Pardou <jrmi@jeremiez.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable jack detection on Minisforum AI X1 Pro
In-Reply-To: <20260802194832.49393-1-jrmi@jeremiez.net>
References: <20260802194832.49393-1-jrmi@jeremiez.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jeremiez.net:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 929EF4241
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sun, 02 Aug 2026 21:48:32 +0200,
Jeremie Pardou wrote:
> 
> The firmware of the Minisforum AI X1 Pro leaves the headphone jack detector
> reset bit asserted on its ALC245 codec. As a result, pin sense on NID 0x21
> always reports the jack as absent.
> 
> Clear only the Reset HP JD bit during codec initialization. Preserve the
> remaining coefficient bits. This makes pin sense and the generic HDA
> auto-mute logic work normally. Apply the fixup at INIT to also reapply the
> setting after codec reinitialization and resume.
> 
> Tested on a Minisforum AI X1 Pro with codec 0x10ec0245 and subsystem
> 0x1f4cb020 using Ubuntu 26.04 kernel 7.0.0-28-generic.
> 
> Signed-off-by: Jeremie Pardou <jrmi@jeremiez.net>

Applied to for-next branch now.  Thanks.


Takashi
