Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E721D3CC
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762453; cv=none; b=AmPrVOe3XSmq9VfNlx+ayzhpUgAo3A6mkA0YFPRtg7K7quYPGE1EkElnNDiHlC2DTtGFspYuOge2H2hgrpOIfT5czvn5DXDsYej+Kl9XJqUE009NvD6Lnl1kHp/nEH8P2SXGhfapp921Damf22Wwm70yzSSs9DUeAgj2DY3hvng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762453; c=relaxed/simple;
	bh=rp5j8XpglsUGn/kjPUXBiE4k2Qyb8R2jeZLOYZHEuaE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CjkBSS259NP5EOtRsIYpVJ0yKfbTGf9YvDfc7WrOo0mHrrw4PEBJ0Q92ZirY2ZZQlEseIUO0PNkINAPT9dJ2UBwV1v/g5fHehHuwWvkEBQNDGhvdOnVj6kpk5SYLKAAHfi38xPleag8D/JN3Wtz/aA2j9gLgFZQWzIhEBwFwAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jbWgQEuD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2es8n8Md; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hoj5JImT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kQETyUmH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jbWgQEuD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2es8n8Md";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hoj5JImT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kQETyUmH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0456075C7F;
	Sat,  6 Jun 2026 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WNEHjsz9beEGKnBf9b6l/W/salIFCNzfhuYW2f6G18=;
	b=jbWgQEuDB+iMGwDraAE+jkZ4cE2V3I+nXPy5+ru0/7uh7GGhfA5j7hQMONZkc3WlTvS3lr
	4e0ZRFtwH/Q2b/1yALewLg+OKwJAIRNd1nd/FRRBsgGdsO9WX2klvavRdJdfj1YG0YAwTv
	s4G6qJ6eY/KmMtCfI27U+FLjLWWJw6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WNEHjsz9beEGKnBf9b6l/W/salIFCNzfhuYW2f6G18=;
	b=2es8n8MdYpvQZ9TKqgf152XnjrKcpttm25H8VX9cY+6rTC2DIna/i4KRSYc5vtGanX8lNg
	P+ca1AWrv7PKpzDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WNEHjsz9beEGKnBf9b6l/W/salIFCNzfhuYW2f6G18=;
	b=hoj5JImTaetv6SVEx1LgXV30Hp9gmKnnYYMhuOJYwz0/Ni05Jfk3Sw8ixBPyYvSbMqnGoE
	rZEXjPdEyDon5HpW1Ks53yr2Zz2M1DLGLdYiImDPF6RDlhbI7EzdQClUiK47zCJ6tfuMch
	gTDzYtScr5Sq0uA5wEK5VvYG2++ggbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WNEHjsz9beEGKnBf9b6l/W/salIFCNzfhuYW2f6G18=;
	b=kQETyUmHU+AmK75jsreCOWCfuA6ZITyFwLMptwBoZtDyh8uN+V+5502O/sVcLKTAekzePs
	Q8J2aGbTHkQb/OCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C81CC779A7;
	Sat,  6 Jun 2026 16:14:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N+tGLlBHJGpXcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jun 2026 16:14:08 +0000
Date: Sat, 06 Jun 2026 18:14:08 +0200
Message-ID: <87tsrfsl2n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Fix partial userptr event expansion
In-Reply-To: <20260606040913.230213-1-sammiee5311@gmail.com>
References: <20260606040913.230213-1-sammiee5311@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Sat, 06 Jun 2026 06:09:13 +0200,
HyeongJun An wrote:
> 
> snd_seq_expand_var_event_at() clamps the number of bytes to copy to the
> remaining variable-event length, but passes the original buffer size to
> expand_var_event().
> 
> For SNDRV_SEQ_EXT_USRPTR events, expand_var_event() copies exactly the
> size argument from userspace.  On the final chunk, when the remaining
> event data is shorter than the caller's buffer, this can read past the
> declared event data and can spuriously fail with -EFAULT if the extra
> bytes cross an unmapped page.
> 
> Pass the clamped length instead.  The chained and kernel-backed paths
> already reclamp in dump_var_event(), but the user-pointer path handles
> the size directly.
> 
> Fixes: ea46f79709b6 ("ALSA: seq: Add snd_seq_expand_var_event_at() helper")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
