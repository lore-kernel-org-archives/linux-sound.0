Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D33D0C1C
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693613; cv=none; b=Ub57ZbAcOB2VXXW4rdYP+9sP4sWlQBb/jVGI7Send0a2d1HFJgawZiB5mVB7LO/17911fym3mzlX1muMm8QCvOmelsWjlQERXhaIkCTOiXCqVw4vOsu36/lPNQEzDPjzG6aj78tWNnnhboUQ6HrvBCA1RX61wobj6KdUnoIrt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693613; c=relaxed/simple;
	bh=9HiCiNJUQw7ytkElmi5I76wQHA07UeLbOoHwAAVxbC8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdyInSbvHomS7GGNpfIysued8He75W/bEn4x63OljgrQbuEccOD152K8B04y5iXlkktrxRCzMUQu9cRdwXxbcXX3uJS6QUNI2N5DTjbPwOiFeoZeIJ8g7HZshKikbFtetZvA1DCHH/6fq1+IYgpmNq1uR35icsOd1K9pP8nzL5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZCoQ6e2Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dy+SwNb/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZCoQ6e2Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dy+SwNb/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCoQ6e2Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dy+SwNb/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCoQ6e2Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dy+SwNb/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 816A76BB14;
	Mon, 25 May 2026 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhX0Hqo/kqPTOminzprm7myRu7OH7hLn+QItAL3qWeA=;
	b=ZCoQ6e2Q11nEsXb07XrtOX2WUxs35dcXwecHgXpWQrqGZ8UT1eSqYe8zh1hEjkvdIxZnod
	LDe3niC51g0ilIDV13EHv/NhEDeFdh6dTYCSQgmxDcEfcb+5f5dEaL/1S5baUqNQfe+/Fk
	7nKsIqYZVHqgsUtsOr5fZ13kwpAN7B4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhX0Hqo/kqPTOminzprm7myRu7OH7hLn+QItAL3qWeA=;
	b=dy+SwNb/zCPJDzOD57tmhJKCJiXcPKIijcp+8Qq2qVRCi715yfCdJx5OaVhq+DxvHZxLFM
	TN5ZuiG5fuvQNCAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZCoQ6e2Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="dy+SwNb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhX0Hqo/kqPTOminzprm7myRu7OH7hLn+QItAL3qWeA=;
	b=ZCoQ6e2Q11nEsXb07XrtOX2WUxs35dcXwecHgXpWQrqGZ8UT1eSqYe8zh1hEjkvdIxZnod
	LDe3niC51g0ilIDV13EHv/NhEDeFdh6dTYCSQgmxDcEfcb+5f5dEaL/1S5baUqNQfe+/Fk
	7nKsIqYZVHqgsUtsOr5fZ13kwpAN7B4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhX0Hqo/kqPTOminzprm7myRu7OH7hLn+QItAL3qWeA=;
	b=dy+SwNb/zCPJDzOD57tmhJKCJiXcPKIijcp+8Qq2qVRCi715yfCdJx5OaVhq+DxvHZxLFM
	TN5ZuiG5fuvQNCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D5FB59B0D;
	Mon, 25 May 2026 07:20:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RgWjDSr4E2oFEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:20:10 +0000
Date: Mon, 25 May 2026 09:20:09 +0200
Message-ID: <87ik8cgdli.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-motu: Protect register DSP event queue positions
In-Reply-To: <20260521-alsa-firewire-motu-event-locking-v1-1-708e1c2b5e56@gmail.com>
References: <20260521-alsa-firewire-motu-event-locking-v1-1-708e1c2b5e56@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 816A76BB14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	internal_greylist_whitelist(0.00)[2a07:de40:b281:104:10:150:64:97];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 21 May 2026 13:01:23 +0200,
Cássio Gabriel wrote:
> 
> The register DSP event queue is updated under parser->lock, but
> snd_motu_register_dsp_message_parser_count_event() reads pull_pos and
> push_pos without the lock.
> snd_motu_register_dsp_message_parser_copy_event() also reads both queue
> positions before taking the lock.
> 
> Protect these accesses with parser->lock as well. This keeps the hwdep
> poll/read path consistent with the producer side and with the cached
> meter/parameter accessors.
> 
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
