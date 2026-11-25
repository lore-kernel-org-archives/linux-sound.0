Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617833;
	b=vW0a5487K/XlgEj6RkzxSjoAVn6fXcsKiFLf+S9lQCtNkFCEO7FxIKDaeCrHrZFiXRqw
	 76vRTq8t3FgPk9nrm7rEgiZsu49cpvucZpZ6KkmXtEGSl84EVErzR3S3AAm1SwOHVYzr2
	 4aNkIn5CHcNiRNV0J13yae2P/9qEdEPgUT88MY8/Op6o8hv6MdaQ+ZXfSw8vfAh7yDpA4
	 WXDM6wJcBAPj8OqFO+ZVCqxEZxriYbLkKwTjZayjKiaHVtSWOn6Mbgcae1AVXmedBaoD0
	 /aqajPd1JcSTwqW6NRTjBoFNYSMuJvOHI7N6rAesCYpITIiQu+JxGY/q+tYf+qWdFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617833;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=VeYq3Tu1ASHlN7oSA4+VfsVIQfo63WP5vAo770LlUAc=;
	b=Uq7xmHkRutyr4cbNwnnWx4brqvEGawI2G13jqx6x2Hz2/ZlbaG2lgf98kN00wh4D0La/
	 b3kfcJhyMQrLFxwA6tEA1G95Hc/3K1hrwHV6d/VzSSsOF2IskK0FKp8WN6i1wFx/ZwcHb
	 r3G6G6Zt/F2+wH5BMvKiZxKboNKVKn49n+o4WP2xsnwBEi//CeP9lhE7cJ8YQz8d+wI2i
	 LYQ9L8SGPELRmHkHRfeuhl68lfuqL2LN4BUwrusQvJW6KxcD6QCDEurAt7vbDxtRUkmTS
	 AXQyNkN27OnBe4xCDjuVRSRS46pS352OhalBpVZwN3WuvofGVXkweCnSODrrguT9/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rCKvy4q4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vRKABZQr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rCKvy4q4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vRKABZQr;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16A606A321;
	Wed, 25 Nov 2026 14:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF16A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rCKvy4q4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vRKABZQr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rCKvy4q4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vRKABZQr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEFA521F53;
	Wed, 25 Nov 2026 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeYq3Tu1ASHlN7oSA4+VfsVIQfo63WP5vAo770LlUAc=;
	b=rCKvy4q4iGVGq69Hpvtyi/dCooMSQb7REe4nmV3hYOASFhge5rJ9hQITablLGv7cY9xe5D
	lsMRQBE7QoiRdF5A+70M7Bk1nugq14Ht13VFEOorsqzlywz9nU+X4WaJKVz5hB29wyiqvv
	khYjoVx8L2g8r+hQgaZqHXGyWuQbiGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeYq3Tu1ASHlN7oSA4+VfsVIQfo63WP5vAo770LlUAc=;
	b=vRKABZQrbKrl2LAZ1rdSPUd+d1AAKsJjDaq58a2FxET1GVjJ8m9PvKSUQpmZiLTIttR536
	MeaGTySxHG5hNTBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rCKvy4q4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vRKABZQr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeYq3Tu1ASHlN7oSA4+VfsVIQfo63WP5vAo770LlUAc=;
	b=rCKvy4q4iGVGq69Hpvtyi/dCooMSQb7REe4nmV3hYOASFhge5rJ9hQITablLGv7cY9xe5D
	lsMRQBE7QoiRdF5A+70M7Bk1nugq14Ht13VFEOorsqzlywz9nU+X4WaJKVz5hB29wyiqvv
	khYjoVx8L2g8r+hQgaZqHXGyWuQbiGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeYq3Tu1ASHlN7oSA4+VfsVIQfo63WP5vAo770LlUAc=;
	b=vRKABZQrbKrl2LAZ1rdSPUd+d1AAKsJjDaq58a2FxET1GVjJ8m9PvKSUQpmZiLTIttR536
	MeaGTySxHG5hNTBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65880134CA;
	Wed, 25 Nov 2026 14:43:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0DmaDyb0BmsidQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:43:50 +0000
Date: Wed, 25 Nov 2026 15:43:49 +0100
Message-ID: <87cxrt6key.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: ALSA: asihpi: free IRQ before snd_card_free()/HPI delete on HPI6205 removal (UAF)
In-Reply-To: <2c1d9b73.57c.1a212c1b142.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<358caed8.262e3.1a1d4cbccec.Coremail.xuhx@hust.edu.cn>
	<2c1d9b73.57c.1a212c1b142.Coremail.xuhx@hust.edu.cn>
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,hust.edu.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,perex.cz:email];
	URIBL_BLOCKED(0.00)[hust.edu.cn:email,perex.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: AEFA521F53

On Wed, 25 Nov 2026 13:50:13 +0100,
徐晗翔 wrote:
> 
> snd_asihpi_remove() freed the ALSA card and then sent
> HPI_ADAPTER_DELETE (kfree()ing the HPI6205 phw) BEFORE free_irq():
> both the primary handler (adapter_irq_query_and_clear() reads
> phw->prHSR) and the threaded handler (snd_card_asihpi_isr() reads
> a->snd_card->private_data) could run against freed memory.
> 
> free_irq() -- the first operation that waits for the in-flight
> primary and threaded handlers -- now runs before snd_card_free()
> and before HPI_ADAPTER_DELETE, with hpi->irq cleared so the existing
> if (pa->irq) guard in asihpi_adapter_remove() does not double-free

This sounds like a wrong solution and likely breaking something.
HPI_ADAPTER_DELETE is a command that has to be sent to a board.

IOW, what should be fixed is rather the order of the call in
snd_asihpi_remove().  asihpi_adapter_remove() should be called at
first, followed by snd_card_free().  But maybe for synchronization, we
should call snd_card_disconnect(), sync, then remove the resources.


thanks,

Takashi

> ---
>  sound/pci/asihpi/asihpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -2927,6 +2927,20 @@
>  			HPI_ADAPTER_PROPERTY_IRQ_RATE, 0, 0));
>  	}
>  
> +	/* Free/quiesce the IRQ before the card and the HPI adapter objects
> +	 * go away: free_irq() is the first (and only) operation that waits
> +	 * for the in-flight primary and threaded handlers.  Afterwards
> +	 * snd_card_free() releases the card private area (read by
> +	 * snd_card_asihpi_isr() through a->snd_card->private_data) and
> +	 * asihpi_adapter_remove() sends HPI_ADAPTER_DELETE, which kfree()s
> +	 * the phw whose prHSR the primary handler dereferences through
> +	 * adapter_irq_query_and_clear().  asihpi_adapter_remove() keeps its
> +	 * if (pa->irq) guard, so this is not a double free_irq(). */
> +	if (hpi->irq) {
> +		free_irq(hpi->irq, hpi);
> +		hpi->irq = 0;
> +	}
> +
>  	snd_card_free(hpi->snd_card);
>  	hpi->snd_card = NULL;
>  	asihpi_adapter_remove(pci_dev);
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-13 20:04:48 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: ALSA: asihpi: free IRQ before snd_card_free()/HPI delete on HPI6205 removal (UAF)
> > 
> > `snd_asihpi_remove()` frees the ALSA card and then sends HPI_ADAPTER_DELETE
> > (which frees the HPI6205 `phw`) before `free_irq()`.  Both the primary IRQ
> > handler and the threaded handler can therefore run against freed memory:
> > the primary handler dereferences `phw->prHSR` through
> > `adapter_irq_query_and_clear()`, and the threaded callback dereferences
> > `a->snd_card->private_data` after the card private area has been freed.
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Linux 7.3.0 source tree.  Affected hardware path: ASI6205/HPI6205 in
> >   interrupt mode (`low_latency_mode && irq_supported`, `interrupt_mode=1`).
> >   HPI6000 does not set `irq_query_and_clear` and is polled, so it is not part
> >   of this report.
> > 
> > * Mechanism
> > 
> >   `snd_asihpi_remove()` (`sound/pci/asihpi/asihpi.c:2919-2933`):
> > 
> >     hpi->interrupt_callback = NULL;          /* if interrupt_mode */
> >     ... send HPI IRQ rate 0 ...
> >     snd_card_free(hpi->snd_card);            /* line 2930 */
> >     hpi->snd_card = NULL;                    /* line 2931 */
> >     asihpi_adapter_remove(pci_dev);          /* line 2932 */
> > 
> >   `asihpi_adapter_remove()` (`hpioctl.c:520-555`) then sends IRQ rate 0,
> >   sends `HPI_ADAPTER_DELETE` (537-540), and only afterwards calls
> >   `free_irq(pa->irq, pa)` (542-543).
> > 
> >   HPI6205 `adapter_delete()` (`hpi6205.c:491-510`) -> `delete_adapter_obj()`
> >   (`hpi6205.c:675-704`) does `kfree(phw)` at 703 without clearing
> >   `pao->priv`, then `hpi_delete_adapter()` (`hpicmn.c:96-108`) memsets the
> >   registry object at 106.  The primary handler `asihpi_isr()`
> >   (`hpioctl.c:311-335`) checks `a->adapter->irq_query_and_clear` and calls
> >   it; HPI6205 installs that handler at `hpi6205.c:662`, and
> >   `adapter_irq_query_and_clear()` (`hpi6205.c:708-722`) does
> >   `ioread32(phw->prHSR)` at 714.
> > 
> >   Window A (phw UAF): the handler loads the function pointer before
> >   `delete_adapter_obj()` frees `phw`, and executes after the free.
> > 
> >   Window B (NULL deref): the handler executes after `hpi_delete_adapter()`
> >   memsets the registry, so `pao->priv` is NULL and `phw->prHSR` is a NULL
> >   dereference.
> > 
> >   Window C (card private UAF): `asihpi_isr_thread()` (`hpioctl.c:337-344`)
> >   calls `a->interrupt_callback(a)`; `snd_card_asihpi_isr()`
> >   (`asihpi.c:898-907`) reads `a->snd_card->private_data` and
> >   `asihpi->llmode_streampriv`.  The card private area is allocated by
> >   `snd_card_new(..., sizeof(struct snd_card_asihpi), ...)`
> >   (`asihpi.c:2794-2799`) and freed by `snd_card_do_free()`
> >   (`sound/core/init.c:584-611`, `kfree(card)` at 610).  After
> >   `hpi->snd_card = NULL`, the same callback can also return NULL from the
> >   `snd_card` load and hit the WARN_ON/NULL path.
> > 
> > * Why existing synchronization does not close the window
> > 
> >   asihpi never sets `card->sync_irq`, so `snd_card_disconnect()` does not call
> >   `synchronize_irq()`.  `snd_card_free()` waits for open files and the card
> >   release completion, not for the IRQ handler/thread.  `free_irq()` is the
> >   first operation that quiesces the IRQ, and it happens after `snd_card_free()`
> >   and after HPI_ADAPTER_DELETE has freed `phw`.
> > 
> > * Trigger model
> > 
> >   HPI6205 device in IRQ mode; remove/unbind the PCI device.  Root is needed
> >   for unbind/remove.  Consequence: UAF/NULL deref in hard IRQ or threaded IRQ
> >   context; crash or memory corruption.  The report does not claim a
> >   concurrent user ioctl path: the card file drain prevents that, and only the
> >   single remove path sends HPI_ADAPTER_DELETE.
> > 
> > * Suggested direction 
> > 
> >   Free/quiesce the IRQ before `snd_card_free()` and before sending
> >   HPI_ADAPTER_DELETE:
> > 
> >     if (hpi->irq) {
> >         free_irq(hpi->irq, hpi);
> >         hpi->irq = 0;
> >     }
> >     snd_card_free(hpi->snd_card);
> > 
> >   Keep the existing `if (pa->irq)` guard in `asihpi_adapter_remove()` to avoid
> >   a double free.  Alternatively set `card->sync_irq` and perform an explicit
> >   `synchronize_irq()` before releasing the card private data, but freeing the
> >   IRQ first is simpler and also covers the `phw` window.
> > 
> > 
> > 
> > Please keep me in Cc; I am not subscribed to the lists.
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
