Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AD51A9FB3
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061393; cv=none; b=B4la/PtzELGDp/tKnkit0ESuI4hfFOwoqiDoLWE2C7QEM1e7pRfWMrbKYDoEasw9MNQkA5caSMhUVzUnIx7NA62GqEt86exGS/RbNFnfiFay2UNhfc92N1GqmqaVMaQc2JJEvoCmHMwAn8IupRipxbhW2fYxD4jJsVZR2OnX1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061393; c=relaxed/simple;
	bh=1au2E/02mv6GdqA6YPpM5EPHFwpVsrLJ+8iNXVQMLNU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sAbTd9bs0hC+3wCF51H8HEYcbEyOC/rsrALiOtPkkOADDRp/MVlL5PzJkgml3DREOsDNZ8EY5rCMV/Dve1kALVHynluLK8pwMVuXqUSx4UdVMZ3O5Ni2n4PJB3ud93A7uO2ctkblncjmyihF6sU5a7RTKlzElnrI364t/qhI8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YFECmfCU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A231tbJ+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QtMfg8IW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CF3EQOfX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YFECmfCU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A231tbJ+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QtMfg8IW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CF3EQOfX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2A17430A;
	Fri,  5 Sep 2025 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757061389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpS1meoz56jEhqQIQUEKdmcdn24XO4FfukTeG4L5jy8=;
	b=YFECmfCUfsR9xZK1+aTua9O3v9fFGuQd5zrpQykciAaKahUGCdjXxDY2yy4YvPtipcmPMs
	kwuCXia2x8xQ1ac07+JsHD+LUY+CowxJD/0goQhPvBy7zwtmPnQOzpgiIEdW0kVaO+TOQv
	lbZT0ICGoJCkAuKtsKCsamX88N9a9mY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757061389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpS1meoz56jEhqQIQUEKdmcdn24XO4FfukTeG4L5jy8=;
	b=A231tbJ+J5kVbiPoYBRdsSjxEnaENET95irY6DbWlgH5K99uAxoTjKmLsQB0rlI8eMoYL8
	Cn9Iz6RaO6j8qSCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QtMfg8IW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CF3EQOfX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757061388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpS1meoz56jEhqQIQUEKdmcdn24XO4FfukTeG4L5jy8=;
	b=QtMfg8IWvElN53c3UBr0XJpVhlq5GyziaXHgD5VdaBsdm8xrqt0O6LV4jxqcILQWAkN0tf
	9FBzN4QsC+t1xh6zAHaakH/QJdDT/hIU/7ZrS0e+kZCbqSoLMiHMRtcjQYkzYn1Jeiua2g
	T39/fLkClqXknYfDcU25f5FUDZI6qwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757061388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpS1meoz56jEhqQIQUEKdmcdn24XO4FfukTeG4L5jy8=;
	b=CF3EQOfXQH6/uVJXV4w2/8lqTcKISb5YsWneiDoigd/FZyB/AFGCDpxeXHsviNvBEEEEKJ
	pwC/JRbV5QEdWwCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AECEE139B9;
	Fri,  5 Sep 2025 08:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z7YtKQyhumgCHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Sep 2025 08:36:28 +0000
Date: Fri, 05 Sep 2025 10:36:28 +0200
Message-ID: <87y0qtqos3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Add Vocaster speaker/headphone mute controls
In-Reply-To: <aLm2Dy6+O/eLTGVn@m.b4.vu>
References: <aLm2Dy6+O/eLTGVn@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D2A17430A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Thu, 04 Sep 2025 17:53:51 +0200,
Geoffrey D. Bennett wrote:
> 
> Add support for the speaker and headphone mute controls on Focusrite
> Vocaster interfaces. Unlike other Focusrite interfaces, these mute
> controls are per-output, not per-channel.
> 
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> ---
>  sound/usb/mixer_scarlett2.c | 97 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
> index e762d6110b1a..f2446bf3982c 100644
> --- a/sound/usb/mixer_scarlett2.c
> +++ b/sound/usb/mixer_scarlett2.c
> @@ -10,8 +10,9 @@
>   *   - Solo/2i2/4i4 Gen 4
>   *   - Clarett 2Pre/4Pre/8Pre USB
>   *   - Clarett+ 2Pre/4Pre/8Pre
> + *   - Vocaster One/Two
>   *
> - *   Copyright (c) 2018-2024 by Geoffrey D. Bennett <g at b4.vu>
> + *   Copyright (c) 2018-2025 by Geoffrey D. Bennett <g at b4.vu>
>   *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
>   *   Copyright (c) 2022 by Christian Colglazier <christian@cacolglazier.com>
>   *
> @@ -75,6 +76,9 @@
>   * to many LinuxMusicians people and to Focusrite for hardware
>   * donations).
>   *
> + * Support for Vocaster One and Two added in Mar 2024 (thanks to many
> + * LinuxMusicians people and to Focusrite for hardware donations).
> + *
>   * This ALSA mixer gives access to (model-dependent):
>   *  - input, output, mixer-matrix muxes
>   *  - mixer-matrix gain stages
> @@ -364,6 +368,21 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
>  	"Mute Playback Switch", "Dim Playback Switch"
>  };
>  
> +/* Vocaster One speaker/headphone mute names */
> +static const char *const vocaster_one_sp_hp_mute_names[] = {
> +	"Speaker Mute Playback Switch",
> +	"Headphones Mute Playback Switch",

Usually "XXX Playback Switch" indicates that it's a switch for
mute/unmute, hence we don't put "Mute" here.

Actually, having a "mute" switch makes difficult to judge how it
behaves: when the mixer switch is "on", is it muted, i.e. the sound
goes off?  It's a contradiction to other mixer controls.


thanks,

Takashi
