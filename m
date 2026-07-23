Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70480403EAD
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803085; cv=none; b=Pn9X0gsG33yRcPD+RMW9HyuR8cOC2A5t7ZuFY61vZ9DQa92IPT3OOleh42E95K/53lhksZLKO0psHBBazigvySmXEhpHU/Z0wQ/XBCHp2CxWWcteTPuKQh2yddkKzzO3Cu0uqbrV1jCWDyqKPjLDoKmJqBWMjIXFQdUbYFFS4Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803085; c=relaxed/simple;
	bh=zOctzmxC590ZWmAN/zDSmglDSYRgcegcBfHjAsjnokA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWQ2dB9dbbZWUk7A4+3TtbXIYYaHvq47H/6OGzfJtg6tNrg8NrgljvTs2cIiet1KLKMuYpyviD3lTTkVP8AghDVTR5nYVXO1u5OaUeWQtu9lUbkQqjMh5Gt9imUz24mN5KJlYRLEtcV9DXhR4r9zt1tkmDn5TB0uk7Pv7uTztTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xvvUXchN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YUE6S55c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xvvUXchN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YUE6S55c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvvUXchN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YUE6S55c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvvUXchN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YUE6S55c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E61F7B011;
	Thu, 23 Jul 2026 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784803082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzHFjZLDt8okWaJULgSZvYd0cjktA8zMlgIQ/uhUXQ=;
	b=xvvUXchN1Ph4IvmZNeAd1JFmR2Sq19Q35BRUl684HI60GhaSPXzLXbDWRiLl/hY0sb944E
	S2CoAKNtMfbajkxfw7Eztj9f9donXaIBiYXaDBtfIwfnL0GL+oAwna0UUd+GhkxMX2rOQ5
	sPg2NRhWqlpvXhAxn4covRXSL/xuZ3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784803082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzHFjZLDt8okWaJULgSZvYd0cjktA8zMlgIQ/uhUXQ=;
	b=YUE6S55ccLxZGCnXl+jYCk/eDEX8J7+vqgK496EknJR2kcaTm4K80UVaGievWSjliAgRgK
	OdnJKm8m/7dj6ZDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xvvUXchN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YUE6S55c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784803082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzHFjZLDt8okWaJULgSZvYd0cjktA8zMlgIQ/uhUXQ=;
	b=xvvUXchN1Ph4IvmZNeAd1JFmR2Sq19Q35BRUl684HI60GhaSPXzLXbDWRiLl/hY0sb944E
	S2CoAKNtMfbajkxfw7Eztj9f9donXaIBiYXaDBtfIwfnL0GL+oAwna0UUd+GhkxMX2rOQ5
	sPg2NRhWqlpvXhAxn4covRXSL/xuZ3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784803082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzHFjZLDt8okWaJULgSZvYd0cjktA8zMlgIQ/uhUXQ=;
	b=YUE6S55ccLxZGCnXl+jYCk/eDEX8J7+vqgK496EknJR2kcaTm4K80UVaGievWSjliAgRgK
	OdnJKm8m/7dj6ZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C649779B5;
	Thu, 23 Jul 2026 10:38:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4H1BBQjvYWqOBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 23 Jul 2026 10:38:00 +0000
Date: Thu, 23 Jul 2026 12:37:57 +0200
Message-ID: <87wlumdm9m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Add quirk to another Razer Blade 16
In-Reply-To: <0cd8c77a82a4481ca9409ac68f1041e8@realtek.com>
References: <0cd8c77a82a4481ca9409ac68f1041e8@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4E61F7B011
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 23 Jul 2026 09:15:44 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Razer Blade 16 had another SSID.
> The patch will add quirk to another machine.

Applied to for-next branch now.  Thanks.


Takashi
