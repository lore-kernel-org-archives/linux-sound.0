Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E9320CD3
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006766; cv=none; b=CT8xDrIgTIAMtrrEZDH53Wq8fO3LFQ9JF6FGM8d4jz/RJQVshs3x+27sQS6oKZywMexhTTj2ff32O2KQJLkxfcqKidK6Ae7toleraKUIVIUy1UwdzHwUIRdJxCLtvO7KdEXK5R72dpapjgZ2B8s59g7PAO5Dl6BSdwKVvTN8AlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006766; c=relaxed/simple;
	bh=Mp+cKPSgpTRiNi+mobMripv0DuUKNlSRx9neeIklcMg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MAwC2oCZhEU6QL4kRTB3cMOHoVZTmmHNevQX9bQdOc89dH5Z1q3Z2hwwY1g208NWHrL7ND2jjm1CRVy4Cj8Vr+qMPUdeRFLK4fABaOSv02HI9U9q+VG9whyTgHnd1/bYEJpguNZC681Vmy7dYBUI/2eogdhnv6vWt2wGhFqLMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cXWqAp0h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uO42YJPn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=srZrxHKf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jgCtNr2I; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cXWqAp0h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uO42YJPn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="srZrxHKf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jgCtNr2I"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C14383E19;
	Tue, 14 Jul 2026 05:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784006763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asQalq8EhLHPcnUAnc0qVGrAgeFLVYY7ZljSq4f0AGo=;
	b=cXWqAp0hSgwvLjUN0wTbxFIWI5gJTv+2mS7sfbYF9B/YdpstynjR+pamtJb4iferUe/k4e
	8gbYm2UXt2krr75ZFYXkuQYls8fR9hVmCQi0JedDXgK9T7lP1T1eLRQZjzOMXyDwCB8ud8
	QNpiaQg8XjCVuItCDKMcQdAJwEbPbsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784006763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asQalq8EhLHPcnUAnc0qVGrAgeFLVYY7ZljSq4f0AGo=;
	b=uO42YJPnGoESNwpAdXobIFE5lMGVB4f/pFppAHiXzABKkTkzF4noA8iMpc5O039a9NLj1x
	U7SfsNct1UExw9Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784006762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asQalq8EhLHPcnUAnc0qVGrAgeFLVYY7ZljSq4f0AGo=;
	b=srZrxHKfdHmJAtEshNTema9nli+5nyHno0QGnBmxHOaiX4KIUdLocMGBHW7Cg6s0m1m+pD
	mtze4lw0fGCr97iEKV0FwodhfzO9q/Sd/1JWlqk6TXHOL2sT4N+ox8TdrBbwT9OZIf7awX
	Ugp5iTwxLK+kx4nKumfVG7ey8n4Qqgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784006762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asQalq8EhLHPcnUAnc0qVGrAgeFLVYY7ZljSq4f0AGo=;
	b=jgCtNr2IFLejd1hkW82XhMJKKzVtgLBTICayEsAgIX7PBO7Ab/pWQkABzDCelP2hVDWhQd
	Ca20CYo0BRE9/ZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97165779AE;
	Tue, 14 Jul 2026 05:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jUOMI2rIVWpyegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 05:26:02 +0000
Date: Tue, 14 Jul 2026 07:26:01 +0200
Message-ID: <87tsq2jg5y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Check snd_hda_power_pm construct error before executing verb
In-Reply-To: <20260714021351.332483-1-songxiebing@kylinos.cn>
References: <20260713020427.300628-1-songxiebing@kylinos.cn>
	<20260714021351.332483-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Tue, 14 Jul 2026 04:13:51 +0200,
songxiebing wrote:
> 
> Hi Takashi,
> 
> At present, this patch may cause misjudgment for some platform devices.
> If rpm is not enabled on the platform device, the default runtime_status is suspended,
> which will result in the inability to write commands properly.
> 
> Could you please drop this patch? Sorry for the trouble.

OK, dropped now.


thanks,

Takashi

> >On Mon, 13 Jul 2026 04:04:27 +0200,
> >songxiebing wrote:
> >> 
> >> From: Bob Song <songxiebing@kylinos.cn>
> >> 
> >> When userspace writes 1 to /sys/bus/pci/devices/XX/remove to remove HDA PCI device,
> >> the codec device enters runtime suspended state early. The snd_hda_power_pm RAII
> >> constructor fails to wake up codec, but the original code ignores pm.err and continues
> >> to execute hda verb commands. After pci driver remove callback completes, devres
> >> automatically iounmap the BAR virtual address bus->remap_addr, resulting in access
> >> to invalid unmapped MMIO address and triggering page fault BUG.
> >> 
> >> Add error check for snd_hda_power_pm constructor result:
> >> 1. Detect pm construction failure when HDA core device is suspended;
> >> 2. Print warning log with command and error code for debug;
> >> 3. Return early to skip subsequent hardware register access, avoid page fault crash.
> >> 
> >> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> >
> >Applied to for-next branch.  Thanks.
> >
> >
> >Takashi
