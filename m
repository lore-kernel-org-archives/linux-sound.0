Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6E155342
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164615; cv=none; b=uahdEiSxbkr9to3B8fCB11BtOgd1cVnFOgVHXdUk7K2kvJc5OKrfNwXiR1nQzsyvCG6V6VUDFNEP9sgev6RmqbHDdWz9Ma1PEkS8XCmk3tm6FhKvwACxu57pNk5VUqB++VbPNIehk5ZP/oTDDdPDEvWpEo3VXsMcvdlDQ+9Y338=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164615; c=relaxed/simple;
	bh=04ydXd9ZJD8ggoSOkUAHeWehYwl21UxkbE4x2UDfo14=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7cbQtf93qBN2ZZlpyf7I/B1XZKN1rAnDDkkBFkQk/MhS4vbfKJTPp0EoEUah+a5B9UHdy2bfyaimUD6oBUarTJW+1FVe/eBqYBTDyNhs8svSI0QY3C1H2SnQUVTDT/op8LVJooyVbeKUifwu+l8KvZNP+E1XOJG6rXFkDPcp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0uKAOdLD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rx471RPS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0uKAOdLD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rx471RPS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0uKAOdLD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rx471RPS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0uKAOdLD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rx471RPS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68F9021193;
	Wed,  5 Mar 2025 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741164611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=0uKAOdLDdhRub0XKqX7/fWzHZe7BkRNHlAvCCitqAHZOykI4hQyMALa6TaOLlVHfP8Nc9I
	2txSaH9DSc5rFY9L09Qz6wSt/8waZQ0AW7uhd1X7RopBiX7YMSueNkm5kfAtkz2ZP+AL6b
	IaNuMAtrWqrBlMmTXGHN85nKBAyjepw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741164611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=rx471RPSMPC8R2xP0TFBrI6GCZIFrUIoA7UUmdUgD7CSeIAXyDf4pAFzoiT5i8Vg8ETO1a
	Vl1xp1S+/iUHvcDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0uKAOdLD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rx471RPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741164611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=0uKAOdLDdhRub0XKqX7/fWzHZe7BkRNHlAvCCitqAHZOykI4hQyMALa6TaOLlVHfP8Nc9I
	2txSaH9DSc5rFY9L09Qz6wSt/8waZQ0AW7uhd1X7RopBiX7YMSueNkm5kfAtkz2ZP+AL6b
	IaNuMAtrWqrBlMmTXGHN85nKBAyjepw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741164611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=rx471RPSMPC8R2xP0TFBrI6GCZIFrUIoA7UUmdUgD7CSeIAXyDf4pAFzoiT5i8Vg8ETO1a
	Vl1xp1S+/iUHvcDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41E5313939;
	Wed,  5 Mar 2025 08:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BOtvDkMQyGeVXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 08:50:11 +0000
Date: Wed, 05 Mar 2025 09:50:10 +0100
Message-ID: <87tt87uail.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <494a665481e043a38b94d844654fa81f@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>
	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
	<87wmd3uc28.wl-tiwai@suse.de>
	<494a665481e043a38b94d844654fa81f@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 68F9021193
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 05 Mar 2025 09:22:20 +0100,
Kailang wrote:
> 
> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Wednesday, March 5, 2025 4:17 PM
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
> > On Wed, 05 Mar 2025 08:56:41 +0100,
> > Kailang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Wednesday, March 5, 2025 3:54 PM
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
> > > > On Wed, 05 Mar 2025 07:32:00 +0100,
> > > > Kailang wrote:
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > Update ALC222 depop optimize as attach.
> > > >
> > > > Could you give a bit more background info why this change is needed?
> > > > Is it a mandatory change to fix something, or it improves something?
> > > >
> > > This codec has two headphone design.
> > > The HP2 was nid 0x14.
> > 
> > Sorry not clear enough: do you mean the patch is to fix the depop problems on
> > the models with two headphone pins with ALC222?
> 
> Yes, the original depop was only supported one headphone.

OK, and then would it be a bit risky to blindly assume the second
headphone pin 0x14?  Isn't it set up via pin config?


thanks,

Takashi
