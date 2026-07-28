Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185723033EB
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256243; cv=none; b=f4Aqmjs0QMqe0VqbRemJ/EFC87BTflS7nvnwwU35A1PoW66ls9HSnbcNKdQZGy4D0Dl+ymmOJ1AUOb1s0Lq2t7+bvncd82WfhR/V/nM0fQl0R6UaEkIQJyUwX3lKXJLhxb72XfO5jPrx2cEz6gQ2lf4IdHfDD5IHTxRi0Kh3taE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256243; c=relaxed/simple;
	bh=9bGX+Rxumorsdpusy0tLyft7gJ2g13gkjUja3qAdIgc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6k1v26zxcJMFsNZnVXYAl55cwFAFUr7RycisWgenJ47t3J9CVH7wA96+S0H/Tju+Tn2L9/bmTytQjDwDAfbHzVIGybzRV/EvZ3pNKB95qW5cWu0unvvBbIKgS5lLu04AXEGs5zs3+vs4Nswg7XKQIE0FeafI3lFPMrhqhHLCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CKcK3D30; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6I56GXcx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lO4XSqJ6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V1nao47S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CKcK3D30";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6I56GXcx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lO4XSqJ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V1nao47S"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A4C17C3D3;
	Tue, 28 Jul 2026 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785256236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOWrygzcHzM0lRHmvdFiUHQjwJ3Bv1sqIRxUZwlF7Jk=;
	b=CKcK3D30vb5M/MGFNcuMqhOFc++I6ph7y2zs2v7HKRYvVRmQTTsyDt8wOugeegqYZzXq1o
	w7dsIBR1uDw20pJyC2f0M/3zGjGa5sxuaXOWFKTikiCTw3XjO2zpGPlECqabVb+qZ2F4Nn
	2QriHhDAPJI0mS3X3XVdaTqEEoVwJ+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785256236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOWrygzcHzM0lRHmvdFiUHQjwJ3Bv1sqIRxUZwlF7Jk=;
	b=6I56GXcx6jcwOh7loKEjmNy9t4eeekRFrjGI3StgLPrTfYrLTn4PhTlrl0bNRNP+0dSosU
	Paow/voen6lonXCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785256232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOWrygzcHzM0lRHmvdFiUHQjwJ3Bv1sqIRxUZwlF7Jk=;
	b=lO4XSqJ611zFYl2wP/RZMFjDDoRWX9yjYGp+YW+UGq4DaHJcJUWWq4Db/PI9QQ6KM2tKdm
	Lbj4kTO3SYM8DJ0KIL/gM+NvWyVDZOc8yNn26Hb4CJ+2pUEXABvDzCdABetA9jWsMTFvkh
	7EGUy/5YOvSaoC0QGiL7aDsHz/d2e10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785256232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOWrygzcHzM0lRHmvdFiUHQjwJ3Bv1sqIRxUZwlF7Jk=;
	b=V1nao47SSiECqR47qrmHKzdELcrUT89hsToOcFKohk+pQRoSSlhs+NfNaF0FHz0BB5A+iV
	gBKiI3ICcSpiyvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8135779B1;
	Tue, 28 Jul 2026 16:30:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NMr9MifZaGp8DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 16:30:31 +0000
Date: Tue, 28 Jul 2026 18:30:31 +0200
Message-ID: <8733x36pqw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Norbert Szetei <norbert@doyensec.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: pcm: wake linked drain waiters on unlink
In-Reply-To: <A0705100-D10B-4286-9980-0142ABEEAD51@doyensec.com>
References: <A0705100-D10B-4286-9980-0142ABEEAD51@doyensec.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 28 Jul 2026 14:50:01 +0200,
Norbert Szetei wrote:
> 
> snd_pcm_drain() on a linked stream parks an on-stack wait entry on the
> drained peer's runtime->sleep, and after schedule_timeout() removes it
> only if that peer is still found in the caller's group.  If group
> membership changes during the wait and the sleep ends by signal or
> timeout (so autoremove_wake_function() does not run), finish_wait() is
> skipped and snd_pcm_drain() returns with the entry still queued on that
> stream's sleep list; a later wake_up() then walks a freed stack frame.
> This is reachable by unlinking either the drained or the draining stream.
> 
> Unlike the close path (snd_pcm_drop() -> snd_pcm_post_stop()),
> snd_pcm_unlink() never wakes the sleep queues.  Wake every group member
> under the group lock before the membership change, so a linked drainer is
> released and drops its entry while the streams are still grouped.
> 
> The window was opened when snd_pcm_link_rwsem stopped being held across
> the wait and the removal became conditional on group membership (see
> Fixes). The later switch to finish_wait() kept that conditional removal,
> so the signal/timeout case remained.
> 
> Fixes: f57f3df03a8e ("ALSA: pcm: More fine-grained PCM link locking")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>

Applied now.  Thanks.


Takashi
