Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B4142659
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792268; cv=none; b=TAHQwnCBwGUNqEeD2yhX665S30O8T9HJAbU2o1TXd07/K2Vesvw6TUfVaZZ00IMVqgavpDZ/S/SyuvcAoh4iXXSp4Ri85op3Y8VxQiv/DYNv1+zc4M7V7U+JUKy+u/gc+a36ZfNm/ivE/jCL57Wva8Jwn3ayT0/rALHu1e0ktA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792268; c=relaxed/simple;
	bh=WC8XKyWmVY4VGKSaR1tu0CMNvFBOBNlKk0hYxE6snuQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=toDtkcstS0ERxsq2uYE0GP/EPUKIOWuQjmAJaKeBZ3EZR4wiDjsVqF8ETsrbl5scMF4XfkwfaEvF3y+Vq3LgZ0oCLUgLc1wsu8gKgNxntlMaRlfwoyd6ZS/XFMXaCdjaA1nsAAaMNmAqfsqh0wOg6YTpr3dxclyDSrYVPWVYNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iod3wp4R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5bX7C9jn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iod3wp4R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5bX7C9jn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iod3wp4R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5bX7C9jn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iod3wp4R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5bX7C9jn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 258CA1F394;
	Wed, 12 Mar 2025 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741792264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=66N9c+bvADGn7kolafFSPatjOuJUTFB2SXwjWgq7y10=;
	b=iod3wp4Ru80f3Xn7pzk1S8fxF5wf2eFkx2jJcht9S14EgPr2VnFEFPNsjhn2BsXo6nA36v
	3nxS1r9QsoXHmS44CYyu/9xYaau5XkPQNWn8xJD9PyjGEVM5lLM23Se32eqCJg4WJcgYAa
	RN/K+uOFNup1I8GHbY9Fpi7yn8ZskLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741792264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=66N9c+bvADGn7kolafFSPatjOuJUTFB2SXwjWgq7y10=;
	b=5bX7C9jnHoTsaWUIUdwwR3orTCafoZqxT1kvTH4E/voxXvRtYNqR9A046j8Rwas9ViZ653
	LyyiBAwRPqxynlDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iod3wp4R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5bX7C9jn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741792264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=66N9c+bvADGn7kolafFSPatjOuJUTFB2SXwjWgq7y10=;
	b=iod3wp4Ru80f3Xn7pzk1S8fxF5wf2eFkx2jJcht9S14EgPr2VnFEFPNsjhn2BsXo6nA36v
	3nxS1r9QsoXHmS44CYyu/9xYaau5XkPQNWn8xJD9PyjGEVM5lLM23Se32eqCJg4WJcgYAa
	RN/K+uOFNup1I8GHbY9Fpi7yn8ZskLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741792264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=66N9c+bvADGn7kolafFSPatjOuJUTFB2SXwjWgq7y10=;
	b=5bX7C9jnHoTsaWUIUdwwR3orTCafoZqxT1kvTH4E/voxXvRtYNqR9A046j8Rwas9ViZ653
	LyyiBAwRPqxynlDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED3C113A91;
	Wed, 12 Mar 2025 15:11:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RUimOAek0WccBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 15:11:03 +0000
Date: Wed, 12 Mar 2025 16:11:03 +0100
Message-ID: <877c4uz3lk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
In-Reply-To: <87a59qz3qw.wl-tiwai@suse.de>
References: <20250312145642.26646-1-tiwai@suse.de>
	<87a59qz3qw.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 258CA1F394
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 12 Mar 2025 16:07:51 +0100,
Takashi Iwai wrote:
> 
> On Wed, 12 Mar 2025 15:56:39 +0100,
> Takashi Iwai wrote:
> > 
> > Put __maybe_unused to work around the build error without CONFIG_PM
> > or CONFIG_PM_SLEEP for the newly defined system suspend callback.
> 
> I think a better alternative would be to wrap with pm_sleep_ptr().
> Will resubmit.

... and no, it won't work together with SET_SYSTEM_SLEEP_PM_OPS() :-<

So this patch should be the easiest fix, I suppose.


Takashi
