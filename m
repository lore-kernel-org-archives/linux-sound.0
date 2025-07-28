Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F2B202C45
	for <linux-sound@vger.kernel.org>; Mon, 28 Jul 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753698309; cv=none; b=fZzxX2RaMAOsL7rwdO7a0fLQu4yRB2EWta5cf/TzOvLdhNcW8fBPwXxYvxWoDkbeJXadK8AeLdqF9DoiWTxyGRJcOUmucx6USEWiTw+Pplv7lLiomsOfgLMPtq2+N9xXHaE9j7Knu04okkBbzlyrXHXSpTIQ/a6DHTS/OeyCtSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753698309; c=relaxed/simple;
	bh=JZu6txtpR+hd0sW/+ZZIMNJBNRzxcWe1AjcLo4LdTA0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f9tXfuwI95ZT4SJ9/FvCaPygiQWdG5459kbTXTr+EOHyoKfQ+mFze7pE5oJvR6CaasSqR3qvTWKRBX5fcP+5cl/9SnzNfQrg9AqYF5ovoOrmo2VyiQYSKUl19CmNrXxurh935Vftc1kRx+I+NicyzATmZvMXy3Aix7I1UfyzCqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BfZuxE12; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YyTl3HPg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BfZuxE12; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YyTl3HPg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BfZuxE12";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YyTl3HPg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BfZuxE12";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YyTl3HPg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 258A621242;
	Mon, 28 Jul 2025 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753698306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYbJ0osPSALSx2mutcjpFojQfMHOilLiF3RF5xfCJWE=;
	b=BfZuxE1201BoYqvxAVO3I3Gxy8jutkBYY313K2aw1BAEBHGgVff/6K8AE03te9W6ckRJSV
	0niBYO5PdOy22AcT2fetjcApnrcycwaEYdGRzack1oOtO+Gw2eQTXXOI1UWRsH78rF7pSh
	o9v/6xz7hG7v+Q9AvuYbXICLOL4ls7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753698306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYbJ0osPSALSx2mutcjpFojQfMHOilLiF3RF5xfCJWE=;
	b=YyTl3HPgcDU8Et0WIS9DOYoZyjnTGVbb39+noZBskwXB6AyTiwkqoYJOeuFgOnUkl57uSL
	MU/IEF08LNSlgMCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753698306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYbJ0osPSALSx2mutcjpFojQfMHOilLiF3RF5xfCJWE=;
	b=BfZuxE1201BoYqvxAVO3I3Gxy8jutkBYY313K2aw1BAEBHGgVff/6K8AE03te9W6ckRJSV
	0niBYO5PdOy22AcT2fetjcApnrcycwaEYdGRzack1oOtO+Gw2eQTXXOI1UWRsH78rF7pSh
	o9v/6xz7hG7v+Q9AvuYbXICLOL4ls7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753698306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYbJ0osPSALSx2mutcjpFojQfMHOilLiF3RF5xfCJWE=;
	b=YyTl3HPgcDU8Et0WIS9DOYoZyjnTGVbb39+noZBskwXB6AyTiwkqoYJOeuFgOnUkl57uSL
	MU/IEF08LNSlgMCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F138A138A5;
	Mon, 28 Jul 2025 10:25:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MkCXOQFQh2jWQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Jul 2025 10:25:05 +0000
Date: Mon, 28 Jul 2025 12:25:05 +0200
Message-ID: <87cy9kvchq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Add retry on -EPROTO from scarlett2_usb_tx()
In-Reply-To: <aIdDO6ld50WQwNim@m.b4.vu>
References: <aIdDO6ld50WQwNim@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 28 Jul 2025 11:30:35 +0200,
Geoffrey D. Bennett wrote:
> 
> During communication with Focusrite Scarlett Gen 2/3/4 USB audio
> interfaces, -EPROTO is sometimes returned from scarlett2_usb_tx(),
> snd_usb_ctl_msg() which can cause initialisation and control
> operations to fail intermittently.
> 
> This patch adds up to 5 retries in scarlett2_usb(), with a delay
> starting at 5ms and doubling each time. This follows the same approach
> as the fix for usb_set_interface() in endpoint.c (commit f406005e162b
> ("ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()")),
> which resolved similar -EPROTO issues during device initialisation,
> and is the same approach as in fcp.c:fcp_usb().
> 
> Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
> Closes: https://github.com/geoffreybennett/linux-fcp/issues/41
> Cc: stable@vger.kernel.org
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Thanks, applied now.


Takashi
