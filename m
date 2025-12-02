Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653C2F618F
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684903; cv=none; b=DMWsTqKHKLuoQ6Itx2cI5bahZ6O5yJScoMHQ/6QQX28WNBlRJB5egBOcMJAxGssVHMsZBcjtEeQisFJSLYuRGcMYGgWpqwsUBgyJMLV8la93o0p/FwPIDPnoCteM8y/Q0R505ltWdUDTbLP2U50TrCO5fwS5hfw97QF9Z/9Nqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684903; c=relaxed/simple;
	bh=weovPvlrLxnfIsbPlKoy9hEbaO3OEkP6QYw4/z1uk5I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flOdI6Dpvxmv4At5O0cN6GcaZF1D8j1WtLL1i9roTJMbjz6d8mPy00jlsuzvnTApApm+ZiBInQtfcbuojpl7uu26g64UNyuP09uqe9t84YPj4RHYjf6Gm9zfYVhnt1dSYedvV0+ls0beYtbFMuT/XfqVR/mJV9torcFMoxdY8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bTU+Ne+c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YT8P3oR6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TYIeGDXh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yhGsGCPd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bTU+Ne+c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YT8P3oR6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TYIeGDXh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yhGsGCPd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 95F5C5BD1F;
	Tue,  2 Dec 2025 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764684899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOUYrQEAenxGk2BL3G1saDwB1TNpQnbPc+ojAFPdV88=;
	b=bTU+Ne+cRTGRdRPgLGPgU3xgjQe2Dq+OU3UvCphVzEeMlM7N5GTrGrWMkPzJbsyhM20mmo
	nG+/VZSX4kCiSql1Z6deaNqSIuEoLjtwDdVe35uJ0USvKqiP4rLLNn3hi37f/+tQRT8IRK
	fwLF5mN8Wpwi+779CUmzFBqO0uhJZAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764684899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOUYrQEAenxGk2BL3G1saDwB1TNpQnbPc+ojAFPdV88=;
	b=YT8P3oR6pxSDvNrkzHFE+X/LnO3kgxpbzzJRjSYjjynMIWx1CRQelI43EKmK272yPJQ+Bh
	omdQBg23nVBCPVBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TYIeGDXh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yhGsGCPd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764684898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOUYrQEAenxGk2BL3G1saDwB1TNpQnbPc+ojAFPdV88=;
	b=TYIeGDXhA9EXuo8ezNOgcTFdw6WLnqo0kR/nGWMHBWZolDPh62d/zKnrfecSDpmtkxxuPx
	dIKydvXOQvoNa1F2o9atcEPjUBW91x7PKDnfkt8QRcIfwbmzejXDfOr1ZzKreEeplLWuSD
	juD2fAUokjnrnX9or50Y2HzDGS6fy4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764684898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOUYrQEAenxGk2BL3G1saDwB1TNpQnbPc+ojAFPdV88=;
	b=yhGsGCPdVj7jfu3S6O74+ezUJD/+8HDxi3zlsAejBy7+QM3csKf0tblStdFE1DT9ep1UEI
	6/+u7zkNtmd2TnCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 838023EA63;
	Tue,  2 Dec 2025 14:14:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T5qRH2L0LmmlaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 14:14:58 +0000
Date: Tue, 02 Dec 2025 15:14:58 +0100
Message-ID: <87wm35t1gd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilyas Gasanov <public@gsnoff.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add codec IDs to HP ProBook G8 fixups
In-Reply-To: <1338370824.94568.1764684676200@app.mailbox.org>
References: <20251202131508.56184-1-public@gsnoff.com>
	<877bv5uia5.wl-tiwai@suse.de>
	<1338370824.94568.1764684676200@app.mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 95F5C5BD1F
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-hardware.org:url,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Tue, 02 Dec 2025 15:11:16 +0100,
Ilyas Gasanov wrote:
> 
> On Tue, 02 Dec 2025 17:26 +0400,
> Takashi Iwai wrote:
> > 
> > On Tue, 02 Dec 2025 14:15:08 +0100,
> > Ilyas Gasanov wrote:
> > > 
> > > According to amixer output, as well as the result value of the
> > > GET_SUBSYSTEM_ID HDA verb, the codec's own subsystem ID may differ from
> > > that of the HDA controller.
> > > 
> > > The snd_hda_pick_fixup() function specifically inspects just the codec's
> > > subsystem ID, ignoring that of the controller, which causes mismatch on
> > > machines where the above is the case, unless the codec's subsystem ID is
> > > also covered.
> > > 
> > > For reference:
> > > 
> > >  - https://linux-hardware.org/?probe=9829e4ea09&log=amixer
> > >    (HP ProBook 440 G8, MB 8A74, codec 10ec0236,103c8a7a)
> > >  - https://linux-hardware.org/?probe=5b2ca9b826&log=amixer
> > >    (HP ProBook 450 G8, MB 8A75, codec 10ec0236,103c8a7b)
> > >  - https://linux-hardware.org/?probe=228aee06a5&log=amixer
> > >    (HP ProBook 440 G8, MB 8A76, codec 10ec0236,103c8a7c)
> > >  - https://linux-hardware.org/?probe=1cd4bf968d&log=amixer
> > >    (HP ProBook 450 G8, MB 8A77, codec 10ec0236,103c8a7d)
> > > 
> > > Signed-off-by: Ilyas Gasanov <public@gsnoff.com>
> > 
> > The primary matching is with PCI SSID, not the codec SSID.
> 
> Good point. There is indeed a semantic difference between the SND_PCI_QUIRK() and HDA_CODEC_QUIRK() macros, specifically where the value of the .match_codec_ssid field is concerned.
> 
> > Do they have the same numbers on those machines?
> 
> From what it looks like:
> 
>  - https://linux-hardware.org/?probe=9829e4ea09&log=lspci
>    Device:	00:1f.3
>    Class:	Multimedia audio controller [0401]
>    SVendor:	Hewlett-Packard Company [103c]
>    SDevice:	... [8a74]
>    (already covered)
> 
>  - https://linux-hardware.org/?probe=5b2ca9b826&log=lspci
>    Device:	00:1f.3
>    Class:	Multimedia audio controller [0401]
>    SVendor:	Hewlett-Packard Company [103c]
>    SDevice:	... [8a75]
>    (already covered)
> 
>  - https://linux-hardware.org/?probe=228aee06a5&log=lspci
>    Device:	00:1f.3
>    Class:	Multimedia audio controller [0401]
>    SVendor:	Hewlett-Packard Company [103c]
>    SDevice:	... [8a76]
>    (not covered yet)
> 
>  - https://linux-hardware.org/?probe=1cd4bf968d&log=lspci
>    Device:	00:1f.3
>    Class:	Multimedia audio controller [0401]
>    SVendor:	Hewlett-Packard Company [103c]
>    SDevice:	... [8a77]
>    (not covered yet)
> 
> In short, PCI SSIDs 0x8a74 and 0x8a75 are already covered within alc269_fixup_tbl, but not 0x8a76 nor 0x8a77.

OK, could you resubmit the fix just for those missing two?


thanks,

Takashi
