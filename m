Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF52C21EB
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752188; cv=none; b=spLqWfBoQpw4MQtxzx0Yqrq6mEkHdKsPLz2KPLWqGOf2TF6t5t5dcAxz07JaD9oSDg9fk3WbrwYdrutUeKES8zAVP5hQdVDelzTCORdLAhrDGAxGt6lecmc7PsRgqncjJmQcIHkbIPSPSoLV8ptZT1I5ffb3gMo/ZKy3pyMj0nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752188; c=relaxed/simple;
	bh=5SzxtBxNgvyG4dgta0HGPaW30Q2Nd7O0g4Sduu3qwGQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iro2TYuhQuhvq6nRuDAWSU7UpUUHGkxo3AlVsDKeJsrjdIQKVMMf36Ss1mG+VYvdrV1OgiZAjzgseYPpUH4R1U7dXXRTan/IdO2hDLrgbCcBuiZOOjj8Ur8lMeQrqKcgVfojY4Uwf1Qk50gXaUUzpIHBxCYtrtxfB65t4w3fidQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B5PH/zX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5xcZDmNg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B5PH/zX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5xcZDmNg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B5PH/zX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xcZDmNg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B5PH/zX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xcZDmNg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4F3BA33692;
	Wed,  3 Dec 2025 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764752179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfvyRYxFkkMOtTJG0+VjRJuw69bKNEAwjvTDqx2W/ao=;
	b=B5PH/zX7NNq5fQogpyC0nNGhYrXPFGwtjbHSZWKr88zpK7Z5y2opBP3UR8g1LbTuWNf6II
	sNnW1g+nO/6x1KCH8ocp/61xkvqJ1hpOizMiut5F8sg6WYn20BqjlOmmUWXdmmJunsFhcx
	N+fz5I0SjMYjk6rS87d1jhI2bHA+wOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764752179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfvyRYxFkkMOtTJG0+VjRJuw69bKNEAwjvTDqx2W/ao=;
	b=5xcZDmNgOpaC9tRFe+Um2PSmaG3flgnfsewTEuCmC4sNeXlHdSSLh9ohyMkniN+XQgxetP
	aCSOEl0hkWX5J6Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="B5PH/zX7";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5xcZDmNg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764752179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfvyRYxFkkMOtTJG0+VjRJuw69bKNEAwjvTDqx2W/ao=;
	b=B5PH/zX7NNq5fQogpyC0nNGhYrXPFGwtjbHSZWKr88zpK7Z5y2opBP3UR8g1LbTuWNf6II
	sNnW1g+nO/6x1KCH8ocp/61xkvqJ1hpOizMiut5F8sg6WYn20BqjlOmmUWXdmmJunsFhcx
	N+fz5I0SjMYjk6rS87d1jhI2bHA+wOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764752179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfvyRYxFkkMOtTJG0+VjRJuw69bKNEAwjvTDqx2W/ao=;
	b=5xcZDmNgOpaC9tRFe+Um2PSmaG3flgnfsewTEuCmC4sNeXlHdSSLh9ohyMkniN+XQgxetP
	aCSOEl0hkWX5J6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07A403EA63;
	Wed,  3 Dec 2025 08:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9kIuADP7L2mRbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Dec 2025 08:56:19 +0000
Date: Wed, 03 Dec 2025 09:56:18 +0100
Message-ID: <877bv4t03x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: hariconscious@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	cryolitia@uniontech.com,
	franta-linux@frantovo.cz,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized symbol errors
In-Reply-To: <20251203083319.58555-2-hariconscious@gmail.com>
References: <20251203083319.58555-2-hariconscious@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 4F3BA33692
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,collabora.com,uniontech.com,frantovo.cz,kernel.org,gmail.com,vger.kernel.org];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Wed, 03 Dec 2025 09:33:20 +0100,
hariconscious@gmail.com wrote:
> 
> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> Initialize 'status1' with a default value to resolve the static analysis
> smatch reported error "uninitialized symbol 'status1'".
> The 'status1' variable is used to create a buff using "kmemdup".
> So, ensure to initialize the value before it is read.
> 
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> ---
> This patch fixes the below smatch reported errors.
> sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
> sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.
> 
> The below is the flow of 'status1' it is used before initialization.
> 
> snd_rme_rate_get -> status1 is uninitialized and passed
> 	snd_rme_get_status1 -> passed as is
> 		snd_rme_read_value -> passed as is
> 			snd_usb_ctl_msg -> created buf from status1 using kmemdup
> 				usb_control_msg -> sent buf for reading/writing
> 
> Description of "usb_control_msg", states as
> " * @data: pointer to the data to send"
> 
> Later from Usb control request, dst buf is copied to src buf but usb
> control msg request is made before initialization.
> 
> Thank you.
> 
>  sound/usb/mixer_quirks.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 828af3095b86..06903c5de087 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
>  static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
>  			    struct snd_ctl_elem_value *ucontrol)
>  {
> -	u32 status1;
> +	u32 status1 = 0;
>  	u32 rate = 0;
>  	int idx;
>  	int err;
> @@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
>  static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
>  				  struct snd_ctl_elem_value *ucontrol)
>  {
> -	u32 status1;
> +	u32 status1 = 0;
>  	int idx = SND_RME_CLOCK_NOLOCK;
>  	int err;
>  
> @@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
>  static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
>  				struct snd_ctl_elem_value *ucontrol)
>  {
> -	u32 status1;
> +	u32 status1 = 0;
>  	int err;
>  
>  	err = snd_rme_get_status1(kcontrol, &status1);
> @@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
>  static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
>  				    struct snd_ctl_elem_value *ucontrol)
>  {
> -	u32 status1;
> +	u32 status1 = 0;
>  	int err;
>  
>  	err = snd_rme_get_status1(kcontrol, &status1);
> @@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
>  static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
>  				   struct snd_ctl_elem_value *ucontrol)
>  {
> -	u32 status1;
> +	u32 status1 = 0;
>  	int err;
>  
>  	err = snd_rme_get_status1(kcontrol, &status1);
> 

The warning itself is rather dubious.  But it'd certainly give a safer
feeling to cover the uninitialized variables, so it would still make
some sense.

But, the code change can be improved.  e.g. initialize the value in
the callee side, instead of callers; then it'll reduce all changes to
a one-liner.

At the next time, please look at the patterns you changed more closely
and think again whether it's the best change or not before submission.
On the second look, often you see things from a different perspective
:)


thanks,

Takashi
