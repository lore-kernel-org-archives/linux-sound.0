Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83B5257459
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157766; cv=none; b=BWR+D3Va/eYuqRDUhBSdt/UV2Sgv1V+lWmWYjsrHMh/LVIE5vynKY8KDAU3wbGXlER9eGnnaRW3MopxJy8HlJwAGMsuTUm4xuhoMw4FUlK1ymFrrrP7eNOcf04VMP+rR1t6poHOvDYa75jkIaB4yuYJr2hJkqbwUV5xQtc3Y8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157766; c=relaxed/simple;
	bh=8FUw5eke/oeUR9RYwabPWoEKJbC3qbMh9uerDs9jFcQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFj0apI3JVKBI9jBuvNJLlLS6dhsakEfwUyX8iy9AXCSqEW7fhCeOHyZJVnqZDye7oy7rLsYpGluZn3kog26SWkdfv1BfncclyLclhjxWPH8eJudszBiGSbTYVsObJqZT4g0bZOlRbc+FNDAsF5aOO4KGlOFlapFZVIKUoRFLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z9lnLBN4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BhAEIBXt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z9lnLBN4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BhAEIBXt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z9lnLBN4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BhAEIBXt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z9lnLBN4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BhAEIBXt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8D421F7D3;
	Thu, 14 Aug 2025 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755157756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7IEGOyv0Ay01GV4iGpts4z6w/Mw5kSlKr+ymRFXkTA=;
	b=Z9lnLBN4U7E7fOlZK2NeLFrxbfsm1PB1qS5ftQEYb63zraB2mNUCCFKSg2tDzoGBNwKG8F
	5z+3+Bn2lejKPNUOEMxswbXx2wVtjXlgGN0jrEbS+9aurTFzt6bTurgDLkv5d34UesCKlz
	SJyyOZoZI3NsB/9gVCABBOr8o70RNjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755157756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7IEGOyv0Ay01GV4iGpts4z6w/Mw5kSlKr+ymRFXkTA=;
	b=BhAEIBXtiI79kekhZ4ZwqBKpGzclvB3ZxF59SmlZnaBlHqssIOh5aco0IPRuz/vybDghTu
	l0QBVmRkJOHtqaBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755157756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7IEGOyv0Ay01GV4iGpts4z6w/Mw5kSlKr+ymRFXkTA=;
	b=Z9lnLBN4U7E7fOlZK2NeLFrxbfsm1PB1qS5ftQEYb63zraB2mNUCCFKSg2tDzoGBNwKG8F
	5z+3+Bn2lejKPNUOEMxswbXx2wVtjXlgGN0jrEbS+9aurTFzt6bTurgDLkv5d34UesCKlz
	SJyyOZoZI3NsB/9gVCABBOr8o70RNjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755157756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7IEGOyv0Ay01GV4iGpts4z6w/Mw5kSlKr+ymRFXkTA=;
	b=BhAEIBXtiI79kekhZ4ZwqBKpGzclvB3ZxF59SmlZnaBlHqssIOh5aco0IPRuz/vybDghTu
	l0QBVmRkJOHtqaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8881A136AE;
	Thu, 14 Aug 2025 07:49:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xIXQH/yUnWjGBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Aug 2025 07:49:16 +0000
Date: Thu, 14 Aug 2025 09:49:16 +0200
Message-ID: <87qzxeuyv7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [bug report] ALSA: seq: oss/midi: Cleanup with guard and auto-cleanup
In-Reply-To: <aJ2TXWDWOKGSs1Uq@stanley.mountain>
References: <aJ2TXWDWOKGSs1Uq@stanley.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Thu, 14 Aug 2025 09:42:21 +0200,
Dan Carpenter wrote:
> 
> Hello Takashi Iwai,
> 
> Commit 8b887676dc1f ("ALSA: seq: oss/midi: Cleanup with guard and
> auto-cleanup") from Aug 11, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	sound/core/seq/oss/seq_oss_midi.c:196 snd_seq_oss_midi_check_new_port()
> 	warn: dereferencing no_free_ptr: 'mdev'
> 
> sound/core/seq/oss/seq_oss_midi.c
>     187         if (i >= max_midi_devs) {
>     188                 if (max_midi_devs >= SNDRV_SEQ_OSS_MAX_MIDI_DEVS) {
>     189                         snd_midi_event_free(mdev->coder);
>     190                         kfree(no_free_ptr(mdev));
>     191                         return -ENOMEM;
>     192                 }
>     193                 max_midi_devs++;
>     194         }
>     195         mdev->seq_device = i;
> --> 196         midi_devs[mdev->seq_device] = no_free_ptr(mdev);
>                           ^^^^^^^^^^^^^^^^                ^^^^
> The no_free_ptr() macro sets mdev to NULL but it's dereferenced on the
> left hand side.
> 
>     197 
>     198         return 0;
>     199 }

Yes, a known issue, the patch series have been already dropped from
today's tree (and the fix was folded for the next time).


thanks,

Takashi
