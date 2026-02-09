Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0200364E83
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629859; cv=none; b=ZHod1USDTFHA7pfFKrEWT6g2Ma7CWhtEcQscWQJprvigxawcDl7BIHWbVvSEvnUo69CQgGuD+GGFWwlKF2YFEWcD9dmn6Usz9J0De0YgGnXj887HPTPkPQLMGgBoVI3zA9vy87syR5w7uxuQBiGUW4J++yveDhHrFsk1cckKhcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629859; c=relaxed/simple;
	bh=a8II9qhplVHTF4Bh4ragebrFwStbzGqjieogHOf+X58=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/gFKrWa+VxADf+WwLap7u16632lXEpfRmZEkfCGWvUBkFiUHlygqRAmvlyvBcNt4g/tmnRcRv+Lfm2MBtXm9HPE535hny1YpIznBDrGQgZ2Fj8CP/OugXcCb/jMCYx/5RB/MvybeSf4N8PjIMltxxbkLcBGX0+jWgciw/ebo20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=swq4pL7g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gsQWB+CS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=swq4pL7g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gsQWB+CS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="swq4pL7g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gsQWB+CS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="swq4pL7g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gsQWB+CS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0950A3E6C6;
	Mon,  9 Feb 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrS5Yalz0svOvoHNUBS4kXhBLdyzfRK7KL8XV5hriFc=;
	b=swq4pL7gLFr+6MCBoqBddXnJXf+VD1rkGe45rl7VYju7nTjD7ex9Baa2YOgyK2w2lklefK
	4XjErom5UEk49FF8rljrgJCzyN1sDeRbZt6tkNl8Wgsskh8QDZnFGday9IqvK4hp0BQCfh
	+11VAmA7oVA3b+Xd64MKRXxx7oWvc3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrS5Yalz0svOvoHNUBS4kXhBLdyzfRK7KL8XV5hriFc=;
	b=gsQWB+CSuMJe5TMKygG2BZ9oWB8EkQjY+cV503xh4NAmGUUqrLTvVY857lWUqCaA7A++Mg
	jt22zLp8vyeOSYDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=swq4pL7g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gsQWB+CS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrS5Yalz0svOvoHNUBS4kXhBLdyzfRK7KL8XV5hriFc=;
	b=swq4pL7gLFr+6MCBoqBddXnJXf+VD1rkGe45rl7VYju7nTjD7ex9Baa2YOgyK2w2lklefK
	4XjErom5UEk49FF8rljrgJCzyN1sDeRbZt6tkNl8Wgsskh8QDZnFGday9IqvK4hp0BQCfh
	+11VAmA7oVA3b+Xd64MKRXxx7oWvc3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrS5Yalz0svOvoHNUBS4kXhBLdyzfRK7KL8XV5hriFc=;
	b=gsQWB+CSuMJe5TMKygG2BZ9oWB8EkQjY+cV503xh4NAmGUUqrLTvVY857lWUqCaA7A++Mg
	jt22zLp8vyeOSYDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C16723EA63;
	Mon,  9 Feb 2026 09:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id khD3LeCqiWnzdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 09:37:36 +0000
Date: Mon, 09 Feb 2026 10:37:36 +0100
Message-ID: <87bjhy2r6n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: V-Conet <v-conet@outlook.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add DSD support for iBasso DC04U
In-Reply-To: <TYYPR01MB140982EB52459BA89009AED3BF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
References: <TYYPR01MB140982EB52459BA89009AED3BF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0950A3E6C6
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 09 Feb 2026 03:06:47 +0100,
V-Conet wrote:
> 
> The vendor ID 0x0661 is assigned to Hamamatsu Photonics K.K., but is used by iBasso for the iBasso DC04U USB DAC (0x0661:0x0883), which supports native DSD playback.
> 
> This patch adds QUIRK_FLAG_DSD_RAW for the iBasso DC04U, enabling native DSD playback (DSD_U32_BE). The change has been verified on Arch Linux using mpd and pw-cat.
> 
> Signed-off-by: V-Conet <v-conet@outlook.com>

Thanks for the patch.  The code change looks OK, but could you give
your Signed-off-by with a real name (or a known identity), as it's a
legal requirement for upstreaming?

Also, please fold the patch description texts properly, too.


thanks,

Takashi
