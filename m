Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FC36E47E
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046626; cv=none; b=Re5t3RaBtzyeAKjdDB/BuvlGGgHO1OmDdm91eVyPuuoO0a/tQkC4uFiKDoHhNc9zUCCxX+4UcYh5zbc9DYB7pdP8ef4gvfamGNWrrFOhuTrg3DLs38K7/X9UIt+jctsbnS5sYALTavMtHL9bx05aJeJowa8UXuiRO2ZwaJ0l5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046626; c=relaxed/simple;
	bh=tcQZvO4yhp8eYUv4l2x7TIWlFOmKL4T9ZjaB5/V9S1o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVZwvMcyH6eQYe+qjW6BCO9EA9mkW3Mawr8xQeYa33ig2QKhOdOWlnnPjrH7rNprHhnbqvSWg7N4aDAP9MpHFOUgjkkVJ9onctI4tc7gdEjTHRC1pu85Atbf+aCHwz+aPdkAuEhfHlbMN3asHrHkXEqBso+GeeZRZ9xt9ShM008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MbSKjQFc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uBVCHNKZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MbSKjQFc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uBVCHNKZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MbSKjQFc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uBVCHNKZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MbSKjQFc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uBVCHNKZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 19DB85BF00;
	Mon,  9 Mar 2026 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7gi/J5qg4+4o8nQ8ZPqN5d2FaaIheDkiHJ270BzgWxQ=;
	b=MbSKjQFcfXZD/pq6OhCPIBe/3QIqmFfeoiX3WYK8CFB69QlweCtqQEzlNChFFMXR/6QGqT
	4bpW88jbcISEZafHN5JqlFPVun0Q5z2kIf+vyGTWl9jcdfWDaCTIKISqHHDiFjmYsQuV76
	jOKbZ6yR68vfvgeSa54DQsrnK8TgbnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7gi/J5qg4+4o8nQ8ZPqN5d2FaaIheDkiHJ270BzgWxQ=;
	b=uBVCHNKZSrEHqABWblKmiFfKvEvxAq7tb7Ja8I4NDTuuIRsJczsFJcFoJt4o3iCmLyb0qJ
	LF5F9ac1Gmo1wLBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7gi/J5qg4+4o8nQ8ZPqN5d2FaaIheDkiHJ270BzgWxQ=;
	b=MbSKjQFcfXZD/pq6OhCPIBe/3QIqmFfeoiX3WYK8CFB69QlweCtqQEzlNChFFMXR/6QGqT
	4bpW88jbcISEZafHN5JqlFPVun0Q5z2kIf+vyGTWl9jcdfWDaCTIKISqHHDiFjmYsQuV76
	jOKbZ6yR68vfvgeSa54DQsrnK8TgbnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7gi/J5qg4+4o8nQ8ZPqN5d2FaaIheDkiHJ270BzgWxQ=;
	b=uBVCHNKZSrEHqABWblKmiFfKvEvxAq7tb7Ja8I4NDTuuIRsJczsFJcFoJt4o3iCmLyb0qJ
	LF5F9ac1Gmo1wLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEE2E3EDFA;
	Mon,  9 Mar 2026 08:57:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +vY2LlyLrmnuRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 08:57:00 +0000
Date: Mon, 09 Mar 2026 09:57:00 +0100
Message-ID: <87qzpttm77.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mehul Rao <mehulrao@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()
In-Reply-To: <20260305193508.311096-1-mehulrao@gmail.com>
References: <20260305193508.311096-1-mehulrao@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 05 Mar 2026 20:35:07 +0100,
Mehul Rao wrote:
> 
> In the drain loop, the local variable 'runtime' is reassigned to a
> linked stream's runtime (runtime = s->runtime at line 2157).  After
> releasing the stream lock at line 2169, the code accesses
> runtime->no_period_wakeup, runtime->rate, and runtime->buffer_size
> (lines 2170-2178) ― all referencing the linked stream's runtime without
> any lock or refcount protecting its lifetime.
> 
> A concurrent close() on the linked stream's fd triggers
> snd_pcm_release_substream() → snd_pcm_drop() → pcm_release_private()
> → snd_pcm_unlink() → snd_pcm_detach_substream() → kfree(runtime).
> No synchronization prevents kfree(runtime) from completing while the
> drain path dereferences the stale pointer.
> 
> Fix by caching the needed runtime fields (no_period_wakeup, rate,
> buffer_size) into local variables while still holding the stream lock,
> and using the cached values after the lock is released.
> 
> Fixes: f2b3614cefb6 ("ALSA: PCM - Don't check DMA time-out too shortly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mehul Rao <mehulrao@gmail.com>

Do you have the actual crash by fuzzer or such?  Or is it only
theoretical?

In anyway, I applied now as the fix looks fine and safe.


thanks,

Takashi
