Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7512D3314AE
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504426; cv=none; b=uFt5ZKMoNWYyACpt9qItl03RRADuVTVaXZ+ruO5gMtdd9MaEFCheZ9+PPF1pokp8gHzHuWM95clJa0d/SWJ3U164OttX2xEwpZmlbdMW2yZBodFPPFUoohGtCED/pZj9i/2yUKXM1nSuKyWzkVrNagsCRx2j3aWpS8Wsb4MjMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504426; c=relaxed/simple;
	bh=zFZM2LK1+rkr7L10SPTb2Ro/WP4YE5oNrLlqwuHLdqY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KI4sxySBG4xZS5zfX27pyV0RdVM3htotjN+fZHi0SUCSSd/pzX7f87nF9wehc3EOT1/gTiu784iJN7rw0utW+Pz+MFO3EUPhwZkcf9nhQtop38g05sd/5M4HSrWdBnmQiM/KObxdqPv7ZxXYMwINAc4Hv+AO2mcFl4f9uK5PR08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G52s6JhK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yDDmwmWX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G52s6JhK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yDDmwmWX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G52s6JhK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yDDmwmWX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G52s6JhK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yDDmwmWX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9AD21337A5;
	Tue, 27 Jan 2026 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769504423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTaadaBqzS1EtNRDPInstY5pBnCENLpG54gBj0p+nNQ=;
	b=G52s6JhKDdEUsTsmoiDCJbQaNaClJaSc2eLK1ieaiOZCfY4hYQc71v1+kQlB5vBBlx2w6u
	GX0+3W19I/4ILh8FaNrSmeOJz8WH7WcCKEYielJp5b/6f24WYvd8qKL/yZ4aBrnRZGq9n4
	b306MSSr+tNzVJNdWNyv0sbAgdKPngo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769504423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTaadaBqzS1EtNRDPInstY5pBnCENLpG54gBj0p+nNQ=;
	b=yDDmwmWXDS09ON4rP4M1Ga2CudCjWa3c9DATP6pYh+9WiuCRi3UcuKP2MEz2yjeShs6NT+
	Cvqas6jjc389v9AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769504423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTaadaBqzS1EtNRDPInstY5pBnCENLpG54gBj0p+nNQ=;
	b=G52s6JhKDdEUsTsmoiDCJbQaNaClJaSc2eLK1ieaiOZCfY4hYQc71v1+kQlB5vBBlx2w6u
	GX0+3W19I/4ILh8FaNrSmeOJz8WH7WcCKEYielJp5b/6f24WYvd8qKL/yZ4aBrnRZGq9n4
	b306MSSr+tNzVJNdWNyv0sbAgdKPngo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769504423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTaadaBqzS1EtNRDPInstY5pBnCENLpG54gBj0p+nNQ=;
	b=yDDmwmWXDS09ON4rP4M1Ga2CudCjWa3c9DATP6pYh+9WiuCRi3UcuKP2MEz2yjeShs6NT+
	Cvqas6jjc389v9AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65088139F2;
	Tue, 27 Jan 2026 09:00:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H0JtF6d+eGkJSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Jan 2026 09:00:23 +0000
Date: Tue, 27 Jan 2026 10:00:23 +0100
Message-ID: <87pl6v2zx4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jegor van Opdorp <jegorvanopdorp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: add mixer support for Focusrite Forte
In-Reply-To: <20260127081541.219669-1-jegorvanopdorp@gmail.com>
References: <20260127081541.219669-1-jegorvanopdorp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 27 Jan 2026 09:15:41 +0100,
Jegor van Opdorp wrote:
> 
> Add mixer control support for the Focusrite Forte (USB ID 0x1235:0x8010),
> an older USB audio interface that predates the Scarlett 2nd generation.
> 
> The Forte uses UAC2_CS_MEM (bRequest=0x03) for its input controls rather
> than the standard UAC2_CS_CUR (0x01) used by Scarlett devices. This patch
> adds Forte-specific control handlers that use the correct USB protocol.
> 
> Features implemented:
> - Input source selection (Mic/Line/Inst) for both channels
> - High pass filter switch
> - 48V phantom power switch
> - Phase invert switch
> - Pad switch
> - Preamp gain control (0-42 range, ~0-75dB)
> - Matrix mixer controls (6 inputs x 4 outputs)
> - Output volume and mute controls
> 
> The device is registered via mixer_quirks.c and uses the existing
> mixer_scarlett.c infrastructure with Forte-specific additions.
> 
> Credit: This work builds on prior reverse-engineering by alastair-dm.
> 
> Link: https://github.com/alastair-dm/forte-mixer/wiki
> Link: https://github.com/alastair-dm/forte-mixer
> Link: https://github.com/jopdorp/forte-mixer
> Signed-off-by: Jegor van Opdorp <jegorvanopdorp@gmail.com>

Thanks, applied now to for-next branch.

I noticed that I took your previous version mistakenly, so I dropped
it and reapplied the v2.


Takashi
