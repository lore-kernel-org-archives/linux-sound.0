Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E9E3783BB
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779093; cv=none; b=X1ZLwDmkRyF053ETc7bY1Ebjjw4Gv8BmwMLPOWBbtJgFAbwLNgbelXsR0xJePBdsuU7kQyYBboTmLcimksZVC/Nb+FJ1V2HfZwzY/5lrYRyLSMFxO3yOy4e+4FlBTFaE2in3/CSMkMFwxOf3+6j3voHH89/dmzyenpN/KYM6Ot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779093; c=relaxed/simple;
	bh=hjTh0ermfWOO43uDsDfUsApkU2SzIEyHKy9gVIUv8/U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuZ6OBDR8ECtGKolAXxnfgrPFFgZzr58HmpxmAVOCFz3OnNM6gw9pezN94ghC3oX5e2SPPC4ePg90ZKGuAHVIGJeOcmvdjJWGb9EJgskM0688OrU5zluEhqnBXaCP07dAMQs/1UuqXgp7Ink9zHrLQixA8SuuNA41Nui8rgjvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DYdXDO0H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oVNDML0n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DYdXDO0H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oVNDML0n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYdXDO0H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oVNDML0n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYdXDO0H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oVNDML0n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7EB5F75B7E;
	Thu, 18 Jun 2026 10:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781779090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eQsjOwZXu6cuE0xy7vediBrzJUcFZ5fQGZ9Sn3j/620=;
	b=DYdXDO0HjpdpwrUM0d0T9xzwqTULIqnMcZrJe6HZDC2EtNoTN6/9SwNRQEVGgFkgkGLpTh
	c7xy5x/eujXnjzqL0Bcl3E2n794PIYsxTKq9EmyDRtQHD/GVueA3O1Nh6uwNeAMlIuLd3d
	RoQROSqRm/E81FKzdIEtkwBm8d6B1Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781779090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eQsjOwZXu6cuE0xy7vediBrzJUcFZ5fQGZ9Sn3j/620=;
	b=oVNDML0nmJUmOAKRoMqfUbxqERoSUerHBj+5ub61RDPbIB/0aEf0DRiYDBxkHqq3zxMHzH
	Gz5Ogfs0OUxI1jBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781779090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eQsjOwZXu6cuE0xy7vediBrzJUcFZ5fQGZ9Sn3j/620=;
	b=DYdXDO0HjpdpwrUM0d0T9xzwqTULIqnMcZrJe6HZDC2EtNoTN6/9SwNRQEVGgFkgkGLpTh
	c7xy5x/eujXnjzqL0Bcl3E2n794PIYsxTKq9EmyDRtQHD/GVueA3O1Nh6uwNeAMlIuLd3d
	RoQROSqRm/E81FKzdIEtkwBm8d6B1Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781779090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eQsjOwZXu6cuE0xy7vediBrzJUcFZ5fQGZ9Sn3j/620=;
	b=oVNDML0nmJUmOAKRoMqfUbxqERoSUerHBj+5ub61RDPbIB/0aEf0DRiYDBxkHqq3zxMHzH
	Gz5Ogfs0OUxI1jBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9760D779A8;
	Thu, 18 Jun 2026 10:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8hwJIpHKM2rpMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 10:38:09 +0000
Date: Thu, 18 Jun 2026 12:38:08 +0200
Message-ID: <87bjd8nnfz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: caiaq: fix S4 OOB read and bound the EP1 input parsers
In-Reply-To: <178176259547.3343534.6658931377288378506@maoyixie.com>
References: <178176259547.3343534.6658931377288378506@maoyixie.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 18 Jun 2026 08:03:15 +0200,
Maoyi Xie wrote:
> 
> Hi Takashi,
> 
> Thanks for confirming the Traktor Kontrol S4 out-of-bounds read and for
> the follow-up on the neighbouring parsers.
> 
> Patch 1 is the actual fix. snd_usb_caiaq_tks4_dispatch() loops on the raw
> urb->actual_length. That value is controlled by the device and is not
> required to be a multiple of the 16-byte message block. Once len drops
> below 16 the unsigned "len -= TKS4_MSGBLOCK_SIZE" underflows. The loop
> then keeps walking buf past ep4_in_buf[EP4_BUFSIZE]. The fix iterates
> only while a full block remains, which also discards any trailing partial
> block. The X1 and Maschine arms already floor the length before dispatch,
> so only the S4 arm was affected.
> 
> Patch 2 adds the length checks you suggested to
> snd_caiaq_input_read_erp() and snd_caiaq_input_read_io(). Both are
> reachable through snd_usb_caiaq_input_dispatch(). As you noted,
> snd_caiaq_input_read_analog() and snd_usb_caiaq_maschine_dispatch()
> already have the length floored by their callers, so they are left
> unchanged. The two parsers patch 2 touches are not an out-of-bounds
> access either. Every offset is a fixed driver constant within the 64-byte
> ep1_in_buf. A short reply does make them decode stale data, though, so the
> guards drop such replies per device path. Patch 2 carries your
> Suggested-by.
> 
> Patch 1 carries a Fixes tag and Cc: stable. Patch 2 does not.
> 
> Maoyi Xie (2):
>   ALSA: caiaq: fix out-of-bounds read in the Traktor Kontrol S4 input
>     parser
>   ALSA: caiaq: bound the length in the EP1 input parsers

Applied both patches now.  Thanks.


Takashi
