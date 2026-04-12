Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539723BD1B
	for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775980868; cv=none; b=CxoD9TUZyY6cs3fN5SNYqXFiwVIcYivs0eMjVicUdf6vAET9NNDZNzC/byPduKwJqw+YbVjY+fYX4A6vTv+v9hUAntURcO5sEQ6WBNveABc3OpSTy5XhFLTNr5VYuM7s3nOZKgy+9podkkC2YdSflPmdPqajH7XdKSxX7blCYlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775980868; c=relaxed/simple;
	bh=wFlQErYkFs2naY0UpedcIyzWnUl+16XBVDaGskn9F/g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNvmdUwA+onQDCFNi3cryYQntJ5z5RqgS5UvnAvsWagu77t9MyktES78tcyS01Xc/ftQtIuAtpN2ZEM51LTX1Wj2ouU6z2PKQKo8gpkkdGZgFcWNSHjV8YkSV85fm8tld3TyL2uuu9dUVVdEIXn3zmdxN0tyuF0OWbzvuajRxHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zd7qweGS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ef80TODM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2XyzEiW6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ugZ5ZqcX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zd7qweGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ef80TODM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2XyzEiW6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ugZ5ZqcX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71B1D6A84A;
	Sun, 12 Apr 2026 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775980864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQXbial2cRhYNzKnUOA8WrEKqx3ZUg4JnCjn+AOpzMo=;
	b=Zd7qweGSSzfJTy2ftQIG5JCnLKgDgy8NAcXe98yNP8O4txi48Zc8jX6Q2R9KCStGhxeBO/
	ZPEq7Gs4iMn0jGKJOpdceJcrJ4rEG6qglw7VpkdW2Ch1bY/gQhgrUgbWD8RUCosbeOXrGz
	7ZAuZ1AOzq58p+qOGzuTmXF26UxpZLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775980864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQXbial2cRhYNzKnUOA8WrEKqx3ZUg4JnCjn+AOpzMo=;
	b=ef80TODMDEBtDm14a+OqXB0EPG0b36KrdEktLXSgfVOuyvO3hzxY+P2ozucwpNvbgtD1ok
	QZ0UaEuILz9LT1CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775980861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQXbial2cRhYNzKnUOA8WrEKqx3ZUg4JnCjn+AOpzMo=;
	b=2XyzEiW6aC/vXxMkO8z1evFEmK/TWbov7hc9i8SkKqnUXzXehP9tCe2kpSilPy1XJqlvIi
	usj0ddNxigFkGRng2J0MpIjmhyX12Jwx9emmYshE3EiDG5bm1TgthnIDZQoPWWAXpk4/rb
	imXcCPeIHNo2zc1cHyLlKSl6QT117Ow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775980861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQXbial2cRhYNzKnUOA8WrEKqx3ZUg4JnCjn+AOpzMo=;
	b=ugZ5ZqcXLq9xhVFHAE5TmSXCttWv8+UlktPaJ6Ojz8Jzl8JiZIgjujwiejDYHBFFlpKjuo
	Khiwx800zsvjfxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DDF24A802;
	Sun, 12 Apr 2026 08:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FJ7LDT1R22lxJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 Apr 2026 08:01:01 +0000
Date: Sun, 12 Apr 2026 10:01:00 +0200
Message-ID: <875x5wober.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ALSA: sscape: add suspend/resume support
In-Reply-To: <20260411-alsa-sscape-pm-v2-0-aeb5682e14b0@gmail.com>
References: <20260411-alsa-sscape-pm-v2-0-aeb5682e14b0@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.10)[-0.516];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.20
X-Spam-Level: 

On Sat, 11 Apr 2026 20:14:39 +0200,
Cássio Gabriel wrote:
> 
> The SoundScape driver does more during probe than a plain WSS bring-up.
> It programs board-specific gate-array routing and, on non-VIVO boards,
> loads MIDI firmware and restores MIDI state before the MPU-401 side is
> usable. The driver still lacks suspend and resume callbacks, so that
> probe-time state is not restored after a system sleep cycle.
> 
> Generic WSS power management is not sufficient here because it only
> restores codec state. SoundScape resume also needs to restore the board
> routing, and on non-VIVO boards it needs to reinitialize the MIDI side
> when it was successfully enabled at probe time.
> 
> - Patch 1 stores the resolved per-card resources in struct soundscape,
>   factors the board reinitialization path into a helper, and reuses the
>   MIDI state programming sequence.
> - Patch 2 adds ISA and ISA-PnP PM callbacks, reapplies the board
>   configuration on resume, restores the non-VIVO MIDI firmware and MIDI
>   state when applicable, and keeps the WSS side available even if MIDI
>   restoration fails.
> 
> The board restore path also replays the OPUS AD1845 activation step used
> during detection so that resume matches the existing bring-up sequence
> more closely.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v2:
> - Change host_write_unsafe() and host_write_ctrl_unsafe() to return bool
> - Document the helper return semantics in the function comments
> - Rewrite sscape_restore_midi_state() to use the same chained-success
>   style as sscape_midi_put()
> - Link to v1: https://patch.msgid.link/20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com
> 
> ---
> Cássio Gabriel (2):
>       ALSA: sscape: Cache per-card resources for board reinitialization
>       ALSA: sscape: Add suspend and resume support

Applied both patches now.  Thanks.


Takashi
