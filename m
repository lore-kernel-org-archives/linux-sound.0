Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C72343C7
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592880; cv=none; b=jlZyT/Lsj9S+ds+jfkv59N5SmgrPoD/xyWq83XuajU1Dgmdj4Wr31O1XfNQqVajynk3H9j72CKbywbIc3n7Px1tB935rz3hP4MIyhpPGY3NDci+XjJG/JmuHKsmfHqFXkVQf+F+JPs6XVdPHk16LPJZ/oa551TyVZVlpOMm0aY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592880; c=relaxed/simple;
	bh=YUIiNH9brBVuSnFbgiHEGGogZZZbCHzW9BzdUrHczVA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r4KR4FFVXlyosOmW8dCtVpMQft0vC6kyCBU/d/nnbWD036hi7HCl0DmH6WoDZeMC1mDsTuOaGzDChHalB0JPO/k+h0BHOXj/A9eP8Y7dN3/waaV9NtElmxkECjKxSbBxDh7CU9yVNZzqlg9aCi6MNbgnlShpTUdCEdpzapLWKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CfmThAat; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b4esjdZk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CfmThAat; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b4esjdZk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CfmThAat";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b4esjdZk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CfmThAat";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b4esjdZk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD2F621174;
	Wed,  2 Apr 2025 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743592876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kd18nuSjDdHaWVs74IOxsFtpJ/1nxqF25IcyU9w1oqY=;
	b=CfmThAatwbvV4Sr4+cDfopgf3VigQ4t2R5QMvspKX/0kqOrXXzDt1fgvXS1cnVyMnJLkWt
	oGiglJPUAHMKlK7EkqZTmFakjRGN41JJD0YJErmzMZOcsmXtUo3TIU99eQ3eh4gPKJzlwU
	cLEbIVq1DnyMwQX/tT2j2B1qDTtfbYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743592876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kd18nuSjDdHaWVs74IOxsFtpJ/1nxqF25IcyU9w1oqY=;
	b=b4esjdZk+KHRWvZC7oqcy4yHUK+pmkcGGvMmcN6IXjyo6XBJAD+sKioBsGF13erOMtTPGB
	dXnSinMkrEzlseBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743592876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kd18nuSjDdHaWVs74IOxsFtpJ/1nxqF25IcyU9w1oqY=;
	b=CfmThAatwbvV4Sr4+cDfopgf3VigQ4t2R5QMvspKX/0kqOrXXzDt1fgvXS1cnVyMnJLkWt
	oGiglJPUAHMKlK7EkqZTmFakjRGN41JJD0YJErmzMZOcsmXtUo3TIU99eQ3eh4gPKJzlwU
	cLEbIVq1DnyMwQX/tT2j2B1qDTtfbYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743592876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kd18nuSjDdHaWVs74IOxsFtpJ/1nxqF25IcyU9w1oqY=;
	b=b4esjdZk+KHRWvZC7oqcy4yHUK+pmkcGGvMmcN6IXjyo6XBJAD+sKioBsGF13erOMtTPGB
	dXnSinMkrEzlseBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5961213A4B;
	Wed,  2 Apr 2025 11:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X7rnE6wd7WeGagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 11:21:16 +0000
Date: Wed, 02 Apr 2025 13:21:15 +0200
Message-ID: <87o6xeyfkk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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
In-Reply-To: <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.intel.com,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Apr 2025 12:45:36 +0200,
Jaroslav Kysela wrote:
> 
> On 02. 04. 25 11:16, Takashi Iwai wrote:
> 
> >>>> For my view, the drivers may also receive those triggers:
> >>>> 
> >>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP
> >>>> SNDRV_PCM_TRIGGER_SUSPEND_IN_PAUSE
> >>>> SNDRV_PCM_TRIGGER_RELEASE_IN_PAUSE
> >>>> 
> >>>> This will allow to handle all states properly without any side effects
> >>>> (like short unwanted DMA transfers).
> >>>> 
> >>>> The drivers should probably activate those triggers conditionally to
> >>>> not break current state sequences.
> >>> 
> >>> Hmm, that looks too complex, IMO.
> >>> 
> >>> Another slightly more straightforward fix would be just to allow the
> >>> direct state transition from PAUSED to any state.  Then the remaining
> >>> piece is all about driver implementations.  And, this can be
> >>> conditionally operated, e.g. only when some extra flag is set.  When
> >>> no flag is set, we keep applying PAUSE_RELEASE before the transition
> >>> like now, including Peter's patch, that can work generically (but not
> >>> always ideally).
> >> 
> >> It looks also feasible. My proposal just allows the straight state
> >> identification from the trigger value in the drivers.
> > 
> > On the second thought, yet another variant would be to introduce only
> > one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
> > PAUSED state as a step before stopping the stream.  This can be
> > applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
> > If the driver doesn't support this mode, the PCM core may fall back to
> > SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
> 
> This looks identical to my proposed
> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
> explanatory. It's not clear what PAUSE_RESET should do (probably the
> stream should be kept inactive).

There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
doesn't have to stop the stream by itself, but it's only a preparation
for stopping.  That is, a proper TRIGGER_STOP always follows after
TRIGGER_PAUSE_RESET.


thanks,

Takashi
