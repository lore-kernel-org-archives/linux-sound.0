Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616102;
	b=Mc90okE69hwy7O/4nP20MemhYPRJ4dI7oxPU+/bMrmF4Cnuah1X0YXkYDnb92b5HfJHF
	 OIzj43og5JDDboPRCBQGxQZCARixKRpPABrw2eky5esxI5madwUySwsKhsyXV1ciTdbLE
	 Xq5jM7yvlsbWa0LHptopcaqO3Hs2zgBnILoTlVh3cPmls/SqGXNdWO7kkIgINl8UuDh1G
	 UzTQGO3C6MdE6+FemtL6CcjbXnyAicFDqk/k9JM5FniNUGmUhQnUvAFgM/7ZcTD1xqcKr
	 8RaeGkNv7VXIrAtzinGi82NcukwqdKz3VPJ7pyxGiwiuJ7lQR+cG3j5V/I93G7B7jAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616102;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=gTEaZlqRzA20kz1/1lJ12JNht6eJaqpykYAzPGXu/Q8=;
	b=s/iX36Hcf6HfmXfM4+PpQnvyzX7+pYqZpddACc1MEbYfzZ44KlNnb3MwU+aG18iMThD9
	 vzbKCIO+i4wOpBQw+WwrPn1yHMTZaP+L65nYZRCViSogq3MqGAzXUS+W7FQzmlt+5xFYH
	 e2QvF6Tyt1PaF2TVmBXWW2efyVOUfuwEsshXHcYqC5AKxBl4oE2vVfz3x73x2xgUlkk3r
	 BG5yHYkNXq92gbHloKDa/PVZRgRQkSzMhmII8934bA63troKlXwwygjapxZRJfi7wpyUn
	 xS7NBJbEUN/jv9dozQn9s/RPAaiENsRzPBg3vN3Zo9F9GtSXx5iRF7Mu7VZHb1q7qDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="d/okIrC9";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aJx+O3OV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="d/okIrC9";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aJx+O3OV;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A22606A321;
	Wed, 25 Nov 2026 14:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d/okIrC9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aJx+O3OV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d/okIrC9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aJx+O3OV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 609D2221B6;
	Wed, 25 Nov 2026 14:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTEaZlqRzA20kz1/1lJ12JNht6eJaqpykYAzPGXu/Q8=;
	b=d/okIrC9sFbNZ9n65MzaUItVUKcZXVMBoTS8zN92pZIVgWhXeM4IjCVt0A9p+Ll9sRu3J6
	2mkxMxlUaR756QA0txYMohwY6uRsrxMoosdXx/TtLexsqxZysRV+hWimPNckNj8PvlqRne
	L7YUFMO8XI0yebmuirtOI77aaZ/j4J4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTEaZlqRzA20kz1/1lJ12JNht6eJaqpykYAzPGXu/Q8=;
	b=aJx+O3OV0M54Q+xHv9ZcVMeiab+T7v29/VbrMSi2F/YT8jRWk4x+ZdBQjwCRrF30DFf4+z
	M0xH4SBydlpG20AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTEaZlqRzA20kz1/1lJ12JNht6eJaqpykYAzPGXu/Q8=;
	b=d/okIrC9sFbNZ9n65MzaUItVUKcZXVMBoTS8zN92pZIVgWhXeM4IjCVt0A9p+Ll9sRu3J6
	2mkxMxlUaR756QA0txYMohwY6uRsrxMoosdXx/TtLexsqxZysRV+hWimPNckNj8PvlqRne
	L7YUFMO8XI0yebmuirtOI77aaZ/j4J4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTEaZlqRzA20kz1/1lJ12JNht6eJaqpykYAzPGXu/Q8=;
	b=aJx+O3OV0M54Q+xHv9ZcVMeiab+T7v29/VbrMSi2F/YT8jRWk4x+ZdBQjwCRrF30DFf4+z
	M0xH4SBydlpG20AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17649134CA;
	Wed, 25 Nov 2026 14:15:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1WNCOGPtBmuPVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:15:00 +0000
Date: Wed, 25 Nov 2026 15:14:59 +0100
Message-ID: <87o6bd6lr0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: sound: core: hwdep DSP_LOAD check-then-act is unlocked, allowing  concurrent DSP_LOAD callbacks (UAF)
In-Reply-To: <4f829dcb.56e.1a212bebac5.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<7eed17bc.2ad1e.1a2023e5f21.Coremail.xuhx@hust.edu.cn>
	<4f829dcb.56e.1a212bebac5.Coremail.xuhx@hust.edu.cn>
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 25 Nov 2026 13:46:59 +0100,
徐晗翔 wrote:
> 
> snd_hwdep_dsp_load() checked hw->dsp_loaded, ran the driver
> callback and updated the bit with no lock; two threads sharing one
> hwdep fd (dup()/fork()) could both pass the check and run
> hw->ops.dsp_load() concurrently -- the callback is not required to
> be thread-safe (in-tree usx2y registers ALSA devices and allocates
> URBs under non-atomic WARN_ON() check-then-act guards), with
> double-registration / double-free / UAF consequences.
> 
> Restore the upstream per-device dsp_mutex: add the field to struct
> snd_hwdep, initialize it in snd_hwdep_new() and hold it across the
> dsp_loaded check, the dsp_load() callback and the bit update.
> hw->exclusive only guards open(), not concurrent ioctls on an
> already-open fd.

This is already fixed in the upstream commit aee83c204f80.


thanks,

Takashi

> ---
>  sound/core/hwdep.c    | 11 ++++++++++-
>  include/sound/hwdep.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
> --- a/sound/core/hwdep.c
> +++ b/sound/core/hwdep.c
> @@ -207,11 +207,19 @@
>  			      struct snd_hwdep_dsp_image *info)
>  {
>  	int err;
> -	
> +
>  	if (! hw->ops.dsp_load)
>  		return -ENXIO;
>  	if (info->index >= 32)
>  		return -EINVAL;
> +	/* Serialize the whole check-and-load sequence: two threads sharing
> +	 * one hwdep fd (dup()/fork()) must not both pass the dsp_loaded
> +	 * check and run the driver callback concurrently -- the callback
> +	 * is not required to be thread-safe (in-tree usx2y registers
> +	 * devices and allocates URBs with non-atomic check-then-act
> +	 * guards), and both would set the same bit.  hw->exclusive only
> +	 * guards open(), not concurrent ioctls on an already-open fd. */
> +	guard(mutex)(&hw->dsp_mutex);
>  	/* check whether the dsp was already loaded */
>  	if (hw->dsp_loaded & (1u << info->index))
>  		return -EBUSY;
> @@ -380,6 +388,7 @@
>  
>  	init_waitqueue_head(&hwdep->open_wait);
>  	mutex_init(&hwdep->open_mutex);
> +	mutex_init(&hwdep->dsp_mutex);
>  	hwdep->card = card;
>  	hwdep->device = device;
>  	if (id)
> diff --git a/include/sound/hwdep.h b/include/sound/hwdep.h
> --- a/include/sound/hwdep.h
> +++ b/include/sound/hwdep.h
> @@ -56,6 +56,8 @@
>  	struct device *dev;
>  
>  	struct mutex open_mutex;
> +	struct mutex dsp_mutex;		/* serializes the DSP_LOAD
> +					 * check-and-load sequence */
>  	int used;			/* reference counter */
>  	unsigned int dsp_loaded;	/* bit fields of loaded dsp indices */
>  	unsigned int exclusive:1;	/* exclusive access mode */
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-22 15:52:51 (星期日)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: sound: core: hwdep DSP_LOAD check-then-act is unlocked, allowing  concurrent DSP_LOAD callbacks (UAF)
> > 
> > snd_hwdep_dsp_load() in sound/core/hwdep.c checks the
> > hw->dsp_loaded bit and then calls hw->ops.dsp_load() without holding a
> > lock.  Two threads that share the same hwdep file descriptor (dup() or
> > fork()) can both pass the check and run the driver's dsp_load callback
> > concurrently; both then set the same bit.  Upstream serializes the whole
> > check-and-load operation with a per-device dsp_mutex, which this tree
> > does not have at all: struct snd_hwdep has no dsp_mutex field,
> > snd_hwdep_new() does not initialize it, and snd_hwdep_dsp_load() has no
> > guard.
> > 
> > The driver callback is not required to be thread-safe.  In-tree, the
> > usx2y driver's snd_usx2y_hwdep_dsp_load() calls usx2y_create_alsa_devices()
> > for index 1; that path registers ALSA devices and initializes URBs, and
> > usx2y_async_seq04_init()/usx2y_in04_init() use a non-atomic
> > WARN_ON(usx2y->as04.buffer) / WARN_ON(usx2y->in04_urb) check-then-act.
> > Concurrent DSP_LOAD can therefore duplicate device registration and
> > allocate/overwrite the same buffer/URB pointers, with double-free or
> > use-after-free consequences in the driver.
> > 
> > I reproduced the unlocked check on Linux 7.3 with a test hwdep device
> > whose dsp_load callback sleeps 300 ms and tracks concurrency.  Four
> > threads sharing one fd issue SNDRV_HWDEP_IOCTL_DSP_LOAD; the log shows
> > active=1,2,3,4 in the callback (max_active=4).  hw->exclusive only
> > guards open(), not concurrent ioctl() on an already-open fd.  This run
> > did not produce a KASAN report because the callback is synthetic; the
> > proven claim is the broken mutual exclusion, with the usx2y consequence
> > argued from code.
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Linux version 7.3.0 (gcc 13.3.0, GNU ld 2.42) #6 SMP PREEMPT_DYNAMIC,
> >   vanilla 7.3 source, KASAN, QEMU/KVM x86_64 (4 vCPU, 4 GB).
> >   CONFIG_SND_HWDEP=y.  Version line in evidence/kernel-version.txt.
> > 
> > * Root cause
> > 
> >   sound/core/hwdep.c:206-222 (snd_hwdep_dsp_load):
> > 
> >     if (hw->dsp_loaded & (1u << index))
> >         return -EBUSY;
> > 
> >     err = hw->ops.dsp_load(hw, &info);
> >     if (err < 0)
> >         return err;
> >     hw->dsp_loaded |= (1u << index);
> > 
> >   No lock covers the test, the callback and the bit update.  Upstream
> >   has guard(mutex)(&hw->dsp_mutex) around this sequence, and struct
> >   snd_hwdep contains dsp_mutex; in this tree the field, the
> >   mutex_init() in snd_hwdep_new() and the guard are all absent.
> > 
> >   The ioctl path sound/core/hwdep.c:236-252 does not take open_mutex
> >   around snd_hwdep_dsp_load(); open_mutex is held only by
> >   snd_hwdep_open() for the exclusive/wait logic.  hw->exclusive is a
> >   one-time open() check, not a per-ioctl lock, and dup()/fork() share
> >   the same struct file and hw->used without re-running open().
> > 
> > * Consequence in usx2y
> > 
> >   sound/usb/usx2y/usX2Yhwdep.c:174-213
> >   (snd_usx2y_hwdep_dsp_load) loads firmware images by index; for
> >   index == 1 it calls usx2y_create_alsa_devices(hw->card), which
> >   registers ALSA devices and starts the USB streams.
> > 
> >   sound/usb/usx2y/usbusx2y.c:267-297 (usx2y_async_seq04_init) and
> >   :299-334 (usx2y_in04_init) allocate buffers/URBs and use
> >   WARN_ON(usx2y->as04.buffer) / WARN_ON(usx2y->in04_urb) as a
> >   check-then-act guard; WARN_ON does not serialize.  Two concurrent
> >   index-1 loads can both allocate and overwrite these fields, and
> >   usx2y_unlinkseq()/cleanup can then double-free or UAF them.
> > 
> > * Trigger model
> > 
> >   - A hwdep device whose DSP load is performed by userspace (usx2y is
> >     the in-tree example);
> >   - a process opens /dev/snd/hwC*D* and dup()s the fd (or forks);
> >   - two threads issue SNDRV_HWDEP_IOCTL_DSP_LOAD concurrently with the
> >     same index;
> >   - both pass the bit check and enter the driver callback.
> > 
> >   No hardware is needed to demonstrate the unlocked check; the attached
> >   test module does it.
> > 
> > * Reproducer (attached) and results on 7.3
> > 
> >   sndcore_hwdep.c creates a card + hwdep device with hw->exclusive = 1
> >   and a dsp_load callback that does:
> >   atomic_inc(&active); update max_active; msleep(300); atomic_dec().
> >   sndcore_test.c opens /dev/snd/hwC0D0 once and lets four pthreads issue
> >   SNDRV_HWDEP_IOCTL_DSP_LOAD on that fd.
> > 
> >   Observed :
> > 
> >     dsp_load enter: index=0 active=1 entered=1 ...
> >     dsp_load enter: index=0 active=2 entered=2 ...
> >     dsp_load enter: index=0 active=3 entered=3 ...
> >     dsp_load enter: index=0 active=4 entered=4 ...
> >     HWDEP: 4 concurrent DSP_LOAD issued
> >     KASAN bug count: 0
> > 
> >   active=4 proves all four callbacks ran concurrently despite the
> >   dsp_loaded check; the absence of KASAN is expected for a synthetic
> >   callback and is stated as such.
> > 
> > 
> > 
> > * Suggested direction 
> > 
> >   Restore the upstream per-device dsp_mutex:
> >   - add struct mutex dsp_mutex to struct snd_hwdep;
> >   - mutex_init(&hwdep->dsp_mutex) in snd_hwdep_new();
> >   - hold it across the dsp_loaded check, hw->ops.dsp_load() and the bit
> >     update in snd_hwdep_dsp_load().
> > 
> >   Please keep me in Cc; I am not subscribed to the lists.
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
