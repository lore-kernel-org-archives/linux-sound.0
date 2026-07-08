Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88A3B42D0
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506701; cv=none; b=U8umlh4TKPF/uPNeemuNDIikrNFtMDv8mjFlIbNCR20RkGUeV/1BiuGSKlOFCLf559c7Dc0Egr26p7IWL5PrzEVIP7FgI0ZiR4d/I2STJWThRXBl6K8HSmpUisvhsfF8lef/P4Jce+HPfl3dkOm05wCUpFck8bWKWfDvlaCFlSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506701; c=relaxed/simple;
	bh=PMdAVJ9Csfrvyv/7+7GIBReSXIaudzpz2e75QRn/TCE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNZsNYvXTHGM9IYtz783Hn6qVo2M6AaVnBsQ3YTGfI9ksxsbY4oIe8lUYFCuvYWlAkStx7NdjNZn9iAkcqslKM8Nx2IVZA/iwt4a8ru6fO2WOn1hWFwGUtzqKZtwwF8M6gdmU38tDBNXcoE4ADWj7YoS9nY22NWLX9ik4+zgVFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lfmYh67z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P9wkS7W7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gidsFaBn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EeTwzp8h; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lfmYh67z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P9wkS7W7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gidsFaBn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EeTwzp8h"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 511C175CDE;
	Wed,  8 Jul 2026 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783506694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwNjAbXqI0xK5Og7I2IPa920TNXvEPHidsIor9kO4qo=;
	b=lfmYh67zDqlRQlNwC6+4fujAAibU5OzOrXF6E1BkBQ6svx40ywNuDXmNq4OgQ2KM/XzK3j
	fm4UV4VDixqxS1FQKT5kaQmkkkypqOPeHtIFz35gVrrQvVviFHOG2PSlOwYFdUkhhsbDoK
	Oo3KSzs9k7rhrNKLwuXRZ/958rTOdNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783506694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwNjAbXqI0xK5Og7I2IPa920TNXvEPHidsIor9kO4qo=;
	b=P9wkS7W747XQeOq/iCeV/hPaa3qGVBI4dxMGEwOzovq5H9lTfbswglbBZogOb95Jsl3nQD
	QhxuClBiuI8GogAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783506693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwNjAbXqI0xK5Og7I2IPa920TNXvEPHidsIor9kO4qo=;
	b=gidsFaBn8fvIb1trVY1KXm70YJO+azvDh28ojfbaT1mllxLwy+dU2P9HGYHx3eCQ67e3Ib
	zmk8HPZ7Py1Trs4HT2GlGEEay9lg/FkwnE3wXrVBGMWnM47OUv8BrpL7EIF/CGR2gQdK8l
	CU4P2Dl/Tl4DTTY1d5UtPkSLCf0hLKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783506693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwNjAbXqI0xK5Og7I2IPa920TNXvEPHidsIor9kO4qo=;
	b=EeTwzp8hLeQRYC9gFTyRAVOhx+azplcj7Z3g6dz0Tg5903irJ0L/8svIylL9DS93O3jOrK
	lg+esRV8W4hIZ5Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20F42779AE;
	Wed,  8 Jul 2026 10:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id soiWBgUnTmriFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:31:33 +0000
Date: Wed, 08 Jul 2026 12:31:32 +0200
Message-ID: <877bn56ad7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Cc: linux-kernel@vger.kernel.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: aloop: Add 'hrtimer' option to timer_source
In-Reply-To: <20260705125941.1203871-1-yuhsuan@chromium.org>
References: <20260702170356.3418432-1-yuhsuan@chromium.org>
	<20260705125941.1203871-1-yuhsuan@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,chromium.org:email]
X-Spam-Level: 
X-Spam-Score: -3.30

On Sun, 05 Jul 2026 14:59:30 +0200,
Yu-Hsuan Hsu wrote:
> 
> The snd-aloop driver currently defaults to using the system jiffies
> timer (struct timer_list). On systems configured with a low timer
> interrupt frequency (e.g., CONFIG_HZ=250), the jiffies resolution
> (4ms per tick) is insufficient for precise audio timing. For
> example, a 10ms audio period requires 2.5 jiffies ticks, causing
> timing jitter that leads to capture underruns.
> 
> Introduce "hrtimer" as a supported timer_source option. When
> timer_source="hrtimer" is set, aloop uses high-resolution timers
> (hrtimer) to drive period updates. This provides nanosecond-level
> accuracy regardless of CONFIG_HZ and operates independently of other
> hardware audio cards.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
> v1 -> v2:
>  - Guard hrtimer implementation with #ifdef CONFIG_HIGH_RES_TIMERS
>    to handle kernels built without CONFIG_HIGH_RES_TIMERS.

Applied to for-next branch now.  Thanks.


Takashi
