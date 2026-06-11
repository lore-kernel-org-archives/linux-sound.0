Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466E2DB7BF
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206222; cv=none; b=hld+GmVTYVkMjLuZlgoXUgOy2XLfK+8MqAPUeW/ub/rA3mPuzmD1dMKf0YbFl7OZxxYDPejaEfyRT28tKDFoGx7KYL6oJ0yp3KLpXi/FizYLJz+i2gjP89uGKZdBxL+yAC3NVdJ3ZlMBBEIN33HaMwHLXup3yCsM8RbkDfKRIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206222; c=relaxed/simple;
	bh=rtX0gmLPZ7sCVMzzJ01HnzleW5RvHym/BZphO6JOhwI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIhIbCef0Ldg3CKrZ1NonkzslpswgIedGYlDBUHH2u83D+tCfXwXBCCUqY903tQovWX1lAVHuQWYqXQy8prEQ+4Ag1O4Q1ZT3oT3WiwsMcISyvX7dYZ9aZUJpeIUxYH7LZPh32inTt95vtwp4Wgjzgkd/r4cuwcHyOxBsj2f7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vk85/4+u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xz+VSlWN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vk85/4+u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xz+VSlWN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vk85/4+u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xz+VSlWN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vk85/4+u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xz+VSlWN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1D1E75D16;
	Thu, 11 Jun 2026 19:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781206218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bl1yDiK1JT6DJd7r6EVwRS1jbhf0qp/IiIN1NGcs0hE=;
	b=vk85/4+uVbvjwblsaO2oQV8NnV6k3VA3KHVU0ossQqoA3NB2Iori6anSkXs9xeTcUw5rAc
	3IjT/IdKZa8Lxy39t3TUtof6/qQqhKDA8BIAerNqMHe8eWdoo76bRhPzMHqGnxaNN01QGM
	ITWX7J2tKKKe45NltHiOFct9Le0nd1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781206218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bl1yDiK1JT6DJd7r6EVwRS1jbhf0qp/IiIN1NGcs0hE=;
	b=Xz+VSlWNaaAcgxbTBRdZ3uxtX1vHlsHw+wcYTRbF5jHsfYxsJiGR/Zx4bEIqXt+eXprxi5
	wOJGzRpgsLp5WRBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vk85/4+u";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Xz+VSlWN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781206218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bl1yDiK1JT6DJd7r6EVwRS1jbhf0qp/IiIN1NGcs0hE=;
	b=vk85/4+uVbvjwblsaO2oQV8NnV6k3VA3KHVU0ossQqoA3NB2Iori6anSkXs9xeTcUw5rAc
	3IjT/IdKZa8Lxy39t3TUtof6/qQqhKDA8BIAerNqMHe8eWdoo76bRhPzMHqGnxaNN01QGM
	ITWX7J2tKKKe45NltHiOFct9Le0nd1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781206218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bl1yDiK1JT6DJd7r6EVwRS1jbhf0qp/IiIN1NGcs0hE=;
	b=Xz+VSlWNaaAcgxbTBRdZ3uxtX1vHlsHw+wcYTRbF5jHsfYxsJiGR/Zx4bEIqXt+eXprxi5
	wOJGzRpgsLp5WRBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 770CA779A7;
	Thu, 11 Jun 2026 19:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FnFyG8oMK2qpcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Jun 2026 19:30:18 +0000
Date: Thu, 11 Jun 2026 21:30:17 +0200
Message-ID: <8733yskh86.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.1-rc7
In-Reply-To: <20260611181119.2822E1AC56C9@finisterre.sirena.org.uk>
References: <20260611181119.2822E1AC56C9@finisterre.sirena.org.uk>
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
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A1D1E75D16
X-Spam-Score: -3.51

On Thu, 11 Jun 2026 20:11:12 +0200,
Mark Brown wrote:
> 
> The following changes since commit d2dcd85f9e09fe3566d4cdcd357856a42ac73f93:
> 
>   ASoC: amd: acp70: add standalone RT721 SoundWire machine (2026-06-04 11:35:06 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc7
> 
> for you to fetch changes up to e4c60a1d4b6ccc66aefb3789cd908d4f9482eefd:
> 
>   ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions (2026-06-11 15:55:23 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.1
> 
> A few more fixes for this release, some smaller driver specific ones
> plus a final quirk.

Pulled now.  Thanks.


Takashi
