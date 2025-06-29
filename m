Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF30181ACA
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751188949; cv=none; b=u3UL1yc8D2dLrJ4r48g3Rstl70VOJeRkKtxRFDjuvHpWKTVjRsSQ75oUwvoq8Fuq/pswJhvImwDDt8/d7M5U6tJiKhd1L3y7nkD6fEdhMKFYCPTCt/scxNy8oM2U0GhXax1p4XhzGV6QsyeUoJ8yOy9xOYiv5cOXLcCiDaOgG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751188949; c=relaxed/simple;
	bh=1LgVz1bKS8dv15MTyqCwLL7Wt8lgSeFgc2JwtZu8uJs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffpYqYAj+95BKiJ0R/pqzkAS+oIArzpP2zijGYrlpn9pPlLDbwdvdFpZbjChAW5H1gilY/NmaC6PdCrwQBj/yx7vt9TTjQNUpGdN+pKTxILf6Wj0NMkr0mWMGJZxinJmWiD5FVh3toNhrjraszNnsOOsahSqwPlLQ3xx9f0tga0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e4x0kkfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVrXhUWP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=viu+AmYC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqS0ldwt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e4x0kkfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVrXhUWP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="viu+AmYC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqS0ldwt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B22FF1F388;
	Sun, 29 Jun 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751188946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eKFd3bdD7SLHAernXaDTuQkMEOYIjxETrMyPe7+rI+8=;
	b=e4x0kkfvO2vgYo8p+e12M3w+ZA7VtgMZzlFEdJyfMktX86fEqOdsgd9RXEfDruuJBm7Vhj
	ArQX/XFZrGyIRXn01qitb0jEkhalvHZZh/X2zc1RLlEzzak+Qu9vW6H5O/QfZmWOSFXeDt
	Ej6+Tqd/2Q4ARZAAN4GshUTEwbmA128=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751188946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eKFd3bdD7SLHAernXaDTuQkMEOYIjxETrMyPe7+rI+8=;
	b=RVrXhUWPXzDEadTKY04uKE/ezyTlOqn/jHWNojBnXObKkec+pwJ/2NFEovJU9P8yv9cxeh
	LEkbSQjBeA3Fs1Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=viu+AmYC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zqS0ldwt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751188945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eKFd3bdD7SLHAernXaDTuQkMEOYIjxETrMyPe7+rI+8=;
	b=viu+AmYCGYL88Yja7r+pyaBQIELR5dKV3FbQZyJqWv+nm1FWyT1pYfVesaaIc3P2Ya3Peg
	Y2z0AuZ3MK+mUuKLnTQeq/Rn1BFkSiMGbFpBd1dv+0sWQ8OFfMI1iL2aIO5OqVmZYaH+Kn
	QaZWjkb10thinZa/xe7IResH3ZNoS2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751188945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eKFd3bdD7SLHAernXaDTuQkMEOYIjxETrMyPe7+rI+8=;
	b=zqS0ldwt3CiWp7ihKDlqYwpBnh4mIwJR5fioHIixSbI8mU9nX8utf/erVEvMs9q38WSbiv
	Kq/I2Y71xc+zfyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EB161379A;
	Sun, 29 Jun 2025 09:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KhY4IdEFYWjHMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Jun 2025 09:22:25 +0000
Date: Sun, 29 Jun 2025 11:22:25 +0200
Message-ID: <87h5zygawe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC] Reorganizing HD-audio driver code?
In-Reply-To: <e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
References: <87ldpdgzle.wl-tiwai@suse.de>
	<e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B22FF1F388
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Fri, 27 Jun 2025 15:22:20 +0200,
Richard Fitzgerald wrote:
> 
> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
> > Hi,
> > 
> > HD-audio driver is known to be quite messy in both file structures and
> > its design, but until now I haven't touched its files paths so much
> > because I set a higher priority for the easiness of backport to stable
> > kernels.  But, you can't leave garbages forever, it's been already
> > high time for a large clean up.
> > 
> > So I tried a quick code reorganization, and put the result in
> > test/hda-reorg branch of sound.git tree.
> >    https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
> > 
> > The basic idea is to move the code from sound/pci/hda/* into different
> > subdirectories in sound/hda/ per functionality, as most of the stuff
> > are independent from PCI, but rather HD-audio bus specific.
> > 
> 
> This all seems reasonable to me. I always thought it strange that there
> is a sound/hda directory but most of the HDA support isn't in that
> directory.

Thanks for your review!

It's a long story: at the time of ASoC Intel HD-audio support, we
thought to implement more ASoC-friendly way of HD-audio controller and
codec drivers, e.g. adapting DAPM and others.  So we began with the
factoring out the HD-audio basic core stuff to the common directory
sound/hda/*, while keeping the rest legacy stuff almost as is.  But
ASoC implementation didn't fly in the end from various reasons, and
the legacy HD-audio stuff was good enough for the actual use cases;
it's too bit to fail, after all.

> > The Realtek codec is split further to smaller pieces (which was really
> > huge).
> 
> Yes, that file was very confusing having support and quirks for so many
> Realtek parts all in one file.
> 
> > The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
> > subdirectory:
> 
> That's ok
> 
> > They can be put to each own directory and drop the file name prefix,
> > if we want, too.  Let me know if Cirrus and TI people would like to
> > split to more subdirectories.
> 
> I don't mind either way.
> The hda_component* files are common to the amps and the realtek driver
> so I wonder whether they belong in helpers. They are only utility
> wrappers around the kernel component-binding APIs.

Right.  So far, just because it's basically only binding with
side-codecs, I put into side-codecs subdirectory.

> > *HOWEVER* the biggest question is: whether it's worth?
> > 
> > Essentially, this makes almost impossible to make a patch for stable
> > trees from the original commit as is; one has to translate the file
> > paths and adjust manually in each patch.
> 
> Depends which file you are patching and how much it has changed.
> Git can figure out file renames (and changing directory is a rename).

I'm afraid that the Realtek codec changes might be hard to track
automatically.  Maybe the Cirrus side-codecs stuff would work.

> > Also, of course, if anyone is working on HD-audio stuff right now, the
> > work had to be adjusted to the new file path.  It'd be one-off action,
> > though.
> 
> Speaking only for Cirrus, I don't think this makes much extra effort
> for us. Our amp drivers have only changed location, so that should be
> trivial. The other file we change is patch_realtek.c but that typically
> is only 1-line quirk entries.

OK, thanks for confirmation!


Takashi
