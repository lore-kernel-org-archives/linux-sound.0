Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E6247F3A0
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469625; cv=none; b=unEgUD9+BoNyt8+YE4kpRldl782nAI7SGSYNpJ8G4MRiHwVgVuESU78Z8vZPAXFnrsGbMqJ19mJ4jn9kuyzLiObt9XH3PmGnmcFn2VxeD30lZpABvrjA6RhkfSknzuWhmFTDSq7KPh70CBuvD3h+QYSdYri0a5BhjuNPCM7oypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469625; c=relaxed/simple;
	bh=JSKCxVgRmVtu50wZTK+0Uk1Fh1MSH7Vb8v3oSaFUlu8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOB+8FdpktYlT0bU4GaOZ8XHqtUZCx83NkpiKHJ2jmIupm9DyPie3bvHq6H7O5mkYFykoKqWyIW/3lUlEPIWarW/B/Ks9Lb7kSUgsTClUcagkxbyQ7MDp9Sg8UF/OUYLs1DDCzka2rHoZnW94bQAvENrCfMa30nFSpcYlS9GBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ihNy9bB3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YPuuv76z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RYIJF8T5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MMzGUDVJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihNy9bB3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YPuuv76z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RYIJF8T5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MMzGUDVJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77C831FD70;
	Tue, 15 Sep 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789469617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=423/fj9UyI/j0R92yKuhj7kNI6HsySwJ56PZviHBsNE=;
	b=ihNy9bB3r5H4K1x8Z1D67FmMiaMYZopDeYqb4VFfQ8AlppGD8T3oHh6wL4LUSYD9elaRnC
	p0qO2xAigZwMe0shcUZ1NdAZP5PLp3309HzS7Hfyoj5vZni0X3EVClzdBKGp4xmqp5E78I
	jje0Movr1ogNTW22FMXhaQAbtKb2joE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789469617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=423/fj9UyI/j0R92yKuhj7kNI6HsySwJ56PZviHBsNE=;
	b=YPuuv76z1T9vyMGlK+WeB0Ix6eSXxTyHSreV/6hxLBhMJ2x5pi8gTZkCV+PE09Bv31GYTM
	Sngsm4dnmcPDiYBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789469613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=423/fj9UyI/j0R92yKuhj7kNI6HsySwJ56PZviHBsNE=;
	b=RYIJF8T5FGbTIyJTe+uRuws0OYW+HxH6EQ/RjKD02x1H4jDcYe9IriXNubopW7j1qYg2iG
	X+41JWHcaonnaBLK3+Vl/uiTEToeSYi9fU4kPwOCKtXbG+F7YgZnIjB4ysfhBdQryAJyUP
	b4HPiSNbD38Bs/Be+JXNQ+xAxfz5k+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789469613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=423/fj9UyI/j0R92yKuhj7kNI6HsySwJ56PZviHBsNE=;
	b=MMzGUDVJj7PlvWo+i8uAKtAu6QLV86ls1a9ibfa3F9kICwTz44HIuuaCGEaFRuKSg6J/OO
	IUBbwoweHZUclLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3392C13432;
	Tue, 15 Sep 2026 10:53:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h8jfAq0jqWqfRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Sep 2026 10:53:33 +0000
Date: Tue, 15 Sep 2026 12:53:32 +0200
Message-ID: <87eceun5ub.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: "otzelot2021@outlook.de" <otzelot2021@outlook.de>,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [RFC] ALSA: how should a card name that is not ASCII be exposed?
In-Reply-To: <7723e39f-982d-47cd-8322-ed0e71d99290@perex.cz>
References: <AMBP191MB2886BF4BED02C050FB4D6B76CEBB2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
	<7723e39f-982d-47cd-8322-ed0e71d99290@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[outlook.de,suse.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 14 Sep 2026 18:59:53 +0200,
Jaroslav Kysela wrote:
> 
> On 9/14/26 18:46, otzelot2021@outlook.de wrote:
> 
> > The larger option
> > -----------------
> > 
> > Add UTF-8 successors of the three fields, kept alongside the ASCII ones
> > rather than replacing them, allocated on demand like card->components
> > now is.  Either side may be empty, so nothing may assume a name is
> > present and every reader keeps a fallback.  Drivers fill both and keep
> > them semantically in sync.
> > 
> > For user space this needs no new ioctl: SNDRV_CTL_IOCTL_CARD_BYTES
> > already carries a variable-length card string with a type discriminator
> > that was added for exactly this kind of extension, so three more type
> > values would do.  Nothing existing changes, and an old kernel returns
> > -EINVAL for an unknown type, which a reader can treat as "use the ASCII
> > field".
> > 
> > id, driver and components would deliberately keep no UTF-8 counterpart
> > for the time being. They are not display names: id is the unique handle
> > and part of path
> > names, driver is what alsa-lib matches configuration against, and
> > components is a token list.
> 
> This looks like a best extension proposal IMHO. The current apps don't
> have any assumptions that the fields are in other character coding
> than ASCII.

I personally find it OK to have UTF-8 strings in short / long / mixer
names.  That's no new problem, and it's been over decades.  Of course,
a broken letter at the end could be a problem and we can fix it in
either kernel or alsa-lib, too.

OTOH, I'm fine with the extension, too.  That doesn't sound too
intrusive.

But, an open question is what should we fill into the short/long/mixer
names in ASCII, instead of vendor / product names?  With embedded IDs
like "USB 1234:abcd"?  Or shall we still pass the vendor / product
names if they are ASCII only, and falling back only if they are
non-ASCII?


thanks,

Takashi
