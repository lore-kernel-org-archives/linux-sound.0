Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471535CB6E;
	Sun, 23 Aug 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475595; cv=none; b=CNB13HDrJ2BN0hs2oDxnpfjWW9iI5CVnoporR/VMyLspYmO3vwPyXFNAmqxnCDaXhRDfLTn0Sff9zvWh4yyPTPIMpL0QML5MrGE4WsgOJF/PSoWVG2AohNZLNDyBetufFDvX71aYJx5u/5ti7HaAWm39XntK78UNj5d0/D/Si20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475595; c=relaxed/simple;
	bh=fokXA99WlON9F07C39oSy2Sk3g6bnkSMOIb42ljSiVo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASqf7feje8hX26fnl7ELxqLsQL/HzSbn4Sm38B80u6LofzHDLLOYFmlEMx13xt7B+78jhklPCb6D8Dfw/zbw88DfyzOpCsTzBcOQlaPc1fLumCjR1SvYT2DmIwVpAjdorU+8a1OkL76/tRGiRmDU83e0uS869JrfzynZxN9M398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wAye/Rew; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JvX0UIVp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l2WcBStG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uoxqB8zL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wAye/Rew";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JvX0UIVp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l2WcBStG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uoxqB8zL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 827A7862A4;
	Sun, 23 Aug 2026 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PiymZWvYv2AygDur8wz2MJuPDFbWXZJN+1NUP9KyRQ=;
	b=wAye/RewwLOfjGV35hK8X37mm6FuLGlMOFmLvl80Az3321ElSbJvV/Rk+CPgQgzB1KcNuq
	H0qC/YBA/8YzbJFqkA8+RE0YAs/jOmi/fIyvNYd+X3bGlsw6so46MEqaHUPIPZZVgkNUhA
	PUOy9D8ZRV+vrXoBaH3nl13texLozpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PiymZWvYv2AygDur8wz2MJuPDFbWXZJN+1NUP9KyRQ=;
	b=JvX0UIVp+GOK+0VWAG5Wryqhgvx1VIlx6tbS5HcJ1m6kfbi+oUpxlvQGEFn8LcQBd21BPr
	nyYJNI9Mn/B7iBDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l2WcBStG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uoxqB8zL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PiymZWvYv2AygDur8wz2MJuPDFbWXZJN+1NUP9KyRQ=;
	b=l2WcBStGATUrhb8fCBYr+lT/RVyhgPaQwetCFQpFrBKEnqzFIo3UAZsz7KHoQKKw1ygM8q
	hH6EMd5Udk1MsveAPF60ft1g8Ibo5BgPh4fpdVxpz/Jkp9IRwK4lU+hqBLg+fweodT0oDQ
	tVWwRQKPZnfUHo83sWJZXYJOgAb855k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PiymZWvYv2AygDur8wz2MJuPDFbWXZJN+1NUP9KyRQ=;
	b=uoxqB8zLA+At9cfPTe2YzvJinOIr8tnavR8cXpMw/2VwVFbbSJCR7h+tGdKjImlNZmPz+r
	8CWErkvxokY8y4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44FD013332;
	Sun, 23 Aug 2026 08:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AzEBD362imonCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 23 Aug 2026 08:59:42 +0000
Date: Sun, 23 Aug 2026 10:59:41 +0200
Message-ID: <87jyphw6te.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Federico =?ISO-8859-1?Q?Valent=EDn?= Andrade <fandrade@frba.utn.edu.ar>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
In-Reply-To: <20260822043033.529424-2-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
	<20260822043033.529424-2-fandrade@frba.utn.edu.ar>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 827A7862A4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sat, 22 Aug 2026 06:30:32 +0200,
Federico Valentín Andrade wrote:
> 
> The M-Audio Venom (0763:2084) is an USB Audio Class 1 compliant
> synth with an integrated audio interface, it does not implement
> GET_CUR on SAMPLING_FREQ_CONTROL, hanging up if requested on
> endpoint 0.
> 
> The first class request issued by the driver after enumeration is
> a GET_CUR on endpoint 0x02, freezing the device's USB microcontroller.
> Timing out on every transfer afterwards with -ETIMEDOUT, such as
> SET_INTERFACE, so neither the mixer nor any streaming interface is set up.
> 
> Analyzing a USBPcap capture of the Windows driver I found it never
> requests the sampling frequency, as the synth exposes a single
> discrete of 44100Hz on both streaming interfaces, thus asking for it
> is unnecessary.
> 
> So I applied get_sample_rate to avoid this check, and
> disable_autosuspend because the synth doesn't come back from being
> suspended.
> 
> Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index f4e1eac639..caa80487f4 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2334,6 +2334,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>  	DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
>  		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
> +	DEVICE_FLG(0x0763, 0x2084, /* M-Audio Venom */
> +		   QUIRK_FLAG_MIXER_GET_SAMPLE_RATE | QUIRK_FLAG_DISABLE_AUTOSUSPEND),
>  	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */

This caused a build error.  A typo of QUIRK_FLAG_GET_SAMPLE_RATE?


thanks,

Takashi

