Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042762;
	b=0zMrPqlFaaWigMODj1MjdfFKI/5svw0lcGAEaly27HzyBLKoQnjZxxIrVFehciRryEq/
	 PEV4LfVjdInwMOGPsVsJ4dII5DSAXS6/wbmZ/U1pV2DJ2nxeTeDkpPDtHCSE/vK/GkQe9
	 13/2+cA2MldkhIOQuzGh8ToJP4QHucPUKGv+L2Hk35pbqjpFg/gbKm+ciMtqOZ854sLy/
	 65DlIrH/OExdeIHM/pi2b5/aWDers3mapv+7cZ6BIvaxXTwyBOrsnWShJL8F4CPre81QC
	 VyAxiW2BY1RdXJw28KqZ1dfgYA2plpf/hFw09jTUlBEdNLXr0uAdHGmKfLMjwQ5YNYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042762;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=ZUqYrCy1LuLTDeJz42pZlCLQ4NHO8O8nfYaMtczBuE8=;
	b=vKq8bQrCDcMpr9QXxtuf4uux3ISu0SzPknIdzhBYt8kcfeZwdMiRx+YMB8NidrUvPc/P
	 hF25eKChQv3RaJjB9N4TtRFAjrbW3kDv/9XiWOrQO3CTwXQ3WboBAK8Flu7W5+zjB8tKk
	 BwRra3wb+wQVVvgtDzRMlRjohUBd5jL42PHtTcNjK+i+ANFFG30xNrVyUFyYojORurVrk
	 lUQ0XjdFP5BPja69Uj/wz/bMNDme5Mm/tvtLyQXXuyAusj81+QNBq1Z3ynYNxrlwE+fIK
	 Pk8Ow3RSpgK6PDk1ABYKtMOZGX9hvrVRLPa0O3LdA7937WfMu2dt5BCKBvnqI+g9g0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AGb2fwrt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wzs9cvz7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AGb2fwrt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wzs9cvz7;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FE606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AGb2fwrt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wzs9cvz7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AGb2fwrt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wzs9cvz7
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FF3622056;
	Sat,  7 Nov 2026 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUqYrCy1LuLTDeJz42pZlCLQ4NHO8O8nfYaMtczBuE8=;
	b=AGb2fwrtMaO1pDJujqNg3pAV1zpIAbBJ87MVUaaHD1Z43PlrDEI/AAHgjY9S4HMoWuFThD
	A0p+t/jBT8VspbIQg2im24ZYbX69hbAh83r0Epwuwylwo+dOxXwJ6xNm/+w7kKlqeeyQVO
	fb4p0j0g6AVuysOhupEv4qtjBBpgR+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUqYrCy1LuLTDeJz42pZlCLQ4NHO8O8nfYaMtczBuE8=;
	b=Wzs9cvz7K6Jg9yR+BiYRIGCjf1aZVkp1s8hZGqwS3kWC4hJw3qztZbATFFQ0qOGDfxCivm
	Yqg5WSKE5xPgQ9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUqYrCy1LuLTDeJz42pZlCLQ4NHO8O8nfYaMtczBuE8=;
	b=AGb2fwrtMaO1pDJujqNg3pAV1zpIAbBJ87MVUaaHD1Z43PlrDEI/AAHgjY9S4HMoWuFThD
	A0p+t/jBT8VspbIQg2im24ZYbX69hbAh83r0Epwuwylwo+dOxXwJ6xNm/+w7kKlqeeyQVO
	fb4p0j0g6AVuysOhupEv4qtjBBpgR+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUqYrCy1LuLTDeJz42pZlCLQ4NHO8O8nfYaMtczBuE8=;
	b=Wzs9cvz7K6Jg9yR+BiYRIGCjf1aZVkp1s8hZGqwS3kWC4hJw3qztZbATFFQ0qOGDfxCivm
	Yqg5WSKE5xPgQ9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D432132C9;
	Sat,  7 Nov 2026 09:12:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L9szOYfr7moIZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:12:40 +0000
Date: Sat, 07 Nov 2026 10:12:39 +0100
Message-ID: <87bj81yph4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Barnette <calmasacow@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [BUG] snd-usb-audio: Elgato XLR Dock 0fd9:00a6 capture silent when playback starts first
In-Reply-To: <CAOUQ8cou-i0qNmFRsMxrjuGNKaBii1ggwGS-pjMuuexNJfBCWA@mail.gmail.com>
References: <CAOUQ8cou-i0qNmFRsMxrjuGNKaBii1ggwGS-pjMuuexNJfBCWA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Sat, 07 Nov 2026 01:38:15 +0100,
James Barnette wrote:
> 
> 
> Hello,
> 
> I can reproducibly make an Elgato XLR Dock return digital silence from its
> microphone by starting playback before capture. Starting capture before
> playback works. This has caused repeated microphone failures during normal
> desktop use.
> 
> I would appreciate guidance on whether this needs an snd-usb-audio device
> quirk, and what additional traces or tests would help identify the correct
> fix. I have not established whether the underlying issue is device firmware
> or a host initialization requirement, and I do not have a tested kernel patch.
> 
> Hardware and software
> ---------------------
> Device: Elgato XLR Dock, USB ID 0fd9:00a6
> USB bcdDevice: 2.10 (device release descriptor, not independently verified
> as the vendor's firmware version)
> Connection: full-speed USB through xHCI
> Kernel: 7.2.5-3-omarchy, x86_64 (distribution/custom kernel)
> ALSA library: 1.2.16.1
> PipeWire: 1.6.8
> WirePlumber: 0.5.17
> 
> I have not yet tested a stock upstream kernel or another kernel version,
> so I cannot identify this as a kernel regression.
> 
> Reproduction
> ------------
> I temporarily disabled the PipeWire card profile for this device to release
> its hardware PCMs. I then ran arecord/aplay directly against hw:4,0. Card
> numbers are machine-specific. No PipeWire mixer, WaveSink routing, or
> OpenDeck plugin participates in these direct ALSA trials.
> 
> Both streams use 48000 Hz and S24_3LE. Playback is two channels of zeros
> from /dev/zero; microphone capture is mono. Each capture lasts two seconds.
> The microphone was unmuted, with hardware gain 49.5 dB. Hardware settings,
> including phantom power, were unchanged between trials.
> 
> Failing order:
> 1. Start aplay -D hw:4,0 -t raw -f S24_3LE -r 48000 -c 2 /dev/zero
> 2. Wait 300 ms, then start arecord -D hw:4,0 -t raw -f S24_3LE -r 48000 -c 1
> -d 2
> 3. Inspect capture samples, then close both streams.
> 
> Working order:
> 1. Start the same arecord command and wait until it supplies PCM data.
> 2. Start the same aplay command while capture remains open.
> 3. Inspect capture samples, then close both streams.
> 
> The attached Python reproducer discards audio, prints sample statistics,
> validates the exact USB ID, and restores the previous PipeWire card profile
> with capture started first. It briefly interrupts this device's audio.
> Run: python reproduce-xlrdock-startup.py --card 4
> 
> Results
> -------
> Across two runs, playback-first failed in 4/4 trials and capture-first worked
> in 4/4 trials. The second run captured exactly 96000 mono samples per trial:
> 
> Playback-first: 0 nonzero samples / 96000
> Capture-first: 95700 nonzero samples / 96000
> Playback-first: 0 nonzero samples / 96000
> Capture-first: 95701 nonzero samples / 96000
> 
> USB observations
> ----------------
> In the first run, usbmon showed completed isochronous capture transfers on
> endpoint 0x82. For each playback-first trial, all 2012 retained packet data
> prefixes were zero. For each capture-first trial, 2006/2012 prefixes contained
> nonzero data. I retained statistics and setup-request metadata, not audio or
> a complete usbmon recording. This localizes the observed silence to capture
> USB buffers, below the application mixer; it does not prove an internal
> firmware defect.
> 
> The relevant SET_INTERFACE activation order was:
> Failing: interface 1 alt 1 (playback), then interface 2 alt 1 (capture)
> Working: interface 2 alt 1 (capture), then interface 1 alt 1 (playback)
> 
> The descriptors advertise playback endpoint 0x01 with explicit feedback
> endpoint 0x81, and mono capture endpoint 0x82. Both advertise 48/96 kHz.
> I have not tested the same ordering at 96 kHz.
> 
> Recovery and limitations
> ------------------------
> Capture-first restores the microphone. In the desktop session I verified
> recovery by selecting the input-only profile, starting capture and waiting
> for PCM, then restoring the duplex profile while capture remained open.
> Microphone audio and the mixer meter worked afterward.
> 
> An application-level capture pin can protect that application's own output
> links, but cannot control earlier playback from other clients. I did not
> have boot-time USB tracing enabled, so I cannot identify which client
> started playback first during the original failure.
> 
> Could you advise whether a device-specific initialization quirk is
> appropriate, or suggest a targeted trace/test to distinguish the relevant
> USB setup operations? I can test a proposed fix on this physical device.

Might it be improved when enforcing the implicit feedback mode?
Just a blind shot judging from the description.


Takashi
