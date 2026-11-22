Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334830;
	b=lxP3f/oJFbt06Azu8JEzyV1VhSV7CppOVIyAioHfd8rAEI7Rk63ru8GIplS1oDjuUaGa
	 4SFDWE7ISYuxCNDrUhdnOOZhdVxJJtocIIBIQMUmOqLpSi/rB//iSfqEhlOzBPVL6WRTC
	 hon37ePLCxxjguZSYsWD6piNeAGoTpz4t9oFoiyiQsHEAHx+Ecl6TwZxhvUmgCMX4hDE4
	 63P+MdfDoEK2rnZSbe01datYJ246cZWv4d9dFS2BKActC438m5+0oNXpC0lrLPsIB3OrK
	 MMzuCKmQZKPpAOiur9K1JsBYN6965otpGieSawPi8NUAd/6Tx0f/Xd6qFujwiiPpxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334830;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=YgT+l1gFFgRwaT4vkXLAix5P1u3AdcNNJdCLDNqHlg0=;
	b=AHw0aELZEDiWyRk5otCUhiTl32R3WrO7W0scWz4DIEsX334IDXAGBS5mdbiBGVyd7kNS
	 3Bed3zSMtXNWrNcSEiLJZfAmfZvatilJtdFIWFVlnnYjFkdTxL85DSl8bUQ0muEUSKeWp
	 uGyH1C9cTIfAiBGyAwHiMaquSmCwDyg6RsF3cJiEPl68OsXhHAmt7lLggaP63buPESSy8
	 UMJgJEb41RwIt7wm2Cq3x1mICLq3fyYzGBgTOsqH6OOXeqjg8VNT/gSKjpGpy+80Q+tNF
	 C5YIAPqaGNEq7Y4Hor0BO3KjfAWcsQd9t8U9q5IZ65vMhGMslUVK0GLuXTw937Wh5hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SsgxgSS2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6QsuUU8v;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cw4lMTZZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qa3MBmAS;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0B606A320;
	Sun, 22 Nov 2026 08:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B0B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SsgxgSS2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6QsuUU8v;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cw4lMTZZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qa3MBmAS
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E4793222F5;
	Sun, 22 Nov 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795334822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgT+l1gFFgRwaT4vkXLAix5P1u3AdcNNJdCLDNqHlg0=;
	b=SsgxgSS2qTy3dAuXMwlT0T6eHFyGA7NLSmDXEPJOy5LGiRZIz96U/dGNbUXdcdjidzPWp0
	XyUXkqRo8UQGaIJO4pBzayVnTSD1Q5AZraxH1bt6zfWv5w/PhV6xP5Sk/DNKPBS0700yCw
	Kj1EqY2T3YLLLHbOSC9zQWDhD5ykWBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795334822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgT+l1gFFgRwaT4vkXLAix5P1u3AdcNNJdCLDNqHlg0=;
	b=6QsuUU8v1hnua5TRwvNfnSA1uDQVQ5wY1mX2h6OI5mOIjE3gXHF2xdoU6jsmYHkEMgranC
	qRz/veZ5K/2QQJDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795334821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgT+l1gFFgRwaT4vkXLAix5P1u3AdcNNJdCLDNqHlg0=;
	b=Cw4lMTZZ062dZlqVCCKLM50hiBWK+OGr0jjNMbYbaWrFlEnsAc9bYpH4/h073USCcfzUXs
	3zTCNCFywztRV6SBpdCf0zrjXkzsgZUeOKnGXbsYQNd/4rr1ZZisZdDyYJLUTYUSA+YyKn
	xClYDm2VZrLv9hDZ1VceuX5BAy2HxxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795334821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgT+l1gFFgRwaT4vkXLAix5P1u3AdcNNJdCLDNqHlg0=;
	b=qa3MBmAS1j34FFcIBUDmwD3znfJE35uAsJwmjZ3GfWH2WQf+OMUaE1ZUQHN+YxGvBQQgtd
	ta5nVcYvheO1sdDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60E7F1342D;
	Sun, 22 Nov 2026 08:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 13GfDKWiAmtQXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 08:07:01 +0000
Date: Sun, 22 Nov 2026 09:07:00 +0100
Message-ID: <87bj7h70ij.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: Re: sound: core: compress offload fd does not pin card or module, so  card removal leaves a live fd pointing at freed snd_compr (KASAN UAF)
In-Reply-To: <60230a17.2ad11.1a20235d54e.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<60230a17.2ad11.1a20235d54e.Coremail.xuhx@hust.edu.cn>
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
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 22 Nov 2026 08:43:32 +0100,
ÐìêÏÏè wrote:
> 
> snd_compr_open() opens /dev/snd/comprC*D* without adding the file to
> card->files_list, without taking a persistent card device reference and
> without taking a module reference; it even drops the lookup reference
> with snd_card_unref() before returning.  The ASoC card can therefore be
> unbound and freed while the compress fd is still open, after which
> ioctl/read/write/poll/close dereference freed struct snd_compr and
> snd_soc_pcm_runtime objects.  I reproduced this on a Linux 7.3 KASAN
> kernel with a small test module: open the compress device, call
> snd_card_free(), then issue ioctl() on the stale fd; the ioctl entry
> already reports slab-use-after-free in mutex_lock(&stream->device->lock)
> inside snd_compr_ioctl().
> 
> This is not a theoretical lost-reference issue.  The upstream compress
> offload code has an explicit open-file lifetime: snd_card_file_add() plus
> try_module_get() at open, a data->list node linked into compr->open_list,
> list_del_init() + module_put() + snd_card_file_remove() at free, and a
> dev_disconnect callback that walks open_list, stops RUNNING/DRAINING/
> PAUSED streams, sets SNDRV_PCM_STATE_DISCONNECTED and wakes waiters.
> The current tree removed all of it at the structure level: struct
> snd_compr_file no longer has a list node and struct snd_compr no longer
> has open_list.  Consequently snd_card_disconnect_sync(), which waits for
> card->files_list to drain, returns immediately with the compress fd still
> open, and the subsequent snd_soc_remove_pcm_runtime() / snd_card_free()
> frees the objects the fd still points to.
> 
> The detailed description:
> 
> * Test environment / affected version
> 
>   Linux version 7.3.0 (gcc 13.3.0, GNU ld 2.42) #6 SMP PREEMPT_DYNAMIC,
>   vanilla 7.3 source tree with KASAN and QEMU/KVM x86_64 (4 vCPU, 4 GB).
>   The only build-time changes were temporary Kconfig prompts to build
>   snd-compress.ko and snd-rawmidi.ko as modules; no functional source
>   change was made for this case.  The exact version line is in
>   evidence/kernel-version.txt.
> 
> * Root cause and object lifetime
> 
>   The open path, sound/core/compress_offload.c:75-143, does only:
> 
>     compr = snd_lookup_minor_data(iminor(inode), SNDRV_DEVICE_TYPE_COMPRESS);
>     ...
>     data = kzalloc_obj(*data);
>     runtime = kzalloc_obj(*runtime);
>     data->stream.device = compr;
>     f->private_data = data;
>     scoped_guard(mutex, &compr->lock)
>         ret = compr->ops->open(&data->stream);
>     snd_card_unref(compr->card);
> 
>   There is no snd_card_file_add(compr->card, f), no
>   try_module_get(compr->card->module), and no list_add_tail() into an
>   open list.  The structure definitions were changed too:
>   sound/core/compress_offload.c:44-49 has
> 
>     struct snd_compr_file {
>         unsigned long caps;
>         struct snd_compr_stream stream;
>     };
> 
>   while include/sound/compress_driver.h:194-210 has no open_list member
>   in struct snd_compr.
> 
>   The free path, sound/core/compress_offload.c:145-170, calls
>   cancel_delayed_work_sync(), optionally trigger(STOP), task-free,
>   ops->free() and kfree() -- but no list_del_init(), no module_put() and
>   no snd_card_file_remove().
> 
>   The disconnect callback, sound/core/compress_offload.c:1432-1447, is
>   only:
> 
>     compr = device->device_data;
>     snd_unregister_device(compr->dev);
>     return 0;
> 
>   It does not walk open streams, does not stop them, does not set
>   SNDRV_PCM_STATE_DISCONNECTED and does not wake poll/read waiters.
> 
>   Upstream by contrast has all of these: snd_card_file_add() and
>   try_module_get() in snd_compr_open(), data->list linked into
>   compr->open_list, matching list_del_init()/module_put()/
>   snd_card_file_remove() in snd_compr_free(), and a dev_disconnect that
>   takes compr->lock, stops active streams and sets DISCONNECTED.
> 
> * Why card removal reaches the freed objects
> 
>   The ASoC cleanup order is in sound/soc/soc-core.c:1944-1981:
>   soc_cleanup_card_resources() calls snd_card_disconnect_sync() first,
>   then for_each_card_rtds_safe() -> snd_soc_remove_pcm_runtime(), then
>   snd_soc_card_remove(), then snd_card_free().  snd_card_disconnect_sync()
>   (sound/core/init.c:571-582) waits under files_lock for files_list to
>   become empty.  A compress fd is not in files_list, so this wait is a
>   no-op for it.  snd_soc_remove_pcm_runtime() then releases rtd via
>   device_unregister(rtd->dev), while the fd still has
>   data->stream.device = compr and data->stream.private_data = rtd.
>   snd_compr_ioctl(), snd_compr_read(), snd_compr_write() and
>   snd_compr_poll() all begin with
>   guard(mutex)(&stream->device->lock), i.e. they lock a mutex inside
>   freed struct snd_compr before looking at stream->runtime.
> 
> * Trigger model
> 
>   - A compress offload device must exist (real ASoC compress driver, or
>     the attached test module);
>   - a user with access to /dev/snd/comprC*D* opens it;
>   - the card is removed/unbound (driver unbind, card unregister, module
>     unload, or the test module's free parameter);
>   - the same fd is used again (ioctl/read/write/poll) or closed.
> 
>   The card-removal step normally needs a privileged action, but the fd
>   and the removal can belong to different processes and the kernel must
>   not free objects that an open file still references.  No hardware is
>   required for the reproducer.
> 
> * Reproducer (attached: sndcore_compress.c, sndcore_test.c) and results on 7.3
> 
>   sndcore_compress.c registers one card with one compress device and a
>   minimal struct snd_compr_ops; the card private_free function kfree()s
>   the struct snd_compr, matching ASoC's devm_kzalloc lifetime.  The
>   userspace program sndcore_test.c opens /dev/snd/comprC0D0, writes the
>   module's "free" parameter to call snd_card_free(), then calls ioctl()
>   on the stale fd.
> 
>   Observed (evidence/mr03-kasan-uaf.log):
> 
>     free: calling snd_card_free(...)
>     BUG: KASAN: slab-use-after-free in mutex_lock+0x72/0xe0
>     Write of size 8 at addr ... by task sndcore_test/88
>     Call Trace:
>      mutex_lock+0x72/0xe0
>      snd_compr_ioctl+0xd2/0xff0 [snd_compress]
>      ...
>     BUG: KASAN: slab-use-after-free in mutex_unlock+0x6c/0xd0
>      snd_compr_ioctl+0x1d3/0xff0 [snd_compress]
>     KASAN bug count: 2
> 
>   The bug count is the number of KASAN reports collected in that run;
>   the first report is the mutex_lock() inside the ioctl entry.
> 
> 
> 
> * Suggested direction 
> 
>   Restore the upstream lifetime in one series:
>   - snd_compr_open(): snd_card_file_add(), try_module_get(), link
>     data->list into compr->open_list;
>   - snd_compr_free(): list_del_init(), module_put() and
>     snd_card_file_remove(), with the error paths undoing in reverse;
>   - snd_compress_dev_disconnect(): walk compr->open_list under
>     compr->lock, STOP RUNNING/DRAINING/PAUSED streams, set
>     SNDRV_PCM_STATE_DISCONNECTED and wake waiters;
>   - restore struct snd_compr_file.list and struct snd_compr.open_list.
> 
> 
>   Please keep me in Cc; I am not subscribed to the lists.
> 
> Regards,
> Hanxiang Xu
> xuhx@hust.edu.cn
> // SPDX-License-Identifier: GPL-2.0
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <fcntl.h>
> #include <unistd.h>
> #include <errno.h>
> #include <pthread.h>
> #include <sys/ioctl.h>
> #include <sound/asound.h>
> 
> static int write_free(const char *mod)
> {
> 	char path[256];
> 	int fd;
> 
> 	snprintf(path, sizeof(path), "/sys/module/%s/parameters/free", mod);
> 	fd = open(path, O_WRONLY);
> 	if (fd < 0) {
> 		fprintf(stderr, "open %s: %s\n", path, strerror(errno));
> 		return -1;
> 	}
> 	if (write(fd, "1\n", 2) != 2)
> 		fprintf(stderr, "write %s: %s\n", path, strerror(errno));
> 	close(fd);
> 	return 0;
> }
> 
> static int do_hwdep(void)
> {
> 	struct snd_hwdep_dsp_image img;
> 	int fd;
> 
> 	fd = open("/dev/snd/hwC0D0", O_RDWR);
> 	if (fd < 0) {
> 		fprintf(stderr, "open hwdep: %s\n", strerror(errno));
> 		return 1;
> 	}
> 	memset(&img, 0, sizeof(img));
> 	img.index = 0;
> 	img.length = 0;
> 	img.image = 0;
> 	for (int i = 0; i < 4; i++) {
> 		if (ioctl(fd, SNDRV_HWDEP_IOCTL_DSP_LOAD, &img) < 0)
> 			fprintf(stderr, "ioctl dsp_load: %s\n", strerror(errno));
> 	}
> 	close(fd);
> 	printf("HWDEP: ioctl done (max_active should be >= 2)\n");
> 	sleep(1);
> 	return 0;
> }
> 
> static void *hwdep_thread(void *arg)
> {
> 	int fd = *(int *)arg;
> 	struct snd_hwdep_dsp_image img;
> 
> 	memset(&img, 0, sizeof(img));
> 	img.index = 0;
> 	ioctl(fd, SNDRV_HWDEP_IOCTL_DSP_LOAD, &img);
> 	return NULL;
> }
> 
> static int do_hwdep_race(void)
> {
> 	pthread_t th[4];
> 	int fd;
> 
> 	fd = open("/dev/snd/hwC0D0", O_RDWR);
> 	if (fd < 0) {
> 		fprintf(stderr, "open hwdep: %s\n", strerror(errno));
> 		return 1;
> 	}
> 	for (int i = 0; i < 4; i++)
> 		pthread_create(&th[i], NULL, hwdep_thread, &fd);
> 	for (int i = 0; i < 4; i++)
> 		pthread_join(th[i], NULL);
> 	close(fd);
> 	printf("HWDEP: 4 concurrent DSP_LOAD issued\n");
> 	sleep(1);
> 	return 0;
> }
> 
> static int do_compress(void)
> {
> 	int fd;
> 
> 	fd = open("/dev/snd/comprC0D0", O_WRONLY);
> 	if (fd < 0) {
> 		fprintf(stderr, "open compress: %s\n", strerror(errno));
> 		return 1;
> 	}
> 	printf("COMPRESS: fd open, freeing card\n");
> 	write_free("sndcore_compress");
> 	printf("COMPRESS: card free returned, issuing ioctl on stale fd\n");
> 	if (ioctl(fd, 0x4300, 0) < 0)
> 		fprintf(stderr, "ioctl stale fd: %s\n", strerror(errno));
> 	printf("COMPRESS: ioctl returned without KASAN report\n");
> 	close(fd);
> 	sleep(1);
> 	return 0;
> }
> 
> static int do_rawmidi(void)
> {
> 	int fd;
> 
> 	fd = open("/dev/snd/midiC0D0", O_RDONLY);
> 	if (fd < 0) {
> 		fprintf(stderr, "open rawmidi: %s\n", strerror(errno));
> 		return 1;
> 	}
> 	printf("RAWMIDI: fd open, letting flood thread run\n");
> 	sleep(2);
> 	printf("RAWMIDI: closing (trigger/cancel/free window)\n");
> 	close(fd);
> 	sleep(3);
> 	printf("RAWMIDI: close returned, freeing card\n");
> 	write_free("sndcore_rawmidi");
> 	sleep(1);
> 	return 0;
> }
> 
> int main(int argc, char **argv)
> {
> 	if (argc < 2) {
> 		fprintf(stderr, "usage: %s jackfree|compress|rawmidi|hwdep|hwdep-race\n", argv[0]);
> 		return 2;
> 	}
> 	if (!strcmp(argv[1], "jackfree"))
> 		return write_free("sndcore_jack");
> 	if (!strcmp(argv[1], "compress"))
> 		return do_compress();
> 	if (!strcmp(argv[1], "rawmidi"))
> 		return do_rawmidi();
> 	if (!strcmp(argv[1], "hwdep"))
> 		return do_hwdep();
> 	if (!strcmp(argv[1], "hwdep-race"))
> 		return do_hwdep_race();
> 	fprintf(stderr, "unknown mode %s\n", argv[1]);
> 	return 2;
> }
> 
> // SPDX-License-Identifier: GPL-2.0
> #include <linux/module.h>
> #include <linux/kernel.h>
> #include <linux/slab.h>
> #include <sound/core.h>
> #include <sound/compress_driver.h>
> #include "sndcore_parent.h"
> 
> static struct snd_card *card;
> static struct snd_compr *compr;
> 
> static int c_open(struct snd_compr_stream *stream) { return 0; }
> static int c_free(struct snd_compr_stream *stream) { return 0; }
> static int c_trigger(struct snd_compr_stream *stream, int cmd) { return 0; }
> 
> static struct snd_compr_ops compr_ops = {
> 	.open = c_open,
> 	.free = c_free,
> 	.trigger = c_trigger,
> };
> 
> static int free_set(const char *val, const struct kernel_param *kp)
> {
> 	if (card) {
> 		pr_info("free: calling snd_card_free(%p)\n", card);
> 		snd_card_free(card);
> 		card = NULL;
> 	}
> 	return 0;
> }
> static const struct kernel_param_ops free_ops = { .set = free_set };
> module_param_cb(free, &free_ops, NULL, 0200);
> 
> static void card_private_free(struct snd_card *c)
> {
> 	pr_info("card private_free: kfree(compr=%p)\n", compr);
> 	kfree(compr);
> 	compr = NULL;
> }
> 
> static int __init sndcore_compress_init(void)
> {
> 	int err;
> 
> 	err = sndcore_card_new(&card, "sndcore_compress");
> 	if (err < 0)
> 		return err;
> 
> 	compr = kzalloc(sizeof(*compr), GFP_KERNEL);
> 	if (!compr) {
> 		snd_card_free(card);
> 		card = NULL;
> 		sndcore_parent_put();
> 		return -ENOMEM;
> 	}
> 	compr->ops = &compr_ops;
> 	card->private_free = card_private_free;
> 
> 	err = snd_compress_new(card, 0, SND_COMPRESS_PLAYBACK, "sndcore", compr);
> 	if (err < 0) {
> 		kfree(compr);
> 		compr = NULL;
> 		snd_card_free(card);
> 		card = NULL;
> 		sndcore_parent_put();
> 		return err;
> 	}
> 	err = snd_card_register(card);
> 	if (err < 0) {
> 		snd_card_free(card);
> 		card = NULL;
> 		sndcore_parent_put();
> 		return err;
> 	}
> 	pr_info("compress card registered\n");
> 	return 0;
> }
> 
> static void __exit sndcore_compress_exit(void)
> {
> 	if (card) {
> 		snd_card_free(card);
> 		card = NULL;
> 	}
> 	sndcore_parent_put();
> }
> 
> module_init(sndcore_compress_init);
> module_exit(sndcore_compress_exit);
> MODULE_LICENSE("GPL");
> MODULE_DESCRIPTION("sound/core MR-03 compress open_list verifier");

Thanks for the report.

But, as I already requested in your previous reports, could you rather
submit a fix patch along with the report?  I suppose you're working
with AI, so it's just a matter of asking it to the model.


Takashi
