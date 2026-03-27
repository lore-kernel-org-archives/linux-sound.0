Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223F623D2AB
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613948; cv=none; b=IM/uJdO6Mvtn+omwXZWDbCpFCK1Ed2kcYjv+rTnxB7YlogGBd5WIDPbZB2m5xG2xF7P/co80LkZKOF+OtD0PHLYGbRDxQPxEQZ7/4d3ZaKkCeZOGGeYBcWWA1lS0kRo7GgQOPebdzUDr68VDH7hY0VG2SnykXF3zQpTSmuXprz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613948; c=relaxed/simple;
	bh=hu/qMIyGVEPKtSGF0D7LwAY3eePHUo4OuGMCS+V4ACE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khb0WjQwag0+CsGiq8mYyjWRLbjAJ7mgUb1GNm1OALZo9lLB337I+moFAZ7mnwx45fw6x9VeBouJjiZguWMwqXDDqRQwf3tvlQLcIdd6mHmVO6vQooKOBG41aJ6sNbMXn4Cgm9C8mQEYUUxDVFO5Hsln4vuZe/jEgtKMkDd76hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nZP9AhAA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bheKQNUg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nZP9AhAA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bheKQNUg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nZP9AhAA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bheKQNUg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nZP9AhAA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bheKQNUg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FF295BDD3;
	Fri, 27 Mar 2026 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774613944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6P1WrMmKD9rChWvzRFC1qwoDoYMeSRxESUxtcxIOWo=;
	b=nZP9AhAAFggmLQrUOf29DwLS/d12JajetJc2rwUgR9Yp9JMKBeBYjgbfbZu+08utmV6VJl
	FB6dnuemWNSj0sQXjhVnc1rLAeZAxK+XSWmzKcIBu6y1jVTcozeXG4Ltz5VhCEegzVKUpw
	T/kKi7CPCh/8jzuKDYHKkE4fN85KdXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774613944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6P1WrMmKD9rChWvzRFC1qwoDoYMeSRxESUxtcxIOWo=;
	b=bheKQNUgnuAQGtbsx/ZlsLHE/Fu6s4ylrWp6R054cbwt/HG3TVzoImVIKoUe9YY6STVpk0
	IPjzM4bPrt2CAjAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nZP9AhAA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bheKQNUg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774613944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6P1WrMmKD9rChWvzRFC1qwoDoYMeSRxESUxtcxIOWo=;
	b=nZP9AhAAFggmLQrUOf29DwLS/d12JajetJc2rwUgR9Yp9JMKBeBYjgbfbZu+08utmV6VJl
	FB6dnuemWNSj0sQXjhVnc1rLAeZAxK+XSWmzKcIBu6y1jVTcozeXG4Ltz5VhCEegzVKUpw
	T/kKi7CPCh/8jzuKDYHKkE4fN85KdXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774613944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6P1WrMmKD9rChWvzRFC1qwoDoYMeSRxESUxtcxIOWo=;
	b=bheKQNUgnuAQGtbsx/ZlsLHE/Fu6s4ylrWp6R054cbwt/HG3TVzoImVIKoUe9YY6STVpk0
	IPjzM4bPrt2CAjAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 264844A0A2;
	Fri, 27 Mar 2026 12:19:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8lcSCLh1xmljTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 12:19:04 +0000
Date: Fri, 27 Mar 2026 13:19:03 +0100
Message-ID: <87h5q1qxc8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philip Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1 ] Support POD HD PRO
In-Reply-To: <CAKSkzpui0HAx3LSvxOJFi7opb0sR-3oy5Oxw7uYjMep5ZHVJJw@mail.gmail.com>
References: <CAKSkzpui0HAx3LSvxOJFi7opb0sR-3oy5Oxw7uYjMep5ZHVJJw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 3FF295BDD3
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 19 Mar 2026 12:03:08 +0100,
Philip Willoughby wrote:
> 
> I apologize for the previous badly-formatted patch.
> 
> The POD HD PRO is a POD 500 in a different box.
> 
> The USB PID changes but everything else is the same.
> 
> Phil Willoughby (1):
>  Add Line6 POD HD PRO support
> 
> sound/usb/line6/podhd.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
> 
> 
> base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
> --
> 2.53.0
> 
> From 6f3211504f7091fb5ecab36daea4628b3fa4f0db Mon Sep 17 00:00:00 2001
> From: Phil Willoughby <willerz@gmail.com>
> Date: Thu, 19 Mar 2026 10:54:40 +0000
> Subject: [PATCH 1/1] Add Line6 POD HD PRO support
> 
> ---

Hmm, the patch misses the description completely and even no sign-off
is given.

> sound/usb/line6/podhd.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
> 
> diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
> index ea1324c22f46..f32712286642 100644
> --- a/sound/usb/line6/podhd.c
> +++ b/sound/usb/line6/podhd.c
> @@ -28,6 +28,7 @@ enum {
>        LINE6_PODHD500X,
>        LINE6_PODHDDESKTOP,
>        LINE6_PODHDPROX,
> +       LINE6_PODHDPRO,

... and the patch itself looks malformed, partly due to your mailer.
Please fix it at first, and prepare a properly formatted patch, then
try to submit.


thanks,

Takashi
