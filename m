Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913C235BF1
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689776; cv=none; b=dDNU2fVsIXyC/ymBQYeqY8fmqBko7xj7t0Otsw/5OE81S/eLOKFTvrHwsEOp2FI0Gu7kUwuQv2HZ0kJN8Cf0l2yyuKMa/flPG1Zw5OOMef1p56RxK8xmowd7csODY/4RsfgvdTGgnEV6+GUy/dhG1ZT9/OWJFTsYqmjp5xzXTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689776; c=relaxed/simple;
	bh=MN+L77TM52wqIZs9M/8cqH5CUNJkTOio/fFh6JAljxM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIdHHtE7/Q5OyRY8/Jfrg4wO6QDWthhdHsKtmdxWOqYyzssiRl0K2AwRKhOP6LaZXONeZIVnVhl7fGzDyCqfum7jyJNeiP0+As2l5JXxi61Tzlsc+RbVxT9YsG6M8Mnug+ob+KQbvG9AH0cdAbakzWnsBb2GG+7zwGiFmKGAPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MgUM3fwn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w0TTP37g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MgUM3fwn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w0TTP37g; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MgUM3fwn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w0TTP37g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MgUM3fwn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w0TTP37g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0472C204E7;
	Mon, 19 May 2025 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747689773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWwRgiabGIkmpdX9WRwuBdObLe27/LdOnb34YxvIxA4=;
	b=MgUM3fwnuc8VtzSRTladPj6jt4kTZfbF8Lko0FwoHTmP5JksiX57abC3ZZU0N4IHN4VtAj
	4o4+z2NgyH3Zx3fU01w/09nl+F1YtKC+lRMOQP3EMOk4RP5/kle+Ba+W1VTgokExKQ7cMY
	mB10OpnL7+7vq1GzwobxpHGp1oQNb4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747689773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWwRgiabGIkmpdX9WRwuBdObLe27/LdOnb34YxvIxA4=;
	b=w0TTP37g4Gv3jkzzgGXEwWXGaqqgWDUaT/IZ/e6i9rYdujn6RKUEYWBtK/mnkyjjbgwLmV
	sgkG+3sj8cIUjQBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MgUM3fwn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w0TTP37g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747689773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWwRgiabGIkmpdX9WRwuBdObLe27/LdOnb34YxvIxA4=;
	b=MgUM3fwnuc8VtzSRTladPj6jt4kTZfbF8Lko0FwoHTmP5JksiX57abC3ZZU0N4IHN4VtAj
	4o4+z2NgyH3Zx3fU01w/09nl+F1YtKC+lRMOQP3EMOk4RP5/kle+Ba+W1VTgokExKQ7cMY
	mB10OpnL7+7vq1GzwobxpHGp1oQNb4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747689773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWwRgiabGIkmpdX9WRwuBdObLe27/LdOnb34YxvIxA4=;
	b=w0TTP37g4Gv3jkzzgGXEwWXGaqqgWDUaT/IZ/e6i9rYdujn6RKUEYWBtK/mnkyjjbgwLmV
	sgkG+3sj8cIUjQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E347213A30;
	Mon, 19 May 2025 21:22:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 38P0NiyhK2gFJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 May 2025 21:22:52 +0000
Date: Mon, 19 May 2025 23:22:52 +0200
Message-ID: <878qms5m8j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ed Burcher <git@edburcher.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
In-Reply-To: <20250516190832.35128-2-git@edburcher.com>
References: <20250516190832.35128-1-git@edburcher.com>
	<20250516190832.35128-2-git@edburcher.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0472C204E7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]

On Fri, 16 May 2025 21:08:32 +0200,
Ed Burcher wrote:
> 
> Lenovo Yoga Pro 7 (gen 10) with Realtek ALC3306 and combined CS35L56
> amplifiers need quirk ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN to
> enable bass

The code change looks OK, but could you resubmit with your
Signed-off-by tag?  This is a legal requirement.


thanks,

Takashi
