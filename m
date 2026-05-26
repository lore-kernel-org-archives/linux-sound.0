Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6005C3E0750
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802572; cv=none; b=bdwP6qW5D1oet5XEvQzPKsK/A8OrhblpizZggYn88B+Gf3zUzWGnpd6ndOU7vyDU/o9NZCT/oKSn/ss2ajI14UN/iMxlY0v1425oUKhHT2/BlQQub7BtK8R1aKHly7Hka+Kdx3g81sRREMMDZOg7KQLV1xKEXCFCl1xQtsaG7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802572; c=relaxed/simple;
	bh=cNoOFi+HK44403muxY6hIQs0C+hCLZKx18EJTvhujsY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opsR1kfX5sVMmkDi0yjik0M5nSjtVMVkqTWc/NQOfZfK0ztWVncVyGH0hzwiPY+EW5vwmuxzVWaFZh6EijDoLdvGCUb24PTQANK2c6NLPGwMlRqOAl2vBpraX+V6ocjoXk4xqmzQZLK+sfl4M7y93tSrvDXKukctj+E0erJaD/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Urw0wAU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qHjU4b5T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Urw0wAU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qHjU4b5T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Urw0wAU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qHjU4b5T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Urw0wAU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qHjU4b5T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9AA7A6B060;
	Tue, 26 May 2026 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779802568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ppVx/Yj7DNN07zWQVNfHmyAJ/ID04LWDke6ketYnBw=;
	b=2Urw0wAUdeAtNs5sep0PGzQHKAZgDUv3Rt7VwBD0YW+ktcoS9vtmJJgkgjRPEYF22j7o+z
	TB5a5H4tzKDfBXi24B3ScWKAynFYsjWW+RZRtLYPTZn2VCVqdAlKsiEZAS7sjtsCqM6jXw
	D/WWXRUlou5/hwfBOzRxmNJtWWP9VvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779802568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ppVx/Yj7DNN07zWQVNfHmyAJ/ID04LWDke6ketYnBw=;
	b=qHjU4b5T6Y1xt0A7Dji2i1pMw1F+7TBDb1xGgA0M3eNBbWTeo7rQuezqpUnuof4BlD93de
	238fxLIrNTTCLZCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2Urw0wAU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qHjU4b5T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779802568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ppVx/Yj7DNN07zWQVNfHmyAJ/ID04LWDke6ketYnBw=;
	b=2Urw0wAUdeAtNs5sep0PGzQHKAZgDUv3Rt7VwBD0YW+ktcoS9vtmJJgkgjRPEYF22j7o+z
	TB5a5H4tzKDfBXi24B3ScWKAynFYsjWW+RZRtLYPTZn2VCVqdAlKsiEZAS7sjtsCqM6jXw
	D/WWXRUlou5/hwfBOzRxmNJtWWP9VvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779802568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ppVx/Yj7DNN07zWQVNfHmyAJ/ID04LWDke6ketYnBw=;
	b=qHjU4b5T6Y1xt0A7Dji2i1pMw1F+7TBDb1xGgA0M3eNBbWTeo7rQuezqpUnuof4BlD93de
	238fxLIrNTTCLZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 818AD5A222;
	Tue, 26 May 2026 13:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ik4AH8ihFWoGegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 13:36:08 +0000
Date: Tue, 26 May 2026 15:36:08 +0200
Message-ID: <87y0h6xph3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com
Subject: Re: [PATCH] ALSA: seq: oss: copy SysEx payloads before handoff
In-Reply-To: <20260521233900.478153-1-rollkingzzc@gmail.com>
References: <20260521233900.478153-1-rollkingzzc@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9AA7A6B060
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]

On Fri, 22 May 2026 01:39:00 +0200,
Zhang Cen wrote:
> 
> The OSS sequencer MIDI output path feeds bytes into an snd_midi_event
> coder from snd_seq_oss_midi_putc().  When a SysEx message completes, the
> coder builds a variable-length sequencer event whose data.ext.ptr still
> points at the coder-owned buffer.
> 
> snd_seq_oss_midi_putc() returns after dropping the MIDI device use
> reference, but the caller still owns the freshly built event and may
> enqueue it afterwards.  A concurrent port-removal notification can
> therefore run snd_seq_oss_midi_check_exit_port() and free the coder
> buffer before snd_seq_event_dup() copies the variable payload.
> 
> The dangerous interleaving is:
> 
> write path:
>     snd_seq_oss_midi_putc() completes a SysEx event whose
>     data.ext.ptr points at mdev->coder storage.  It then returns and
>     drops the mdev use reference.  insert_queue() later enqueues the
>     variable-length event and snd_seq_event_dup() copies from
>     event.data.ext.ptr.
> 
> teardown path:
>     a PORT_EXIT notification reaches snd_seq_oss_midi_check_exit_port(),
>     removes the MIDI device, and frees mdev->coder before the queued
>     event is duplicated.
> 
> Serialize access to the MIDI coder and copy completed SysEx payloads
> into caller-owned scratch storage before returning to the enqueue or
> direct-dispatch side.  The copied payload remains valid until the
> sequencer core has synchronously duplicated or delivered the event, so
> teardown can no longer free the source buffer from under
> snd_seq_event_dup().
> 
> KASAN report as below:
> 
> KASAN slab-use-after-free in snd_seq_event_dup+0x40c/0x470
> RIP: 0033:0x7f2cb66a6340
> Read of size 6
> Call trace:
>   dump_stack_lvl+0x73/0xb0 (?:?)
>   print_report+0xd1/0x650 (?:?)
>   srso_alias_return_thunk+0x5/0xfbef5 (?:?)
>   __virt_addr_valid+0x1a7/0x340 (?:?)
>   kasan_complete_mode_report_info+0x64/0x200 (?:?)
>   kasan_report+0xf7/0x130 (?:?)
>   snd_seq_event_dup+0x40c/0x470 (?:?)
>   kasan_check_range+0x10c/0x1c0 (?:?)
>   __asan_memcpy+0x27/0x70 (?:?)
>   snd_seq_event_dup+0x9/0x470 (?:?)
>   snd_seq_client_enqueue_event+0x139/0x240 (?:?)
>   _raw_spin_unlock_irqrestore+0x4b/0x60 (?:?)
>   snd_seq_kernel_client_enqueue+0x102/0x120 (?:?)
>   snd_seq_oss_write+0x416/0x4e0 (?:?)
>   apparmor_file_permission+0x20/0x30 (?:?)
>   odev_write+0x3b/0x60 (?:?)
>   vfs_write+0x1ce/0x850 (?:?)
>   lock_release+0xc8/0x2a0 (?:?)
>   __kasan_check_write+0x18/0x20 (?:?)
>   __mutex_unlock_slowpath+0x129/0x510 (?:?)
>   ksys_write+0xe1/0x180 (?:?)
>   mutex_unlock+0x16/0x20 (?:?)
>   odev_ioctl+0x65/0xc0 (?:?)
>   __x64_sys_write+0x46/0x60 (?:?)
>   x64_sys_call+0x7d/0x20d0 (?:?)
>   do_syscall_64+0xc1/0x360 (arch/x86/entry/syscall_64.c:87)
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

Thanks for the report.  I guess the analysis about UAF is right, but
the fix looks too much.  There is a refcounting of the midi device
object, and we can just increase and decrease the refcount between
snd_seq_oss_process_event() and snd_seq_oss_dispatch() & co.

Below is a totally untested fix patch.  Could you check whether this
works for your test case?


Takashi

-- 8< --
--- a/sound/core/seq/oss/seq_oss_event.c
+++ b/sound/core/seq/oss/seq_oss_event.c
@@ -39,8 +39,10 @@ static int set_echo_event(struct seq_oss_devinfo *dp, union evrec *rec, struct s
  */
 
 int
-snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, struct snd_seq_event *ev)
+snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q,
+			  struct snd_seq_event *ev, snd_use_lock_t **lockp)
 {
+	*lockp = NULL;
 	switch (q->s.code) {
 	case SEQ_EXTENDED:
 		return extended_event(dp, q, ev);
@@ -69,7 +71,7 @@ snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, struct snd
 		if (snd_seq_oss_midi_open(dp, q->s.dev, SNDRV_SEQ_OSS_FILE_WRITE))
 			break;
 		if (snd_seq_oss_midi_filemode(dp, q->s.dev) & SNDRV_SEQ_OSS_FILE_WRITE)
-			return snd_seq_oss_midi_putc(dp, q->s.dev, q->s.parm1, ev);
+			return snd_seq_oss_midi_putc(dp, q->s.dev, q->s.parm1, ev, lockp);
 		break;
 
 	case SEQ_ECHO:
--- a/sound/core/seq/oss/seq_oss_event.h
+++ b/sound/core/seq/oss/seq_oss_event.h
@@ -91,7 +91,8 @@ union evrec {
 #define ev_is_long(ev) ((ev)->s.code >= 128)
 #define ev_length(ev) ((ev)->s.code >= 128 ? LONG_EVENT_SIZE : SHORT_EVENT_SIZE)
 
-int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, struct snd_seq_event *ev);
+int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q,
+			      struct snd_seq_event *ev, snd_use_lock_t **lockp);
 int snd_seq_oss_process_timer_event(struct seq_oss_timer *rec, union evrec *q);
 int snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *private_data, int atomic, int hop);
 
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -45,14 +45,17 @@ static int snd_seq_oss_oob_user(struct seq_oss_devinfo *dp, void __user *arg)
 {
 	unsigned char ev[8];
 	struct snd_seq_event tmpev;
+	snd_use_lock_t *lock = NULL;
 
 	if (copy_from_user(ev, arg, 8))
 		return -EFAULT;
 	memset(&tmpev, 0, sizeof(tmpev));
 	snd_seq_oss_fill_addr(dp, &tmpev, dp->addr.client, dp->addr.port);
 	tmpev.time.tick = 0;
-	if (! snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev)) {
+	if (!snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev, &lock)) {
 		snd_seq_oss_dispatch(dp, &tmpev, 0, 0);
+		if (lock)
+			snd_use_lock_free(lock);
 	}
 	return 0;
 }
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -593,7 +593,8 @@ send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, struct seq
  *        non-zero : invalid - ignored
  */
 int
-snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, struct snd_seq_event *ev)
+snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c,
+		      struct snd_seq_event *ev, snd_use_lock_t **lockp)
 {
 	struct seq_oss_midi *mdev __free(seq_oss_midi) =
 		get_mididev(dp, dev);
@@ -602,6 +603,9 @@ snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, stru
 		return -ENODEV;
 	if (snd_midi_event_encode_byte(mdev->coder, c, ev)) {
 		snd_seq_oss_fill_addr(dp, ev, mdev->client, mdev->port);
+		/* the caller must release this later */
+		*lockp = &mdev->use_lock;
+		snd_use_lock_use(*lockp);
 		return 0;
 	}
 	return -EINVAL;
--- a/sound/core/seq/oss/seq_oss_midi.h
+++ b/sound/core/seq/oss/seq_oss_midi.h
@@ -26,7 +26,7 @@ void snd_seq_oss_midi_open_all(struct seq_oss_devinfo *dp, int file_mode);
 int snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev);
 void snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev);
 int snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c,
-			  struct snd_seq_event *ev);
+			  struct snd_seq_event *ev, snd_use_lock_t **lockp);
 int snd_seq_oss_midi_input(struct snd_seq_event *ev, int direct, void *private);
 int snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev);
 int snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info *inf);
diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index 307ef98c44c7..111c792bc72c 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -153,6 +153,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 {
 	int rc = 0;
 	struct snd_seq_event event;
+	snd_use_lock_t *lock = NULL;
 
 	/* if this is a timing event, process the current time */
 	if (snd_seq_oss_process_timer_event(dp->timer, rec))
@@ -164,7 +165,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 	event.type = SNDRV_SEQ_EVENT_NOTEOFF;
 	snd_seq_oss_fill_addr(dp, &event, dp->addr.client, dp->addr.port);
 
-	if (snd_seq_oss_process_event(dp, rec, &event))
+	if (snd_seq_oss_process_event(dp, rec, &event, &lock))
 		return 0; /* invalid event - no need to insert queue */
 
 	event.time.tick = snd_seq_oss_timer_cur_tick(dp->timer);
@@ -173,6 +174,8 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 	else
 		rc = snd_seq_kernel_client_enqueue(dp->cseq, &event, opt,
 						   !is_nonblock_mode(dp->file_mode));
+	if (lock)
+		snd_use_lock_free(lock);
 	return rc;
 }
 		
