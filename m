Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451B26B0BC
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280694; cv=none; b=sSqlvprxhSkv43/mzJTp4lfhJxBkZccCZJ6PdXKe7nhyT8QzXfHJNfONtk9CMwSzUnTeYbYw3ge9XKHzTzBPzwhTSmaZzKecG9wnkrR38FhN22n2bmx6pxDpPlC3jhq3Y20BjRm2Yx3QglmG0O9jJe6QPcKfHaGF5yag+4ArotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280694; c=relaxed/simple;
	bh=sTMdgAnOw7EpR3NLOn+WjWuMVEXRa1lwsyFqd1vP6lc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzRHqw84gYaVep73e//YcrXNXTvl2prxMmZcI1YjLMNqdplaX+3yYX1WCGn+m7+6uc0xYQ56InP403uOPzErGgjlBtDfJH2zz6bxrkEnoGxhsJgc/EJ6YEnDc4/rb1R1gNza7WkfEsLYiCSbm0V+JSne6ESnqEFKZHsRupBpo7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T6fgBuUP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+zVA46fd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T6fgBuUP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+zVA46fd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T6fgBuUP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+zVA46fd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T6fgBuUP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+zVA46fd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6D7E211A8;
	Thu, 10 Apr 2025 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744280689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vp2z38OKemGzQ5icuR3OelWOaEemKX5Qf+4C0Gq98qA=;
	b=T6fgBuUPvk2d7Ujyz/qseQHtzofuJ+FfMWjqQa9x1OWlRczIxmRe4rVzjTPVbgReg1x+Lr
	uAIvPxNhvbjghc7lhyI9tORmDD/YMGF6dAfR9q0ok6lUZ5NBdPXZZrnbA8ADhCut1Ql8SK
	h1FGwG/pOsPLI+vjMGaLkk/g07iT/hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744280689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vp2z38OKemGzQ5icuR3OelWOaEemKX5Qf+4C0Gq98qA=;
	b=+zVA46fd5CfOe9R4SWsPYACyDs96/aqx1OqwOFPWX5kPhGvDWjPNGPmkdEGWh47rrBy3FC
	d9jE7ENC64By2tBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744280689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vp2z38OKemGzQ5icuR3OelWOaEemKX5Qf+4C0Gq98qA=;
	b=T6fgBuUPvk2d7Ujyz/qseQHtzofuJ+FfMWjqQa9x1OWlRczIxmRe4rVzjTPVbgReg1x+Lr
	uAIvPxNhvbjghc7lhyI9tORmDD/YMGF6dAfR9q0ok6lUZ5NBdPXZZrnbA8ADhCut1Ql8SK
	h1FGwG/pOsPLI+vjMGaLkk/g07iT/hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744280689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vp2z38OKemGzQ5icuR3OelWOaEemKX5Qf+4C0Gq98qA=;
	b=+zVA46fd5CfOe9R4SWsPYACyDs96/aqx1OqwOFPWX5kPhGvDWjPNGPmkdEGWh47rrBy3FC
	d9jE7ENC64By2tBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5663813886;
	Thu, 10 Apr 2025 10:24:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZV8SE3Gc92fSLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Apr 2025 10:24:49 +0000
Date: Thu, 10 Apr 2025 12:24:48 +0200
Message-ID: <87v7rcwbyn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,intel.com:url]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 09 Apr 2025 13:07:15 +0200,
Cezary Rojewski wrote:
> 
> Note: this series is based on Mark's broonie/for-next. The xHCI
> dependency is missing so it won't compile.  Goal of this RFC is
> discussing the direction of sound/usb changes.
> 
> Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
> fare well with Intel's hardware design for USB Audio Offload feature.
> The production shape for usb/xHCI subjects is being discussed with
> Mathias.  Once we're ready, I'll share the rest.
> 
> Note #3: this series does _NOT_ aim to block QCOM's equivalent series
> [2].  The team does acknowledge that we came the "table" late.  At the
> same time, we're prepared to help QCOM switch to the presented sound/usb
> approach if that would benefit the framework and its users as a whole.
> Make it part of this very series if need be.
> 
> 
> 
> Apart from changes to sound/usb, the patchset contains exemplary
> ASoC-based, offload-aware USB driver and a small sound card on the
> avs-driver side to show how card/dai_link initialization looks like.
> 
> In short, USB Audio Offload functionality lowers CPU usage when
> streaming PCM over a USB Audio-Class device.  It has been first
> introduced in xHCI 1.2 release and is described in section 7.9 [3].
> Once hardware is prepared with hw_params(), all the USB endpoints
> operations e.g.: start, stop, submitting URBs, are performed
> internally, by the hardware and AudioDSP firmware.  Software driver
> shall not intervene.
> 
> Startup flow from:
> 
> 	usb_pcm_open()
> 	usb_pcm_hw_params()
> 		snd_usb_endpoint_open()
> 	usb_pcm_prepare()
> 		usb_set_interface()
> 		snd_usb_endpoint_start()
> 	usb_pcm_trigger(cmd: START/STOP etc.)
> 
> reduced to:
> 
> 	usb_pcm_open()
> 	usb_pcm_hw_params()
> 		snd_usb_endpoint_open()
> 	usb_pcm_prepare()
> 		usb_set_interface()

Hmm, how can it be?  The start of EP at prepare stage is done only
conditionally for non-lowlatency or implicit-feedback mode, for
example.

> Handlers such as ack(), sync_stop(), pointer(), delay() are not used
> here too.  The AudioDSP driver will handle pointer(), rest is
> firmware/hardware responsibility.
> 
> 
> There's a hefty number of limitations, most importantly:
> 
> 1) typically 2 USB devices tops, rest go the classic (non-offload) path
> 2) AUDIOSTREAMING interfaces only, MIDI not.  While not an interface
>    type, Media (sound/usb/media) unsupported either
> 3) simple PCM, UAC_FORMAT_TYPE_I_PCM only
> 
> Current patchset shows this in form of 'udev->audsb_capable' field.
> True if xHCI sideband reasource has been assigned to the device.  The
> filtering is code is not part of the patchset.
> 
> Important to highlight, 1) means both, offload-aware and offload-unaware
> drivers could be utilized simultaneously on the system in runtime.
> Opportunistically few devices would be controlled by the offload-aware
> driver, whereas everything else by the offload-unaware one.  This
> differs from existing HDAudio Controller driver situation where either
> classic, snd_hda_intel driver takes complete control -or- the
> offload-aware snd_soc_avs driver.
> In short, once all Audio Sideband resources are depleted, classic
> sound/usb/card.c driver manages whatever comes next:
> 
> 	snd_usb_audio (offload un-aware, sound/usb/card.c)
> 	snd_soc_usb_codec (offload aware, sound/soc/codecs/usb.c)
> 
> 
> The design goals:
> 	- make ASoC first class citizen of sound/usb
> 	- re-use code found in sound/usb, mimic HDAudio integration in ASoC:
> 	  small sound/soc/codecs/hda.c driver leveraging power of entire
> 	  sound/pci/hda/
> 	- no shared control over a USB device, either snd_usb_audio or
> 	  its ASoC equivalent takes control of the device
> 
> To do that, major tasks are identified:
> 
> a) On ASoC side 'struct snd_card' is part of 'struct snd_soc_card' and
> is managed by the framework.  Similar situation with 'struct snd_pcm'
> and rtd->pcm.  To keep the teardown path sane, drop card->private_free()
> and pcm->private_free() usage.

Well, this is a generic problem of ASoC framework.
I believe this should be better handled in ASoC core side at first.
e.g. the card object could be created at the very first step of the
snd_soc_card creation, too (but without the actual slot assignment or
device creation).

> b) To initialize ASoC components/DAI properly, PCM capabilities should be
> known up-front.  To do that, existing USB card probe() has to be split.
> From one-stage to two-stage process:
> 
> 	- look ahead and parse usb_interface descriptors for PCM endpoints
> 	  but do not create any PCMs (sound devices) yet
> 	- create all PCMs based on obtained ->pcm_list and follow with
> 	  MIDI/mixers/media
> 
> Such approach allows to feed DAIs proper data even when a valid
> sound-card pointer is not yet present - the initialization occurs before
> snd_soc_bind_card() is called.
 
This one is another thing that is needed to adjust for ASoC
framework.  But when snd_card object is available, this can be
resolved automatically, too?  e.g. snd_pcm object or such can be
created at that point.  The actual device registration is done anyway
later via snd_device_register() call.


thanks,

Takashi

> Point a) is scaled for all three "domains" of sound/usb: chip, stream
> and quirks.  That's why there total of 6 commits doing that job.  First
> implement, then switch.  Everything that follows is, in my opinion,
> self-explanatory.  No need to repeat commit messages.
> 
> 
> [1]: https://lore.kernel.org/all/20250319005141.312805-2-quic_wcheng@quicinc.com/
> [2]: https://lore.kernel.org/all/20250319005141.312805-1-quic_wcheng@quicinc.com/
> [3]: https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
> 
> 
> Cezary Rojewski (15):
>   ALSA: usb: Move media-filters to the media code
>   ALSA: usb: Drop private_free() usage for card and pcms
>   ALSA: usb: Relocate the usbaudio header file
>   ALSA: usb: Implement two-stage quirk applying mechanism
>   ALSA: usb: Implement two-stage stream creation mechanism
>   ALSA: usb: Implement two-stage chip probing mechanism
>   ALSA: usb: Switch to the two-stage chip probing
>   ALSA: usb: Switch to the two-stage stream creation
>   ALSA: usb: Switch to the two-stage quirk applying
>   ALSA: usb: Export PCM operations
>   ALSA: usb: Export usb_interface driver operations
>   ALSA: usb: Export card-naming procedure
>   ALSA: usb: Add getters to obtain endpoint information
>   ASoC: codecs: Add USB-Audio driver
>   ASoC: Intel: avs: Add USB machine board
> 
>  include/linux/usb.h                         |  15 +
>  include/linux/usb/ch9.h                     |  11 +
>  sound/usb/usbaudio.h => include/sound/usb.h |  53 +-
>  include/sound/usb_offload.h                 |  46 +
>  sound/soc/codecs/Kconfig                    |   6 +
>  sound/soc/codecs/Makefile                   |   2 +
>  sound/soc/codecs/usb.c                      | 441 +++++++++
>  sound/soc/intel/avs/boards/Kconfig          |   8 +
>  sound/soc/intel/avs/boards/Makefile         |   2 +
>  sound/soc/intel/avs/boards/usb.c            | 115 +++
>  sound/usb/caiaq/device.h                    |   2 +-
>  sound/usb/card.c                            | 946 +++++++++++++-------
>  sound/usb/card.h                            |   4 +-
>  sound/usb/clock.c                           |   2 +-
>  sound/usb/endpoint.c                        |   2 +-
>  sound/usb/format.c                          |   2 +-
>  sound/usb/helper.c                          |   2 +-
>  sound/usb/implicit.c                        |   2 +-
>  sound/usb/media.c                           |   8 +-
>  sound/usb/midi.c                            |   2 +-
>  sound/usb/midi.h                            |   2 +
>  sound/usb/midi2.c                           |   2 +-
>  sound/usb/midi2.h                           |   1 +
>  sound/usb/misc/ua101.c                      |   2 +-
>  sound/usb/mixer.c                           |   2 +-
>  sound/usb/mixer_quirks.c                    |   2 +-
>  sound/usb/mixer_s1810c.c                    |   2 +-
>  sound/usb/mixer_scarlett.c                  |   2 +-
>  sound/usb/mixer_scarlett2.c                 |   2 +-
>  sound/usb/mixer_us16x08.c                   |   2 +-
>  sound/usb/pcm.c                             | 161 +++-
>  sound/usb/power.c                           |   2 +-
>  sound/usb/proc.c                            |   2 +-
>  sound/usb/quirks.c                          | 203 +++--
>  sound/usb/quirks.h                          |   6 +
>  sound/usb/stream.c                          | 217 +++--
>  sound/usb/stream.h                          |   2 +
>  sound/usb/usx2y/us122l.c                    |   2 +-
>  sound/usb/usx2y/usX2Yhwdep.c                |   1 +
>  sound/usb/usx2y/usbusx2y.h                  |   2 +-
>  sound/usb/validate.c                        |   2 +-
>  41 files changed, 1749 insertions(+), 541 deletions(-)
>  rename sound/usb/usbaudio.h => include/sound/usb.h (82%)
>  create mode 100644 include/sound/usb_offload.h
>  create mode 100644 sound/soc/codecs/usb.c
>  create mode 100644 sound/soc/intel/avs/boards/usb.c
> 
> -- 
> 2.25.1
> 
