Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504021EC014
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483900; cv=none; b=VuA5kJFY2KGR/p/AzOYep7a41PVe+ozl++sGce4EN8ZddXKCT8p8Dj1hYGPeAD0SNeDzs+RqIPu03cnFYkViUgxSyq7A53Np1dtsxbfWiMWl8WNwsZAA9UcwHKbXf+gNUGVfAHMFDucu7TwT63Lw1H98y70zB6vJJiy8umxa9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483900; c=relaxed/simple;
	bh=dqJVQWn3NYDgrnVkkoikgxlNm7naBuTMrY6GSjWWixs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dVPS1FeYeTY0NliY403fwFcKr+WA6OcsVLZorUxN2MXF+RNF/GdclYjbgfn4FqOG6wHxHBHrbj8qrt+4eG22KjgHXdxJZeWo/5d0O7VEYs3uVigoUyCzXoEs416qXBnE1nSJQX+yWLQdC/pHOUow6UDX2ipUoM+hminsmyydzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A7yA4IXr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LJxphoV4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A7yA4IXr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LJxphoV4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A7yA4IXr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LJxphoV4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A7yA4IXr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LJxphoV4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F4831F7CF;
	Mon, 14 Jul 2025 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752483896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKvi05zq841otAnbOuRDjoJoNKmnSlXXyLw2jodueU8=;
	b=A7yA4IXrJDV0/Ez9iqdgTZjMa5xawiejRLprgGrztZevCBfb6M66/CdmIsAEetbJ2COIb8
	UaYd20jXa94LuxrMCuL6/6wfgAif/bH/f4NWbpEYRwup1+7+5gZO+soTxjRZ6/JaQTuNE2
	50EmZUXnUWVaaro2XQ/2wROLY2eF55U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752483896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKvi05zq841otAnbOuRDjoJoNKmnSlXXyLw2jodueU8=;
	b=LJxphoV41YjElzxeFVTK/44ayqF9onfO/bMg23vv68ijNELr7GjvkGYXU0BOP1VTu/mv8M
	5qBs8waXnttdKyCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752483896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKvi05zq841otAnbOuRDjoJoNKmnSlXXyLw2jodueU8=;
	b=A7yA4IXrJDV0/Ez9iqdgTZjMa5xawiejRLprgGrztZevCBfb6M66/CdmIsAEetbJ2COIb8
	UaYd20jXa94LuxrMCuL6/6wfgAif/bH/f4NWbpEYRwup1+7+5gZO+soTxjRZ6/JaQTuNE2
	50EmZUXnUWVaaro2XQ/2wROLY2eF55U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752483896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKvi05zq841otAnbOuRDjoJoNKmnSlXXyLw2jodueU8=;
	b=LJxphoV41YjElzxeFVTK/44ayqF9onfO/bMg23vv68ijNELr7GjvkGYXU0BOP1VTu/mv8M
	5qBs8waXnttdKyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F8D2138A1;
	Mon, 14 Jul 2025 09:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iPE2DjjIdGgGOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Jul 2025 09:04:56 +0000
Date: Mon, 14 Jul 2025 11:04:55 +0200
Message-ID: <87h5zfqh1k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,<linux-sound@vger.kernel.org>,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Kailang <kailang@realtek.com>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi?=
 =?ISO-8859-2?Q?=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,<patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>,	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs directory
In-Reply-To: <b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
References: <20250709160434.1859-1-tiwai@suse.de>
	<20250709160434.1859-7-tiwai@suse.de>
	<b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 14 Jul 2025 10:57:59 +0200,
Cezary Rojewski wrote:
> 
> On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> > Now move the all remaining codec drivers from sound/pci/hda to
> > sound/hda/codecs subdirectory.  Some drivers are put under the further
> > vendor subdirectory, and the vendor helper code (*_helper.c) are put
> > under helpers subdirectory.  Also the sub-codec drivers are moved under
> > a different subdirectory, sound/hda/codecs/sub-codecs, for
> > distinguishing from the main HD-audio codec drivers.
> > 
> > The prefix patch_ and hda_ as well as the suffix _helper are dropped
> > from file names as they are mostly superfluous.
> > 
> > No functional changes but just file path shuffling.
> > 
> 
> Path: codecs/side-codecs/ looks wierd. My suggestion is to avoid the
> repeat and stay with codecs/side/.

Sorry, too late, I already merged the stuff.  (And IMO codecs/side
doesn't sound intuitive.)

Since the directory names are more or less understandable, and Cirrus
people seem OK with it, so let's leave as is.


thanks,

Takashi

> 
> In regard to 'helpers', I believe some of these .c files could be
> converted to headers and lie in sound/hda/quirks/ directory. These are
> more of a platform-level files, not sound/hda/codecs/ per-se.
> 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >   sound/hda/Kconfig                             |   1 +
> >   sound/hda/Makefile                            |   1 +
> >   sound/{pci/hda => hda/codecs}/Kconfig         | 158 +-----------------
> >   sound/hda/codecs/Makefile                     |  31 ++++
> >   .../patch_analog.c => hda/codecs/analog.c}    |   2 +-
> >   .../patch_ca0110.c => hda/codecs/ca0110.c}    |   2 +-
> >   .../patch_ca0132.c => hda/codecs/ca0132.c}    |   2 +-
> >   sound/{pci/hda => hda/codecs}/ca0132_regs.h   |   0
> >   sound/hda/codecs/cirrus/Kconfig               |  21 +++
> >   sound/hda/codecs/cirrus/Makefile              |   8 +
> >   .../codecs/cirrus/cirrus.c}                   |   2 +-
> >   .../codecs/cirrus/cs8409-tables.c}            |   4 +-
> >   .../codecs/cirrus/cs8409.c}                   |   2 +-
> >   .../codecs/cirrus/cs8409.h}                   |   2 +-
> >   .../patch_cmedia.c => hda/codecs/cmedia.c}    |   2 +-
> >   .../codecs/conexant.c}                        |   6 +-
> >   .../hda_generic.c => hda/codecs/generic.c}    |   2 +-
> >   .../hda_generic.h => hda/codecs/generic.h}    |   0
> >   sound/hda/codecs/hdmi/Makefile                |   6 +
> >   .../hda/hda_eld.c => hda/codecs/hdmi/eld.c}   |   0
> >   .../patch_hdmi.c => hda/codecs/hdmi/hdmi.c}   |   2 +-
> >   .../codecs/helpers/hp_x360.c}                 |   0
> >   .../codecs/helpers/ideapad_hotkey_led.c}      |   0
> >   .../codecs/helpers/ideapad_s740.c}            |   0
> >   .../codecs/helpers/thinkpad.c}                |   0
> >   .../patch_realtek.c => hda/codecs/realtek.c}  |  12 +-
> >   .../codecs/senarytech.c}                      |   4 +-
> >   .../patch_si3054.c => hda/codecs/si3054.c}    |   0
> >   sound/hda/codecs/side-codecs/Kconfig          | 128 ++++++++++++++
> >   sound/hda/codecs/side-codecs/Makefile         |  28 ++++
> >   .../codecs/side-codecs}/cirrus_scodec.c       |   0
> >   .../codecs/side-codecs}/cirrus_scodec.h       |   0
> >   .../codecs/side-codecs}/cirrus_scodec_test.c  |   0
> >   .../codecs/side-codecs}/cs35l41_hda.c         |   2 +-
> >   .../codecs/side-codecs}/cs35l41_hda.h         |   0
> >   .../codecs/side-codecs}/cs35l41_hda_i2c.c     |   0
> >   .../side-codecs}/cs35l41_hda_property.c       |   0
> >   .../side-codecs}/cs35l41_hda_property.h       |   0
> >   .../codecs/side-codecs}/cs35l41_hda_spi.c     |   0
> >   .../codecs/side-codecs}/cs35l56_hda.c         |   2 +-
> >   .../codecs/side-codecs}/cs35l56_hda.h         |   0
> >   .../codecs/side-codecs}/cs35l56_hda_i2c.c     |   0
> >   .../codecs/side-codecs}/cs35l56_hda_spi.c     |   0
> >   .../codecs/side-codecs}/hda_component.c       |   0
> >   .../codecs/side-codecs}/hda_component.h       |   0
> >   .../codecs/side-codecs}/tas2781_hda.c         |   0
> >   .../codecs/side-codecs}/tas2781_hda.h         |   0
> >   .../codecs/side-codecs}/tas2781_hda_i2c.c     |   2 +-
> >   .../codecs/side-codecs}/tas2781_hda_spi.c     |   2 +-
> >   .../codecs/sigmatel.c}                        |   4 +-
> >   .../{pci/hda/patch_via.c => hda/codecs/via.c} |   2 +-
> >   sound/pci/Kconfig                             |   2 -
> >   sound/pci/Makefile                            |   1 -
> >   sound/pci/hda/Makefile                        |  61 -------
> >   54 files changed, 257 insertions(+), 247 deletions(-)
> >   rename sound/{pci/hda => hda/codecs}/Kconfig (55%)
> >   create mode 100644 sound/hda/codecs/Makefile
> >   rename sound/{pci/hda/patch_analog.c => hda/codecs/analog.c} (99%)
> >   rename sound/{pci/hda/patch_ca0110.c => hda/codecs/ca0110.c} (98%)
> >   rename sound/{pci/hda/patch_ca0132.c => hda/codecs/ca0132.c} (99%)
> >   rename sound/{pci/hda => hda/codecs}/ca0132_regs.h (100%)
> >   create mode 100644 sound/hda/codecs/cirrus/Kconfig
> >   create mode 100644 sound/hda/codecs/cirrus/Makefile
> >   rename sound/{pci/hda/patch_cirrus.c => hda/codecs/cirrus/cirrus.c} (99%)
> >   rename sound/{pci/hda/patch_cs8409-tables.c => hda/codecs/cirrus/cs8409-tables.c} (99%)
> >   rename sound/{pci/hda/patch_cs8409.c => hda/codecs/cirrus/cs8409.c} (99%)
> >   rename sound/{pci/hda/patch_cs8409.h => hda/codecs/cirrus/cs8409.h} (99%)
> >   rename sound/{pci/hda/patch_cmedia.c => hda/codecs/cmedia.c} (99%)
> >   rename sound/{pci/hda/patch_conexant.c => hda/codecs/conexant.c} (99%)
> >   rename sound/{pci/hda/hda_generic.c => hda/codecs/generic.c} (99%)
> >   rename sound/{pci/hda/hda_generic.h => hda/codecs/generic.h} (100%)
> >   create mode 100644 sound/hda/codecs/hdmi/Makefile
> >   rename sound/{pci/hda/hda_eld.c => hda/codecs/hdmi/eld.c} (100%)
> >   rename sound/{pci/hda/patch_hdmi.c => hda/codecs/hdmi/hdmi.c} (99%)
> >   rename sound/{pci/hda/hp_x360_helper.c => hda/codecs/helpers/hp_x360.c} (100%)
> >   rename sound/{pci/hda/ideapad_hotkey_led_helper.c => hda/codecs/helpers/ideapad_hotkey_led.c} (100%)
> >   rename sound/{pci/hda/ideapad_s740_helper.c => hda/codecs/helpers/ideapad_s740.c} (100%)
> >   rename sound/{pci/hda/thinkpad_helper.c => hda/codecs/helpers/thinkpad.c} (100%)
> >   rename sound/{pci/hda/patch_realtek.c => hda/codecs/realtek.c} (99%)
> >   rename sound/{pci/hda/patch_senarytech.c => hda/codecs/senarytech.c} (98%)
> >   rename sound/{pci/hda/patch_si3054.c => hda/codecs/si3054.c} (100%)
> >   create mode 100644 sound/hda/codecs/side-codecs/Kconfig
> >   create mode 100644 sound/hda/codecs/side-codecs/Makefile
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.h (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec_test.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.c (99%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.h (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_i2c.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.h (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_spi.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.c (99%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.h (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_i2c.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_spi.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.h (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.c (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.h (100%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_i2c.c (99%)
> >   rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_spi.c (99%)
> >   rename sound/{pci/hda/patch_sigmatel.c => hda/codecs/sigmatel.c} (99%)
> >   rename sound/{pci/hda/patch_via.c => hda/codecs/via.c} (99%)
> >   delete mode 100644 sound/pci/hda/Makefile
