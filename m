Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B1330F54C
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593613; cv=none; b=Pj6oay3v5xPU+Lu91O3xnwVdnkNTnqNEQ23Y4/jO4yVpP2hHmyKfqJ8TmHhlJOQ2Z8xdigB+bxPirz6tRm4E/brSzK1pmHZvsjAqfheYDKWsUFrW0jCDr9W0uAvcz8ne2gdAyPMrHyfVYzPCcy8F03t5Sn/sm7/3cR822WhHEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593613; c=relaxed/simple;
	bh=NYxhjry4WltvbikXQ8Lt/nlEKClfqUE8pHQD8uxN5+o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oj1wcC0Q6XjZ8zhotyFTIsWMLsslVbGnfaKwl25FTkdgrOFchXpaLGKXhRcmk3YMdYYTgOxxvKXH5V8vVovY736GELSLxsdnBzroY7/N/RYZEsyPcDMoLGcA11lfa0tLR2RT9MTqP2HIqx9wMIWEw7VrQL315svqRgRboSAXHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eNYtUSO3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wZwA4Qhc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xVR9lTUg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XBKPUOG6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eNYtUSO3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZwA4Qhc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xVR9lTUg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XBKPUOG6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87115337D0;
	Mon,  1 Dec 2025 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764593609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gs7q7CAUYZwkZPKi0HW5tHzDnP2DuMt1qmZD1WMo9Do=;
	b=eNYtUSO37qekexZ+SI0Dmmfwuo3nDGnFspkEhIjYFJk78KOkG3D2DS4TE3aaUWozHtcmLf
	IEWEnHCLMds/Dd3c5KvHLWHL1o4H0a1k5LrEoa2mF7Px79YRC0c79sDSMjORGQ7RXyX70e
	HuqUB7SAzXr+F9hfcYzbB1eaFLw65ow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764593609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gs7q7CAUYZwkZPKi0HW5tHzDnP2DuMt1qmZD1WMo9Do=;
	b=wZwA4Qhc340yVIi/lEQj9bRGUDaIXDmgMXncz9+mMFzFz3u11yldpv50rZ+OKRD4y7bJtj
	7XTdEcRVYF5GhACQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764593608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gs7q7CAUYZwkZPKi0HW5tHzDnP2DuMt1qmZD1WMo9Do=;
	b=xVR9lTUg2j8TOFofpqS0CvT/gdO9Zt/Tmq381NC7LEjVpPyB7FbhniGVGmu7WeCFEmFY9y
	lE/4jXblvSFYqisffYe5wbpOTI82+ai2kxXaOJPGqDLTiycZDpk5haPXp67/4kcXJjGfzN
	82uay6WLQmLl5OI/6Jmg6T+bRHtmA6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764593608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gs7q7CAUYZwkZPKi0HW5tHzDnP2DuMt1qmZD1WMo9Do=;
	b=XBKPUOG6mwZH/qDghtb2Zj63KECnPnQ+4YtAkjGyK7+9ZMAttaHoghyrqcULuqL+0alYxY
	9wamfm8y8/KwNcBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 428EC3EA63;
	Mon,  1 Dec 2025 12:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PXArD8iPLWnBFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Dec 2025 12:53:28 +0000
Date: Mon, 01 Dec 2025 13:53:27 +0100
Message-ID: <87zf82bby0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
In-Reply-To: <20251201105700.832715-4-joakim.zhang@cixtech.com>
References: <20251201105700.832715-1-joakim.zhang@cixtech.com>
	<20251201105700.832715-4-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 01 Dec 2025 11:57:00 +0100,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add CIX IPBLOQ HDA controller support, which integrated
> in CIX SKY1 SoC.

It'd be more helpful to describe the characteristics about this chip.
e.g. this chip requires special handling for jack polling, and it
needs the address offset, etc.

> +static int __maybe_unused cix_ipbloq_hda_suspend(struct device *dev)

Those __maybe_unused are superfluous when you use
SYSTEM_SLEEP_PM_OPS() or RUNTIME_PM_OPS() in dev_pm_ops definition.


thanks,

Takashi
