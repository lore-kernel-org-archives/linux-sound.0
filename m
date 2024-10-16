Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D513B15B13C
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086405; cv=none; b=r38yNaoPRCLDIbYYWIkNq2WiS7KOE+qA7iQL3+u2l4SHLD+pTZRI/AogHTfW4dx7i5OgoUDFVZUkYoFNkB/jMEYFICnnGHesJkQcUPmFzhIs5ezsxUXO9BDrZvbzDWFU+EgUcbQO0j0S7B4OrYHrx6PxqPYTfRg2c3wV1Eit/zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086405; c=relaxed/simple;
	bh=gbyIMrt35X5qVQl8T6bF7RwSzyu1Zb9uw6yh7CMS4x4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TeG384C4f4U/93u6S343Xwcc49bTxzq4YjDwibro4d3W88e1lfvaGbQtw/ajqU+60+64aHFAb+cK2dEXrw0mVgUL07Qe+AFtp2FaPjM5SM/BhENtn2K6tAgeQxdPvlgG0xdKnMd5J1+tdg8ujhBwBiw00x63XEXYoirHCOxKyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TVFWMaQh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h+NE5ZrM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MZm5hUq0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zTSETOTf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TVFWMaQh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+NE5ZrM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MZm5hUq0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zTSETOTf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BCBA1F7BF;
	Wed, 16 Oct 2024 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729086402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsHBBt4Z3wijUgyWzwwNBsWrdswwSTuGmlLN+yNNtVk=;
	b=TVFWMaQhgOcjQBYIfx/mZFpmGoShNKO81hDLhQxFgu6fKFM6/jcrkKDEi2YFxn+bD9RjIF
	5x24ofj3pb4sl7BPVqe4+5B37NREd9OEurC8HbuXk5FkC2wAiS2VAI3H8wwZ2ipQ5PSwFs
	x4v2dher29bORSPabZRfgffNIyV65TM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729086402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsHBBt4Z3wijUgyWzwwNBsWrdswwSTuGmlLN+yNNtVk=;
	b=h+NE5ZrMvrvCSBGcF4HIK7kFzrPSDKhNSCmbcOXhtZ2icKjFfnsE+jeZ+hhOXbJJnw9S6A
	/5yVKeMLd6BdGBAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MZm5hUq0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zTSETOTf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729086400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsHBBt4Z3wijUgyWzwwNBsWrdswwSTuGmlLN+yNNtVk=;
	b=MZm5hUq0696FpXNYjZFqdhSzrR6ri+3Ivqy6IIWLqd/4O5ZtjwAYe4uR3b2BgrdnRpDKZ1
	9ncJK9w2Oi+7Ri8i/k+2kuqHXojBXAS185zkzZRlhOSjNaQOQc/0XR6IkHAgHqy+vyJqg+
	UejBMFu1w5HbZYVS3VEmTp6tY0opf0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729086400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsHBBt4Z3wijUgyWzwwNBsWrdswwSTuGmlLN+yNNtVk=;
	b=zTSETOTf4/k9UlhN4AZ9DnlUlzO1w5K4pJskWgCTqe0/MV/Rez4hLIpbAHf9nzWJHy0pfm
	lBE61INDqjYBNaDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E55E51376C;
	Wed, 16 Oct 2024 13:46:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZDNmN7/DD2dOEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Oct 2024 13:46:39 +0000
Date: Wed, 16 Oct 2024 15:47:30 +0200
Message-ID: <87r08grwgd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski
 <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Add support for detection
In-Reply-To: <51db28da-7eb8-401a-b86e-98d95f896643@linux.intel.com>
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
	<87y12ory4x.wl-tiwai@suse.de>
	<51db28da-7eb8-401a-b86e-98d95f896643@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0BCBA1F7BF
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 16 Oct 2024 15:29:35 +0200,
Amadeusz S³awiñski wrote:
> 
> On 10/16/2024 3:11 PM, Takashi Iwai wrote:
> > On Wed, 16 Oct 2024 15:02:24 +0200,
> > Amadeusz S³awiñski wrote:
> >> 
> >> There are some scenarios when using DSP where one may want to have
> >> partially active stream and fully enable it after some event occurs.
> >> 
> >> Following patchset adds new "detect" state to ALSA state machine to
> >> allow waiting for condition to occur before fully starting a stream. In
> >> further patches the state is propagated through ASoC components to allow
> >> them to handling the state as necessary.
> >> 
> >> Main goal of this patchset is to allow handling scenarios like keyphrase
> >> detection - where DSP analyses incoming signal and wakes userspace to
> >> consume stream only when keyphrase is detected.
> >> 
> >> I'm sending this as RFC so we can discuss if this is the way to go or if
> >> there is perhaps another preferred way of adding such interface.
> >> Userspace part of implementation is available at
> >> https://github.com/amadeuszslawinski-intel/alsa-lib/tree/rfc_detect
> >> 
> >> Amadeusz S³awiñski (4):
> >>    ALSA: core: Add support for running detect on capture stream
> >>    ALSA: core: Allow polling for detection
> >>    ASoC: pcm: Add support for running detect on capture stream
> >>    ASoC: Propagate DETECT trigger
> > 
> > Generally speaking, the addition of a new PCM state should be avoided.
> > It'll influence too badly on all user-space programs.  e.g. if an old
> > user-space program receives such a new state, what should it do?
> > How can it know it's a fatal error or it can be ignored / skipped?
> 
> In this case it should not get into new state unless specifically
> requested from userspace, unless I'm missing something?

Hmm, if the state is exclusive only for the requested program and
influences only on that program itself, why does it have to be a
global PCM state that essentially every program code has to deal with?

> Goal is to allow something along the lines of following in arecord or
> similar:
> 
>         ret = snd_pcm_detect(handle); // here only parts of DSP FW
> needed for detection are running
>         c = snd_pcm_poll_descriptors_count(handle);
> 
>         pfds = malloc(sizeof(struct pollfd) * c);
> 
>         snd_pcm_poll_descriptors(handle, pfds, c); // polling for
> detect event to happen
> 
>         while (!detected) {
>                 ret = poll(pfds, c, -1);
>                 snd_pcm_poll_descriptors_revents(handle, pfds, c,
> &revents);
> 
>                 if (revents == POLLERR) {
>                         error(_("poll, revents == |POLLERR"));
>                 }
>                 if (revents == POLLIN) {
>                         error(_("poll, revents == |POLLIN"));
>                         detected = 1;
>                 }
>         }

It's too complex if it's needed for each program.
If any, it'd be easier to implement an ioctl() for triggering the
detect and the sync...

>         ret = snd_pcm_start(handle); // starts whatever else is needed
> for PCM to work
> 
> > 
> > And, if it's about the synchronization of the DSP readiness, can't it
> > be rather synced in each PCM open or prepare instead?
> > 
> 
> It's too early. We need to do it after hw_params as it needs to create
> all paths needed for full stream.

It can be done in hw_params, too.  I don't mind where to put, but my
point is that the sync can be implemented internally without changing
the external API to user-space.

> During detection it just activates
> ones needed for detection and only after receiving detection event we
> want to start ones needed for draining.

So if the driver needs the sync, it can be done in hw_params or
prepare, too.  Something like stop_sync stuff we introduced.
In the case of stop_sync, hw_params waits for the pending task by the
previous stop trigger.  In this case, the sync can be performed after
hw_params (if requested) instead.


thanks,

Takashi
