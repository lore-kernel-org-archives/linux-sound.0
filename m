Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2191367B77
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 05:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256424; cv=none; b=ptGej2y2UW/kcPv6q0kAk3l0pvOaAyxNhEtnCAj/DOM9cfPMV26sxrQJDnM76uldy5Bo6myso0JxnrMCR3R+vj9PELwKbfvdaIA2sR1tCgte0G0r+XkDUv94nk6GqxIM/wYCHQJf7nJhOd7UR+6vJENVvzNH9ERNW6iTsgljmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256424; c=relaxed/simple;
	bh=v7sBCnZL4sVGAZKU78eZN9ltHBk7lZH0h1oFkbLuiU0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYFS34e3/ThhTUJJLbj85xawgq1nRiAEIPh/7akCXvPdvPW6TgTYoc7VoNkVdiYcoMbSowJC/2MGFgoVh8eikMSm8QoGUKFpM03pA6puwo3moF/Io5jgIDGYerylyL9P2UNW/BNv22PjTBEVWrGLfJ/5uF4LZ/KNkLakUbObLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XQq5CC8C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KtE5YB48; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XQq5CC8C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KtE5YB48; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XQq5CC8C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KtE5YB48";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XQq5CC8C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KtE5YB48"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B367671BA;
	Wed, 20 May 2026 05:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779256415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdcJJlaCcN/Saf92HvPEpleiM5+ffgmh+4eEopFjga0=;
	b=XQq5CC8CQZaZlyn9rDi5u5Ub8DTKzN8oJwUxiEMrjwfOabrYP5XIC81bKGEj0DyljPO6G6
	qGCT9gK11RL4hUXat5mGC4TZ4ZdbDclViaVkOze7ntqEZXyPk2bR9zwtX33Qqbt6z4He9O
	5yb29H6hmQ49yiuRHI4ZtYnuGKvsFpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779256415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdcJJlaCcN/Saf92HvPEpleiM5+ffgmh+4eEopFjga0=;
	b=KtE5YB4891lu4e9N1UMVWO3pho8i2HJSG2x3rHJdHDwS7bB4eNjycrTVpGiGwUz2sa5irk
	Qk72MWzMuckMm+Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XQq5CC8C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KtE5YB48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779256415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdcJJlaCcN/Saf92HvPEpleiM5+ffgmh+4eEopFjga0=;
	b=XQq5CC8CQZaZlyn9rDi5u5Ub8DTKzN8oJwUxiEMrjwfOabrYP5XIC81bKGEj0DyljPO6G6
	qGCT9gK11RL4hUXat5mGC4TZ4ZdbDclViaVkOze7ntqEZXyPk2bR9zwtX33Qqbt6z4He9O
	5yb29H6hmQ49yiuRHI4ZtYnuGKvsFpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779256415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdcJJlaCcN/Saf92HvPEpleiM5+ffgmh+4eEopFjga0=;
	b=KtE5YB4891lu4e9N1UMVWO3pho8i2HJSG2x3rHJdHDwS7bB4eNjycrTVpGiGwUz2sa5irk
	Qk72MWzMuckMm+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3935D593AA;
	Wed, 20 May 2026 05:53:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pJDwDF9MDWoVcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 May 2026 05:53:35 +0000
Date: Wed, 20 May 2026 07:53:26 +0200
Message-ID: <87fr3mlj8p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Allow flash writes ending at segment boundary
In-Reply-To: <20260519-alsa-scarlett2-flash-write-boundary-v1-1-b550480e92da@gmail.com>
References: <20260519-alsa-scarlett2-flash-write-boundary-v1-1-b550480e92da@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5B367671BA
X-Spam-Level: 

On Tue, 19 May 2026 16:46:19 +0200,
Cássio Gabriel wrote:
> 
> scarlett2_hwdep_write() rejects writes when offset + count is greater than
> or equal to the selected flash segment size. That incorrectly treats a
> write ending exactly at the end of the segment as out of space, although
> the last byte written is still within the segment.
> 
> Split invalid argument checks from the segment-space check, keep
> zero-length writes as no-ops, and compare count against the remaining
> segment size. This permits exact-end writes and avoids relying on
> offset + count before deciding whether the request is in bounds.
> 
> Fixes: 1abfbd3c9527 ("ALSA: scarlett2: Add support for uploading new firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
