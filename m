Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE44C125
	for <linux-sound@vger.kernel.org>; Mon, 19 Aug 2024 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056692; cv=none; b=Pzkc2POVnzir/6XIghLw0pnVM/b5w06Yj7KzgsIV0ZtCKVbJr2D3s+IQfejcVkUg/86ABoSaxZpKxUHo97vdG1re9GmVw8vEPwB0Z9u7GO6M2QeibLHxH2oWVkDJ1Sdjrd4gHsc0rsm/P1R8TBOiKkMMCjKcm1aOztQG2wiR1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056692; c=relaxed/simple;
	bh=BgSaLgQMEq65EzuZgtHsej5bP8G+KoSzoLjAGRHsnmQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qe7DLFfya4BLdcsHhvwnzZgXnWqIqbkhUcwFC8c5vGwxjTmrpdOYJBXilQP8LrPayKZSkkm18HZO16fXECj6XEeY0BgKOT+HffBF9EadUmraysjlLVN88xT5fNJ6YTyn3JEPDIFwCsqg1+7qY6GCsWPJTfNjhYGeI8KFK+nqWAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WJLllUiD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LHqOVSSZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S1k2xruF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xEkNZhHD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WJLllUiD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LHqOVSSZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S1k2xruF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xEkNZhHD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D6906203A9;
	Mon, 19 Aug 2024 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724056689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSG7BeJzJmYrwGp9TsZcz3daiPArASkBaeb6U9fTR3E=;
	b=WJLllUiD+pE0/sdxZqilvtEtfV4CxdLsiKF3T3V735ERdI3T5INZdjPCWK7IhL+9wU3EQM
	wQbSeoT2dPoqylw8Fo1LX6HJFR6w7Hhrms1yfd1ZKaF6MU1p3jxBHReGG18QfyUYl3NJiA
	ki7pUgnYBfFzwQe6gyBoHFFhWhnpMb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724056689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSG7BeJzJmYrwGp9TsZcz3daiPArASkBaeb6U9fTR3E=;
	b=LHqOVSSZctml/o9jqb2pRQP3Oid9sbpH+f1e1oNADHmgWiTCMXJ4KKtg/s1N1xS/SwUpR+
	qbSFuRmtqiOao0Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S1k2xruF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xEkNZhHD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724056688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSG7BeJzJmYrwGp9TsZcz3daiPArASkBaeb6U9fTR3E=;
	b=S1k2xruFvt4+5KLSmf4f5d5PKLiODMNt3PmJeXFf1PPWsHuaAKjohPjZEg7d3+MuUgoWGA
	qz+YPGJE6LUMnCWsAjf84+5EtCSqGH2AN9Bydj+mVIlW/G77nyHrwt/z6j2Fa6AfFWbFmu
	kSmFp5TPxGWKh7TQCmnCBnwElTRJjSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724056688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OSG7BeJzJmYrwGp9TsZcz3daiPArASkBaeb6U9fTR3E=;
	b=xEkNZhHDSaswN3zlkNStQ32L6EU94GgV4HqN/Dn4Bmzooh1TpS47FvGBOnHLWB5c9wcIy+
	0A6mLWU0yxqt+jCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B260E137C3;
	Mon, 19 Aug 2024 08:38:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nJ9MKnAEw2bdGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Aug 2024 08:38:08 +0000
Date: Mon, 19 Aug 2024 10:38:50 +0200
Message-ID: <87plq4zz39.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "John Sweeney" <john.sweeney@runbox.com>
Cc: "linux-sound" <linux-sound@vger.kernel.org>,
	"tiwai" <tiwai@suse.com>,
	"perex" <perex@perex.cz>
Subject: Re: PATCH [1/1] ALSA: hda/realtek: Enable mute/micmute LEDs on HP Laptop 14-ey0xxx
In-Reply-To: <E1sfhrD-0007TA-HC@rmmprod05.runbox>
References: <E1sfhrD-0007TA-HC@rmmprod05.runbox>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D6906203A9
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[runbox.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[runbox.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.51
X-Spam-Flag: NO

On Sun, 18 Aug 2024 17:30:15 +0200,
John Sweeney wrote:
> 
> From: John Sweeney <john.sweeney@runbox.com>
> 
> ALSA: hda/realtek: Enable mute/micmute LEDs on HP Laptop 14-ey0xxx
> 
> HP Pavilion Plus 14-ey0xxx needs existing quirk
> ALC245_FIXUP_HP_X360_MUTE_LEDS to enable its mute/micmute LEDs.
> 
> Signed-off-by: John Sweeney <john.sweeney@runbox.com>

There is still a problem about the subject line, but I corrected
locally and applied now.


thanks,

Takashi
