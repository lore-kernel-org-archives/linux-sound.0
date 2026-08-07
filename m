Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CC47045C;
	Fri,  7 Aug 2026 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104996; cv=none; b=eic47O3vZLb757dguRB9KM4lP1IBQos9T/vsnn/TPn3Oyj0KOTA4UruFrylo2bl3UStE77ZQsMFfyvKTwQFcGbFC5/G/ivA35tK9DqMR7XoF8DgGm67zDQB+zBEirazRSKWkEw/4YwJHM1OC7ZNFWB7hIS6eG8MiTs7dO+lQD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104996; c=relaxed/simple;
	bh=jQSXYZJVmvJbk6pnZsJDHTYqOGu16w3QjwHuKPb70GI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tp3168r35RTxCgoHWd2sfgE62onMNQYLY2A/p1cyFDUJakkAP/U9OIiN27sW8aHuBj1nEzfFjLa1PJmILujQalNFHnU6YorDeLJkwNRQo+irDbk0M60m3cxp1TtYe8Xp6t+ym0WCQ4Udwctx7WKOHsuuq7zCWFNgWcOB2DfJynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SRwijpyo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7zGPvGfB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nntdL2ar; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q4jm7a88; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SRwijpyo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7zGPvGfB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nntdL2ar";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q4jm7a88"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E8EF13DF4;
	Fri,  7 Aug 2026 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786104932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ+7RhPQlkRYG1fHPEt5bxJNXm5IgdF85StOKocT7us=;
	b=SRwijpyoG4xKQuiq4G4CJTGY5xXFtQ2sDyv6mA9149eGjoc7CtqjX8T8MM4yGIe9VfLhg5
	xLGRbueJafqxssKLkg9jJIeReFMGMeBzCb+0j9jQ6s1LOHTw+tQi6KcEbMCBOyQpM2hnPm
	DwqNboLMlFyMH+ZBC2ZiCR1cakKSchw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786104932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ+7RhPQlkRYG1fHPEt5bxJNXm5IgdF85StOKocT7us=;
	b=7zGPvGfB4iSJtQW9+hM8pCMdk8o0/om04rY9RynRdo7FPTJ7NQDyGQ14UW9rPkucR+reDl
	N9OWD6G1Y4aL8NBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nntdL2ar;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Q4jm7a88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786104927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ+7RhPQlkRYG1fHPEt5bxJNXm5IgdF85StOKocT7us=;
	b=nntdL2arPffgyCZNas1wJG4gwLYsPgijvb370bh/fEAWOLVZDxXZVTvOCkRg0S28CIx4WL
	LvX4ldqxcyOskNSxAIlFuY5qwtLlz6KA+G5+ex12frvuj2emOvI0XtafFECLbj4/E6REHQ
	OrTcSP75uWmRH7geRoRq/uOHATU2NyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786104927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ+7RhPQlkRYG1fHPEt5bxJNXm5IgdF85StOKocT7us=;
	b=Q4jm7a88BVITAhV2pi/2DfW6aqXsFwTnnqblYqFx4FS7UKPVqmKouLtqKPUColHmVc222Q
	YiDg6Eh4/gjms/BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5128779B6;
	Fri,  7 Aug 2026 12:15:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Mg/jJl/MdWqLLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 12:15:27 +0000
Date: Fri, 07 Aug 2026 14:15:27 +0200
Message-ID: <87jyq2azz4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: E8EF13DF4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Fri, 07 Aug 2026 13:41:32 +0200,
Mahad Ibrahim wrote:
> 
> strlcat() is deprecated and slated for removal once its remaining
> users are converted.  This series converts the sound/ users outside
> of ASoC.
> 
> Each site is converted to an explicit offset plus a bounded copy:
> strscpy() where the appended text has no format specifiers, and
> scnprintf() where it does or where the resulting length is needed.
> 
> After this series the only remaining strlcat() user under sound/ is
> sound/soc/codecs/wm_adsp_fw_find_test.c, which goes via ASoC.
> 
> Build-tested with allmodconfig and boot-tested on x86_64.
> 
> The generated strings were checked against the pre-patch code in a
> userspace harness for empty, whitespace-padded, exact-fit and
> oversized inputs, and came out identical.  No audio hardware was
> available here, so the drivers themselves have not been exercised at
> runtime.
> 
> Mahad Ibrahim (7):
>   ALSA: ump: replace strlcat() with strscpy()
>   ALSA: ac97: replace strlcat() with scnprintf()
>   ALSA: cmipci: replace strlcat() with strscpy()
>   ALSA: caiaq: replace strlcat() with strscpy()
>   ALSA: usb-audio: replace strlcat() with append_ctl_name()
>   ALSA: hiface: replace strlcat() with scnprintf()
>   ALSA: usb-audio: replace strlcat() in longname construction

Honestly speaking, I'm against those conversions.
Why do we have to open-code at each place with strlen()+strscpy()?
It's just harder to read than strlcat(), even more error-prone.

If an alternative is something like this, we really should reconsider.


thanks,

Takashi
