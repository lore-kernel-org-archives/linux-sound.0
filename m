Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A9F3E3C5B
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828868; cv=none; b=jG+MJq51N+KtbiYXm4hNHT+W63ZNEQnHjr0/y4E/NEH0cWIupBzwTWDR6lTcoQ2hoKWYKTVi0yDlyAC+zwzPN9wtErcYFTyk32mXG3YW8geKojhw8upiSrkfJqv/ccm8QfdqgurmneD+8Xpmgg36/r0S1j8r9zp2CKZ0u7Kfx4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828868; c=relaxed/simple;
	bh=IXT4QH4fPLS4kUiN+mq9KYtcE18i8W5CosySd+UGujI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQbFlEQVK4oDA37BPz4AvaS3XQmTyNwKmXK1HU3ijoShivmq6gPnPCpAt3K+iBre3EeDRxj3NwxxPK3hS5dvy2kr9JM+U8LrSIVP71tOgICF/eGyturCYNmbZa6FWz9SXwbcahoHRCXgkOZ7gCgzEW3IFH3ZIlQjah0oIX+FO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1H87RcDs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bRBCwix+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1H87RcDs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bRBCwix+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1H87RcDs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bRBCwix+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1H87RcDs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bRBCwix+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0DDD6B620;
	Fri, 15 May 2026 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khpzKFA8oRpe7Mf5Z5hiDaswKcnKqYg+sUyGL998xSM=;
	b=1H87RcDsVTEgSWmkRxQiyTJ4rDXfwRZzp+Vs4lDPOGEwcVqoKtyYIv+mv0+BVdEza5HWpn
	rbckFrT8Y5PoQUBRNVUXiwlsR1X12KTLHy9s9kFUTdEQ4FUzO1j5Lr4qlKPXSCVFdeopbe
	F9VCMLcJTlaEYkv63BGNOntzNLger6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khpzKFA8oRpe7Mf5Z5hiDaswKcnKqYg+sUyGL998xSM=;
	b=bRBCwix+TjzfEayrwTvMO/UocGOxrnTxkxEpphPpaL7qGoPtdDwcNjc0SUScakWq2zMsTQ
	2oQD3eALrviZdIAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1H87RcDs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bRBCwix+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khpzKFA8oRpe7Mf5Z5hiDaswKcnKqYg+sUyGL998xSM=;
	b=1H87RcDsVTEgSWmkRxQiyTJ4rDXfwRZzp+Vs4lDPOGEwcVqoKtyYIv+mv0+BVdEza5HWpn
	rbckFrT8Y5PoQUBRNVUXiwlsR1X12KTLHy9s9kFUTdEQ4FUzO1j5Lr4qlKPXSCVFdeopbe
	F9VCMLcJTlaEYkv63BGNOntzNLger6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khpzKFA8oRpe7Mf5Z5hiDaswKcnKqYg+sUyGL998xSM=;
	b=bRBCwix+TjzfEayrwTvMO/UocGOxrnTxkxEpphPpaL7qGoPtdDwcNjc0SUScakWq2zMsTQ
	2oQD3eALrviZdIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 727F7593A9;
	Fri, 15 May 2026 07:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sp+TGkHGBmo+XwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 07:07:45 +0000
Date: Fri, 15 May 2026 09:07:45 +0200
Message-ID: <874ik9up4u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Schaefer <dhs@frame.work>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	"Dustin L. Howett" <dustin@howett.net>,
	linux@frame.work
Subject: Re: [PATCH] ALSA: hda/realtek: fix mic boost on Framework PTL
In-Reply-To: <20260513155513.11683-1-dhs@frame.work>
References: <20260513155513.11683-1-dhs@frame.work>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.de:mid,suse.de:dkim];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,frame.work:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A0DDD6B620
X-Spam-Level: 

On Wed, 13 May 2026 17:55:13 +0200,
Daniel Schaefer wrote:
> 
> In addition to the mic jack fix, also need to avoid boosting the
> internal mic too much, otherwise >50% input volume clips a lot.
> 
> Also add a second SSID. We have one for the classic chassis/speaker and
> one for the new Pro chassis/speaker.
> 
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> To: linux-sound@vger.kernel.org
> Cc: Dustin L. Howett <dustin@howett.net>
> Cc: linux@frame.work
> Signed-off-by: Daniel Schaefer <dhs@frame.work>

Applied now.  Thanks.


Takashi
