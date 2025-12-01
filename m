Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5F2E7182
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578470; cv=none; b=IuO9IqzqXVT0YCRO4iPqHwj4rr+MSzHEmuclDAeHavfMllumep7vKYiAO7g7bMQhpTr8eNHgmtVHFw0q8Zyyb12jjpRHq73mnt7k0IwdhgzLvz2dD+Ixh0faEo3yECETWSs9G9E+4E/ZdQtCQPjZRpPrbYYJyBakI1xrnFiCZc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578470; c=relaxed/simple;
	bh=CG8i24/mz2sClXO9Z4WYHvqVvkWCiLpRn1K+K6HxuLw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqGTy53IB7UFfYCNgOubxcX4nUIzBUXezIvCdm+ykZxCdH9fY4Wh0yNAGzlsQBNnS9fUr7G1JOaTV9+RDgix5U7YquEp8VNQXVr9J/P+e5lBZ3yyJa9/q61e81eAGe9S9j8tkWeVdFbYknTg/Vank0QeheUwHqTBPcbXHyBIG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pYLNWuRl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l1kND3Pz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s17wxIhO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qrWjtcND; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pYLNWuRl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l1kND3Pz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s17wxIhO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qrWjtcND"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 376B93379C;
	Mon,  1 Dec 2025 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764578466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HqrAqUREYOgMdrbihNFfVZ5OBi2extLEfpQOjtfKdE=;
	b=pYLNWuRllbg8avaCnfL6HD6BbkTP304Pw8k9Pz4ZcK2kXdGNbO0Jrsz07zvxs5CWufxNoR
	VOX3KQb5YkPfT7aZCni3RATDD6zerfZAHk+JHtvBx5/wACfX64s6Hr4/Yjlktn+gdNfLG1
	42iy02aE4PA0AMN8ynNx0pMi/KUD2PM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764578466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HqrAqUREYOgMdrbihNFfVZ5OBi2extLEfpQOjtfKdE=;
	b=l1kND3PzI8+QaVdokb4vxy9JTwpT7mnbbPYNJ0QXUwWAxXOQ8NpfFLX/WhHKYvdtVJsU6c
	FRNdcXT8oHUcxcCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764578464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HqrAqUREYOgMdrbihNFfVZ5OBi2extLEfpQOjtfKdE=;
	b=s17wxIhO+7GfZqTxBde944bWOsY5PiPwoNHnFbom46aHStNO/yCB2DQdaMmvWFpqZU18qT
	Dll+fnKDeyMuLALN9f1tBQqc9Z4tc84+UPMi/2Bhj72ZENo9AKix6CzNMN+GS/7Fti/IXB
	JcC9BgEchieP/sTGps2tpJrqjc1QZvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764578464;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HqrAqUREYOgMdrbihNFfVZ5OBi2extLEfpQOjtfKdE=;
	b=qrWjtcNDxXU1fLaRk2j4xyRPFBmWWGaGJUtqSpcrQVe170mtYs+aL7mQbSovu47Vu2r8xi
	lxEBV9cdR79y3dAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D50293EA63;
	Mon,  1 Dec 2025 08:41:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EDTEMp9ULWkALQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Dec 2025 08:41:03 +0000
Date: Mon, 01 Dec 2025 09:41:03 +0100
Message-ID: <87cy4yd274.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org"
	<broonie@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org"
	<conor+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com"
	<tiwai@suse.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH V1 2/3] ALSA: hda: add bus callback for address translation
In-Reply-To: <SEYPR06MB62263D352405481E3046320782DBA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
	<87pla3joop.wl-tiwai@suse.de>
	<SEYPR06MB62269EEF81C53AC28278694982DFA@SEYPR06MB6226.apcprd06.prod.outlook.com>
	<87ecpi842g.wl-tiwai@suse.de>
	<SEYPR06MB62263D352405481E3046320782DBA@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,perex.cz:email];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,cixtech.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,perex.cz:email]
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Mon, 01 Dec 2025 09:14:57 +0100,
Joakim  Zhang wrote:
> 
> 
> Hello Takashi,
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Saturday, November 29, 2025 1:23 AM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > Cc: Takashi Iwai <tiwai@suse.de>; lgirdwood@gmail.com;
> > broonie@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; perex@perex.cz; tiwai@suse.com; linux-
> > sound@vger.kernel.org; devicetree@vger.kernel.org; cix-kernel-upstream
> > <cix-kernel-upstream@cixtech.com>
> > Subject: Re: [PATCH V1 2/3] ALSA: hda: add bus callback for address
> > translation
> >
> > EXTERNAL EMAIL
> >
> > CAUTION: Suspicious Email from unusual domain.
> >
> > On Thu, 27 Nov 2025 10:44:26 +0100,
> > Joakim  Zhang wrote:
> > >
> > > [...]
> > > > >  include/sound/hdaudio.h     |  3 +++
> > > > >  sound/hda/core/controller.c | 25 +++++++++++++++++++------
> > > > >  sound/hda/core/stream.c     | 17 ++++++++++++++---
> > > > >  3 files changed, 36 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> > > > > index 4e0c1d8af09f..61b41a014f4a 100644
> > > > > --- a/include/sound/hdaudio.h
> > > > > +++ b/include/sound/hdaudio.h
> > > > > @@ -293,6 +293,9 @@ struct hdac_bus {
> > > > >       const struct hdac_bus_ops *ops;
> > > > >       const struct hdac_ext_bus_ops *ext_ops;
> > > > >
> > > > > +     /* address translation from host to hdac */
> > > > > +     dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus,
> > > > > + dma_addr_t addr);
> > > >
> > > > This should be rather added to hdac_bus_ops instead.
> > > >
> > > > Or, we can just add addr_offset field in hdac_bus instead of yet
> > > > another callback.  Then the change would be simpler.
> > > >
> > >
> > > Hello Takashi,
> > >
> > > Sorry for late updating since I am involving in other tasks recently.
> > >
> > > I tried to add addr_offset field in hdac_bus for the address
> > > translation, but met the issue, e.g.
> > > On our platform, if HOST address is 0xd0c09000, HDAC address is
> > 0xd0c09000 - 0x90000000 = 0x40c09000.
> > >
> > > If we use the pattern, HOST_addr + addr_offset = HDAC_addr For 64bit
> > > host, then addr_offset shound be 0x70000000,
> > > 0xd0c09000+0x70000000=0x1_40c09000, it will update both lower 32bit
> > > and upper 32bit into hda registers. However, hda controller in our
> > > audio subsystem can only support 32bit address, if hda  sending address
> > more than 32bit, it would not work.
> >
> > Hm, I don't understand.  It we define something like
> >
> >         dma_addr_t addr_offset;
> >
> > in hdac_bus, and the driver setting
> >
> >         bus->addr_offset = -0x90000000;
> >
> > then a calculation
> >
> >         dma_addr_t addr;
> >
> >         addr = bus->rb.addr + bus->addr_offset;
> >
> > will lead to the very same result as your callback, no?
> > Or am I missing something?
> 
> typedef u64 dma_addr_t;
> 
> 1)
> dma_addr_t a = 0xd0c09000;
> dma_addr_t b = -0x90000000;

You have to pass with ULL suffix as a 64bit value instead:
  dma_addr_t b = -0x90000000ULL;


thanks,

Takashi
