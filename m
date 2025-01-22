Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1726AF5
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737530640; cv=none; b=gKWXMLNlir8NjL9SyDzDKBo3H/4v/6yCLltPa1vdTD5FNj3B9alP879H2twKFyQgDlPmjjlnSn/5o1BgFsy7GdI+W5Y5dWI+Y0wxJEVHjUBA146MZkKCVauMk7W0ib7ikY/YaGkwkMfHWs5mBJFr3kfaNl52qDGmvHEXS0CDL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737530640; c=relaxed/simple;
	bh=HSo3wmIaJeqqt86jj7JWqz2BSJl6j7gKDqwD3+4Hsd8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfVIOdGnDhn0D8mYiyhcB8HBUJE+ghXNSeCWcwm2N+mZIFtU+5x7Edh7GyNgOT7lgEECzXHm5s/ex2yMbUDPYQ1rwz5toJRBnqqc6GS9Wv4+IGYCQ7hOfPTF1//Ha3aMJYoFITmX2ba1vYFWc/Vt32/E/EaQFo0d9Jizk3DlmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0afZn0L1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s34ynRzp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0afZn0L1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s34ynRzp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0afZn0L1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s34ynRzp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0afZn0L1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s34ynRzp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3127F21231;
	Wed, 22 Jan 2025 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737530637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXOgAH+5evaKfjTNvfLapwx3irsR4xhTUuvpAzhbnsQ=;
	b=0afZn0L1kHz2Bv80fi+pHa0sqRLZSUuVa++p+GiqAjHWZ3ORWDffMn6A8fcYxxiCoHdWjd
	iNXy17hovGolzoYB1jIEl2jcQa1H4oLpis79xJhXV3I5+znlfHJ1zetk0OQnll9LKzNLUU
	01ArBTzJwbQBXg9KhJ+AdR6ucIecxOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737530637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXOgAH+5evaKfjTNvfLapwx3irsR4xhTUuvpAzhbnsQ=;
	b=s34ynRzp0ajtMJ6sT60BLY19yQnF67163PQFO4ZAPo6JLgqGlRVtm45O0bsb6XFKrrw+U+
	0VtJgHeBh/1qUxDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737530637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXOgAH+5evaKfjTNvfLapwx3irsR4xhTUuvpAzhbnsQ=;
	b=0afZn0L1kHz2Bv80fi+pHa0sqRLZSUuVa++p+GiqAjHWZ3ORWDffMn6A8fcYxxiCoHdWjd
	iNXy17hovGolzoYB1jIEl2jcQa1H4oLpis79xJhXV3I5+znlfHJ1zetk0OQnll9LKzNLUU
	01ArBTzJwbQBXg9KhJ+AdR6ucIecxOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737530637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXOgAH+5evaKfjTNvfLapwx3irsR4xhTUuvpAzhbnsQ=;
	b=s34ynRzp0ajtMJ6sT60BLY19yQnF67163PQFO4ZAPo6JLgqGlRVtm45O0bsb6XFKrrw+U+
	0VtJgHeBh/1qUxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B78D1397D;
	Wed, 22 Jan 2025 07:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NFOtAQ2dkGflSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jan 2025 07:23:57 +0000
Date: Wed, 22 Jan 2025 08:23:56 +0100
Message-ID: <878qr38g6r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samantha Glocker <iam@anislandsomewhere.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: possible issue with ALSA: hda/realtek: Use codec SSID matching for Lenovo devices
In-Reply-To: <87a5bj8gax.wl-tiwai@suse.de>
References: <CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com>
	<87a5bj8gax.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 22 Jan 2025 08:21:26 +0100,
Takashi Iwai wrote:
> 
> On Wed, 22 Jan 2025 01:58:16 +0100,
> Samantha Glocker wrote:
> > 
> > Hi, I'm a kernel maintainer from nobara and ASUS-Linux.
> > 
> > I've bifurcated an issue with sound on Lenovo Legion laptop(s)
> > starting from mainline 6.12.5, verified on Fedora proper, Nobara, and
> > CachyOS.
> > 
> > From the changelog,
> > https://patch.msgid.link/20241008120233.7154-4-tiwai@suse.de looks
> > like a likely candidate due to touching TAS2781 / TIA2781.
> > 
> > The issue will possibly affect sound on any or all Lenovo Legion Gen 8 and 9.
> > 
> > The obvious difference in dmesg on my Legion Pro 7 Gen 8 (16ARX8H) on
> > 6.12.5, is the following line is completely missing:
> > [    4.761665] snd_hda_codec_realtek hdaudioC1D0: bound
> > i2c-TIAS2781:00 (ops tas2781_hda_comp_ops
> > [snd_hda_scodec_tas2781_i2c])
> > 
> > This suggests the TI amplifier is never identified.
> 
> What's the exact problem?  Is it a regression?  Any original report on
> the bug tracker or such?

... and if it's a regression, please give alsa-info.sh outputs from
both working and non-working cases.  Run the script with --no-upload
option and attach the outputs.


Takashi
