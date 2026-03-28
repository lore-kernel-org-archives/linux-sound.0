Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270926D4CA
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774703854; cv=none; b=BwlAvJMnMQqUnNZKcuWiaqPkqbQZ/d1ngUP/5eVhaeClE+y4IYtTMhG5OmoX6P7jE+JtsRQmz6zw8/4yhSYWkArUgIwFTyJCZ8lWmRCJVhpLWz9Jyy2/JS+nPfthCayuA64HL9TTVZThsNeEcItufi/6xAGw686/SRFEONIn4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774703854; c=relaxed/simple;
	bh=VNIPFXB7ZgnF6ZORHZy7y5Z/tXyl0dxDBd7J/DzgMMY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXhlOGEOEMeWRAOuS5bEsu9iTxm8I69hpEwKMfi08MQKTg+5qCrpVFyAZOUiP4EmnqkjkuO8Et0e25N6GyUspC16AoPJ6g6exDE4tkZJvfLDbqXrlN8pcGVmVRwSAA4ssBUJ0i0bV3+DClaSGg2N4SQW2kM39DelenYMETYuG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NUE0Rexf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jdvtn2BB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NUE0Rexf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jdvtn2BB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NUE0Rexf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jdvtn2BB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NUE0Rexf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jdvtn2BB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6EBEA4D33C;
	Sat, 28 Mar 2026 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774703842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Aol3AUaMjtVXHggvZ9RDP7y+5okF3XbI56zXCGXwck=;
	b=NUE0RexfabZa4jRnmvL1tB6e2kbJSGZWZJJJyqPllwm9yHYm0cfDRNQ0dS4Yo5N9FrpdKl
	BxNd7yJU0WRESG0DdqF2S/DiMTGdTxPH5BcFY237+BwVL6SuirzB3NPp73jIF9waa3dPDx
	+/Bwb4dfYNq/eIADLJSzXsdFgoROOyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774703842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Aol3AUaMjtVXHggvZ9RDP7y+5okF3XbI56zXCGXwck=;
	b=Jdvtn2BBXFQgcmfE7wLs9BTS/MiZ9Vi0OFO4WnTJer9ezBzZh5AFqQhkXfmVtAUfg5IBKQ
	m3Pzs1doUeKgPMBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NUE0Rexf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jdvtn2BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774703842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Aol3AUaMjtVXHggvZ9RDP7y+5okF3XbI56zXCGXwck=;
	b=NUE0RexfabZa4jRnmvL1tB6e2kbJSGZWZJJJyqPllwm9yHYm0cfDRNQ0dS4Yo5N9FrpdKl
	BxNd7yJU0WRESG0DdqF2S/DiMTGdTxPH5BcFY237+BwVL6SuirzB3NPp73jIF9waa3dPDx
	+/Bwb4dfYNq/eIADLJSzXsdFgoROOyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774703842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Aol3AUaMjtVXHggvZ9RDP7y+5okF3XbI56zXCGXwck=;
	b=Jdvtn2BBXFQgcmfE7wLs9BTS/MiZ9Vi0OFO4WnTJer9ezBzZh5AFqQhkXfmVtAUfg5IBKQ
	m3Pzs1doUeKgPMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43E654A0A3;
	Sat, 28 Mar 2026 13:17:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zXMeDuLUx2l5DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 13:17:22 +0000
Date: Sat, 28 Mar 2026 14:17:21 +0100
Message-ID: <87wlywum8u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v4] ALSA: usb-audio: Add quirks for Arturia AF16Rig
In-Reply-To: <20260328112426.14816-1-willerz@gmail.com>
References: <20260328112426.14816-1-willerz@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,perex.cz:email,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6EBEA4D33C

On Sat, 28 Mar 2026 12:08:41 +0100,
Phil Willoughby wrote:
> 
> The AF16Rig supports 34 channels at 44.1k/48k, 18 channels at 88.2k/96k
> and 10 channels at 176.4k/192k.
> 
> This quirks is necessary because the automatic probing process we would
> otherwise use fails. The root cause of that is that the AF16Rig clock is
> not readable (its descriptor says that it is but the reads fail).
> 
> Except as described below, the values in the audio format quirks were
> copied from the USB descriptors of the device. The rate information is
> from the datasheet of the device. The clock is the internal clock of the
> AF16Rig.
> 
> Tested-By: Phil Willoughby <willerz@gmail.com>
> I have tested all the configurations enabled by this patch.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Phil Willoughby <willerz@gmail.com>

Thanks, applied to for-next branch now.

> ---
> Thank you all for your time and considered feedback.
> 
> There are two other clock sources the AF16Rig can use: an ADAT clock and
> a BNC word clock. In theory the correct support for those would be
> copies of these audioformat quirks with the clock changed to 43 (ADAT)
> or 44 (BNC). The reason that I did not include those quirks in this
> patch is that I cannot test them (because I do not have any other device
> that can act as an ADAT or BNC clock source).
> 
> I think that what I want to do is:
> 1. Macro-ise these quirks so the common stuff isn't repeated as much.
> This will be v5 of this patch.

This could be a good cleanup, yes.  You can submit as an incremental
cleanup.

> Then a separate patch where I:
> 2. Add the external clock quirks and locally test that it doesn't break
> anything for people who don't have the external clocks
> 3. Wrap the external clock quirks in #if 0 and a comment that they are
> disabled because they haven't been tested.
> 4. This will be marked signed-off but not tested-by me.

Hm, a better approach would be rather a creation of a mixer element to
switch the clock source, I suppose.  But it'll be more complex, of
course.


thanks,

Takashi
