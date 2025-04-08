Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092721CC47
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105711; cv=none; b=k8duOAdo/uwkAy3t7DPM05gvd1/UcZenb7RS1TSOxdlREk4VZP4kCo4Lw3VqPvAsMaLPTPuuK/TVDazJ76oNzlWuhxmOT46qe2PNr3EDr200R9/tFzKIL3UZk67eR9NumCWfF9Qnc7Zyuy5lauQtykQRl9fqYFzxYOJIGAOipsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105711; c=relaxed/simple;
	bh=1tcn5YM3V1EN0dH3NP+h6meAAgLlohiWeDuKnz5ae78=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4v3u65f7lOu8UaUy2kw7FIz2+8nQ90Rp4WlrgUlmsgvytNqrq26tyxMmN+8QzHeYPw53ThXDgsPaX0lxB2HEJo/w8q+s0zvAfksFSf89LbCG70y2CSBA5b5Tx7vO0Od8xCJdlo2L+AFuey47N4VJ7thxBNkl7pEFhRQ/9ReF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VXeuypuj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PltLtXaC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VXeuypuj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PltLtXaC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VXeuypuj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PltLtXaC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VXeuypuj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PltLtXaC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD7F321179;
	Tue,  8 Apr 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744105696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zHVmlIsJMw3pRtlkeC0rl7d/IrCkO2vExM9C4gD0NRY=;
	b=VXeuypujefj9yRC08jaBs3LHccB4Rfsjz1soIgI81uj7mwNGYjJV8wFACGFyIbd1qtaeyX
	jf5ipOfLsy41yNRcPeWP7OO2+eSsK6bRpNzKoFo7zOpYFC/L4X/y0fYEMvEufqXwiL/ZQM
	sM8m55EuXyc7qUcVU8Uu1eGlFPQAZJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744105696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zHVmlIsJMw3pRtlkeC0rl7d/IrCkO2vExM9C4gD0NRY=;
	b=PltLtXaCbO9/0LddHxUn/qkGJhsyRNeHx3aa0mQi7qyiVhRhW4toTkW5SS+cWWCYIrWp0K
	5coEKLe1YoCYUfDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744105696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zHVmlIsJMw3pRtlkeC0rl7d/IrCkO2vExM9C4gD0NRY=;
	b=VXeuypujefj9yRC08jaBs3LHccB4Rfsjz1soIgI81uj7mwNGYjJV8wFACGFyIbd1qtaeyX
	jf5ipOfLsy41yNRcPeWP7OO2+eSsK6bRpNzKoFo7zOpYFC/L4X/y0fYEMvEufqXwiL/ZQM
	sM8m55EuXyc7qUcVU8Uu1eGlFPQAZJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744105696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zHVmlIsJMw3pRtlkeC0rl7d/IrCkO2vExM9C4gD0NRY=;
	b=PltLtXaCbO9/0LddHxUn/qkGJhsyRNeHx3aa0mQi7qyiVhRhW4toTkW5SS+cWWCYIrWp0K
	5coEKLe1YoCYUfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3BE313A1E;
	Tue,  8 Apr 2025 09:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PV92J+Dw9GfEagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Apr 2025 09:48:16 +0000
Date: Tue, 08 Apr 2025 11:48:12 +0200
Message-ID: <87bjt7asrn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: xiaopeitux@foxmail.com
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: kunit: fix build warning in test_card_set_id
In-Reply-To: <871pu4c74t.wl-tiwai@suse.de>
References: <tencent_7F01F2D14BF724692ECBF5346283DB9BCA05@qq.com>
	<871pu4c74t.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,kylinos.cn,intel.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 07 Apr 2025 17:40:18 +0200,
Takashi Iwai wrote:
> 
> On Mon, 07 Apr 2025 11:21:36 +0200,
> xiaopeitux@foxmail.com wrote:
> > 
> > From: Pei Xiao <xiaopei01@kylinos.cn>
> > 
> > build W=1 warning:
> > sound/core/sound_kunit.c: In function 'test_card_set_id':
> >    include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]
> > 
> > Fix -Wformat-overflow warning when card->id could be NULL.
> > The kunit_info() call with "%s" format specifier may receive a NULL
> > pointer from card->id. Add a ternary conditional to safely handle
> > potential NULL values by substituting "(null)" when card->id is NULL.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202504050922.ZzbkiojG-lkp@intel.com/
> > Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> 
> Thanks, applied now.  I added Fixes tag manually
> (Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test"))
> 
> But at the next time, please try to put the proper Fixes tag.

... and as 0day bot spotted out, this fix is bogus.
snd_card.id is an embedded array, and can be never NULL.

I drop the patch now.


Takashi
