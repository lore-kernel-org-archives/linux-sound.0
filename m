Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB86B38A72F;
	Tue, 25 Aug 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787645846; cv=none; b=AVzAqbia4ZERsSIyqaaE4YopEEXxwQm3RlsfccV4Q45USVHwJaqun8FnXjzLUJTXvThbvMbCq3VLClJRNNWAhqR96vucsZ4GcOmyomQFIyBiEd6qEqRiIWN20AjNRye6yw/x7KBpiojlsEQgaxtebw1zjkxlI7V8KEcueATr6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787645846; c=relaxed/simple;
	bh=ABTHyfONLwacYxGTgAd4HfIE6AmhVJozaRPaFemhdYw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnyFveGZWaAW+kT3mT1Mtowdt/JyNsnVx92mCjc4Iy2xHmhogaMIElHCq6BRAFxy0etMdbr67lOH2O1On9h1wjRZJzMba6aqE/GVMWsBpZUmww4qG6kSmCK9Qiy3w8/Pn3XctNuB5q4gjLJ67aqHNQeCkliNCW6VI4+oZuMTHwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wKKJ5U0J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rwBK0kbc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j6hR30V9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hiFRCrpE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wKKJ5U0J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rwBK0kbc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j6hR30V9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hiFRCrpE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5945686D2F;
	Tue, 25 Aug 2026 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787645838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqoKPe3urGF/pqG7zrt0o4kZHXp9nDRYaO6pjKu5wUw=;
	b=wKKJ5U0JXZepvTQADG8TstKEwmqHRJKkjhIZh1pYj+lPuRQkdOHMVN1W7HS3PZOlrWdCQE
	HjNvEUlHJ4z+921y1dj5PjCS5QvtatongRgg2VlMyjoQPyyYHwxWg5v3R22YLzp4kNi+bC
	2/A14SM7LalsZiRRc+cnQh6PKzPMOGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787645838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqoKPe3urGF/pqG7zrt0o4kZHXp9nDRYaO6pjKu5wUw=;
	b=rwBK0kbcNQPdxFGSFvwxOhPILKviK1AqlbuPpDwhIUMzNSShWLG0OuijW3cPVoH0Jiko29
	xg3Q4z6/IxexsABg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787645834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqoKPe3urGF/pqG7zrt0o4kZHXp9nDRYaO6pjKu5wUw=;
	b=j6hR30V9wyzuTLIw/yEo+R7v4Cxyzhaa3aKslx0YyyhvHQ/3zqSxR3Q9pf3zQ4pZhoLdFu
	0o/MrIqhDX5OoTDuiqZlmaNhP4QFW9DXS1H3EPpVspQbs35LpAsOHKkaBH3bRVuwj7tiKJ
	OX8D0XkzLQrCeforhRBMiCRGNbzxB7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787645834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqoKPe3urGF/pqG7zrt0o4kZHXp9nDRYaO6pjKu5wUw=;
	b=hiFRCrpEecXU9cinCmEWom/cjNNmsxm6U3hbJZ3jJTNCyfvMMZWvcUEfWjqaigP0e0UWqt
	xZ9tcZvwkV6AI9BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7ADE13335;
	Tue, 25 Aug 2026 08:17:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +/4hN4lPjWpcAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 08:17:13 +0000
Date: Tue, 25 Aug 2026 10:17:13 +0200
Message-ID: <87ecfmty0m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,	Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,	Asahi Lina <lina@asahilina.net>,	Chris J
 Arges <chris.j.arges@canonical.com>,	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,	Roy Vegard Ovesen
 <roy.vegard.ovesen@gmail.com>,	fenugrec <fenugrec@mail.com>,	Frederic Popp
 <frederic.l.popp@t-online.de>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [RFC] ALSA: usb-audio: missing PM guards in device mixer paths
In-Reply-To: <20260824230302.27965-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.com,t-online.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,b4.vu,asahilina.net,canonical.com,gmail.com,paraair.de,mail.com,t-online.de,darknavy.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Tue, 25 Aug 2026 01:03:02 +0200,
Will Porter wrote:
> 
> Hi,
> 
> I found user-triggered USB transfers without the snd_usb_lock guard in six
> snd-usb-audio mixer files. The affected paths include ALSA controls in all six
> files. mixer_scarlett2.c and fcp.c also have unguarded hwdep operations.
> 
> I would appreciate guidance on three questions:
> 
>   * Should the control callbacks take snd_usb_lock and preserve their current
>     fresh-read behavior, even when polling prevents runtime suspend?
>   * How much of each synchronous hwdep operation should the shutdown and PM
>     reference cover, especially around userspace copies and protocol waits?
>   * Should Scarlett2 flash erase hold a runtime-PM reference until completion,
>     or should runtime suspend return -EBUSY while erase is active?
> 
> I checked sound.git for-next at e72d5659a260. Representative control paths
> that reach the device are:
> 
>   mixer_s1810c.c     snd_s1810c_switch_get
>                        -> snd_s1810c_get_switch_state
>                        -> snd_sc1810c_get_status_field -> snd_usb_ctl_msg
>   mixer_us16x08.c    snd_us16x08_meter_get
>                        -> snd_us16x08_send_urb/snd_us16x08_recv_urb
>                        -> snd_usb_ctl_msg
>   mixer_scarlett.c   scarlett_ctl_meter_get -> snd_usb_ctl_msg
>   mixer_scarlett2.c  scarlett2_meter_ctl_get
>                        -> scarlett2_usb_get_meter_levels -> scarlett2_usb
>                        -> scarlett2_usb_tx -> snd_usb_ctl_msg
>   mixer_quirks.c     snd_rme_digiface_rate_get
>                        -> snd_rme_digiface_get_status_val
>                        -> snd_rme_digiface_read_status -> snd_usb_ctl_msg
>   fcp.c              fcp_meter_ctl_get -> fcp_usb -> fcp_usb_tx
>                        -> snd_usb_ctl_msg
> 
> I scoped this audit to user-triggered control and hwdep paths in the
> snd-usb-audio mixer files. Other sound/usb subdrivers are outside this RFC.
> 
> The RME Digiface get and put callbacks in mixer_quirks.c share this omission.
> Most other direct control transfers in that file already take the guard.
> 
> The Scarlett2 hwdep read and write callbacks call scarlett2_usb(). Several
> ioctls also reach that transport. These include reboot, erase, erase-progress,
> and segment selection when an erase is pending. scarlett2_hwdep_open() can
> also poll erase progress. The FCP FCP_IOCTL_INIT and FCP_IOCTL_CMD operations
> transfer data through snd_usb_ctl_msg(). The other FCP hwdep operations do not
> transfer USB data.
> 
> The Studio 1810c, Scarlett2, and FCP drivers use private mutexes to serialize
> their protocols. mixer_us16x08.c uses chip->mutex. Those locks do not acquire
> a runtime-PM reference. The Scarlett Gen 1 meter and RME Digiface helpers do
> not use a protocol mutex around their single control requests.
> 
> The common mixer paths do take the PM guard. get_ctl_value_v1() and the v2
> path in mixer.c use CLASS(snd_usb_lock, pm)(chip) before snd_usb_ctl_msg().
> Many mixer_quirks.c callbacks do the same. The Forte callbacks in
> mixer_scarlett.c use the older explicit snd_usb_lock_shutdown() form, but the
> Scarlett Gen 1 meter callback does not.
> 
> Failure mechanism
> -----------------
> 
> When the USB device enters runtime suspend, usb_suspend_both() clears
> udev->can_submit. An unguarded callback then reaches snd_usb_ctl_msg() without
> calling snd_usb_autoresume(). The submission reaches usb_hcd_link_urb_to_ep(),
> which returns -EHOSTUNREACH for !urb->dev->can_submit.
> 
> The visible result depends on the driver:
> 
>   * Studio 1810c control reads return the transfer error. Its write callback
>     can instead report no change after a failed transfer.
>   * The Scarlett Gen 1 meter returns the transfer error.
>   * The RME Digiface callbacks return the transfer error and log it. Its
>     VOLATILE status controls can repeat that log on each poll.
>   * The Scarlett2 and FCP transports log the transfer error and convert it to
>     -EINVAL. Their VOLATILE meter controls can repeat that log on each poll.
>   * The TASCAM meter callback ignores both send and receive results. It parses
>     a zero-filled receive buffer, advances its four-step polling sequence, and
>     returns the persistent meter store as a successful read. Because the zero
>     buffer has no valid packet signature, this usually returns stale values.
> 
> usb_audio_driver supports autosuspend. I did not find the affected USB IDs in
> the entries that set QUIRK_FLAG_DISABLE_AUTOSUSPEND. Practical reachability
> still depends on the complete USB device and its userspace. A sibling
> interface or a polling process can keep the device active.
> 
> Hardware reproduction of the mechanism
> ---------------------------------------
> 
> I do not own hardware for these in-tree paths. I reproduced the mechanism
> with an out-of-tree Audient iD14 MkI mixer extension that had the same missing
> guard. I read an unguarded device-specific control and a guarded mixer.c
> control in one runtime-suspended window:
> 
>   unguarded Audient control -> "No route to host", no value,
>                                device remained suspended
>   guarded mixer.c control   -> value returned, device became active
> 
> After I added CLASS(snd_usb_lock, pm)(chip) to the Audient callback, that
> callback returned a value and resumed the device. This test demonstrates the
> PM mechanism. It does not test an affected in-tree device.
> 
> The iD14 did not reach runtime suspend in its normal desktop configuration.
> Its HID interface exposes the monitor knob as a mouse, and the desktop keeps
> that input node open. usbhid then holds a runtime-PM reference for the USB
> device. PipeWire also polls the control device. For the test, I stopped the
> userspace audio stack, unbound the HID interface, and set power/control to
> auto. Whether an equivalent masking condition exists on the affected devices
> is unknown.
> 
> Prior design history
> --------------------
> 
> Commit 47ab15459382 ("ALSA: usb-audio: Avoid nested autoresume calls")
> introduced snd_usb_lock_shutdown(). Its stated purposes include autoresume and
> delaying disconnect cleanup until concurrent operations finish. The current
> guard is the automatic-cleanup form of that helper.
> 
> During review of the original FCP driver, Takashi asked whether its hwdep and
> control paths needed suspend, resume, and disconnect handling:
> 
>   https://lore.kernel.org/linux-sound/87jzbidfs5.wl-tiwai@suse.de/
> 
> The v2 response reported system-suspend and disconnect tests while polling
> meters 20 times per second:
> 
>   https://lore.kernel.org/linux-sound/cover.1735495639.git.g@b4.vu/
> 
> Later revisions added private_suspend cleanup for the notification URB. I did
> not find discussion of runtime-autosuspend references for the synchronous
> control transfers, or shutdown accounting for the callbacks that issue them.
> 
> Guard scope
> -----------
> 
> The likely control-path fix is:
> 
> 	CLASS(snd_usb_lock, pm)(chip);
> 	if (pm.err < 0)
> 		return -EIO;
> 
> The PM guard should precede the protocol mutex. This order matches the common
> mixer paths and avoids a lock-order inversion if autoresume invokes a mixer
> resume hook. Each driver still needs a lock-order audit. Callbacks that only
> read a software shadow do not need the guard.
> 
> Existing code provides a policy precedent for meter and status reads. The
> VOLATILE RME class-compliant status controls were added by commit d39f1d68fe1d
> ("ALSA: usb-audio: Add custom mixer status quirks for RME CC devices"). Those
> controls take the guard around fresh device reads. Following that precedent,
> the affected callbacks should preserve their current fresh-data behavior and
> wake a suspended device. A polling mixer GUI can therefore keep the device
> active. Cached behavior would require a separate cache and update design.
> Omitting the guard does not provide valid cached behavior.
> 
> The hwdep paths need shutdown and PM accounting from the first use of
> disconnect-sensitive driver state through the complete device transaction.
> Input data may be copied before taking the guard only if that work does not
> dereference private mixer data. A locally buffered response may be copied out
> after releasing it. Otherwise, the reference must cover the userspace copy.
> It must also remain held across protocol sleeps and command-response waits.
> 
> Scarlett2 flash erase is asynchronous across file operations. USB PM guidance
> for asynchronous output holds a PM reference from submission until the output
> queue drains:
> 
>   https://docs.kernel.org/driver-api/usb/power-management.html
> 
> By analogy, runtime PM should remain referenced from erase submission through
> completion. Alternatively, the runtime-suspend path should return -EBUSY while
> an erase is active. A scoped guard in one ioctl does not cover that interval.
> A runtime-PM reference does not prevent system suspend, which remains a
> separate policy question. I have not reduced the hwdep changes to patches
> because this operation boundary needs review first.
> 
> The missing usage_count reference also means usb_audio_disconnect() does not
> wait for these transfers through snd_refcount_sync(). Other ALSA lifetime
> rules may protect some control or hwdep paths. I have not completed that
> lifetime audit, so I am not making a memory-safety claim here.
> 
> If this scope and guard placement look correct, I can prepare patches for the
> six files. I can compile-test them, but I cannot test them on the affected
> hardware. Tests from the device owners would be valuable.
> 
> Assisted-by: Claude:claude-opus-5
> Assisted-by: Antigravity:gemini-3.1-pro-high
> Assisted-by: Codex:gpt-5.6-sol
> 
> Thanks,
> Will Porter

In general, the code accessing the hardware via usb_ctl_msg() should
be covered by snd_usb_lock.

In the case of scarlett2, protecting scarlett2_usb() alone would cover
most cases, I guess.


thanks,

Takashi
