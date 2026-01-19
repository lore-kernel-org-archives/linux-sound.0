Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0591E27A10F
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810162; cv=none; b=kgir6IckXPvnzOHg1yRO0Gv1/3lTs4V7tOaLVSwuEQLhKAo/RKCCtflv1PVeDaK7atjbHiOXFhqUieZubl/h2VwkRhYBXnSyWLqHPH3rUk6NinRWa8dUUElcPfMq59QoR18Fz8kmfISoxfYtchxLfjc2LMUxRF8eLviOntIcaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810162; c=relaxed/simple;
	bh=gpVRkW59M0Nfo2v58ykB1TphQckrjGGT7LDpIjNPhgk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UnrBYF0fQrAJ7I0r0aZ6RPegtS75LvulnfwB/XCVwjWqdepBBqh1QVQM7N3QASMctoKyHlHFFLEjE9G4tGy6PX7E1a+wBvYp/7+6aVLZ//V3J2e0SQlG6HNrExBSy7uNR/OFDJ5FcGZXjc4xezfjmF6wllOrdV5Xekzyqim/faI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rGKp1CPr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pfx8dSk5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v8XeWU4/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MsFtowjc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rGKp1CPr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pfx8dSk5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v8XeWU4/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MsFtowjc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9E785BCFD;
	Mon, 19 Jan 2026 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768810158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5a2JoJ2z7OcdggjYYSTj+LkzieomRI9AO+Q0botYfk=;
	b=rGKp1CPrF1Pzzc2PfFJG8RYHD/oCngLw/0DhEhYir5e6qqSz/ogcRwSPDXmZ56uCNqDR/G
	s0V9BRZk8uAfWJi6S013Dh2sTsMta8sScbA8fYc5z3neZWpvlK2MeL8Flt0WQDf+LPnPjm
	xSIBuwLEsNhyRQ2aR86MGDLYxMgYKVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768810158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5a2JoJ2z7OcdggjYYSTj+LkzieomRI9AO+Q0botYfk=;
	b=pfx8dSk5BXUsJnHHQY/F8kGvdYSlgUTTtnY3OQq4B9sIYVJhjMp2YHorJj5+Jlbr05OJhi
	8kolCtPPi3gei7Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768810157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5a2JoJ2z7OcdggjYYSTj+LkzieomRI9AO+Q0botYfk=;
	b=v8XeWU4//nXpR0wDO8XrpPXt9gG4s2wlzWyYAZg/0QDMuXjLq/LfKy7jtcpSL5MB1i++pk
	0jtkQ9JRKYsxtbughujfKALWPwuc0VJYIBe2spLGkHJ16RbCpj8dzwl28zQ+8uzEGvsYsu
	a1xGYyUHJiuCQyBzHkjkiFGYiJtzI74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768810157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5a2JoJ2z7OcdggjYYSTj+LkzieomRI9AO+Q0botYfk=;
	b=MsFtowjc9BTl58Dr18Tx4h7+Gz9z1uuV6uvx9HPq9eBg/h4B4jf36N25RBnKRX96rQL3AP
	Bf2RSXVOm1Q86NBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C57D3EA63;
	Mon, 19 Jan 2026 08:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q/DNJK3mbWkJAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Jan 2026 08:09:17 +0000
Date: Mon, 19 Jan 2026 09:09:17 +0100
Message-ID: <87sec281n6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Asus Zephyrus G14 2025 using CS35L56, fix speakers
In-Reply-To: <XqnvvlnwyZf0b1xnGu9hIpjn5vpqNYWkSLQA06lEc0AI2Qp04CY9TfAy72LA_L4ONvU9ZkYSKWiTPx0xhpxkqRtx9gQRDwz9F-tX_22jspQ=@vinarskis.com>
References: <20260112-asus-rog-audio-v1-1-513957b4704e@vinarskis.com>
	<87cy3dr988.wl-tiwai@suse.de>
	<XqnvvlnwyZf0b1xnGu9hIpjn5vpqNYWkSLQA06lEc0AI2Qp04CY9TfAy72LA_L4ONvU9ZkYSKWiTPx0xhpxkqRtx9gQRDwz9F-tX_22jspQ=@vinarskis.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 18 Jan 2026 18:07:17 +0100,
Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> 
> On Tuesday, January 13th, 2026 at 13:24, Takashi Iwai <tiwai@suse.de> wrote:
> 
> > 
> > 
> > On Mon, 12 Jan 2026 01:06:37 +0100,
> > Aleksandrs Vinarskis wrote:
> > 
> > > Just like GA403U, this GA403W needs to remap woofers to DAC1. Similarly to
> > > other Asus devices, headphones/headset MIC is not working, however the pin
> > > config alone is not enough to fix it.
> > > 
> > > From Windows dump of GA403W:
> > > 0x12, 0x90a60140 # Correctly set by codec out of the box
> > > 0x13, 0x90a60550
> > > 0x14, 0x90170510
> > > 0x17, 0x90170120 # Correctly set by codec out of the box
> > > 0x19, 0x03a11050 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> > > 0x1a, 0x411115F0
> > > 0x1b, 0x03a11c30 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> > > 0x1d, 0x40663A45 # Correctly set by codec out of the box
> > > 0x21, 0x03211430
> > > 
> > > Even with all the values set, MIC of the jack is not detected. Until a
> > > complete solution is found, set ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> > > for GA403W which fixes audio volume control for woofers. No need to
> > > create new quirk with missing pin config just yet, since its not
> > > making the situation better.
> > > 
> > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > ---
> > > As per commit description, enable quirk to fix woofers.
> > 
> > 
> > Thanks, applied now.
> 
> Thanks, I see it now landed in linux master. If possible, it would be nice to have it in 6.18, 6.17 stable as well - would you like me to submit backport separately, or would you be able to pick it directly?

I hope AUTOSEL would pick it up, but if you want to be sure, just ask
Greg & co (via stable ML) to suggest the upstream (Linus tree) commit
id to cherry-pick and tell which stable kernels to be backported.

And, if the fix is intended for stable kernels, at the next time, just
put "Cc: <stable@vger.kernel.org>" line around your Signed-off-by
line in the patch.


thanks,

Takashi
