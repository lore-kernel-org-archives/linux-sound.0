Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752661C07D2
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003135; cv=none; b=soJSvBcp3MGLLvyiOVPGoq2NlFwy5pFU3l8G/VNJvtbG0kPHM/Nb1hoX4dWttwJLrgqyjwbyGmMnHBCkE1M1R10cpXjxx87P+k1dJNzPkGdJl8fsACZrSU0xrk9915OWcYV7oxBMAl2nZ2MH8LeVSrHIHTuhYzPZohDdTeqSz6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003135; c=relaxed/simple;
	bh=7d17fDVTuiWMBxNfZ92O90txnFQfZC2bbxb1qLfr6hE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEtddaF1en+1cOKJqGlZ4kqAmck+j08h42WVIVbp30bBsPoeo/GPNAWSVvBGH+TbvgwU2FBRsIZOyVa1oFkJgJXtJgpUioEufHL0X2WDxeM0V/Np4Wjuq4+YfyPHQman13LfebYFKntIkYHF+KZqCejx8iZQaOS2aQ4CD5JMRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mv6S9tqb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eH6RyZpR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mv6S9tqb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eH6RyZpR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mv6S9tqb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eH6RyZpR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mv6S9tqb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eH6RyZpR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80C031F7DE;
	Tue, 15 Oct 2024 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729003131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSQjtKphvCm4oraEwQb+lXVfwMC5JTsK8cIGYpwCBVY=;
	b=Mv6S9tqbC8+6dt57j1KXrOhH+/07W1qlVGHz1QRsH3bhZYdmfLQNE4EqhNADFbP4GP7kux
	FmnCA+K/PWkLunWd37BxZxtaB8LqBBe8g0hVQirrUbJ+Nla8UHhGKwh9FckcaGfAZFUWzw
	9msZ6KV2mQ9Nr5VlS/Urt3c391tZjwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729003131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSQjtKphvCm4oraEwQb+lXVfwMC5JTsK8cIGYpwCBVY=;
	b=eH6RyZpRjeDTFlNfA8pIx+VGEGtBhMb9ulfa6IRt4LzMIhM/bGTmuyLKQUrmNbTXEQN5R/
	BX5lTefS8Ck0JaDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729003131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSQjtKphvCm4oraEwQb+lXVfwMC5JTsK8cIGYpwCBVY=;
	b=Mv6S9tqbC8+6dt57j1KXrOhH+/07W1qlVGHz1QRsH3bhZYdmfLQNE4EqhNADFbP4GP7kux
	FmnCA+K/PWkLunWd37BxZxtaB8LqBBe8g0hVQirrUbJ+Nla8UHhGKwh9FckcaGfAZFUWzw
	9msZ6KV2mQ9Nr5VlS/Urt3c391tZjwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729003131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSQjtKphvCm4oraEwQb+lXVfwMC5JTsK8cIGYpwCBVY=;
	b=eH6RyZpRjeDTFlNfA8pIx+VGEGtBhMb9ulfa6IRt4LzMIhM/bGTmuyLKQUrmNbTXEQN5R/
	BX5lTefS8Ck0JaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61E5513A53;
	Tue, 15 Oct 2024 14:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nwufFnt+Dmd0CQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Oct 2024 14:38:51 +0000
Date: Tue, 15 Oct 2024 16:39:49 +0200
Message-ID: <87wmi9top6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Davis <paul@linuxaudiosystems.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: something went wrong with USB iJack data in kernel 6.x
In-Reply-To: <CAFa_cKmS-DHykwA=Ej1w9i3+yfz4wyPJTtEG9ADNTJ8t2GSBQw@mail.gmail.com>
References: <CAFa_cKmDynOwheDU3gH2NMbj2eRAPEkLL+PP3zd4S5+enVK5Ag@mail.gmail.com>
	<87wmibjfuk.wl-tiwai@suse.de>
	<87seszjfj3.wl-tiwai@suse.de>
	<CAFa_cKmS-DHykwA=Ej1w9i3+yfz4wyPJTtEG9ADNTJ8t2GSBQw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 14 Oct 2024 18:03:40 +0200,
Paul Davis wrote:
> 
> The thing that puzzles me is that the iJack strings are missing from
> the output of libusb -v, which AFAIU is 100% independent of any ALSA
> code whatsoever. This makes me suspect that no ALSA code is involved
> in this regression. I've also determined since my email that some
> other devices (e.g. an Ableton Push 2) do have iJack name data with
> the 6.x kernel.
> 
> However, things got curiouser as I was trying to get the output of
> alsa-info. It seems that under some conditions, the iJack strings for
> the problematic device are available/displayed with lsusb. My initial
> run of alsa-info showed the iJack strings, subsequent runs of
> alsa-info and/or lsusb -v do not. I also see a continuous stream of
> USB device resets (though these are not happening directly after being
> connected and do not seem related to the presence/absence of iJack
> strings).
> 
> So my guess is that is a highly device-specific problem and not a
> regression in any part of the kernel.

Yes, it smells more like a firmware bug of the device.

If you prefer having some static names, you can define the entries in
snd_usbmidi_port_info[] in sound/usb/midi.c for each corresponding
MIDI port, too.


Takashi

> 
> 
> On Mon, Oct 14, 2024 at 1:42 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 14 Oct 2024 09:36:35 +0200,
> > Takashi Iwai wrote:
> > >
> > > On Sun, 13 Oct 2024 18:56:57 +0200,
> > > Paul Davis wrote:
> > > >
> > > > I don't know where to start with this issue, but since I noticed it
> > > > trying to use a MIDI device, I thought I would start here. Advice on
> > > > where to take it would  be much appreciated.
> > > >
> > > > High Level symptoms:
> > > >
> > > > 1. plugin in a Novation Lanchkey mk4 to (a) a system running kernel
> > > > 6.x (b) a system running kernel 5.x
> > > > 2. run aplaymidi -l or arecordmidi -l
> > > >
> > > >   Results:
> > > >      (a) kernel 6.x: note the presence of two identical MIDI port
> > > > names for the device
> > > >      (b) kernel 5.x: note the presence of two differently named MIDI
> > > > ports for the device
> > > >
> > > > Mid-level diagnosis:
> > > >
> > > > Run lsusb -v on both kernels. For 5.x, note that the iJACK displays
> > > > include a string for the MIDI port name. For 6.x note that this string
> > > > is missing.
> > > >
> > > > Working with devices bearing identical ports for multiple names ranges
> > > > from extremely difficult to impossible.
> > > >
> > > > I have no idea what layer of the stack can be involved here, other
> > > > than that it is not hardware. I've run both 5.x and 6.x kernels on the
> > > > same system.
> > >
> > > Could you try to narrow down the regression range, e.g. by testing
> > > different 5.x and 6.x kernels?  The best would be git-bisect, but
> > > figuring out the first broken kernel version would help a lot
> > > already.
> > >
> > > Also the issue can be very specific to the device, so please give the
> > > details of your device.  e.g. the alsa-info.sh outputs from both cases
> > > as well as lsusb -v outputs.
> >
> > And, if it's about iJack handling for MIDI v1.x, the only recent
> > change I can see is the upstream commit
> > 41c25e193b2befc22462aa41591d397fab174ca1
> >     ALSA: usb-audio: More relaxed check of MIDI jack names
> >
> > You can try to revert it.
> >
> >
> > Takashi
