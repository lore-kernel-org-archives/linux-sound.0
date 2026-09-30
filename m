Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A664C226F
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771507; cv=none; b=arRuOqTwqJWqS/eGNe84TU4quUI3CY8JgcwkV/4vN+tYQCkIuHCRvBt4rjjrBM34QYO1Q8YtI3l5ooieYqWNK/yIItvNYuYpAsGQm3ExDZoA+vsXfGUhV24KZuABDsbsZLi87wLOJTSv0yPUDahaGmFpw2G/TDFqyqTwDsbvJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771507; c=relaxed/simple;
	bh=pYtuaYoBVdrP1jaHEktTjQFdLaVuz08i+zvpKGjEXII=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kkI1YEtIJSQu9dtD5BSfuTJOzOBzc0SHn805uzYrCB9Qdm8Zeg3Ot6VdeoKNUhQXv+82EKKKGRVNu/3TNpOfK5zFivULL8BCiZBtQt68KKeAT8jtYqLhiBXKhV8LVCDz7dCHDFIAlxcRBaAQqL0CXxOznp9TqMQeqjEF8GdOvww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u60QkSCw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WLtglskX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MgF7JnES; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/FfvKaLS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u60QkSCw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WLtglskX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MgF7JnES";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/FfvKaLS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC1DA21A95;
	Wed, 30 Sep 2026 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790771499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRZpaTxP55SKGhuamBMWYANlf7J8ls1Gvdwu31FeeAQ=;
	b=u60QkSCwAMO4DJVTG2UwVZ/W+a+r0d7uohC5CWhPKlLyPxlzClph5WmX8dVQyX4M3wO0dv
	Ypr/kneQy2/wISg1gnrDCzYkuEgpqFHmUcu/NSYpPhOvG9FDuAHRRYBghrpd7NRag/pCh8
	tv5bGMFRImamLoQrrq4Mnzw1zLPtnaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790771499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRZpaTxP55SKGhuamBMWYANlf7J8ls1Gvdwu31FeeAQ=;
	b=WLtglskX0OPoZpycnjcqiIxx6IJ944FSxxg6vqPUoEgw9EAODq23/CAPFkzGLq4XzpOYcj
	4NrehNIrxRX36nAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790771495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRZpaTxP55SKGhuamBMWYANlf7J8ls1Gvdwu31FeeAQ=;
	b=MgF7JnESV25+78U53dA8Fa1vZM02xWngCxndxnmsGBs8B5NPBsi/0epIxQ1+cudHfgvQxY
	2R3SMoJ0ekGv9tGB0uTy0k7jJHjZe3RKcjUUtxymkwgM/XQqNiFhjC/YEUE3a17/wtuJgd
	Zrc40szSvp2J0zI6VXQgEimtZTfrt5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790771495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRZpaTxP55SKGhuamBMWYANlf7J8ls1Gvdwu31FeeAQ=;
	b=/FfvKaLSaNxPIQy5tiJMYTts25P/UFA7KE3MnwgPs6ut9RpxTq09QEnrjofiTUCsCRkHss
	UEzRveToMDuj5FDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64F18136AD;
	Wed, 30 Sep 2026 12:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PHAhDycBvWoCeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 12:31:35 +0000
Date: Wed, 30 Sep 2026 14:31:34 +0200
Message-ID: <87wls253a1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harrison Lucas <tiiowsalt@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute and micmute LEDs on HP ENVY x360 15-ey0xxx
In-Reply-To: <20260929174348.167537-1-tiiowsalt@gmail.com>
References: <20260929174348.167537-1-tiiowsalt@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 29 Sep 2026 19:43:48 +0200,
Harrison Lucas wrote:
> 
> The HP ENVY x360 2-in-1 Laptop 15-ey0xxx (SSID 103c:8a31, ALC245 with
> CS35L41 I2C amps) currently only gets ALC287_FIXUP_CS35L41_I2C_2, so the
> mute and micmute LEDs on the keyboard never light up.
> 
> On this machine the mute LED is driven by COEF 0x0b bits 2-3 and the
> micmute LED by GPIO 0x04 (active low), which is exactly what
> ALC245_FIXUP_HP_X360_MUTE_LEDS sets up. Switch the quirk to
> ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS, which keeps the CS35L41 setup
> and chains to that LED fixup.
> 
> Verified by driving the COEF and GPIO values by hand with hda-verb,
> following Master Playback Switch and Mic ACP LED Capture Switch.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Harrison Lucas <tiiowsalt@gmail.com>

Applied now.  Thanks.


Takashi
