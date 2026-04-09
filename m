Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8140DFDB
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 05:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775712145; cv=none; b=Z67Ubj4yeFNO4l+0SP9PPt2/HZgF1wfxgGzV2GOG/CuHVAeXMp5EKJoUy7GbRNtpMC6Bp3TCqi5kqVsOVIrfe06RIIqBgGobH3VE5qFjMhM1Esn+K8mC3rmeX+a5x7T/7oOW/ZMHJBwyoAKosFwqnQctuBoC/oqj4yGdyRwdhpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775712145; c=relaxed/simple;
	bh=fMRr/frwri/B5x9qZjSgeNGInx1u+nqt76oqmgdp/eQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipjLu7C9tP7ToYOLkSWu4bAQQu6kCYNkvD9ynRp5skJWdcYvjyGVALeJB2c0NILZM+XpUaLnVaBkflNr/Xe2uCb+aWybkQdnsSlVugHg3eWCj4H2K5G8EXStG4Byun0VvMO/ODW6yuKmOG/4qEbChu213x3D0IAEgVff7KGXQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h1jTklGc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AxlUB7fg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h1jTklGc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AxlUB7fg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h1jTklGc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AxlUB7fg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h1jTklGc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AxlUB7fg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A94DE5BCE6;
	Thu,  9 Apr 2026 05:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775712142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtprpBv0/Hz5AOQ8lQDLTCRBlU5FDNHzgHk2aooYP0E=;
	b=h1jTklGcaYyTgdrz5Gc4EG5Uji7MWKfobI9cBDD8qW0EmeIpvKw2WXxR62/TCEnz5h1fgT
	GLfzOFLNgElJIfmGDIfOpylVqN5K3Pf8Xy4J2h1RRYKRnk8cJ6WtYt25uWkFvIpHBgY4+1
	Jy/WXPmkXNzAqcwSg6fwQ4SbMaF0FoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775712142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtprpBv0/Hz5AOQ8lQDLTCRBlU5FDNHzgHk2aooYP0E=;
	b=AxlUB7fg0G1UFdu3PQAA8UG1pXLtNw31NZDUFxpmxps2EAPx52BSZoW3OwqW9rvPfziWQ0
	FyGNOQNXv18L8zCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775712142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtprpBv0/Hz5AOQ8lQDLTCRBlU5FDNHzgHk2aooYP0E=;
	b=h1jTklGcaYyTgdrz5Gc4EG5Uji7MWKfobI9cBDD8qW0EmeIpvKw2WXxR62/TCEnz5h1fgT
	GLfzOFLNgElJIfmGDIfOpylVqN5K3Pf8Xy4J2h1RRYKRnk8cJ6WtYt25uWkFvIpHBgY4+1
	Jy/WXPmkXNzAqcwSg6fwQ4SbMaF0FoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775712142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtprpBv0/Hz5AOQ8lQDLTCRBlU5FDNHzgHk2aooYP0E=;
	b=AxlUB7fg0G1UFdu3PQAA8UG1pXLtNw31NZDUFxpmxps2EAPx52BSZoW3OwqW9rvPfziWQ0
	FyGNOQNXv18L8zCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 719834A0B3;
	Thu,  9 Apr 2026 05:22:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Bp1jGo4312nCUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 05:22:22 +0000
Date: Thu, 09 Apr 2026 07:22:22 +0200
Message-ID: <871pgolnch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 0/3] ASoC: remove card->pop_time
In-Reply-To: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,gmail.com,kernel.org,suse.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Thu, 09 Apr 2026 06:36:48 +0200,
Kuninori Morimoto wrote:
> 
> Hi Mark, OMAP member
> 
> I'm now trying to cleanup snd_soc_card, and noticed that card->pop_time is used
> only from OMAP1 board-ams-delta.
> 
> card->pop_time user drivers are...
> 
> 	> git grep -w -l pop_time sound/soc include/sound
> 	include/sound/soc.h
> (A)	sound/soc/codecs/cx20442.c
> 	sound/soc/soc-card.c
> 	sound/soc/soc-dapm.c
> (B)	sound/soc/ti/ams-delta.c
> 
> Except ASoC framework, pop_time user is only cx20442 (A) / ams-delta (B).
> And board-ams-delta (Z) is using it.
> 
> (Z)	linux/arch/arm/mach-omap1/board-ams-delta.c
> 
> 	static struct platform_device ams_delta_audio_device = {
> (A)		.name   = "ams-delta-audio",
> 	};
> 
> 	static struct platform_device cx20442_codec_device = {
> (B)		.name   = "cx20442-codec",
> 	};
> 
> 	static struct platform_device *ams_delta_devices[] __initdata = {
> 		...
> (A)		&ams_delta_audio_device,
> 		...
> (B)		&cx20442_codec_device,
> 		...
> 	};
> 
> With off-list talk with Mark, this card->pop_time is is much less of a
> problem.

Hmm, are you sure?  IIUC, it's used for a flag in the modem desc for
cx81801, and a bunch of setup seems depending on it, and your second
patch removes the whole of those without alternative.

> So let's remove it. But it needs Acked-by from OMAP1 member.
> I added [RFC] on Subject.

So the actual question is whether the modem is utterly broken for this
hardware or not.  If yes, it'd be a good reason to drop and apply this
cleanup.

But if it's not, we'd need an alternative implementation, e.g. move
the flag and its handling to the modem's own object instead of the
ASoC core, instead.


thanks,

Takashi
