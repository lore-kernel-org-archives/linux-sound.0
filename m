Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214FE32F740
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 17:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764350573; cv=none; b=sXsQG8GtvjLvMRmGeErfQdUCmnSTowaYwRainVyrOkn1SZe4wtlFEe46Mh1zs7K2omfYqoLmlqKIHpB6WFlMvnFhShyBNkO7nzSJtJlFd6Qp5jzY/09yu5V3FfcwvENFRaw1NMDEig08+XCNCHtFCvA+KjtAAa/h3g6GVqhAI9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764350573; c=relaxed/simple;
	bh=j4ctd5LCVnnx034IAzXZZ4pnBuDLNCAqhpDGeW8rfg4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRTzQeh+9T7rZw/10rsfxVHElowCyRxBZUxMUFeJ3oy3FJK0nP829bnG2BHEgLAoXYA8UjfvItriUke8JgmNCoZrIyFCqkkABjkqp2aVcK1goEgQjnh3o9miXSRnUH1ZzhnSoY6XdCIUnTbHEMSghbsKL45zucPOJWlaEQuxKTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bK3IE/m3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=44lePi+6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bK3IE/m3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=44lePi+6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bK3IE/m3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="44lePi+6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bK3IE/m3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="44lePi+6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 558D15BDA5;
	Fri, 28 Nov 2025 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764350568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRh2wCcILSm5accuChVjos/DcYSloCqTL4PctIDhz7M=;
	b=bK3IE/m3EbTyS2eAuQvTZ57OrqIuqd/zsNA/9MhcUMuKCktaKeKNEbwySCtxe7wj+N20Jp
	TQNxce0BIyDjtq4fb1RgM51TqGlQFPtQaC6c3/g/oa99tm/s8XRhpnCRtafINVcIIs5XY+
	OTv0qWtRuP7we1xZJ7XfKPY1pxdCBqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764350568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRh2wCcILSm5accuChVjos/DcYSloCqTL4PctIDhz7M=;
	b=44lePi+6R+Prd8f/kADDodEaYOz9CEXxk8IuVfwQJ6FY/7cPGPV0JVimHYaB8xTeG5vyr0
	NXJrmIRUX0olHcCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764350568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRh2wCcILSm5accuChVjos/DcYSloCqTL4PctIDhz7M=;
	b=bK3IE/m3EbTyS2eAuQvTZ57OrqIuqd/zsNA/9MhcUMuKCktaKeKNEbwySCtxe7wj+N20Jp
	TQNxce0BIyDjtq4fb1RgM51TqGlQFPtQaC6c3/g/oa99tm/s8XRhpnCRtafINVcIIs5XY+
	OTv0qWtRuP7we1xZJ7XfKPY1pxdCBqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764350568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRh2wCcILSm5accuChVjos/DcYSloCqTL4PctIDhz7M=;
	b=44lePi+6R+Prd8f/kADDodEaYOz9CEXxk8IuVfwQJ6FY/7cPGPV0JVimHYaB8xTeG5vyr0
	NXJrmIRUX0olHcCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 010C03EA63;
	Fri, 28 Nov 2025 17:22:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BusjOmfaKWm8AwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Nov 2025 17:22:47 +0000
Date: Fri, 28 Nov 2025 18:22:47 +0100
Message-ID: <87ecpi842g.wl-tiwai@suse.de>
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
In-Reply-To: <SEYPR06MB62269EEF81C53AC28278694982DFA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
	<87pla3joop.wl-tiwai@suse.de>
	<SEYPR06MB62269EEF81C53AC28278694982DFA@SEYPR06MB6226.apcprd06.prod.outlook.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Thu, 27 Nov 2025 10:44:26 +0100,
Joakim  Zhang wrote:
> 
> [...]
> > >  include/sound/hdaudio.h     |  3 +++
> > >  sound/hda/core/controller.c | 25 +++++++++++++++++++------
> > >  sound/hda/core/stream.c     | 17 ++++++++++++++---
> > >  3 files changed, 36 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h index
> > > 4e0c1d8af09f..61b41a014f4a 100644
> > > --- a/include/sound/hdaudio.h
> > > +++ b/include/sound/hdaudio.h
> > > @@ -293,6 +293,9 @@ struct hdac_bus {
> > >       const struct hdac_bus_ops *ops;
> > >       const struct hdac_ext_bus_ops *ext_ops;
> > >
> > > +     /* address translation from host to hdac */
> > > +     dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus, dma_addr_t
> > > + addr);
> >
> > This should be rather added to hdac_bus_ops instead.
> >
> > Or, we can just add addr_offset field in hdac_bus instead of yet another
> > callback.  Then the change would be simpler.
> >
> 
> Hello Takashi,
> 
> Sorry for late updating since I am involving in other tasks recently.
> 
> I tried to add addr_offset field in hdac_bus for the address translation, but met the issue,
> e.g.
> On our platform, if HOST address is 0xd0c09000, HDAC address is 0xd0c09000 - 0x90000000 = 0x40c09000.
> 
> If we use the pattern, HOST_addr + addr_offset = HDAC_addr
> For 64bit host,
> then addr_offset shound be 0x70000000, 0xd0c09000+0x70000000=0x1_40c09000, it will update both lower 32bit and
> upper 32bit into hda registers. However, hda controller in our audio subsystem can only support 32bit address, if hda
>  sending address more than 32bit, it would not work.

Hm, I don't understand.  It we define something like

	dma_addr_t addr_offset;

in hdac_bus, and the driver setting

	bus->addr_offset = -0x90000000;

then a calculation

	dma_addr_t addr;

	addr = bus->rb.addr + bus->addr_offset;
	
will lead to the very same result as your callback, no?
Or am I missing something?


thanks,

Takashi
