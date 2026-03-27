Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD18D25771
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 16:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629595; cv=none; b=iBzesbHUpO/e0hTRcG+ywGwCNoCtgprKJPIouGsOSagNlgC6yi3e3w5JvGJNf0GhLIQtLFmFQKdlUiVNPVGP/8n7u+2qqzKL/rrCDczq+6+V8cXgQJRglVTkQsAwKI0yLexqRkx2vEr0puNggioC6gSFIY+5sQS4jfr4EFtf0wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629595; c=relaxed/simple;
	bh=NgWCvAUYeXljxnXnApLV08/IzrxDMQZamsKARddfV2o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LS5NaPvzn6fCQY/CN0qrswQY5nczLOyLaB6OtlKW8mKHDwbDuZxmVWLbq5J29WcMGczlpV5ZkQeTu7rjg7jvnywXT5NGegThH3on0tnrBxGjkCQiKZyhAYhHu0GkmzA6wTGTQMo5XjjvWE8Ne4VaTJCT0jEKw8aI+oEN8GLK+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h8S7ndp4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ChyvCOYg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yekZkJJc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aBd00KRf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h8S7ndp4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ChyvCOYg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yekZkJJc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aBd00KRf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0BDE5BD17;
	Fri, 27 Mar 2026 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774629592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSBWTU4h9RctnP1pbi/9ZLGE9kTl+5TU0rOISqDLeec=;
	b=h8S7ndp47Zzc21E233ZB62qQhUdCu36nCLgDbhiR500B6gN+0uNI7tbhWAuYY39heRuT+/
	rbSdC1XgEncBR/IQm0I5UvnVmK8fvKlnjKVoPfd2cAAKIfL4qm3A7QOqIohFw6wqzw093q
	gZHyz621CfmqoIx2627YxoFrimbCpiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774629592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSBWTU4h9RctnP1pbi/9ZLGE9kTl+5TU0rOISqDLeec=;
	b=ChyvCOYgldcSF0JtG67b6MGy4UYUpRo3rWMO9WcuDRGRqREhu/27DJky1+fj7/MiWgBpFU
	fZc8xTB/tom89MCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yekZkJJc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aBd00KRf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774629591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSBWTU4h9RctnP1pbi/9ZLGE9kTl+5TU0rOISqDLeec=;
	b=yekZkJJcmfYL0qhXh2gXklUgsAJs6V4VrSGwwvogu9xKo2Z8DqEcgIYUqg0aEW/BvU73oC
	n3wkmzjb662JV9hDI5Nu4v0dMC0hv1zGKERMXuwEW4QhV4QyUCjgMdrhYiB1oer3Q6c45z
	/qvh11ZeVYuuHO9Sms232cqzhHUaHvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774629591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSBWTU4h9RctnP1pbi/9ZLGE9kTl+5TU0rOISqDLeec=;
	b=aBd00KRfBYdFxzd2h7Dpua2CquL/F5Nx2HgSx2Xy7jL5HeZglYLqC66ogsrtYGjfWrcXAW
	TMy0IDce4FzIO4Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A1E94A0A2;
	Fri, 27 Mar 2026 16:39:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EaNHJNeyxmnnVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 16:39:51 +0000
Date: Fri, 27 Mar 2026 17:39:51 +0100
Message-ID: <87zf3tp6p4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by DMI ID
In-Reply-To: <05e1cb0a-18f0-412f-87c6-99319b18af52@amd.com>
References: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
	<05e1cb0a-18f0-412f-87c6-99319b18af52@amd.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,perex.cz];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: D0BDE5BD17
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Fri, 27 Mar 2026 17:15:38 +0100,
Mario Limonciello wrote:
> 
> 
> 
> On 3/27/26 10:57, Stuart Hayhurst wrote:
> > This motherboard uses USB audio instead, causing this driver to complain
> > about "no codecs found!".
> > Add it to the denylist to silence the warning.
> > 
> > The first attempt only matched on the PCI device, but this caused issues
> > for some laptops, so DMI match against the board as well.
> > 
> > Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> 
> Thanks!
> 
> Takashi,
> 
> Probably worth asking - why is the "no codecs found" ERR in the first
> place?  There are obviously designs out there like this, should the
> ERR message be simmered down?

Although HD-audio is a bus that can be dynamically enabled / disabled
codecs, it's been supposed to be rather static and exposed only if
there is really a need for it -- that is, only if there is a codec on
it.  So "no codec" is seen as an error for now if you try to
initialize the HD-audio controller.

We may downgrade it, but the situation is still not ideal either; the
driver is still bound without serving anything useful, and it needs to
react for the PM and other things.  Since the probe of codecs happens
after the driver probe stage, the driver can't go away by itself,
unfortunately.


thanks,

Takashi
