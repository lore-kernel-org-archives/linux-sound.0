Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5E327BE0
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569093; cv=none; b=MJ1CF1gTHRm+56RZAxZUrzXKgdWf4x0V/8Dd6LIBaMnJo7QIAwKevBPGFge53on07ju+fIteOdwT+Spl0hbaVFrOIXh8HrlL1wJfx+FfP2N8kRFofXMmFr3Eg1v01YVpGIUtwBXnWL7nryCMeBXDJ4fNchRWp2eWCsNYu0VhyBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569093; c=relaxed/simple;
	bh=HJPKKdLwUvhEKWcBVKAo0MhYdNoXtn5q26gqLsHeBAo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fkp7I2OCq3zwsT8Jf+39T1uczZdqhoypUmoFW9s050/gthh9/Wg9vTT+FV6VRoFB7t9ubOT4vBxE4QJDZl55pZklOsvqXh8TlbJzqgQrrE2p3Kq8/eH1LGdVyxQY9SP9B/EFv6QASDahN3GFKl0jJ9vp11iZqaa+Y7TSDtSfwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b6T2YFo6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WlxVuMHV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XzScF7Ys; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JgXT6vFH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b6T2YFo6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WlxVuMHV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XzScF7Ys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgXT6vFH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 986D42192D;
	Wed, 19 Nov 2025 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763569084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlJnOEWckZzCLwLuO3xPx2kxKEAIHOw//Quekzt77wM=;
	b=b6T2YFo6FzZyRGzOk9DBYaQBfXxXOk1tCwAI6pGh3lS0CbZghDf51ruNyeyz7ZvasyGWLI
	8u6bfnWhmhc1nHC7kBg05zPiXG5F6+X59jw0K5ozoGfNlmHkIO9alW+Eu78cfsOWUnieEL
	Gexk9uaVik4ZWdE5AWJ0EQc5SE4A6pQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763569084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlJnOEWckZzCLwLuO3xPx2kxKEAIHOw//Quekzt77wM=;
	b=WlxVuMHVGjfup+UrY2UrP0/ouz0PeYVHDc8YxLqbpx8Yrl3LwdF3Y4sJ5U9m6NIxzRWuKr
	Y2GQPI6+pmMRXwDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XzScF7Ys;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JgXT6vFH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763569079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlJnOEWckZzCLwLuO3xPx2kxKEAIHOw//Quekzt77wM=;
	b=XzScF7Yst0Pi2+kZ1ldCo83a8f24oCVVBGf9rSyrR7+KvfvORJW54LQRupTB/guWRm/YQG
	aZCxZDE45JxnCbNmCPrWN2IxhtLYuDSV/IwM7ZLTOVSK35B344wspxrw/j6qVBvAxK99TT
	BXg+fjPEXM/3Iv2kqpaqJkXr7OgsmZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763569079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlJnOEWckZzCLwLuO3xPx2kxKEAIHOw//Quekzt77wM=;
	b=JgXT6vFH6CXJpMVB1it9lWfdsW+rG0932HoryPHJyICNJbERBAbFNdtECHgKwJr7QLgp1q
	TWIZOdj0fjoB57Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A2F83EA62;
	Wed, 19 Nov 2025 16:17:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hr2yFLftHWkVYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 16:17:59 +0000
Date: Wed, 19 Nov 2025 17:17:58 +0100
Message-ID: <87346ac7yh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: Replace deprecated strcpy with strscpy_pad in setup_patt_bufs
In-Reply-To: <20251119135217.233084-1-thorsten.blum@linux.dev>
References: <20251119135217.233084-1-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 986D42192D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[2a07:de40:b281:104:10:150:64:97:server fail,2a07:de40:b281:106:10:150:64:167:query timed out];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux.dev:email]
X-Spam-Score: -2.01

On Wed, 19 Nov 2025 14:52:17 +0100,
Thorsten Blum wrote:
> 
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy_pad(), and use kmalloc() instead of kzalloc()
> because strscpy_pad() zero-pads the destination buffer and therefore
> avoids writing to it twice.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied to for-next branch now.  Thanks.


Takashi
