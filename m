Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C86B75809
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878093; cv=none; b=dKKNf2fTkU1S/O93sNka5K/D2exhDuG7RxOfyUY5eVn5z71WBwoqnV0mWjnlR7e9sIjy+CEeMmbb2zB+GnJqnWUNrcn3p0XLGdLkxOt0bYvyGayj5PxwzGemZqogNraD/2BhO3msYQPEsiI2eQVj3UNZ77HIc0kOZZQbcfPE7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878093; c=relaxed/simple;
	bh=WXpXVZg6sLLH/YJKNS9iadFxrsCKPzmVkzdsZf8pjwU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6EPApQ2R4xT2SlrDiZIHj0w0sP3q9MJlP1xIeY9QPRsBPEA9EcDOs5yH9KP/AzSeLL2VcmpSWKDWpZhCTxHJ84YPDQIfl7Yj0KTjDvDtQpQTFM+1BVWtvUzl+ijwAFPwK3KzKoTH5VIRoicn8ntkB8GS9yuWz4RNCpF9r7lE+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S0N0QAuk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HqUX1UlT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S0N0QAuk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HqUX1UlT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S0N0QAuk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HqUX1UlT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S0N0QAuk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HqUX1UlT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6800667064;
	Wed, 27 May 2026 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779878089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdShXZHcBG/jUzzvD7PmLiULIWCW5VaNZZ9nMLu+VDE=;
	b=S0N0QAuk+O1tN76VCPLb/Plp8o2mQohCEIEaCsDS15QhquaO7J4R7nsHg2KpeDeqcmmOwn
	Dz331G+PwLL3gVZNNBhcVHwsV6BEqjmPPHqnZDQcUXko4MAEkfKnilKywqQc2WF4GndW0G
	3iQQSaBdKoIID9LIcsGRVDPQ3w7ii20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779878089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdShXZHcBG/jUzzvD7PmLiULIWCW5VaNZZ9nMLu+VDE=;
	b=HqUX1UlTNObpTmGkeTqZikMdnsE/mCcoZI9k9YwkRTo94tEolJBAxpeZDQwOyUgJydDB5F
	Up3rseC9NSGyoEBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S0N0QAuk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HqUX1UlT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779878089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdShXZHcBG/jUzzvD7PmLiULIWCW5VaNZZ9nMLu+VDE=;
	b=S0N0QAuk+O1tN76VCPLb/Plp8o2mQohCEIEaCsDS15QhquaO7J4R7nsHg2KpeDeqcmmOwn
	Dz331G+PwLL3gVZNNBhcVHwsV6BEqjmPPHqnZDQcUXko4MAEkfKnilKywqQc2WF4GndW0G
	3iQQSaBdKoIID9LIcsGRVDPQ3w7ii20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779878089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdShXZHcBG/jUzzvD7PmLiULIWCW5VaNZZ9nMLu+VDE=;
	b=HqUX1UlTNObpTmGkeTqZikMdnsE/mCcoZI9k9YwkRTo94tEolJBAxpeZDQwOyUgJydDB5F
	Up3rseC9NSGyoEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D96B5A7AD;
	Wed, 27 May 2026 10:34:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fHt6CcnIFmrpcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 10:34:49 +0000
Date: Wed, 27 May 2026 12:34:48 +0200
Message-ID: <87ecixw37b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com
Subject: Re: [PATCH v2] ALSA: seq: midi: Serialize output teardown with event_input
In-Reply-To: <20260527062948.3614025-1-rollkingzzc@gmail.com>
References: <20260527062948.3614025-1-rollkingzzc@gmail.com>
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
X-Rspamd-Queue-Id: 6800667064
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.de,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Wed, 27 May 2026 08:29:48 +0200,
Zhang Cen wrote:
> 
> event_process_midi() borrows msynth->output_rfile.output and then
> passes the substream to dump_midi() and snd_rawmidi_kernel_write()
> without synchronizing with the output open/close transition.
> midisynth_use() also publishes output_rfile before
> snd_rawmidi_output_params() has finished.
> 
> The last midisynth_unuse() can therefore release the same rawmidi file
> and free substream->runtime before snd_rawmidi_kernel_write1() takes
> its runtime buffer reference. That leaves the event_input path using a
> stale substream or runtime and can end in a NULL-deref or use-after-free.
> 
> Fix this with two pieces of synchronization. Keep a short IRQ-safe
> spinlock only for publishing or clearing output_rfile and for pairing
> the output snapshot with an snd_use_lock_t reference. Once
> event_process_midi() has taken that in-flight reference, it drops the
> spinlock before calling snd_seq_dump_var_event(), dump_midi(), or
> snd_rawmidi_kernel_write(). midisynth_unuse() now detaches the visible
> rawmidi file under the same spinlock, waits for the in-flight writers
> to drain, and only then drains and releases the saved file.
> midisynth_use() likewise opens into a local snd_rawmidi_file and
> publishes it only after snd_rawmidi_output_params() succeeds.
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
> event_input path:                     last unuse path:
> 1. event_process_midi() snapshots    1. midisynth_unuse() starts
>    output_rfile.output.                 tearing down output_rfile.
> 2. dump_midi() reaches               2. snd_rawmidi_kernel_release()
>    snd_rawmidi_kernel_write()           closes the output file.
>    before runtime is pinned.         3. close_substream() frees
> 3. The callback keeps using             substream->runtime.
>    the borrowed substream.
> 
> Validation reproduced this kernel report:
> KASAN null-ptr-deref in snd_rawmidi_kernel_write1+0x56/0x360
> RIP: 0033:0x7fde7dd0837f
> RIP: 0010:snd_rawmidi_kernel_write1+0x56/0x360
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
