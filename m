Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689613E7150
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880300; cv=none; b=kr9ju3RNw1yBO1qJSUOW7E2nyH0LzWhvyRVd20YIfvz38HWVwGT0bUfi7EBojuJCJecO88wMFBcWeMGr0OpSWAUWeeSnSzpcD93MmQboBWJZcyuqzWkj2kyoVViUgxvyOj5rZvAMshjEKiYEIN5CGPQzh776uLZi8nHpeVFqBa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880300; c=relaxed/simple;
	bh=UKIfOVrHyStuBD/E1pxMp0i4PKBhcP5srGNqWPIPj0M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ix0rJrNk4tQwD0GX68H9KGL2Yo8+o4S0AA5humChyJIRuas48AtDFAbUTd3DUT4SJjw6gRLeyFASNSkvdhKpG2qh1FC//qg+berw+LmSaVcRbTF36nms+IAyrQgU+y/8pM2ILFLP1SSM6x4hke6R8zWOoXQPRQnzhECEl7DlHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cOPCroDZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=guU2AsPf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l3N9aX1w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4XyZ/+iu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cOPCroDZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="guU2AsPf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l3N9aX1w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4XyZ/+iu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59B1266E9B;
	Wed, 27 May 2026 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779880297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qz77bDNdKdDY3nctu+/1ex7LbcTA7mnZDKeRnyiumQ=;
	b=cOPCroDZyrYDI3/FAxNfoWoVPhul8dLcOy/Kma7+fON+hu7XoXbdEQMI+fpyUUCDUVbCCD
	YMIJZYEhnUTxj5As1gWT2sj0iQ483kiBEiHBfWVTYlkCvHJTi3xbnStasFbrvH8H7AXCTH
	HVvvnsK2KEUicmRZNyQmc2f+K0E8H5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779880297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qz77bDNdKdDY3nctu+/1ex7LbcTA7mnZDKeRnyiumQ=;
	b=guU2AsPf4XIsRsz0FUe2GqL/jj0tPktjnuJWDDrjCApOyZeeqr0qb74PNhRjkRMLbgjbtt
	0Dd69MQMUSmyUqCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l3N9aX1w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="4XyZ/+iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779880296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qz77bDNdKdDY3nctu+/1ex7LbcTA7mnZDKeRnyiumQ=;
	b=l3N9aX1weOs1C2m9DjzddMCwLrLyWoLmW6RgjyznCx58VRpZ5eA0tNgbrAwBT/BXplN/1u
	apU8u9/Ly67ACQM2HV8q5qUBIV+Vj2y0FjOyyqr/Ek9zPpAOhiiJAkG4h7yuWCqWuCWnYS
	UK23xQd1PoTvtLaV+M5rM8jCjdgJh4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779880296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qz77bDNdKdDY3nctu+/1ex7LbcTA7mnZDKeRnyiumQ=;
	b=4XyZ/+iuZvQgsr0tWQdxIGAN95CyjBW5q5W2dpwpPrAGREFzuPXcSqX92LzdSXmUfvaPX6
	XpDKZlkB+VtUBkDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B5255A7D2;
	Wed, 27 May 2026 11:11:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U41kCWjRFmoFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 11:11:36 +0000
Date: Wed, 27 May 2026 13:11:35 +0200
Message-ID: <875x49w1i0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH] ALSA: check snd_ctl_new1() return value in multiple drivers
In-Reply-To: <tencent_403B9762AF1B7AD13577D70C061780768C07@qq.com>
References: <87bje1w34u.wl-tiwai@suse.de>
	<tencent_403B9762AF1B7AD13577D70C061780768C07@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 59B1266E9B
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]

On Wed, 27 May 2026 12:55:36 +0200,
Zhao Dongdong wrote:
> 
> On Wed, 27 May 2026 12:36:17 +0200, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Wed, 27 May 2026 11:09:23 +0200,
> > Zhao Dongdong wrote:
> > > 
> > > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > > 
> > > Check snd_ctl_new1() return value before dereferencing in:
> > >   - es1938
> > >   - cmipci
> > >   - ymfpci
> > >   - ice1712 (aureon, ice1712, ice1724)
> > >   - gus
> > >   - aoa (layout)
> >
> > Could you split the patch for each driver?  All changes look
> > individual, and that makes easier to backport to older kernels.
> >
> >
> > thanks,
> >
> > Takashi
> 
> Thanks for your review.
> OK! 
> Originally, this was six separate patches, but I was worried that might be off-putting or cause you trouble, so I merged them into one.

If the changes were systematic changes that are simply done by
scripts and applied to tons of allover places, a tree-wide big patch
would make sense.  But a case like this, often individual changes are
preferred.


thanks,

Takashi
