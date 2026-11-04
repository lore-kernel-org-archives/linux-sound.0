Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777334;
	b=bT9SoXgz9RVYTfzHbQkX+QFD9zeqhNkiiKxjtvfHIF9FvroihHpYUAz6KYH37ykVZfb2
	 W2TaZJn2yG20gjgYtAqrNS5w1nfaS1fNVIjkcM6/wZHEn1VpnICVN2XuhbH4f3lL03sGU
	 uNlqjh08vqHUzhiNJVQgk34MTNcLlpqF2q+Zla6BmvFuf1XrVeTj1AFI55mDhhyjc3rcI
	 yOwqrlXd+4C2NTfevelslbERtpD2yRPxFSEQHeVwcGcuw3wgvuvrdN+ATrqY62IayKdNo
	 DkOoXbYlS0gsAON2NG5Mawc0p19vwzyJKPxWIK4ciqC2D4t71JK8ZOrDEOj2MoE2ycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777334;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=DifAUm92qM+tASb24JlttWM235jVAB1Tgm37VFxLCiA=;
	b=SetnkPvg0lzSf27/v4drqKLpQ8RDqvdR6LBjrIZmlQLHoabRr93+2hyvWx/6Q16vIrDG
	 Ne6bxNgxXKH6vXkwcGzAsbEYclkiBDD6aTmWu+EH4QkYSmBoUIKvkJP3WObjpa6CclADx
	 R+Chtjennf6OmvySuF+kv1F6QPQr7+KQVURRi5G73nh0BV6Jafj371Wzy2iSKzQCyaj8g
	 SJW2Lzgil/mhIrls0NvKpOyf/VX578+CoEdmazUQZI2qZYzHSHMMNTzl9j1ffEF+IScWw
	 DYexsyeuF2iXcCfmbij7gvLHhp6MtdYtWjQ/pqYHrCGLEgBPez9xRqJ6wzDs+46HyfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8tJilCo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3XMjYJvZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8tJilCo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3XMjYJvZ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCF606A326
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 07:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BCF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8tJilCo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3XMjYJvZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y8tJilCo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3XMjYJvZ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8936922012;
	Wed,  4 Nov 2026 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793777326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DifAUm92qM+tASb24JlttWM235jVAB1Tgm37VFxLCiA=;
	b=y8tJilCoWa9d6enJ1M1wgnNa8zLqSjgWiULbRXbDV7m4fK04uiH6M3EC1MthgVHHCGIeb2
	sKLkb43NVQqVkkyCG35Q9hAvWQs1kSvJbRJAYaQF/xDgfvillCWbtjW/72Cl5Y7hR+LZ8+
	XSqo6e12v4Q2OImE7hC8Xe7VbX6dRoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793777326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DifAUm92qM+tASb24JlttWM235jVAB1Tgm37VFxLCiA=;
	b=3XMjYJvZRnwC81aYxKJm9hNttW9i59u2F6PDYSAKO4SmELEqIZUbHo4eEiZv2DZNcaQ1HK
	POn6k6ZVpwgcXbCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793777326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DifAUm92qM+tASb24JlttWM235jVAB1Tgm37VFxLCiA=;
	b=y8tJilCoWa9d6enJ1M1wgnNa8zLqSjgWiULbRXbDV7m4fK04uiH6M3EC1MthgVHHCGIeb2
	sKLkb43NVQqVkkyCG35Q9hAvWQs1kSvJbRJAYaQF/xDgfvillCWbtjW/72Cl5Y7hR+LZ8+
	XSqo6e12v4Q2OImE7hC8Xe7VbX6dRoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793777326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DifAUm92qM+tASb24JlttWM235jVAB1Tgm37VFxLCiA=;
	b=3XMjYJvZRnwC81aYxKJm9hNttW9i59u2F6PDYSAKO4SmELEqIZUbHo4eEiZv2DZNcaQ1HK
	POn6k6ZVpwgcXbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36C44134A5;
	Wed,  4 Nov 2026 07:28:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lNTkA67e6mpaOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 07:28:46 +0000
Date: Wed, 04 Nov 2026 08:28:45 +0100
Message-ID: <87ld79ukb6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Vincent Cloutier <vincent@cloutier.co>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Allow HW_REFINE queries with mapped buffers
In-Reply-To: <20261104004113.546712-1-vincent.cloutier@icloud.com>
References: <874idyx9n6.wl-tiwai@suse.de>
	<20261104004113.546712-1-vincent.cloutier@icloud.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[icloud.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,icloud.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,cloutier.co,xenosoft.de,gmail.com,perex.cz,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Wed, 04 Nov 2026 01:40:25 +0100,
Vincent Cloutier wrote:
> 
> From: Vincent Cloutier <vincent@cloutier.co>
> 
> PulseAudio 16.1 queries supported formats after configuring and mapping
> a PCM buffer. Sharing HW_PARAMS' state checker with HW_REFINE causes
> these queries to fail with -EBADFD because a non-OSS stream has active
> buffer mappings. PulseAudio then fails to create its sinks and sources.
> 
> Make the mmap restriction optional in the shared state checker. Keep it
> for HW_PARAMS, which can reconfigure the mapped buffer, but skip it for
> HW_REFINE, which only refines the caller's constraint structure. Keep
> the stream-state checks and buffer access locking for native, compat
> and legacy refinement ioctls rather than bypassing their wrapper.
> Leave the accepted stream states unchanged.
> 
> On Librem 5, both L5 and Modem cards reproduce the failure for playback
> and capture: refinement succeeds before setup and after RW setup, but
> fails after MMAP setup in PREPARED state. With this change, all eight
> cases pass, PulseAudio starts normally and audible playback works.
> The reproducer does not start streams or transfer audio data.
> 
> Fixes: ad28d2f607d1 ("ALSA: pcm: Serialize and check HW_REFINE ioctls")
> Link: https://lore.kernel.org/linux-sound/41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de/
> Link: https://lore.kernel.org/linux-sound/874idyx9n6.wl-tiwai@suse.de/
> Assisted-by: OpenCode:GPT-6.1 Sol
> Signed-off-by: Vincent Cloutier <vincent@cloutier.co>

Applied now.  Thanks.


Takashi
