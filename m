Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545138DEC
	for <linux-sound@vger.kernel.org>; Sat,  6 Sep 2025 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757181836; cv=none; b=OEMJxZKqD/M+zRw5Nr58EgOAIRQT0w770jmlUU0OF3OmaFZPtW7+r5WtOeeL5l8AL1r3Hw1WCdXVUtfhFFEsg5vPzDFro4cgl9A4jbuNZuRnfH352q/eD9IqS3gT1UNCTGGfQPN/EQJ9zZ9aGaBXEJJCTritYlVKVJwkJ1Cv7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757181836; c=relaxed/simple;
	bh=RZup3NZmO83NYae2dSPVW8q+in1k9gyM220EZcDqgfQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByNNtkN4KA5dMyrNVFVmYowhNcTWu+VUL+x80HmR/WtBf8QbONvCLW3f8y9tHdAZvriNZ3sBuKnhHnoAfJGan7JqXn0xQpud7Ht2BXposTQhwE05WykyMP2KHCrHVu2dJ5Z6ENlPCsUriQigida/xzwqcYytVvJtawYxi97aZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tz2VXJME; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yfOHKRvI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W6ODQXkk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVYfEzq/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tz2VXJME";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yfOHKRvI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W6ODQXkk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVYfEzq/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6820433699;
	Sat,  6 Sep 2025 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757181826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPZCNOi/+GLmm+57iXf9PCATAuFRqS2F/GOs1GMp5XI=;
	b=Tz2VXJMEhemMs34GtO2FvhPWqK1ky9RpMVe52Ac5RLmKoYNdioxAtaC2JPS6mFKJ5nM59h
	Q7bume/J6wH3ZtHcqdu7AFMs2YA1SIQaZrHPps8w9KmuYMOqnKX6UpE+1DL5Ye84g4/YpX
	+NfEAd7wpH8LhnizPyExOKZTQH6TZWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757181826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPZCNOi/+GLmm+57iXf9PCATAuFRqS2F/GOs1GMp5XI=;
	b=yfOHKRvIrfZut8INiMFRiuis/AurmI1BPcwn1If24LK4My4pdQsM9yXiaZowOxX0bTkDss
	9fDpmtJSzK2DkSAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757181825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPZCNOi/+GLmm+57iXf9PCATAuFRqS2F/GOs1GMp5XI=;
	b=W6ODQXkk27AULyVcPouJig1Z8P8xXw6RpI0gk74q5kMKZnSYq6G5uauEWJ+7hiKtUKfaEf
	EMKDAo/9YGKcVYPFw+xU7jkZd/HKf+ZFlM3rQGr60K/i3IrAlakBuL7MhZEKBVJXbfgOru
	bPOgKipHdXLlM9KZp6WxVrFKcGljmkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757181825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPZCNOi/+GLmm+57iXf9PCATAuFRqS2F/GOs1GMp5XI=;
	b=RVYfEzq/9R2bjDmmseXRTEbBTt6wTvtFZdi+/W555lHqnKo+1NIxzsbtXXpY7VSVLWjfxz
	/ZZt/VLrLlj1eNCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 472EB133F9;
	Sat,  6 Sep 2025 18:03:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O9MmD4F3vGg4GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Sep 2025 18:03:45 +0000
Date: Sat, 06 Sep 2025 20:03:44 +0200
Message-ID: <87ecsjmpa7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Add Vocaster speaker/headphone mute controls
In-Reply-To: <87h5xhqf3u.wl-tiwai@suse.de>
References: <aLm2Dy6+O/eLTGVn@m.b4.vu>
	<87y0qtqos3.wl-tiwai@suse.de>
	<aLrOwOb+6vhdzJzS@m.b4.vu>
	<87h5xhqf3u.wl-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,b4.vu:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 05 Sep 2025 14:05:25 +0200,
Takashi Iwai wrote:
> 
> On Fri, 05 Sep 2025 13:51:28 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > On Fri, Sep 05, 2025 at 10:36:28AM +0200, Takashi Iwai wrote:
> > > On Thu, 04 Sep 2025 17:53:51 +0200,
> > > Geoffrey D. Bennett wrote:
> > > > 
> > > > Add support for the speaker and headphone mute controls on Focusrite
> > > > Vocaster interfaces. Unlike other Focusrite interfaces, these mute
> > > > controls are per-output, not per-channel.
> > > > 
> > > > Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> > > > ---
> > > >  sound/usb/mixer_scarlett2.c | 97 ++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 96 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
> > > > index e762d6110b1a..f2446bf3982c 100644
> > > > --- a/sound/usb/mixer_scarlett2.c
> > > > +++ b/sound/usb/mixer_scarlett2.c
> > > > @@ -10,8 +10,9 @@
> > > >   *   - Solo/2i2/4i4 Gen 4
> > > >   *   - Clarett 2Pre/4Pre/8Pre USB
> > > >   *   - Clarett+ 2Pre/4Pre/8Pre
> > > > + *   - Vocaster One/Two
> > > >   *
> > > > - *   Copyright (c) 2018-2024 by Geoffrey D. Bennett <g at b4.vu>
> > > > + *   Copyright (c) 2018-2025 by Geoffrey D. Bennett <g at b4.vu>
> > > >   *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
> > > >   *   Copyright (c) 2022 by Christian Colglazier <christian@cacolglazier.com>
> > > >   *
> > > > @@ -75,6 +76,9 @@
> > > >   * to many LinuxMusicians people and to Focusrite for hardware
> > > >   * donations).
> > > >   *
> > > > + * Support for Vocaster One and Two added in Mar 2024 (thanks to many
> > > > + * LinuxMusicians people and to Focusrite for hardware donations).
> > > > + *
> > > >   * This ALSA mixer gives access to (model-dependent):
> > > >   *  - input, output, mixer-matrix muxes
> > > >   *  - mixer-matrix gain stages
> > > > @@ -364,6 +368,21 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
> > > >  	"Mute Playback Switch", "Dim Playback Switch"
> > > >  };
> > > >  
> > > > +/* Vocaster One speaker/headphone mute names */
> > > > +static const char *const vocaster_one_sp_hp_mute_names[] = {
> > > > +	"Speaker Mute Playback Switch",
> > > > +	"Headphones Mute Playback Switch",
> > > 
> > > Usually "XXX Playback Switch" indicates that it's a switch for
> > > mute/unmute, hence we don't put "Mute" here.
> > > 
> > > Actually, having a "mute" switch makes difficult to judge how it
> > > behaves: when the mixer switch is "on", is it muted, i.e. the sound
> > > goes off?  It's a contradiction to other mixer controls.
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> > 
> > Hi Takashi,
> > 
> > Calling it "XXX Mute Playback Switch" distinguishes it from the other
> > "XXX Playback Switch" controls created by the scarlett2 driver which
> > are not mute controls, and it also follows the existing pattern for
> > the other switch controls in the scarlett2 driver.
> > 
> > Some examples:
> > 
> > $ grep 'Playback Switch' *.state
> > ...
> > [actual mutes:]
> > Clarett Plus 2Pre.state:                name 'Line 01 Mute Playback Switch'
> > Clarett Plus 2Pre.state:                name 'Line 02 Mute Playback Switch'
> > Clarett Plus 2Pre.state:                name 'Line 03 Mute Playback Switch'
> > Clarett Plus 2Pre.state:                name 'Line 04 Mute Playback Switch'
> > Clarett Plus 2Pre.state:                name 'Mute Playback Switch'
> > ...
> > [other boolean controls, not mutes:]
> > Clarett Plus 2Pre.state:                name 'Dim Playback Switch'
> > Scarlett Gen 3 Solo.state:              name 'Direct Monitor Playback Switch'
> > Scarlett Gen 3 18i20.state:             name 'Talkback Mix A Playback Switch'
> > ...
> > Scarlett Gen 3 18i20.state:             name 'Talkback Mix L Playback Switch'
> > Scarlett Gen 4 16i16.state:             name 'Speaker Switching Playback Switch'
> > Scarlett Gen 4 16i16.state:             name 'Speaker Switching Alt Playback Switch'
> > 
> > I have been consistent since I first added mute support in
> > 0c88f9db1910 ("ALSA: usb-audio: scarlett2: Add mute support") in the
> > use of the terminology "XXX Mute Playback Switch" and the clear logic
> > of:
> > - mute on means that it's muted (no sound).
> > - mute off means that it's not muted.
> > 
> > I think usually "XXX Playback Switch" in other drivers is more of an
> > "enable audio" boolean rather than a "mute" boolean, so there it makes
> > sense that off = muted, on = not muted.
> > 
> > On the capture side in the scarlett2 driver, it is similar:
> > 
> > $ grep Switch V*
> > Vocaster One.state:             name 'MSD Mode Switch'
> > Vocaster One.state:             name 'Line In 1 DSP Capture Switch'
> > Vocaster One.state:             name 'Line In 1 Mute Capture Switch'
> > Vocaster One.state:             name 'Line In 1 Phantom Power Capture Switch'
> > Vocaster One.state:             name 'Line In 1 Autogain Capture Switch'
> > Vocaster Two.state:             name 'MSD Mode Switch'
> > Vocaster Two.state:             name 'Line In 1 DSP Capture Switch'
> > Vocaster Two.state:             name 'Line In 2 DSP Capture Switch'
> > Vocaster Two.state:             name 'Line In 1 Mute Capture Switch'
> > Vocaster Two.state:             name 'Line In 2 Mute Capture Switch'
> > Vocaster Two.state:             name 'Line In 1 Phantom Power Capture Switch'
> > Vocaster Two.state:             name 'Line In 2 Phantom Power Capture Switch'
> > Vocaster Two.state:             name 'Line In 1 Autogain Capture Switch'
> > Vocaster Two.state:             name 'Line In 2 Autogain Capture Switch'
> > 
> > alsamixer removes "Switch" and "Capture" from the name and displays
> > e.g.:
> > - Line In 1 DSP
> > - Line In 1 Mute
> > - Line In 1 Phantom Power
> > 
> > For each of those, off means function disabled and on means function
> > enabled, so the naming in my patch maintains consistency with all the
> > existing device controls. It also reflects the hardware where they are
> > called mute controls, and 0 = not muted, 1 = muted.
> > 
> > Does this address your concerns? The alternative would be to rename to
> > "XXX Playback Switch" and make off = mute. I think that would make it
> > more consistent with other drivers, but less consistent with the
> > existing device controls.
> 
> Hm, so it was no right choice to accept the changes in the past.
> The negative switch is always confusing.  But maybe we should accept
> again once after a similar stuff was already merged; otherwise it'll
> lead to more inconsistency.

So I took the patch for now as is.


thanks,

Takashi
