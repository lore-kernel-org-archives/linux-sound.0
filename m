Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5619D88F
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094791; cv=none; b=Ai1ASa1betA1wRJXTNjAFIZFG4cCIsuzlsxGt9Uct5ZiSsjOVetYRdLJGIMljwas6QQjB6jlSYxLnotaGDKL+aGkP209Mg/WpgklQEx2sYr6p1jWyq5Jder8UZlu5qh49Kge+rD0MK4qZoLJ1Ao5wNLDlFzuGlJg7eOywGpk+hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094791; c=relaxed/simple;
	bh=qlDqcd5IJFEU63T0nKujTmHZtbun/kmAufnl/3wbOKk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSn0i4KhOrBx8uvY0tfaRSDyfVFzs2fl9nhOOFdePECT/W5HrFZNn0YJhM6yCWjC9tgo2BgQTmd5/z8aayKP4uvGogJwcBqeaZUJKYjLndDcnCrdLqgJX2L6kD8Weng2qTNXvT+o0dWET8fv/kLEX4IByPbCnQv532Ml9g6i0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFMy8cHO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1hDEUNHI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFMy8cHO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1hDEUNHI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFMy8cHO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1hDEUNHI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFMy8cHO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1hDEUNHI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A93F21A8C;
	Wed, 13 Aug 2025 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755094788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/K1kjAk79PPYKa/Q04xGeNe8nCvhQq4mTpm91DXOSGs=;
	b=fFMy8cHOMr2of95B4yp0/btcARrugucOv4AnmgRonVbYLFMgtLxb2+s9gVO2BeLb2gOJ3E
	6mo/LRYkNxdl/OZzKsBE+fNT/k2un0WsB/QuAdGiiL4Glo9ckr/jaw9cfPy27jy67NKRqh
	H/2MNfHULzjWnLgHyIbPDdsyzP9lCFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755094788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/K1kjAk79PPYKa/Q04xGeNe8nCvhQq4mTpm91DXOSGs=;
	b=1hDEUNHIwF+H69Qsyk1pEQmpIExyKCi5K3VwQBphOraOEQSMui3XMDn9zrSyOyDUHN4br3
	7dLjnRqJsgRMyrDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755094788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/K1kjAk79PPYKa/Q04xGeNe8nCvhQq4mTpm91DXOSGs=;
	b=fFMy8cHOMr2of95B4yp0/btcARrugucOv4AnmgRonVbYLFMgtLxb2+s9gVO2BeLb2gOJ3E
	6mo/LRYkNxdl/OZzKsBE+fNT/k2un0WsB/QuAdGiiL4Glo9ckr/jaw9cfPy27jy67NKRqh
	H/2MNfHULzjWnLgHyIbPDdsyzP9lCFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755094788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/K1kjAk79PPYKa/Q04xGeNe8nCvhQq4mTpm91DXOSGs=;
	b=1hDEUNHIwF+H69Qsyk1pEQmpIExyKCi5K3VwQBphOraOEQSMui3XMDn9zrSyOyDUHN4br3
	7dLjnRqJsgRMyrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49FCE13929;
	Wed, 13 Aug 2025 14:19:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DXRSEASfnGi3awAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 14:19:48 +0000
Date: Wed, 13 Aug 2025 16:19:47 +0200
Message-ID: <87ldnnwbgc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH 23/25] ALSA: hda/core: Use guard() for spinlocks
In-Reply-To: <aJycvcDOWJ4L96QD@black.igk.intel.com>
References: <20250811100807.7962-1-tiwai@suse.de>
	<20250811100807.7962-24-tiwai@suse.de>
	<aJycGg2zItImFTL0@black.igk.intel.com>
	<aJycvcDOWJ4L96QD@black.igk.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 13 Aug 2025 16:10:05 +0200,
Andy Shevchenko wrote:
> 
> On Wed, Aug 13, 2025 at 04:07:22PM +0200, Andy Shevchenko wrote:
> > On Mon, Aug 11, 2025 at 12:07:57PM +0200, Takashi Iwai wrote:
> > > Replace the manual spin lock/unlock pairs with guard() for code
> > > simplification.
> > > 
> > > Only code refactoring, and no behavior change.
> > 
> > Wishful thinking :-)
> > (At least) this broke my builds
> > 
> > /sound/hda/core/stream.c:954:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
> >   954 |         guard(spinlock_irq)(&bus->reg_lock);
> >       |         ^
> > /include/linux/cleanup.h:405:2: note: expanded from macro 'guard'
> >   405 |         CLASS(_name, __UNIQUE_ID(guard))
> >       |         ^
> > /include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
> >   290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
> >       |         ^
> > <scratch space>:36:1: note: expanded from here
> >    36 | class_spinlock_irq_t
> >       | ^
> > 1 error generated.
> > 
> > `make W=1`, clang-19.
> 
> Need to add this is with patches applied from
> https://lore.kernel.org/lkml/20250804220955.1453135-1-dan.j.williams@intel.com/
> as otherwise it doesn't compile differently (in other places).

Thanks for the info.
OK, it seems that the patches need some workarounds for clang.
Will drop for now, then.


Takashi
