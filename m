Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939D125D0
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601339; cv=none; b=AJjEuMF1E7SgaOZr4k/Xu7p/ZjVxd9+rezvz/oilPYWjI/IroswYT5v5210ETesFVxfbZ+OYiYff648Bp/gU8s1UXH56JOkfO3hbaakoyvaIj4OkNpvZupKehbOuvOO5hFw6wIG4xE7124ZXIamjMhXqiobsA/YFKv4EVrWKG0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601339; c=relaxed/simple;
	bh=UTEij9PpHzK7OpAa9jh5zyqcBJZj4F2s5ZOuxkGrZgk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=upq2Z+23X1AlFw0jCrNK2dNi2fXc6coTr2TzkzNKczPjKq57WQPxVCBl0bd3QQ2mK3oxJjQt5G/wTV7XuYtR7FIACxkLDmkwGaA+Du2h/q2NjLp2qFtXCx4XLfeFyFAafKZvYZiUpKwEWQ2OXXVVayxqFcwDrGX8zheEp/EuYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XvyKId5m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A7aHIAju; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jC7phnQi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2UdOg7XY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XvyKId5m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A7aHIAju";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jC7phnQi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2UdOg7XY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7865133695;
	Mon,  1 Dec 2025 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764601335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRx4gZKxnV68XZbYqcR5fl9rEhAJdXvnjnkzexPJsjk=;
	b=XvyKId5m1GrCvpcAUlyT9fMqcz2REOF/X3AW4dYCzy53BX9whvtNhqx3LcfC9hp7YErQHm
	9jx1J1uR2YYpqO/Edg3m8QyRI8gIi3M7fWqY4UCFDFXTC760bcIkd7O05CUInNR06FqbyO
	3884Ds+S16eod/xTSxem1hnMHuloOY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764601335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRx4gZKxnV68XZbYqcR5fl9rEhAJdXvnjnkzexPJsjk=;
	b=A7aHIAjuzCxNBU1vbU8EsTXMI0M1PTz621j6UrHpRGolrcyOnvJmecldqo7wJA4JOnVDpK
	tIIDlPEMRKg2TaAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764601333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRx4gZKxnV68XZbYqcR5fl9rEhAJdXvnjnkzexPJsjk=;
	b=jC7phnQitwMYw+F+hWs8zV94zLnJwkB5u8y7tC98iNGAP5Rvp0ZhSNF2oFlNiCtSi8qe4y
	em/GBFlefL6QQjOlnDTb52YbSoAi1AqsHe85XPAwlvDJYFHBU0iteXyB/hdMAaiwxtNdB8
	KAQTDDRy2+9gWfGJjipP9mySzyroeZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764601333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRx4gZKxnV68XZbYqcR5fl9rEhAJdXvnjnkzexPJsjk=;
	b=2UdOg7XYOBdhut2D883gEW7tZVPl7V59basdcsxFpkcPRjfw9yBhRqSsSlFsem5Fwa0Coq
	il/3SIA39Ah0K+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B6E33EA63;
	Mon,  1 Dec 2025 15:02:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G7SwDPWtLWlOCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Dec 2025 15:02:13 +0000
Date: Mon, 01 Dec 2025 16:02:12 +0100
Message-ID: <87o6oikzyj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: hariconscious@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: rawmidi: Fix inconsistent indenting warning reported by smatch
In-Reply-To: <20251201144620.18942-2-hariconscious@gmail.com>
References: <20251201144620.18942-2-hariconscious@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 01 Dec 2025 15:46:21 +0100,
hariconscious@gmail.com wrote:
> 
> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> Fix smatch reported inconsistent indenting warning in rawmidi.
> sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
> indenting.
> No functional changes were introduced.
> 
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> ---
> This patch fixes the below smatch reported warning
> sound/core/rawmidi.c:2115 alsa_rawmidi_init() warn: inconsistent
> indenting.
> Re-ran the smatch to confirm warning is cleared and no functional
> changes were introduced.

Just move "int i" into the for() and drop braces instead -- which is
allowed in the recent versions, and it's much nicer than shifting way
too many texts just for a minor smatch warning.


thanks,

Takashi

> 
> Thank you.
> 
>  sound/core/rawmidi.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
> index 20d36a346cca..5d90341cc18f 100644
> --- a/sound/core/rawmidi.c
> +++ b/sound/core/rawmidi.c
> @@ -2106,25 +2106,25 @@ EXPORT_SYMBOL(snd_rawmidi_set_ops);
>  
>  static int __init alsa_rawmidi_init(void)
>  {
> -
>  	snd_ctl_register_ioctl(snd_rawmidi_control_ioctl);
>  	snd_ctl_register_ioctl_compat(snd_rawmidi_control_ioctl);
>  #ifdef CONFIG_SND_OSSEMUL
> -	{ int i;
> -	/* check device map table */
> -	for (i = 0; i < SNDRV_CARDS; i++) {
> -		if (midi_map[i] < 0 || midi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
> -			pr_err("ALSA: rawmidi: invalid midi_map[%d] = %d\n",
> -			       i, midi_map[i]);
> -			midi_map[i] = 0;
> -		}
> -		if (amidi_map[i] < 0 || amidi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
> -			pr_err("ALSA: rawmidi: invalid amidi_map[%d] = %d\n",
> -			       i, amidi_map[i]);
> -			amidi_map[i] = 1;
> +	{
> +		int i;
> +		/* check device map table */
> +		for (i = 0; i < SNDRV_CARDS; i++) {
> +			if (midi_map[i] < 0 || midi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
> +				pr_err("ALSA: rawmidi: invalid midi_map[%d] = %d\n",
> +					i, midi_map[i]);
> +				midi_map[i] = 0;
> +			}
> +			if (amidi_map[i] < 0 || amidi_map[i] >= SNDRV_RAWMIDI_DEVICES) {
> +				pr_err("ALSA: rawmidi: invalid amidi_map[%d] = %d\n",
> +					i, amidi_map[i]);
> +				amidi_map[i] = 1;
> +			}
>  		}
>  	}
> -	}
>  #endif /* CONFIG_SND_OSSEMUL */
>  	return 0;
>  }
> 
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> -- 
> 2.43.0
> 
