Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4366286425
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809332; cv=none; b=ZKym6TWdInaFMuAr+pR2BoKK4CDc2x9HhnMTBNVY9XOnokB86GPSbcHZYArQM/PD/iocpnCD3z3WUpeE0+dpSu4RNITZmxN9B4TO9OWSHhPss7iNwj+TlbUbqLOXvcWdiU6SZpTCvnrpKGA+857/NJugoKHlRe60cKymoObeI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809332; c=relaxed/simple;
	bh=QwVaLgolcyijMn+iQhasq9mnU/0lJi5VZNV8SFWqugM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N15IjEiM+KnaSUaTkKyzWMpTSKzANz9J63298IdasdPioqiPw+CFzAPe/cyGWMASjOy1LXK3DT6UqSiduNOtR02rhn187+zX7d5LWyI5JR/bcqiE9ntOwvSvUrix7tZVVSIdE70steIlHtTz2BiFbLKkuICY6Xm933nAda4GiS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PgyFWLDR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/BMLWRJe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PgyFWLDR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/BMLWRJe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PgyFWLDR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/BMLWRJe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PgyFWLDR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/BMLWRJe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B441673B1;
	Tue, 26 May 2026 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779809329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Axc24nyCqNF8sRnKa7o4PSO/qw0755mPtaneWr6A5N0=;
	b=PgyFWLDRXMH3R7mn8WCes1l7GEO6eBw3aQy/15wCkjOZh75sCX/0KSyyntDz2ZqjuaPjLG
	QFphbr3DpOdlnxeHoZGViD2iyr4/h4YaH8hb2T/0MRnQfEPyeEOqU56Zai7eeGCwg6kDbh
	nAfhR8BavrJG8UyzxWzvw636WzJwz74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779809329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Axc24nyCqNF8sRnKa7o4PSO/qw0755mPtaneWr6A5N0=;
	b=/BMLWRJe4kHzsXqTARBafvL16u38bO4E2YfQ8vuDH9deHlyx/dCQCMYf0he/PBCNByosaI
	774GQG3wXnH6llBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779809329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Axc24nyCqNF8sRnKa7o4PSO/qw0755mPtaneWr6A5N0=;
	b=PgyFWLDRXMH3R7mn8WCes1l7GEO6eBw3aQy/15wCkjOZh75sCX/0KSyyntDz2ZqjuaPjLG
	QFphbr3DpOdlnxeHoZGViD2iyr4/h4YaH8hb2T/0MRnQfEPyeEOqU56Zai7eeGCwg6kDbh
	nAfhR8BavrJG8UyzxWzvw636WzJwz74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779809329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Axc24nyCqNF8sRnKa7o4PSO/qw0755mPtaneWr6A5N0=;
	b=/BMLWRJe4kHzsXqTARBafvL16u38bO4E2YfQ8vuDH9deHlyx/dCQCMYf0he/PBCNByosaI
	774GQG3wXnH6llBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0736E5A293;
	Tue, 26 May 2026 15:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EsEqATG8FWocagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 15:28:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] ALSA: seq: oss: Fix UAF at handling events with embedded SysEx data
Date: Tue, 26 May 2026 17:28:41 +0200
Message-ID: <20260526152843.617503-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

The OSS sequencer processes the input MIDI bytes into a sequencer
event to be dispatched later (in snd_seq_oss_midi_putc() called from
snd_seq_oss_process_event()).  When it's a SysEx data, the event
record contains data.ext.ptr pointer to the original SysEx bytes, and
the referred data is copied into the pool afterwards at dispatching.
The problem is that, if the sequencer port gets closed concurrently
before the dispatch, the OSS sequencer core also releases the
resources (in snd_seq_oss_midi_check_exit_port()), while the pending
event may hold a stale pointer, eventually leading to a UAF at a later
dispatch.

Fortunately, there is already a refcounting mechanism (snd_use_lock_t)
for the OSS MIDI device access, and for addressing the issue above, we
just need to extend the refcount until the event gets dispatched.

This patch extends snd_seq_oss_process_event() to give back the
refcount object, which is in turn released after calling the sequencer
dispatcher with the given event in the caller side.

According to the original report, KASAN report as below:

KASAN slab-use-after-free in snd_seq_event_dup+0x40c/0x470
RIP: 0033:0x7f2cb66a6340
Read of size 6
Call trace:
  dump_stack_lvl+0x73/0xb0 (?:?)
  print_report+0xd1/0x650 (?:?)
  srso_alias_return_thunk+0x5/0xfbef5 (?:?)
  __virt_addr_valid+0x1a7/0x340 (?:?)
  kasan_complete_mode_report_info+0x64/0x200 (?:?)
  kasan_report+0xf7/0x130 (?:?)
  snd_seq_event_dup+0x40c/0x470 (?:?)
  kasan_check_range+0x10c/0x1c0 (?:?)
  __asan_memcpy+0x27/0x70 (?:?)
  snd_seq_event_dup+0x9/0x470 (?:?)
  snd_seq_client_enqueue_event+0x139/0x240 (?:?)
  _raw_spin_unlock_irqrestore+0x4b/0x60 (?:?)
  snd_seq_kernel_client_enqueue+0x102/0x120 (?:?)
  snd_seq_oss_write+0x416/0x4e0 (?:?)
  apparmor_file_permission+0x20/0x30 (?:?)
  odev_write+0x3b/0x60 (?:?)
  vfs_write+0x1ce/0x850 (?:?)
  lock_release+0xc8/0x2a0 (?:?)
  __kasan_check_write+0x18/0x20 (?:?)
  __mutex_unlock_slowpath+0x129/0x510 (?:?)
  ksys_write+0xe1/0x180 (?:?)
  mutex_unlock+0x16/0x20 (?:?)
  odev_ioctl+0x65/0xc0 (?:?)
  __x64_sys_write+0x46/0x60 (?:?)
  x64_sys_call+0x7d/0x20d0 (?:?)
  do_syscall_64+0xc1/0x360 (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-and-tested-by: Zhang Cen <rollkingzzc@gmail.com>
Closes: https://lore.kernel.org/20260521233900.478153-1-rollkingzzc@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_event.c | 6 ++++--
 sound/core/seq/oss/seq_oss_event.h | 3 ++-
 sound/core/seq/oss/seq_oss_ioctl.c | 5 ++++-
 sound/core/seq/oss/seq_oss_midi.c  | 6 +++++-
 sound/core/seq/oss/seq_oss_midi.h  | 2 +-
 sound/core/seq/oss/seq_oss_rw.c    | 5 ++++-
 6 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_event.c b/sound/core/seq/oss/seq_oss_event.c
index 76fb81077eef..122735862044 100644
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
diff --git a/sound/core/seq/oss/seq_oss_event.h b/sound/core/seq/oss/seq_oss_event.h
index b4f723949a17..a4524e51d0e9 100644
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
 
diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index ccf682689ec9..ce7a69d52b30 100644
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
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index b50a49ca42ff..70f94df65144 100644
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
diff --git a/sound/core/seq/oss/seq_oss_midi.h b/sound/core/seq/oss/seq_oss_midi.h
index bcc1683773df..4819d4170bf6 100644
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
 		
-- 
2.54.0

