Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475E13AA2D
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688909; cv=none; b=eXWhYMZp3LJNVxdZMARITB0OgLFfStEqxfU2iVMdN7BwfSLaVBhGePIZ+meRqb57/hpcQ51FdDtY3IJU7xHsrkSng71vz8OQ+Kzj+qdVGNl8Pb7/ve5XI7ys68r+oVe2gx7lBNGHyvu11mDfYnSCe4RcAlv7sBHeLV89wwtlAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688909; c=relaxed/simple;
	bh=ZBuIGqieBWOj7DjQHjbQgzCXotdLMKW0MlfrpoifT9Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCtXK5PoPveebw9JUU8+G3jZQb2Rtgn8EHWmU++UL1Vlc4J89F+apda8KCaH1iYf8rFCE3OUB3mMgtFcUXBrskpe6mqGzSzQ3BJnOqTslI35yjNrz7yuFu4L/yzTL8+dYFV7YMaKIKv9m64oROwkNeHRwxPtUCOPkDD3xm2r8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QRs5DWfa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RsgrITrA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QRs5DWfa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RsgrITrA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QRs5DWfa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RsgrITrA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QRs5DWfa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RsgrITrA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 601E5211B8;
	Thu,  3 Apr 2025 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743688905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7F5F5alWVll8UGs6ADznKZ02iyhpnp/4KiE1FHsaa2A=;
	b=QRs5DWfaVIE9rcFKDFxsAg1i96dfS6tg7dFNI6zwSHbqm4N5ew2Aa9xINN9LlWNWlIbnTR
	aXqDkxo2CGshHqd05XdcggHQsyG3XuOOHhmUFzKWwI0Gz9ghF4/paytgN5a4Og77/uUdgY
	xQYyEfb1RvaVK8SZrKY6asiEA/BrZF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743688905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7F5F5alWVll8UGs6ADznKZ02iyhpnp/4KiE1FHsaa2A=;
	b=RsgrITrArOtdLTTRmhNnJLl6qnd2wiwRvVeiJjIgjQNCNvR2N/0eWir/Mmo1v04tk+GyOQ
	beT6igCOfdLWUNBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743688905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7F5F5alWVll8UGs6ADznKZ02iyhpnp/4KiE1FHsaa2A=;
	b=QRs5DWfaVIE9rcFKDFxsAg1i96dfS6tg7dFNI6zwSHbqm4N5ew2Aa9xINN9LlWNWlIbnTR
	aXqDkxo2CGshHqd05XdcggHQsyG3XuOOHhmUFzKWwI0Gz9ghF4/paytgN5a4Og77/uUdgY
	xQYyEfb1RvaVK8SZrKY6asiEA/BrZF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743688905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7F5F5alWVll8UGs6ADznKZ02iyhpnp/4KiE1FHsaa2A=;
	b=RsgrITrArOtdLTTRmhNnJLl6qnd2wiwRvVeiJjIgjQNCNvR2N/0eWir/Mmo1v04tk+GyOQ
	beT6igCOfdLWUNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F88C13A2C;
	Thu,  3 Apr 2025 14:01:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LnCDAsmU7meBTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Apr 2025 14:01:45 +0000
Date: Thu, 03 Apr 2025 16:01:44 +0200
Message-ID: <871pu95oon.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
	<87h637znpp.wl-tiwai@suse.de>
	<35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
	<8734eryn21.wl-tiwai@suse.de>
	<ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
	<87v7rmylc5.wl-tiwai@suse.de>
	<d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
	<87o6xeyfkk.wl-tiwai@suse.de>
	<69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
	<87jz82ye7b.wl-tiwai@suse.de>
	<8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
	<87o6xe7l4q.wl-tiwai@suse.de>
	<51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 03 Apr 2025 12:13:39 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 02/04/2025 16:23, Takashi Iwai wrote:
> > On Wed, 02 Apr 2025 14:52:48 +0200,
> > Péter Ujfalusi wrote:
> >>
> >>
> >>
> >> On 02/04/2025 14:50, Takashi Iwai wrote:
> >>> On Wed, 02 Apr 2025 13:43:57 +0200,
> >>> Péter Ujfalusi wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 02/04/2025 14:21, Takashi Iwai wrote:
> >>>>>>> On the second thought, yet another variant would be to introduce only
> >>>>>>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
> >>>>>>> PAUSED state as a step before stopping the stream.  This can be
> >>>>>>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
> >>>>>>> If the driver doesn't support this mode, the PCM core may fall back to
> >>>>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
> >>>>>>
> >>>>>> This looks identical to my proposed
> >>>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
> >>>>>> explanatory. It's not clear what PAUSE_RESET should do (probably the
> >>>>>> stream should be kept inactive).
> >>>>>
> >>>>> There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
> >>>>> doesn't have to stop the stream by itself, but it's only a preparation
> >>>>> for stopping.  That is, a proper TRIGGER_STOP always follows after
> >>>>> TRIGGER_PAUSE_RESET.
> >>>>
> >>>> But what state that we move after we reset the PAUSE? is it RUNNING
> >>>> (iow, equals to PAUSE_RELEASE) or something else?
> >>>
> >>> It'll be temporarily set to RUNNING.
> >>>
> >>>> In case of suspend while the state is paused we will:
> >>>> TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?
> >>>
> >>> For suspend, PAUSE_RESET, then SUSPEND.
> >>> For dropping, PAUSE_RESET, then STOP.
> >>
> >> OK, but this is still the same as PAUSE_RELEASE+SUSPEND when it comes to
> >> suspended_state, no?
> >> I mean you need to move to RUNNING to be suspend, or stop to skip the
> >> suspend.
> > 
> > Yes, and this needs to be addressed.  e.g. save the suspended_state
> > beforehand.
> > 
> >>>> Most drivers are doing the same thing for STOP and SUSPEND trigger,
> >>>> however it is possible to do extra steps for SUSPEND to make sure that
> >>>> the whole system is in a lowest power state.
> >>>
> >>> Yes, that's the reason I proposed PAUSE_RESET.  Then the driver can
> >>> handle the following stop or suspend operation differently.
> >>>
> >>> That said, PAUSE_RESET is just another variant of PAUSE_RELEASE.
> >>> But this shouldn't actually enable the audio output again, but prepare
> >>> for the next SUSPEND or STOP trigger.
> >>
> >> I'm not sure how this would be seen in ASoC level. Surely we need to
> >> have flag per components that it is handling PAUSE_RESET as codecs would
> >> like don't want to do it or they migh, hm.
> >> But ASoC maintains another set of state for the dpcm:
> >> SND_SOC_DPCM_STATE_* and it has this as well among other state-machine
> >> things:
> >> case SNDRV_PCM_TRIGGER_SUSPEND:
> >> 	if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
> >> 		goto next;
> >>
> >> So, this is dpcm level, but one component can support PAUSE_RESET while
> >> the other does not and the transitions are not too clear to me.
> > 
> > It's a good question.  ASoC may have the own intermediate state
> > (SND_SOC_DPCM_STATE_PAUSED_RESET) or just use
> > SND_SOC_DPCM_STATE_START but leave all to BE trigger (by passing
> > SNDRV_PCM_TRIGGER_PAUSE_RESET).
> > 
> >> But the idea of resurrecting a paused stream with mute held is not bad.
> >>
> >> I'm still uncertain how this actually works now on systems where RESUME
> >> is supported and we suspend while a PCM is in paused...
> > 
> > Is it a general question about suspend+resume during pause, or the
> > behavior change after PAUSE_RESET?  PAUSE_RESET won't be applied to
> > the drivers that support RESUME.
> > 
> > BTW, I'm not pushing to sell PAUSE_RESET so much for now at all.
> > Currently rather in a brain storming phase.  Let's try to pick up the
> > more appropriate one.
> 
> While I think the patch is a good start to handle the current situation
> with a minimal change (and a possibility of dropping it when the more
> elaborate and likely laborious one is available), this is how it was
> before the patch in regards to suspend while paused:
> 
> RESUME is suported:
> - Stream is PAUSED
> - No SUSPEND trigger is sent (stream is not running), state changes to
> SUSPENDED, suspended_state is PAUSED
> - On resume, no RESUME trigger is sent (suspended state is not RUNNING
> or DRAIN), but the state is changed to PAUSED.
> - On PAUSE_RELEASE the trigger is sent (how it is handled in driver is
> another question as we had suspended the system in between).
> 
> RESUME is not suported:
> - Stream is PAUSED
> - No SUSPEND trigger is sent (stream is not running), state changes to
> SUSPENDED, suspended_state is PAUSED
> - On resume, no RESUME trigger is sent (resume is not supported), the
> state remains to SUSPENDED, suspended_state is PAUSED
> On PAUSE_RELEASE the core will raturn error as the state is not PAUSED,
> it is SUSPENDED and we go to xrun recovery
> - driver received PAUSE_PUSH but never receives PAUSE_RELEASE
> 
> I think that the SUSPEND trigger (or a new similar trigger) should be
> sent to a PAUSED stream regardless of RESUME support. Imho it is not a
> correct assumption that a PAUSED stream is ready for system suspend, it
> might not be, it might needs to be prepared for that.
> If we use the same SUSPEND trigger than the drivers need to track their
> paused state as well to know what to do - we rely on the enforced state
> changes in core to do this implicitly atm.
> 
> If there is no RESUME support, then it is a bit more complicated as
> after the system suspend the audio hardware's state does not matter,
> whenever it was RUNNMING or PAUSED we need to go to xrun recovery to
> restart, resume is not supported.
> 
> But if RESUME is not supported we do need to send the PAUSE_RELEASE to
> balance the PUSH.
> Should we set XRUN as suspended_state in case of RESUME is not
> supported? Or some other state which indicates that whatever we had
> before, we are not going to be able to pick up where we were?
> 
> The fact that we discuss this shows how much this corner case have been
> excercised (we eneded upm disabling this in CI testing for now in SOF).

I agree that your patch can be a good start, at least, it addresses
the existing issue with the minimal change.  There are still rough
edges and we'll need to address, but I believe the patch (or modified
/ fixed one) can be applied to 6.15 kernel, while keeping the
development for 6.16.

I did some quick work on it, and now implemented
SNDRV_PCM_PAUSE_RELEASE_STOP trigger.  I guess it's more or less
aligned with what Jaroslav suggested.

The patches are pushed out to topic/pcm-pause-rework branch of my
sound.git tree.  Please take a look.


thanks,

Takashi
