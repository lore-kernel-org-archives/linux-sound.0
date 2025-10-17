Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF932E12A
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712126; cv=none; b=mkjuGgD7hxZVbKn0Ugow6zvXH8c8Wh7f4KK1Z5yjSnaWigbWKWkvMmi97zPaX5evBj7WRmG2bo+kbw47GsnSrG1kVvgF1R+DVLgYLgdvCMXHFuK7/z4K8lR/5wQzlOFBOHRDlVYrd4XyDxtu6+9Oxl5qJ/iS9+j80TBzMzjWu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712126; c=relaxed/simple;
	bh=tfnIFmzWiYVwSpavOwNJbDxwzi5BUZNVxsXqIV8WuTo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+yd0VPGzKmiUMcYTwc4csqKWfqfBbVwWQ7B5nbAolQtKVqDCxBPz1ohNh6Ia+RttrN3Fb08D7VwG6d2bauimACNHDMJPgIY8/atRf37LbV5WDVJl+BhB+xvei2oM3KmdgVVbFwd1JJ+QXQEcYg0HQB9ADmTfwHohv5luD5m+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cy9rLdbn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9wHxbz5Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cy9rLdbn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9wHxbz5Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cy9rLdbn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9wHxbz5Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cy9rLdbn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9wHxbz5Y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5AA661FE54;
	Fri, 17 Oct 2025 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760712122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpBzeoHcMDo+5O2OkBeM7SysPdY9KBtljxB99CzFdqo=;
	b=Cy9rLdbnz6ETtBGDATDwpfCA/VOzoKSVl4qnjRuNvc7EJ+n04PNMJ3lpApsqf67kVr1Roq
	f7dZdLOD9A4HI5PmuBb8H0BtcutDDhZnfRgpPMHIL62F5JC3h5Yjx30Mh52EDVEfSjWhs1
	Uiqg9fFwaRlw8MHhRwlePHMZ2ENRZ1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760712122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpBzeoHcMDo+5O2OkBeM7SysPdY9KBtljxB99CzFdqo=;
	b=9wHxbz5YNORgHsX53pD2zayTJn1MpfcPtaNWcUrnN2DoptP7b6VvTmfgAknrkf2YjE65s7
	5aUy1RMYWCX+4aBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Cy9rLdbn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9wHxbz5Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760712122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpBzeoHcMDo+5O2OkBeM7SysPdY9KBtljxB99CzFdqo=;
	b=Cy9rLdbnz6ETtBGDATDwpfCA/VOzoKSVl4qnjRuNvc7EJ+n04PNMJ3lpApsqf67kVr1Roq
	f7dZdLOD9A4HI5PmuBb8H0BtcutDDhZnfRgpPMHIL62F5JC3h5Yjx30Mh52EDVEfSjWhs1
	Uiqg9fFwaRlw8MHhRwlePHMZ2ENRZ1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760712122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpBzeoHcMDo+5O2OkBeM7SysPdY9KBtljxB99CzFdqo=;
	b=9wHxbz5YNORgHsX53pD2zayTJn1MpfcPtaNWcUrnN2DoptP7b6VvTmfgAknrkf2YjE65s7
	5aUy1RMYWCX+4aBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EC1B13A71;
	Fri, 17 Oct 2025 14:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wVEBCrpV8mieZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Oct 2025 14:42:02 +0000
Date: Fri, 17 Oct 2025 16:42:01 +0200
Message-ID: <87frbh6152.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dawn Gardner <dawn.auroali@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute led for HP Omen 17-cb0xxx
In-Reply-To: <20251016184218.31508-3-dawn.auroali@gmail.com>
References: <20251016184218.31508-3-dawn.auroali@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5AA661FE54
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Thu, 16 Oct 2025 20:42:06 +0200,
Dawn Gardner wrote:
> 
> This laptop uses the ALC285 codec, fixed by enabling
> the ALC285_FIXUP_HP_MUTE_LED quirk
> 
> Signed-off-by: Dawn Gardner <dawn.auroali@gmail.com>

Applied now.  Thanks.


Takashi
