Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12523814E
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593234; cv=none; b=BfBDcKBKMQgTgAV7FOe1AS3MC3YL7/ZOW0+gdbPHhPZC8wfqqwYTdUHKNroQGqyIgc2X+1qfStnSNoOFnimj9y7LKUbqpNCfo8zTnxNDocUoZ3tA1czD/pYFav+g9b/G0MMkrtvLu0EOkbvEAOvC7JtvBXoQLcpbFiFEiDawhKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593234; c=relaxed/simple;
	bh=nNm7G+XR947bogPAdbxmEfrDyxKPIKVC4wgtINwPpUo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/zfFM0l+yrYmc9fA/1CXgNM1FzvlS4NLW3KdLnsEMigDZSyWE7zJx2CeBIXuGtv75oPhJWvslklpTOU5P/QItfJz3Ia4PRwWsLhlf70lnqqEaGC+hBN79jx3kynDi9bXWW2TnU6J/M2RC+uE0m0qvsiC7rvoT3Rwv+Uz2CP/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BP/V2IL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MfWPqo95; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BP/V2IL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MfWPqo95; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BP/V2IL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MfWPqo95";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BP/V2IL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MfWPqo95"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81C7221172;
	Wed,  2 Apr 2025 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743593230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/53ZrNX/pTSPZEbJEgeOCJXfritsrevEjkPBAcyZXU=;
	b=BP/V2IL3BX8X56dgNNIbPQaYPJ+pmpmbBvU8KfYpMrrHhvrQkJa8BLJ8mf87J7TfLDH2J1
	8J/rQBNEMghptMQKUhQjEVVdzjAMUqSx7TNJ+Cw34HRjRdR8Se/6ypDJcMsyLjYMqIWUCR
	qTA0nRdIpkfc3Ltgk1H0guTOOjlr0q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743593230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/53ZrNX/pTSPZEbJEgeOCJXfritsrevEjkPBAcyZXU=;
	b=MfWPqo95gOhSvD+haq04D7E01hgAEVPjFQKiWEnGswyO/2Ttv1v+7pg+JJfT5QwNLwLeHL
	Dohz8BeQ4i6Pr6CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="BP/V2IL3";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MfWPqo95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743593230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/53ZrNX/pTSPZEbJEgeOCJXfritsrevEjkPBAcyZXU=;
	b=BP/V2IL3BX8X56dgNNIbPQaYPJ+pmpmbBvU8KfYpMrrHhvrQkJa8BLJ8mf87J7TfLDH2J1
	8J/rQBNEMghptMQKUhQjEVVdzjAMUqSx7TNJ+Cw34HRjRdR8Se/6ypDJcMsyLjYMqIWUCR
	qTA0nRdIpkfc3Ltgk1H0guTOOjlr0q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743593230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/53ZrNX/pTSPZEbJEgeOCJXfritsrevEjkPBAcyZXU=;
	b=MfWPqo95gOhSvD+haq04D7E01hgAEVPjFQKiWEnGswyO/2Ttv1v+7pg+JJfT5QwNLwLeHL
	Dohz8BeQ4i6Pr6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32C6413A4B;
	Wed,  2 Apr 2025 11:27:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tpYxCw4f7WdJbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 11:27:10 +0000
Date: Wed, 02 Apr 2025 13:27:09 +0200
Message-ID: <87mscyyfaq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
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
In-Reply-To: <1417b256-b9e8-4256-b14f-fdee86e202c1@linux.intel.com>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
	<87h637znpp.wl-tiwai@suse.de>
	<35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
	<8734eryn21.wl-tiwai@suse.de>
	<ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
	<1417b256-b9e8-4256-b14f-fdee86e202c1@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 81C7221172
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
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.de,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Apr 2025 11:28:55 +0200,
Péter Ujfalusi wrote:
> 
> 
> On 02/04/2025 11:52, Jaroslav Kysela wrote:
> >>>> Actually, this patch follows the same pattern, too.  It calls
> >>>> snd_pcm_pause(false) to set the state to RUNNING again, then proceed
> >>>> to the suspend action immediately that sets to SUSPENDED.
> >>>
> >>> The previous state (suspended_state) will be confusing from the
> >>> application with the proposed patch, because there will be RUNNING
> >>> state instead PAUSED. This previous state is exported via API.
> >>
> >> No, it won't happen.  The condition of the new behavior is only when
> >> SNDRV_PCM_INFO_RESUME isn't set -- that is, no resume is possible,
> >> hence no state recovery happens after resume.  From the application
> >> POV, it won't change.
> > 
> > The suspended_state can be obtained in snd_pcm_status64(). With Peter's
> > patch, there will be RUNNING instead PAUSED, don't?
> 
> Yes, that is true, but it does not matter.
> if the SNDRV_PCM_INFO_RESUME is not set, on resume nothing is going to
> be done, the state remains SUSPENDED and the suspended_substate also
> retained, so:
> 
> The stream was in RUNNING, after suspend:
> state = SUSPENDED, suspended_state = RUNNING
> After resume:
> state = SUSPENDED, suspended_state = RUNNING
> The the stream goes to xrun and got restarted.
> 
> The stream was in RUNNING, after suspend:
> Without my patch / with my patch:
> state = SUSPENDED, suspended_state = PAUSED / RUNNING
> After resume:
> state = SUSPENDED, suspended_state = RUNNING / RUNNING
> 
> The stream remains "not running" as resume is not supported and
> application knows that it had left the stream paused.
> 
> When it tries to PAUSE_RELEASE the stream, in both case the core will
> look at the state, which is SUSPENDED and thus the pause release fails
> (it is not in paused state), so in both cases we go under a restart
> (suspended_state is reset, ignored).

Well, the suspended_state itself is set no matter whether the resume
is supported or not.  The difference is that it's evaluated in the
driver only by the suspended state, but it's free for user-space to
read this out from the output of snd_pcm_status ioctl.
How seriously it needs to be a different question, but there is a
possibility of breakage.

Though, looking through the code, the suspended_state isn't updated at
all except for the suspend, and it means this can keep a bogus state,
too.  We should fix the code to clear the suspended_state at init
phase.  It's another corner case.


thanks,

Takashi
