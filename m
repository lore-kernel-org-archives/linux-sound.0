Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB023959B
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600202; cv=none; b=A8lDGW/D/5DMwVcY6nJYFMtzemS1TyMBzIQzCli6z3NzNQ+6YMF/RjY/A0XgZXxOeeeIhujhG2BXQ3LZHjUMOUnz2g8ZxCz08U1JKkQ+DF9T3hz0KGn7Rl0QwUFQvicfXo0k1xAYYKrHFGwikjY0j5qkYWoJod7CZjSdRfvwt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600202; c=relaxed/simple;
	bh=qJI3g7NUIwmTbLq+6TtxyHlCiFTx4q+/hn99COy8BUk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/x5h0H3wLESW67cd49wkioKE/PbOsIw/6r/scf7LF6IAUrWJWoCU188jCAF4SiGXyphi8s1snWjHjxxfAIM/OvVEIpOaClKiSphvLv0Wp8oHM6htc7HdIM4oMbz1qGtJjev6j4vs4rlK4eSmF08vMVe02e7KCfSNOzaiG8Mq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0tH/Hnw6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TQQdkmQ+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0tH/Hnw6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TQQdkmQ+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0tH/Hnw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TQQdkmQ+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0tH/Hnw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TQQdkmQ+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 693B52119E;
	Wed,  2 Apr 2025 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743600198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1IwxWRY+h5AJsPLjKTif2737GN6BUSqbbJzvi7+mpA=;
	b=0tH/Hnw6PUp2hcm7wVKBPZqoNZsPsjRoiGC5mdgLkPM6Lr2YqAydMvH6HWoVEqGFQdUf0c
	8xkDBAuzS5qPCKrtgRr4nWEwLEZjTtcp975bIlxxiafRuAqJlHR6ua1nNA3YjlQ46VpONq
	jS7grk33V1e5DT/vIPLWIvDCji6MfUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743600198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1IwxWRY+h5AJsPLjKTif2737GN6BUSqbbJzvi7+mpA=;
	b=TQQdkmQ+uqbschs0qKaKxXoNzW4OYINTo0mQEOjK3afUpeFJKrbRIov6r3DrAerxoKouCX
	JnbQ1TebeoS33MBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="0tH/Hnw6";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TQQdkmQ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743600198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1IwxWRY+h5AJsPLjKTif2737GN6BUSqbbJzvi7+mpA=;
	b=0tH/Hnw6PUp2hcm7wVKBPZqoNZsPsjRoiGC5mdgLkPM6Lr2YqAydMvH6HWoVEqGFQdUf0c
	8xkDBAuzS5qPCKrtgRr4nWEwLEZjTtcp975bIlxxiafRuAqJlHR6ua1nNA3YjlQ46VpONq
	jS7grk33V1e5DT/vIPLWIvDCji6MfUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743600198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1IwxWRY+h5AJsPLjKTif2737GN6BUSqbbJzvi7+mpA=;
	b=TQQdkmQ+uqbschs0qKaKxXoNzW4OYINTo0mQEOjK3afUpeFJKrbRIov6r3DrAerxoKouCX
	JnbQ1TebeoS33MBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AA5A137D4;
	Wed,  2 Apr 2025 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wiZYBUY67WeOFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 13:23:18 +0000
Date: Wed, 02 Apr 2025 15:23:17 +0200
Message-ID: <87o6xe7l4q.wl-tiwai@suse.de>
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
In-Reply-To: <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 693B52119E
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Apr 2025 14:52:48 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 02/04/2025 14:50, Takashi Iwai wrote:
> > On Wed, 02 Apr 2025 13:43:57 +0200,
> > Péter Ujfalusi wrote:
> >>
> >>
> >>
> >> On 02/04/2025 14:21, Takashi Iwai wrote:
> >>>>> On the second thought, yet another variant would be to introduce only
> >>>>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
> >>>>> PAUSED state as a step before stopping the stream.  This can be
> >>>>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
> >>>>> If the driver doesn't support this mode, the PCM core may fall back to
> >>>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
> >>>>
> >>>> This looks identical to my proposed
> >>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
> >>>> explanatory. It's not clear what PAUSE_RESET should do (probably the
> >>>> stream should be kept inactive).
> >>>
> >>> There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
> >>> doesn't have to stop the stream by itself, but it's only a preparation
> >>> for stopping.  That is, a proper TRIGGER_STOP always follows after
> >>> TRIGGER_PAUSE_RESET.
> >>
> >> But what state that we move after we reset the PAUSE? is it RUNNING
> >> (iow, equals to PAUSE_RELEASE) or something else?
> > 
> > It'll be temporarily set to RUNNING.
> > 
> >> In case of suspend while the state is paused we will:
> >> TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?
> > 
> > For suspend, PAUSE_RESET, then SUSPEND.
> > For dropping, PAUSE_RESET, then STOP.
> 
> OK, but this is still the same as PAUSE_RELEASE+SUSPEND when it comes to
> suspended_state, no?
> I mean you need to move to RUNNING to be suspend, or stop to skip the
> suspend.

Yes, and this needs to be addressed.  e.g. save the suspended_state
beforehand.

> >> Most drivers are doing the same thing for STOP and SUSPEND trigger,
> >> however it is possible to do extra steps for SUSPEND to make sure that
> >> the whole system is in a lowest power state.
> > 
> > Yes, that's the reason I proposed PAUSE_RESET.  Then the driver can
> > handle the following stop or suspend operation differently.
> > 
> > That said, PAUSE_RESET is just another variant of PAUSE_RELEASE.
> > But this shouldn't actually enable the audio output again, but prepare
> > for the next SUSPEND or STOP trigger.
> 
> I'm not sure how this would be seen in ASoC level. Surely we need to
> have flag per components that it is handling PAUSE_RESET as codecs would
> like don't want to do it or they migh, hm.
> But ASoC maintains another set of state for the dpcm:
> SND_SOC_DPCM_STATE_* and it has this as well among other state-machine
> things:
> case SNDRV_PCM_TRIGGER_SUSPEND:
> 	if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
> 		goto next;
> 
> So, this is dpcm level, but one component can support PAUSE_RESET while
> the other does not and the transitions are not too clear to me.

It's a good question.  ASoC may have the own intermediate state
(SND_SOC_DPCM_STATE_PAUSED_RESET) or just use
SND_SOC_DPCM_STATE_START but leave all to BE trigger (by passing
SNDRV_PCM_TRIGGER_PAUSE_RESET).

> But the idea of resurrecting a paused stream with mute held is not bad.
>
> I'm still uncertain how this actually works now on systems where RESUME
> is supported and we suspend while a PCM is in paused...

Is it a general question about suspend+resume during pause, or the
behavior change after PAUSE_RESET?  PAUSE_RESET won't be applied to
the drivers that support RESUME.

BTW, I'm not pushing to sell PAUSE_RESET so much for now at all.
Currently rather in a brain storming phase.  Let's try to pick up the
more appropriate one.


thanks,

Takashi
