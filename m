Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729727FD74
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976588; cv=none; b=aK4N1Wzc/Qo+icrex6/impSw3oeeI4D/sU7z7cWb90JiFAxQrGraD2empTDofKNKw3J3gkMKGpjvPB2BITE61focmZnYT3H7RTzP3m4IoB021tseJRe1jMZ/OQ7UNXdDGVg2DT0SxRGr/VfjvFQjKtjuisxPD020x0p9ICP5tdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976588; c=relaxed/simple;
	bh=tVwYrZW+83aKWpITKVCrcOSz0k8atosxeWNFXFit7ig=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYoHBBHvGeJGbu4nsWE0tIgYV+6izJ3zNznMsMIAt9ttMwrlOSc8DvPeMdfWSiL9D0Og4IPXb8pXkCzxTXXOlsijVbHdiNQk+iy159JDfcUbEIGIHHCevdDn6YgEbilH2p8Px9z9114FOd3hVt+lLg1lyI7wJRyO1Dhrnp3Pp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C8igj4eB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m6GAxPib; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lEcuvX5a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wvEt8B0O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C8igj4eB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m6GAxPib";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lEcuvX5a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wvEt8B0O"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 965773E2C;
	Mon, 17 Aug 2026 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786976494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HqN144Qk9xekEU8TJ5C9ywf+NWP64jj8YzZZYxUss8Y=;
	b=C8igj4eBup/GWPN8+VJ7AW8lQph+qnFFllJX6K/f7YMj+7dxba2AIkYXRgD0rephsK0f3Q
	DkNm180KmLCDUhRianbkSB3tbo7mDSfrtKcGfMpddkqkMtYtnv0nEWDUnmAZrbmnMU6Ri0
	DICITD3tYVTNsP+e+tEf21lb8UMTsrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786976494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HqN144Qk9xekEU8TJ5C9ywf+NWP64jj8YzZZYxUss8Y=;
	b=m6GAxPibWJ4zZuZH0fuAPTSdSdQpkhI8lAXiO4122b32CYgp82VPzbvTvnQJyP/Mpc4eSd
	oy8mHgQQLmm7onAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lEcuvX5a;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wvEt8B0O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786976490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HqN144Qk9xekEU8TJ5C9ywf+NWP64jj8YzZZYxUss8Y=;
	b=lEcuvX5ahkymjCjk1AY8WQXwyLFdsrUpKkAzQU9cgmYGAnOct0LYR2ztUu56kqjPKzBiio
	687WHwVz+iD5y9kL9x/zzfH+Vt47RKCpmTifWtmDGgovh0ZJHCQrr2Li2dVwrrKP9pGCJz
	10y4FSNI3Z8Pz0Q/l89yphnWFBl9498=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786976490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HqN144Qk9xekEU8TJ5C9ywf+NWP64jj8YzZZYxUss8Y=;
	b=wvEt8B0OMJ2e1rxEAjLT+zGINHtPIL0UhO3R3G9V349PfXBJzWDGjCaZ7mgUhMuRP/Y2zd
	6mua1LDtOL9wzeCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40BE8794EA;
	Mon, 17 Aug 2026 14:21:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l+6cDuoYg2pTeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Aug 2026 14:21:30 +0000
Date: Mon, 17 Aug 2026 16:21:29 +0200
Message-ID: <87y0e4rfo6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rhys@tumelty.co.uk,
	rdunlap@infradead.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com
Subject: Re: [PATCH] ALSA: docs: fix dead link to Intel HD-audio spec
In-Reply-To: <de38a940-9973-40d2-a4d1-d9e8f43e6439@gmail.com>
References: <20260321140212.5026-1-ninadnaik07@gmail.com>
	<87mrztsjnu.wl-tiwai@suse.de>
	<de38a940-9973-40d2-a4d1-d9e8f43e6439@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 965773E2C
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 17 Aug 2026 16:14:26 +0200,
Ninad Naik wrote:
> 
> 
> On 27/03/26 3:01 pm, Takashi Iwai wrote:
> > On Sat, 21 Mar 2026 15:02:11 +0100,
> > Ninad Naik wrote:
> >> The existing link redirects to a generic page. Update the link to the
> >> specification document.
> >> 
> >> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> > Applied to for-next branch now.
> 
> Hi Takashi,
> 
> Thank you for accepting my patch. I'm not able to find the commit in
> linux-next or the mainline tree yet. Could you please let me know if
> the patch is still expected to be merged, or if there is anything I
> need to do from my side?

My bad, it was applied to a wrong branch that never went out.
Now applied again, to be included in 7.3-rc1.


thanks,

Takashi
