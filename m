Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C23B3BF5
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564903; cv=none; b=HsBxR3LOnIjdCaw4vUZREA+1HIePI+qTTx5TBrx5AFTlrnagwKAWDiaFQ9QelCpozTIH39rn6VheoJGQ67frKxxAVrXrgXHNC+Ft22j1GLUai2CBgRb3MVw9Dh1fxJaFCLWs5MUkAADTOxL5c/wegz7bNqHgzGo5XpEiaume3C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564903; c=relaxed/simple;
	bh=3+nATR2M0xPl//oQkqwy1364zC1YEpqNFRKXibKNq9Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vrjzz6y72mM2PBtxw3xuscUW8bEb32xXyCCXqQjR13TiiDNtW/QCWDGgnJqEIg7vpw5jB8y3Ytrd9mupYhet8ClhNL7rQJ4GxQL9uSPfTM33qeY2ECK7W8320jfinPms8uKe5UY3dr0fpS5v8S7l08KapA2WcanqyRW3fim9W8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RoSSU2DO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OVJ898aF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RoSSU2DO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OVJ898aF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RoSSU2DO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OVJ898aF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RoSSU2DO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OVJ898aF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1ACE95BD4F;
	Tue,  7 Apr 2026 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775564900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Kj9CE0g9qVAC3aWsBDYB4W9VpAcHvTgLMGP0JiHo9g=;
	b=RoSSU2DOqwU50VLvpfKNIfKXtshP8vZBIoL863O68s4VdRwcMd5Zl0jEFO8msYPMlekDDp
	QePVakFqUxv2M/6+KwleSwdL+iVjiHMylf+D5PNWVHMY7ZQGb5UVkpJJ6GGQOR3QkAa7b9
	HB089z/EfX294FxRLtJceCtcNTyfHQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775564900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Kj9CE0g9qVAC3aWsBDYB4W9VpAcHvTgLMGP0JiHo9g=;
	b=OVJ898aFMddVU7G2HIfoCPb3t7e4730wMxEDlcNedizEwnXwCr8rH4Kp1ccSWxXtkihRa+
	mHR5yaF4uu5hVSCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RoSSU2DO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OVJ898aF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775564900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Kj9CE0g9qVAC3aWsBDYB4W9VpAcHvTgLMGP0JiHo9g=;
	b=RoSSU2DOqwU50VLvpfKNIfKXtshP8vZBIoL863O68s4VdRwcMd5Zl0jEFO8msYPMlekDDp
	QePVakFqUxv2M/6+KwleSwdL+iVjiHMylf+D5PNWVHMY7ZQGb5UVkpJJ6GGQOR3QkAa7b9
	HB089z/EfX294FxRLtJceCtcNTyfHQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775564900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Kj9CE0g9qVAC3aWsBDYB4W9VpAcHvTgLMGP0JiHo9g=;
	b=OVJ898aFMddVU7G2HIfoCPb3t7e4730wMxEDlcNedizEwnXwCr8rH4Kp1ccSWxXtkihRa+
	mHR5yaF4uu5hVSCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 059144A0B0;
	Tue,  7 Apr 2026 12:28:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O56wAGT41GnqFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Apr 2026 12:28:20 +0000
Date: Tue, 07 Apr 2026 14:28:11 +0200
Message-ID: <87qzorlztw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Theodoros Orfanidis <teoulas@gmail.com>
Cc: m.krycki@gmail.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [BUG] ALSA: hda/realtek: SSID 1458:a194 is shared by different Gigabyte ALC897 front-panel layouts
In-Reply-To: <20260407120350.42282-1-teoulas@gmail.com>
References: <CAEfRphPU_ABuVFzaHhspxgp2WAqi7kKNGo4yOOt0zeVFPSj8+Q@mail.gmail.com>
	<20260407120350.42282-1-teoulas@gmail.com>
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
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 1ACE95BD4F
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Tue, 07 Apr 2026 14:03:48 +0200,
Theodoros Orfanidis wrote:
> 
> On Mon, 06 Apr 2026, Marcin Krycki wrote:
> > [BUG] ALSA: hda/realtek: SSID 1458:a194 is shared by different
> > Gigabyte ALC897 front-panel layouts
> 
> Same issue here. After a recent kernel update from 6.19.10 to 6.19.11
> (Arch Linux), I realized my mic port had become another headphone out.
> 
> Pin 0x19 (the physical Front Mic jack) is re-tasked as a second
> headphone output, and the microphone input disappears from the
> available sources in the system.
> 
> Prior to this patch (tested on kernel 6.19.10), auto-config correctly
> identified the separate pins:
>   inputs: Rear Mic=0x18, Front Mic=0x19
>   hp_outs=1 (0x1b)
> 
> With this patch applied:
>   inputs: Mic=0x18
>   hp_outs=2 (0x1b, 0x19)
>   Front Mic (0x19) is missing from inputs.
> 
> Manually re-tasking Pin 0x19 back to'Microphone' via hdajackretask
> restores the expected behavior.
> 
> Hardware: Gigabyte B660I AORUS PRO DDR4 (rev. 1.x)
> PCI SSID: 1458:a194
> Codec: Realtek ALC897

OK, I'm going to revert the commit.  The fix patch looks dubious and
needs to be revisited.


thanks,

Takashi
