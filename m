Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3391C3E3C69
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829083; cv=none; b=i4g7tPPE6T7ifksj9Av/p/E12rR8sUAHYP546OAwgWlRjQSjD9AR9zE3/8mBaW1WrQ4r0CDFvJ/lW5vLnNfOIqRWUvltsUz70LJxDrWQ8p3iRtNwwiy3axj2l+2v8s0b+Izgab3IHrlOQikConfB7HZCKGZA5qOcM8LlGp4UHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829083; c=relaxed/simple;
	bh=Zu0UWEBTcSBrkUismacI7Om0OpoefU9pElTKQXQa2Ws=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=darkb/CXAK3VLlulv1/r4uh6mWi3O0DRvitWmFAubU93e35wI+MfiUftyvNL2TcJN2PDHfGKHK8y0IY7RBnHdEnqMsFt5h5njzXi3cZ469zAbDICMmSpvNuy002vcak6oqNXZxsTBBY4z6yEHmruXym5R5ZPmzgmvm/4ePcH/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HIdXXMOY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4eEEW7W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mygFC/5D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J85Gc/VK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HIdXXMOY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4eEEW7W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mygFC/5D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J85Gc/VK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31A9C675BE;
	Fri, 15 May 2026 07:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778829080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lm7qRewpEqTpLRcjREliFLOj4DoIAcyiZ7TOAxkcx3U=;
	b=HIdXXMOY8x7+TMdvq3JZG/ZKUaz6bDBBNl4ha4eLorp8nqvfPZ7KJm8PpJeIeJvEh1c0Av
	SHlHgKMwY/RJ2ycM2zjccIQjJcoMnBMqhXHup4FyIZc2sTxS8BI0tGmjqkguV/JzzBssU9
	nE0k74Dc/UZR8mhkjeEdIqUz8icZeHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778829080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lm7qRewpEqTpLRcjREliFLOj4DoIAcyiZ7TOAxkcx3U=;
	b=S4eEEW7WtRE4eS+vo9uOWbUzik7ecnL/4RmIJGEgJhBUbRZ0/oqX28rN7+9uV8rSJtee8Y
	rM+iM1vTCkXpewDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mygFC/5D";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="J85Gc/VK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778829079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lm7qRewpEqTpLRcjREliFLOj4DoIAcyiZ7TOAxkcx3U=;
	b=mygFC/5DZ5qmdmlc0QOCPaD8d/ZwjSdHahzTLLgez8VOEBZnvgkwpv0uOwb9n1pLd4OJYi
	fXWzdIn6d/0yPTz2r1eBcK9a1AsAkaSZeXsQq35tpvZa8KAcAw6yDmHKvsSZXLya6bixuW
	KxFOz8g2Z6IoEf4VHqfpKBB70PCfgKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778829079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lm7qRewpEqTpLRcjREliFLOj4DoIAcyiZ7TOAxkcx3U=;
	b=J85Gc/VK6Ke08XCJwk5y+KaR+0AheruEtDsSVEB14lIzNncFkqK2W7BeOsORkKjnk74ANb
	qXlyqvSEHLApJNBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07A9C593A9;
	Fri, 15 May 2026 07:11:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PkClABfHBmqYYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 07:11:19 +0000
Date: Fri, 15 May 2026 09:11:18 +0200
Message-ID: <87wlx5taeh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Adrien Burnett <an.arctic.pigeon@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Laptop 16-ag0xxx
In-Reply-To: <20260514165905.21175-1-an.arctic.pigeon@gmail.com>
References: <20260514165905.21175-1-an.arctic.pigeon@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 31A9C675BE
X-Spam-Level: 

On Thu, 14 May 2026 18:59:05 +0200,
Adrien Burnett wrote:
> 
> Add a SND_PCI_QUIRK entry for the HP Pavilion Laptop 16-ag0xxx
> (subsystem 0x103c:0x8cbc, Realtek ALC245). The
> ALC245_FIXUP_HP_X360_MUTE_LEDS fixup is already used by the
> neighbouring HP Pavilion Aero Laptop 13-bg0xxx (0x103c:0x8cbd);
> it chains the master-mute COEF handler with the GPIO mic-mute
> LED handler, which is what this machine needs.
> 
> Tested on the affected hardware: both the mute and mic-mute key
> LEDs respond correctly to the keyboard hotkeys after this change.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Adrien Burnett <an.arctic.pigeon@gmail.com>

Applied now.  Thanks.


Takashi
