Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A51335D3
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349601; cv=none; b=SKoH6LKbsrzbqDmWpiVcIkTCm2W1cRtznpmC/qZ3TDHutM/ryEJsYfHwwzuj8n1TC7m2CFcVqMXhYNJYas4BjzjDGr7haiapajl8ba1GY32kEEyG8bI9bV9p1f2P+S3niO9OIjXYCe+TrjdnietiMRvSS7FHG0BHcD2HONHjLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349601; c=relaxed/simple;
	bh=3PJCqTgNJhgbAG8sMmbRrM3HLVZagTDezaGMP5sJH+Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IT4dvsxYjHfFi+LKTwBTAa62yVypo3BfaBloBfiFKfrM2Xaka0iG+V0pdZzYWDdK9MhZSCjkaEs9cE5pdTpZAPpKIXHzEeMRZv6Aa8sqX9g+tAZjlF3znU7Jvtjq08BnxnTNjHx/pDrQKl+ONm1I0VG6BHXxs9HgUQKUSsaZQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iNED61XO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rPLOSnsL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iNED61XO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rPLOSnsL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iNED61XO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPLOSnsL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iNED61XO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPLOSnsL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9E021F808;
	Tue, 30 Jul 2024 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722349597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/24GZn13BRK4goW4GTZuppQ7snvLyD9TMgZO2PiK8Y=;
	b=iNED61XOy+FmtWpsMc9v828b2CZKzrfRjW8Fm3dLYscAmOMM1tq1OQ8/FE3S4J2p+Nb/oA
	JwU/pQC93mRVnVon6AgyvpnyLGJeFtyqhv12f4zjseVSuNocDm6LGVI67D7QAr0tCgJD79
	hej0AV6ucJiN7WvbM+K68DqMwqA258s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722349597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/24GZn13BRK4goW4GTZuppQ7snvLyD9TMgZO2PiK8Y=;
	b=rPLOSnsLzq1nJS0It0kbN71vHOqx23CDANMEkV2LlnBVTTWl7f1AZDGzxcL0CjtuEAQhX1
	P4w3NiIGU4/QwZAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722349597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/24GZn13BRK4goW4GTZuppQ7snvLyD9TMgZO2PiK8Y=;
	b=iNED61XOy+FmtWpsMc9v828b2CZKzrfRjW8Fm3dLYscAmOMM1tq1OQ8/FE3S4J2p+Nb/oA
	JwU/pQC93mRVnVon6AgyvpnyLGJeFtyqhv12f4zjseVSuNocDm6LGVI67D7QAr0tCgJD79
	hej0AV6ucJiN7WvbM+K68DqMwqA258s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722349597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/24GZn13BRK4goW4GTZuppQ7snvLyD9TMgZO2PiK8Y=;
	b=rPLOSnsLzq1nJS0It0kbN71vHOqx23CDANMEkV2LlnBVTTWl7f1AZDGzxcL0CjtuEAQhX1
	P4w3NiIGU4/QwZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9A3313297;
	Tue, 30 Jul 2024 14:26:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2BjMKB34qGZ7bAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Jul 2024 14:26:37 +0000
Date: Tue, 30 Jul 2024 16:27:14 +0200
Message-ID: <8734nrq7jx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker thread
In-Reply-To: <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
	<87plqw9no5.wl-tiwai@suse.de>
	<ZqfHC7IodobTlVT4@opensource.cirrus.com>
	<87ikwo9etj.wl-tiwai@suse.de>
	<ZqinleaAqikxdQGr@opensource.cirrus.com>
	<87ikwn3vqf.wl-tiwai@suse.de>
	<81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,opensource.cirrus.com,kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.10

On Tue, 30 Jul 2024 16:13:33 +0200,
Jaroslav Kysela wrote:
> 
> On 30. 07. 24 14:33, Takashi Iwai wrote:
> > On Tue, 30 Jul 2024 10:43:01 +0200,
> > Charles Keepax wrote:
> >> 
> >> On Mon, Jul 29, 2024 at 09:30:00PM +0200, Takashi Iwai wrote:
> >>> On Mon, 29 Jul 2024 18:44:59 +0200,
> >>> Charles Keepax wrote:
> >>>> 
> >>>> On Mon, Jul 29, 2024 at 06:18:50PM +0200, Takashi Iwai wrote:
> >>>>> On Mon, 29 Jul 2024 17:59:32 +0200,
> >>>>> Charles Keepax wrote:
> >>>>>> 
> >>>>>> The microphone/speaker privacy shutter ALSA control handlers need to
> >>>>>> call pm_runtime_resume, since the hardware needs to be powered up to
> >>>>>> check the hardware state of the shutter. The IRQ handler for the
> >>>>>> shutters also needs to notify the ALSA control to inform user-space
> >>>>>> the shutters updated. However this leads to a mutex inversion, between
> >>>>>> the sdw_dev_lock and the controls_rwsem.
> >>>>> 
> >>>>> That's bad, how does the mutex inversion look like?  Generally
> >>>>> speaking, a call of snd_ctl_notify() from an irq handler is a very
> >>>>> standard procedure, and it should work without too much workaround.
> >>>>> 
> >>>> 
> >>>> SoundWire IRQs are called under the sdw_dev_lock, and then in the
> >>>> IRQ handler we call snd_ctl_notify which takes controls_rwsem.
> >>> 
> >>> snd_ctl_notify() doesn't take rwsem but ctl_files_rwlock.
> >>> And rwlock isn't taken except for two cases, at a list traverse at
> >>> enumerating from user-space and at the device disconnection, so it
> >>> shouldn't race.  Anything missing there...?
> >>> 
> >> 
> >> The trouble here isn't the snd_ctl_notify, the handler uses
> >> snd_soc_component_notify_control which also does a
> >> snd_soc_card_get_kcontrol, which eventually calls snd_ctl_find_id
> >> which does take the controls_rwsem.
> > 
> > OK, now it's clearer.  I think we can change snd_ctl_find_*() rather
> > to take rwlock instead of rwsem.  It's only a quick look-up, hence
> > rwlock can work well.
> > 
> > Totally untested patch set is below.
> 
> But why the interrupt routine does not use the cached kcontrol
> pointer? It looks like a bad driver design when you need to do such
> name (string based) lookups from the interrupt routine.

Yeah, it'd be even better :)

Though, the conversion to rwlock might be still worth; it's a good
cleanup to drop the *_unlocked() versions that can be messy.


Takashi
