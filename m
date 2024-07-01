Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6431715D5B4
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843406; cv=none; b=dXjfk4VLSmWBN165w1LBLchnaLCOwuUdH2kgSehs5iwmWX9AZRWswSJ3FBdf+w/gA6xROWBkVgp/WAOrl4fhU8teT/hSWVL+XBu/ZuW+215YbKLTYbvjWaIBNJRLnkzpt0yvbGDa81+LlKThNDMVK8oKXl9MFJdVayNhkOVMEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843406; c=relaxed/simple;
	bh=Mjjza8FfMvz4cHw1UobsfT8udVzT0tLlV7IEjtDFLMM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ea/P8NWN67oHmr5d62bse1Y0rYoZXTyRLgE4qHQ+HHiDtgznAE6ve03cJIvuOJDzHpT1wMpLYcsNEggvPDyaRrHF6MfUxOYrKOPo9o1+PrpknXVB8c28sHPMS74ShmOewVr/6HBVK2b++CVa5ajaqEQqRXKopKwh3dYXekJDYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=toujm+yU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TArBXRSH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=toujm+yU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TArBXRSH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="toujm+yU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TArBXRSH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="toujm+yU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TArBXRSH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 851EF21A5C;
	Mon,  1 Jul 2024 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719843403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=toujm+yUihyTTB8Ukg0gtXfjKVTbYRxS+GyK7xjzmNfXMqw1KtyChAuiaRQyE88O0vQHvY
	OQDGwlJsb156ENG4/ShtQlY5TmneQ7xRmGjEt+Z+TvJw9xOJHq731do+J/9cYVKRUw4isR
	crZSOS7/Sle0eikkk+ntPWe48ijJNqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719843403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=TArBXRSH6nREcqXK9HFC4yiQqSUQFVUsUVm4nSAWOmcJoXVtN8I6MP0MOu8dL58+vCXc9B
	P6y+Xn99UQxGkhAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719843403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=toujm+yUihyTTB8Ukg0gtXfjKVTbYRxS+GyK7xjzmNfXMqw1KtyChAuiaRQyE88O0vQHvY
	OQDGwlJsb156ENG4/ShtQlY5TmneQ7xRmGjEt+Z+TvJw9xOJHq731do+J/9cYVKRUw4isR
	crZSOS7/Sle0eikkk+ntPWe48ijJNqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719843403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=TArBXRSH6nREcqXK9HFC4yiQqSUQFVUsUVm4nSAWOmcJoXVtN8I6MP0MOu8dL58+vCXc9B
	P6y+Xn99UQxGkhAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A769139C2;
	Mon,  1 Jul 2024 14:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i2LVFEu6gmZYawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Jul 2024 14:16:43 +0000
Date: Mon, 01 Jul 2024 16:17:11 +0200
Message-ID: <8734ot42oo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Asahi Lina <lina@asahilina.net>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 30 Jun 2024 18:04:41 +0200,
Asahi Lina wrote:
> 
> Hi,
> 
> I'm reverse engineering and implementing support for the RME Digiface
> USB, which is an ADAT interface with a non-class-compliant interface
> (probably similar to other RME interfaces like the MADIface, but I don't
> have any others to test). The basic audio streaming works fine with an
> entry in quirks-table.h and a format quirk to set the system sample rate
> in quirks.c. Now I need to figure out how to implement the mixer controls.
> 
> Currently I have the snd-usb-audio driver claiming only interface #0
> (streaming) and I use a Python script to control the mixer/settings
> directly with libusb (control transfers and interface #1). This works
> fine and there's some prior art for this in the firewire world (for
> example, snd-dice doesn't do any mixer control stuff and you have to use
> ffado-mixer to control everything from userspace) but I assume it's not
> really the best way to go?
> 
> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.
> 
> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.
> 
> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace? I think for something like this you pretty much
> have to rely on device-specific tools to make the UX manageable, so
> maybe hwdep... but at least exposing everything as an ALSA control would
> have the advantage of supporting save/restore with something like
> alsactl. So I don't really know what's the way to go here.
> 
> System settings/general status/output faders go via control transfers,
> while interface #1 has an interrupt IN endpoint (streaming state
> feedback, not very useful) and two bulk endpoints (matrix mixer control
> out, VU meter data in). There's another pair of bulk endpoints in
> interface #2 which I'm guessing are for firmware updates (I haven't
> looked at that part). So in principle it's not crazy to expose all the
> system controls/output faders as mixer controls in ALSA and leave
> interface #1 entirely unclaimed so a userspace program can directly
> configure the matrix mixer and access VU meter levels. There is a global
> mixer enable bit (controlled via ctl transfer), so if that is exposed as
> an ALSA control and disabled by default the interface will operate as a
> 1:1 in/out interface without needing any custom userspace to configure
> the mixer.
> 
> There's one other quirky thing: it also needs a way to set the sample
> rate as a mixer control, because you need to be able to configure the
> rate even when the PCM device is not open (since that affects
> stand-alone mixer operation). I imagine the right logic here would be to
> have a selector control for the system sample rate, and automatically
> change it and lock it when the PCM is opened with a given rate?
> 
> Any thoughts welcome ^^

As Geoffrey already suggested, the matrix size can be reduced since
each kcontrol element can be an array, so the number of controls can
be either column or row size of the matrix, which is well manageable.

The VU meter can be provided as volatile read-only controls, too.

So from the API-wise POV, it'll be a most straightforward
implementation.

OTOH, if you need more efficiency (e.g. the control access is way too
much overhead), it can be implemented freely via a hwdep device and
your own ioctls or mmaps, too.  But this is literally h/w dependent,
and the API becomes too specific, no other way than using own tool, as
a drawback.


Takashi
