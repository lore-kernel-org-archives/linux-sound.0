Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F72459DC
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888754; cv=none; b=onQi3jHBo548MY7Y3SyC7n+mWYiJltZLje5Akqyi1gpFCjUcSxtCXICd85y5noN/AyOLSfg0rBeX/iFdk/oAj/kC09MUSCVmtI1XAgw+rXP2CtKFJEddOzLyBOGe23L8LnJ2/RmqniqgKbhBWjIJjBcjic/zL57lJyRjgMwa9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888754; c=relaxed/simple;
	bh=Iaf1F2EYnbNp6FEOMXVEqe9lEfDSnEBoSKhSwODMjVE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gTxGYCKw5mWBpaRkRX9CywiBDTs1jOzI6QecofwDAcAupk1iHpml75+c3uwkH9+N3+jDNZx+2aKnyTqzYMUykxWJYTRlp6GyxuGvKVv6hPhrLF8Xfiq3OOYEDjwYR0zbda80Xm3afbVSxgvl0koPcEL7v2LpgPbIDCDYIzz9XSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ezeyqKKN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oNaXpsOF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ce6+WK/r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xI30blBy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ezeyqKKN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oNaXpsOF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ce6+WK/r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xI30blBy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92B7C4D52D;
	Mon, 30 Mar 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774888751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJrp5TiQYUcnNMyPn4x28bEI/MjcezaW+ToIj4tgrh8=;
	b=ezeyqKKNh250fhF3e+dDRaTZvbPOZ0Jlcxi4u6dCn7oNQL8a1IPrr+E++PjKWt0GL191qM
	qWPYEoYSyg295+rUekdkXFyinWJ3VC6j7TSefFP/Ib6nNLeDrCk0C6ao68d3KsE+yZMvBJ
	eh0d9LqIqysmCkwatzCGwR+MW9lM7kE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774888751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJrp5TiQYUcnNMyPn4x28bEI/MjcezaW+ToIj4tgrh8=;
	b=oNaXpsOFy73BJFtpghGzNuADhYrafwvPUQts2VyMOaDDYgdKpvczXGktB/WXV07HY8PXfB
	GOjhJmzAQ1+VkODw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774888750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJrp5TiQYUcnNMyPn4x28bEI/MjcezaW+ToIj4tgrh8=;
	b=ce6+WK/ruKxCbfgMehpBhvSUmfjWc+zsyRGrj8Nn0OTXI8RrF6qKFx/CQZWthV8UH7KNB+
	Uo83ejs0JJcss/PMuOaH+Og3AFZsMsfFIfyEITvNn/Pd0MC8TvT6VUGfrzJgMjM2WTcQ8w
	ffzky1EdnSNXtbC8W3mhxZMCv7cdiuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774888750;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJrp5TiQYUcnNMyPn4x28bEI/MjcezaW+ToIj4tgrh8=;
	b=xI30blByhiRWOh/YVS8NRITxLAMsauicXH6opQm/l2QtF+nji6R9WnSyvYM84+zkm111TF
	TxdXwVTEKJAz1CCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 496E54A0A2;
	Mon, 30 Mar 2026 16:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id INeREC6nymluYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 16:39:10 +0000
Date: Mon, 30 Mar 2026 18:39:09 +0200
Message-ID: <87ikadtgpe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	arun@asymptotic.io,
	wim.taymans@gmail.com
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for 'jumpy DMA'
In-Reply-To: <67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
	<87se9htms4.wl-tiwai@suse.de>
	<67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,kernel.org,linux.intel.com,alsa-project.org,vger.kernel.org,asymptotic.io,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,googlesource.com:url,gitlab.freedesktop.org:url]
X-Spam-Flag: NO

On Mon, 30 Mar 2026 17:15:38 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 30/03/2026 17:27, Takashi Iwai wrote:
> >> https://github.com/thesofproject/linux/issues/5313
> >> https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4489
> > 
> > Sorry to be late in the game as I was off in the last weeks, and
> > slowly catching up.  So, I'm reading this thread from the beginning,
> > and wondering what is needed from user-space API POV.
> 
> This discussion is stretches back a decade or so, few weeks do not matter ;)
> 
> > First off, we do already have a way to report a fine-grained playback
> > pointer as "delay" even in jumpy hw_ptr updates as long as the driver
> > supports it;
> 
> The delay reporting with the jumpy hw_ptr works great, most application
> on Linux uses it (mplayer, mpv, vlc, pipewire, pulseaudio, etc).
> Chromium's alsa_conformance ironically did not, but it is for some times
> now:
> https://chromium.googlesource.com/chromiumos/platform/audiotest/+/eccd8be776d45a2e3b3006d74f174ff216cb01d8%5E%21/#F0
> 
> > e.g. a few drivers for hardware with packet-based
> > transfers like USB-audio support that mode.  Doesn't it suffice for
> > your need?
> 
> There is no real way to express the jumpy hw_ptr, it is not really
> packet mode (while in some sense it is, but rather not) and the BATCH
> mode certainly not a fit.
> 
> > And, if a more different parameter is required and defined, how an
> > application can use it?  An application can read/write PCM parameters,
> > write PCM data (either via mmap or write/ioctl), and sleep/wakeup via
> > poll() -- basically that's all.  Would the new parameter influence on
> > the poll wakeup behavior?  Or who controls in which way?
> 
> The main target at the moment is pipewire in Linux, it uses mmap and
> timer (no period wakeup) to process audio in the most efficient way. It
> can fall back to non mmap and poll, but that comes with lots of drawback
> in power consumption and CPU use.
> 
> We have the default configuration of SOF working now fine with it's
> jumpy-DMA, which is:
> 4ms host facing buffer inside of DSP and 1ms DMA bursts every 1ms.
> This translates:
> when audio starts, before 1ms elapsed the hw_ptr will be pointing to the
> sample at 5ms, 4ms has been sent to the DSP, when 1ms elapsed from the
> playback, the hw_ptr is at 6ms, you can say that it is 4ms ahead of the
> playback progress viewed in the host facing buffer of the DSP.
> But, this 4ms is not the delay, the delay is a different thing, which
> includes the 4ms plus processing path within the DSP.
> 
> The issues at hand is that we need to tell the applications about this
> so they can work out how to manage the mmaped area.
> They must provide enough data on start - 1ms is not enough as the DMA
> jumps 4ms, 4ms is likely not enough, unless the application can be sure
> it can provide more data with 1ms - when the DMA will move 1ms ahead.
> 
> I have other examples in later mails for different configurations.
> 
> This is not really about delay, it is not really fits into BATCH mode
> either.

OK, then I'd say that the existing fifo_size doesn't fit fully for
this kind of stuff.  e.g. if a device allows a different queue size,
it should be configurable via hw_params.


Takashi
