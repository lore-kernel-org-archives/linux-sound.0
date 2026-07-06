Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712FE3BC664
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333167; cv=none; b=mRKpmw5Bg/F0oq3tvKWDWcj0mHs39GG4wEpLmIpr9VuTv86G8qJIh+YatfxhWTuWGQ4RM27i72mxtdhF9jsZxPP3eJtuWv83rk8nsoEnJH29Kyn9aUiarzHyMbGh5fDaTDSgpjOy6IXzUNdb73b45AOAKlHKqeLvVEfDXGqe9Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333167; c=relaxed/simple;
	bh=Soww6zogd6Rr8MbpNZ1mMdVBwsqoWDvD1793GkElABg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YALuw0my81Hs0ID2hM/H+kxzZqPnjF5EfinLkbwcQVzOYljfrA7+NCGSqfEbyuMaMF0M9jAzY2jCRIlpBcCBaqk9gN4TQRc3G5hZ4JQU9tZTZpdPsxWj6d4zbxj13j+uJUcssbd8R50/ZkolCfbehyqzbtzzhREYtsjj8yT9vWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AvO63R/j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+vDVt0uj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AvO63R/j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+vDVt0uj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AvO63R/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vDVt0uj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AvO63R/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vDVt0uj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9422573AF8;
	Mon,  6 Jul 2026 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783333163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEx+RUysCfIFu2iMDIonQK1gvHKKcBNarOIx1a23td4=;
	b=AvO63R/jtyh4itjStXb8lsgYxpIfQUxgMSf6JFjE4cY6/gggazyi7Om5h93hLwVBLU4mHU
	6pA/AvaoUEk03KPwT7UHKyg4bee2LXp/lC6xmU9n5lTcKY1+JcczTnmEwOh43cQ3+8GBa5
	LV/MBBoqYjP/ghaQFMDJOF5+D+Bm/Pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783333163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEx+RUysCfIFu2iMDIonQK1gvHKKcBNarOIx1a23td4=;
	b=+vDVt0ujNChPruD4+w8c8TtVOH36TOKhAcatoqYqoPbjt4sSBW6gTkt5XlhVgUDlBrQjjr
	bGQU8BCp9EdjsYDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="AvO63R/j";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+vDVt0uj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783333163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEx+RUysCfIFu2iMDIonQK1gvHKKcBNarOIx1a23td4=;
	b=AvO63R/jtyh4itjStXb8lsgYxpIfQUxgMSf6JFjE4cY6/gggazyi7Om5h93hLwVBLU4mHU
	6pA/AvaoUEk03KPwT7UHKyg4bee2LXp/lC6xmU9n5lTcKY1+JcczTnmEwOh43cQ3+8GBa5
	LV/MBBoqYjP/ghaQFMDJOF5+D+Bm/Pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783333163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEx+RUysCfIFu2iMDIonQK1gvHKKcBNarOIx1a23td4=;
	b=+vDVt0ujNChPruD4+w8c8TtVOH36TOKhAcatoqYqoPbjt4sSBW6gTkt5XlhVgUDlBrQjjr
	bGQU8BCp9EdjsYDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E2AA779AA;
	Mon,  6 Jul 2026 10:19:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CdTSESuBS2pPFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Jul 2026 10:19:23 +0000
Date: Mon, 06 Jul 2026 12:19:22 +0200
Message-ID: <87pl108lp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: tiwai@suse.de,
	joakim.zhang@cixtech.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/core: fix memory leak in snd_hdac_bus_alloc_stream_pages()
In-Reply-To: <tencent_6643D4C4FD3A63DCC5AEDDEEEEAAB8F12605@qq.com>
References: <878q7o5ygj.wl-tiwai@suse.de>
	<tencent_6643D4C4FD3A63DCC5AEDDEEEEAAB8F12605@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9422573AF8
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 06 Jul 2026 10:51:11 +0200,
Zhao Dongdong wrote:
> 
> On Mon, 06 Jul 2026 10:11:56 +0200, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 06 Jul 2026 09:41:10 +0200,
> > Zhao Dongdong wrote:
> > > 
> > > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > > 
> > > In snd_hdac_bus_alloc_stream_pages(), there are three memory leak paths:
> > > 
> > >   1. If snd_dma_alloc_pages() for the BDL fails at stream i, the
> > >      previously allocated BDL DMA buffers (0..i-1) are not freed.
> > > 
> > >   2. If snd_dma_alloc_pages() for the position buffer fails, all
> > >      previously allocated BDL DMA buffers are leaked.
> > > 
> > >   3. If snd_dma_alloc_pages() for the ring buffer fails, all
> > >      previously allocated BDL DMA buffers and the position buffer
> > >      are leaked.
> > > 
> > > Add proper error cleanup: free buffers that have been allocated
> > > before each failure point.
> > > 
> > > Fixes: b2660d1ebde1 ("ALSA: hda: Move HD-audio core stuff into sound/hda/core")
> > > Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> >
> > They don't actually leak, as those are supposed to be released by
> > callers (via snd_hdac_bus_free_stream_pages() call at destructor).
> > That is, it's no bug, per se.
> >
> > Of course, it won't be bad to clean up in the function itself, which
> > is more self-contained and safer.  But please rephrase the patch
> > subject and description, so that it won't be taken as a security issue
> > incorrectly.
> >
> >
> > thanks,
> >
> > Takashi
> 
> Thanks for your review. 
> You are right that snd_hdac_bus_alloc_stream_pages and snd_hdac_bus_free_stream_pages 
> are paired, so the extra free call is unnecessary, please ignore this patch.

Well, your code change itself is fine as a code hardening, and I'll
happily apply if the patch subject and description are updated.
So, feel free to resubmit with the updated description.


thanks,

Takashi
