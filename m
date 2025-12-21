Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69512868A7
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766312755; cv=none; b=EGwsThZfpEmeyToqaeP++3+5MlM36xdnbTHv4Jl7iCt3dUu9JNwBiLGXHgjMkXkNd5QJ7mciXFBU/VXq+zA+/mslq7ZKqY9Vgg4lnRrdm88EbcypyTkM6LzRtHW44bXqHG0NmxPZoIZvYZjIGMnKr0kyhFwXTXQ6ojyJBa5F80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766312755; c=relaxed/simple;
	bh=WArwVu7K8L4T3Andja9eSxSmx344/0acHOie/dbsS5Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPyhUtYQDAQ3HR+zQ0j/owvRo/1FrIBGhN0EQxmPSTnhX7krZSWiKDTpaBnZzX9AgWVZUo5144/o/xw+kISQxsufYhbxKJ36RmfwlBqXs1KtH8VGqQo2ybuJcDvf0GH9SUXk3QnqC9SBsC8xIXOwwwfyLRJgy7cK8A/BO6w4HPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VLRlCG0B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PaNaC0LX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uasz2k9v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cANf1lbR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VLRlCG0B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PaNaC0LX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uasz2k9v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cANf1lbR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A995B33859;
	Sun, 21 Dec 2025 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766312393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYQ9kZWdhDwh285JYrg++cC/URoLnUWwdFbQoLQx/Jk=;
	b=VLRlCG0B8PZ8gftFTn20niSr+rgk/fjHFEJRZasJyX3viyMLBeM3KwBDqQutW8ViIOL/cv
	smvF2qZ6cZOfxRJp0WApGx3qguasWoJHmfKEs1gzqIdf8yyOsPO4vxjYva6fBpHG35HF8P
	8rl6WEwazkA1izNpDdJcnnj7W7qcvkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766312393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYQ9kZWdhDwh285JYrg++cC/URoLnUWwdFbQoLQx/Jk=;
	b=PaNaC0LXJIeg+6Gms+n0awoc8p/NXPNoJzMEqhCkySRqFoEbO9nOdYECrbBqRzHbk+Ct2b
	XzDZcVt01GgbHTAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Uasz2k9v;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cANf1lbR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766312391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYQ9kZWdhDwh285JYrg++cC/URoLnUWwdFbQoLQx/Jk=;
	b=Uasz2k9vQFqCAvFuIn8dE46gwyGuzSLbDRUP/pO4AVYP+l9aV3atN1w5sSszk9WK8QyCiO
	GO1dKQhMeePyV0F1LoOSczDkx7VBCLVnier4vQqnYWQkp0nG+sKUP+yIQ55SvZtSAtuNPn
	g1VxNCp5ye8g6tdZRnSU8VszOwHXz44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766312391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYQ9kZWdhDwh285JYrg++cC/URoLnUWwdFbQoLQx/Jk=;
	b=cANf1lbR4e+U0vATaXk+lHtuH3vAWzQzbg+5h3bdrK1+KoPICOafvcvGI9Y6s7rxrwLwBL
	7FxLXD4lfQagrGBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40FDC3EA63;
	Sun, 21 Dec 2025 10:19:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EELODMfJR2l8fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 21 Dec 2025 10:19:51 +0000
Date: Sun, 21 Dec 2025 11:19:50 +0100
Message-ID: <87wm2gyw55.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix PCI SSID for one of the HP 200 G2i laptop
In-Reply-To: <20251218062251.2039592-1-chris.chiu@canonical.com>
References: <20251218062251.2039592-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: A995B33859
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Thu, 18 Dec 2025 07:22:51 +0100,
Chris Chiu wrote:
> 
> The PCI subsystem ID of the HP machine Abe A6U should be 0x8ee7
> instead of 0x8eb7.
> 
> Fixes: a30fa8122222 ("ALSA: hda/realtek: fix mute/micmute LEDs don't work for more HP laptops")
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Thanks, applied now.


Takashi
