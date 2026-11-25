Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611723;
	b=HZs91w43qncDOiIRj3cV4+1GqC6IuEW3+8ObmIG5RwIygOh3rcThAzEhySfBu8xC7hEe
	 XHfb4eEXnnKTQbjoT5sU+0lPZvE+TCFnpsXvRdVw+/COItGdDhgN6m341XhyvE7ino03/
	 13oeOcEHL+Csicx+fmSBjIjoaL2bCwyWdxBS8U53ySl6Te8KOy15x34Fnl7iIEMMR6KRM
	 iXvlaCRjRE8FSiCSDPGJWeo0e1SZ4Pt/1xEYrxh3je1NqxVnSBJTi7rAf4SvoHKWqHdNM
	 p/ZBo0IpEFg97CG9chepPnYQXhOi/ECsMFGnFdSQm0r1xM7JkNwr/KCZLCZIRib+jWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611723;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=p7hITA70+SpCbowH/AjvFi6LN2jQuQHv5dRUa44fFfI=;
	b=IB75f6o7psgFU9EPnuBUCkvJIWYgVIoq8Efm+DFLhQzot0XFMDb++iAhSjlFuYdb6Qm9
	 RDAN5qOcNB7e16OWGKd3D9/BoYmPRB7mmcW8g9L8wEp6WMaCsBopCKJeyvXDh5r1vGJAj
	 RjKVLnxTokIsJI0RN39InC3ufTM6Z13bRw37Zb3RkAqtQDyWeMsC1CwzBd3y3IawxEIqQ
	 Amuvlu68wu5w569eCvl7oxpbgxQI8XBMdv8Z0EL/zXvcqvaqflsxOiDrpC7mroFtVDZoQ
	 js39kgzCrbedTSQDjRmf1LupKxg4VQFe/2odBP4B/eKzXdbEbzwLLyur2rRNR1NC1fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nFTccKKb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=B6e7nMCf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oYUdnWiO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BdORVejW;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A796D606A31E;
	Wed, 25 Nov 2026 13:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A796D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nFTccKKb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=B6e7nMCf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oYUdnWiO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BdORVejW
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D4561F790;
	Wed, 25 Nov 2026 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795611720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7hITA70+SpCbowH/AjvFi6LN2jQuQHv5dRUa44fFfI=;
	b=nFTccKKbGMDnPJoiKKHpoG7FBXg4kaUVgRh2+/7P7+a25hxjLz0Nhj+GmtKYz7IvS7RZ+u
	h7NrgQvqEIns9IgP6YNwd5LusieIsRMgphyV4VWTh6RBKLi8W2PqXmkVrOlBP5/orr9KXC
	JzEgxPVfbJN9OXcsIMwqFIfYsMOUVDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795611720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7hITA70+SpCbowH/AjvFi6LN2jQuQHv5dRUa44fFfI=;
	b=B6e7nMCfabypWNv+a3GQL46vZKXkP11jcnW4zsjZkSPKp++qFXN4rgsAhDp5dAC4/YpCuF
	W+kJdfM2aU7NGqAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795611719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7hITA70+SpCbowH/AjvFi6LN2jQuQHv5dRUa44fFfI=;
	b=oYUdnWiOcBt/7Qc302iNd+2wFmw1U8NlM/tR5LVoc3F9Fv89z1p+yepMzE5+7eSk3YxS9Y
	ctQut4qeUVD3lt2foUL3UFXBTchFqbR/uJMEiG8GdfaDJn/p/5pbueALm6sTq2Xmm3oUhx
	Z6m1uQ+jomLBxt2XHEjFM103J9EiYVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795611719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7hITA70+SpCbowH/AjvFi6LN2jQuQHv5dRUa44fFfI=;
	b=BdORVejWQVbfi328wmasgi0TiH614hsruAsj3yWW37g1N+ohb5/Va7T4RISs4oiQrBlt9u
	FIRKm3kmxLdcXzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B665D134CA;
	Wed, 25 Nov 2026 13:01:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y7g3I0bcBmuOCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:01:58 +0000
Date: Wed, 25 Nov 2026 14:01:58 +0100
Message-ID: <875wxl83p5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: sound: core: card->devices is unlocked across the codec-side  targeted free and the card-side bulk free (double free / UAF; KASAN  confirmed on 7.3)
In-Reply-To: <107cbd83.556.1a212b8f680.Coremail.xuhx@hust.edu.cn>
References: <18ba4e54.1b567.1a18b1ea506.Coremail.xuhx@hust.edu.cn>
	<107cbd83.556.1a212b8f680.Coremail.xuhx@hust.edu.cn>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[snd-hammer-b.sh:url,suse.com:email,perex.cz:email,imap1.dmz-prg2.suse.org:helo,hust.edu.cn:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:email,perex.cz:email,suse.com:email,snd-hammer-b.sh:url,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 25 Nov 2026 13:40:41 +0100,
徐晗翔 wrote:
> 
> card->devices was maintained entirely without locks while three
> paths with pairwise-disjoint lock sets mutate it: the HDA codec
> driver's targeted snd_device_free() of its PCM/JACK nodes, the
> card-side bulk snd_device_disconnect_all()/snd_device_free_all(),
> and the register_all() traversal.  A codec unbind racing the card
> teardown produced double frees and use-after-frees on the list, the
> snd_device and the freed PCM/chmap kcontrol.
> 
> Serialize every list operation with a per-card device_list_lock,
> but never hold it across a device callback: a node is *claimed*
> (unlinked under the lock) while its dev_disconnect/dev_register/
> dev_free callbacks run, so a concurrent targeted free can no longer
> find and double free the same node, and no traversal can touch a
> node being freed.  For the chmap kcontrol form, snd_ctl_remove() now
> verifies the instance is still linked on card->controls before
> touching it, so a stale pointer can no longer be list_del()'d and
> double kfree()d by the PCM teardown racing the CONTROL teardown.

Sorry, but this is way too much for that corner case.  Basically it's
a job of the driver, not calling those functions concurrently.

The HD-audio codec unbind race should be addressed differently,
e.g. the whole procedure there should be serialized.

So, if the problem happens only by HD-audio codec binding/unbinding
thing, let's avoid this kind of workaround in the core side.


thanks,

Takashi


> ---
>  sound/core/control.c | 13 ++++++++++++-
>  sound/core/init.c    |  1 +
>  sound/core/device.c  | 185 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------
>  include/sound/core.h |  1 +
>  4 files changed, 164 insertions(+), 36 deletions(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -620,10 +620,21 @@
>   */
>  int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
>  {
> +	struct snd_kcontrol *ctl;
> +
>  	if (!kcontrol)
>  		return 0;
>  	guard(rwsem_write)(&card->controls_rwsem);
> -	return snd_ctl_remove_locked(card, kcontrol);
> +	/* Paranoia against stale pointers: a caller (e.g. the PCM chmap
> +	 * teardown) may race the card's CONTROL teardown, which has
> +	 * already removed and freed this very kcontrol.  Verify the
> +	 * instance is still linked on the card's control list before
> +	 * touching its contents. */
> +	list_for_each_entry(ctl, &card->controls, list) {
> +		if (ctl == kcontrol)
> +			return snd_ctl_remove_locked(card, kcontrol);
> +	}
> +	return -ENOENT;
>  }
>  EXPORT_SYMBOL(snd_ctl_remove);
>  
> diff --git a/sound/core/init.c b/sound/core/init.c
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -315,6 +315,7 @@
>  	WARN_ON(IS_MODULE(CONFIG_SND) && !module);
>  	card->module = module;
>  	INIT_LIST_HEAD(&card->devices);
> +	spin_lock_init(&card->device_list_lock);
>  	init_rwsem(&card->controls_rwsem);
>  	rwlock_init(&card->controls_rwlock);
>  	INIT_LIST_HEAD(&card->controls);
> diff --git a/sound/core/device.c b/sound/core/device.c
> --- a/sound/core/device.c
> +++ b/sound/core/device.c
> @@ -10,6 +10,82 @@
>  #include <linux/errno.h>
>  #include <sound/core.h>
>  
> +/*
> + * The card device list (card->devices) has independent free paths: the
> + * targeted snd_device_free() calls from driver teardown (e.g. the HDA
> + * codec cleanup) and the card-side bulk snd_device_disconnect_all() /
> + * snd_device_free_all() (plus the register_all() traversal).  They run
> + * under different driver-core locks, i.e. they are real concurrency, and
> + * every list operation here is serialized by card->device_list_lock.
> + *
> + * The device callbacks (dev_disconnect / dev_register / dev_free) may
> + * sleep and may take arbitrary driver locks, so the list lock is never
> + * held across a callback.  Instead a node is *claimed*: it is removed
> + * from the list under the lock and processed with the lock released.
> + * A claimed node is invisible to all the other list operations, hence
> + * a concurrent targeted free cannot find, list_del() or kfree() the same
> + * node again (double free), and a concurrent traversal cannot touch a
> + * node that is being freed (use-after-free).
> + */
> +
> +/* insert dev into the card's device list, keeping the type-sorted order;
> + * the caller must not hold the list lock */
> +static void snd_device_insert(struct snd_card *card, struct snd_device *dev)
> +{
> +	struct list_head *p;
> +
> +	guard(spinlock_irqsave)(&card->device_list_lock);
> +
> +	/* insert the entry in an incrementally sorted list */
> +	list_for_each_prev(p, &card->devices) {
> +		struct snd_device *pdev = list_entry(p, struct snd_device, list);
> +		if ((unsigned int)pdev->type <= (unsigned int)dev->type)
> +			break;
> +	}
> +
> +	list_add(&dev->list, p);
> +}
> +
> +/* claim (unlink) the node for @device_data, or return NULL if it is not
> + * on the list (e.g. concurrently claimed and freed by another path) */
> +static struct snd_device *snd_device_claim(struct snd_card *card,
> +					   void *device_data)
> +{
> +	struct snd_device *dev;
> +
> +	guard(spinlock_irqsave)(&card->device_list_lock);
> +
> +	dev = look_for_dev(card, device_data);
> +	if (dev)
> +		list_del(&dev->list);
> +	return dev;
> +}
> +
> +/* move all devices to @head in reverse list order while holding the list
> + * lock, so the caller can process the claimed nodes without the lock */
> +static void snd_device_claim_all(struct snd_card *card, struct list_head *head)
> +{
> +	struct snd_device *dev, *next;
> +
> +	guard(spinlock_irqsave)(&card->device_list_lock);
> +
> +	list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
> +		list_move_tail(&dev->list, head);
> +}
> +
> +/* put the previously claimed nodes back on the card list in their
> + * original order */
> +static void snd_device_restore_all(struct snd_card *card,
> +				   struct list_head *head)
> +{
> +	struct snd_device *dev, *next;
> +
> +	guard(spinlock_irqsave)(&card->device_list_lock);
> +
> +	list_for_each_entry_safe_reverse(dev, next, head, list)
> +		list_move_tail(&dev->list, &card->devices);
> +}
> +
>  /**
>   * snd_device_new - create an ALSA device component
>   * @card: the card instance
> @@ -30,7 +106,6 @@
>  		   void *device_data, const struct snd_device_ops *ops)
>  {
>  	struct snd_device *dev;
> -	struct list_head *p;
>  
>  	if (snd_BUG_ON(!card || !device_data || !ops))
>  		return -ENXIO;
> @@ -44,14 +119,7 @@
>  	dev->device_data = device_data;
>  	dev->ops = ops;
>  
> -	/* insert the entry in an incrementally sorted list */
> -	list_for_each_prev(p, &card->devices) {
> -		struct snd_device *pdev = list_entry(p, struct snd_device, list);
> -		if ((unsigned int)pdev->type <= (unsigned int)type)
> -			break;
> -	}
> -
> -	list_add(&dev->list, p);
> +	snd_device_insert(card, dev);
>  	return 0;
>  }
>  EXPORT_SYMBOL(snd_device_new);
> @@ -66,11 +134,9 @@
>  	}
>  }
>  
> +/* run the free callbacks of an already claimed node */
>  static void __snd_device_free(struct snd_device *dev)
>  {
> -	/* unlink */
> -	list_del(&dev->list);
> -
>  	__snd_device_disconnect(dev);
>  	if (dev->ops->dev_free) {
>  		if (dev->ops->dev_free(dev))
> @@ -83,6 +149,8 @@
>  {
>  	struct snd_device *dev;
>  
> +	lockdep_assert_held(&card->device_list_lock);
> +
>  	list_for_each_entry(dev, &card->devices, list)
>  		if (dev->device_data == device_data)
>  			return dev;
> @@ -109,12 +177,15 @@
>  
>  	if (snd_BUG_ON(!card || !device_data))
>  		return;
> -	dev = look_for_dev(card, device_data);
> -	if (dev)
> -		__snd_device_disconnect(dev);
> -	else
> +	dev = snd_device_claim(card, device_data);
> +	if (!dev) {
>  		dev_dbg(card->dev, "device disconnect %p (from %pS), not found\n",
>  			device_data, __builtin_return_address(0));
> +		return;
> +	}
> +
> +	__snd_device_disconnect(dev);
> +	snd_device_insert(card, dev);
>  }
>  EXPORT_SYMBOL_GPL(snd_device_disconnect);
>  
> @@ -130,15 +201,19 @@
>  void snd_device_free(struct snd_card *card, void *device_data)
>  {
>  	struct snd_device *dev;
> -	
> +
>  	if (snd_BUG_ON(!card || !device_data))
>  		return;
> -	dev = look_for_dev(card, device_data);
> -	if (dev)
> +	/* claim the node off the list before running its callbacks: a
> +	 * concurrent targeted free or the card bulk free can no longer
> +	 * find (and double free) the same node */
> +	dev = snd_device_claim(card, device_data);
> +	if (dev) {
>  		__snd_device_free(dev);
> -	else
> -		dev_dbg(card->dev, "device free %p (from %pS), not found\n",
> -			device_data, __builtin_return_address(0));
> +		return;
> +	}
> +	dev_dbg(card->dev, "device free %p (from %pS), not found\n",
> +		device_data, __builtin_return_address(0));
>  }
>  EXPORT_SYMBOL(snd_device_free);
>  
> @@ -171,14 +246,19 @@
>  int snd_device_register(struct snd_card *card, void *device_data)
>  {
>  	struct snd_device *dev;
> +	int err;
>  
>  	if (snd_BUG_ON(!card || !device_data))
>  		return -ENXIO;
> -	dev = look_for_dev(card, device_data);
> -	if (dev)
> -		return __snd_device_register(dev);
> -	snd_BUG();
> -	return -ENXIO;
> +	dev = snd_device_claim(card, device_data);
> +	if (!dev) {
> +		snd_BUG();
> +		return -ENXIO;
> +	}
> +
> +	err = __snd_device_register(dev);
> +	snd_device_insert(card, dev);
> +	return err;
>  }
>  EXPORT_SYMBOL(snd_device_register);
>  
> @@ -190,11 +270,26 @@
>  {
>  	struct snd_device *dev;
>  	int err;
> -	
> +
>  	if (snd_BUG_ON(!card))
>  		return -ENXIO;
> -	list_for_each_entry(dev, &card->devices, list) {
> +
> +	/* register one device at a time: claim it off the list while its
> +	 * dev_register callback runs.  A dev_register callback may itself
> +	 * register another (not yet processed) device, so the nodes stay
> +	 * visible on the list between the callbacks. */
> +	for (;;) {
> +		scoped_guard(spinlock_irqsave, &card->device_list_lock) {
> +			dev = list_first_entry_or_null(&card->devices,
> +						       struct snd_device, list);
> +			if (dev)
> +				list_del(&dev->list);
> +		}
> +		if (!dev)
> +			break;
> +
>  		err = __snd_device_register(dev);
> +		snd_device_insert(card, dev);
>  		if (err < 0)
>  			return err;
>  	}
> @@ -207,12 +302,23 @@
>   */
>  void snd_device_disconnect_all(struct snd_card *card)
>  {
> -	struct snd_device *dev;
> +	LIST_HEAD(claimed);
> +	struct snd_device *dev, *next;
>  
>  	if (snd_BUG_ON(!card))
>  		return;
> -	list_for_each_entry_reverse(dev, &card->devices, list)
> +
> +	/* claim every node, then run the disconnect callbacks with the
> +	 * list lock released; a claimed node is invisible to concurrent
> +	 * targeted disconnect/free calls, so no callback races a free of
> +	 * its own device */
> +	snd_device_claim_all(card, &claimed);
> +	list_for_each_entry_safe(dev, next, &claimed, list)
>  		__snd_device_disconnect(dev);
> +
> +	/* put the disconnected devices back in their original order; the
> +	 * card free path walks the list again */
> +	snd_device_restore_all(card, &claimed);
>  }
>  
>  /*
> @@ -221,19 +327,28 @@
>   */
>  void snd_device_free_all(struct snd_card *card)
>  {
> +	LIST_HEAD(claimed);
>  	struct snd_device *dev, *next;
>  
>  	if (snd_BUG_ON(!card))
>  		return;
> -	list_for_each_entry_safe_reverse(dev, next, &card->devices, list) {
> -		/* exception: free ctl and lowlevel stuff later */
> +
> +	/* first pass: free everything but ctl and lowlevel stuff later;
> +	 * the claimed list is in reverse card-list order, i.e. the original
> +	 * free order */
> +	snd_device_claim_all(card, &claimed);
> +	list_for_each_entry_safe(dev, next, &claimed, list) {
>  		if (dev->type == SNDRV_DEV_CONTROL ||
>  		    dev->type == SNDRV_DEV_LOWLEVEL)
>  			continue;
> +		list_del(&dev->list);
>  		__snd_device_free(dev);
>  	}
>  
> -	/* free all */
> -	list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
> +	/* free all; the claimed nodes are off the card list, so a
> +	 * concurrent targeted free cannot find them again */
> +	list_for_each_entry_safe(dev, next, &claimed, list) {
> +		list_del(&dev->list);
>  		__snd_device_free(dev);
> +	}
>  }
> diff --git a/include/sound/core.h b/include/sound/core.h
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -116,6 +116,7 @@
>  	void (*private_free) (struct snd_card *card); /* callback for freeing of
>  								private data */
>  	struct list_head devices;	/* devices */
> +	spinlock_t device_list_lock;	/* protects the devices list */
>  
>  	struct device *ctl_dev;		/* control device */
>  	unsigned int last_numid;	/* last used numeric ID */
> -- 
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-10-30 12:43:23 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: sound: core: card->devices is unlocked across the codec-side  targeted free and the card-side bulk free (double free / UAF; KASAN  confirmed on 7.3)
> > 
> > The per-card device list (card->devices) has two independent free
> > paths that share no lock: the HDA codec driver's targeted release
> > (unbinding the codec driver walks snd_hda_codec_cleanup_for_unbind()
> > and frees the codec's PCM/JACK snd_device nodes) and the card-level
> > bulk release (snd_card_free() -> snd_device_free_all(), entered from
> > PCI remove or, when files were open, from the last file close).
> > sound/core/device.c maintains that list -- lookup, traversal, unlink,
> > free -- entirely without locks; the two paths run under different
> > driver-core locks (codec_dev->mutex vs pci_dev->mutex vs none), so
> > the interleavings are real concurrency.  I reproduced it on a vanilla
> > Linux 7.3 KASAN kernel with an emulated Intel HDA controller using
> > only root sysfs writes: the first concurrent round already produced
> > slab-use-after-free reports, and a sustained hammer accumulated
> > ~1900 KASAN reports, including a three-stack closure on the JACK
> > objects (allocated by the codec probe, freed by the codec-side
> > targeted cleanup, written by the card-side bulk free).
> > 
> > Where the locks are, and where they are not: the PCM disconnect
> > callbacks do take the global register_mutex, so the *disconnect*
> > stages of both paths are serialized -- the gap is the *free* stage
> > and the list itself (__snd_device_free(), look_for_dev(),
> > snd_device_free_all() in sound/core/device.c are all unlocked).  A
> > fourth, wider form extends to card->controls: when the codec-side PCM
> > free reaches free_chmap() -> snd_ctl_remove() for the PCM's channel
> > map kcontrol, the card-side CONTROL teardown
> > (snd_ctl_dev_free()) may already have deleted and freed that same
> > kcontrol -- controls_rwsem serializes the list operations but cannot
> > protect the dangling chmap_kctl pointer, so snd_ctl_remove()
> > performs a UAF write (list_del) and a double free.  This form does
> > not depend on winning the narrow instruction-level windows of the
> > list races: its window is the whole second half of the targeted
> > snd_pcm_free() versus the card-side CONTROL-round completion, i.e.
> > tens of microseconds, and I expect it to be the first form hit under
> > sustained pressure on real hardware.
> > 
> > The detailed description:
> > 
> > * The two unlocked paths (Linux 7.3 line numbers)
> > 
> >   T1 (codec side): /sys/bus/hdaudio/drivers/<codec-drv>/unbind ->
> >     device_release_driver(codec_dev) [codec_dev->mutex] ->
> >     hda_codec_driver_remove() (sound/hda/common/bind.c:152-174) ->
> >     snd_hda_codec_cleanup_for_unbind() (codec.c:758-791) ->
> >     codec_release_pcms() -> snd_device_free(card, pcm)
> >     (codec.c:747); along the way snd_hda_jack_tbl_clear() ->
> >     snd_device_free(card, jack->jack) (jack.c:188).
> >   T2 (card side, no open files): PCI unbind/remove ->
> >     device_release_driver(pci_dev) [pci_dev->mutex] -> azx_remove()
> >     -> snd_card_free() -> snd_card_disconnect() ->
> >     snd_device_disconnect_all(); same-thread put_device ->
> >     snd_card_do_free() -> snd_device_free_all().
> >   T3 (card side, files were open): the last close's
> >     snd_card_file_remove() -> put_device() runs snd_card_do_free()
> >     -> snd_device_free_all() in the closing task.
> >   All snd_device list operations in sound/core/device.c (82-91
> >   look_for_dev; 69-80 __snd_device_free's list_del; 208-216
> >   disconnect_all; 222-239 free_all) are unlocked; T1/T2/T3's lock
> >   sets are pairwise disjoint.  The best window is the "same close
> >   event, dual wakeup": with a PCM stream open, T1 blocks in
> >   snd_refcount_sync(&codec->pcm_ref) and T2 blocks in
> >   wait_for_completion(&released); the stream's close wakes T1
> >   (snd_hda_codec_pcm_put) and simultaneously makes the closer itself
> >   run the card bulk free -- one event releases two unlocked paths.
> > 
> > * Failure forms
> >   1. free vs traversal: T1's look_for_dev() picks a node, T2/T3
> >      frees it, T1's list_del/dev_free/kfree hit freed memory (UAF
> >      write + indirect call); the reverse tears T2/T3's
> >      list_for_each_entry_safe traversal.
> >   2. free vs free: both obtain the node before either unlinks --
> >      two snd_pcm_free() executions, double kfree of the snd_device,
> >      the snd_pcm and the azx_pcm private data, plus a double
> >      put_device on the stream devices (kref underflow).
> >   3. chmap vs CONTROL teardown (the wide one, see above):
> >      snd_pcm_free() -> snd_pcm_free_stream() -> free_chmap()
> >      (pcm.c:802-810,836) -> snd_ctl_remove(card, chmap_kctl) races
> >      snd_ctl_dev_free() (control.c:2457-2477): the rwsem orders the
> >      list ops but T1's chmap_kctl is a bare pointer; if T2 freed the
> >      kcontrol first, T1's __snd_ctl_remove() does remove_hash_entries
> >      (UAF read/write) + list_del (UAF write) and snd_ctl_free_one
> >      runs private_free + kfree again (double free).
> > 
> > * Evidence (vanilla 7.3 KASAN + CONFIG_SND_HDA_RECONFIG/GENERIC,
> >   QEMU intel-hda + hda-duplex; reproducer attached)
> >   Hammer (attached snd-hammer-b.sh): T1 codec-driver unbind/bind
> >   loop x T2 PCI unbind/bind rounds x T3 PCM open/close churn -- pure
> >   root sysfs writes, no kernel modification.
> >   - First concurrent round: 4 slab-use-after-free reports; sustained
> >     run: ~1900 reports.  Dominant forms:
> >       * hda_free_jack_priv+0x23/+0x31 slab-use-after-free (write),
> >         three stacks closed:
> >           use: snd_device_free_all -> snd_jack_dev_free ->
> >                hda_free_jack_priv  (card-side bulk free)
> >           free: snd_hda_codec_cleanup_for_unbind -> snd_array_free
> >                (codec-side targeted cleanup of the jack table)
> >           alloc: hda_codec_driver_probe -> snd_hda_gen_build_controls
> >                -> snd_hda_jack_tbl_new -> snd_array_new (codec probe)
> >         -- i.e. the audited two-path interleaving, materialized on
> >         the JACK objects (jack->jack is a snd_device on the same
> >         card->devices list).
> >       * snd_pcm_open slab-use-after-free + snd_card_file_add
> >         out-of-bounds/NULL (opens racing the teardown).
> >       * snd_device_register_all wild-memory-access reading list
> >         poison (dead000000000118): the delayed probe work's
> >         snd_card_register traversal racing the concurrent teardown --
> >         the register_all side of the same unlocked list.
> >       * ~1890 reports of queued_spin_lock_slowpath
> >         slab-out-of-bounds: spinning on locks embedded in freed
> >         memory (the card/files lock family) -- the freed-lock spin
> >         family that also explains the hang shape in my separate
> >         reconfig report.
> >   - Baseline (sequential reconfig, sequential PCI unbind/bind, 40
> >     churn rounds without concurrency): zero splats.
> > 
> >   Honest scope note: the natural hammer hit the widest-window forms
> >   first (JACK UAF, freed-lock spins); the PCM/chmap-specific forms
> >   1/2/3 above were source-verified and are the same unlocked-list
> >   root cause, but were not individually isolated in this run.
> > 
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
> > 
> > 
