Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B533D4E2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958016; cv=none; b=laeAt4uHrH9sKNCD6FV+oJqwunmFXxNYA/dp6SHEpuMD9g4XlLiRBXaMbpPuc+rId4ysCt8gWPmwJ0bfk+wNsIho3FsFZx8m44pImLBMnz29JNWBJdlL3sEhEcvLGE9ENdQZlAbGxpb20YRdPDid3jQU2EfQssyGgxW9WrlEJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958016; c=relaxed/simple;
	bh=2dYQcA0tNFdWgtvpIHVg6tFSKWIcl6j/CJL8bL6qLTI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rvEwG5oU3VVH2xn8SJ2nMnirWjgMoucbD8X0JrY9WydLH8NdJ/Ve9ZErVbZYnCefeYfxagd76t3UlXW5nzxnvIi8lw2A87QqqHeDxyVFV8Ly1uLl8gXcrN2edwnQtiKHma6hbkAfjqTLqGPZvzlEBOM39Kpd5+Q2jDaOFQnmaas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VlnAMzxo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MuxV94ee; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VlnAMzxo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MuxV94ee; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VlnAMzxo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MuxV94ee";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VlnAMzxo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MuxV94ee"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A6306A845;
	Thu, 23 Apr 2026 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776958011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdgMtivBiTzfoFvxTA8WFnGDvdl/hEo/U3OoIeZ26js=;
	b=VlnAMzxohXJS/adxZgwcz8r3tXVet1+uYCL2vzmTMeI4kG2eGhu7Smkgm8bV5OAAi1cY23
	hGY7Y5nDbNe6lf0OP/tOQyLnGwFyiaFppFOMzZge8GSXs6lMSTUF0oZxKrV+BQDcftUd++
	V1XmtP0RbcOCmRiug2kHfyW+1Kaw/VA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776958011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdgMtivBiTzfoFvxTA8WFnGDvdl/hEo/U3OoIeZ26js=;
	b=MuxV94eev5lL/HWtPqHmQTi1pdNE18Y3QLuZl6XDD7SuoUQa0Mh7jxNXHtrfuZUGjIUN2d
	CBeRj+j5gslpNWCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VlnAMzxo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MuxV94ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776958011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdgMtivBiTzfoFvxTA8WFnGDvdl/hEo/U3OoIeZ26js=;
	b=VlnAMzxohXJS/adxZgwcz8r3tXVet1+uYCL2vzmTMeI4kG2eGhu7Smkgm8bV5OAAi1cY23
	hGY7Y5nDbNe6lf0OP/tOQyLnGwFyiaFppFOMzZge8GSXs6lMSTUF0oZxKrV+BQDcftUd++
	V1XmtP0RbcOCmRiug2kHfyW+1Kaw/VA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776958011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdgMtivBiTzfoFvxTA8WFnGDvdl/hEo/U3OoIeZ26js=;
	b=MuxV94eev5lL/HWtPqHmQTi1pdNE18Y3QLuZl6XDD7SuoUQa0Mh7jxNXHtrfuZUGjIUN2d
	CBeRj+j5gslpNWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2CCD593A3;
	Thu, 23 Apr 2026 15:26:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g0phLjo66mnpJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 23 Apr 2026 15:26:50 +0000
Date: Thu, 23 Apr 2026 17:26:50 +0200
Message-ID: <87a4ut3dfp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	byoungyoung@snu.ac.kr,
	eulgyukim@snu.ac.kr
Subject: Re: [BUG] KASAN: slab-use-after-free in ALSA OSS read/poll race
In-Reply-To: <20260423145330.210035-1-jjy600901@snu.ac.kr>
References: <20260423145330.210035-1-jjy600901@snu.ac.kr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 0A6306A845
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 23 Apr 2026 16:53:30 +0200,
Jaeyoung Chung wrote:
> 
> Hello,
> 
> We found a KASAN slab-use-after-free in the ALSA OSS-compatibility
> layer (sound/core/oss/pcm_oss.c) on Linux v6.19.13. A concurrent
> read() and pselect() on an OSS audio device (/dev/dsp) corrupts the
> packed bit-flags in struct snd_pcm_oss_runtime and ends up freeing a
> buffer while another thread is still writing into it.
> 
> # Summary
> 
> struct snd_pcm_oss_runtime packs four flags into one storage word:
> 
>     /* include/sound/pcm_oss.h */
>     unsigned params: 1,			/* format/parameter change */
>       prepare: 1,			/* need to prepare the operation */
>       trigger: 1,			/* trigger flag */
>       sync_trigger: 1;		/* sync trigger flag */
> 
> Every writer of these flags holds runtime->oss.params_lock EXCEPT
> snd_pcm_oss_poll(), which clears runtime->oss.trigger unlocked. The
> resulting byte-level RMW race lets poll()'s stale store clobber the
> params=0 store done by snd_pcm_oss_change_params_locked(), so
> runtime->oss.params stays 1. The next snd_pcm_oss_make_ready() then
> re-enters change_params_locked() and runs snd_pcm_oss_plugin_clear()
> while a concurrent snd_pcm_oss_read3() is mid-transfer, freeing the
> plugin chain and buffer that __snd_pcm_lib_xfer() is copying into.
> 
> # Environment
> 
> - Kernel:  Linux v6.19.13
> - Arch:    x86_64
> - Relevant config:
>     CONFIG_SOUND=y
>     CONFIG_SND=y
>     CONFIG_SND_PCM=y
>     CONFIG_SND_OSSEMUL=y
>     CONFIG_SND_PCM_OSS=y
>     CONFIG_SND_PCM_OSS_PLUGINS=y
>     CONFIG_SND_ALOOP=y
>     CONFIG_KASAN=y
> - Device:  /dev/dsp backed by snd-aloop (ALSA loopback).
>            This is the only card I verified the crash on; with
>            CONFIG_SND_ALOOP=y and no other sound card, /proc/asound/cards
>            reports:
>              0 [Loopback       ]: Loopback - Loopback
>                                   Loopback 1
>            Whether other OSS-capable cards are affected has not been
>            tested.
> 
> # Thread interleaving
> 
> Shared byte B = params | prepare | trigger | sync_trigger.
> Initial: params=1, trigger=1  =>  B = 0b0101 = 0x05.
> 
>   CPU 0: read() thread                         CPU 1: pselect() thread
>   ====================                         =======================
>   snd_pcm_oss_read -> read1
>     mutex_lock(params_lock)
>     snd_pcm_oss_make_ready_locked
>       snd_pcm_oss_change_params_locked
>         plugin->buf = kvzalloc(size, GFP_KERNEL);
>                                                 snd_pcm_oss_poll
>                                                 // runtime->oss.trigger = 0;
>                                                  reg = READ(B)        ; reg = 0x05
>                                                  /* mdelay(100) */
>         // runtime->oss.params = 0;
>         RMW B: params  = 0  ; B := 0x04
> 	      // runtime->oss.prepare = 1;
>         RMW B: prepare = 1  ; B := 0x06
>     snd_pcm_oss_read2
>       snd_pcm_plug_read_transfer
>         snd_pcm_oss_read3
>           mutex_unlock(params_lock)
>           /* mdelay(1000) */
>                                                      reg &= ~0x4        ; reg = 0x01
>                                                      WRITE(B, reg)      ; B := 0x01
>                                                      /* clobbers A's (params=0,
>                                                         prepare=1): params is 1 again */
>                                                      snd_pcm_oss_set_trigger(.., PCM_ENABLE_INPUT)
>                                                        snd_pcm_oss_make_ready(csubstream)
>                                                          /* oss.params == 1 (stale) */
>                                                          snd_pcm_oss_change_params
>                                                            mutex_lock(params_lock)
>                                                            change_params_locked:
>                                                              snd_pcm_oss_plugin_clear
>                                                                kvfree(plugin->buf);
>                                                            mutex_unlock(params_lock)
>           __snd_pcm_lib_xfer
>             default_read_copy
>               copy_to_iter
>                 memcpy(<freed buffer>, ...)    <-- USE-AFTER-FREE (write)
> 
> # Included items
> 
> 1. C reproducer
> 2. Kernel delay patch (for deterministic triggering only; not the fix)
> 3. KASAN crash log
> 4. Proposed fix
> 
> -----------------------------------------------------------------------
> 1. C reproducer
> -----------------------------------------------------------------------
> Build: gcc -static -pthread -o race race.c
> Run:   ./race                  # uses /dev/dsp by default
> 
> // -- begin race.c --
> // gcc -static -o race race.c -lpthread
> #define _GNU_SOURCE
> #include <err.h>
> #include <fcntl.h>
> #include <pthread.h>
> #include <sched.h>
> #include <stdio.h>
> #include <string.h>
> #include <sys/select.h>
> #include <time.h>
> #include <unistd.h>
> 
> #define SYSCHK(x) \
>   ({ \
>     typeof(x) __res = (x); \
>     if (__res == (typeof(x))-1) \
>       err(1, "SYSCHK(" #x ")"); \
>     __res; \
>   })
> 
> #define DSP_PATH "/dev/dsp"
> int dsp_fd, ready = 0;
> 
> void pin_to_cpu(int cpu) {
>   cpu_set_t cset;
>   CPU_ZERO(&cset);
>   CPU_SET(cpu, &cset);
>   SYSCHK(sched_setaffinity(0, sizeof(cset), &cset));
> }
> 
> static void *poll_thread(void *arg) {
>   fd_set rfds;
>   struct timespec timeout = {.tv_sec = 30};
> 
>   pin_to_cpu(0);
>   FD_ZERO(&rfds);
>   FD_SET(dsp_fd, &rfds);
>   printf("[begin] pselect\n");
>   while (!ready) {
> 	sched_yield();
>   }
>   int ret = pselect(dsp_fd + 1, &rfds, NULL, NULL, &timeout, NULL);
>   printf("[end] pselect = %d\n", ret);
> 
>   return NULL;
> }
> 
> static void *read_thread(void *arg) {
>   unsigned char buf[1] = {0};
> 
>   pin_to_cpu(1);
>   printf("[begin] read\n");
>   ready = 1;
>   sched_yield();
>   ssize_t ret = read(dsp_fd, buf, sizeof(buf));
>   printf("[end] read = %zd\n", ret);
> 
>   return NULL;
> }
> 
> int main(int argc, char **argv) {
>   const char *path = (argc > 1) ? argv[1] : DSP_PATH;
>   pthread_t t1, t2;
> 
>   pin_to_cpu(0);
> 
>   dsp_fd = SYSCHK(open(path, O_RDONLY));
> 
>   pthread_create(&t1, NULL, poll_thread, NULL);
>   pthread_create(&t2, NULL, read_thread, NULL);
> 
>   pthread_join(t1, NULL);
>   pthread_join(t2, NULL);
> 
>   close(dsp_fd);
>   return 0;
> }
> // -- end race.c --
> 
> -----------------------------------------------------------------------
> 2. Kernel delay patch (to make the race deterministic)
> -----------------------------------------------------------------------
> This is NOT the fix. It only widens two windows:
>   (a) In snd_pcm_oss_poll(), split "trigger = 0" into an explicit
>       READ / mdelay(100) / MODIFY / WRITE on the underlying byte, to
>       emulate and stretch the compiler-emitted byte RMW.
>   (b) In snd_pcm_oss_read3(), insert mdelay(1000) between
>       mutex_unlock() and __snd_pcm_lib_xfer() so the plugin chain is
>       still in use while the racing free happens.
> 
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index 3bc94d34b..f7a176444 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -29,6 +29,7 @@
>  #include <linux/soundcard.h>
>  #include <sound/initval.h>
>  #include <sound/mixer_oss.h>
> +#include <linux/delay.h>
>  
>  #define OSS_ALSAEMULVER		_SIOR ('M', 249, int)
>  
> @@ -1281,6 +1282,8 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
>  		if (ret < 0)
>  			break;
>  		mutex_unlock(&runtime->oss.params_lock);
> +		pr_info("mdelay before __snd_pcm_lib_xfer\n");
> +		mdelay(1000);
>  		ret = __snd_pcm_lib_xfer(substream, (void *)ptr, true,
>  					 frames, in_kernel);
>  		mutex_lock(&runtime->oss.params_lock);
> @@ -2862,7 +2865,13 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
>  			struct snd_pcm_oss_file ofile;
>  			memset(&ofile, 0, sizeof(ofile));
>  			ofile.streams[SNDRV_PCM_STREAM_CAPTURE] = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
> -			runtime->oss.trigger = 0;
> +			// runtime->oss.trigger = 0;
> +			u8 *p = (u8 *)&runtime->oss;
> +			u8 v = READ_ONCE(*p);
> +			pr_info("delay between bitfield RMW\n");
> +			mdelay(100);
> +			v &= ~0x4;
> +			WRITE_ONCE(*p, v);
>  			snd_pcm_oss_set_trigger(&ofile, PCM_ENABLE_INPUT);
>  		}
>  	}
> 
> -----------------------------------------------------------------------
> 3. KASAN crash log
> -----------------------------------------------------------------------
> BUG: KASAN: slab-use-after-free in memcpy_to_iter lib/iov_iter.c:77 [inline]
> BUG: KASAN: slab-use-after-free in iterate_kvec include/linux/iov_iter.h:86 [inline]
> BUG: KASAN: slab-use-after-free in iterate_and_advance2 include/linux/iov_iter.h:308 [inline]
> BUG: KASAN: slab-use-after-free in iterate_and_advance include/linux/iov_iter.h:330 [inline]
> BUG: KASAN: slab-use-after-free in _copy_to_iter+0xa10/0x1480 lib/iov_iter.c:197
> Write of size 8192 at addr ff11000013ff4000 by task race/350
> CPU: 1 UID: 0 PID: 350 Comm: race Not tainted 6.19.13-dirty #14 NONE
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x8f/0xc0 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0xd0/0x270 mm/kasan/report.c:482
>  kasan_report+0x118/0x150 mm/kasan/report.c:595
>  check_region_inline mm/kasan/generic.c:-1 [inline]
>  kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:200
>  __asan_memcpy+0x40/0x70 mm/kasan/shadow.c:106
>  memcpy_to_iter lib/iov_iter.c:77 [inline]
>  iterate_kvec include/linux/iov_iter.h:86 [inline]
>  iterate_and_advance2 include/linux/iov_iter.h:308 [inline]
>  iterate_and_advance include/linux/iov_iter.h:330 [inline]
>  _copy_to_iter+0xa10/0x1480 lib/iov_iter.c:197
>  copy_to_iter include/linux/uio.h:220 [inline]
>  default_read_copy+0x11f/0x1b0 sound/core/pcm_lib.c:2092
>  do_transfer sound/core/pcm_lib.c:-1 [inline]
>  interleaved_copy+0x191/0x200 sound/core/pcm_lib.c:2141
>  __snd_pcm_lib_xfer+0x1165/0x1890 sound/core/pcm_lib.c:2380
>  snd_pcm_oss_read3+0x2ca/0x410 sound/core/oss/pcm_oss.c:1286
>  snd_pcm_plug_read_transfer+0x259/0x2f0 sound/core/oss/pcm_plugin.c:663
>  snd_pcm_oss_read2+0x1c7/0x3b0 sound/core/oss/pcm_oss.c:1487
>  snd_pcm_oss_read1 sound/core/oss/pcm_oss.c:1525 [inline]
>  snd_pcm_oss_read+0x3d0/0x7b0 sound/core/oss/pcm_oss.c:2778
>  vfs_read+0x15b/0x8a0 fs/read_write.c:570
>  ksys_read+0xca/0x190 fs/read_write.c:715
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x6e/0x6a0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7bdf3b94d2dc
> Code: ec 28 48 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 59 d5 f8 ff 48 8b 54 24 18 48 8b 74 248
> RSP: 002b:00007bdf3b04fe70 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 00007bdf3b0506c0 RCX: 00007bdf3b94d2dc
> RDX: 0000000000000001 RSI: 00007bdf3b04fec7 RDI: 0000000000000003
> RBP: 00007bdf3b04fed0 R08: 0000000000000000 R09: 00007ffe6810a877
> R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffff80
> R13: 0000000000000000 R14: 00007ffe6810a780 R15: 00007bdf3a850000
>  </TASK>
> Allocated by task 350:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>  __kasan_kmalloc+0x72/0x90 mm/kasan/common.c:415
>  kasan_kmalloc include/linux/kasan.h:263 [inline]
>  __do_kmalloc_node mm/slub.c:5754 [inline]
>  __kvmalloc_node_noprof+0x3a3/0x710 mm/slub.c:7261
>  snd_pcm_plugin_alloc+0x183/0x700 sound/core/oss/pcm_plugin.c:74
>  snd_pcm_plug_alloc+0x14a/0x270 sound/core/oss/pcm_plugin.c:133
>  snd_pcm_oss_change_params_locked+0x2190/0x3440 sound/core/oss/pcm_oss.c:1043
>  snd_pcm_oss_make_ready_locked sound/core/oss/pcm_oss.c:1191 [inline]
>  snd_pcm_oss_read1 sound/core/oss/pcm_oss.c:1520 [inline]
>  snd_pcm_oss_read+0x247/0x7b0 sound/core/oss/pcm_oss.c:2778
>  vfs_read+0x15b/0x8a0 fs/read_write.c:570
>  ksys_read+0xca/0x190 fs/read_write.c:715
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x6e/0x6a0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Freed by task 349:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:253 [inline]
>  __kasan_slab_free+0x3a/0x60 mm/kasan/common.c:285
>  kasan_slab_free include/linux/kasan.h:235 [inline]
>  slab_free_hook mm/slub.c:2580 [inline]
>  slab_free mm/slub.c:6791 [inline]
>  kfree+0x169/0x3f0 mm/slub.c:7003
>  snd_pcm_plugin_free+0xb2/0xd0 sound/core/oss/pcm_plugin.c:198
>  snd_pcm_oss_plugin_clear sound/core/oss/pcm_oss.c:541 [inline]
>  snd_pcm_oss_change_params_locked+0x1bd5/0x3440 sound/core/oss/pcm_oss.c:974
>  snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1109 [inline]
>  snd_pcm_oss_make_ready+0xdf/0x270 sound/core/oss/pcm_oss.c:1168
>  snd_pcm_oss_set_trigger+0x87/0x6c0 sound/core/oss/pcm_oss.c:2083
>  snd_pcm_oss_poll+0x739/0x870 sound/core/oss/pcm_oss.c:2873
>  vfs_poll include/linux/poll.h:82 [inline]
>  select_poll_one fs/select.c:480 [inline]
>  do_select+0xbdb/0x11c0 fs/select.c:536
>  core_sys_select+0x4dc/0x720 fs/select.c:677
>  do_pselect fs/select.c:759 [inline]
>  __do_sys_pselect6 fs/select.c:798 [inline]
>  __se_sys_pselect6+0x18d/0x1f0 fs/select.c:789
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x6e/0x6a0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> The buggy address belongs to the object at ff11000013ff4000
>  which belongs to the cache kmalloc-8k of size 8192
> The buggy address is located 0 bytes inside of
>  freed 8192-byte region [ff11000013ff4000, ff11000013ff6000)
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x13ff0
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x100000000000040(head|node=0|zone=1)
> page_type: f5(slab)
> raw: 0100000000000040 ff1100000ac38280 ffd40000004ffa00 0000000000000006
> raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
> head: 0100000000000040 ff1100000ac38280 ffd40000004ffa00 0000000000000006
> head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
> head: 0100000000000003 ffd40000004ffc01 00000000ffffffff 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
> page dumped because: kasan: bad access detected
> Memory state around the buggy address:
>  ff11000013ff3f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ff11000013ff3f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ff11000013ff4000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                    ^
>  ff11000013ff4080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ff11000013ff4100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> -----------------------------------------------------------------------
> 4. Proposed fix
> -----------------------------------------------------------------------
> Split the four packed bit-flags into independent bytes so they no
> longer share a storage word. Writes to one flag can then no longer
> corrupt the others regardless of locking.
> 
> Another possible fix direction may be to take `runtime->oss.params_lock` 
> in the poll path before touching `runtime->oss.trigger`, 
> since `snd_pcm_oss_poll()` appears to be the only writer 
> of these flags that currently does not use that mutex.
> 
> Because we found this through fuzzing and do not know the subsystem
> well, I am not confident that the patch below is the best fix. It is
> just the smallest change that seemed reasonable from code inspection.
> 
> diff --git a/include/sound/pcm_oss.h b/include/sound/pcm_oss.h
> --- a/include/sound/pcm_oss.h
> +++ b/include/sound/pcm_oss.h
> @@ -22,10 +22,10 @@ struct snd_pcm_oss_setup {
>  };
>  
>  struct snd_pcm_oss_runtime {
> -	unsigned params: 1,			/* format/parameter change */
> -		 prepare: 1,			/* need to prepare the operation */
> -		 trigger: 1,			/* trigger flag */
> -		 sync_trigger: 1;		/* sync trigger flag */
> +	unsigned char params;			/* format/parameter change */
> +	unsigned char prepare;			/* need to prepare the operation */
> +	unsigned char trigger;			/* trigger flag */
> +	unsigned char sync_trigger;		/* sync trigger flag */
>  	int rate;				/* requested rate */
>  	int format;				/* requested OSS format */
>  	unsigned int channels;			/* requested channels */

Thanks for the report.  I see the point, and IMO, a better fix is to
protect runtime->oss.trigger access with the mutex.  We can change the
bit fields to bool as a separate patch, but it shouldn't be considered
as an ad hoc fix.

Could you submit a proper patch after verifying that it fixes your
fuzzer?


thanks,

Takashi
