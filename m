Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617201;
	b=I5tKYp1X9eFK45miND3c2/oEG3HCIEHQ99+X83kea0vjMUU9N/c+8D6Ah/cR0xKkjgKU
	 l0ZUOrVKjg95aoGmfmk8e7PmDbxQoD9iiq1d+AZDiXKR8mo5zJZAyRkNiiJQ6WVktfR48
	 LNwS5E/0PIWJbSkECX8/VL2Zj36SVZE9edBZyEiq0aTHvUqqJG2BM+e9vwrFX88mE+NoI
	 IFqySwXL2swwiHNWBX88sOXO34PIoZzb8k++VO8UshrzWimOdF3Qx5XtigRbOULtwoJkq
	 hSYOLm9MUYqee4jIekjip7hRMofbhTqAKM0pd3qT0UdwPt/hGcCbBi+imAhzxeEDQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617201;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=W+IUtozka0KiWbwLJYpD5xCPalmmWgeFTyRoezSln68=;
	b=mTyK2J21md+/hvd63/2nJDLW7wGR4KXC40m+FzDPPtdPzNLFkaxjrG4H5I6oxT/nVCTC
	 wq7dn3v2HRa7vyCg982u5m30KBm3JCaTh0amteFz/8z2aFAz3z/r/yn8+KWWkNBjHK4L1
	 k0DqKGo3XNI4tuhfe4vtONxTA0Q/kf3+1fIfmLp6FGv9utOkttygGiwLrG1/Iu2vO+GIK
	 4vnSKxkclt7IeR3QY6GM6SgrnYzJwa2capi2CV/qQ5bdpAkK4kYNEpb3NCsO6BoX7T3UK
	 FsKByx1JzhrCTNt8O5ydw1gAOqxfMkzZK3yDnRZRb6adMrTblG8awOr23pUYc0wQTfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l17VZmMJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Ow/hX/gc";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l17VZmMJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Ow/hX/gc";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF65606A31E;
	Wed, 25 Nov 2026 14:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l17VZmMJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ow/hX/gc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l17VZmMJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ow/hX/gc
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E6081F7FE;
	Wed, 25 Nov 2026 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+IUtozka0KiWbwLJYpD5xCPalmmWgeFTyRoezSln68=;
	b=l17VZmMJCLV/eeOrmZTDstU/7+a5VW+MBNJPfkuv9mGX0kxzHRR0X7Z1scneyCiKOovPbJ
	Flv9ouurH/NknEG9jcAX0+PpA5BCyvdiHg4pwAipTHCzZs8+cVGCzGQvZoBAMaIkI8/v9P
	w7kHDuok5XDK2wqCm0o5giLHMNHW31E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+IUtozka0KiWbwLJYpD5xCPalmmWgeFTyRoezSln68=;
	b=Ow/hX/gcW1gH+NUCPs9M7hAepGmyocETJJZMds/EdvGG2zl7vPhRVx+gPr9pLYSks6CNaQ
	x1AhMgsVJO5Q3kDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+IUtozka0KiWbwLJYpD5xCPalmmWgeFTyRoezSln68=;
	b=l17VZmMJCLV/eeOrmZTDstU/7+a5VW+MBNJPfkuv9mGX0kxzHRR0X7Z1scneyCiKOovPbJ
	Flv9ouurH/NknEG9jcAX0+PpA5BCyvdiHg4pwAipTHCzZs8+cVGCzGQvZoBAMaIkI8/v9P
	w7kHDuok5XDK2wqCm0o5giLHMNHW31E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+IUtozka0KiWbwLJYpD5xCPalmmWgeFTyRoezSln68=;
	b=Ow/hX/gcW1gH+NUCPs9M7hAepGmyocETJJZMds/EdvGG2zl7vPhRVx+gPr9pLYSks6CNaQ
	x1AhMgsVJO5Q3kDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB9ED134CA;
	Wed, 25 Nov 2026 14:33:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o6xGLq7xBmvKaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:33:18 +0000
Date: Wed, 25 Nov 2026 15:33:18 +0100
Message-ID: <87h5h56kwh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: Re: ALSA: ctxfi: free atimer only after the timer IRQ is quiesced
In-Reply-To: <48749068.582.1a212c2b537.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<57529fbf.262c8.1a1d4c65987.Coremail.xuhx@hust.edu.cn>
	<87ik20publ.wl-tiwai@suse.de>
	<48749068.582.1a212c2b537.Coremail.xuhx@hust.edu.cn>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,perex.cz:email,suse.com:email,hust.edu.cn:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 25 Nov 2026 13:51:19 +0100,
徐晗翔 wrote:
> 
> ct_timer_free() cleared hw->irq_callback, stopped the hardware timer
> and kfree()d the ct_timer while the PCI IRQ handler could still be
> running or start later: a handler that loaded hw->irq_callback
> before the NULL store calls ct_timer_interrupt() with the freed
> atimer, and the single synchronize_irq() in snd_card_disconnect()
> only covers handlers that were running at that instant -- free_irq()
> happens later, in ct_atc_destroy() -> destroy_hw_obj().
> 
> synchronize_irq(hw->irq) after clearing the callback and stopping
> the hardware, before the kfree().  The hw->irq == -1 initialization
> contract is kept (the sync only runs for an installed IRQ).

A more proper fix would be to clear hw->irq_callback at the
disconnect, i.e. adding .dev_disconnect callback to ct_atc_create()
and clear hw->irq_callback (maybe introducing ct_timer_disconnect()
and doing there).  Then it's assured to be detached completely after
the disconnect, then no pending access would happen.


thanks,

Takashi


> ---
>  sound/pci/ctxfi/cttimer.c |  8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -417,6 +417,14 @@
>  	hw->irq_callback = NULL;
>  	if (atimer->ops->free_global)
>  		atimer->ops->free_global(atimer);
> +	/* Wait for an in-flight IRQ handler before the timer object goes
> +	 * away.  A handler that already loaded hw->irq_callback can still
> +	 * call ct_timer_interrupt() with the freed atimer, and the single
> +	 * synchronize_irq() in snd_card_disconnect() only covers handlers
> +	 * that were running at that instant -- free_irq() happens later,
> +	 * in ct_atc_destroy() -> destroy_hw_obj(). */
> +	if (hw->irq >= 0)
> +		synchronize_irq(hw->irq);
>  	kfree(atimer);
>  }
>  
> 
> 
> 
> > -----原始邮件-----
> > 发件人: "Takashi Iwai" <tiwai@suse.de>
> > 发送时间:2026-11-14 00:30:54 (星期六)
> > 收件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 抄送: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: Re: ALSA: ctxfi: free atimer only after the timer IRQ is quiesced
> > 
> > On Fri, 13 Nov 2026 12:58:51 +0100,
> > 徐晗翔 wrote:
> > > 
> > > `ct_timer_free()` frees `struct ct_timer` while the ctxfi timer IRQ handler can
> > > still be executing, or can start after `snd_card_disconnect()` has already done
> > > its single `synchronize_irq()`.  A handler that has passed the non-atomic
> > > `hw->irq_callback` check then calls `ct_timer_interrupt()` with the freed
> > > `atimer`; `free_irq()` only runs later, inside `ct_atc_destroy()` ->
> > > `destroy_hw_obj()`.  This is a use-after-free on the timer object and can crash
> > > or wedge the device during PCI removal/unbind.
> > > 
> > > The detailed description:
> > > 
> > > * Test environment / affected version
> > > 
> > >   Linux 7.3.0 source tree under review.  This report is source-level only: no
> > >   ctxfi hardware was available and QEMU has no ctxfi device model, so no
> > >   driver-specific reproducer was run.  The source paths/line numbers below are
> > >   from 7.3.
> > > 
> > > * Mechanism
> > > 
> > >   `ct_timer_new()` (`sound/pci/ctxfi/cttimer.c:388-411`) installs the native
> > >   timer callback by default when `!use_system_timer && hw->set_timer_irq`:
> > > 
> > >     hw->irq_callback_data = atimer;
> > >     hw->irq_callback      = ct_timer_interrupt;
> > > 
> > >   The PCI IRQ handlers `ct_20k1_interrupt()` (`cthw20k1.c:1878-1891`) and
> > >   `ct_20k2_interrupt()` (`cthw20k2.c:2045-2059`) do:
> > > 
> > >     if (hw->irq_callback)
> > >         hw->irq_callback(hw->irq_callback_data, status);
> > > 
> > >   `ct_timer_interrupt()` (`cttimer.c:379-386`) then reads
> > >   `timer->ops->interrupt` and calls it with `timer`.  Neither the check nor
> > >   the two loads is atomic.
> > > 
> > >   `ct_timer_free()` (`cttimer.c:414-421`) does:
> > > 
> > >     struct hw *hw = atimer->atc->hw;
> > >     hw->irq_callback = NULL;
> > >     if (atimer->ops->free_global)
> > >         atimer->ops->free_global(atimer);
> > >     kfree(atimer);
> > > 
> > >   `ct_xfitimer_free_global()` only calls `ct_xfitimer_irq_stop()`; that helper
> > >   stops the hardware only if `atimer->running` is set (`cttimer.c:137-145`).
> > >   It does not wait for an in-flight IRQ handler.
> > > 
> > >   `ct_atc_destroy()` (`ctatc.c:1250-1286`) then calls `ct_timer_free()` at
> > >   1257-1260, calls `destroy_hw_obj(atc->hw)` at 1274-1275, and only after that
> > >   `kfree(atc)` at 1283.  `destroy_hw_obj()` -> `hw_card_shutdown()` ->
> > >   `free_irq()` at `cthw20k1.c:1969` / `cthw20k2.c:2140`.  So `atc` itself is
> > >   not the freed object in this window; `atimer` is freed before `free_irq()`.
> > > 
> > > * Why the existing synchronization does not close the window
> > > 
> > >   ctxfi does set `card->sync_irq` at `cthw20k1.c:1937` / `cthw20k2.c:2104`,
> > >   and `snd_card_disconnect()` (`sound/core/init.c:495-562`) calls
> > >   `synchronize_irq(card->sync_irq)` once at 540-541.  But that call happens
> > >   before `ct_timer_free()`, only waits handlers that are running at that
> > >   instant, and does not disable the IRQ line.  A new handler can enter after
> > >   the one-time sync and before `free_irq()`.
> > > 
> > >   The `hw->irq_callback = NULL` store does not close the race either: a
> > >   handler that loaded the callback pointer before the store can still call it.
> > > 
> > > * Trigger model
> > > 
> > >   Open a ctxfi device (native timer path, the default), then remove/unbind the
> > >   PCI device while an interrupt is pending or arrives during teardown.  The
> > >   window is between `ct_timer_free()` and `free_irq()`.  Consequence: UAF read
> > >   of `atimer->ops` and timer fields in IRQ context; crash, stall, or potential
> > >   control-flow corruption.
> > > 
> > > * Suggested direction
> > > 
> > >   After clearing `hw->irq_callback` and calling `free_global()`, but before
> > >   `kfree(atimer)`, do:
> > > 
> > >     if (hw->irq >= 0)
> > >         synchronize_irq(hw->irq);
> > > 
> > >   Alternatively, move `free_irq()` earlier so it precedes the timer free.
> > >   Keep the existing `hw->irq == -1` initialization contract.
> > > 
> > > 
> > > Please keep me in Cc; I am not subscribed to the lists.
> > 
> > Could you rather submit a fix patch (with a proper patch description)
> > for each your reported issue?  You can put Link: tag to pointing to
> > the earlier reports.
> > 
> > 
> > thanks,
> > 
> > Takashi
