Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA15E155741
	for <linux-sound@vger.kernel.org>; Sat,  2 Nov 2024 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730542060; cv=none; b=L1jm3zfPqczZup0jXXM+AzdCQYxjnToJFbnRSUJPMtWTDnWBf39iPCRbVoffYZDdNNRqTK1S9b3QK2n/LzBBP/TM8phCXqbPrKKz7c3PbeJ+LTMSbAB3DjhbACrUg2mDQ1CA1IqVaVfhwR9LqK2Ac4wPvUEv/1yHDrxUZ47PNNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730542060; c=relaxed/simple;
	bh=i+1z3Ip6El4BgnqJld5MEpQ8YfC12QTIUJUw6yNAjqE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=laMnoMcvawrr4mkX8ArKW4T9JUAv9RiCSBkEE3UbaCP2jS+U5XsG0P7hAjR9wfLaDnrqXKBaAFQjkC0U0j85C8QZOTF+0clwO546XqDtjF0diBY1wdF0AwR0QFUCiJx/faNBE5QvA2xKJ90jfha3ESqT8BQk9OEEp/WPbUgaucE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MAx7+UUm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DIy9HG23; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MAx7+UUm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DIy9HG23; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MAx7+UUm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DIy9HG23";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MAx7+UUm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DIy9HG23"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA3A31FD6D;
	Sat,  2 Nov 2024 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730542056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ii1jxKMyvhiu1yIxPCn8a7PqmniINOyx+GgWlnpkmdA=;
	b=MAx7+UUm59vL5Xdxlo+5QW1KQ5ZsQhuYpDgfHgDbNTPogU8DKocdhsDEq9H/FrQLXpzc7k
	LSH28aG4dUolcBNjNZGRV0THVgkbiJiGGYkKxnY6WpgZ0oS/yefwIK54H15PFerRfk1sxH
	a6tHqBnYSpNyyCE4SjWfbZQvG0dOp98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730542056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ii1jxKMyvhiu1yIxPCn8a7PqmniINOyx+GgWlnpkmdA=;
	b=DIy9HG23uJX/J6IBu7mNFC7rQruhnAjN4WyP53Gds1dFLSUJ2TiorT3r83W3bQMWVt+Qg5
	qek6tFgHhvZtuYDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MAx7+UUm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DIy9HG23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730542056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ii1jxKMyvhiu1yIxPCn8a7PqmniINOyx+GgWlnpkmdA=;
	b=MAx7+UUm59vL5Xdxlo+5QW1KQ5ZsQhuYpDgfHgDbNTPogU8DKocdhsDEq9H/FrQLXpzc7k
	LSH28aG4dUolcBNjNZGRV0THVgkbiJiGGYkKxnY6WpgZ0oS/yefwIK54H15PFerRfk1sxH
	a6tHqBnYSpNyyCE4SjWfbZQvG0dOp98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730542056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ii1jxKMyvhiu1yIxPCn8a7PqmniINOyx+GgWlnpkmdA=;
	b=DIy9HG23uJX/J6IBu7mNFC7rQruhnAjN4WyP53Gds1dFLSUJ2TiorT3r83W3bQMWVt+Qg5
	qek6tFgHhvZtuYDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FA4913736;
	Sat,  2 Nov 2024 10:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Og7RIej5JWe5DgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 02 Nov 2024 10:07:36 +0000
Date: Sat, 02 Nov 2024 11:08:41 +0100
Message-ID: <87r07ut0ba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: Don't free interrupt when suspending
In-Reply-To: <cc57a1bb-719f-4840-a84f-ceb7f03ad061@gmail.com>
References: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
	<87h68ruzy1.wl-tiwai@suse.de>
	<cc57a1bb-719f-4840-a84f-ceb7f03ad061@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BA3A31FD6D
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 01 Nov 2024 10:49:23 +0100,
Heiner Kallweit wrote:
> 
> On 01.11.2024 09:21, Takashi Iwai wrote:
> > On Thu, 31 Oct 2024 20:32:52 +0100,
> > Heiner Kallweit wrote:
> >>
> >> There's no need to free/re-request the interrupt on system suspend.
> >> PCI core takes care, using functions like pci_restore_msi_state().
> > 
> > Well, it wasn't always true for hibernation in the past,
> > e.g. snd-intel8x0 driver had to deal with it.  I guess it's no longer
> > needed for modern platforms for HD-audio, so I'm going to take this
> > for 6.13.
> > 
> Interesting, do you have any link to what the issue with intel8x0 was?
> In the commit history I didn't find something related at a first glance.

I also don't remember exactly, sorry.  It was decades ago.

The old bug entry
  https://bugzilla.kernel.org/show_bug.cgi?id=219416
showed why the irq handler was freed at suspend on intel8x0.  My vague
memory says that this was the original fix, and there was another bug
report of hibernation issue.  I'm no longer sure whether it was
intel8x0, though -- it might be another PCI sound driver, too.
But the only certain thing is that it was tad old issue.

> Maybe also PCI core simply is more mature meanwhile.

Hopefully, and I bet for it by taking a risk to apply your cleanup :)


thanks,

Takashi

> Heiner
> > 
> > thanks,
> > 
> > Takashi
> > 
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  sound/pci/hda/hda_intel.c | 13 -------------
> >>  1 file changed, 13 deletions(-)
> >>
> >> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> >> index b4540c5cd..9fc5e6c5d 100644
> >> --- a/sound/pci/hda/hda_intel.c
> >> +++ b/sound/pci/hda/hda_intel.c
> >> @@ -1040,14 +1040,6 @@ static int azx_suspend(struct device *dev)
> >>  	chip = card->private_data;
> >>  	bus = azx_bus(chip);
> >>  	azx_shutdown_chip(chip);
> >> -	if (bus->irq >= 0) {
> >> -		free_irq(bus->irq, chip);
> >> -		bus->irq = -1;
> >> -		chip->card->sync_irq = -1;
> >> -	}
> >> -
> >> -	if (chip->msi)
> >> -		pci_disable_msi(chip->pci);
> >>  
> >>  	trace_azx_suspend(chip);
> >>  	return 0;
> >> @@ -1062,11 +1054,6 @@ static int __maybe_unused azx_resume(struct device *dev)
> >>  		return 0;
> >>  
> >>  	chip = card->private_data;
> >> -	if (chip->msi)
> >> -		if (pci_enable_msi(chip->pci) < 0)
> >> -			chip->msi = 0;
> >> -	if (azx_acquire_irq(chip, 1) < 0)
> >> -		return -EIO;
> >>  
> >>  	__azx_runtime_resume(chip);
> >>  
> >> -- 
> >> 2.47.0
> >>
> 
