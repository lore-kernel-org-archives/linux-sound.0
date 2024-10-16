Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C712E75
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084215; cv=none; b=GwhdLrQc6Fe2975k1fjSjOCMjugMgkMePK0IPwtJzWiXulvU+KdcIoFZnu3H3MxCBNnRb7taBIGIyTR2PyOXL+eG41pm2X2xm45vl+6R+lXhjW0UixpzIkOuZWL4pW41E+HoIsWMUcGlxU7ec5enc3ONrWUMEb4brEwniDvAVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084215; c=relaxed/simple;
	bh=UjqoQldaBBwRo7yOLohBgXB+HhkRmMjNLRZwkH9+S64=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ck+gfRH/VJ/tgz19k15PL4y1wa+80SkInRQPXW05NguHsXx6Pd9ZlMUAPfsDFRN+wdahn2BiQeReR4YCU0F250R4Gvv1PveQ1aZZkJTdqBREgcPvfNcJVPiwCgfD/BX5ZtbNMbr0rEOj2K1AqQHYbEXEWWZaElfRb5xj2dgZZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mIgEMxkB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KmPflzwe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mIgEMxkB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KmPflzwe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mIgEMxkB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KmPflzwe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mIgEMxkB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KmPflzwe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 70FA61FCA1;
	Wed, 16 Oct 2024 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729084211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehK5uw9MRmxbGOeQpn5Y7hFEoR3sOR2f9tdS+adwAog=;
	b=mIgEMxkBTq+KazNfADjYNFqGtrsDntrQ1H0ObdV1Ra/MqxFiGd11vKVCI60TU36kHWkQ7I
	fs0cJJpdmWAKLv9bKGsmRfjireRwSFhHUdPxcKNuq7xjcDVycvUOvECLAdKgULRFXSimVw
	gYJ6ZqXJV4wtvNZuOj0COdL8GmyKn44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729084211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehK5uw9MRmxbGOeQpn5Y7hFEoR3sOR2f9tdS+adwAog=;
	b=KmPflzwecSEexUCUqLNpnwphPc8rOKNBCZHmmpbUkUST2c1n3MjzZx4TBYF9EwaULnRiaM
	trvUFn/TznjyAmBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729084211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehK5uw9MRmxbGOeQpn5Y7hFEoR3sOR2f9tdS+adwAog=;
	b=mIgEMxkBTq+KazNfADjYNFqGtrsDntrQ1H0ObdV1Ra/MqxFiGd11vKVCI60TU36kHWkQ7I
	fs0cJJpdmWAKLv9bKGsmRfjireRwSFhHUdPxcKNuq7xjcDVycvUOvECLAdKgULRFXSimVw
	gYJ6ZqXJV4wtvNZuOj0COdL8GmyKn44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729084211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehK5uw9MRmxbGOeQpn5Y7hFEoR3sOR2f9tdS+adwAog=;
	b=KmPflzwecSEexUCUqLNpnwphPc8rOKNBCZHmmpbUkUST2c1n3MjzZx4TBYF9EwaULnRiaM
	trvUFn/TznjyAmBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58B4C1376C;
	Wed, 16 Oct 2024 13:10:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Jz0FDO7D2cFBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Oct 2024 13:10:11 +0000
Date: Wed, 16 Oct 2024 15:11:10 +0200
Message-ID: <87y12ory4x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Add support for detection
In-Reply-To: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 16 Oct 2024 15:02:24 +0200,
Amadeusz S³awiñski wrote:
> 
> There are some scenarios when using DSP where one may want to have
> partially active stream and fully enable it after some event occurs.
> 
> Following patchset adds new "detect" state to ALSA state machine to
> allow waiting for condition to occur before fully starting a stream. In
> further patches the state is propagated through ASoC components to allow
> them to handling the state as necessary.
> 
> Main goal of this patchset is to allow handling scenarios like keyphrase
> detection - where DSP analyses incoming signal and wakes userspace to
> consume stream only when keyphrase is detected.
> 
> I'm sending this as RFC so we can discuss if this is the way to go or if
> there is perhaps another preferred way of adding such interface.
> Userspace part of implementation is available at
> https://github.com/amadeuszslawinski-intel/alsa-lib/tree/rfc_detect
> 
> Amadeusz S³awiñski (4):
>   ALSA: core: Add support for running detect on capture stream
>   ALSA: core: Allow polling for detection
>   ASoC: pcm: Add support for running detect on capture stream
>   ASoC: Propagate DETECT trigger

Generally speaking, the addition of a new PCM state should be avoided.
It'll influence too badly on all user-space programs.  e.g. if an old
user-space program receives such a new state, what should it do?
How can it know it's a fatal error or it can be ignored / skipped?

And, if it's about the synchronization of the DSP readiness, can't it
be rather synced in each PCM open or prepare instead?


Takashi
