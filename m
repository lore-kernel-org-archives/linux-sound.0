Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D252E338B
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166983; cv=none; b=XBoJdiw5usCpMU9imCmBOuaIIb/H5F973/S58Y44F3TSkqPRkxgbFcHXgQP3e1s8pLJ+bXBXoZjhsbZoBieyLpUKpktBdDtuDyRPEhdkYyZFSV6BMguTkGJ3t6GgDm6oVJjY1/i676ZOkp36ShEdCsYnue9fPAupcErUXEg5Fjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166983; c=relaxed/simple;
	bh=Ykl2MCrGJJEUVsj7ni6CEn+ulVPCIRfP8o+jOrAH5bw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dVdGKk+Bd06bAmQl4n030YKqGmvEB2g6GxVhMkcvs+TD29EQJ4X1svwa9xrHcMXsAPMZgL7y+vJyI2pqkmEAJwN4mEObVilip7FkAw085AmL+AsoU9IBmR11hPskNNFYuVYQyaP3LWB2OD1RCGThcm2ykzCI5pDsH3Rj32Vfn34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Puyi6wez; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDsJjQ8T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Puyi6wez; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDsJjQ8T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Puyi6wez";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDsJjQ8T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Puyi6wez";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDsJjQ8T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC2761F76B;
	Wed,  5 Mar 2025 09:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741166979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owPaDv5SZ10KjJHu0X7n6bZoYrooJZfK/t7KMS3C3Us=;
	b=Puyi6wezAJaOzCoVbyFR249Lq79fB4rprJPO18AmwwCeukchz1MUDC1R0epa0PMHD/KskD
	n93m/P3T7fpcIDF41Myzkp44oAub2pB6Yb8X1SOt4LhKKQfhyw8gaGolyL5pQi/78TwTBi
	CLK4UoLDG7nXDe8bQkJyNtLfjD46BPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741166979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owPaDv5SZ10KjJHu0X7n6bZoYrooJZfK/t7KMS3C3Us=;
	b=tDsJjQ8TXGPBADrx3IuVAu2kLM21ByrFV1wRgctGmmwW4gs3jl8w/J3SqXY25yNKVVzr0e
	TuVeCyV7K5ZU1ACw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Puyi6wez;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tDsJjQ8T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741166979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owPaDv5SZ10KjJHu0X7n6bZoYrooJZfK/t7KMS3C3Us=;
	b=Puyi6wezAJaOzCoVbyFR249Lq79fB4rprJPO18AmwwCeukchz1MUDC1R0epa0PMHD/KskD
	n93m/P3T7fpcIDF41Myzkp44oAub2pB6Yb8X1SOt4LhKKQfhyw8gaGolyL5pQi/78TwTBi
	CLK4UoLDG7nXDe8bQkJyNtLfjD46BPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741166979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owPaDv5SZ10KjJHu0X7n6bZoYrooJZfK/t7KMS3C3Us=;
	b=tDsJjQ8TXGPBADrx3IuVAu2kLM21ByrFV1wRgctGmmwW4gs3jl8w/J3SqXY25yNKVVzr0e
	TuVeCyV7K5ZU1ACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 963A41366F;
	Wed,  5 Mar 2025 09:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pxAmI4MZyGcObAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 09:29:39 +0000
Date: Wed, 05 Mar 2025 10:29:39 +0100
Message-ID: <87plivu8os.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <ec41e956050e4ea594daaf8042fd6d1c@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>
	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
	<87wmd3uc28.wl-tiwai@suse.de>
	<494a665481e043a38b94d844654fa81f@realtek.com>
	<87tt87uail.wl-tiwai@suse.de>
	<ec41e956050e4ea594daaf8042fd6d1c@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BC2761F76B
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 05 Mar 2025 10:22:04 +0100,
Kailang wrote:
> 
> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Wednesday, March 5, 2025 4:50 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > linux-sound@vger.kernel.org
> > Subject: Re: update ALC222 depop optimize
> > 
> > 
> > External mail : This email originated from outside the organization. Do not
> > reply, click links, or open attachments unless you recognize the sender and
> > know the content is safe.
> > 
> > 
> > 
> > On Wed, 05 Mar 2025 09:22:20 +0100,
> > Kailang wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Wednesday, March 5, 2025 4:17 PM
> > > > To: Kailang <kailang@realtek.com>
> > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > > linux-sound@vger.kernel.org
> > > > Subject: Re: update ALC222 depop optimize
> > > >
> > > >
> > > > External mail : This email originated from outside the organization.
> > > > Do not reply, click links, or open attachments unless you recognize
> > > > the sender and know the content is safe.
> > > >
> > > >
> > > >
> > > > On Wed, 05 Mar 2025 08:56:41 +0100,
> > > > Kailang wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > > Sent: Wednesday, March 5, 2025 3:54 PM
> > > > > > To: Kailang <kailang@realtek.com>
> > > > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > > > > linux-sound@vger.kernel.org
> > > > > > Subject: Re: update ALC222 depop optimize
> > > > > >
> > > > > >
> > > > > > External mail : This email originated from outside the organization.
> > > > > > Do not reply, click links, or open attachments unless you
> > > > > > recognize the sender and know the content is safe.
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Wed, 05 Mar 2025 07:32:00 +0100, Kailang wrote:
> > > > > > >
> > > > > > > Hi Takashi,
> > > > > > >
> > > > > > > Update ALC222 depop optimize as attach.
> > > > > >
> > > > > > Could you give a bit more background info why this change is needed?
> > > > > > Is it a mandatory change to fix something, or it improves something?
> > > > > >
> > > > > This codec has two headphone design.
> > > > > The HP2 was nid 0x14.
> > > >
> > > > Sorry not clear enough: do you mean the patch is to fix the depop
> > > > problems on the models with two headphone pins with ALC222?
> > >
> > > Yes, the original depop was only supported one headphone.
> > 
> > OK, and then would it be a bit risky to blindly assume the second headphone
> > pin 0x14?  Isn't it set up via pin config?
> > 
> It doesn't have risk to set this pin as headphone or line out.
> This pin (0x14) can be a line out or headphone. It has JD which driver will get it.
> Line out and Headhpone were need to do depop procedure.
> If pin 0x14 set to speaker, it wouldn't have JD.
> 
> hp2_pin_sense = snd_hda_jack_detect(codec, 0x14);
> 
> This just got JD to do depop.

Fair enough, I took the patch now.  Thanks.


Takashi
