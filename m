Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D837DEAD;
	Wed, 12 Aug 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539691; cv=none; b=CBa78R3bs3A3PWaV1OHdK28fcqSWwcwjF6eKGmKYOg8UxmH9UUSANLgwFMKAYNryCcuiEP6IukDG0jtMOwwyoI2NwlXqN0xp1QdJVPSvSqQDNMTwLXCBpPB7/jIWGX9X6GJM/x5P5OKmJPWcmN7HP8ADOyR0HImfxC56y+OLQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539691; c=relaxed/simple;
	bh=tbt7BdbbvhRZPwnCsgFbgC8/QB/lMwXULL9MNJmtdJ8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GObvXHI9kot67njq7nEw2fMobni08tDhisj+URg/ygWUgip7qFFWrWP4NEMqdhvJlJqWWhocFi4ScoDiVthDkPrwxsKIdKs6n7KS+qFDPTbZli9OZ/dFrImRCzCUCGz3mClHoMBvVUiof9WWBGFMPgC29Nvw5V80P7kJFWqnXwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N7E8xcin; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5DOjmmgp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N5KpMF1M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9c9DCFoa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N7E8xcin";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5DOjmmgp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N5KpMF1M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9c9DCFoa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B4CF822ED;
	Wed, 12 Aug 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786539683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lbl/CeMTx6pJigq3Vun4RMqP3E9LLG9i40VJpA5L148=;
	b=N7E8xcinPbqxlhkXyzHnGb95w8GP1NDD9bp8bsT4YfnBCfNwKLRjnVOAtSSP8cPZgtFBUR
	hTFksHtXFB3CQohwqkvtdTErHPndjF2Zb4zMdfuJCmLgB3dgnbhQ5fCyuJF4MsKubHDy7z
	stSLurJQBA6Cu06XTgUPELEYdAFGkk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786539683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lbl/CeMTx6pJigq3Vun4RMqP3E9LLG9i40VJpA5L148=;
	b=5DOjmmgpWnjQfhbohNv5d1k4+u7gctWBBjKZWW7btujl1Pc3TGH3A6R0vkJMvu1Q93XlFJ
	kKs6aryodZMu0kAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786539679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lbl/CeMTx6pJigq3Vun4RMqP3E9LLG9i40VJpA5L148=;
	b=N5KpMF1MDIj4XQvZrB2p9/1XTionFrR1OZN679/rVePi7rOjlPgRAeGJncFAeGksQBqv0z
	V9cDa5cYAyHTF9LSN/bHRxfexYKIBpKtUuaIhD078HqqNPYhCj165glzYsSjvjsnSBBypF
	Ay4A/KhHIbV4LAh8Hawj9Pq36M450tw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786539679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lbl/CeMTx6pJigq3Vun4RMqP3E9LLG9i40VJpA5L148=;
	b=9c9DCFoaGaq077B3WFLhttPY/OdAWyqIDUfe4BMt/4yu09gLjiDGcYDgjuNZbdQEJrxHGa
	mzyAWa+/pB2uGsDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82D34779B1;
	Wed, 12 Aug 2026 13:01:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0m1TH59ufGqeSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 13:01:19 +0000
Date: Wed, 12 Aug 2026 15:01:19 +0200
Message-ID: <87se4jze5c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Restore the delivery error code in the bounce event
In-Reply-To: <20260812113236.3941391-1-sammiee5311@gmail.com>
References: <20260812113236.3941391-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 12 Aug 2026 13:32:36 +0200,
HyeongJun An wrote:
> 
> Commit efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in
> bounce_error_event()") moved the data.quote.value assignment into the
> kernel client branch.  A user client that sets SNDRV_SEQ_FILTER_BOUNCE
> used to get the delivery error code there.  Now it gets none, and
> nothing else reports it, because a queued event's write() has already
> returned success by the time delivery fails.
> 
> Send struct snd_seq_event_bounce instead, the error code followed by the
> original event record, which is what the UAPI header has described all
> along.  Store the negative errno.  The kernel client branch negates it
> only because data.quote.value is an unsigned short.
> 
> The payload grows from 28 to 32 bytes.  The snd_seq_read() rounds a
> variable-length payload up to a multiple of the event size, so a legacy
> client now needs an 84 byte buffer instead of 56.  That is what any
> event carrying 29 payload bytes has always needed.  A UMP client reads
> 64 bytes either way.
> 
> Drop the stale promise to copy the external data after the event record
> as well.  That was never implemented, and bounce_error_event() runs with
> atomic set from the timer interrupt.
> 
> Fixes: efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in bounce_error_event()")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
> Notes for the reviewer, not part of the change.
> 
> A UMP event does not fit the payload.  A struct snd_seq_ump_event is 32
> bytes while quoted.event is 28, so ump[3] is dropped while
> SNDRV_SEQ_EVENT_UMP stays set in the copy.  That is already true today,
> but this locks it into the UAPI.  Clear the flag, skip bouncing UMP
> events, or a different layout?  I did not want to guess.
> 
> The err field carries the negative errno.  Nothing has ever produced or
> consumed this struct, so the sign is being chosen here for the first
> time.  Say if you want the positive value instead.
> 
> I could not check whether any user space sets SNDRV_SEQ_FILTER_BOUNCE,
> or what buffer size it reads with.

Thanks, now I see what you meant previously.

I belive that struct snd_seq_event_bounce is dead, not actually used.
So, it's better to stick with the existing snd_seq_ev_quote even
though we lose the error code in user-space delivery.  The definition
of snd_seq_event_bounce can be dropped for avoiding confusion in
future, too.


Takashi
