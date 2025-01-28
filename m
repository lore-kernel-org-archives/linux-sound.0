Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DF71D90B9;
	Tue, 28 Jan 2025 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050567; cv=none; b=EvBCurXgjky2GwDMbxoe2jOxWkDu/9+y9tBwEakf7OI5Dzz5VsalOuyxYPqt5P+cZcjy6YQsL+flhMLiGf/TOv4EBZKbwSJm+o3oJFiwt1zp15pnONR8yDD0TuACFB/09oXzeCOM/bw17QTQURFio0seBlxwWNpvhBlrPOFAL1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050567; c=relaxed/simple;
	bh=OqabXOVUj+7BmDTPsq7BqWo3Y9j8mzIqHwyEsExt3Ms=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jupUqBwD695MYAKPCAbqVLrVZSXihGzEayeSmwghTeg3qb7Zhj5wsIhQEQ2efYOafjTDU+3gotfb94YImLmhvchnKCPFTgBzIxQfHCMXO8kOG8wSMVBKAr0dYpqUDe7owWJn2PcrqO1eKnm0TPZe/McPNd9W6ptx9kbRsB6WbSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oP14Djuo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hLUp+NXO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oP14Djuo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hLUp+NXO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oP14Djuo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hLUp+NXO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oP14Djuo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hLUp+NXO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 06A2A1F381;
	Tue, 28 Jan 2025 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738050558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uYm7XSChDjSt1mgpvong8wmj80J9nFKJjw/dqbtHXvA=;
	b=oP14DjuoMIUIqkn9UmZo8eaUHIpXX43HhmvZIDdLh9GMFssL03v9rrW8vl6md1qBxSxJ00
	Co4Fih29yQ7D1hACT9agsYiQnmjUkMl0k7Bi8CNbOzyCi5SSwnKH6geKE9m5mBCzXWDtPB
	BfWEEA3clzeWhXqBulQN+9UtrUICXcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738050558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uYm7XSChDjSt1mgpvong8wmj80J9nFKJjw/dqbtHXvA=;
	b=hLUp+NXOYz6QmioUxEWF/NIUt8F6bUoR1KlmLf498QNe3CyJh3uUH0po5IvStlz3OG8i1A
	Eugb8pSZggOwBRBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oP14Djuo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hLUp+NXO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738050558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uYm7XSChDjSt1mgpvong8wmj80J9nFKJjw/dqbtHXvA=;
	b=oP14DjuoMIUIqkn9UmZo8eaUHIpXX43HhmvZIDdLh9GMFssL03v9rrW8vl6md1qBxSxJ00
	Co4Fih29yQ7D1hACT9agsYiQnmjUkMl0k7Bi8CNbOzyCi5SSwnKH6geKE9m5mBCzXWDtPB
	BfWEEA3clzeWhXqBulQN+9UtrUICXcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738050558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uYm7XSChDjSt1mgpvong8wmj80J9nFKJjw/dqbtHXvA=;
	b=hLUp+NXOYz6QmioUxEWF/NIUt8F6bUoR1KlmLf498QNe3CyJh3uUH0po5IvStlz3OG8i1A
	Eugb8pSZggOwBRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B317413625;
	Tue, 28 Jan 2025 07:49:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b/YZKv2LmGf0RgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jan 2025 07:49:17 +0000
Date: Tue, 28 Jan 2025 08:49:17 +0100
Message-ID: <87zfjb9y4i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: yangchenyuan <chenyuan0y@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	pavel.hofman@ivitera.com,
	jbrunet@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zijie98@gmail.com
Subject: Re: [PATCH] ALSA: pcm: use new array-copying-wrapper
In-Reply-To: <20250127160655.3119470-1-cy1yang@outlook.com>
References: <20250127160655.3119470-1-cy1yang@outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 06A2A1F381
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,zeniv.linux.org.uk,kernel.org,ivitera.com,baylibre.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 27 Jan 2025 17:06:55 +0100,
yangchenyuan wrote:
> 
> From: Chenyuan Yang <chenyuan0y@gmail.com>
> 
> This is found by our static analysis tool.
> 
> pcm_native.c utilizes memdup_user() to copy an array from userspace.
> 
> There is a new wrapper, specifically designed for copying arrays. Use
> this one instead.
> 
> This is similar to the 
> commit 3e91a38de1dc ("fbdev: viafb: use new array-copying-wrapper").
> 
> Fixes: 67616feda99e ("ALSA: pcm: Unify ioctl functions for playback and capture streams")

This use of Fixes tag is misleading: the original code is correct, per
se, and the original commit was 4.14, where it had no no
memdup_array_user() available (introduced since 6.7).

So I applied with the drop of Fixes tag.


thanks,

Takashi
