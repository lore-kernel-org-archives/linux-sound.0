Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945823C5DBE
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813426; cv=none; b=Hsv7IqsyvIXilcyUsJwGH+dcOf1QnJ69Li2c0GOx2meYrUzxQxxiWp3tPLEZiWGYfd84kBmelNu/HpqqXsnTO3sFfDjC5p24NLaIDu/7Hz2FOA0uZHcYt6kQ137+dEtReTCmBwqSqOBYtq/9CH6ycQorJHP89jdJFIS3wJLl6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813426; c=relaxed/simple;
	bh=27L8QoKnUfRk/TTWzZC+9Oy9w5wxRSVpm7pq3ShurFo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWWmapiYvsu243HmTPqqLTlmLL1zmtiWBQoFC/zb8kufBQbOYZGsKO+4SbQK+fwT6OHGHmJDFjVKC3+fwWyBpv7kZ/tD025DxBHF5kmAFRzEY3EXRHekfuCXruRlsNrXw9RQCsardd1o5ftP0wezI3jtkMakP+eizEv1UfidPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pEIirkfj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HHqTO6h7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pEIirkfj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HHqTO6h7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pEIirkfj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HHqTO6h7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pEIirkfj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HHqTO6h7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90CFF719A8;
	Tue, 30 Jun 2026 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782813421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKMcsERPNSH3vdbWBqnaZGhimkLwW9AhcHFxktb7/FM=;
	b=pEIirkfjgdymEBCu+jTGxvPfy/Am0S31xJ+xnQZQJEyP4AIVqOsUnj1KLqdhDasICD6v3N
	Txf4Gj7y2+Q5P72Zu6aSoS2wvlfgl8eAkpfpeSpyq5qJ1MRje760iRHQ1C2OEHGaLpcRcZ
	SZzfjaHwXYfE5/zoRQ2rkQf8qf/MiEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782813421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKMcsERPNSH3vdbWBqnaZGhimkLwW9AhcHFxktb7/FM=;
	b=HHqTO6h7FQ1c69dE2sEnY7tuDfWK3VPc40BAyXwm+zR5qnP1BINjTeUeMtutRu/GlgVgQS
	0+zzQGM/l+MLLVBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pEIirkfj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HHqTO6h7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782813421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKMcsERPNSH3vdbWBqnaZGhimkLwW9AhcHFxktb7/FM=;
	b=pEIirkfjgdymEBCu+jTGxvPfy/Am0S31xJ+xnQZQJEyP4AIVqOsUnj1KLqdhDasICD6v3N
	Txf4Gj7y2+Q5P72Zu6aSoS2wvlfgl8eAkpfpeSpyq5qJ1MRje760iRHQ1C2OEHGaLpcRcZ
	SZzfjaHwXYfE5/zoRQ2rkQf8qf/MiEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782813421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKMcsERPNSH3vdbWBqnaZGhimkLwW9AhcHFxktb7/FM=;
	b=HHqTO6h7FQ1c69dE2sEnY7tuDfWK3VPc40BAyXwm+zR5qnP1BINjTeUeMtutRu/GlgVgQS
	0+zzQGM/l+MLLVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AF12779A8;
	Tue, 30 Jun 2026 09:57:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QqR1He2SQ2rNbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Jun 2026 09:57:01 +0000
Date: Tue, 30 Jun 2026 11:56:57 +0200
Message-ID: <87tsqkwdue.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: shubhamnayak392reborn@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Victus 16-e0xxx (88EE) to enable mute LED
In-Reply-To: <20260629-hp-victus-16-mute-led-v1-1-ab0f4a8a533b@gmail.com>
References: <20260629-hp-victus-16-mute-led-v1-1-ab0f4a8a533b@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 90CFF719A8
X-Spam-Score: -3.51

On Mon, 29 Jun 2026 15:34:55 +0200,
Shubham Nayak via B4 Relay wrote:
> 
> From: Shubham Nayak <shubhamnayak392reborn@gmail.com>
> 
> The mute LED on the HP Victus 16-e0xxx (board ID 88EE, ALC245 codec)
> does not function by default. Add the ALC245_FIXUP_HP_MUTE_LED_COEFBIT
> quirk to enable it. Tested on my HP Victus 16-e0xxx with kernel 7.1.2.
> 
> Signed-off-by: Shubham Nayak <shubhamnayak392reborn@gmail.com>

Applied now.  Thanks.


Takashi
