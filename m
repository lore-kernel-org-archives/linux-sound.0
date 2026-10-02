Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A57280CD5
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945364; cv=none; b=QBFs605hBIhhdBf15T7r4Ut2NPbIhzQJ0h94lWHhZ0jNz37V6g9UA0tuKc+PzCxl3EsJMja9s02sSG7GP1hyPH9PqljMLHwZo/eqDcwMcLo3ezNxLXZO9M840/4A9+SWWnDKaydCXm2QrzqR9mgFRo6YchOMGZv974qXnjC4kB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945364; c=relaxed/simple;
	bh=7rkj/N5W7RxAR11H4P1QL0a/+vajefjuvp1Tn1wlWC8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsjoDuhBdYun3pw5IHed7ysPAvHcAf6g+3ndIfoAqlT+javQh8+nk9q9UAx7YlC/kUlT/Zdj4rMTVDxHuUQPF79Uf4+0mLO8usaNmbwns77c410Bv9/inJHM7fRRstzXpVLuEyadS95F6aqITjO4VRisJPmSMq0PnPUuuVvdcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sD5t/l11; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=72Oi/D0O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=isrNTkTM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C20wx8Bo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sD5t/l11";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="72Oi/D0O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="isrNTkTM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C20wx8Bo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38A4421DC4;
	Fri,  2 Oct 2026 12:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790945357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XQ9gUQ+z15h7NUiFz5FiKJXgezx4EjAHkmJFYvhEQQ=;
	b=sD5t/l11Cu0hK06MNiAQ7UEFwlbXXOu8t9pmL2RL4b7pNq1um+l7ZqW0BkJFmwSpEkK766
	j9UlqPO2nMLBvrPrsqVsYZDc/pPKltHi6xJxWAnYx04AleBo1zLONw+PuAv2RBJgRGnSxc
	F8lXkM5F+l8Qbobm4qfoo7vma5uU200=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790945357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XQ9gUQ+z15h7NUiFz5FiKJXgezx4EjAHkmJFYvhEQQ=;
	b=72Oi/D0OJ5DH9YCH+1iOP5VG3ACWcVKvt3aFm1TiHNosKpI2SBNczWef/cUMzPxeRj1PHQ
	w2B4qxH8mzWJocBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=isrNTkTM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C20wx8Bo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790945353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XQ9gUQ+z15h7NUiFz5FiKJXgezx4EjAHkmJFYvhEQQ=;
	b=isrNTkTMT1lr/gcArz3i72PhPPur2JELK4x3osbJvWMPf7DJlKbsMe8YDvC+cyCW04FogD
	R3YexsDXgn9FOXjo7vmjnarpNiP1owBZTewONISxU9U+UAUmMEDjKrIvmhLtyt8dCm8OQa
	kg5IIzmOGcUdd4YPRy/nJNHDCUzO8KE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790945353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XQ9gUQ+z15h7NUiFz5FiKJXgezx4EjAHkmJFYvhEQQ=;
	b=C20wx8BoAQZFJOeTBg32Tq7lFpNgYz3pK40dqMUFUfxBgQgjwJaepfjoW6x7Cngp0l1Umm
	4EiQGsWfXdQimICQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E878A13C73;
	Fri,  2 Oct 2026 12:49:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tSvnL0iov2qLVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 12:49:12 +0000
Date: Fri, 02 Oct 2026 14:49:12 +0200
Message-ID: <87tsn4z2rb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc5
In-Reply-To: <ac1f5abe5b1f49157574990efcd4eaf2@kernel.org>
References: <ac1f5abe5b1f49157574990efcd4eaf2@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 38A4421DC4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 02 Oct 2026 14:35:32 +0200,
Mark Brown wrote:
> 
> The following changes since commit 93f51579e7df248780214094418f205253383cc5:
> 
>   Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc5
> 
> for you to fetch changes up to cad16d850e3759dd82cd869f739b56e9844a1fee:
> 
>   spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260 (2026-10-01 16:38:05 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.3
> 
> A bigger collection of fixes than usual due to your vacation but nothing
> hugely remarkable here, just fairly standard quirks and driver specific
> bugfixes.

This one looks better :)

Pulled now.  Thanks!


Takashi
