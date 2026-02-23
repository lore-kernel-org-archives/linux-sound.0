Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC634D919
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837130; cv=none; b=ZZMm10deXvx/Jsor7AKajFTH09AMCFMdhkpr0AYTX+Rh2r3e4FhSMH5aWltqesJFRVRcUScbmwRSO3NSHh7krfkgJ+9GLioEMEStTktnPkK4/Xmdd98b6NvA/A9EB50HnAO9qET0SorrOqjAZtOECt0jrnXRjFYqrwkqYBNNAb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837130; c=relaxed/simple;
	bh=sEHuehXHwMxwc/TGw6OEYBEWPtiKdKV0ImQZK9fkZPs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPR9sC6zzkPnv9GVgh11SxzXRklw+VxE8rZMqzMMyEQJWDQ+YilNOa2PQTwFShPy7xgw0Z5xS8VS/fl/ousBVDHnXBZN+jyB8nP6mN/ohOJzgF5zScU4VcKceq5lFmZ1UGs780irJqPZK6ZdPuFdLQBTQv/Aa73VQoWHWGjJFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k8AjAH+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zjOXh8+m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k8AjAH+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zjOXh8+m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k8AjAH+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zjOXh8+m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k8AjAH+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zjOXh8+m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 459CE5BD01;
	Mon, 23 Feb 2026 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771837127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28xDjAfS2hTIFFpbJT2MTsXKO5kwVPglMyKmHCep6+U=;
	b=k8AjAH+/I26XPsvq0BBzow3Q7GM19mv+PqYS9XEeMJcieciPO1d/bvqKFck34wuF3Eif5C
	JmEcfHFLU08LsKe3G5vUTneYS6CTmjmm6dn9OQYu7qbge9s6gvrXtboruKMe7mQrky4CjY
	Wvu7gXcCQRL/muErv8cHA9WbCyzbUkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771837127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28xDjAfS2hTIFFpbJT2MTsXKO5kwVPglMyKmHCep6+U=;
	b=zjOXh8+mGoSIwRC5PH2QsHD8FI5at9URgb5fn88b7m5c8DDBFqj4C1uBBF7BuEsHZ6SFzS
	lHK8763yRR9MWcBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="k8AjAH+/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zjOXh8+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771837127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28xDjAfS2hTIFFpbJT2MTsXKO5kwVPglMyKmHCep6+U=;
	b=k8AjAH+/I26XPsvq0BBzow3Q7GM19mv+PqYS9XEeMJcieciPO1d/bvqKFck34wuF3Eif5C
	JmEcfHFLU08LsKe3G5vUTneYS6CTmjmm6dn9OQYu7qbge9s6gvrXtboruKMe7mQrky4CjY
	Wvu7gXcCQRL/muErv8cHA9WbCyzbUkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771837127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28xDjAfS2hTIFFpbJT2MTsXKO5kwVPglMyKmHCep6+U=;
	b=zjOXh8+mGoSIwRC5PH2QsHD8FI5at9URgb5fn88b7m5c8DDBFqj4C1uBBF7BuEsHZ6SFzS
	lHK8763yRR9MWcBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B3D03EA68;
	Mon, 23 Feb 2026 08:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OHSGAccWnGnsAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Feb 2026 08:58:47 +0000
Date: Mon, 23 Feb 2026 09:58:46 +0100
Message-ID: <87zf4zlttl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Alexander Tsoy <alexander@tsoy.me>,
	Tina Wuest <tina@wuest.me>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Fix Focusrite probe-time side effects
In-Reply-To: <cover.1771594828.git.g@b4.vu>
References: <cover.1771594828.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 459CE5BD01
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 20 Feb 2026 17:03:11 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi all,
> 
> This series fixes two problems caused by probe-time testing of
> altsettings and sample rates on Focusrite devices. When a sample rate
> of 192kHz is selected during the probe's trial and error, the internal
> mixer and Air and Safe modes are disabled. I.e. no audio passes
> through the mixer, and Air and Safe modes cannot be selected until an
> application opens the PCM and sets a lower rate. This results in user
> annoyance and bug reports of unexpected silence and mode changes.
> 
> I tested 20 Focusrite devices (Scarlett 2nd, 3rd, 4th Gen, Clarett+,
> and Vocaster) and found that the valid sample rates can be determined
> from USB descriptors alone, without the QUIRK_FLAG_VALIDATE_RATES
> trial-and-error testing of each rate and altsetting. I also added a
> quirk to skip the redundant interface setup and enabled the quirk to
> skip the clock selector write-back (reading the current value then
> writing it back unchanged triggers a ~300ms delay per altsetting).
> 
> The result of all this: the probe time drops from ~4 seconds to ~4ms,
> there is no interruption to audio, and the mode settings do not
> inadvertently get reset. The contents of /proc/asound/card*/stream0 is
> identical before and after on all tested devices.
> 
> Background
> ----------
> 
> Focusrite interfaces with digital I/O use multiple altsettings for
> different channel counts at different sample rates (more channels at
> 48kHz, fewer at 192kHz). The clock source reports all rates for every
> altsetting, so rates need filtering.
> 
> Two mechanisms currently do this:
> 
> 1. focusrite_valid_sample_rate() reads a non-standard Format Type
>    descriptor (bLength=10, vs standard UAC2 bLength=6) with a max_rate
>    in bytes 6-9.
> 
> 2. validate_sample_rate_table_v2v3() (QUIRK_FLAG_VALIDATE_RATES) sets
>    each rate on the device and queries UAC2_AS_VAL_ALT_SETTINGS to
>    check validity. Prunes rates that fail.
> 
> Mechanism #1 currently uses fallthrough logic (commit cc8e91054c0a):
> an altsetting with max_rate=192000 accepts all rates down to 44100.
> This is correct for Clarett+ but wrong for Scarlett 3rd/4th Gen, where
> only the matching rate pair should be accepted. Mechanism #2 gets the
> right answer but has the USB side effects above.
> 
> Commit 05f254a6369a had strict 1:1 mapping, correct for Scarlett but
> wrong for Clarett+. Neither approach alone works for all devices.
> 
> The UAC2_AS_VAL_ALT_SETTINGS readable bit in the AS header bmControls
> predicts which behaviour the device needs:
> 
> - val_alt readable: strict ― each altsetting only accepts its own rate
>   pair
> - val_alt not readable: fallthrough ― all rates up to max_rate
> 
> Device test matrix:
> 
>   Device                   Playback          Capture           val_alt
>   -------------------------------------------------------------------
>   Scarlett 6i6 2nd Gen     1 alt, bLen=6     1 alt, bLen=6     no
>   Scarlett 18i8 2nd Gen    1 alt, bLen=6     3 alts, bLen=10   no
>   Scarlett 18i20 2nd Gen   3 alts, bLen=10   3 alts, bLen=10   no
>   Scarlett Solo 3rd Gen    1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 2i2 3rd Gen     1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 4i4 3rd Gen     1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 8i6 3rd Gen     1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 18i8 3rd Gen    3 alts, bLen=6    3 alts, bLen=10   yes
>   Scarlett 18i20 3rd Gen   3 alts, bLen=10   3 alts, bLen=10   yes
>   Scarlett Solo 4th Gen    1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 2i2 4th Gen     1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 4i4 4th Gen     1 alt, bLen=6     1 alt, bLen=6     yes
>   Scarlett 16i16 4th Gen   3 alts, bLen=10   3 alts, bLen=10   yes
>   Scarlett 18i16 4th Gen   3 alts, bLen=10   3 alts, bLen=10   yes
>   Scarlett 18i20 4th Gen   3 alts, bLen=10   3 alts, bLen=10   yes
>   Clarett+ 2Pre            1 alt, bLen=6     3 alts, bLen=10   mixed*
>   Clarett+ 4Pre            3 alts, bLen=6    3 alts, bLen=10   no
>   Clarett+ 8Pre            3 alts, bLen=10   3 alts, bLen=10   no
>   Vocaster One             1 alt, bLen=6     1 alt, bLen=6     yes
>   Vocaster Two             1 alt, bLen=6     1 alt, bLen=6     yes
> 
>   * Clarett+ 2Pre: playback val_alt=no (single alt),
>     capture val_alt=yes
> 
>   bLen=10: non-standard Focusrite Format Type descriptor with max_rate
>   in bytes 6-9 (LE u32). Standard UAC2 is bLen=6. Single-altsetting
>   devices need no rate filtering. Vocaster only supports 48kHz.
> 
> For val_alt=yes multi-alt devices, the old VALIDATE_RATES probing
> agreed with the new strict filtering. For val_alt=no (2nd Gen,
> Clarett+), the device accepts all rates up to max_rate on any
> altsetting. I confirmed this on the Scarlett 18i20 2nd Gen and
> Clarett+ 8Pre with speaker-test running 10 channels at 48kHz on the
> up-to-192kHz altsetting.
> 
> Patches
> -------
> 
> 1/4: Improve focusrite_valid_sample_rate() to check bmControls for
> UAC2_AS_VAL_ALT_SETTINGS:
>   - val_alt readable + bLength=10: strict mapping
>   - val_alt not readable + bLength=10: fallthrough (unchanged)
>   - val_alt readable + bLength!=10 + multi-alt: use the Focusrite
>     altsetting convention (alt 1=48k, 2=96k, 3=192k)
>   - otherwise: no filtering
> 
> The third case handles the Scarlett 18i8 3rd Gen, which has bLength=6
> on playback (no max_rate) but 3 altsettings with val_alt=yes,
> requiring strict mapping.
> 
> 2/4: Remove QUIRK_FLAG_VALIDATE_RATES for Focusrite. With patch 1,
> descriptor-based filtering gets the right rates without USB probing.
> 
> 3/4: Add QUIRK_FLAG_SKIP_IFACE_SETUP. Skips the probe-time interface
> setup (usb_set_interface, init_pitch, init_sample_rate) in
> __snd_usb_parse_audio_interface() which is redundant with
> snd_usb_endpoint_prepare() at stream-open time. Enabled this quirk for
> Focusrite devices. This is similar to commit ac5e2fb4 ("ALSA:
> usb-audio: Drop superfluous interface setup at parsing") but gated as
> a quirk. It's a worthwhile optimisation and is the second half of
> fixing the problem with the sample rate being changed.
> 
> 4/4: Enable QUIRK_FLAG_SKIP_CLOCK_SELECTOR for Focusrite devices.
> snd_usb_clock_find_source() reads the clock selector value then writes
> it back unchanged. On Focusrite devices this triggers an unnecessary
> ~300ms delay per altsetting.
> 
> Tested on all devices listed above: /proc/asound/card*/stream0
> identical before and after.
> 
> Regards,
> Geoffrey
> 
> Geoffrey D. Bennett (4):
>   ALSA: usb-audio: Improve Focusrite sample rate filtering
>   ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
>   ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP
>   ALSA: usb-audio: Skip clock selector for Focusrite devices

Although it's a bit risky to take, the result looks still worth for
7.0 inclusion, and the code changes look mostly only for Forcusrite
devices, so I decided to apply those to for-linus branch now.


thanks,

Takashi
