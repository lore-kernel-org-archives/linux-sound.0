Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD936E493
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275530; cv=none; b=bk4t9/6dd7nSctpJRH3ulfJAj8Q+WmWDaidaG0sBVffM5N3KtnWj/ifn2IO84S3HcxZS83d8kBdT+ml/AtriQfqGR74AFrkGoYj4V5cp4SjUCY/5fpa4CCH7BMm9J25c6Nf5R7l4WhoIdaCo1DEHo5WONb29CJxtQpWsWSPpy1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275530; c=relaxed/simple;
	bh=hNaug2oSmEVEb3ptvO5jG8/VZe2u2CA6uospsfWhOs4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6Ix1FAxIJXMQ4vpXWPLxW1r5uGDJ8YTgqEvhmBf+6jWrJ+QEh8Hc6xb3264E7kuHRG6nkQl6ForxKDDUvZ2lCDHWeG0iNDWrwPvrckiVbwRIgPb2MeyhF88auj8Deem3OTwmf8cVuUSw/OyKbbBB3PCJ5MiWLTgD4bbFL/mY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vcJ8DX/i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XCTrJhQv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vcJ8DX/i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XCTrJhQv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vcJ8DX/i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XCTrJhQv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vcJ8DX/i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XCTrJhQv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3B916B195;
	Wed, 20 May 2026 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779275526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XA5CgYml5nFDDExbgg1DVg9Qu2lYEDN94bfftjzWcLs=;
	b=vcJ8DX/i6aBuu3aNOVIhH6U6ljB0roHta/wY8SdLUHNFyCYKv9/yi0ZhBBB+XDeGJuQf7g
	tOCOGfLRFxQ+9CaVSTaj8IoKS+4x2rZuGJuRug5a1Q3dI4Ph/3j9YEEOo/KS6nLPA8SQOT
	ys5AlvMW+vExOtqBL7d/hND1O/osPPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779275526;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XA5CgYml5nFDDExbgg1DVg9Qu2lYEDN94bfftjzWcLs=;
	b=XCTrJhQv+gWISXdRwOSQ6B8Sqbav92MwQH5lGdTK/XsvS0ILAcn9GG9QS6jNGSCEPuo6gC
	yh8o2HA+p2hK8XCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779275526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XA5CgYml5nFDDExbgg1DVg9Qu2lYEDN94bfftjzWcLs=;
	b=vcJ8DX/i6aBuu3aNOVIhH6U6ljB0roHta/wY8SdLUHNFyCYKv9/yi0ZhBBB+XDeGJuQf7g
	tOCOGfLRFxQ+9CaVSTaj8IoKS+4x2rZuGJuRug5a1Q3dI4Ph/3j9YEEOo/KS6nLPA8SQOT
	ys5AlvMW+vExOtqBL7d/hND1O/osPPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779275526;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XA5CgYml5nFDDExbgg1DVg9Qu2lYEDN94bfftjzWcLs=;
	b=XCTrJhQv+gWISXdRwOSQ6B8Sqbav92MwQH5lGdTK/XsvS0ILAcn9GG9QS6jNGSCEPuo6gC
	yh8o2HA+p2hK8XCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA729593AA;
	Wed, 20 May 2026 11:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J9WRKAaXDWoxOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 May 2026 11:12:06 +0000
Date: Wed, 20 May 2026 13:12:02 +0200
Message-ID: <874ik2l4hp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	zerocling0077@gmail.com,
	2045gemini@gmail.com
Subject: Re: [PATCH v2] ALSA: seq: Serialize UMP output teardown with event_input
In-Reply-To: <20260520103249.3048345-1-rollkingzzc@gmail.com>
References: <20260520103249.3048345-1-rollkingzzc@gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,suse.de,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Level: 

On Wed, 20 May 2026 12:32:49 +0200,
Zhang Cen wrote:
> 
> seq_ump_process_event() borrows client->out_rfile.output without
> synchronizing with the first-open and last-close transition in
> seq_ump_client_open() and seq_ump_client_close().
> 
> The last output unuse can therefore drop opened[STR_OUT] to zero and
> release the rawmidi file while an in-flight event_input callback is still
> inside snd_rawmidi_kernel_write(). That leaves the rawmidi substream
> runtime exposed to teardown before the write path has taken its own
> buffer reference.
> 
> Add a per-client rwlock for the event_input-visible output file. Publish
> a newly opened output file under the write side, and hold the read side
> from the output lookup through snd_rawmidi_kernel_write(). The last
> output close copies and clears the visible output file under the write
> side, then drops the lock and releases the saved rawmidi file. Use
> IRQ-safe rwlock guards because event_input can also be reached from
> atomic sequencer delivery.
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
> path A label: event_input path         path B label: last unuse path
> 1. seq_ump_process_event() reads       1. seq_ump_client_close()
>    client->out_rfile.output.              drops opened[STR_OUT] to zero.
> 2. snd_rawmidi_kernel_write1()         2. snd_rawmidi_kernel_release()
>    has not yet pinned runtime.            closes the output file.
> 3. The writer continues using          3. close_substream() frees
>    the borrowed substream.                substream->runtime.
> 
> This keeps the output substream and runtime alive for the full
> event_input write while keeping rawmidi release outside the rwlock.
> 
> KASAN reproduced this as a slab-use-after-free in
> snd_rawmidi_kernel_write1(), with allocation through
> seq_ump_use()/snd_seq_port_connect() and free through
> seq_ump_unuse()/snd_seq_port_disconnect().
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> 
> Validation reproduced this kernel report:
> KASAN slab-use-after-free in snd_rawmidi_kernel_write1+0x9d/0x400
> RIP: 0033:0x7f5528af837f
> Read of size 8
> Call trace:
>   dump_stack_lvl+0x73/0xb0 (?:?)
>   print_report+0xd1/0x650 (?:?)
>   srso_alias_return_thunk+0x5/0xfbef5 (?:?)
>   __virt_addr_valid+0x1a7/0x340 (?:?)
>   kasan_complete_mode_report_info+0x64/0x200 (?:?)
>   kasan_report+0xf7/0x130 (?:?)
>   snd_rawmidi_kernel_write1+0x9d/0x400 (?:?)
>   __asan_load8+0x82/0xb0 (?:?)
>   update_stack_state+0x1ef/0x2d0 (?:?)
>   snd_rawmidi_kernel_write+0x1a/0x20 (?:?)
>   seq_ump_process_event+0xd4/0x120 (sound/core/seq/seq_ump_client.c:82)
>   __snd_seq_deliver_single_event+0x8a/0xe0 (?:?)
>   snd_seq_deliver_from_ump+0x2b2/0xd60 (?:?)
>   lock_acquire+0x14e/0x2e0 (?:?)
>   find_held_lock+0x31/0x90 (?:?)
>   snd_seq_port_use_ptr+0xa6/0xe0 (?:?)
>   __kasan_check_write+0x18/0x20 (?:?)
>   do_raw_read_unlock+0x32/0xa0 (?:?)
>   _raw_read_unlock+0x26/0x50 (?:?)
>   snd_seq_deliver_single_event+0x45c/0x4b0 (?:?)
>   snd_seq_deliver_event+0x10d/0x1b0 (?:?)
>   snd_seq_client_enqueue_event+0x192/0x240 (?:?)
>   snd_seq_write+0x2cd/0x450 (?:?)
>   apparmor_file_permission+0x20/0x30 (?:?)
>   security_file_permission+0x51/0x60 (?:?)
>   vfs_write+0x1ce/0x850 (?:?)
>   __fget_files+0x12b/0x220 (?:?)
>   lock_release+0xc8/0x2a0 (?:?)
>   __rcu_read_unlock+0x74/0x2d0 (?:?)
>   __fget_files+0x135/0x220 (?:?)
>   ksys_write+0x15a/0x180 (?:?)
>   rcu_is_watching+0x24/0x60 (?:?)
>   __x64_sys_write+0x46/0x60 (?:?)
>   x64_sys_call+0x7d/0x20d0 (?:?)
>   do_syscall_64+0xc1/0x360 (arch/x86/entry/syscall_64.c:87)
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)
> 
> Fixes: 81fd444aa371 ("ALSA: seq: Bind UMP device")
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
> v2:
> Use Takashi's suggested rwlock approach instead of the v1 ready/pending/wait-queue output gate.
> Make the rwlock acquisitions IRQ-safe because event_input can be reached from atomic sequencer delivery.
> Keep rawmidi release outside the rwlock by publishing and withdrawing a saved struct snd_rawmidi_file copy under the write lock.

Applied now.  Thanks.


Takashi
