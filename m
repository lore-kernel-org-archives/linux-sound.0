Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618001;
	b=RTjItemviaU4qy1uDstiguIoA3H6p0rR6nci3sEsDnAdn7tApggc7gxYNzM2WE/yTJ1s
	 ndbNNqR6LrjQZmrE+C/RkQQ5GofXLWOlOWIXvDRc3hJvUOkw9k+5pc5p3ACMgQG5oOY5T
	 bqqXr/7r33N5cYyCIMr0hRyTWZhOZ58lJhVOrV03zMpHyRlB6m6kqcxddEXDCMOLRa34X
	 r7ywHlmBHJWwUacFTL5bV6vjH9okDmx0XMEKMdsqqqv6wAqzmXcIYUZFWJ3iza14Lo4Dm
	 s8JfXTPmRAZqDVkGmwvvIMuH9pUD+VuYYmWZ1iKfAO+atrn54GJC99ww+Q3hN6DnlzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618001;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=0K+lfTnBXGdNOHWIw4C2B+sRUK12wsqHUjGZseuMbks=;
	b=Nq8n0ROD7hufPLGkx+kUVq1PLkCkKI9xW3or+2dA7ICRotgkvgKE31xj+OPpxd9EC+fy
	 9Q8gCRSaTuqgr+EOeLTO8iZE3EQMXSYad7HKLeK6kARBr2TtpEJ7Es2c54lg96yTI7Ze2
	 eY4opQ9JApEzS5s7BHA9T74jcO7jxMM4IQY5vlGBnogmbPct8wdNo58D0RbFKyxrqtRX5
	 u5J1UxwbmhJuRbEx3eequLcAZUsf9rInf21niIgS83n2Cyp/8Cw3Iq/AopU3hYHLHz61b
	 NfreE/rOQaKcIZyPBRMGrYAObK6pca5EoimLxZ83p9FNnKWUd/F38RwFm6eJYR4S8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TERO2S50;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7O4JnRXS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gtQfBaQO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sUolb0LS;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4420F606A32A;
	Wed, 25 Nov 2026 14:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4420F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TERO2S50;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7O4JnRXS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gtQfBaQO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sUolb0LS
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37FD421F5F;
	Wed, 25 Nov 2026 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0K+lfTnBXGdNOHWIw4C2B+sRUK12wsqHUjGZseuMbks=;
	b=TERO2S50WrlMkBdNny6JsHiPXxvckhrN/+mQTG9I3mT2sDJaEd8Q8D5co0sMuRq6x+fQxf
	5erDLLG6xZ5bhu90EZGy6Slv02LhhGZOdv0lFWBmHvzL2L9YHCWJVZBSWEI/nl2nYWdWC6
	3VXp2Erk9SbR1R4KzuZrm8s7Ig+MCag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617999;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0K+lfTnBXGdNOHWIw4C2B+sRUK12wsqHUjGZseuMbks=;
	b=7O4JnRXSK5+9OI3ph68LYuvZPKsxEnqw0JaiWbljZzRIbs77tVw4PS4/Ygp+y1HqHZ60Og
	/NL1N2HcFALi1RDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0K+lfTnBXGdNOHWIw4C2B+sRUK12wsqHUjGZseuMbks=;
	b=gtQfBaQOUCUfF1zSv0L/8rdM5K8iRu7S9CWsUmxJyXB1e8HSwT4dY79omVHHC+mZ4YgdKx
	eRpA8KVui7+6FcPILl/ZcdKvl24m1643W2A0ht84Zpv1QDT0cZB+XjqX70SlAbbs5RTZC5
	H0/zJWvv4fXru6UXmFZYjS/yw4tAHQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0K+lfTnBXGdNOHWIw4C2B+sRUK12wsqHUjGZseuMbks=;
	b=sUolb0LSOKox+5XuuY/eOfKvcCE7IiRKcihfJGSGxqYD/HPSLvr5ovMDGTrTDp5wubzPTp
	h5bsXSy9FUGJz/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFF9A134CA;
	Wed, 25 Nov 2026 14:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KKhGLc30BmvOdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:46:37 +0000
Date: Wed, 25 Nov 2026 15:46:37 +0100
Message-ID: <87bj7d6kaa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: ALSA: asihpi: quiesce PCM timer and IRQ before freeing dpcm on close (UAF)
In-Reply-To: <8e25ddf.57f.1a212c231fe.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<2337e87f.262ec.1a1d4cd7b94.Coremail.xuhx@hust.edu.cn>
	<8e25ddf.57f.1a212c231fe.Coremail.xuhx@hust.edu.cn>
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
X-Spam-Flag: NO
X-Spam-Level: 
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
	URIBL_BLOCKED(0.00)[perex.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:helo,hust.edu.cn:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:email,suse.com:email,perex.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Wed, 25 Nov 2026 13:50:46 +0100,
徐晗翔 wrote:
> 
> snd_card_asihpi_runtime_free() kfree()d the per-open
> snd_card_asihpi_pcm while a polled timer callback or an
> IRQ/threaded handler could still use it: the polled stop path uses
> plain timer_delete() (no wait for a running callback), and the IRQ
> stop path clears card->llmode_streampriv with a plain store and no
> synchronize_irq().
> 
> Quiesce in runtime->private_free, which runs in process context from
> snd_pcm_detach_substream() outside the PCM stream lock (so the
> sleeping sync calls are allowed there): timer_shutdown_sync() for
> the polled timer; for IRQ mode, clear card->llmode_streampriv and
> synchronize_irq(card->hpi->irq) before the kfree(dpcm).

Implement rather PCM sync_stop callback to call timer_delete_sync(),
instead.  This assures that the timer is gone after stopping the
stream.


Takashi

> ---
>  sound/pci/asihpi/asihpi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -495,6 +495,29 @@
>  static void snd_card_asihpi_runtime_free(struct snd_pcm_runtime *runtime)
>  {
>  	struct snd_card_asihpi_pcm *dpcm = runtime->private_data;
> +	struct snd_card_asihpi *card = snd_pcm_substream_chip(dpcm->substream);
> +
> +	/* Quiesce the polled timer and the low-latency IRQ stream before
> +	 * the memory goes away.  This runs in process context from
> +	 * snd_pcm_detach_substream(), outside the PCM stream lock, so the
> +	 * sleeping sync calls are allowed here (they must NOT be put into
> +	 * the trigger/stop path under the stream lock).
> +	 *
> +	 * Polled mode: snd_card_asihpi_pcm_timer_stop() uses plain
> +	 * timer_delete(), which does not wait for a callback that is
> +	 * already running on another CPU -- the callback dereferences dpcm
> +	 * throughout and re-arms itself if it observes respawn_timer set.
> +	 *
> +	 * IRQ mode: card->llmode_streampriv is cleared with a plain store
> +	 * by snd_card_asihpi_pcm_int_stop(); the threaded handler may
> +	 * already have loaded the pointer, so synchronize the IRQ line
> +	 * after clearing before the kfree(). */
> +	timer_shutdown_sync(&dpcm->timer);
> +	if (card->llmode_streampriv == dpcm) {
> +		card->llmode_streampriv = NULL;
> +		if (card->hpi->irq)
> +			synchronize_irq(card->hpi->irq);
> +	}
>  	kfree(dpcm);
>  }
>  
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-13 20:06:38 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: ALSA: asihpi: quiesce PCM timer and IRQ before freeing dpcm on close (UAF)
> > 
> > `snd_card_asihpi_runtime_free()` frees the per-open `struct
> > snd_card_asihpi_pcm` while a polled timer callback or an IRQ/threaded handler
> > can still use it.  The polled stop path uses `timer_delete()` (not
> > `timer_delete_sync()`), and the IRQ stop path clears
> > `card->llmode_streampriv` without `synchronize_irq()`.  A normal PCM close can
> > therefore free `dpcm` and then `runtime` while the callback is still running.
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Linux 7.3.0 source plus a QEMU/KASAN fake-PCM harness.  No ASI6205 hardware
> >   was available; the harness validates the ALSA core close ordering and the
> >   exact `timer_delete`/`llmode_streampriv` lifetime pattern.
> > 
> > * Mechanism
> > 
> >   `snd_card_asihpi_runtime_free()` (`asihpi.c:495-499`) does `kfree(dpcm)` and
> >   is installed as `runtime->private_free` at playback open
> >   (`asihpi.c:997-1000`) and capture open (`1166-1169`).
> > 
> >   Polled mode:
> > 
> >     snd_card_asihpi_pcm_timer_start()  asihpi.c:501-513
> >         mod_timer(&dpcm->timer, jiffies + expiry);
> >         dpcm->respawn_timer = 1;
> > 
> >     snd_card_asihpi_pcm_timer_stop()   asihpi.c:515-522
> >         dpcm->respawn_timer = 0;
> >         timer_delete(&dpcm->timer);     /* no sync */
> > 
> >   `snd_card_asihpi_timer_function()` (`asihpi.c:710-896`) uses `dpcm`
> >   throughout and can re-arm at 894-895 if it observes `respawn_timer`.
> > 
> >   IRQ mode:
> > 
> >     snd_card_asihpi_pcm_int_start()    asihpi.c:524-538
> >         card->llmode_streampriv = dpcm;
> >         ... set HPI IRQ rate ...
> > 
> >     snd_card_asihpi_pcm_int_stop()     asihpi.c:540-550
> >         ... set HPI IRQ rate 0 ...
> >         card->llmode_streampriv = NULL;  /* no synchronize_irq */
> > 
> >   `snd_card_asihpi_isr()` (`asihpi.c:898-907`) reads
> >   `asihpi->llmode_streampriv` twice (check, then dereference), so a threaded
> >   handler can hold the old `dpcm` pointer across the NULL store.
> > 
> >   Close path: `snd_pcm_release_substream()`
> >   (`sound/core/pcm_native.c:2785-2805`) -> `snd_pcm_drop()`
> >   (`pcm_native.c:2267-2289`) -> `snd_pcm_detach_substream()`
> >   (`sound/core/pcm.c:978-1005`) -> `runtime->private_free()` -> `kfree(dpcm)`
> >   and then `kfree(runtime)`.
> > 
> > 
> > * Trigger model
> > 
> >   Local user opens a capture or playback PCM, starts it, and closes it while
> >   the polled timer or HPI IRQ is active.  Polled mode is available on HPI6000
> >   and HPI6205; IRQ mode requires HPI6205 in interrupt mode.  SMP/preemption
> >   needed for the cross-CPU window.  Consequence: UAF of `dpcm`/`runtime` in
> >   timer softirq or threaded IRQ; crash or memory corruption.
> > 
> > * Dynamic evidence
> > 
> >   `sndpci_race.c` mode `pcm`, `verification/kmod/
> >   sndpci/pcmtest.c close 200`: `.trigger STOP` uses `timer_delete()` and
> >   `runtime->private_free` frees `dpcm`; timer pinned to CPU0, user close to
> >   CPU1.  Contain 35 KASAN UAF report fragments:
> > 
> >     BUG: KASAN: slab-use-after-free in race_pcm_timer
> >     ...
> >     Allocated by task: race_pcm_open
> >     Freed by task: kfree -> snd_pcm_detach_substream -> snd_pcm_release
> > 
> > 
> > 
> > * Suggested direction
> > 
> >   In `snd_card_asihpi_runtime_free()` (or immediately before it), for polled
> >   mode call `timer_shutdown_sync(&dpcm->timer)`.  For IRQ mode, first clear
> >   `card->llmode_streampriv` (with the appropriate ordering), then
> >   `synchronize_irq(card->hpi->irq)` before `kfree(dpcm)`.  Do not put the
> >   sleeping sync inside the PCM stream lock; do it in the detach/private_free
> >   process context.  Also consider quiescing before the HPI stream `.close`
> >   (the extra HPI stream handle window is discussed in the report).
> > 
> > 
> > 
> > Please keep me in Cc; I am not subscribed to the lists.
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
