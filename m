Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D63E5A01
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507237; cv=none; b=TWxEJ2+ERkFC/LZn+pOrNjcQ/M7+9tYNXUtu+6w8TjK5tr07TOtfmMtGIZw+2P0AUvZi5UtEI3gdZ7RCcFGeddiZ9lKux+ZkguLx9M70hEkubTX8IVnE5y8+ON02UvNMnE+5YgWUbDtQyEx3I/P19h1SFgE3NtB4FQpbxarTklA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507237; c=relaxed/simple;
	bh=8JRdR5qKnSVAGPiqVsWJo5dloSgeESVhcziurYyxKz8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E33Mw09YAT0ytYMpuzAXBQwo+0pp/79It3C8acEpRiAVZW9+T2Zb3CdYAaeTEzvJh9g7MC2vSmKVD07c/iV0CBFPpTfqtjsXV/kWeyLdUNFSLYhmYVmeYpyq0TygIAxDya4GBzeNllQejPPtJ1/DdKl32ZiTBOL93sKEm0fLiGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ddjgUeM8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XlBOIM2G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YGhTAHYc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OgpJ/Ju9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ddjgUeM8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XlBOIM2G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YGhTAHYc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OgpJ/Ju9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF15575B5E;
	Wed,  8 Jul 2026 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+rVI0PWohn426O/HTuQTYWJAhFgIia+6g+AbADCWS0=;
	b=ddjgUeM8dEoGy8HZ2/oiN8vvjoBo/Zhy9hFMJ2G5exphDIGjtO+OPfAu4blbj8hQ4N8zPh
	A+u13PWcwV0HagiQqxyAZgkT45io/0RYv0jURK0bdtt9eFzJXwMbzMIDnXOCv/pNGNm0TC
	zcQGfUtq5d67ulhZEX9nXThH1IM5470=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+rVI0PWohn426O/HTuQTYWJAhFgIia+6g+AbADCWS0=;
	b=XlBOIM2Gm6GddDjBlbdZ04rsl6Ny9Le/RPrkVvbFP6cyaRJvUXqULwHBzXb8Un2eq780an
	Ld/SCEW6aDo4DeBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+rVI0PWohn426O/HTuQTYWJAhFgIia+6g+AbADCWS0=;
	b=YGhTAHYcxcKwJ0LeGTPYW1CvtHofzxWbBs4n9BlnSadfyW6NwrJ6D2//Q3ZaIvg5K6xA01
	ovXB3VS9ekb3aeg3tsN9J/gouvxayZLI6pja432HQA2pb/RWRGhfrqTsmAdue+OkZQDjyJ
	yQsQolaS6bli5+kAw7XTi53jySKa654=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+rVI0PWohn426O/HTuQTYWJAhFgIia+6g+AbADCWS0=;
	b=OgpJ/Ju9zfg5M/i+cLd79SQiWqDQ3GOThmOYttmaG9KBvouTzYO2pGFvW5eiJ8VvktNF93
	tPmtVT8PPkN/2ODw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90A87779AE;
	Wed,  8 Jul 2026 10:40:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NrwAIhYpTmqpHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:40:22 +0000
Date: Wed, 08 Jul 2026 12:40:22 +0200
Message-ID: <874ii969yh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Agustin Luzardo <agustinluzardo09@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Do not drop per-channel feature controls marked get_cur_broken
In-Reply-To: <20260707183133.8113-1-agustinluzardo09@gmail.com>
References: <20260705184227.113588-1-agustinluzardo09@gmail.com>
	<20260707183133.8113-1-agustinluzardo09@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
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
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, 07 Jul 2026 20:31:33 +0200,
Agustin Luzardo wrote:
> 
> When a per-channel Feature Unit control (e.g. a stereo PCM Playback
> Volume control) hits the sticky-mixer check during get_min_max_with_quirks(),
> and the device carries QUIRK_FLAG_MIXER_GET_CUR_BROKEN, the sticky
> check marks the control as cval->get_cur_broken and returns -ENXIO
> instead of disabling it outright.
> 
> However, __build_feature_ctl() does not know about this and treats
> any negative return other than -EAGAIN as fatal, discarding the
> kcontrol entirely:
> 
> 	if ((ret < 0 && ret != -EAGAIN) || cval->max <= cval->min) {
> 		...
> 		snd_ctl_free_one(kctl);
> 		return;
> 	}
> 
> For a stereo device where only some channels trip the sticky check,
> this silently drops the per-channel (stereo) control while the
> master-only control (built separately, without going through the
> same channel-specific GET_CUR negotiation) survives. The result is
> that the user is left with a single mono/master volume control
> instead of the independent per-channel controls the device actually
> supports, with no visible error (usb_audio_dbg is typically compiled
> out).
> 
> This was observed on a Weltrend Semiconductor 040b:0897 device (sold
> as the Redragon H510-PRO Wireless headset), which reports a genuine
> stereo Feature Unit (bNrChannels = 2, bmaControls with Volume set for
> both channels) but ends up exposing only a single-channel "PCM
> Playback Volume" control once QUIRK_FLAG_MIXER_GET_CUR_BROKEN is
> applied for that device.
> 
> Skip the discard when the control was already marked get_cur_broken,
> as long as a sane range was otherwise established.
> 
> Signed-off-by: Agustin Luzardo <agustinluzardo09@gmail.com>

Hm, by some reason, this patch couldn't be applied cleanly via git-am.
It seems that your mailer screwed up.

Could you try to resubmit after correcting the setup?
At best, try to submit to yourself and verify that you can do properly
apply the patch from the mail beforehand.


thanks,

Takashi
