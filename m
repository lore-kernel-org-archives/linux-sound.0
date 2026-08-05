Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7545041C;
	Wed,  5 Aug 2026 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943994; cv=none; b=F9aHBrXAwVDLC0neg/Dq78kTrKUyas7RL2n4BZ3pJcamMZcmkB3Y1YE+tHQAtI8IXq+Til2hLWyCzyyYGcypf17xK9XdPhouQkbClvitPsXx8k9NUz44NXdBOox4xc7Lg1RLiLZM6XCLqmlMM5rQpKYgGxpPb7ospmCnwuNN+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943994; c=relaxed/simple;
	bh=jqVLcFMlRjQWUZOGK2vyVHSdJMAw2Q72ijoGCUeevpw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bF+QuX6YUzEo3onBDgoMAchpQUrRqI62Tr9Y+cGbzaLgWjyjVocaxzxAVJe9Q90VkQYgCGnpmoKlKCDUsoFrIq3eL6C7R6v6248jLO+wj9Nk/AG54/C6VYCzQpJfNq0pNcxvxn5niYzPMlvfWZwQTdfwroRLf4Da092wPC8siQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BLIg9s89; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T4H0LSRL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E1sWU55T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JYl0uxoR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BLIg9s89";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T4H0LSRL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E1sWU55T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JYl0uxoR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB0037F218;
	Wed,  5 Aug 2026 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785943968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ANK8f6NMqfeTL/z/rEUjD0caGChr1sDdtPVTJw2Vdxw=;
	b=BLIg9s89FxXtUhkuNc/WSZEEzPXiwH6aDLlk/048q7OBM/tEbqxeQTUNLNHJV2f0VTDOVK
	PUpQzqsl1UrhKiuF0jAqf2tJOw9tWSYZnm6e/iyjSyqvDg+vAK7F3CLoeolUETQyEGwFGa
	9szaW9XafgvOsOfbuT8hEIhrLwHRt9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785943968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ANK8f6NMqfeTL/z/rEUjD0caGChr1sDdtPVTJw2Vdxw=;
	b=T4H0LSRLwE58RlqJddUM0udxBC4q6SKbIW6s5ert6FfdE0sCdExntF1NxAyh5cANRRSroo
	3djTxvNNZZGhyqCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E1sWU55T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JYl0uxoR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785943963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ANK8f6NMqfeTL/z/rEUjD0caGChr1sDdtPVTJw2Vdxw=;
	b=E1sWU55TXldCUBzdr+4x5PML4LLCedPl9ikfpslTAfOQWQYT9e9rgVq94/ARga945883pI
	+wBGIlj4dpkbRAN+j72TuxG6dzXSPM1a3xQ/HHhi9ak/pHkS9IhYeNo1bKLjyZ+dt4oMNs
	OBFwGv6+6M1kQvrKlPI3kK4hWmAKPa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785943963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ANK8f6NMqfeTL/z/rEUjD0caGChr1sDdtPVTJw2Vdxw=;
	b=JYl0uxoRI5K5x42rogjgzkVUyEsc/qo8izm+ZvwsGAAt3COLhyEqfi5RKRvrBNiovs7mPN
	0ghPjBUySAau3iBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B01EB779C3;
	Wed,  5 Aug 2026 15:32:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ze2AKZtXc2oGLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 15:32:43 +0000
Date: Wed, 05 Aug 2026 17:32:43 +0200
Message-ID: <877bm4fuqs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
In-Reply-To: <a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
	<20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
	<20260804235515.7346606e.michal.pecio@gmail.com>
	<a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EB0037F218
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,icenowy.me,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 05 Aug 2026 16:32:00 +0200,
Rong Zhang wrote:
> 
> Hi Michal,
> 
> Thanks for the report.
> 
> On Tue, 2026-08-04 at 23:55 +0200, Michal Pecio wrote:
> > On Sat, 11 Apr 2026 01:49:04 +0800, Rong Zhang wrote:
> > > Some devices' mixers are sticky, which accept SET_CUR but do absolutely
> > > nothing. Registering these mixers confuses userspace and results in
> > > ineffective volume control.
> > > 
> > > Check if a mixer is sticky by setting the volume to the maximum or
> > > minimum value and checking for effectiveness afterward. Prevent the
> > > mixer from being registered if it turns out to be sticky.
> > > 
> > > Quirky device sample:
> > > 
> > >   usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
> > >   usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > >   usb 7-1: Product: Feaulle Rainbow
> > >   usb 7-1: Manufacturer: Generic
> > >   usb 7-1: SerialNumber: 20210726905926
> > >   (Mic Capture Volume)
> > > 
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > 
> > This appears to break (yet another) device, as reported below.
> > Not 100% sure because both affected users ran away to -lts and
> > appear to be of the "won't compile kernel patches" variety.
> > 
> > https://bbs.archlinux.org/viewtopic.php?id=314220
> 
> Let me quote some words below:
> 
> > After updating, my headset output was halved (or so) despite the same mixer levels and sounds weird/bassy/distorted during fading audio. Previously my volume was set to 25%, but now i need 40-50% for the same volume, and the quality seems worse.
> > 
> 
> The new 100% still maps to the original 100% as the sticky check sets the
> mixer value to max before bailing out. IOW, it won't result in always-
> halved physical volume.
> 
> If the dB reporting is correct, both a hardware mixer and a soft mixer
> should map to similar physical volume on the same device. That is, volume
> other than 100% behaving differently usually implies broken dB reporting.
> So the difference in volume mapping isn't really an issue caused by soft
> mixer. Instead, it exposes yet another device quirk.
> 
> Distortion at low volume is a side effect of soft mixers on some devices.
> Usually it's hardly audible. I guess the SteelSeries Arctis Nova 5 uses a
> poorly-performed lossy 2.4GHz codec, making the distortion worse.
> 
> > 
> > [...]
> > 
> > Broken kernel output:
> > 
> > Jul 09 17:06:05 <HOSTNAME> kernel: usb 3-1: Product: SteelSeries Arctis Nova 5
> > Jul 09 17:06:05 <HOSTNAME> kernel: usb 3-1: Manufacturer: SteelSeries
> > Jul 09 17:06:05 <HOSTNAME> kernel: hid-generic 0003:1038:2232.0008: hiddev99,hidraw7: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] on usb-0000:13:00.3-1/input3
> > Jul 09 17:06:05 <HOSTNAME> kernel: input: SteelSeries SteelSeries Arctis Nova 5 as /devices/pci0000:00/0000:00:08.1/0000:13:00.3/usb3/3-1/3-1:1.4/0003:1038:2232.0009/input/input12
> > Jul 09 17:06:06 <HOSTNAME> kernel: hid-generic 0003:1038:2232.0009: input,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] on usb-0000:13:00.3-1/input4
> > Jul 09 17:06:06 <HOSTNAME> kernel: hid-generic 0003:1038:2232.000A: hiddev100,hidraw9: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] on usb-0000:13:00.3-1/input5
> > Jul 09 17:06:07 <HOSTNAME> kernel: usb 3-1: 9:0: sticky mixer values (-19712/0/256 => 0), disabling
> > Jul 09 17:06:07 <HOSTNAME> kernel: usb 3-1: 10:0: sticky mixer values (-21248/0/256 => 0), disabling
> 
> With the kmsg dump, as well as the user confirming that the UAC mixer
> responds to SET_CUR, I can confirm the device has broken GET_CUR mixers
> instead of sticky ones.
> 
> I will submit a patch to add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for the
> device, so that the UAC mixer can be reenabled.
> 
> > 
> > My $.02 - was there no way to deal with this in userspace,
> > or to make it opt-in rather than opt-out?
> 
> While userspace can ignore hardware mixers via some configurations, the
> current opt-out model is really about:
> 
>    When we can't distinguish between both, will the extra advantages of
>    exposing a broken GET_CUR mixer outweigh the disadvantages of exposing
>    a sticky one?
> 
> My answer is no.
> 
> A sticky hardware mixer breaks volume control completely. If a user
> doesn't know how to tell the audio stack to ignore it, it will be a
> terrible out-of-box experience.
> 
> In contrast, exposing a broken GET_CUR mixer is more like an optimization
> for slightly better volume control quality (if the mixer is otherwise
> implemented properly) compared to a soft mixer.
> 
> Other than the unfortunate combination with lossy codecs, usually the
> distortion caused by a soft mixer is only audible on a device with high
> gain, but such a device should also come with a gain control knob anyway
> -- the user really should use the knob to tune the volume.
> 
> Thanks,
> Rong

Well, this is getting more troublesome than expected, as it seems;
there have been a few more bug reports, too (I forgot places), and I'm
afraid that the tendency will remain.

My impression is that Windows drivers don't care about the GET_CUR, so
often the device firmware doesn't treat it at all.  If that's the
case, it'd be also fine just to take the given mixer value as-is.
OTOH, if we want to be more strict, keeping the high default is also
logical -- which is our current behavior.  That is, there is no
perfect answer to this, and it purely depends on our decision.

At least, for 7.3 kernel, I'll keep the current code and take
BROKEN_GET_CUR quirks for the reported devices.  But if the reports
keeping flooding, we'd have to reconsider.  Let's see.


thanks,

Takashi
