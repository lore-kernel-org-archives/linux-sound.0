Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0043B4204E
	for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891754; cv=none; b=dnOz9mbtFY2Wkkikt5WvsWHbwQlJ2MJ5WWFKenlMQyNxerc1AXhJ15uAp8zLw+Gz5ZCQISz3kpDF4p7hAzBxwAW4Gph6sVHj4OKvKrex/adXxhLCjpG/Fq7YzHpB7Ye46O/sa6uHSQy4E0mpBjfaCRKmVtkqTdklOHY9LTtqjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891754; c=relaxed/simple;
	bh=U17ty4arBltULTzAi5UCWnEQwwouSIUnZQle6Mn1SAs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ak9pZoBPR7yn0NqDtMn1zcdyla/SKPf2OHT/prbfL6VtV4wi5c+YRto24kGO+BARDA0bOlMSkSfKq9TdakuL41JbJ5tq5xpCGw1Ng4xaRfgUTJIbPxFZGsrOkOBl6OG3Mfo7BTsTw6FxJIDLq8igdWepviyEmc1h8+w++neS6SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HwP/pOox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FAdEeJuJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HwP/pOox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FAdEeJuJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HwP/pOox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FAdEeJuJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HwP/pOox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FAdEeJuJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16F851FDB7;
	Mon, 14 Oct 2024 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728891751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFCWQlwA+oaGj2dBRURGfb3H5aGd9Auz1rJ0Y47N16s=;
	b=HwP/pOoxrJEIBTJ/ioAqGqUNz1kvg5M1hpXWqAkxzDFR+qgaXIs/pQ58Z5LUW8AydSo4hK
	+P+P8fuyq9qQ9Qx/MybLJudzlu9gVYb7uB44+hho+VBmCIAgqILaT389dwZOxg56qh3omC
	spgniYTQj5aSLqERmUNLyzBtvTo7g+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728891751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFCWQlwA+oaGj2dBRURGfb3H5aGd9Auz1rJ0Y47N16s=;
	b=FAdEeJuJfiDHbg6edUA8w/7ai7/W08A6YmJiyojqGedu7EQVXGDJOsBfHHTdZTG3jqVNLy
	6SzUFW6QgiOfBoAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="HwP/pOox";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FAdEeJuJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728891751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFCWQlwA+oaGj2dBRURGfb3H5aGd9Auz1rJ0Y47N16s=;
	b=HwP/pOoxrJEIBTJ/ioAqGqUNz1kvg5M1hpXWqAkxzDFR+qgaXIs/pQ58Z5LUW8AydSo4hK
	+P+P8fuyq9qQ9Qx/MybLJudzlu9gVYb7uB44+hho+VBmCIAgqILaT389dwZOxg56qh3omC
	spgniYTQj5aSLqERmUNLyzBtvTo7g+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728891751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFCWQlwA+oaGj2dBRURGfb3H5aGd9Auz1rJ0Y47N16s=;
	b=FAdEeJuJfiDHbg6edUA8w/7ai7/W08A6YmJiyojqGedu7EQVXGDJOsBfHHTdZTG3jqVNLy
	6SzUFW6QgiOfBoAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EADA713A51;
	Mon, 14 Oct 2024 07:42:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a67PN2bLDGdLYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Oct 2024 07:42:30 +0000
Date: Mon, 14 Oct 2024 09:43:28 +0200
Message-ID: <87seszjfj3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Davis <paul@linuxaudiosystems.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: something went wrong with USB iJack data in kernel 6.x
In-Reply-To: <87wmibjfuk.wl-tiwai@suse.de>
References: <CAFa_cKmDynOwheDU3gH2NMbj2eRAPEkLL+PP3zd4S5+enVK5Ag@mail.gmail.com>
	<87wmibjfuk.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 16F851FDB7
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 14 Oct 2024 09:36:35 +0200,
Takashi Iwai wrote:
> 
> On Sun, 13 Oct 2024 18:56:57 +0200,
> Paul Davis wrote:
> > 
> > I don't know where to start with this issue, but since I noticed it
> > trying to use a MIDI device, I thought I would start here. Advice on
> > where to take it would  be much appreciated.
> > 
> > High Level symptoms:
> > 
> > 1. plugin in a Novation Lanchkey mk4 to (a) a system running kernel
> > 6.x (b) a system running kernel 5.x
> > 2. run aplaymidi -l or arecordmidi -l
> > 
> >   Results:
> >      (a) kernel 6.x: note the presence of two identical MIDI port
> > names for the device
> >      (b) kernel 5.x: note the presence of two differently named MIDI
> > ports for the device
> > 
> > Mid-level diagnosis:
> > 
> > Run lsusb -v on both kernels. For 5.x, note that the iJACK displays
> > include a string for the MIDI port name. For 6.x note that this string
> > is missing.
> > 
> > Working with devices bearing identical ports for multiple names ranges
> > from extremely difficult to impossible.
> > 
> > I have no idea what layer of the stack can be involved here, other
> > than that it is not hardware. I've run both 5.x and 6.x kernels on the
> > same system.
> 
> Could you try to narrow down the regression range, e.g. by testing
> different 5.x and 6.x kernels?  The best would be git-bisect, but
> figuring out the first broken kernel version would help a lot
> already.
> 
> Also the issue can be very specific to the device, so please give the
> details of your device.  e.g. the alsa-info.sh outputs from both cases
> as well as lsusb -v outputs. 

And, if it's about iJack handling for MIDI v1.x, the only recent
change I can see is the upstream commit
41c25e193b2befc22462aa41591d397fab174ca1
    ALSA: usb-audio: More relaxed check of MIDI jack names

You can try to revert it.


Takashi
