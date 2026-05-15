Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34177374186
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827037; cv=none; b=pWnGdDzUpirTkaS9636wbWungmP2kDP4yvMFWq+CggNwzeujM9QOFXImPGL9QmagUVK25WsQo5TGGY8QxZ7sRaTIuhp12zcDqLVGY7GLQ7lPgXY8/k7wohoGKWsWQv0dx037ZzFpFEuMy/ZjaV58wS8XkM4Fcs041MhDIE3PAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827037; c=relaxed/simple;
	bh=P40VJwiDyEHPfCkSebtPijC6L80AXe9r5uAMpmUPgMQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9xbA7W8RsvXmHqjPUeQXSHl0Y4TJcdq8UvplbdYlDyjvHdRGZstU9jHeTj79ydp+/w/Yer1fglKkKym3Xy35UXxjqGT7BdHfjSX/B8QbV7bx2vsHsGS1xiDV2gfu8YHnDQteHBVdv1NM0VQ7fq0txNr9IPZyLy4W9HsYTqS0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SAaU1ZwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+Z3iTxKl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SAaU1ZwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+Z3iTxKl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SAaU1ZwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Z3iTxKl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SAaU1ZwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Z3iTxKl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FA3F67660;
	Fri, 15 May 2026 06:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IT5UqXEI9z6R30R0i+U843IuTsHJ20hDJ5ZDLkEpa5k=;
	b=SAaU1ZwQsPy84RugEGzM8P70Sbgh0qq+tfX+LLZUnu/+XzVJxOA4rSJQOk2GRQ0rkS9jZE
	TCHfi7qXMmlXqEAGxzv5/Lwam7tbqUVqUtkiBG2xE8NHlJDS68nXprtWKerk2gpP35wIvT
	ZcjJOBmXHD7Xd6i9MBTQVuM7Jhefdak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IT5UqXEI9z6R30R0i+U843IuTsHJ20hDJ5ZDLkEpa5k=;
	b=+Z3iTxKldzd0fGdAAo5eYpg9YvLmUDimT3Ea8rD2FRpFfl1b3UEaFjfSaM05lz9a1MHSys
	ga0LX5CmYf2gP1Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SAaU1ZwQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+Z3iTxKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IT5UqXEI9z6R30R0i+U843IuTsHJ20hDJ5ZDLkEpa5k=;
	b=SAaU1ZwQsPy84RugEGzM8P70Sbgh0qq+tfX+LLZUnu/+XzVJxOA4rSJQOk2GRQ0rkS9jZE
	TCHfi7qXMmlXqEAGxzv5/Lwam7tbqUVqUtkiBG2xE8NHlJDS68nXprtWKerk2gpP35wIvT
	ZcjJOBmXHD7Xd6i9MBTQVuM7Jhefdak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IT5UqXEI9z6R30R0i+U843IuTsHJ20hDJ5ZDLkEpa5k=;
	b=+Z3iTxKldzd0fGdAAo5eYpg9YvLmUDimT3Ea8rD2FRpFfl1b3UEaFjfSaM05lz9a1MHSys
	ga0LX5CmYf2gP1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2891593A9;
	Fri, 15 May 2026 06:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w0fjORm/BmpzQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:37:13 +0000
Date: Fri, 15 May 2026 08:37:13 +0200
Message-ID: <87lddluqjq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang Yang <kailang@realtek.com>
Cc: Breno Baptista <brenomb07@gmail.com>,
    linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Restore headset mic after suspend for Acer Nitro 5
In-Reply-To: <20260508215746.15564-1-brenomb07@gmail.com>
References: <20260508215746.15564-1-brenomb07@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,perex.cz];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 2FA3F67660
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 08 May 2026 23:57:46 +0200,
Breno Baptista wrote:
> 
> The headset mic on the AN515-57 was shown as unplugged after resuming
> from S3/S4, requiring a reboot to recover.
> 
> Signed-off-by: Breno Baptista <brenomb07@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 11d0ea8ed859..449a5ab3b0d0 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -3578,6 +3578,16 @@ static void alc2xx_fixup_headset_mic(struct hda_codec *codec,
>  		alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
>  		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
>  		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		/*
> +		 * COEF 0x45 (CTIA combo jack mode) is not preserved across suspend.
> +		 * Restore it before restarting HP JD so the headset is re-detected.
> +		 */
> +		if (is_s3_resume(codec) || is_s4_resume(codec)) {
> +			alc_update_coef_idx(codec, 0x45, 0xf<<12 | 1<<10, 5<<12);
> +			alc_combo_jack_hp_jd_restart(codec);
> +		}
> +		break;
>  	}
>  }

The code change itself looks OK, but I'd like to confirm that it's the
expected behavior.

Kailang, could you verify this please?


thanks,

Takashi
