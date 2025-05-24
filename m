Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23F2F24
	for <linux-sound@vger.kernel.org>; Sat, 24 May 2025 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071121; cv=none; b=KgCszS8HUEZnL1hF3c7SePW+qyF2oGHJkKCpzT2mx/yGQjOVntnuPJCeJfzux4wd8YciDUdcke+SeSEqmHxkc1ou+ILsMeZHkKmuJHXOBoo6eFWTr4jKUb/lvagzrztxjp7jOZk+juflxgcJJ2NOU8MtOeIoYS4Lg1gEvxaSPgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071121; c=relaxed/simple;
	bh=qDwcDuWvbCei/Hm4DBrICkQpfbeD+hs/GtuW/7FMygk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+vkr7aGPv3PThld2OSTTn+Ewv/jMRlbbKAVHBWVVnZs7NyMc/V4cFhfG0WMOra4dYGTkTVzZ4Fh6+0sPhPS8+4eIaNGUCDGJRyykgn+FL2wsHgZ0tM4fHoavXJSMV/a0yIb9nBugpS2MF38GeeKi7Szye0uC40bH6K9BV4H8tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=INrIbtom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HTaNarCq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=INrIbtom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HTaNarCq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="INrIbtom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HTaNarCq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="INrIbtom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HTaNarCq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B47D21B42;
	Sat, 24 May 2025 07:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748071117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RpaUxHuFMq0XjpzBY+5PN37tfeptWoBfNrnmW+FlsRU=;
	b=INrIbtomY8gD/2UQM9VyGunYjnYk0l0zH3sgfd5blOtth2Ig17g43ctE4qrXQpFFLvEgNR
	Z0H/dzYWZj4n5BzUscpPv1UsTUNioim7Sr+Y0ZJdXKgDL6FVf2YvMO7BQGOEkrQ9eP5R+G
	GJIew70ptIFiO/zJpTgvDSwOrrgp1xA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748071117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RpaUxHuFMq0XjpzBY+5PN37tfeptWoBfNrnmW+FlsRU=;
	b=HTaNarCqJuT1XRU8SsVO9R+wGWVsCbonthkSR975IKAR4bsqSIZazQpWHA9nZa8eX8hmbd
	mXgkTZDfBtA1KsCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=INrIbtom;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HTaNarCq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748071117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RpaUxHuFMq0XjpzBY+5PN37tfeptWoBfNrnmW+FlsRU=;
	b=INrIbtomY8gD/2UQM9VyGunYjnYk0l0zH3sgfd5blOtth2Ig17g43ctE4qrXQpFFLvEgNR
	Z0H/dzYWZj4n5BzUscpPv1UsTUNioim7Sr+Y0ZJdXKgDL6FVf2YvMO7BQGOEkrQ9eP5R+G
	GJIew70ptIFiO/zJpTgvDSwOrrgp1xA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748071117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RpaUxHuFMq0XjpzBY+5PN37tfeptWoBfNrnmW+FlsRU=;
	b=HTaNarCqJuT1XRU8SsVO9R+wGWVsCbonthkSR975IKAR4bsqSIZazQpWHA9nZa8eX8hmbd
	mXgkTZDfBtA1KsCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 033DB13894;
	Sat, 24 May 2025 07:18:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i1qOOsxyMWhsIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 May 2025 07:18:36 +0000
Date: Sat, 24 May 2025 09:18:36 +0200
Message-ID: <87cybyschf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
In-Reply-To: <20250523192934.1412153-1-superm1@kernel.org>
References: <20250523192934.1412153-1-superm1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3B47D21B42
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 23 May 2025 21:29:31 +0200,
Mario Limonciello wrote:
> 
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The audio controller in the Lenovo Thinkpad Thunderbolt 3 dock doesn't
> support reading the sampling rate.
> 
> Add a quirk for it.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks for the renewed patch.
Just a minor thing:

> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index dbbc9eb935a4b..c29607091fb1c 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2360,6 +2360,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_ALIGN_TRANSFER),
>  	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
>  		   QUIRK_FLAG_ALIGN_TRANSFER),
> +	DEVICE_FLG(0x17ef, 0x3083, /* Lenovo TBT3 dock */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE),

The table is sorted in the ID number order.
Could you put the new entry at the right position?


Takashi
