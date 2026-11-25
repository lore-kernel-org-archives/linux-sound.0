Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616271;
	b=ftJ+y8zdTWTkNXz42fKAgBCH59xMoffT/AyTUginmV+7GRhcEfqSlJFPLNHk8RCV5H+b
	 /RJs8a2IuI4Ei2OfRA3Cn5bYQ9GdLJirlgSErZAGmRDM1fL0zXFdWDUD5Wn8cJF8KgGLM
	 p69Spu6YQ51T41gz1ScLne/Lhtpa04JVvtE3NrVfmNIZdvMn7aJIQBDJU+RpVy/SP3hH7
	 399a2zSm3WcGusOVcqqYugUbG0ZrozwEKGXtSg3iUKlB7d+46DMPu5JditCeAqf6myi2J
	 LCzss4WdWGqluYz12XX9KGqm6a8f/gbNjni1DUI6wnZl94EMFGRTo28fL8WzFZd2g4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616271;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=KZ9tB/MB0itcYykUYerLScFBEiwIEhnDw165gr1oiQ0=;
	b=AFCQmuXHNu3m+s1QpQqFWSnRorVrHqjxpWXE3xbiVeswuT0XBDorLt1SFRUIjDOQP3Ky
	 WXDhK/L8HWQEKbiX/yPZ82exvikAM8QFT3u6bqfgPMc+pmMaP1qcfhywMtyoo3/mXna2X
	 vIFphg7CvbmqXOqdk7FsL7CMgvCZnHv0cJE/rugy4dfQ/BfpIiaAtHT/NNVB/JLsuQ8Q+
	 /ejDJQzOvLBRt/Q+IBlZuAd7hJ29xp1H8ES1xICNY1PSf6dK7Mxkkz6Rsz8Rlx8Gy9mRz
	 2WRF64XdliSVRH8QHBQLgO6LQBVa2qaqZFy5QOrhkdQngA6RVmD17oPUYM5mJlqG87Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DfSuLQxY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qs9YnITm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DfSuLQxY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qs9YnITm;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343B606A31E;
	Wed, 25 Nov 2026 14:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B343B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DfSuLQxY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qs9YnITm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DfSuLQxY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qs9YnITm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE07E2220C;
	Wed, 25 Nov 2026 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZ9tB/MB0itcYykUYerLScFBEiwIEhnDw165gr1oiQ0=;
	b=DfSuLQxYKJ3uGWERDYvVJfVEvMSSG5w6fobDbqw7S1uBUcy5+pTw36khLu1La5NUIzPCAc
	LAOPOCRZEvA/TCHuu+H7QpSof1Tcwek2AVScJCztVuvFgdnLQcZB3sXMwEUTJs8X4bh3rn
	SxHAFsM+rKkdeI5ApSBVJdmXubt7EGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZ9tB/MB0itcYykUYerLScFBEiwIEhnDw165gr1oiQ0=;
	b=qs9YnITms69N4MLlwhSoDcA+eF9v57Ez29z+MrzzGKP8d54JESC3Kf2oKi5rsHKei1ul66
	XoxEzEmIqISLxrCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DfSuLQxY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qs9YnITm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZ9tB/MB0itcYykUYerLScFBEiwIEhnDw165gr1oiQ0=;
	b=DfSuLQxYKJ3uGWERDYvVJfVEvMSSG5w6fobDbqw7S1uBUcy5+pTw36khLu1La5NUIzPCAc
	LAOPOCRZEvA/TCHuu+H7QpSof1Tcwek2AVScJCztVuvFgdnLQcZB3sXMwEUTJs8X4bh3rn
	SxHAFsM+rKkdeI5ApSBVJdmXubt7EGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZ9tB/MB0itcYykUYerLScFBEiwIEhnDw165gr1oiQ0=;
	b=qs9YnITms69N4MLlwhSoDcA+eF9v57Ez29z+MrzzGKP8d54JESC3Kf2oKi5rsHKei1ul66
	XoxEzEmIqISLxrCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7697E134CA;
	Wed, 25 Nov 2026 14:17:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WuzrEwzuBmvXWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:17:48 +0000
Date: Wed, 25 Nov 2026 15:17:48 +0100
Message-ID: <87ld6h6lmb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: sound: timer: snd_utimer_fops lacks .owner, so an open user timer  fd does not pin snd-timer
In-Reply-To: <4317d6a0.574.1a212bfe880.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<1a84c621.2ad29.1a202429a8e.Coremail.xuhx@hust.edu.cn>
	<4317d6a0.574.1a212bfe880.Coremail.xuhx@hust.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perex.cz:email,suse.de:dkim,hust.edu.cn:email,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: BE07E2220C

On Wed, 25 Nov 2026 13:48:16 +0100,
徐晗翔 wrote:
> 
> snd_utimer_fops had no .owner, so the anonymous-inode fd created by
> SNDRV_TIMER_IOCTL_CREATE did not hold a reference to the snd-timer
> module: the module could be unloaded while the fd was open, and a
> later SNDRV_TIMER_IOCTL_TRIGGER or close(fd) executed
> snd_utimer_trigger()/snd_utimer_release() from unloaded module
> text.  (utimer->timer->module is only consulted by snd_timer_open(),
> which the fd never goes through.)
> 
> Add .owner = THIS_MODULE so anon_inode_getfile() pins the module
> for the lifetime of the fd, as upstream does.

Already fixed by the upstream commit f9e882ac8257.


thanks,

Takashi

> ---
>  sound/core/timer.c |  1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/core/timer.c b/sound/core/timer.c
> --- a/sound/core/timer.c
> +++ b/sound/core/timer.c
> @@ -2173,6 +2173,7 @@
>  }
>  
>  static const struct file_operations snd_utimer_fops = {
> +	.owner		=	THIS_MODULE,
>  	.llseek		=	noop_llseek,
>  	.release	=	snd_utimer_release,
>  	.unlocked_ioctl	=	snd_utimer_ioctl,
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-22 15:57:29 (星期日)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: sound: timer: snd_utimer_fops lacks .owner, so an open user timer  fd does not pin snd-timer
> > 
> > SNDRV_TIMER_IOCTL_CREATE creates a user-driven timer and returns an
> > anonymous inode fd whose file_operations is snd_utimer_fops.  That
> > structure has no .owner = THIS_MODULE.  anon_inode_getfile() only calls
> > try_module_get(fops->owner) when owner is non-NULL, so the fd does not
> > hold a reference to the snd-timer module.  The module can be unloaded
> > while the fd is still open; a later ioctl(SNDRV_TIMER_IOCTL_TRIGGER) or
> > close(fd) calls snd_utimer_trigger()/snd_utimer_release() in unloaded
> > module text.
> > 
> > The module field does not save this path: utimer->timer->module is set
> > to THIS_MODULE in snd_timer_new(), but try_module_get() is only called by
> > snd_timer_open(), and a utimer fd never goes through snd_timer_open().
> > snd_utimer_create() also calls snd_timer_new(NULL, ...), so with card ==
> > NULL it does not go through snd_device_new(); snd_timer_global_register()
> > (timer.c:1188-1194) only does the device-list insertion and takes no
> > module reference.
> > 
> > This is a static report: the missing .owner and the anon_inode lifetime
> > are unambiguous, but I did not build a dynamic reproducer (it requires
> > CONFIG_SND_TIMER=m together with CONFIG_SND_UTIMER=y).
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Source analysis against mainline 7.3; no dynamic reproducer was run
> >   for this case.
> > 
> > * Root cause
> > 
> >   sound/core/timer.c:2175-2179:
> > 
> >     static const struct file_operations snd_utimer_fops = {
> >         .llseek        = noop_llseek,
> >         .release       = snd_utimer_release,
> >         .unlocked_ioctl = snd_utimer_ioctl,
> >     };
> > 
> >   Missing .owner = THIS_MODULE.
> > 
> >   sound/core/timer.c:2298:
> > 
> >     timer_fd = anon_inode_getfd(utimer->name, &snd_utimer_fops, utimer,
> >                                 O_RDWR | O_CLOEXEC);
> > 
> >   fs/anon_inodes.c:141-142:
> > 
> >     if (fops->owner && !try_module_get(fops->owner))
> >         return ERR_PTR(-ENOENT);
> > 
> >   owner == NULL -> no module reference.  utimer->timer->module =
> >   THIS_MODULE (timer.c:2252) is only consulted by snd_timer_open(),
> >   which the fd does not use; snd_timer_global_register() is just
> >   list_add_tail() and does not take a module reference.
> > 
> >   Upstream snd_utimer_fops has .owner = THIS_MODULE.
> > 
> > * Failure model
> > 
> >   1. user ioctl SNDRV_TIMER_IOCTL_CREATE -> snd_utimer_create() ->
> >      anon_inode_getfd() with the ownerless fops;
> >   2. no other snd-timer user -> rmmod snd-timer succeeds;
> >   3. user calls ioctl(SNDRV_TIMER_IOCTL_TRIGGER) or close(fd);
> >   4. snd_utimer_ioctl()/snd_utimer_release() execute from the unloaded
> >      module, and dereference utimer->timer / call snd_timer_interrupt().
> > 
> >   This is a module-lifetime race, not a data race on a shared field; the
> >   concurrency is rmmod vs fd operation.
> > 
> > * Trigger model
> > 
> >   - CONFIG_SND_TIMER=m (module) and CONFIG_SND_UTIMER=y;
> >   - a user creates a utimer fd via /dev/snd/timer;
> >   - the module is unloaded before the fd is closed;
> >   - the fd is used (trigger ioctl) or closed.
> > 
> >   Requires local access to /dev/snd/timer; no hardware.
> > 
> > * Impact
> > 
> >   - execution of unloaded module code: UAF execution, crash;
> >   - if the module address range is reused, potential code execution;
> >   - at minimum a local DoS / module-unload race.
> > 
> > * Suggested direction 
> > 
> >   Add .owner = THIS_MODULE to snd_utimer_fops.  Also consider whether the
> >   anon-inode path should hold an explicit module reference for clarity;
> >   .owner is the standard fix and matches upstream.
> >  
> > 
> >   Please keep me in Cc; I am not subscribed to the lists.
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
