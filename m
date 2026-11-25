Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617319;
	b=0z4Z8tsrpf03UMQ8lyKcto4A2o9MpkFxJSs4b1BZyfRqPMroNJNWRJhJ0mwTCAiqQrmb
	 DDCzArLIwMJSB+5AODRIMeyY0EbMxFAyedhMaphrVkecb5Gs70sIJMlQjslbm7Lv+6uxH
	 cqGRhCFAJh5tUtj5FARY/rawSmRDdM9T+JqsNAoxTAE3vzqp/bncZG7/yEPlkf8LoLcBc
	 VsLdfeRMWNo1Dig20k4rZ7SqeXzTzEe4tBoRzJVmxKPeJkJZFeaYHoD6KKGZmdBbgq/Cc
	 VL6xodKBHROFAPYAVWukJUoPM0rwqaPGJGZboKQ//CLZGl0ibOz7KNC2FhW4PPJPwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617319;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=Mxc2Ca1FnoD6eTU6MP59O08y02WTd7ebqqeUDcExdJg=;
	b=JqwcR2ZQtcRJjVAit+9prRrzhcnhIGqbnBYVrnftB2HNhoo/uTKjX9tKKbZtME8DlQ/g
	 rCvTEw8SDxJlzXDPUhbgyxpkWDR/UoHGAaQ5PNE6bvis2mow7WdAeSvw0EB8pefDJqN/Q
	 AJRLnMly4hRmBLFJFXT01V0RBiwD104ljiAZ5UPytrJq0v4diuKScOS0tn5PAkBCgPnH8
	 B0t1wDp6pXYHvPKWWxowc8WMlANzc3SEA6Lz0FfQNUbP9DF6bYMy81Jb6eC8WefT9V51U
	 70N2QnS2hwI233JBLwIn+W4sCfRgRpCg0QzweNGWSIXkFZsXtU4lGWq45mj+QELzsiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XFG8JHFT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJKqZDKP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XFG8JHFT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJKqZDKP;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D8606A31E;
	Wed, 25 Nov 2026 14:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XFG8JHFT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJKqZDKP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XFG8JHFT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJKqZDKP
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58D0221EA0;
	Wed, 25 Nov 2026 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxc2Ca1FnoD6eTU6MP59O08y02WTd7ebqqeUDcExdJg=;
	b=XFG8JHFT0hl0vsPoTAIVJgXdkp+aXtSvEhi6NoEq4U/iZFAUXY3uZIIrrvdMQJq0ec6zQd
	hl2Pn6610bfJpcWmHtwOKdMbqsLN2TobVSwZxelox6k9Xu8geIAWNej4Pt9RPU0tzCVtX4
	rA1i0+tMd/Nd7P9NZnxQ9ukM5yVPewQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxc2Ca1FnoD6eTU6MP59O08y02WTd7ebqqeUDcExdJg=;
	b=FJKqZDKPipg/D/6aXcFLHM2I8niPArf9GHgKYbyrNwwswMvhIAL2Rufk+SL5UiTiKeUFxn
	fWJiRWIgHCIIFuBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XFG8JHFT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FJKqZDKP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795617316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxc2Ca1FnoD6eTU6MP59O08y02WTd7ebqqeUDcExdJg=;
	b=XFG8JHFT0hl0vsPoTAIVJgXdkp+aXtSvEhi6NoEq4U/iZFAUXY3uZIIrrvdMQJq0ec6zQd
	hl2Pn6610bfJpcWmHtwOKdMbqsLN2TobVSwZxelox6k9Xu8geIAWNej4Pt9RPU0tzCVtX4
	rA1i0+tMd/Nd7P9NZnxQ9ukM5yVPewQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795617316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxc2Ca1FnoD6eTU6MP59O08y02WTd7ebqqeUDcExdJg=;
	b=FJKqZDKPipg/D/6aXcFLHM2I8niPArf9GHgKYbyrNwwswMvhIAL2Rufk+SL5UiTiKeUFxn
	fWJiRWIgHCIIFuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2611134CA;
	Wed, 25 Nov 2026 14:35:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5zL2MSPyBmsJbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:35:15 +0000
Date: Wed, 25 Nov 2026 15:35:15 +0100
Message-ID: <87fqwp6kt8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: ALSA: ctxfi: do not free a running system timer when timer_delete_sync_try() returns -1 (UAF)
In-Reply-To: <20f42cfd.589.1a212c337be.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<6776b38b.262de.1a1d4ca8711.Coremail.xuhx@hust.edu.cn>
	<20f42cfd.589.1a212c337be.Coremail.xuhx@hust.edu.cn>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[perex.cz:email,suse.com:email,suse.de:dkim,hust.edu.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 58D0221EA0

On Wed, 25 Nov 2026 13:51:53 +0100,
徐晗翔 wrote:
> 
> ct_systimer_prepare() served as both the prepare callback and the
> free_instance callback and ignored the -1 return of
> timer_delete_sync_try() (-1 means the callback is running on
> another CPU and was NOT deleted); ct_timer_instance_free() then
> kfree()d the instance while ct_systimer_callback() still
> dereferenced ti->substream, substream->runtime, ti->apcm and
> ti->position -- a UAF on a normal PCM close with use_system_timer=1.
> 
> Split the callbacks: keep ct_systimer_prepare() non-sleeping (it
> also runs from ct_timer_prepare() under snd_pcm_prepare()'s stream
> lock, where a sleeping wait would be 'scheduling while atomic'), and
> give the free path its own ct_systimer_free() that calls
> timer_shutdown_sync() before the instance is removed and kfree()d.
> ---
>  sound/pci/ctxfi/cttimer.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -111,11 +111,24 @@
>  
>  static void ct_systimer_prepare(struct ct_timer_instance *ti)
>  {
> +	/* keep the try variant here: this callback also runs from
> +	 * ct_timer_prepare() under snd_pcm_prepare()'s stream lock, where
> +	 * a sleeping wait would be a "scheduling while atomic" */
>  	ct_systimer_stop(ti);
>  	timer_delete_sync_try(&ti->timer);
>  }
>  
> -#define ct_systimer_free	ct_systimer_prepare
> +static void ct_systimer_free(struct ct_timer_instance *ti)
> +{
> +	/* the close/free path runs in process context and must wait for a
> +	 * callback that is already running on another CPU before the
> +	 * instance (and the PCM runtime / apcm it dereferences) is removed
> +	 * and kfree()d; timer_delete_sync_try() returns -1 in exactly that
> +	 * case without waiting, so a UAF followed.  Use the full shutdown
> +	 * sync here, but do NOT route prepare through it. */
> +	ct_systimer_stop(ti);
> +	timer_shutdown_sync(&ti->timer);
> +}
>  
>  static const struct ct_timer_ops ct_systimer_ops = {
>  	.init = ct_systimer_init,

The code change makes sense, but please try to reduce the redundant
comment text.

Then add Signed-off-by tag and resubmit.


thanks,

Takashi

> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-13 20:03:25 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: ALSA: ctxfi: do not free a running system timer when timer_delete_sync_try() returns -1 (UAF)
> > 
> > `ct_systimer_prepare()` is used as both the prepare callback and the
> > `free_instance` callback.  It calls `timer_delete_sync_try()` and ignores the
> > return value; `-1` means the timer callback is running on another CPU and the
> > timer was NOT deleted.  `ct_timer_instance_free()` then removes the instance
> > and `kfree()`s it while `ct_systimer_callback()` can still dereference
> > `ti->substream`, `ti->substream->runtime`, `ti->apcm`, and `ti->position`.
> > A normal PCM close with `use_system_timer=1` can therefore produce a UAF of
> > the timer instance, the PCM runtime, and the driver's private PCM object.
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Linux 7.3.0, source analysis plus a QEMU/KASAN primitive reproducer.
> >   The reproducer uses the real exported `timer_delete_sync_try()` and a timer
> >   callback; it does not call the static ctxfi functions or emulate ctxfi
> >   hardware.
> > 
> > * Mechanism
> > 
> >   `ct_systimer_callback()` (`sound/pci/ctxfi/cttimer.c:63-87`) reads
> >   `ti->substream`, `substream->runtime`, `ti->apcm`,
> >   `substream->ops->pointer`, `apcm->interrupt`, and `ti->position`; it takes
> >   `ti->lock` only near the end and may re-arm the timer.
> > 
> >   `ct_systimer_stop()` (`cttimer.c:105-110`) locks `ti->lock`, clears
> >   `ti->running`, and calls `timer_delete()`.  `ct_systimer_prepare()`
> >   (`cttimer.c:112-116`) then does:
> > 
> >     ct_systimer_stop(ti);
> >     timer_delete_sync_try(&ti->timer);
> > 
> >   `#define ct_systimer_free ct_systimer_prepare` at line 118 makes the same
> >   function the `free_instance` callback, and `ct_systimer_ops.free_instance`
> >   is set at 120-126.  `ct_timer_instance_free()` (`cttimer.c:360-373`) calls
> >   `atimer->ops->stop()`, then `free_instance()`, then `list_del()` under
> >   `list_lock`, then `kfree(ti)`.
> > 
> >   `timer_delete_sync_try()` (`kernel/time/timer.c:1488-1492`) returns 0 if the
> >   timer was not pending, 1 if it was pending and deactivated, and -1 if the
> >   callback is running on another CPU.  It never waits.  The return value is
> >   ignored here.
> > 
> >   The PCM close path is `snd_pcm_release_substream()`
> >   (`sound/core/pcm_native.c:2785-2805`) -> `snd_pcm_drop()` ->
> >   `snd_pcm_detach_substream()` (`sound/core/pcm.c:978-1005`).  The ctxfi
> >   `runtime->private_free` is `ct_atc_pcm_free_substream()`
> >   (`sound/pci/ctxfi/ctpcm.c:103-112`), which calls
> >   `ct_timer_instance_free(apcm->timer)` and then `kfree(apcm)`.  Thus a
> >   callback running on another CPU can use `ti`, `ti->substream->runtime`, and
> >   `apcm` after they are freed.
> > 
> > * Why the fix cannot simply sleep in ct_systimer_prepare()
> > 
> >   The same callback is also `ct_timer_ops.prepare`, called from
> >   `ct_timer_prepare()` while `snd_pcm_prepare()` holds
> >   `pcm_stream_lock_irq` (`pcm_native.c:2042-2050`).  Replacing the try with a
> >   sleeping `timer_delete_sync()` there would cause "scheduling while atomic".
> >   The prepare path must keep a non-sleeping delete/try; the close/free path
> >   needs a separate method.
> > 
> > * Trigger model
> > 
> >   `use_system_timer=1` (module parameter; default is false), open/prepare a
> >   PCM, let the system timer callback run, then close the PCM while the
> >   callback is still active on another CPU.  SMP/preemption required.
> >   Consequence: UAF in timer softirq; crash or memory corruption.
> > 
> > * Dynamic evidence
> > 
> >   `sndpci_race.c`, mode `v3`, runs the real
> >   `timer_delete_sync_try()`; when it returns -1 the test frees the object while
> >   the callback is in `mdelay()`. Show 16 KASAN reports:
> > 
> >     sndpci_race: v3 iter=0 delete_sync_try=-1
> >     BUG: KASAN: slab-use-after-free in v3_callback
> >     ...
> >     Allocated by task 86: v3_thread
> >     Freed by task 86: kfree -> v3_thread
> > 
> > 
> > 
> > * Suggested direction
> > 
> >   Split the callbacks: keep `ct_systimer_prepare()` non-sleeping for the
> >   prepare path, and add a separate `ct_systimer_free()` for close/free that
> >   first clears the callback/running state and then calls
> >   `timer_shutdown_sync(&ti->timer)` (or `timer_delete_sync()`), before the
> >   instance list removal and `kfree(ti)`.  Do not call the sleeping helper from
> >   the PCM prepare path.
> > 
> > 
> > Please keep me in Cc; I am not subscribed to the lists.
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
