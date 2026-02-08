Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9AC23A9B3
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770568676; cv=none; b=Mpm9bIQLIYgaYtToHM1JvZJW2LBQ+IlpvyuxnXnYqe+7VnELTkvyBokR/A4NZttVBoDP5zA0c1VhIVGPjDobSfRygrM8q/aDLQ4u10jGO8Vzq37zbB06F/b4Ugzm/Iod1u7hJC4hABBYWaotF89iTyG9SA9XATTCYgUu8RM7siI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770568676; c=relaxed/simple;
	bh=4b/W+Wn8KHUEXcoqloS8iiU9vv9654cA+JfrwZfcC3c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZmSw9jq+v11h1B0cNIW8yuWfQKF1f0ElCvAhdwnKAGukp/ID14bLYr2j8WecVxF0jHLXtJCg+L8N2udwWCEOemvRf+NTvzQmHhM+8UBSvR/2OdZRrObUg7zSnnov/Fp1sgWUUZc4VBienowox6wFNVbOmZwqgczW/bHc/duTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BEvqq8zD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZWeI7tw7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BEvqq8zD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZWeI7tw7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BEvqq8zD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZWeI7tw7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BEvqq8zD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZWeI7tw7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A771B5BCDF;
	Sun,  8 Feb 2026 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770568674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lQnYSRc6+j6vqqITFVpJm5Px8kXGis3O1jP2aTLDB98=;
	b=BEvqq8zDI/gOWrW83D5VvhjnmS5M1izZ38xPeHKmiE/1CetOj6wHkEklo4Ri+dd8YxN7Da
	nXmsRHAIBQON8njsdq6vaB1FTQo1/g+wWZVWha7IqrRP5+YeGo7Ffv3Y84okLxptIfvWDh
	6RWtDzLe9xh5BAOnMHcUa3i4r8ZeTIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770568674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lQnYSRc6+j6vqqITFVpJm5Px8kXGis3O1jP2aTLDB98=;
	b=ZWeI7tw7VnuCh1YpNOdV5a28sYwOeiuCbAQspz0WfCrJbm8HPbZf31Pjx+b/yZBvIy5lTq
	JM/nQD8dO8qWUzDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770568674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lQnYSRc6+j6vqqITFVpJm5Px8kXGis3O1jP2aTLDB98=;
	b=BEvqq8zDI/gOWrW83D5VvhjnmS5M1izZ38xPeHKmiE/1CetOj6wHkEklo4Ri+dd8YxN7Da
	nXmsRHAIBQON8njsdq6vaB1FTQo1/g+wWZVWha7IqrRP5+YeGo7Ffv3Y84okLxptIfvWDh
	6RWtDzLe9xh5BAOnMHcUa3i4r8ZeTIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770568674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lQnYSRc6+j6vqqITFVpJm5Px8kXGis3O1jP2aTLDB98=;
	b=ZWeI7tw7VnuCh1YpNOdV5a28sYwOeiuCbAQspz0WfCrJbm8HPbZf31Pjx+b/yZBvIy5lTq
	JM/nQD8dO8qWUzDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B8EE3EA63;
	Sun,  8 Feb 2026 16:37:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCvgGOK7iGloOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Feb 2026 16:37:54 +0000
Date: Sun, 08 Feb 2026 17:37:54 +0100
Message-ID: <87o6lz6vj1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: pcm: fix use-after-free in snd_pcm_post_stop
In-Reply-To: <20260208102058.9794-1-officialsohamkute@gmail.com>
References: <20260208102058.9794-1-officialsohamkute@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[16b2b67ae905feb8a289];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Sun, 08 Feb 2026 11:20:58 +0100,
Soham Kute wrote:
> 
> syzbot reported a slab-use-after-free in snd_pcm_post_stop() when the
> PCM runtime may already be freed during teardown.
> 
> snd_pcm_post_stop() can be called after snd_pcm_detach_substream()
> releases the runtime, leading to a use-after-free when accessing
> runtime state and wait queues.
> 
> Add a defensive check to avoid dereferencing a freed runtime pointer.
> 
> Reported-by: syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com
> 
> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>

Thanks for the patch, but IMO it's rather a wrong "fix".  It just
papers over some place that had casually a NULL dereference due to a
UAF.  That is, this change itself is no fix for UAF, but just trying
to avoid a casual Oops; more worse, it may still happen at another
place if happening at a little bit different moment even if you plug
like that.

If any, we could put such a sanity check with WARN_ON() to indicate
the obvious code flow error.  But, still there is no much reason to
put the check only here at this place.  After all, the actual UAF must
be fixed in the caller side.


thanks,

Takashi
