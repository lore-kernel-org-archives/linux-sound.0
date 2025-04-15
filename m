Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C929B215
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733732; cv=none; b=lCSJOQQwfceq6qvtbpQx3P6lmGFiH9lFuELr+iY3ezNjKQbZ347e3a5dGlvec2J3QBUtJIye2MHbJ3rRVdHdZ16UtfXN0Hrh0OaTQ7f4kabMBKEikjBXtIc8MIeG8wUL8wM3TIRF+phusAck6V2uqn/l1wUJcvLKCt5dgLOEQks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733732; c=relaxed/simple;
	bh=U33MmeWWZE9jDB+IRWQOxnWwEpA4BjOs76l1UMe8I+g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjAkccSqNYli5zYTxil6rniULVTd09j+ucNVaBAq+zV9uh9eVIPRkM4yhOuJ1SkEJWdt/uL7SdGAOD03m+vdzarxrLegVDvDtmtnOtrGMCyJiAXmQgNUcymmnS9scVGFYQPJFUSxggholQm8eGHDwKonl3ArBZYu7H9xvqxd5j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NbAtHnRF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n2+YABz9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NbAtHnRF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n2+YABz9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NbAtHnRF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n2+YABz9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NbAtHnRF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n2+YABz9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CCB9210F9;
	Tue, 15 Apr 2025 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744733728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4K0YD88S5KS4eIpCtQTcntzouuEvNmBbgBJCc9dufM=;
	b=NbAtHnRFwkxEvB8uYvcuT9Bai+KaW7vMkDD++4rIeNpEHNJwxeUvyY8z6dehjjN/D+Qu5R
	WCNUIIPGiP+0C/3h7kFWdENEA8Ssu26/lbEOz52rzV3NjVxbgJOY4C8kZHGcO4VUNK3f+0
	Q6aLpID8bBUtFqt7P2IFrCGbEGHSKKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744733728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4K0YD88S5KS4eIpCtQTcntzouuEvNmBbgBJCc9dufM=;
	b=n2+YABz9ElGg9d7UGo25kHj+Y2tH0BXluj7rSouL+WAalETMb1671MYYe0tR51KkwxxzjN
	M15u4jLVNxfUXaCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744733728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4K0YD88S5KS4eIpCtQTcntzouuEvNmBbgBJCc9dufM=;
	b=NbAtHnRFwkxEvB8uYvcuT9Bai+KaW7vMkDD++4rIeNpEHNJwxeUvyY8z6dehjjN/D+Qu5R
	WCNUIIPGiP+0C/3h7kFWdENEA8Ssu26/lbEOz52rzV3NjVxbgJOY4C8kZHGcO4VUNK3f+0
	Q6aLpID8bBUtFqt7P2IFrCGbEGHSKKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744733728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4K0YD88S5KS4eIpCtQTcntzouuEvNmBbgBJCc9dufM=;
	b=n2+YABz9ElGg9d7UGo25kHj+Y2tH0BXluj7rSouL+WAalETMb1671MYYe0tR51KkwxxzjN
	M15u4jLVNxfUXaCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 185A1139A1;
	Tue, 15 Apr 2025 16:15:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id of6lBCCG/mdZXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 16:15:28 +0000
Date: Tue, 15 Apr 2025 18:15:27 +0200
Message-ID: <87sem9xuxs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<broonie@kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>,
	<quic_wcheng@quicinc.com>,
	<mathias.nyman@linux.intel.com>
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
In-Reply-To: <8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
	<87v7rcwbyn.wl-tiwai@suse.de>
	<8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 11 Apr 2025 11:39:55 +0200,
Cezary Rojewski wrote:
> 
> On 2025-04-10 12:24 PM, Takashi Iwai wrote:
> > On Wed, 09 Apr 2025 13:07:15 +0200,
> > Cezary Rojewski wrote:
> >> 
> >> Note: this series is based on Mark's broonie/for-next. The xHCI
> >> dependency is missing so it won't compile.  Goal of this RFC is
> >> discussing the direction of sound/usb changes.
> >> 
> >> Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
> >> fare well with Intel's hardware design for USB Audio Offload feature.
> >> The production shape for usb/xHCI subjects is being discussed with
> >> Mathias.  Once we're ready, I'll share the rest.
> >> 
> >> Note #3: this series does _NOT_ aim to block QCOM's equivalent series
> >> [2].  The team does acknowledge that we came the "table" late.  At the
> >> same time, we're prepared to help QCOM switch to the presented sound/usb
> >> approach if that would benefit the framework and its users as a whole.
> >> Make it part of this very series if need be.
> >> 
> >> 
> >> 
> >> Apart from changes to sound/usb, the patchset contains exemplary
> >> ASoC-based, offload-aware USB driver and a small sound card on the
> >> avs-driver side to show how card/dai_link initialization looks like.
> >> 
> >> In short, USB Audio Offload functionality lowers CPU usage when
> >> streaming PCM over a USB Audio-Class device.  It has been first
> >> introduced in xHCI 1.2 release and is described in section 7.9 [3].
> >> Once hardware is prepared with hw_params(), all the USB endpoints
> >> operations e.g.: start, stop, submitting URBs, are performed
> >> internally, by the hardware and AudioDSP firmware.  Software driver
> >> shall not intervene.
> >> 
> >> Startup flow from:
> >> 
> >> 	usb_pcm_open()
> >> 	usb_pcm_hw_params()
> >> 		snd_usb_endpoint_open()
> >> 	usb_pcm_prepare()
> >> 		usb_set_interface()
> >> 		snd_usb_endpoint_start()
> >> 	usb_pcm_trigger(cmd: START/STOP etc.)
> >> 
> >> reduced to:
> >> 
> >> 	usb_pcm_open()
> >> 	usb_pcm_hw_params()
> >> 		snd_usb_endpoint_open()
> >> 	usb_pcm_prepare()
> >> 		usb_set_interface()
> > 
> > Hmm, how can it be?  The start of EP at prepare stage is done only
> > conditionally for non-lowlatency or implicit-feedback mode, for
> > example.
> 
> 
> On Intel architecture the AudioDSP utilizes internal channel to
> communicate with xHCI and perform all the transfer operations.  In
> essence, once SET_INTERFACE TRB is done, the usb-driver is not
> supposed to do anything.  The avs-driver (sound driver) would be the
> trigger here - sends the start/stop/etc. requests to the AudioDSP
> firmware, DSP does the rest.
> 
> By trigger I mean SET_PIPELINE_STATE IPC and avs_path_xxx() which are
> utilized for any transfer-type (sound/soc/intel/avs/pcm.c).

But does the DSP handles the different ways for the implicit feedback
mode, the low-latency playback and else?  A specific mode like the
implicit feedback mode is mandatory for many devices.  Similarly, the
low-latency mode is essential for some application setups
(e.g. pipewire or JACK prefers), while it's not always applicable
depending on the PCM parameters (such as the free-wheeling mode).

AFAIK, the qcom offloading doesn't support those fully, hence the
configuration must be dynamic for them.


> >> Handlers such as ack(), sync_stop(), pointer(), delay() are not used
> >> here too.  The AudioDSP driver will handle pointer(), rest is
> >> firmware/hardware responsibility.
> >> 
> >> 
> >> There's a hefty number of limitations, most importantly:
> >> 
> >> 1) typically 2 USB devices tops, rest go the classic (non-offload) path
> >> 2) AUDIOSTREAMING interfaces only, MIDI not.  While not an interface
> >>     type, Media (sound/usb/media) unsupported either
> >> 3) simple PCM, UAC_FORMAT_TYPE_I_PCM only
> >> 
> >> Current patchset shows this in form of 'udev->audsb_capable' field.
> >> True if xHCI sideband reasource has been assigned to the device.  The
> >> filtering is code is not part of the patchset.
> >> 
> >> Important to highlight, 1) means both, offload-aware and offload-unaware
> >> drivers could be utilized simultaneously on the system in runtime.
> >> Opportunistically few devices would be controlled by the offload-aware
> >> driver, whereas everything else by the offload-unaware one.  This
> >> differs from existing HDAudio Controller driver situation where either
> >> classic, snd_hda_intel driver takes complete control -or- the
> >> offload-aware snd_soc_avs driver.
> >> In short, once all Audio Sideband resources are depleted, classic
> >> sound/usb/card.c driver manages whatever comes next:
> >> 
> >> 	snd_usb_audio (offload un-aware, sound/usb/card.c)
> >> 	snd_soc_usb_codec (offload aware, sound/soc/codecs/usb.c)
> >> 
> >> 
> >> The design goals:
> >> 	- make ASoC first class citizen of sound/usb
> >> 	- re-use code found in sound/usb, mimic HDAudio integration in ASoC:
> >> 	  small sound/soc/codecs/hda.c driver leveraging power of entire
> >> 	  sound/pci/hda/
> >> 	- no shared control over a USB device, either snd_usb_audio or
> >> 	  its ASoC equivalent takes control of the device
> >> 
> >> To do that, major tasks are identified:
> >> 
> >> a) On ASoC side 'struct snd_card' is part of 'struct snd_soc_card' and
> >> is managed by the framework.  Similar situation with 'struct snd_pcm'
> >> and rtd->pcm.  To keep the teardown path sane, drop card->private_free()
> >> and pcm->private_free() usage.
> > 
> > Well, this is a generic problem of ASoC framework.
> > I believe this should be better handled in ASoC core side at first.
> > e.g. the card object could be created at the very first step of the
> > snd_soc_card creation, too (but without the actual slot assignment or
> > device creation).
> 
> 
> Well, in my opinion the card's tailing private context (extra size),
> private_free() and all that comes with them in sound/core brings
> unnecessary complexity to the ALSA framework.  devm_xxx() is
> enough. Polluting snd_card and sound/core/init.c with driver-specifics
> causes the teardown procedures on the ALSA framework side harder to
> read/maintain.

Well, I'd say it depends, and pretty much a matter of taste.  The
resources managed by the card free should be the last thing that is
tied with the card object itself.  So, yes, it can be devm, but this
wouldn't make things easier; the devm is merely a serialized release,
after all.

> >> b) To initialize ASoC components/DAI properly, PCM capabilities should be
> >> known up-front.  To do that, existing USB card probe() has to be split.
> >>  From one-stage to two-stage process:
> >> 
> >> 	- look ahead and parse usb_interface descriptors for PCM endpoints
> >> 	  but do not create any PCMs (sound devices) yet
> >> 	- create all PCMs based on obtained ->pcm_list and follow with
> >> 	  MIDI/mixers/media
> >> 
> >> Such approach allows to feed DAIs proper data even when a valid
> >> sound-card pointer is not yet present - the initialization occurs before
> >> snd_soc_bind_card() is called.
> >   This one is another thing that is needed to adjust for ASoC
> > framework.  But when snd_card object is available, this can be
> > resolved automatically, too?  e.g. snd_pcm object or such can be
> > created at that point.  The actual device registration is done anyway
> > later via snd_device_register() call.
> 
> 
> While I'm up for upgrading either framework in any area necessary to
> have proper UAO support in ASoC, not sure whether it's a good idea to
> make it a requirement for the feature.  This will enlarge the series -
> well, guess it will be separate series (dependency) entirely.

The series contains lots of hackish API exposure, and I really would
like to avoid that if possible.  In the case of HD-audio, the whole
stuff was moved to its own bus at first for adapting to ASoC hd-audio
ext implementation, but for USB-audio, I don't see the need for that
yet.  And, if the concern is about the snd_card object lifecycle and
ASoC binding, it can be improved in the lower level at first.


thanks,

Takashi
