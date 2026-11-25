Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616224;
	b=AA3NEyAHVsyk/tXIJvbBRueKya221kDE6YhyYqsM4EETvQ19kX3Q8+XqS53PXtD/8yzd
	 vuw3lvEK0pj5b9a0X/ImO/8k3sGx7neSowIDYMlbU9Hrgn1mFmJhvop2Ci4ix6X1SL7lb
	 xA26KGDIze27lxFF2EHlT1HLrtpK04I4wKpoVjZqmASom66WhStN0Va/K/p2UoX3CqO1M
	 cEHmPDEUQinDG0eizbuy4VFjrUmG/AJEIXpe3hiBfl1Xum9cvXnInjkqXTc4+t/Rdd/XT
	 U6Yc2X3OKKmULV0Aon90B2i1lbbL6uGuuuu47SISq5068r8gS9Q5xFpwXHMkEvUDq7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616224;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=xjQ7t+hxSYpdXoOaT5d0FPIqr7NUdn7i+G2iVbJjNM0=;
	b=Mlh+CP0suk9Yv7cNrC57yrdT95girP+dcF1YdbNAc2NzEIRkiD81uhcwAlBojP/E2hTE
	 z7ZgfixS0gq3kF3FykaZYKsYqDbUpwNO/t/4qGzY9UpWxRt5qXn4zFvcmb2IKDnz4sBA2
	 DPvcWGGxyzTErdRQKrn+v81S8LnzJS1nxA6Qx7l5I0dJajmsfr+XQaHPe3fSJIPtbKkQw
	 flv7j0zznuQmHUMscxAMGPUXjwN5m7q4Kgp0iTHGXmv96pOI0UfRvgzvQgw4zJo9zxItm
	 dohCQUwaRn5uHaEZLTc3i1A7kaZL2qrwckwRxW2ZWdHTtY15OKghkuPf0VP57sPa3Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y2tIauWU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5mo+JhEp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v570YwC8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tQ1DJTw5;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08DA606A32C;
	Wed, 25 Nov 2026 14:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08DA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y2tIauWU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5mo+JhEp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v570YwC8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tQ1DJTw5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C91B1F7A2;
	Wed, 25 Nov 2026 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjQ7t+hxSYpdXoOaT5d0FPIqr7NUdn7i+G2iVbJjNM0=;
	b=y2tIauWUd2pShqo/bfCbA6msVxNTC2uj7qVptcutAJ5W4bRpgTiW0ZQn5EfN0nKxNhjNv/
	5Ow2n7k1HvIyZWc3oEJPifXBPuzo6kqnW5MrvPI0eYsC1c6OE8KK1dxrIhHqF66yZ4JAGE
	5HGG2RXg0JkaMSkdv0/yj+DOsBcqRP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjQ7t+hxSYpdXoOaT5d0FPIqr7NUdn7i+G2iVbJjNM0=;
	b=5mo+JhEpt7L5hxRVMb7+JMjARMDC54oRUE4Hn/+dwtnbQjGpCKWaIgAjIkW8bYKnbzjf/0
	+rs2z7N/AoeX3oCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v570YwC8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tQ1DJTw5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjQ7t+hxSYpdXoOaT5d0FPIqr7NUdn7i+G2iVbJjNM0=;
	b=v570YwC89TXqHdtif9Wh7u/WkMczFZe3Gxz8SAdteNmulKz7Zf7ve/NnVx1ZizXlPqfMXK
	n9Db0sz6w72npsi5CvZiD7QGFw2Z//fw5jyZ0v2H4Ka8Izpgmh9UFvh1+n2qpRV/+AB9jL
	GeYuUykjlHDMhzu761tp8SZuuPZX/AQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjQ7t+hxSYpdXoOaT5d0FPIqr7NUdn7i+G2iVbJjNM0=;
	b=tQ1DJTw5PXPrFZBsADbXKfnc5hMi4VH7MqLzFpChiGgmgyXerhscDDMhMRT00MZPweQzIS
	NJxTYgYtfX586mAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F414134CA;
	Wed, 25 Nov 2026 14:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RqcfNtrtBmsLWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:16:59 +0000
Date: Wed, 25 Nov 2026 15:16:58 +0100
Message-ID: <87mrqx6lnp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: sound: core: OSS mixer notify callback is invoked without module  pin or mutex, racing with rmmod
In-Reply-To: <2970c0cb.571.1a212bf66e0.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<119ebb9d.2ad26.1a20241cf1c.Coremail.xuhx@hust.edu.cn>
	<2970c0cb.571.1a212bf66e0.Coremail.xuhx@hust.edu.cn>
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
X-Rspamd-Queue-Id: 5C91B1F7A2
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perex.cz:email,hust.edu.cn:email,suse.de:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Wed, 25 Nov 2026 13:47:43 +0100,
徐晗翔 wrote:
> 
> snd_mixer_oss_notify_callback is a bare exported function pointer
> called by the card core without any mutex and without pinning the
> snd-mixer-oss module: a card thread could read the non-NULL
> pointer, be preempted, let rmmod clear it and unload, and then call
> into unloaded module text; and the module exit FREE walk could race
> snd_card_do_free()'s FREE callback into a double free of
> card->mixer_oss.
> 
> Restore the upstream synchronization: a static
> mixer_oss_notify_mutex, an internal snd_mixer_oss_notify(card, cmd)
> that takes the mutex and checks the pointer (used by the
> register/disconnect/free paths), and an exported
> snd_mixer_oss_set_notify() that the module uses to install/clear
> the callback under the same mutex -- so the exit path waits for
> in-flight callbacks (including their module_put()) before the
> module text is freed.

This should have been already fixed by the upstream commit
f0780cfa6acf.


thanks,

Takashi


> ---
>  sound/core/init.c          | 38 ++++++++++++++++++++++++++++++--------
>  include/sound/core.h       |  5 ++++-
>  sound/core/oss/mixer_oss.c | 11 +++++++++--
>  3 files changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -82,8 +82,33 @@
>  }
>  
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int free_flag);
> -EXPORT_SYMBOL(snd_mixer_oss_notify_callback);
> +/*
> + * The mixer-oss notify callback is invoked from the card core paths
> + * (register, disconnect, free) with no other serialization available.
> + * Call it through snd_mixer_oss_notify(), which takes a static mutex and
> + * checks the pointer under it: this keeps a callback in flight until it
> + * completes, so the snd-mixer-oss module can clear the pointer and wait
> + * for in-flight callbacks in its exit path instead of racing rmmod
> + * (call into unloaded module text) and double FREE walks
> + * (double free of card->mixer_oss).
> + */
> +static DEFINE_MUTEX(mixer_oss_notify_mutex);
> +static int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int cmd);
> +
> +static int snd_mixer_oss_notify(struct snd_card *card, int cmd)
> +{
> +	guard(mutex)(&mixer_oss_notify_mutex);
> +	if (snd_mixer_oss_notify_callback)
> +		return snd_mixer_oss_notify_callback(card, cmd);
> +	return 0;
> +}
> +
> +void snd_mixer_oss_set_notify(int (*callback)(struct snd_card *card, int cmd))
> +{
> +	guard(mutex)(&mixer_oss_notify_mutex);
> +	snd_mixer_oss_notify_callback = callback;
> +}
> +EXPORT_SYMBOL_GPL(snd_mixer_oss_set_notify);
>  #endif
>  
>  static int check_empty_slot(struct module *module, int slot)
> @@ -530,8 +555,7 @@
>  	/* at this point, they cannot respond to any calls except release() */
>  
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -	if (snd_mixer_oss_notify_callback)
> -		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
> +	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
>  #endif
>  
>  	/* notify all devices that we are disconnected */
> @@ -587,8 +611,7 @@
>  
>  	card->releasing = true;
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -	if (snd_mixer_oss_notify_callback)
> -		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
> +	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_FREE);
>  #endif
>  	snd_device_free_all(card);
>  	kfree(card->components);
> @@ -932,8 +955,7 @@
>  		return err;
>  
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -	if (snd_mixer_oss_notify_callback)
> -		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_REGISTER);
> +	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_REGISTER);
>  #endif
>  	return 0;
>  }
> diff --git a/include/sound/core.h b/include/sound/core.h
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -300,7 +300,10 @@
>  #define SND_MIXER_OSS_NOTIFY_REGISTER	0
>  #define SND_MIXER_OSS_NOTIFY_DISCONNECT	1
>  #define SND_MIXER_OSS_NOTIFY_FREE	2
> -extern int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int cmd);
> +/* install/clear the mixer-oss notify callback; the core serializes all
> + * callbacks through a static mutex, so the module's exit path can wait
> + * for in-flight callbacks before its text is unloaded */
> +void snd_mixer_oss_set_notify(int (*callback)(struct snd_card *card, int cmd));
>  #endif
>  
>  int snd_card_new(struct device *parent, int idx, const char *xid,
> diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
> --- a/sound/core/oss/mixer_oss.c
> +++ b/sound/core/oss/mixer_oss.c
> @@ -1367,7 +1367,7 @@
>  	struct snd_card *card;
>  	int idx;
>  	
> -	snd_mixer_oss_notify_callback = snd_mixer_oss_notify_handler;
> +	snd_mixer_oss_set_notify(snd_mixer_oss_notify_handler);
>  	for (idx = 0; idx < SNDRV_CARDS; idx++) {
>  		card = snd_card_ref(idx);
>  		if (card) {
> @@ -1383,7 +1383,14 @@
>  	struct snd_card *card;
>  	int idx;
>  
> -	snd_mixer_oss_notify_callback = NULL;
> +	/* clear the callback through the core helper: it stores NULL under
> +	 * the notify mutex, so any in-flight callback (which holds the
> +	 * same mutex) has completed before we proceed, and the card core
> +	 * can no longer call into this module while it is being unloaded.
> +	 * This also makes the FREE walk below the only FREE invocation,
> +	 * instead of racing the card core's snd_card_do_free() on the same
> +	 * card->mixer_oss (double free). */
> +	snd_mixer_oss_set_notify(NULL);
>  	for (idx = 0; idx < SNDRV_CARDS; idx++) {
>  		card = snd_card_ref(idx);
>  		if (card) {
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-22 15:56:37 (星期日)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: sound: core: OSS mixer notify callback is invoked without module  pin or mutex, racing with rmmod
> > 
> > snd_mixer_oss_notify_callback is a bare exported function pointer.  The
> > card core calls it from snd_card_register(), snd_card_disconnect() and
> > snd_card_do_free() without any mutex and without taking a reference to
> > the snd-mixer-oss module.  alsa_mixer_oss_exit() sets the pointer to NULL
> > and then walks all cards calling SND_MIXER_OSS_NOTIFY_FREE, which frees
> > card->mixer_oss.  A card thread can read the non-NULL pointer, be
> > preempted, let rmmod finish unloading the module, and then call the old
> > function pointer -- executing code from the unloaded module.  The same
> > lack of serialization allows the module's exit FREE walk and the card's
> > do_free FREE callback to race and double-free card->mixer_oss.
> > 
> > Upstream avoids this with a static mixer_oss_notify_mutex plus
> > snd_mixer_oss_notify()/snd_mixer_oss_set_notify() wrappers; the exit path
> > clears the pointer under that mutex, so in-flight callbacks (including
> > their final module_put()) finish before unload.  This tree exports the
> > raw pointer and calls it directly in three places.
> > 
> > This is a static report: the race is plain in the source, but I did not
> > build a dynamic reproducer for it.  The requirement is
> > CONFIG_SND_MIXER_OSS=m so that an rmmod path exists.
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
> >   sound/core/init.c:85-86:
> > 
> >     int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int free_flag);
> >     EXPORT_SYMBOL(snd_mixer_oss_notify_callback);
> > 
> >   direct calls:
> > 
> >   - init.c:533-535 in snd_card_disconnect():
> >       if (snd_mixer_oss_notify_callback)
> >           snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
> >   - init.c:590-591 in snd_card_do_free():
> >       if (snd_mixer_oss_notify_callback)
> >           snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
> >   - init.c:935-936 in snd_card_register():
> >       if (snd_mixer_oss_notify_callback)
> >           snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_REGISTER);
> > 
> >   module side:
> > 
> >   - sound/core/oss/mixer_oss.c:1370:
> >       snd_mixer_oss_notify_callback = snd_mixer_oss_notify_handler;
> >   - mixer_oss.c:1386-1394 (alsa_mixer_oss_exit):
> >       snd_mixer_oss_notify_callback = NULL;
> >       for each card: snd_mixer_oss_notify_handler(card, SND_MIXER_OSS_NOTIFY_FREE);
> > 
> >   The FREE handler (mixer_oss.c:1308-1360) takes card->mixer_oss, frees
> >   it and sets card->mixer_oss = NULL.  There is no lock around the
> >   pointer read/call or around the mixer_oss pointer, and no module
> >   reference is taken by the callback path.  snd_mixer_oss_open()
> >   (mixer_oss.c:57/73) takes try_module_get(card->module), not this
> >   module; the OSS mixer file's .owner may pin the module only while such
> >   an fd is open, so rmmod is possible with no OSS fd.
> > 
> > * Failure modes
> > 
> >   1. Unloaded-code execution: card thread reads a non-NULL callback,
> >      preempted; rmmod runs exit, sets NULL, unloads; card thread resumes
> >      and calls into unmapped module text.
> >   2. Double FREE: alsa_mixer_oss_exit() and snd_card_do_free() both
> >      invoke the FREE callback for the same card.  Both can read
> >      card->mixer_oss before either sets it NULL and kfree() the same
> >      object; or one frees while the other is inside the handler.
> >   3. Card register/disconnect during rmmod can leave the pointer
> >      cleared but a concurrent call already in flight with no completion
> >      wait.
> > 
> > * Trigger model
> > 
> >   - CONFIG_SND_MIXER_OSS=m (built-in has no unload path);
> >   - one thread registers/disconnects/frees a card, another thread runs
> >     rmmod snd-mixer-oss;
> >   - the card thread must read the callback before the exit store and
> >     reach the indirect call after unload, or both threads must reach the
> >     FREE path concurrently.
> > 
> >   Hotplug/unbind plus module unload is a realistic administration
> >   sequence.  It is a narrow but real race; the upstream mutex exists for
> >   exactly this reason.
> > 
> > * Impact
> > 
> >   - call into unloaded module text: UAF execution, kernel crash,
> >     potential code execution if the address is reused;
> >   - double free of card->mixer_oss: heap corruption;
> >   - at minimum rmmod/hotplug crash.
> > 
> > * Suggested direction
> > 
> >   Restore the upstream synchronization: a static mixer_oss_notify_mutex,
> >   snd_mixer_oss_notify(card, cmd) that takes the mutex and checks the
> >   pointer, and snd_mixer_oss_set_notify() used by the module init/exit to
> >   install/clear the pointer under the same mutex.  Ensure the exit path
> >   waits for in-flight callbacks (including their module_put()) before
> >   the module text is freed.
> > 
> > 
> >   Please keep me in Cc; I am not subscribed to the lists.
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
