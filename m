Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F726352009
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017515; cv=none; b=KI8DF0j9WYk+qLJwqfV0V8XUlzNcr8PRydX13mljY0Bie6OGKls/PpPqp+qVTLioi2IlD+bYzfvVHGFRua6J64Bh0u/EPKqEoE8v0qFWghbLYOrAjt1eVNMr1U1JMv0q+ObW+5d+yJz7xTxJELnDtQ+XrG/fQpnBhd4rA+mOy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017515; c=relaxed/simple;
	bh=wqJNhNhA6tXOy42Tm8NfXxdydFu0e7SMlQxPrTHEuWo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EC4dnSFBy6DHSxS9Ih/mc0ZS1neXEZULbYXy0UAeHMoCm55lZNAF5G45miXLm/PVURO5+eZh6FfqxWgrDHscWTqRKG6r8IjB7rHzAalRwUDriJFLa8QQCJodjdVd1M3r+5Lbn9d1gN0I+svMSq0NND7oZD++Dx4FyhFxVPXBZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+wkLN3P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xmns0Vk7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UJ8TtI4h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zDHXjxwx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+wkLN3P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xmns0Vk7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UJ8TtI4h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zDHXjxwx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 57C1C3E00;
	Thu,  6 Aug 2026 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786017508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pt0n8szYPdqMXxJE6JrS5bUjss2KnssZIJ2lB7QBjHk=;
	b=S+wkLN3Pkc2WgTH6H4LtuqQW2W+Tap7w8ozWR+Tm9avvjoJrmowcyYCjdKANenH52/c0jg
	unMvD7odi/QAPWMzRF/R9rqCALJ36XSqkjwIcAmOBSdNd6BWbtpNBE8W/7e2FbL2TW93Ev
	uwTQCf1gkdDImMrMsRyN4UzLwsnYRpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786017508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pt0n8szYPdqMXxJE6JrS5bUjss2KnssZIJ2lB7QBjHk=;
	b=Xmns0Vk7BnGXTCBPwVCXvbArGTqm3MCVQz5p2zsQsFz/bSyn6bbuUkUZ4kgWEteue/iavh
	sHDYyHLT3ZxRmJDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UJ8TtI4h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zDHXjxwx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786017504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pt0n8szYPdqMXxJE6JrS5bUjss2KnssZIJ2lB7QBjHk=;
	b=UJ8TtI4hlTy90jaYLRhMWqo78NqmKr92lTkJc/mazYrWHVgJPwvtS0SvutgQ8/1LBHIWT6
	lUJJxprMqGZVfuGBf0sDWYPD4+Ac10UPYNeXzqB14ucx77ICfqWaoyMaOH1reX8BKHyl5W
	QmwyA0wl6SsegYejrGP9Mhd3rcQ+il4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786017504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pt0n8szYPdqMXxJE6JrS5bUjss2KnssZIJ2lB7QBjHk=;
	b=zDHXjxwxIrZZuyyblm59ek1eQsUmHneN3HGFyA4uEF5/LgAN1tOaNeIzFNqwZ8uQZzSRj2
	sqBu7Nt//5F3v6Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 298F8779B6;
	Thu,  6 Aug 2026 11:58:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C3vuCOB2dGocQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 11:58:24 +0000
Date: Thu, 06 Aug 2026 13:58:23 +0200
Message-ID: <877bm3ea00.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc6
In-Reply-To: <2f848fd70985d9c1bbee65eb39a99b4f@kernel.org>
References: <2f848fd70985d9c1bbee65eb39a99b4f@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 57C1C3E00
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 06 Aug 2026 13:49:27 +0200,
Mark Brown wrote:
> 
> The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:
> 
>   Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc6
> 
> for you to fetch changes up to 33c5aaf693d3fb78f6b8a9658939b72b7638243d:
> 
>   ASoC: cs35l41/cs35l45/cs4265: sort the reg_defaults tables (2026-08-05 13:34:37 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> A moderately large set of fixes, but mostly unremarkable:
> 
>  - A series of robustness fixes for the SOF code that came from testing.
>  - Fixes for user visible issues with some of the Qualcomm controls.
>  - Fixes to the register default tables in Cirrus drivers which ensure
>    correcy syncing on resume.  This is a wider problem which will be
>    fixed with a regmap core change but I'd already applied these, the
>    rest of the fixes will come in the merge window.
>  - Making the existing RT645 driver user selectable so it can be used
>    with more machines.
>  - Quite a few new AMD laptop quirks.
>  - A MAINTAINERS update for SpacemiT.

Pulled now.  Thanks.


Takashi
