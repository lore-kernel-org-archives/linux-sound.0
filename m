Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E3335942
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150961; cv=none; b=FJsJwfesf4OpQ702551XBT3FizXE2Mg5g4yZQMWsFAREgsgF1l7yxboclO+rckDuRU8zgmUM7MEXHQ6sTUgdKUE2JM54dbrv9boiFkhY/nX+wm6PO6uL0HdTPoQACYUdOU6I61+z5riVI8vDkKDdlfnTc7SmxrXislFcNkiHuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150961; c=relaxed/simple;
	bh=BdTY8q7hJYIarp2zrzAr6yB4H6y+oT+F4lS8hTQn1Es=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H1CtWr3ypdjn8N6lvk5e2faXKmYKCkOQJoaskaVT27JSFhlfp8CvolZdpoglteVq3LjzB9LOhzYDCBSeECRwho2/WARoyyRG/a6KzKiH9vryvCKHbUe7oaR1LEKOnNtQHN8CMXn7QZ0m9ZMkRN5hUayD/YeOVzQThSYBOoijBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P1+/4iiX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0qTP88SX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P1+/4iiX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0qTP88SX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P1+/4iiX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0qTP88SX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P1+/4iiX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0qTP88SX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 603671F444;
	Mon,  6 Jan 2025 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736150957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gViCaWIFYKI7P5LNrx+g9assS9Ny3x9XmDuPGz0irgY=;
	b=P1+/4iiXkFWEgkZI4pEwb2pyPGKSMQd1S7O1fCbpwInmmVGZJ028eMQ59w7lJFAEOC5hqG
	DsgYVK+EL/rQ3v+0lAU7vtjUs8RTjIVSA4vk/YQszk6ULiRxrq4paVujnvwcnSaquOA5f3
	+gOdcwRswNbDJyv10wxXoy9a2zBpBu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736150957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gViCaWIFYKI7P5LNrx+g9assS9Ny3x9XmDuPGz0irgY=;
	b=0qTP88SXiDjTgnbFJM/IABbXG0BT9EXqThFVUXb9Val6WoZmd9S8dOWpxruVLawJHieLqo
	xmWQDRactD6J1uBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="P1+/4iiX";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0qTP88SX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736150957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gViCaWIFYKI7P5LNrx+g9assS9Ny3x9XmDuPGz0irgY=;
	b=P1+/4iiXkFWEgkZI4pEwb2pyPGKSMQd1S7O1fCbpwInmmVGZJ028eMQ59w7lJFAEOC5hqG
	DsgYVK+EL/rQ3v+0lAU7vtjUs8RTjIVSA4vk/YQszk6ULiRxrq4paVujnvwcnSaquOA5f3
	+gOdcwRswNbDJyv10wxXoy9a2zBpBu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736150957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gViCaWIFYKI7P5LNrx+g9assS9Ny3x9XmDuPGz0irgY=;
	b=0qTP88SXiDjTgnbFJM/IABbXG0BT9EXqThFVUXb9Val6WoZmd9S8dOWpxruVLawJHieLqo
	xmWQDRactD6J1uBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D875137DA;
	Mon,  6 Jan 2025 08:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5mYqDa2Pe2fQWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Jan 2025 08:09:17 +0000
Date: Mon, 06 Jan 2025 09:09:16 +0100
Message-ID: <87ed1gxt1v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kun Hu <huk23@m.fudan.edu.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: oss: Send fragmented SysEx messages immediately
In-Reply-To: <58DD9B80-CDE3-40B0-96D0-0BDA1F5D841B@m.fudan.edu.cn>
References: <20241231115523.15796-1-tiwai@suse.de>
	<EC84D88D-CC77-4FAA-9B86-7BBA0BAAF9BB@m.fudan.edu.cn>
	<58DD9B80-CDE3-40B0-96D0-0BDA1F5D841B@m.fudan.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Rspamd-Queue-Id: 603671F444
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 06 Jan 2025 04:10:01 +0100,
Kun Hu wrote:
> 
> >> 
> > 
> > 
> > Hi Takashi Iwai,
> > I noticed that in your previous modifications, you seemed to have made lots of changes to the related structures, along with many updates to the snd_seq_oss_synth_sysex function. However, in the latest kernel tree, it seems that only a mutex lock has been added to this function.
> > While this certainly resolves the issue, I’m personally curious to understand the reasoning behind this approach. Was there a specific consideration or constraint that led to this simplified solution?
> > 
> > ――
> > Thankx
> > Kun hu
> > 
> 
> I see, you’re going to submit the patch to  6.14, but a temporary band-aid for 6.13.

Yes.  Although the second patch is cleaner, it is more intrusive and
change the behavior, hence it needs more test coverage, which isn't
suitable for 6.13 at this late stage.


Takashi
