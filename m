Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D663AFCEC
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203148; cv=none; b=PjZ9Fdg5qVdOurIYL3+usYzv2lM/XNVvqQTJDLhhit5AtTLHyv9UDd1SpVU6LsqlrqRZPVhrIPC4rW3NOa9jNmAPhz8grMuaS9qXIL8OsacbXohjNwyPbHuBiUIMU8ioAhquv7A1tTOyxqAOOpbHlO4dBhYqFcs01mgytyYFHpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203148; c=relaxed/simple;
	bh=708TlSJ3SXs8FRMKX/8zKa2UIgb2ObbRg9999+d12V8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fLgWzMzaaPs8m8lxmt+284t18ZpoArx7vaxEi3CeBoijMtbs1JmYMUMyLbKcli1/s57Om5U/yHoOAPpjOl6AZv8oCrKaOxDotg/QSuhyYP1XrXjeVRUA1QcrNX6aJkVWmPTqkqIAoQvncQ+gnVd/4eup33wOdOHgODEkPtx4Vww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVyJrEuR; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVyJrEuR"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-835b78c3797so1519410b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203147; x=1779807947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1+bKRtTx/vYV0NpoFMayL1VOq3fpqPHfHc/R3X7bTU=;
        b=hVyJrEuRxg5+CRcrpwZzmezA7nwHd7CWLpt2UsSjGxODngzBAUHzY7Z8sPTeZNJJFL
         fQOd35xPcNVgce5tUqvIFZx+U0WYHCv3SWJDE6/5J7Uz1FRgpMZMc1sbhOqpM6qu2mW+
         Ofk6IXf5JfK0yVTm2eKUqWy9ONET4jHbtXomaqpfY9idm02Q2/m1nJk0vds/j+2ocgZ7
         z5JcxDLuI0dM5O2WXD9Y0MQ65uKv8U8jkS3Lb0XTpkQGrkDabI7N/YOy9b434OXft/us
         f8Yl/MYKDYQqK7V1/GPevMBvunA1njJzk/W1AFrWpbDUtMRF3SDikzUXmy+pN6zDejW/
         vfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203147; x=1779807947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1+bKRtTx/vYV0NpoFMayL1VOq3fpqPHfHc/R3X7bTU=;
        b=riNN/zIxY65BOvcpnFY3e8guzwwSF0LoqYrpQ1haCM1Sf6LKZtRAlm2pEAheoVP13n
         JubEX6LgK64pAzb9AWpRbGwgefDRPxLrC8B0xl70XsxxhbG5wjazu6+guAyYcGMoWqyq
         u2ew0H2J9NGyzwQMVHBlUf4WPaIErcbV/y4R3EO8qh4F9WuIwssAB1d8btQ60R9cnw8n
         2bORQeyqGQzt6EWU5dLQYhVyy8oEoItPxy1KOKFCOqS80mNaYblYTqeKokfss5At98Qb
         SObrEk0nqfV1D4Ez24wrCnQsj3RhHAd7SI3sQJRVztTkMoeZm9qtN0ZRBDPcgTtLC629
         91Tw==
X-Gm-Message-State: AOJu0Ywilz0KoHwZwpkRq6SKVACyzTHYqYY74ik2tauvBto5FpvsFTJy
	eD81SEzT5uI3JMzg8uO9OqBHdaCIoKIbgHvaye3+tkCVw9WHtgWuCMOr
X-Gm-Gg: Acq92OF+Xc3W6P8MT41TGtEhtHSq0OHG6YXL3SaSznjkJk4p1DL7m+BEieGqZZ6k51h
	v3P7BNux46Ew0Sw/zsac4C73Qwj2QJBAeDZtpai79WKbJJes33ua6jeXOTOJBB1qGYqpf87WBTv
	tsmZRQhAVxb/1pUrwBWqhPei0phdAdEclIAesmcSTCHys6Az8jxfGWHf4twpIyJjJKJFfJebV/U
	JPeypMzNyvYRyhb8f/yUPzlhdAwujtx9/YCYDT8DroTv4PtRxIf6TrvyP5mTojPS5k+NVOimqSy
	tGLLAGR9eXIzvLTVZSX7SytVKjE2jKNDOd7Ge6ozhhfunyVby79yJihEXIBpbrDIvuHASQ3IxVV
	0t7gdLofGX9ssjrg6rxvFQ1wnlVs1yqqUwe6Hs0587JlM0Wg+xTY9clgzNi798Y5WWP8CLbsFp5
	m/rBURdUSsY8sEFmfkBRqcgk2aBjs2oqy4lv2QDYZ7iQ==
X-Received: by 2002:a05:6a00:2998:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-83f33d82298mr18565323b3a.38.1779203146525;
        Tue, 19 May 2026 08:05:46 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f75c0d232sm7152061b3a.17.2026.05.19.08.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:05:45 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] ALSA: seq: Serialize UMP output teardown with event_input
Date: Tue, 19 May 2026 23:05:28 +0800
Message-Id: <20260519150528.4193481-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

seq_ump_process_event() borrows client->out_rfile.output without
synchronizing with the first-open / last-close transition in
seq_ump_client_open() and seq_ump_client_close().

The last output unuse can therefore drop opened[STR_OUT] to zero and
release client->out_rfile while an in-flight event_input callback is
still inside snd_rawmidi_kernel_write(). That leaves the rawmidi
substream runtime exposed to teardown before the write path has taken
its own buffer reference.

Add a small per-client output gate. event_input now claims the current
output stream and counts in-flight writers before using it, while the
last close clears the ready bit, waits for those writers to drain, and
only then calls snd_rawmidi_kernel_release().

The buggy scenario involves two paths, with each column showing the
order within that path:

path A label: event_input path         path B label: last unuse path
1. seq_ump_process_event() claims      1. seq_ump_client_close()
   client->out_rfile.output and           drops opened[STR_OUT] to zero.
   starts snd_rawmidi_kernel_write().  2. The close side withdraws the
2. The write still depends on the         output from new writers.
   borrowed substream runtime.         3. It waits for the in-flight
3. The write drops its output claim       event_input writer to finish.
   after the rawmidi write completes.  4. It releases client->out_rfile.

This keeps the output substream and runtime pinned for the whole
event_input write.

KASAN report as below:
KASAN slab-use-after-free in snd_rawmidi_kernel_write1()
RIP: 0033:0x7f5528af837f
Read of size 8
Call trace:
  dump_stack_lvl() (?:?)
  print_report() (?:?)
  srso_alias_return_thunk() (arch/x86/include/asm/nospec-branch.h:373)
  __virt_addr_valid() (?:?)
  kasan_complete_mode_report_info() (?:?)
  kasan_report() (?:?)
  snd_rawmidi_kernel_write1() (sound/core/rawmidi.c:1518)
  __asan_load8() (?:?)
  update_stack_state() (arch/x86/kernel/unwind_frame.c:196)
  snd_rawmidi_kernel_write() (?:?)
  seq_ump_process_event() (sound/core/seq/seq_ump_client.c:82)
  __snd_seq_deliver_single_event() (?:?)
  snd_seq_deliver_from_ump() (?:?)
  lock_acquire() (?:?)
  find_held_lock() (kernel/locking/lockdep.c:5340)
  snd_seq_port_use_ptr() (sound/core/seq/seq_ports.c:44)
  __kasan_check_write() (?:?)
  do_raw_read_unlock() (kernel/locking/spinlock_debug.c:178)
  _raw_read_unlock() (kernel/locking/spinlock.c:258)
  snd_seq_deliver_single_event() (sound/core/seq/seq_clientmgr.c:71)
  snd_seq_deliver_event() (sound/core/seq/seq_clientmgr.c:829)
  snd_seq_client_enqueue_event() (sound/core/seq/seq_clientmgr.c:938)
  snd_seq_write() (sound/core/seq/seq_clientmgr.c:1026)
  apparmor_file_permission() (security/apparmor/lsm.c:546)
  security_file_permission() (?:?)
  vfs_write() (fs/read_write.c:666)
  __fget_files() (fs/file.c:1065)
  lock_release() (kernel/locking/lockdep.c:5875)
  __rcu_read_unlock() (?:?)
  ksys_write() (fs/read_write.c:727)
  rcu_is_watching() (?:?)
  __x64_sys_write() (?:?)
  x64_sys_call() (arch/x86/entry/syscall_64.c:35)
  do_syscall_64() (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe() (?:?)

Fixes: 81fd444aa371 ("ALSA: seq: Bind UMP device")
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
 sound/core/seq/seq_ump_client.c | 69 ++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 9079ccfdc8666..0f221beddb8da 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -6,6 +6,7 @@
 #include <linux/errno.h>
 #include <linux/mutex.h>
 #include <linux/string.h>
+#include <linux/wait.h>
 #include <linux/module.h>
 #include <asm/byteorder.h>
 #include <sound/core.h>
@@ -38,6 +39,10 @@ struct seq_ump_client {
 	int seq_client;			/* sequencer client id */
 	int opened[2];			/* current opens for each direction */
 	struct snd_rawmidi_file out_rfile; /* rawmidi for output */
+	spinlock_t output_lock;		/* protects output lifetime state */
+	wait_queue_head_t output_sleep; /* waits for in-flight writers */
+	unsigned int output_pending;	/* active event_input writers */
+	bool output_ready;		/* rawmidi output is available */
 	struct seq_ump_input_buffer input; /* input parser context */
 	void *ump_info[SNDRV_UMP_MAX_BLOCKS + 1]; /* shadow of seq client ump_info */
 	struct work_struct group_notify_work; /* FB change notification */
@@ -56,6 +61,50 @@ static unsigned char ump_group_to_seq_port(unsigned char group)
 	return group + 1;
 }
 
+static struct snd_rawmidi_substream *
+seq_ump_claim_output(struct seq_ump_client *client)
+{
+	struct snd_rawmidi_substream *substream = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&client->output_lock, flags);
+	if (client->output_ready) {
+		substream = client->out_rfile.output;
+		if (substream)
+			client->output_pending++;
+	}
+	spin_unlock_irqrestore(&client->output_lock, flags);
+	return substream;
+}
+
+static void seq_ump_release_output(struct seq_ump_client *client)
+{
+	unsigned long flags;
+	bool wake = false;
+
+	spin_lock_irqsave(&client->output_lock, flags);
+	if (WARN_ON(!client->output_pending)) {
+		spin_unlock_irqrestore(&client->output_lock, flags);
+		return;
+	}
+	if (!--client->output_pending && !client->output_ready)
+		wake = true;
+	spin_unlock_irqrestore(&client->output_lock, flags);
+	if (wake)
+		wake_up(&client->output_sleep);
+}
+
+static bool seq_ump_output_idle(struct seq_ump_client *client)
+{
+	unsigned long flags;
+	bool idle;
+
+	spin_lock_irqsave(&client->output_lock, flags);
+	idle = !client->output_pending;
+	spin_unlock_irqrestore(&client->output_lock, flags);
+	return idle;
+}
+
 /* process the incoming rawmidi stream */
 static void seq_ump_input_receive(struct snd_ump_endpoint *ump,
 				  const u32 *val, int words)
@@ -88,9 +137,6 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 	unsigned char type;
 	int len;
 
-	substream = client->out_rfile.output;
-	if (!substream)
-		return -ENODEV;
 	if (!snd_seq_ev_is_ump(ev))
 		return 0; /* invalid event, skip */
 	ump_ev = (struct snd_seq_ump_event *)ev;
@@ -98,7 +144,11 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 	len = ump_packet_words[type];
 	if (len > 4)
 		return 0; // invalid - skip
+	substream = seq_ump_claim_output(client);
+	if (!substream)
+		return -ENODEV;
 	snd_rawmidi_kernel_write(substream, ev->data.raw8.d, len << 2);
+	seq_ump_release_output(client);
 	return 0;
 }
 
@@ -116,6 +166,8 @@ static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 					      &client->out_rfile);
 		if (err < 0)
 			return err;
+		guard(spinlock_irq)(&client->output_lock);
+		client->output_ready = true;
 	}
 	client->opened[dir]++;
 	return 0;
@@ -127,9 +179,12 @@ static int seq_ump_client_close(struct seq_ump_client *client, int dir)
 	struct snd_ump_endpoint *ump = client->ump;
 
 	guard(mutex)(&ump->open_mutex);
-	if (!--client->opened[dir])
-		if (dir == STR_OUT)
-			snd_rawmidi_kernel_release(&client->out_rfile);
+	if (!--client->opened[dir] && dir == STR_OUT) {
+		scoped_guard(spinlock_irq, &client->output_lock)
+			client->output_ready = false;
+		wait_event(client->output_sleep, seq_ump_output_idle(client));
+		snd_rawmidi_kernel_release(&client->out_rfile);
+	}
 	return 0;
 }
 
@@ -466,6 +521,8 @@ static int snd_seq_ump_probe(struct snd_seq_device *dev)
 		return -ENOMEM;
 
 	INIT_WORK(&client->group_notify_work, handle_group_notify);
+	spin_lock_init(&client->output_lock);
+	init_waitqueue_head(&client->output_sleep);
 	client->ump = ump;
 
 	client->seq_client =
-- 
2.43.0
