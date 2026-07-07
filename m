Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F8742A16E
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434999; cv=none; b=meQOT5uIB/38328f8R6hx+IwywWZrPst8vWAcGus3VLkmm/gR5O2bLo4UABsSVrkoFY/kPzsPEzkgdKiP8JqcL5wGwkKz993BCRPTLQ6jzFW8pVAEcZTzGfM3TaHk35CdaRB/rqoNlXim/Q0AYtKcJQZ4Bt4LvgUDJtWGA+f8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434999; c=relaxed/simple;
	bh=DXeqSnMfzd5lNYRxt+t6gwIrmdDCwviNDta6Sf97QMQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k01VM0BI08Di/O63pIXm/jv2spp0oIy3FOK4GjXyVUTprqdfi4xK+AHd3nqS1rReiG8GVn4uGSHqVJ3qiCECte7P4DeuwkvJywMqoXe9XA9VTYomU1dWYXM0sswA4DMnvAZipLdzfY6wGE4IaDCAOLLl91u1YEL3R7cS/g7j4O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kHZmhoVo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uzgpCTgV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kHZmhoVo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uzgpCTgV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kHZmhoVo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uzgpCTgV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kHZmhoVo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uzgpCTgV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3536675C07;
	Tue,  7 Jul 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783434996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxbwPx62Q1noLSxONw33B4hb7YOLLi8IZKxSgJqNpV4=;
	b=kHZmhoVoLJScgYM0md8KbBjPCMw2kqHI4PxP+/SIo2QaLQjhqE+A7u7m8XbUY/b94zBqtF
	EIeBMLSPGGeIovXTqN+scAUc2Kj4YGXzZcKl1i5slTuCuqKZZILmT6Xl9sZJShsUtlAFP6
	C1RKcZnif2AqkCY/NQdk+w9N0lOlLIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783434996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxbwPx62Q1noLSxONw33B4hb7YOLLi8IZKxSgJqNpV4=;
	b=uzgpCTgVw5DBEaG0ov6EY0uzzdzeNPzHkHcdxvPPWxVuiXnJtZUQGXg0In+PrFfyxzWdSP
	5mm2NkPapl4VMXDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kHZmhoVo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uzgpCTgV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783434996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxbwPx62Q1noLSxONw33B4hb7YOLLi8IZKxSgJqNpV4=;
	b=kHZmhoVoLJScgYM0md8KbBjPCMw2kqHI4PxP+/SIo2QaLQjhqE+A7u7m8XbUY/b94zBqtF
	EIeBMLSPGGeIovXTqN+scAUc2Kj4YGXzZcKl1i5slTuCuqKZZILmT6Xl9sZJShsUtlAFP6
	C1RKcZnif2AqkCY/NQdk+w9N0lOlLIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783434996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxbwPx62Q1noLSxONw33B4hb7YOLLi8IZKxSgJqNpV4=;
	b=uzgpCTgVw5DBEaG0ov6EY0uzzdzeNPzHkHcdxvPPWxVuiXnJtZUQGXg0In+PrFfyxzWdSP
	5mm2NkPapl4VMXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19A77779AE;
	Tue,  7 Jul 2026 14:36:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X36ZBfQOTWqfcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jul 2026 14:36:36 +0000
Date: Tue, 07 Jul 2026 16:36:35 +0200
Message-ID: <87wlv66f4c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: use ARRAY_SIZE() in snd_minor_info_read()
In-Reply-To: <20260707074556.569451-1-phucduc.bui@gmail.com>
References: <20260707074556.569451-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
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
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3536675C07
X-Spam-Score: -2.01

On Tue, 07 Jul 2026 09:45:56 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use ARRAY_SIZE(snd_minors) instead of SNDRV_OS_MINORS directly, for
> consistency with snd_find_free_minor() and snd_unregister_device() in
> the same file. No functional change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
