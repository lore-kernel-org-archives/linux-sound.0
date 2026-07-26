Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839051C2324
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785075135; cv=none; b=PYNK2esAi3A99Vw6+s/hO25cizTuf8p9ppjEdSzvPBVovlquuCt77D3rJGaccTH2jRdrnx7abQvv9lh22foV+YicDi9BFIY5Zais5yCHuEdsXww3AdPHLGtKS5wTP9prx/ZvRiGE9qCuJDJpbS+liLB8Hxhhp0kgq9iQk07G8C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785075135; c=relaxed/simple;
	bh=crkdUrKre+8cUkAefPpRm9lp4iKeV+hIqK2P7bCmcW8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUyin8hNPZtSnGYvOLuISaUNQUDkH770mLCu4mLXBggLCZ6d35waiCrEWEzszSHHeb73ms4d/Lyd6mVGs8ek+mgW9bcqvQKe4wj0w0BlY4E9t9b+NkXxS+m90GpbdRi/xqP+rBN+J5rc/YDnjDrtcWuEedxfikeEVi+VRIXM6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i3+edha2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tpuSp7/Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uLeLE5fK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BGum9G80; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i3+edha2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tpuSp7/Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uLeLE5fK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BGum9G80"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 98B347C3A9;
	Sun, 26 Jul 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785075128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGB/eaVu7PLKY6oSEX/LsEs38kpCtP8/eSEdO16Rqe4=;
	b=i3+edha2g2X6WbrbS3c0epy4tMtThBfiM9j+OYdEWSeR5najjibG1i/ZoFaUUKnJDwSDe5
	FT3nwrYCz/+one84U/81f+Nt6xAcdj5faA5VBwlMhs++N+Ol7TkqwvBgl3jACtntplInXW
	Difd+gAqmWkrQZmedCI46P8NgJ2/BJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785075128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGB/eaVu7PLKY6oSEX/LsEs38kpCtP8/eSEdO16Rqe4=;
	b=tpuSp7/ZZy/x1xVYjcd7celNLo1L79iTbddxD/sewNLG7MMfjBsb4EWod+/yIkghyH253N
	NhgmnhLC/g0ES8CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uLeLE5fK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BGum9G80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785075124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGB/eaVu7PLKY6oSEX/LsEs38kpCtP8/eSEdO16Rqe4=;
	b=uLeLE5fKNkY8g7U5DMgXpfvPBrtAIexmg8xpTHX5nK7RYlUwN+XYRCILciJajA2Y8Kz4iV
	33as8wEnEL6OugXVB2eqXMVnm5undSjjinIti5tpfsaicXw0v09+ZF0y6fDKTetKTb2o19
	3UETNVi0HBhfnB+J23ESdyGbRKuvCq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785075124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGB/eaVu7PLKY6oSEX/LsEs38kpCtP8/eSEdO16Rqe4=;
	b=BGum9G809xhD69v4Q3iTP1CN0Bbq9/pMnl9K25HHWYSVm8CeDiatGM+AQeeGa2CBOE4FOE
	unClmBZu51w8NNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D817779B9;
	Sun, 26 Jul 2026 14:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nBREGbQVZmrzAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 14:12:04 +0000
Date: Sun, 26 Jul 2026 16:12:04 +0200
Message-ID: <87ldaxalhn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Norbert Szetei <norbert@doyensec.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: timer: Clear SNDRV_TIMER_IFLG_DEAD once the close completes
In-Reply-To: <CA41AA48-75BF-45E9-A36D-3A5D2F124F60@doyensec.com>
References: <CA41AA48-75BF-45E9-A36D-3A5D2F124F60@doyensec.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 98B347C3A9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sun, 26 Jul 2026 10:01:45 +0200,
Norbert Szetei wrote:
> 
> snd_timer_close_locked() marks an instance with SNDRV_TIMER_IFLG_DEAD
> and returns early when the flag is already set, but the flag is never
> cleared again.  A completed close ends in remove_slave_links(), which
> leaves timeri->timer NULL, so a second close is already harmless through
> the timer == NULL path; the early return can only be reached by an
> instance that was opened again in between.  For such an instance the
> close unlinks nothing, so snd_timer_instance_free() frees an object that
> is still on timer->open_list_head, still on snd_timer_master_list if it
> was opened with a slave key, still owns any adopted slaves, and still
> holds its timer and module references.
> 
> snd_seq_timer_open() reopens an instance exactly like that: it retries
> its fallback open on the same object after a failure that has already
> run snd_timer_close_locked() internally.  An unprivileged user with
> access to /dev/snd/timer and /dev/snd/seq can force that failure, since
> snd_timer_check_master() returns -EBUSY when a pending slave matches the
> new master's (slave_class, slave_id) key and the target timer has
> reached max_instances, and SNDRV_TIMER_IOCTL_SELECT with dev_class =
> SNDRV_TIMER_CLASS_SLAVE keeps the caller-supplied dev_sclass, so a
> sequencer queue's key can be forged.  The freed instance is afterwards
> dereferenced by any further snd_timer_open() on that timer, by
> snd_timer_check_slave(), and by /proc/asound/timers, which faults on the
> stale ti->owner pointer.
> 
> The flag only has to be visible while the close is in progress, which is
> all its other users need.  Clear it in remove_slave_links(), under the
> same timer->lock that sets it, once the instance is off every list.
> 
> Fixes: da3039e91d1f ("ALSA: timer: Forcibly close timer instances at closing")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>

Applied now.  Thanks.


Takashi
