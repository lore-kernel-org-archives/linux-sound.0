Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752918C933
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603896; cv=none; b=sfxzUoJ33Sdkj5ca9tXdZgpn+xl2ztMWc9+LD7bFlobIPMhoyVpRKbrWtCbdpBiZQgnyQ1k+r/GuYlL4ssT4phQdhVSdd86FJYAsOiq0CHeTCwONUq3wnkxWZlCNWpWRn4anqs/gqNy3qaPIk3Sy0uF1s9hsKAiezPCu9v2Cz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603896; c=relaxed/simple;
	bh=K6we2VcbEkJEsxRTd6hhqs6GZSiANkS74jCfWbZAsIA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSHrn8tVQs8Ugh7/txjviXwGLHW8N1uF1naY1S/FHcRDbgMuYMsGbB/SoDx3MsmJRMPNAbZk4tz+gzbSy88K1aaInOXSTakHAvxigi7aOIpntS88y+B6j96EQAWu5U7s6Z8Eunozv9OgBjflTVj+8D4ZVmgn2lfjQv2a3miBhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oey1xeH4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J35tvfOq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gq5K3JHw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TNt/g4q6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oey1xeH4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J35tvfOq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gq5K3JHw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TNt/g4q6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3E5A4D1C7;
	Fri, 27 Mar 2026 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90X/wbM3mLCK0UWtFW5aFQlM0zys5Lm26JSyRZixDbQ=;
	b=oey1xeH421NoEbG4qmlblZrSlhq4KPz7CEK/uMV4VTonF4LbOI1BMmTofrSpXR5F06GgHE
	s3V9i9VdFdE8247Z7K2KIAYNai2qmrj/rd6KPO44bYfnOvrVkxYDrhuZ/zBAc80Dvnn9h1
	RgiR5ilpf6f9qARasBkrwuienwF2/H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90X/wbM3mLCK0UWtFW5aFQlM0zys5Lm26JSyRZixDbQ=;
	b=J35tvfOqu23JRIilpDeofMJTkFg+97MmVtWt2oDyxyLqygDwiPcPNWPZGjUyjniyFlXoKo
	AHdUiN4CHLeL4rCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Gq5K3JHw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="TNt/g4q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90X/wbM3mLCK0UWtFW5aFQlM0zys5Lm26JSyRZixDbQ=;
	b=Gq5K3JHw7CmAzyxaTMrvRDupva2UTPAKeovSPUe1vl4ZDvKKfZEfDHnQx49dCf1O9rA7Kw
	WllT3bnnNWP80q5jpur8IKS21MDd5lA4dg6+kaBX1ha+RsgQ0UalcLF54JKjCIiipD13L2
	WvkhCLmdpJez+f6R2lcEp60UK7q6M08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90X/wbM3mLCK0UWtFW5aFQlM0zys5Lm26JSyRZixDbQ=;
	b=TNt/g4q685FDUCsl/L4GV+4TLqaXtzel8ygAu/DpisKLAzbk4QD9MoxE+KYud5Q4oT7M+L
	iX6yJTZaxdvuSnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9957A4A0A2;
	Fri, 27 Mar 2026 09:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2wVFJHVOxmnKIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:31:33 +0000
Date: Fri, 27 Mar 2026 10:31:33 +0100
Message-ID: <87mrztsjnu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rhys@tumelty.co.uk,
	rdunlap@infradead.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com
Subject: Re: [PATCH] ALSA: docs: fix dead link to Intel HD-audio spec
In-Reply-To: <20260321140212.5026-1-ninadnaik07@gmail.com>
References: <20260321140212.5026-1-ninadnaik07@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.48 / 50.00];
	BAYES_HAM(-2.97)[99.88%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.48
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E3E5A4D1C7

On Sat, 21 Mar 2026 15:02:11 +0100,
Ninad Naik wrote:
> 
> The existing link redirects to a generic page. Update the link to the
> specification document.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>

Applied to for-next branch now.


thanks,

Takashi
