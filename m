Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149443CC31A
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535527; cv=none; b=Vb7mzadygXkxNGdYjLopSxnIc/mOJxlVwZhTdQgbb0/+IO0tfwdNk1hSGoF7tY+4gLWAy07MxzUzLOEoIyP8sHqJwBAcSEKMwEOzf/ZoQw9SmKWxb+ptG6aNsVvAQiSXPIYj+MH7jZGFP5EpGUeoFHvXsLsCIRfi+HeXCB8oj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535527; c=relaxed/simple;
	bh=SzjOUuey5WOR4cvDvOhQp7jIruxgX0gakz19/huDjBU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evCGQaFjhI3hy+PfHgLwKCzTJf6wOAwVhtvEa0/vxolkQXPiMqCmhvUzurift14AZik4vug3IeA0B34c5LCc2u+ieCNqhHRkqA4d6pOKZSLPEpf8i+ZDuBiBOkpNtw6lqxzEbw73kL+Z7+yYOkUag3s1vRvyu0LQEhMm/s97A/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l0W0iWJZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GANsjq15; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l0W0iWJZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GANsjq15; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l0W0iWJZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GANsjq15";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l0W0iWJZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GANsjq15"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14C213E14;
	Mon, 20 Jul 2026 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784535524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8yE5Sktz4N2QqyMPswqMVa4jW3L+8cDxQAChTSuTiRk=;
	b=l0W0iWJZ1VXH+dWnJzg7ZrCpkFkTYfRnYvr9JmRv/0rS0EC2qXzj+V3hbRqNtV4P4QNyhm
	6gdM1+LWaDAObsca32glhWBHXW56MLwD5SCa6EMXgRI1E6oycjrwl5uMiT2+NHqNE3V9w9
	cP5E12ICphOEoUqdUeX7xze990lTKjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784535524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8yE5Sktz4N2QqyMPswqMVa4jW3L+8cDxQAChTSuTiRk=;
	b=GANsjq15Ix55CaUMM1FYa+GuD/xhe26HqEufMZ/eAXZZVqYH8sRIIj+6jUps+mB0b5rr7a
	XqaYrVnaZaCDJPAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l0W0iWJZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GANsjq15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784535524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8yE5Sktz4N2QqyMPswqMVa4jW3L+8cDxQAChTSuTiRk=;
	b=l0W0iWJZ1VXH+dWnJzg7ZrCpkFkTYfRnYvr9JmRv/0rS0EC2qXzj+V3hbRqNtV4P4QNyhm
	6gdM1+LWaDAObsca32glhWBHXW56MLwD5SCa6EMXgRI1E6oycjrwl5uMiT2+NHqNE3V9w9
	cP5E12ICphOEoUqdUeX7xze990lTKjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784535524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8yE5Sktz4N2QqyMPswqMVa4jW3L+8cDxQAChTSuTiRk=;
	b=GANsjq15Ix55CaUMM1FYa+GuD/xhe26HqEufMZ/eAXZZVqYH8sRIIj+6jUps+mB0b5rr7a
	XqaYrVnaZaCDJPAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5F4E779AA;
	Mon, 20 Jul 2026 08:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JVXkNuPZXWrDXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 08:18:43 +0000
Date: Mon, 20 Jul 2026 10:18:43 +0200
Message-ID: <87h5luqdjw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Norbert Szetei <norbert@doyensec.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/2] ALSA: timer: don't re-enter an instance callback that is still running
In-Reply-To: <6F9B6501-8E65-4265-B02C-7EFB240D1664@doyensec.com>
References: <6F9B6501-8E65-4265-B02C-7EFB240D1664@doyensec.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 14C213E14
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 20 Jul 2026 09:09:55 +0200,
Norbert Szetei wrote:
> 
> The userspace-driven timer (utimer) TRIGGER ioctl calls
> snd_timer_interrupt() directly with no serialization, so two threads
> triggering the same utimer can run snd_timer_interrupt() on one
> snd_timer concurrently.
> 
> snd_timer_process_callbacks() drops timer->lock around each instance
> callback and marks the in-flight callback with the single
> SNDRV_TIMER_IFLG_CALLBACK bit; snd_timer_close_locked() waits on that
> bit to drain an in-flight callback before freeing the instance. The bit
> cannot represent two concurrent callbacks: when a second interrupt
> re-queues an instance whose callback is still running, both run at once,
> the first to finish clears the bit, and the close-path drain then frees
> the instance (and its callback_data) while the other callback is still
> live - a use-after-free reachable by any user able to open
> /dev/snd/timer, both via a user timer instance and via a sequencer queue
> timer bound to the utimer.
> 
> snd_timer_interrupt() sets IFLG_CALLBACK before dropping timer->lock, so
> a concurrent interrupt already observes it under the lock. Skip
> re-queuing an instance (and its slaves) to the ack/sack list while its
> callback is in flight; the accumulated pticks are delivered on the next
> tick, so no event is lost.
> 
> Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven timers")
> Cc: <stable@vger.kernel.org>
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>

Applied both patches now.  Thanks.


Takashi
