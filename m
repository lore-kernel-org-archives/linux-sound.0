Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17C279917
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529257; cv=none; b=k+yHZsDPcCbzdVxGyStdou/W4CZ426/QAcYs58IbhkOaWLe9Rrdijb9IZ/WTzJ5HjLZmBtCIQhgQ4joPTeSOh8gwHuHZXN6h7LNLBFfgbsiD7pZU4MihcY+pOUqHWtXq/TxchCGwaEejB729SqMizFZoneqhiyFdRarwSj9Rj+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529257; c=relaxed/simple;
	bh=JUU6HO+uZ/Ds+HZcrdp/1CDj51hLL68V8KxvjF+5Qq4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PN9pRC6ChAfclGlqTvZMqCtgVtSyASZG/wi4JFPNAZXCfKTqGMuMQAcvxm+9hCNc4cLQSaJQ2Tz+wZV8V/a2TZRta5afeGoJtTo/YOAGsZWZ+w905cfUQUiTKPubso1hQ8LgRq7nP8q0IJfX/Q8sPlKg1EH516UsEicFVC3Ud2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cg6EdOQv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E8P58/dQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cg6EdOQv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E8P58/dQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cg6EdOQv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E8P58/dQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cg6EdOQv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E8P58/dQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 76D0D6A7CB;
	Thu, 30 Apr 2026 06:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777529254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpK3PWNksdiVOVWCzAi2BclofGGwAa0SKyKceJDpRoQ=;
	b=Cg6EdOQvC4qazTeKWEKAHXWkyEBHmGr+hF568suOAmaq5fqjxPUVFqEDnytdPwul3AFZ0E
	lHWHIV3mJkZwvlH2Qm4IviPS5qNfXzpMpeXvP/oIPAPcJXrL2KZxaATd+gANCh0nejXw5B
	gvvW2zYZ8UjGOaeE9p0HSILqrDjpi3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777529254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpK3PWNksdiVOVWCzAi2BclofGGwAa0SKyKceJDpRoQ=;
	b=E8P58/dQ8GwgpT7d2xPf7gsI82iTMg4oQBBVA2fRjuY67t/EV8TEjpmdQprmbYeXXdnu1+
	doSGfBc8eZTRKCCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777529254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpK3PWNksdiVOVWCzAi2BclofGGwAa0SKyKceJDpRoQ=;
	b=Cg6EdOQvC4qazTeKWEKAHXWkyEBHmGr+hF568suOAmaq5fqjxPUVFqEDnytdPwul3AFZ0E
	lHWHIV3mJkZwvlH2Qm4IviPS5qNfXzpMpeXvP/oIPAPcJXrL2KZxaATd+gANCh0nejXw5B
	gvvW2zYZ8UjGOaeE9p0HSILqrDjpi3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777529254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpK3PWNksdiVOVWCzAi2BclofGGwAa0SKyKceJDpRoQ=;
	b=E8P58/dQ8GwgpT7d2xPf7gsI82iTMg4oQBBVA2fRjuY67t/EV8TEjpmdQprmbYeXXdnu1+
	doSGfBc8eZTRKCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44E8B593B0;
	Thu, 30 Apr 2026 06:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6J6FD6bx8mnKdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Apr 2026 06:07:34 +0000
Date: Thu, 30 Apr 2026 08:07:33 +0200
Message-ID: <87pl3hnfq2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ee73befabe68e7907adf@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: pcm_oss: Fix use-after-free in poll via io_uring
In-Reply-To: <20260430021401.181505-1-songxiebing@kylinos.cn>
References: <20260430021401.181505-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[ee73befabe68e7907adf];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,appspotmail.com:email,suse.de:mid]
X-Spam-Flag: NO

On Thu, 30 Apr 2026 04:14:01 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> Fix use-after-free bug in snd_pcm_oss_poll() caused by
> io_uring asynchronous poll operations accessing already-freed
> pcm_oss_file private data.
> 
> The bug happens because file->private_data still points to
> kfree()'d memory after snd_pcm_oss_release(), and io_uring
> may invoke ->poll() handler later.
> 
> Fix by:
> 1. Clearing file->private_data early in release function
> 2. Adding NULL check in release to avoid invalid access
> 3. Adding NULL check in poll handler to prevent UAF
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") /* pcm_oss initial */
> Reported-by: syzbot+ee73befabe68e7907adf@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/alsa-devel/000000000000f1068105f20e5e8f@google.com/

This is a very old report.  Are you sure that it's still valid with
the latest kernel?
I believe this kind of bug should have been already fixed.
(And above all, the suggested code change doesn't look enough as a
proper fix.)

The same question applied for your other two patches for rawmidi and
PCM UAFs.


thanks,

Takashi
