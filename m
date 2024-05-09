Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4641D2F4A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715238348; cv=none; b=Kg/wO4c1SZs2bTTqHXN2n9DWwROIwLVvxjOHxud6Eag8uzxF/33Mw/y64j4otAKDEYWAH5p3wrKRvhHoZPn+AFHROEK1Pw/PNnQrEVoZTIe8B7vvH738S0iF4g14QDrpiVHh8rOoJGtJ7uXqUCPrP3zgfygAZ3j0NV243bO2QvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715238348; c=relaxed/simple;
	bh=Ed0YTng6KraAmyfu8gDHwHQvjo+NdjA8XgV9V1F0BaQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZ5CWqJyVkaaHzdpvylZlyrNsZzi1fDASKd4t/1qDJ+bZOmA8U7aeSyoM3dqynghs/RNvZuSJItq/9oqMzIeOemYBVf6HNdXKPr1XJR94cdrBSY+dueumcvTedyk9QO/9EopI6cuIsisHJcneues8ws5+hN4rrBo80/Nc2xmNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IbQMjEdR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1+nNf8GY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CRlYs2nB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yVdbUtld; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IbQMjEdR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1+nNf8GY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CRlYs2nB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yVdbUtld"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D23AB5F93E;
	Thu,  9 May 2024 07:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715238344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGAGhg1NYG3zDLaoQeDs82ebY/js/nr49mi/hlmIhXg=;
	b=IbQMjEdRHY30I5bv5RJaP2Bq519xGn0t8oQ4cE5QtrOQesj6zE3308kI8Y42MqjqWDJZwA
	K/NXcmoWWj1kjpfLbjDqgUAFmin3DGfOwpNKiRpAzpJ0i7QcsStMOUlrXk+4/4ek0nvh8e
	dIxw4Pa+c187LfKbVuv7Tf/n35UBhfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715238344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGAGhg1NYG3zDLaoQeDs82ebY/js/nr49mi/hlmIhXg=;
	b=1+nNf8GYN6k5L3u0NnozKSKub7k13xg7yJ1blFS7TvRHh2FgsqVJuNwfGKIeebDG6x4IWu
	lHF7Uqm3dJiOkBBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CRlYs2nB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yVdbUtld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715238343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGAGhg1NYG3zDLaoQeDs82ebY/js/nr49mi/hlmIhXg=;
	b=CRlYs2nBWt287S3QgcC/cbaOHU0ehDtLoNF8YJBTC9XXjb79YhfjRf8SdxAB4vMuU1ix2J
	50yx3NafusTa6Sgp+LXH1b+2tFihHqNF1Ak9UZym0b3ShQRjOVigpYukdayl4hjQW7T6As
	YLKllfPfKgkx+dWtjFMpFBvrbi7Ew04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715238343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGAGhg1NYG3zDLaoQeDs82ebY/js/nr49mi/hlmIhXg=;
	b=yVdbUtldOeQbu29jCNdm5sEmeExjNTGDKQdobdllMgbDrY1+k82TY38SDBEvg4EQPxSX0D
	kepebsXWj7gE7LAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3EEA13A24;
	Thu,  9 May 2024 07:05:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v5aCKsd1PGZ+BwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 07:05:43 +0000
Date: Thu, 09 May 2024 09:05:58 +0200
Message-ID: <87edabbh2h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/12] ALSA: hda: intel: Reduce CONFIG_PM dependencies
In-Reply-To: <Zju6Rvh4Qlg9F0bJ@smile.fi.intel.com>
References: <20240506161359.6960-1-tiwai@suse.de>
	<20240506161359.6960-2-tiwai@suse.de>
	<Zju6Rvh4Qlg9F0bJ@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D23AB5F93E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 08 May 2024 19:45:42 +0200,
Andy Shevchenko wrote:
> 
> On Mon, May 06, 2024 at 06:13:44PM +0200, Takashi Iwai wrote:
> > snd-hda-intel contains lots of CONFIG_PM dependent code although
> > CONFIG_PM is almost mandatory nowadays, and it makes the code
> > unnecessarily complex.
> > 
> > Let's reduce the dependencies of CONFIG_PM in snd-hda-intel driver
> > code.  I left a few module options to be dependent on CONFIG_PM (which
> > are visible to users), but other places are either enabled or
> > optimized by compiler automatically.
> 
> ...
> 
> > +static int __maybe_unused azx_resume(struct device *dev)
> 
> __maybe)unused is discouraged nowadays.
> We have new PM macros (w/o SET_ prefix) along with pm_ptr() / pm_sleep_ptr()
> macros. They are preferred. In complicated cases the PTR_IF() can be used
> directly.

Yeah, it was a dilemma there.  There seems no standard macro to use
pm_ptr() for runtime_suspend (there is only RUNTIME_PM_OPS()), so for
avoiding __maybe_unused, I'd have to expand them manually instead.


Takashi
