Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7292D2488
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924246; cv=none; b=keGXY1CCgPKZCte87/C6WKmAx2yROqNcJ1Y8g4IHL8nINsdvfWSuafj/gJkwzK7athAxFXbIfgV+7n9Isszq/3+QfmxMt08wFiXc0L9Ropl/4XkXrqwDzTAUE/am1dqsaurYfTfbADrYkI4Ut34g62ei6vP4QKPNO/wRpHiOdco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924246; c=relaxed/simple;
	bh=EwwWIpFUFJVWlRkmse3gNj1M2ExKzycmyXRT5PoXBCU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nYXDuRIwT4CqeXYyvpusuGyXpfJb7wHDRXOarEh38YVvHMclulJppw3Gty98DqwtQ8E03/lRkHDs2Z0EMzXRPQKB4qwilbPyU0Y1XnyC1igriJtBX5LZ9ogd1ZtH9g1L/9/Sk0d56cy2IBLCQSHDEOxPlQR+VOzV8LvGJ2k3yDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YgPvSOQX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=04Kmu5XY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YgPvSOQX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=04Kmu5XY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YgPvSOQX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="04Kmu5XY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YgPvSOQX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="04Kmu5XY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40EC66A818;
	Sat, 11 Apr 2026 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775924243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nk9boQXLtmffkTTNxv4oJFsY8DVC7p0uSPCqaXaZ+RI=;
	b=YgPvSOQXATAWlp4/d9o3oeLhFsFD4pNMTSsyB3LDhsGg9quoiAETux3ErjrlfJ4i0NNEFT
	DAXddmfPTksF5rm0/e877yxdg+tHceHeoLX4zRxXOaUyUaXyGw0F7HaSyTgc/Z8noXKEwv
	6jkrD20YFn6N+Z181kUhH/0RQH7HcT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775924243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nk9boQXLtmffkTTNxv4oJFsY8DVC7p0uSPCqaXaZ+RI=;
	b=04Kmu5XYIF/isGMlJgeTScxj0lRL9W6WfSfoGKHGlVBhC3e+KCld7Zfc9mXe3XoFXU6XV2
	BWCzgREUPRdy3JDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YgPvSOQX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=04Kmu5XY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775924243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nk9boQXLtmffkTTNxv4oJFsY8DVC7p0uSPCqaXaZ+RI=;
	b=YgPvSOQXATAWlp4/d9o3oeLhFsFD4pNMTSsyB3LDhsGg9quoiAETux3ErjrlfJ4i0NNEFT
	DAXddmfPTksF5rm0/e877yxdg+tHceHeoLX4zRxXOaUyUaXyGw0F7HaSyTgc/Z8noXKEwv
	6jkrD20YFn6N+Z181kUhH/0RQH7HcT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775924243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nk9boQXLtmffkTTNxv4oJFsY8DVC7p0uSPCqaXaZ+RI=;
	b=04Kmu5XYIF/isGMlJgeTScxj0lRL9W6WfSfoGKHGlVBhC3e+KCld7Zfc9mXe3XoFXU6XV2
	BWCzgREUPRdy3JDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A7A24A450;
	Sat, 11 Apr 2026 16:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JsndABN02mnbKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 11 Apr 2026 16:17:23 +0000
Date: Sat, 11 Apr 2026 18:17:22 +0200
Message-ID: <87a4v9o4j1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel Monteiro Pires
 <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board reinitialization
In-Reply-To: <fe520e2a-5a95-4b57-a16b-a7a08a326ee7@gmail.com>
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
	<20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
	<87a4v9gbs1.wl-tiwai@suse.de>
	<fe520e2a-5a95-4b57-a16b-a7a08a326ee7@gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 40EC66A818

On Sat, 11 Apr 2026 16:33:54 +0200,
Cássio Gabriel Monteiro Pires wrote:
> 
> 
> 
> On 4/11/26 05:07, Takashi Iwai wrote:
> > On Sat, 11 Apr 2026 06:54:29 +0200,
> > Cássio Gabriel wrote:
> >> +/*
> >> + * Restore the SoundScape's MIDI control state after the firmware
> >> + * upload has made the host interface available again.
> >> + */
> >> +static int sscape_restore_midi_state(struct soundscape *sscape)
> >> +{
> >> +	int err = 1;
> >> +
> >> +	guard(spinlock_irqsave)(&sscape->lock);
> >> +	set_host_mode_unsafe(sscape->io_base);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL, 100);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL, 100);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, 100);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, 0, 100);
> >> +	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
> >> +	set_midi_mode_unsafe(sscape->io_base);
> >> +
> >> +	return err ? 0 : -EIO;
> > 
> > The above means it checks only the error of the last write.
> > Is it intentional?
> 
> It was meant to accumulate failures across the whole sequence, since
> host_write_ctrl_unsafe() returns 0/1 and the accumulator starts at 1.
> 
> So an earlier failed write is meant to keep the final result failed, not
> only the last write. But I agree the current form is kinda easy to misread.
> 
> I can rewrite to make the cumulative error handling explicit:
> 
> static int sscape_restore_midi_state(struct soundscape *sscape)
>   {
>         bool ok = true;
> 
>         guard(spinlock_irqsave)(&sscape->lock);
>         set_host_mode_unsafe(sscape->io_base);
> 
>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL, 100))
>                 ok = false;
>         if (!host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100))
>                 ok = false;
>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL, 100))
>                 ok = false;
>         if (!host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100))
>                 ok = false;
>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, 100))
>                 ok = false;
>         if (!host_write_ctrl_unsafe(sscape->io_base, 0, 100))
>                 ok = false;
>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100))
>                 ok = false;
> 
>         set_midi_mode_unsafe(sscape->io_base);
> 
>         return ok ? 0 : -EIO;
>   }
> 
> What you think?

Ah, I see, one of confusing parts is the definition of
host_write_*_unsafe() functions.  They return true for success, not an
error, while the callers use a variable "err".  IMO, it'd be better to
change them from int to bool and write the return condition in the
function comments, and use a different variable name like you
suggested. 

And, looking at the original sscape_midi_put(), it's rather like:

	change = host_write_ctrl_unsafe(s->io_base, CMD_SET_MIDI_VOL, 100)
		 && host_write_ctrl_unsafe(s->io_base, new_val, 100)
		 && host_write_ctrl_unsafe(s->io_base, CMD_XXX_MIDI_VOL, 100)
		 && host_write_ctrl_unsafe(s->io_base, new_val, 100);

which is more straightforward, and it aborts when a sequence fails.
(Though, strictly speaking, sscape_midi_put() should return an error
in this case, but it's a different topic.)
Maybe this form can be used instead, too.


thanks,

Takashi
