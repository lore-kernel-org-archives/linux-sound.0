Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A975025E
	for <linux-sound@vger.kernel.org>; Mon, 22 Apr 2024 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713814176; cv=none; b=uuInIXfa050d5FGkCCC6zyEQxjFlgjQ8JetNxDchQDjsv77QaqBTF78+4aAUImirxmVo8OXmtTw+gvrY5sZk9X+ZEUWFXE1PCh6/YkRNEVm0mZeOu9Vzq9BRRdfXN5B4qz5pTTATllu2ojDzPhO0LSBNN+SfxMzub8PJG7xsmt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713814176; c=relaxed/simple;
	bh=0R+SxEX/H4+XOCB2Tygd74ocTAUukM2K5JEZ9yqkhYA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyRuudJ8TtmFTG65D8be5Readh+/jwSL2g/e3FUMkkLAFqh/Tjyh8qdo2j3UdGo4zX1wtKBVGLTCu6wzE1r1IVq4BOysBMmsckb0zu0ziud0Oy/yaz7JXuX2LY2NGNFNgkJOrAEWo0h1uJSyUFGv9ziydN3pfGVhwuXd3Kj+Bxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VlwZkIlw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QHdscLEg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VlwZkIlw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QHdscLEg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VlwZkIlw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QHdscLEg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VlwZkIlw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QHdscLEg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B544C3737A;
	Mon, 22 Apr 2024 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713814166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3BQZ5+Yh5SqgNfqJlXLEzuYvoQjXpFPhqTRJr9su3k=;
	b=VlwZkIlwy/EvBwrCZITJT+0mte79oElCX2ssnsv7ZW6u/lKP82+yoQt480Qu36iwgenOFp
	gp2Dv58PK7s4+yP7Acr8/NnZ9TNl26wEKbRDaA/5XzkVRjGm2ZImBKN0ErpOuKA+8i8QzI
	q8kxLPTWDJn71P0reHJYY89WZNOCu+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713814166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3BQZ5+Yh5SqgNfqJlXLEzuYvoQjXpFPhqTRJr9su3k=;
	b=QHdscLEg1o2aTKQbYLe/ELuR+Wj7tTsxPn8txgVDKhL1xsj4UOj3QUMq0kXpBYW6Uz6hOX
	pYEV1sLa4kaOXkAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VlwZkIlw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QHdscLEg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713814166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3BQZ5+Yh5SqgNfqJlXLEzuYvoQjXpFPhqTRJr9su3k=;
	b=VlwZkIlwy/EvBwrCZITJT+0mte79oElCX2ssnsv7ZW6u/lKP82+yoQt480Qu36iwgenOFp
	gp2Dv58PK7s4+yP7Acr8/NnZ9TNl26wEKbRDaA/5XzkVRjGm2ZImBKN0ErpOuKA+8i8QzI
	q8kxLPTWDJn71P0reHJYY89WZNOCu+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713814166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3BQZ5+Yh5SqgNfqJlXLEzuYvoQjXpFPhqTRJr9su3k=;
	b=QHdscLEg1o2aTKQbYLe/ELuR+Wj7tTsxPn8txgVDKhL1xsj4UOj3QUMq0kXpBYW6Uz6hOX
	pYEV1sLa4kaOXkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96F3D136ED;
	Mon, 22 Apr 2024 19:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eNjpI5a6JmZRQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Apr 2024 19:29:26 +0000
Date: Mon, 22 Apr 2024 21:29:27 +0200
Message-ID: <871q6xjiw8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: Re: [PATCH 00/10] ALSA: emu10k1: fixes related to uploading firmware to the E-MU dock
In-Reply-To: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
References: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B544C3737A
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,perex.cz,gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

On Sun, 21 Apr 2024 22:46:57 +0200,
Oswald Buddenhagen wrote:
> 
> patches 1-3 & 5 fix the regression(s), patch 4 fixes a related pre-existing
> problem, while patches 6-10 are "only" improvements.
> 
> i don't think it really makes sense to revert fbb64eedf5a3 (ALSA: emu10k1: make
> E-MU dock monitoring interrupt-driven) and re-do things from scratch, as we'd
> also need to revert the unrelated c960b012ec47 (ALSA: emu10k1: track loss of
> external clock on E-MU cards) first.
> 
> so i'd just go with the series as-is, and cherry-pick the four (or preferably
> five) patches to stable.

If a few of the series are rather regression fixes that should be
merged to Linus tree sooner, please separate them and send two patch
sets instead.  I don't see Fixes tag in the patch 2, for example, so
I'm not sure whether I should pick up.

Also, your Fixes tag usage is incorrect.  It should be
  Fixes: $ID ("subject...")
while yours missing the quotes.  Some people are picky about those
formats, so let's be strict.

Could you resubmit two patch sets with those corrections?


thanks,

Takashi

> 
> ---
> 
> the series (and a bunch of failed experiments) is fully tested by pietro with
> both rev1 and rev2 1010 cards, a 0202 cardbus card, and their respective docks.
> he'll get permanent testing credits in the card capability table later on (if
> he so wishes), so i didn't bother adding a tested-by footer to each patch.
> 
> Oswald Buddenhagen (10):
>   ALSA: emu10k1: fix E-MU card dock presence monitoring
>   ALSA: emu10k1: factor out snd_emu1010_load_dock_firmware()
>   ALSA: emu10k1: move the whole GPIO event handling to the workqueue
>   ALSA: emu10k1: use mutex for E-MU FPGA access locking
>   ALSA: emu10k1: fix E-MU dock initialization
>   ALSA: emu10k1: simplify E-MU card FPGA reset sequence
>   ALSA: emu10k1: make snd_emu1010_load_firmware_entry() void
>   ALSA: emu10k1: move entering E-MU card FPGA programming mode
>   ALSA: emu10k1: move snd_emu1010_load_firmware_entry() to io.c
>   ALSA: emu10k1: make E-MU FPGA writes potentially more reliable
> 
>  include/sound/emu10k1.h          |   8 +-
>  sound/pci/emu10k1/emu10k1.c      |   3 +-
>  sound/pci/emu10k1/emu10k1_main.c | 225 +++++++++++++------------------
>  sound/pci/emu10k1/emumixer.c     |  18 ++-
>  sound/pci/emu10k1/emuproc.c      |   9 ++
>  sound/pci/emu10k1/io.c           | 104 ++++++++++----
>  6 files changed, 195 insertions(+), 172 deletions(-)
> 
> -- 
> 2.44.0.701.g2cf7baacf3.dirty
> 
