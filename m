Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611884;
	b=viTk1l8mItmPnt9KseW0QPbXnSayxApCRg3PMb3mJ7iVuiI3eAgKzeDawPjoEJP7Wosg
	 JikYAXPC1iQlALPC0tdq+Ztf6L09+mRiW8eYXwxL2hMAS1nv4DPyUI60B564jyxllQaYO
	 HS5rC/DjmhXV9D2YbtBbiJUzanepU6VCManfMDnONyBLXx0aCdMRRUK/gE6WlcZ4Ph8md
	 yN4+sPEaeGxKEqjyisxy+tfQq8d5FAbwVQ8nLvBTwNc70lnSYf+ouGOk0mCCmsvb+Rj0I
	 faYNrxRKHP3Yqas7vUzd66YnMwu/YS3LrDu+Qsrrjhwal5ByJNznXEFWY6iXLkgoygQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611884;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=oS70hS4IrBc7+UsXsifB/HpZesCoRdFAy5bWpOigZOs=;
	b=3dRz/30jpRqX9dzJz2swYuVRwpGlvEhT0ptZwhSRg65UiSCD5Z3aRQpE1eKOcKb/kaoc
	 WWkpCIjvzRfU/+JigEWzcBViFeKoixLpRT1Q0yv4/Z2URgvDFbc/aywLi9bS0aJgyfFPE
	 19ZVbe84b3bczNmxNtzUMmsT0fXWgxfIud1XsqyvJKD3RAGMfw6mG2Q73wQACBEmlsvy9
	 B/GQuYod2apBAXoTJva+9hUg43Z7TsnXPDfsd+8TAn0F4YcWy0aSujutXPKO74BhUqlYq
	 PFwgQ2/S5OWAwjKjx8P16V95t3klOgFZoRDYKC8G9ox3Q/3FJpXQpiiixB07FLZr13w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mFTYqKde;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IGf6JCrc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SzE4V396;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uBLXSmZq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80621606A31E;
	Wed, 25 Nov 2026 13:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80621606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mFTYqKde;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IGf6JCrc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SzE4V396;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uBLXSmZq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 564391F7E1;
	Wed, 25 Nov 2026 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795611881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oS70hS4IrBc7+UsXsifB/HpZesCoRdFAy5bWpOigZOs=;
	b=mFTYqKdeFKjsNbTX+CdMxe04je7kOFPjChpuxLXcYIVZiDbaPCeOV00g/XipYhLCuubVyT
	xC0uT3yngJdesZ6Uhp8iiLRDQzdXY7J66httEw0we6QOVPLy67nWbwxyRFGexuboRE9uRo
	RPgbWGqxh4uvlhu4dAZ9neTlyncXnMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795611881;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oS70hS4IrBc7+UsXsifB/HpZesCoRdFAy5bWpOigZOs=;
	b=IGf6JCrcv2ags3n1zx150FIl5sz+ps84MVbYOLsPkjA28nzR7sqj4g7iRxjfUhJlqbpECs
	Ks7dfkMm3LPb2RBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SzE4V396;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uBLXSmZq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795611880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oS70hS4IrBc7+UsXsifB/HpZesCoRdFAy5bWpOigZOs=;
	b=SzE4V3964XPAVX28dJVI0TsvhBGg/nzvWLy11Rcb9Ig0wEA1iswuzBRChBXbJSORNgDwvH
	DrqKUjSpj5Otzi/9EKLpDBtrzRd+Q4am7M1GdRck4/+V+7DA6350IW1G5msgw+BzsKvAxq
	8MBtg+DoiyPqSxS7FK7DX7R3qjv4cbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795611880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oS70hS4IrBc7+UsXsifB/HpZesCoRdFAy5bWpOigZOs=;
	b=uBLXSmZqvviuPY8WpOsC+qs+0Hdl8z6YKhrmfm9sy6wEbTALi7XXnBZ1v7BFN4lc5rZ7ar
	Woh4cyQWZ9bDEBDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A6F4134CA;
	Wed, 25 Nov 2026 13:04:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wrDHM+fcBmsKDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:04:40 +0000
Date: Wed, 25 Nov 2026 14:04:39 +0100
Message-ID: <874id583ko.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: sound: hda: reconfig reuses card->shutdown as a soft lock, so  a concurrent controller remove skips the card disconnect (persistent  dangling card / concurrent UAF; reproducible system freeze)
In-Reply-To: <22a41dd8.559.1a212b9d1e4.Coremail.xuhx@hust.edu.cn>
References: <5212a5fb.1b564.1a18b1dcad1.Coremail.xuhx@hust.edu.cn>
	<22a41dd8.559.1a212b9d1e4.Coremail.xuhx@hust.edu.cn>
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
X-Rspamd-Queue-Id: 564391F7E1
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-10.98 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	LONG_SUBJ(1.53)[204];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:email,snd-hammer-c.sh:url,suse.de:dkim,perex.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email];
	URIBL_BLOCKED(0.00)[suse.de:dkim,hust.edu.cn:email,snd-hammer-c.sh:url,perex.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -10.98

On Wed, 25 Nov 2026 13:41:37 +0100,
徐晗翔 wrote:
> 
> snd_hda_lock_devices() set card->shutdown = 1 as a temporary soft
> lock for the reconfig critical section, but snd_card_disconnect()
> interprets the same flag as 'disconnect already done' and returned
> immediately.  A controller removal landing inside the freeze window
> skipped the entire disconnect sequence (snd_cards[] left dangling,
> card_dev never device_del'ed, card number leaked) while the card
> memory was then kfree()d -- a persistent UAF surface reachable by
> unprivileged readers.
> 
> Mark the freeze with a dedicated card->freezing flag (cleared with a
> wake on the same files_lock), let snd_card_disconnect() wait for an
> in-progress freeze instead of skipping the disconnect, and make the
> disconnect idempotent via a card->disconnected marker.
> reconfig_codec() now takes a card lifetime reference
> (get_device(&card->card_dev)) while the freeze still guarantees the
> card is alive, and re-validates card->disconnected/shutdown before
> snd_card_register().

I think we need indeed some more safer way for HD-audio codec unbind,
and this kind of flag might be the first step.  But it may need a bit
more work, e.g. to serialize the whole unbind procedure against
others, so I'd rather postpone this until we get a more bigger picture
to address various HD-audio codec unbind issues.


thanks,

Takashi


> ---
>  sound/core/init.c        | 13 ++++++++++++-
>  include/sound/core.h     |  4 ++++
>  sound/hda/common/sysfs.c | 38 +++++++++++++++++++++++++++++++++-----
>  sound/hda/common/codec.c | 10 ++++++++++
>  4 files changed, 59 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -325,6 +325,7 @@
>  #endif
>  	spin_lock_init(&card->files_lock);
>  	INIT_LIST_HEAD(&card->files_list);
> +	init_waitqueue_head(&card->freeze_sleep);
>  	mutex_init(&card->memory_mutex);
>  #ifdef CONFIG_PM
>  	init_waitqueue_head(&card->power_sleep);
> @@ -499,9 +500,19 @@
>  	if (!card)
>  		return;
>  
> +	/* A card freeze (the HDA reconfig soft lock) temporarily sets
> +	 * card->shutdown, too, but a disconnect must not be skipped for
> +	 * it: wait for the freeze to complete, then run the full sequence
> +	 * below exactly once.  Skipping it left snd_cards[] dangling, the
> +	 * card device undeleted and the card number leaked while the card
> +	 * memory was freed. */
> +	if (READ_ONCE(card->freezing))
> +		wait_event(card->freeze_sleep, !READ_ONCE(card->freezing));
> +
>  	scoped_guard(spinlock, &card->files_lock) {
> -		if (card->shutdown)
> +		if (card->disconnected)
>  			return;
> +		card->disconnected = true;
>  		card->shutdown = 1;
>  
>  		/* replace file->f_op with special dummy operations */
> diff --git a/include/sound/core.h b/include/sound/core.h
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -139,6 +139,10 @@
>  								state */
>  	spinlock_t files_lock;		/* lock the files for this card */
>  	int shutdown;			/* this card is going down */
> +	bool disconnected;		/* snd_card_disconnect() was done */
> +	bool freezing;			/* freeze in progress (e.g. HDA reconfig
> +					 * soft lock); disconnect waits for it */
> +	wait_queue_head_t freeze_sleep;
>  	struct completion *release_completion;
>  	struct device *dev;		/* device assigned to this card */
>  	struct device card_dev;		/* cardX object for sysfs */
> diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
> --- a/sound/hda/common/sysfs.c
> +++ b/sound/hda/common/sysfs.c
> @@ -127,20 +127,48 @@
>  
>  static int reconfig_codec(struct hda_codec *codec)
>  {
> +	struct snd_card *card = codec->card;
>  	int err;
>  
>  	CLASS(snd_hda_power, pm)(codec);
>  	codec_info(codec, "hda-codec: reconfiguring\n");
> -	err = snd_hda_codec_reset(codec);
> -	if (err < 0) {
> +
> +	/* open-code snd_hda_codec_reset() to take a card lifetime
> +	 * reference before the freeze is lifted: a concurrent controller
> +	 * removal waits for the freeze in snd_card_disconnect() and tears
> +	 * the card down once it is cleared, so the pin has to be grabbed
> +	 * while the freeze still guarantees that the card stays alive */
> +	if (snd_hda_lock_devices(codec->bus) < 0) {
>  		codec_err(codec,
>  			   "The codec is being used, can't reconfigure.\n");
> -		return err;
> +		return -EBUSY;
>  	}
> +
> +	/* OK, let it free */
> +	device_release_driver(hda_codec_dev(codec));
> +
> +	get_device(&card->card_dev);
> +
> +	/* allow device access again */
> +	snd_hda_unlock_devices(codec->bus);
> +
>  	err = device_reprobe(hda_codec_dev(codec));
>  	if (err < 0)
> -		return err;
> -	return snd_card_register(codec->card);
> +		goto out_put;
> +
> +	/* the card may have been torn down in the meantime; don't
> +	 * re-register it (card memory is still valid through the
> +	 * reference taken above) */
> +	if (card->disconnected || card->shutdown) {
> +		err = -ENODEV;
> +		goto out_put;
> +	}
> +
> +	err = snd_card_register(card);
> +
> + out_put:
> +	put_device(&card->card_dev);
> +	return err;
>  }
>  
>  /*
> diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
> --- a/sound/hda/common/codec.c
> +++ b/sound/hda/common/codec.c
> @@ -1742,6 +1742,11 @@
>   * @bus: the BUS
>   *
>   * toggle card->shutdown to allow/disallow the device access (as a hack)
> + *
> + * The freeze is additionally marked with card->freezing so that a
> + * concurrent snd_card_disconnect() (controller removal) can tell the
> + * temporary freeze from a real disconnect and wait for it instead of
> + * skipping its whole disconnect sequence.
>   */
>  int snd_hda_lock_devices(struct hda_bus *bus)
>  {
> @@ -1752,6 +1757,7 @@
>  	if (card->shutdown)
>  		return -EINVAL;
>  	card->shutdown = 1;
> +	card->freezing = true;
>  	if (!list_empty(&card->ctl_files))
>  		goto err_clear;
>  
> @@ -1769,6 +1775,8 @@
>  
>   err_clear:
>  	card->shutdown = 0;
> +	card->freezing = false;
> +	wake_up(&card->freeze_sleep);
>  	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(snd_hda_lock_devices);
> @@ -1783,6 +1791,8 @@
>  
>  	guard(spinlock)(&card->files_lock);
>  	card->shutdown = 0;
> +	card->freezing = false;
> +	wake_up(&card->freeze_sleep);
>  }
>  EXPORT_SYMBOL_GPL(snd_hda_unlock_devices);
>  
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-10-30 12:42:27 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: sound: hda: reconfig reuses card->shutdown as a soft lock, so  a concurrent controller remove skips the card disconnect (persistent  dangling card / concurrent UAF; reproducible system freeze)
> > 
> > The HDA reconfig path (writing /sys/class/sound/hwCxDy/reconfig,
> > CONFIG_SND_HDA_RECONFIG) has no dedicated lock for its critical
> > section (codec driver release + reprobe): it temporarily sets
> > card->shutdown = 1 as a "soft lock" (snd_hda_lock_devices(),
> > sound/hda/common/codec.c:1746-1779) and clears it afterwards.  But
> > snd_card_disconnect() interprets card->shutdown == 1 as "disconnect
> > already done" and returns immediately (sound/core/init.c:502-505) --
> > the same flag carrying two meanings.  If the controller is removed
> > (PCI unbind/remove) while a reconfig is inside its soft-lock window,
> > the card teardown skips its entire disconnect sequence: snd_cards[]
> > is never cleared, the card device is never device_del'ed, the card
> > number bitmap bit leaks -- and the card memory is then kfree()d with
> > those references still dangling, a persistent use-after-free surface
> > that later ordinary, unprivileged accesses hit (reading
> > /proc/asound/cards, snd_card_ref() from control/LED paths, sysfs
> > id_store which copies attacker-controlled bytes into the freed card).
> > 
> > I reproduced a system-level consequence on a vanilla Linux 7.3 KASAN
> > kernel with an emulated Intel HDA controller, using only root sysfs
> > writes: the reconfig x PCI-unbind hammer froze the whole guest solid
> > (two independent runs, ~33 s and ~39 s in, serial console silent, no
> > hung-task or panic output until the host killed the VM), while two
> > control hammers without the reconfig path -- including a much harder
> > codec/PCI/PCM churn that produced ~1900 KASAN splats -- never froze.
> > The freeze shape matches a permanent spin on a lock embedded in freed
> > memory (the same freed-lock family that dominates the churn run's
> > reports); I did not kprobe-pin the exact spin point, so I report the
> > deadlock/reproducible-DoS part as confirmed and the precise UAF
> > localization as source-verified.
> > 
> > The detailed description:
> > 
> > * The semantic conflict (Linux 7.3)
> >   snd_hda_lock_devices() (codec.c:1746-1779), under
> >   card->files_lock momentarily: if (!card->shutdown)
> >   card->shutdown = 1; ... return 0;  -- and the flag stays set for
> >   the whole reconfig critical section (device_release_driver(codec),
> >   milliseconds) AFTER the spinlock is released.
> >   snd_card_disconnect() (init.c:495-561):
> >       scoped_guard(spinlock, &card->files_lock) {
> >               if (card->shutdown)
> >                       return;         /* skips EVERYTHING below */
> >               card->shutdown = 1;
> >               ... replace fops ...
> >       }
> >       ... snd_device_disconnect_all(); device_del(&card->card_dev);
> >       ... snd_cards[card->number] = NULL; clear_bit(...);
> >   Both check-and-set pairs are atomic (same files_lock), so there is
> >   no torn state -- the problem is purely that T2 cannot distinguish
> >   "already disconnected" (should proceed with teardown) from
> >   "reconfig freeze in progress" (must not proceed), and the early
> >   return means the teardown continues with the disconnect steps
> >   skipped.
> > 
> > * Interleaving I (T2's snd_card_disconnect lands inside the reconfig
> >   soft-lock window) -- the main damage
> >   T1 (reconfig): lock_devices (shutdown=1) ->
> >   device_release_driver(codec) [codec_dev->mutex held] ...
> >   T2 (PCI remove): azx_remove -> snd_card_free -> snd_card_disconnect
> >   sees shutdown==1 -> returns (skips fops replacement,
> >   snd_device_disconnect_all, card_dev device_del, snd_cards[]
> >   clearing) -> put_device -> snd_card_do_free ->
> >   snd_device_free_all: frees PCM etc., then the CODEC node ->
> >   snd_hda_codec_unregister -> device_del(codec_dev) blocks on
> >   codec_dev->mutex ...  T1 releases the codec mutex,
> >   unlock_devices (shutdown=0; card not yet kfreed -- T2 is blocked
> >   in the CODEC round), device_reprobe(codec) and
> >   snd_card_register(card) run against the card that T2 is tearing
> >   down ...  T2 proceeds, azx_free, kfree(card), returns.
> >   Net result regardless of the second-order ordering: snd_cards[idx]
> >   still points at the kfree()d card; card_dev was never
> >   device_del'ed (still on the sound class / sysfs); the
> >   snd_cards_lock bit leaked.  Persistent, no further race needed:
> >     - snd_card_ref() (init.c:389-399) does get_device() on the
> >       dangling card_dev (kref write on freed memory); reachable from
> >       module autoload on open (sound.c:127), the control LED code
> >       (control_led.c:250,310,604,768), control.c:2358;
> >     - /proc/asound/cards (init.c:943-965) prints id/shortname/
> >       longname from the freed card (UAF read / info leak);
> >     - /sys/class/sound/cardN/id store (init.c:788-828) strscpy's
> >       attacker-controlled bytes into the freed card's memory.
> >   (New /dev/snd opens stay blocked: the compensating disconnect in
> >   do_free unregisters the minors -- pcm.c:1118-1120,
> >   control.c:2438-2451.)
> >   Second-order branches: if the reprobe wins the codec lock before
> >   T2 kills the device, hda_codec_driver_probe() re-inserts PCM
> >   snd_device nodes into card->devices and snd_card_register()
> >   re-traverses it -- unlocked list operations against T2's
> >   concurrent free_all (same unlocked card->devices family as my
> >   separate snd_device report); if T2 wins, snd_card_register()
> >   still runs on the possibly-already-freed card (UAF read +
> >   traversal).
> > 
> > * Interleaving II (T2's disconnect arrives after T1's unlock but
> >   before reconfig finishes): the disconnect runs fully, and the
> >   reconfig tail (snd_pcm_new/snd_device_new insertion,
> >   snd_device_register_all traversal, snd_card_register) races the
> >   card teardown and kfree -- a large window (the whole first
> >   free_all round), no soft-lock timing needed.  Interleaving III
> >   (disconnect already done before reconfig locks): reconfig
> >   correctly fails with -EINVAL.  Safe.
> > 
> > * Evidence (vanilla 7.3 KASAN + CONFIG_SND_HDA_RECONFIG=y,
> >   QEMU intel-hda + hda-duplex; reproducer attached)
> >   Hammer (attached snd-hammer-c.sh): T1 reconfig write loop x T2
> >   PCI unbind/bind rounds with a live window -- pure root sysfs
> >   writes.
> > 
> >   - Two independent runs: after 6 and 12 real reconfig executions
> >     respectively, the guest froze completely at ~33.5 s and ~38.9 s
> >     (serial console dead silence, no hung-task warning, no panic,
> >     unresponsive until the host timeout killed the VM at 500 s).
> >   - Control 1 (same PCI churn, no reconfig, 40 rounds): clean
> >     completion, zero splats, dangling=0.
> >   - Control 2 (a much harder churn -- codec unbind + PCI unbind +
> >     PCM open/close, no reconfig): ~1900 KASAN splats but the system
> >     never froze in 500 s.  The only differing variable in the
> >     freeze runs is the reconfig path (snd_hda_codec_reset's
> >     lock/unlock_devices soft lock + device_reprobe +
> >     snd_card_register).
> >   - The no-output freeze (not even the hung-task detector) is
> >     consistent with permanent spinning on a lock inside freed
> >     memory -- the churn run's ~1890 queued_spin_lock_slowpath
> >     slab-out-of-bounds reports are the same family caught mid-spin
> >     by KASAN; both lock_devices() and snd_card_disconnect() take
> >     card->files_lock.  I did not kprobe-pin the exact spin point in
> >     the frozen state, hence: reproducible DoS = confirmed; exact
> >     UAF locus = source analysis (interleavings above) with the
> >     freeze as its observable.
> > 
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
> > 
> > 
