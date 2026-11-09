Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208779;
	b=WiHWlXkQb7C+hkHVQwc7y7COSphT6yaucbPDQR3vZzpfxvy6m4LYf13oMfKQz7fl2oEf
	 7QZJEgBm0d5C6imtxKoyqlfUPAW/9eAWvY+4L4GvOX1T40ZYV6g95oPrFpRaS7TKDl73V
	 wRXy0wPN3xYrCjQl4Zx1NBGae/aY4fHzEiv3UApcIHM5PruXqC21wuBsMN+ju7ZH8gN/K
	 RiEkMnH+iO4tlQLnI//gN6R/KRVprAhJOGT2dqYnaZrKpTIZMzxDkPMH8FS2Mrj6VntJk
	 AUz9A0D7ngs+L8drrvasVoCt4UR6bTA6vtK70+Oa6eK1f7znlZnEYU0mretwkgdZ9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208779;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=8ydp81PhWBeDe+y/drRykNqWaIlTe3ynaRB67lhWitU=;
	b=WwDfJborVdtjOQny5k+kER/12/2PNzdJtZiTIoKfo3IKKojdVfPbJXODbdq5Baq3S/us
	 gLXaGrRJg92Gnumae/eQyFa9vyhkJKpDeKdYBr+A4rqKzh+FYPngO/qSeEaVXCCpWek1B
	 9YgE9UKzR67jCNdKRID/VWmOqzqrJxuM2jN9SilQaIeUeUSzyYXaIx7qlEC3NITIm1uw0
	 mtZOjLTh9k3hI2gjv+Q/NRo708GR72QcZ0YC5pvlRhJ/OyAiLf+efDMDr6Ag8gXaSq8mW
	 QFXAaBw8KcEKv2kTOdqyMNfbsr2y5g4ISZbqvq4175fng2kx/DU2PuKQsRvOQDPh6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g1tw19Dc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="jn/mAM7g";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g1tw19Dc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="jn/mAM7g";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ADC606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 07:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95ADC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g1tw19Dc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jn/mAM7g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g1tw19Dc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jn/mAM7g
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63458220AA;
	Mon,  9 Nov 2026 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794208776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydp81PhWBeDe+y/drRykNqWaIlTe3ynaRB67lhWitU=;
	b=g1tw19DcIEC8aNG1IdeC3rJwTKuMA+NICc3hLd4P7Bc2VGdv8dkSwfmrESM7lr+hVzvoGM
	R4ctnL1b3lqvg/AmATVJoB4mfEA27Z3Wm7YQITk2ogyCQTIh31+ucq5L+we96Cl8s/qlp6
	twkq6pHXvdO4Kt0JHfR5WtXL0LUlhxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794208776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydp81PhWBeDe+y/drRykNqWaIlTe3ynaRB67lhWitU=;
	b=jn/mAM7gBMBhy34glunlQNdabYHe7OYRWYOUCIrUa2fI1VFvuYM9g0mJF8i79KqWG/EWGG
	5U4NmRCQbsmoxgBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g1tw19Dc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="jn/mAM7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794208776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydp81PhWBeDe+y/drRykNqWaIlTe3ynaRB67lhWitU=;
	b=g1tw19DcIEC8aNG1IdeC3rJwTKuMA+NICc3hLd4P7Bc2VGdv8dkSwfmrESM7lr+hVzvoGM
	R4ctnL1b3lqvg/AmATVJoB4mfEA27Z3Wm7YQITk2ogyCQTIh31+ucq5L+we96Cl8s/qlp6
	twkq6pHXvdO4Kt0JHfR5WtXL0LUlhxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794208776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydp81PhWBeDe+y/drRykNqWaIlTe3ynaRB67lhWitU=;
	b=jn/mAM7gBMBhy34glunlQNdabYHe7OYRWYOUCIrUa2fI1VFvuYM9g0mJF8i79KqWG/EWGG
	5U4NmRCQbsmoxgBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B19213302;
	Mon,  9 Nov 2026 07:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aXieOAd08Wo6IwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Nov 2026 07:19:36 +0000
Date: Mon, 09 Nov 2026 08:19:35 +0100
Message-ID: <87qzguwjy0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Barnette <calmasacow@gmail.com>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [BUG] snd-usb-audio: Elgato XLR Dock 0fd9:00a6 capture silent when playback starts first
In-Reply-To: <CAOUQ8cqRBXwhrQRN1ASgNZGrAFk=JXv9zNyrYg67a7U7Ng0QDQ@mail.gmail.com>
References: <CAOUQ8cou-i0qNmFRsMxrjuGNKaBii1ggwGS-pjMuuexNJfBCWA@mail.gmail.com>
	<87bj81yph4.wl-tiwai@suse.de>
	<CAOUQ8cqRBXwhrQRN1ASgNZGrAFk=JXv9zNyrYg67a7U7Ng0QDQ@mail.gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 63458220AA

On Sun, 08 Nov 2026 22:04:05 +0100,
James Barnette wrote:
> 
> Hi Takashi,
> 
> Thank you for the suggestion. Yes, enforcing implicit feedback made
> playback-first capture work in these tests.
> 
> I tested on kernel 7.2.15-1-omarchy with the same Elgato XLR Dock
> (0fd9:00a6, bcdDevice 2.10), ALSA card 4 / hw:4,0. The direct ALSA
> trials used 48 kHz, S24_3LE, stereo zero playback and two-second mono
> capture. Hardware gain remained 49.50 dB, unmuted; PCM remained -23.50
> dB, unmuted.
> 
> The named flag was rejected with:
> snd_usb_audio: unknown flag generic_implicit_fb while parsing param quirk_flags
> 
> I instead applied quirk_flags=0fd9:00a6:20000 (bit 17,
> QUIRK_FLAG_GENERIC_IMPLICIT_FB) and rebound only the Dock. I did not
> unload/reload snd_usb_audio or create a modprobe.d configuration. The
> read-only (0444) sysfs implicit_fb parameter stayed N and was not used
> to enable this. I verified the active stream configuration changed
> from explicit sync endpoint 0x81 to capture endpoint 0x82, with
> "Implicit Feedback Mode: Yes".
> 
> Results (nonzero samples out of 96000; peak):
> 
> Setting Start order Nonzero/96000 Peak
> Baseline playback-first 0/96000 0
> Baseline capture-first 95697/96000 0.0308
> Baseline playback-first 0/96000 0
> Baseline capture-first 95708/96000 0.0294
> 20000 playback-first 95993/96000 0.0326
> 20000 capture-first 95705/96000 0.0375
> 20000 playback-first 95990/96000 0.0343
> 20000 capture-first 95706/96000 0.0380
> 
> At baseline, playback-first failed in 2/2 trials and capture-first
> worked in 2/2. With the flag, both orders worked in 2/2 trials each.
> 
> After testing, I cleared quirk_flags and rebound only the Dock. The
> stream configuration returned to "Implicit Feedback Mode: No", sync
> endpoint 0x81 and Feedback Format 18.14. I restored the PipeWire
> duplex profile output:analog-stereo+input:mono-fallback; mixer
> settings were unchanged. Card mappings remained Dock 4 and Guermok 3.
> No persistent configuration was left behind.
> 
> Does this warrant a device-specific generic implicit feedback quirk
> for 0fd9:00a6? I can test a proposed patch on the physical device.

Yes, feel free to submit a patch to add the quirk entry.


thanks,

Takashi
