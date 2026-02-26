Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4138A719
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772087643; cv=none; b=GYD+6azAg5D9SqvlcMwIrbLgf7m2vs8H4I/nfK1eVYzWYYbHEjuJ0WJNJEaLV0aY2Tl3mOVzAOs21vluRD4HQpvPyWXT9w36hxAXq++X7gEei4ChbHdv19VKHMDhEVSIxxtL1lEaEeDgsSAf5xxoFG5QbvM/aZsZbZGJ5za0lwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772087643; c=relaxed/simple;
	bh=UcO+2gTGQigZ+VCEIDG8zixXm65OivEyN5L1wUWAPp8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OK7fPS2cATQ2toB1pLl6hjyyP9xWTbZiVVulRaEyhiOZ25a3WYdqY+Rlv9apDePwfn87v95jpbaLOWKi/pqQpYcWMR8R7es4ZxZlgaBHxXO6l6m7GQ/jfyAoKQwqOFC04pcoiQyrLhbm2qVObSotVFkGhhwGsFpNcJhSSBFuWAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uVairF/Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XRSB788+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uVairF/Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XRSB788+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uVairF/Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XRSB788+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uVairF/Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XRSB788+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A4B14DCA4;
	Thu, 26 Feb 2026 06:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772087640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAAyyxQLR3X5d9YfEGAf7XF9Qi4STNRDTDL19ezPv4M=;
	b=uVairF/ZnoISlBfR8AX6X09I7C0QwejhCinK7IXYZpGA0/9MOVfygDJ5BJc+wZIdfnF1YS
	KUJiSghlCMrlT44OrwtZIoHmlaO3dttzjmV6zryK7qObE+ITzDySzzFtm06PA5rTVel1pU
	n4vNzkarSZRxUHkwdwDNCMxiR1KyXQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772087640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAAyyxQLR3X5d9YfEGAf7XF9Qi4STNRDTDL19ezPv4M=;
	b=XRSB788+9cZ5DUBl1RnzMnjjU6mAA1g7R4F9U1jFgnBaizYdBwJ8cFtISRX4XmwIkUNH1V
	SKVwPBnC9j22S1CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="uVairF/Z";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XRSB788+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772087640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAAyyxQLR3X5d9YfEGAf7XF9Qi4STNRDTDL19ezPv4M=;
	b=uVairF/ZnoISlBfR8AX6X09I7C0QwejhCinK7IXYZpGA0/9MOVfygDJ5BJc+wZIdfnF1YS
	KUJiSghlCMrlT44OrwtZIoHmlaO3dttzjmV6zryK7qObE+ITzDySzzFtm06PA5rTVel1pU
	n4vNzkarSZRxUHkwdwDNCMxiR1KyXQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772087640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAAyyxQLR3X5d9YfEGAf7XF9Qi4STNRDTDL19ezPv4M=;
	b=XRSB788+9cZ5DUBl1RnzMnjjU6mAA1g7R4F9U1jFgnBaizYdBwJ8cFtISRX4XmwIkUNH1V
	SKVwPBnC9j22S1CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 206423EA62;
	Thu, 26 Feb 2026 06:34:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zj/hBVjpn2laIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 06:34:00 +0000
Date: Thu, 26 Feb 2026 07:33:59 +0100
Message-ID: <87bjhcc8tk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for Acer Nitro ANV15-51
In-Reply-To: <18b43378-0bbc-435d-93ad-370e051e8416@kylinos.cn>
References: <20260209134149.3076957-1-zhangheng@kylinos.cn>
	<87bjhy0xd1.wl-tiwai@suse.de>
	<18b43378-0bbc-435d-93ad-370e051e8416@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 7A4B14DCA4
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 26 Feb 2026 02:43:56 +0100,
zhangheng wrote:
> 
> > Can LED be controlled dynamically by writing to a sysfs file in
> > /sys/class/leds/*? e.g.
> > 
> >    % cat /sys/class/leds/platform::micmute/brightness
> >    1
> >    % echo 0 > /sys/class/leds/platform::micmute/brightness
> > 
> > If the direct write changes the actual LED status, it's not about the
> > sound driver problem, but possibly some plumbing in user-space via
> > UCM, etc.
> After testing, it is normal, so there should be no problem with the
> driver. Therefore, I think this patch can be merged as soon as
> possible.

OK, applied now.  Thanks.


Takashi
