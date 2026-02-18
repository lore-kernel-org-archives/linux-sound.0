Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6A328B5F
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771423337; cv=none; b=e0XpzDTw3PIMm2R+7YgK+yXIYpEKBrqNNeKFZ2tqLEB09Lhw+BKPB31my3DJYzPfi1EvwejY9+5H65fpFFswa9kFTBLIoP2AXpN9Tg3WSA/yf8g/bOI4IsckSttiEEUJsnX9jzKk0QMAa4hkrLANaX5tIcmU3VqCuLWoaSGFxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771423337; c=relaxed/simple;
	bh=K/ZB+zDOD6dJ9maECMgQZtxN1+30DvfpzaFYz8f6Xts=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGxA3gZUNBPo6ctYTVTKRc1X5KBoo9XtIj0mB2P8+myDksr/ovqzktrg6GaEbgAoGSY1KjRtZcRBD4SQLbUNqKqh6V8uK/8m5UfpK4CMp6fn+DeJF1a3edk1/f6BYFGxJQIorKUFb7nb5IJhVHtw7uVy9pYJtKusePnIwsN3CMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G/r71CrD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pQ+daRg3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iBPpj1kH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/lAa9vYT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G/r71CrD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pQ+daRg3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iBPpj1kH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/lAa9vYT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D036F5BD14;
	Wed, 18 Feb 2026 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771423333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQvcQHeBVN1Sjt4RKru8eNwwKQ6oRk3H4MrisjTjyuw=;
	b=G/r71CrDKeb2UIug0a7hjNUM2ZClKzd4t/c8LVibzL9/Re1MmbNh/dum9TCCoM7LoB1cav
	leOLaEcQrHphBNFawoPO4QN2JGZooXM81C08Y0Jw0WLS0/KwAq7v587UJRf6aXHZQKrbQn
	80NYfxrOY9gJBc6P4Daeka49ibqamwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771423333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQvcQHeBVN1Sjt4RKru8eNwwKQ6oRk3H4MrisjTjyuw=;
	b=pQ+daRg3RZimWONnHfpBOB17GJy4Du+mB6QF0UXRawNL2HFWhJLvFBYkNhqyU8MdemAwMm
	amMg1M7EXSRQpWDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iBPpj1kH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/lAa9vYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771423329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQvcQHeBVN1Sjt4RKru8eNwwKQ6oRk3H4MrisjTjyuw=;
	b=iBPpj1kH3ndyXQTzuPZxWjp/SYoE3BWFUN4Z1ceImMBRNd6tnnGRa+dhd6itc6py7KlKfn
	LXoj+eZbpPXHiMsyYfmFE20qK+/gmuKLLRa95yKG3kZAwdrGnswTMqLK8bBFJCcwsfxVYT
	R2ljD+8p57CwdP0pz0BPus868CxR74w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771423329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQvcQHeBVN1Sjt4RKru8eNwwKQ6oRk3H4MrisjTjyuw=;
	b=/lAa9vYTrcgDeF+ZqItld/8AizKR6XAGGWN8YxrjM0niaEKf23IEhkMLgQ+lk2zVQaHrjk
	qnmTmOOsv/YhwGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F6E03EA65;
	Wed, 18 Feb 2026 14:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ibmfHWHGlWmTfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 14:02:09 +0000
Date: Wed, 18 Feb 2026 15:02:09 +0100
Message-ID: <87qzqirvz2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	edip@medip.dev,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
In-Reply-To: <CABtds-3xYN0OEOGfyaBL-N4KBjXZuMnKT+E3FsfoMwt8aReYsg@mail.gmail.com>
References: <CABtds-3xYN0OEOGfyaBL-N4KBjXZuMnKT+E3FsfoMwt8aReYsg@mail.gmail.com>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,starlabs.systems:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: D036F5BD14
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 18 Feb 2026 10:45:21 +0100,
Sean Rhodes wrote:
> 
> From 4929cc45c32e30361c7e35f0581c83a08fd29b88 Mon Sep 17 00:00:00 2001
> From: Sean Rhodes <sean@starlabs.systems>
> Date: Tue, 17 Feb 2026 11:53:41 +0000
> Subject: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
> 
> On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
> emit an audible pop when entering or leaving runtime suspend.
> 
> Mute the speaker output paths via snd_hda_gen_shutup_speakers() in the
> Realtek shutup callback before the codec is powered down.
> 
> This is enough to avoid the pop without special EAPD handling.
> 
> Test results:
> - runtime PM pop fixed
> - still reaches D3 (PCI 0000:00:1f.3 power_state=D3hot)
> - does not address pops on cold boot (G3 exit) or around display manager
>   start/shutdown
> 
> journalctl -k (boot):
> - snd_hda_codec_alc269 hdaudioC0D0: ALC233: picked fixup for PCI SSID
>   7017:2014
> - snd_hda_codec_alc269 hdaudioC0D0: autoconfig for ALC233: line_outs=1
>   (0x1b/0x0/0x0/0x0/0x0) type:speaker
> 
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Tested-by: Sean Rhodes <sean@starlabs.systems>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Unfortunately, the patch isn't applicable, likely your mailer folded
the line somehow unexpectedly.  You can try to do git-am on your repo
for checking it.

Please resubmit after you correctly set up the mail.


thanks,

Takashi
