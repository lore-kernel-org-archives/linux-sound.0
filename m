Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A73090C5
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860272; cv=none; b=tqiOzWVJIumuR9ZEWGD7tRA/z9/X6V/GnSSwfBP4O8Rx2G4P0Tr43xeNf9VoaHjh6hcLpwKi0L9Q5CX3ABOFLpbVi8AhiwQJRqnnlRFNkn6HzCYcFenJYNANo3JQDYIstT4ZaVZ7DTH7x8BzeLqSon1NysmsSrtJ84M2S95MCsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860272; c=relaxed/simple;
	bh=3hSeiZL7YGtFQOuPapqrz2NgBFJuXCpcTvy/tK72Tuo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJqtg30ndg/HXKjrWauxYRqn6DxPtMrJvpODfuFgR2uwPSLogSd+I4cqTKtp9gI0qrXxK1Vy8pPKzKg3dgtiNWApMH41VZhFReJmjm0++DEVsadxBA+qMPclibLTRXO1eqkKnK72JpahQNgGpzGGsGFWhhir17rza1YVYQ48/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JFoIhDHx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XWkOX211; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hVj74LBx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9T7G3xPS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JFoIhDHx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XWkOX211";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hVj74LBx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9T7G3xPS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B282B6A99E;
	Wed, 27 May 2026 05:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gokNZaAiEOpYwFT+u08kat8qUUMN1avii99QVQbE7pk=;
	b=JFoIhDHxVjKsOkOUkclnJxhYq35k6GE5+g7YPvXc0WPmmipdEUmxEAUMQrWPaZXGJV5HaZ
	Ga3e7c4rzQfC+HszrHX6+Zk7/8w4p12nssteWsG57qyTPWn5HeMPE70EnhIS3oSamfj98I
	iVD1lt10ezTNOzXx657aIYib+/HiQmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gokNZaAiEOpYwFT+u08kat8qUUMN1avii99QVQbE7pk=;
	b=XWkOX211KG1Ko23aF9Nmwm1cLv3YCL5qB+yqHLjoNyg7HDVHw8Twj5IQCNedAJHCxgoDxB
	/QFWtCbY0Uqw/IDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hVj74LBx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9T7G3xPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gokNZaAiEOpYwFT+u08kat8qUUMN1avii99QVQbE7pk=;
	b=hVj74LBxdpMaG6JSkGUQH3Q9XIH903+8x/hKi8ou0+z4cR3vgcWLhad8ghrfWBBvZcWvel
	MvOVmdYWG9Evgfz8hfCKCTefISg52y+XoWGBb8B+6/W5uvzf2aFmaQ3xxStXEiEfBllqbU
	6HWhxz7k2QJ6l7eMuv9QlyFNhBV+7fY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gokNZaAiEOpYwFT+u08kat8qUUMN1avii99QVQbE7pk=;
	b=9T7G3xPSqjwd+s78rMP0+UQ0E3sTYPFsvxuweSubehdfkgClUHLa0YsZxQcD1Bo0qWUT9i
	yHZggiK+MNQ9AOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CAE25A676;
	Wed, 27 May 2026 05:37:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gLv+GCuDFmr7PAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:37:47 +0000
Date: Wed, 27 May 2026 07:37:47 +0200
Message-ID: <87tsrtwgyc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gordon Chen <chengordon326@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL
In-Reply-To: <20260527-uac-quirk-get-cur-vol-v1-2-e9362b712e5e@rong.moe>
References: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
	<20260527-uac-quirk-get-cur-vol-v1-2-e9362b712e5e@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B282B6A99E
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,rong.moe:email]

On Tue, 26 May 2026 19:49:24 +0200,
Rong Zhang wrote:
> 
> Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
> identify devices with sticky mixers. Unfortunately, even though most
> devices with sticky GET_CUR also have corresponding sticky SET_CUR,
> which I actually met more since the commit had been merged, there is
> also a rare case that some devices may have volume mixers that responds
> to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
> check to consider the mixer to be sticky and unnecessarily disable it.
> 
> Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL to prevent sending GET_CUR to
> mixers by returning -ENXIO early. The error effectively skips the sticky
> check as it's only meaningful when the mixer has some sort of self-
> awareness. Similar to QUIRK_FLAG_GET_SAMPLE_RATE, this should also help
> if some unmet devices can't tolerate volume GET_CUR in other ways.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  Documentation/sound/alsa-configuration.rst | 4 ++++
>  sound/usb/mixer.c                          | 5 +++++
>  sound/usb/quirks.c                         | 1 +
>  sound/usb/usbaudio.h                       | 6 ++++++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
> index 4b30cd63c5a5..bc3bc65c379a 100644
> --- a/Documentation/sound/alsa-configuration.rst
> +++ b/Documentation/sound/alsa-configuration.rst
> @@ -2389,6 +2389,10 @@ quirk_flags
>            from snd_usb_handle_sync_urb. Instead fall through and enqueue a
>            packet_info containing only size-0 packets, so the OUT ring keeps
>            moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
> +        * bit 30: ``mixer_skip_get_cur_vol``
> +          Skip reading current volume for mixers, as some devices return
> +          constant values or errors but otherwise works fine, i.e., setting
> +          volume takes desired effect.
>  
>  This module supports multiple devices, autoprobe and hotplugging.
>  
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index d61bde654219..3b745aebb181 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -420,6 +420,11 @@ static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
>  static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
>  				  int channel, int *value)
>  {
> +	struct snd_usb_audio *chip = cval->head.mixer->chip;
> +
> +	if (chip->quirk_flags & QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL)
> +		return -ENXIO;

So this workaround is applied to all mixer controls?

We can put it as a common quirk as you've done, but the question is
how many devices need this, too...


thanks,

Takashi
