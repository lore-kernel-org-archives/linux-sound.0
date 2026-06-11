Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444822BDC2A
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162760; cv=none; b=XitztOpSXH4YVpeyEpzqwmLLHt8PJZT1vbIQLzavNc3Iy6RdbbeCiAqIHSaQFeF4VQt/eMQz/hHmIdyduSXH77yOpgUy4+PtEYA9zdkCdkU8scOp1ATq/XW2nOh56LaW2OmG5fErQAx3+uVp6NT18QcJbwBo8L/Kv5W6riVrAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162760; c=relaxed/simple;
	bh=UHnRgbNHCXB0nmiDEMkYibqiU7jxYxElGkYbQL+TXu8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LS19CxGsxG3DIxuTSnRFyxc+HK6ISEusqLEriyYgn8NCMBnOtYlUdhm1jQ0YqTzGdbCkmX1ZYI7XXl9aLKfS7OzCFA1fxP3nci+y1wNlyosO1U6KIJynMbu3hwXibcXwImaST+LwsUUmYLoXsX6oew2TGm8g2WKvYsYNkgQDjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yc2meDfN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k+WLsKVV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yc2meDfN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k+WLsKVV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yc2meDfN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k+WLsKVV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yc2meDfN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k+WLsKVV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D9656ACC7;
	Thu, 11 Jun 2026 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781162757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=30pX1E9RYeCcJQeD7ZO49JeBuurlNTP542TDsaubr+E=;
	b=Yc2meDfNFjbJzKra+dvgbMTqcuBuKcvBVgXximiv/2TT9+ca3HflBCzil+rSd4UwVrNjxg
	DY4je4jU/0ABUF85jzhQ6BJj2gTzvRwHC9U8ZfbtxHJQb6+iu3HWdHnJ7bHgf/DF2j7dVS
	6CAgvx4U06onGahk6I3W60QVvoSGi8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781162757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=30pX1E9RYeCcJQeD7ZO49JeBuurlNTP542TDsaubr+E=;
	b=k+WLsKVVio2UjdPDJeWysOJr6+EwZx+webV7eIS8IfH/+rU2VRqS75mvhCGsDRV4j2C3qj
	mR0kmie4phjaArDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781162757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=30pX1E9RYeCcJQeD7ZO49JeBuurlNTP542TDsaubr+E=;
	b=Yc2meDfNFjbJzKra+dvgbMTqcuBuKcvBVgXximiv/2TT9+ca3HflBCzil+rSd4UwVrNjxg
	DY4je4jU/0ABUF85jzhQ6BJj2gTzvRwHC9U8ZfbtxHJQb6+iu3HWdHnJ7bHgf/DF2j7dVS
	6CAgvx4U06onGahk6I3W60QVvoSGi8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781162757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=30pX1E9RYeCcJQeD7ZO49JeBuurlNTP542TDsaubr+E=;
	b=k+WLsKVVio2UjdPDJeWysOJr6+EwZx+webV7eIS8IfH/+rU2VRqS75mvhCGsDRV4j2C3qj
	mR0kmie4phjaArDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44648779A7;
	Thu, 11 Jun 2026 07:25:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JVaIDwVjKmpbLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Jun 2026 07:25:57 +0000
Date: Thu, 11 Jun 2026 09:25:56 +0200
Message-ID: <87pl1xk06z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: fix use-after-free of borrowed substream in snd-seq-midi
In-Reply-To: <20260610200336.33979-1-doruk@0sec.ai>
References: <20260610200336.33979-1-doruk@0sec.ai>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 10 Jun 2026 22:03:36 +0200,
Doruk Tan Ozturk wrote:
> 
> event_process_midi() borrows the rawmidi output substream via
> msynth->output_rfile.output and uses it through dump_midi() ->
> snd_rawmidi_kernel_write() -> snd_rawmidi_kernel_write1() without
> synchronizing against a concurrent port unsubscribe.
> 
> A concurrent UNSUBSCRIBE_PORT on the output connection runs the
> unuse callback midisynth_unuse() -> snd_rawmidi_kernel_release() ->
> close_substream() -> snd_rawmidi_runtime_free(), freeing
> substream->runtime while an in-flight event_input callback is still
> inside snd_rawmidi_kernel_write1(). The borrowed substream runtime is
> exposed to teardown before the write path takes its own buffer
> reference (snd_rawmidi_buffer_ref()), so the early derefs of
> substream->runtime / runtime->buffer read freed memory.
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
>   path A: event_input path                path B: last unuse path
>   1. event_process_midi() reads           1. midisynth_unuse() runs on the
>      msynth->output_rfile.output.            last UNSUBSCRIBE_PORT.
>   2. snd_rawmidi_kernel_write1() has      2. snd_rawmidi_kernel_release()
>      not yet pinned runtime.                 closes the output file.
>   3. The writer continues using           3. close_substream() frees
>      the borrowed substream.                 substream->runtime.
> 
> This is the snd-seq-midi sibling of the UMP-bridge race fixed by
> commit 60a1969fae62 ("ALSA: seq: Serialize UMP output teardown with
> event_input"); mirror its approach here.
> 
> Add a per-msynth rwlock for the event_input-visible output file.
> Publish a newly opened output file under the write side once it is
> fully set up, and hold the read side from the output lookup through
> snd_rawmidi_kernel_write() in event_process_midi(). The last unuse
> copies and clears the visible output file under the write side, then
> drops the lock and drains/releases the saved rawmidi file outside it
> (drain/release may sleep). Use IRQ-safe rwlock guards because
> event_input can be reached from atomic sequencer delivery.
> 
> Reproduced under KASAN: a single subscription to the midisynth output
> port (so the subscriber count oscillates 0<->1 and every unsubscribe
> frees the runtime via snd_rawmidi_kernel_release) is raced against a
> flood of events driving event_process_midi -> snd_rawmidi_kernel_write1.
> The narrow window (the runtime is read before snd_rawmidi_buffer_ref())
> was widened with an injected delay to land the race deterministically;
> the freed object is the kmalloc-192 snd_rawmidi_runtime. With this patch
> applied the same forced race shows no use-after-free.
> 
>   BUG: KASAN: slab-use-after-free in snd_rawmidi_kernel_write1+0x73e/0x800
>   Read of size 8 at addr ffff88800b04f310 by task seqmidi_uaf2/84
>   Call Trace:
>    snd_rawmidi_kernel_write1+0x73e/0x800
>    __dump_midi+0x70/0x100
>    dump_var_event+0x290/0x320
>    event_process_midi+0x1ff/0x310
>    snd_seq_deliver_single_event+0x1e6/0x670
>    snd_seq_deliver_event+0x323/0x5f0
>    snd_seq_client_enqueue_event.constprop.0+0x226/0x400
>    snd_seq_write+0x2f1/0x530
>    vfs_write+0x21e/0xd30
>    ksys_write+0x17c/0x1c0
>    do_syscall_64+0xf9/0x540
> 
>   Allocated by task 85:
>    open_substream+0xc7/0x7a0
>    rawmidi_open_priv+0x3df/0x660
>    snd_rawmidi_kernel_open+0x95/0x140
>    midisynth_use+0xda/0x1f0
>    check_and_subscribe_port+0x707/0xbd0
>    snd_seq_ioctl_subscribe_port+0x1f4/0x400
> 
>   Freed by task 85:
>    close_substream.part.0+0x1f9/0x790
>    rawmidi_release_priv+0x1b0/0x240
>    snd_rawmidi_kernel_release+0x2d/0xb0
>    __delete_and_unsubscribe_port+0x1b9/0x3c0
>    snd_seq_ioctl_unsubscribe_port+0x1ee/0x400
> 
>   The buggy address belongs to the object at ffff88800b04f300
>    which belongs to the cache kmalloc-192 of size 192
> 
> Found by 0sec.
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

There has been already a similar fix queued in sound.git tree for-next
branch:
ef7607ab1c8adc6258fb1b27d08e26aecdc18a58
    ALSA: seq: midi: Serialize output teardown with event_input

I believe this already addressed the bug.

Let me know if there is still anything missing.


thanks,

Takashi
