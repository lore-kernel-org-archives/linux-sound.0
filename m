Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D873D7D82
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273189; cv=none; b=HpKTOas0vaIcyiobpVmV0/JmjVD9DBgBrYB8S8CpZVcDpxxdsTN+AvjlMEU4hEGjDtoQWg6S/2XxacCAMwUnBzif7/KTuFbg/EQ2Enn6yxeu5GKhybdnIbVD++tWVojbdhDcRkZndvs3krEpyKutYsjnjJQMt0LAeCDzYdwngC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273189; c=relaxed/simple;
	bh=32UuVXGjBAJfWzDbWV9ck1i2UnwZ09ZXuANYSaMBF6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mm7lCljBowM9ex6DzkaQDFBUwDIrMK350NVSJaqVenb3zGTcpUuhb3wmsDyI1y5pZHmdRYJ8zvahkiWg6JMuBeB41As2QGQTrz8a8fNFuAOLbhOgcTEoIUUG/HESEOeS5oQ2T9ZDiZQQd65QEV66FlCiu06bV8KW7uoXnOMFhd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDys9kYV; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDys9kYV"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2ba4a1a0325so29215165ad.0
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779273185; x=1779877985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=df5ljnkT59VDilnps8QzbXNo3Qir3wTp0hwEjNvZKvs=;
        b=qDys9kYVNqQ/Wi4uNkfyXzkoDKkxkmsyDEIPk0ODQesgVEk09r4ncedTkZPWB70CK/
         3KnfMPA2QVh+Y7l+nbu37ngKVVi6YjKNNr9XtfdeGGbIumVXY8YoPFN1/g8zuh4fMEvF
         4Qh0CZLjmXBEfLVxDBQmSnftygkk6nqOs3CrrrpLLAhmvKxR25CoyrxJi0AwBAjbURtW
         ICLHOyzEjNYeem18qcw97rhybVIs8r9nFny02N3yNNToFWLLXG8PpI+ZJBlyGRYH6RKS
         +By0VorQcSEsSC4ZSbmIxKihGzSw309EWQYKw3XazGfD16uwzBSdMS5jHsJMCoJDtyL3
         OMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779273185; x=1779877985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df5ljnkT59VDilnps8QzbXNo3Qir3wTp0hwEjNvZKvs=;
        b=nwT9uKI32xSDSNWOJCuPAopgQD38N7kOigTSDV/c+el3tCVfDUzI4YQ8fsptrAUqyQ
         qTOOEk/Zvql3JEkf2BJo5fXonZdLcZujFf+Hx+HYh+mtRzoHRo8F9Y2ikrmx7EI6j5cj
         /4AgVhKzxQ69qJBCLByqmNuOeZAJj7gfaOcm8IFhkwDJBCiThQjRlwgLTsQuIrGJQ+27
         0N+llRWWKSZLxS+HL8UL7FgxIu93ujQbyDz/7YwrN5auHGoSDe6tA/jX3gv2vYW+tRXU
         Ld2sPgv9ScAXfv0BAhZqgy2J0zy6MMhfXcngpGrQMNBcYosmvjkmUn0xIa9JNc0sV0MS
         WFeA==
X-Gm-Message-State: AOJu0YwBeazIR2GB42fKqJ96vfT6wx7vh/WB5dl+/b/4uWPCmSJ9/L4Z
	GZ3tThOUUt0K5SH8P9hS1IzhgN8nSNC7EdUXtNKBFcWUz6vW77Ldqy92
X-Gm-Gg: Acq92OEKPJkoCgPRDEcZGsyDXLUGFdVzmTmoIuRPUm9RK+1iOhlnkJNLJ1Eu4tV+zfz
	tVTRZtHCl+YxLBKNYDVh4ZvxwdXum3txKPtS4jV+TIsyhtjYPKV+45NxmuU2N11roEw+3StrbH9
	I0NDfMWp7M82XTboZdYwIOZP0rxB8AdJlwjTOFyMdbX8CBKkzNMxolv+wxvXkWIl5tfHla9VEOU
	FNqPqjz87tXw5NTsRDXwq4vaSKizrmnRQoNGuntzk9jjRmashQNxKkbhzB2QGeLIMuKRD8NbUST
	R5zAWZNTcW0Ocuy9PJkRhxAS+nV/iMrp7kGvCPY5T26vK/xkfYOhzPL1R/8e3di3HW1tsWnZjdx
	rkt4SAsymaBEEtupkgDG6d6uqq5pEDI7DImGSSoY0UFjPZ+YPraknznyQTSG1C5Y+lcimM1yO55
	q5FG6rg95+vlcO4Fuy40tr4/8uKu+4xgw=
X-Received: by 2002:a17:902:f38e:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd7e8cbc80mr196594415ad.35.1779273184745;
        Wed, 20 May 2026 03:33:04 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm208405925ad.10.2026.05.20.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:33:04 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH v2] ALSA: seq: Serialize UMP output teardown with event_input
Date: Wed, 20 May 2026 18:32:49 +0800
Message-Id: <20260520103249.3048345-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

seq_ump_process_event() borrows client->out_rfile.output without
synchronizing with the first-open and last-close transition in
seq_ump_client_open() and seq_ump_client_close().

The last output unuse can therefore drop opened[STR_OUT] to zero and
release the rawmidi file while an in-flight event_input callback is still
inside snd_rawmidi_kernel_write(). That leaves the rawmidi substream
runtime exposed to teardown before the write path has taken its own
buffer reference.

Add a per-client rwlock for the event_input-visible output file. Publish
a newly opened output file under the write side, and hold the read side
from the output lookup through snd_rawmidi_kernel_write(). The last
output close copies and clears the visible output file under the write
side, then drops the lock and releases the saved rawmidi file. Use
IRQ-safe rwlock guards because event_input can also be reached from
atomic sequencer delivery.

The buggy scenario involves two paths, with each column showing the
order within that path:

path A label: event_input path         path B label: last unuse path
1. seq_ump_process_event() reads       1. seq_ump_client_close()
   client->out_rfile.output.              drops opened[STR_OUT] to zero.
2. snd_rawmidi_kernel_write1()         2. snd_rawmidi_kernel_release()
   has not yet pinned runtime.            closes the output file.
3. The writer continues using          3. close_substream() frees
   the borrowed substream.                substream->runtime.

This keeps the output substream and runtime alive for the full
event_input write while keeping rawmidi release outside the rwlock.

KASAN reproduced this as a slab-use-after-free in
snd_rawmidi_kernel_write1(), with allocation through
seq_ump_use()/snd_seq_port_connect() and free through
seq_ump_unuse()/snd_seq_port_disconnect().

Suggested-by: Takashi Iwai <tiwai@suse.de>

Validation reproduced this kernel report:
KASAN slab-use-after-free in snd_rawmidi_kernel_write1+0x9d/0x400
RIP: 0033:0x7f5528af837f
Read of size 8
Call trace:
  dump_stack_lvl+0x73/0xb0 (?:?)
  print_report+0xd1/0x650 (?:?)
  srso_alias_return_thunk+0x5/0xfbef5 (?:?)
  __virt_addr_valid+0x1a7/0x340 (?:?)
  kasan_complete_mode_report_info+0x64/0x200 (?:?)
  kasan_report+0xf7/0x130 (?:?)
  snd_rawmidi_kernel_write1+0x9d/0x400 (?:?)
  __asan_load8+0x82/0xb0 (?:?)
  update_stack_state+0x1ef/0x2d0 (?:?)
  snd_rawmidi_kernel_write+0x1a/0x20 (?:?)
  seq_ump_process_event+0xd4/0x120 (sound/core/seq/seq_ump_client.c:82)
  __snd_seq_deliver_single_event+0x8a/0xe0 (?:?)
  snd_seq_deliver_from_ump+0x2b2/0xd60 (?:?)
  lock_acquire+0x14e/0x2e0 (?:?)
  find_held_lock+0x31/0x90 (?:?)
  snd_seq_port_use_ptr+0xa6/0xe0 (?:?)
  __kasan_check_write+0x18/0x20 (?:?)
  do_raw_read_unlock+0x32/0xa0 (?:?)
  _raw_read_unlock+0x26/0x50 (?:?)
  snd_seq_deliver_single_event+0x45c/0x4b0 (?:?)
  snd_seq_deliver_event+0x10d/0x1b0 (?:?)
  snd_seq_client_enqueue_event+0x192/0x240 (?:?)
  snd_seq_write+0x2cd/0x450 (?:?)
  apparmor_file_permission+0x20/0x30 (?:?)
  security_file_permission+0x51/0x60 (?:?)
  vfs_write+0x1ce/0x850 (?:?)
  __fget_files+0x12b/0x220 (?:?)
  lock_release+0xc8/0x2a0 (?:?)
  __rcu_read_unlock+0x74/0x2d0 (?:?)
  __fget_files+0x135/0x220 (?:?)
  ksys_write+0x15a/0x180 (?:?)
  rcu_is_watching+0x24/0x60 (?:?)
  __x64_sys_write+0x46/0x60 (?:?)
  x64_sys_call+0x7d/0x20d0 (?:?)
  do_syscall_64+0xc1/0x360 (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)

Fixes: 81fd444aa371 ("ALSA: seq: Bind UMP device")
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
v2:
Use Takashi's suggested rwlock approach instead of the v1 ready/pending/wait-queue output gate.
Make the rwlock acquisitions IRQ-safe because event_input can be reached from atomic sequencer delivery.
Keep rawmidi release outside the rwlock by publishing and withdrawing a saved struct snd_rawmidi_file copy under the write lock.

 sound/core/seq/seq_ump_client.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 9079ccfdc..ccd93599b 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -37,6 +37,7 @@ struct seq_ump_client {
 	struct snd_ump_endpoint *ump;	/* assigned endpoint */
 	int seq_client;			/* sequencer client id */
 	int opened[2];			/* current opens for each direction */
+	rwlock_t output_lock;		/* protects out_rfile output access */
 	struct snd_rawmidi_file out_rfile; /* rawmidi for output */
 	struct seq_ump_input_buffer input; /* input parser context */
 	void *ump_info[SNDRV_UMP_MAX_BLOCKS + 1]; /* shadow of seq client ump_info */
@@ -88,6 +89,7 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 	unsigned char type;
 	int len;
 
+	guard(read_lock_irqsave)(&client->output_lock);
 	substream = client->out_rfile.output;
 	if (!substream)
 		return -ENODEV;
@@ -106,6 +108,7 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
+	struct snd_rawmidi_file rfile = {};
 	int err;
 
 	guard(mutex)(&ump->open_mutex);
@@ -113,9 +116,11 @@ static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 		err = snd_rawmidi_kernel_open(&ump->core, 0,
 					      SNDRV_RAWMIDI_LFLG_OUTPUT |
 					      SNDRV_RAWMIDI_LFLG_APPEND,
-					      &client->out_rfile);
+					      &rfile);
 		if (err < 0)
 			return err;
+		scoped_guard(write_lock_irqsave, &client->output_lock)
+			client->out_rfile = rfile;
 	}
 	client->opened[dir]++;
 	return 0;
@@ -125,11 +130,19 @@ static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 static int seq_ump_client_close(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
+	struct snd_rawmidi_file rfile = {};
 
 	guard(mutex)(&ump->open_mutex);
-	if (!--client->opened[dir])
-		if (dir == STR_OUT)
-			snd_rawmidi_kernel_release(&client->out_rfile);
+	if (!--client->opened[dir]) {
+		if (dir == STR_OUT) {
+			scoped_guard(write_lock_irqsave, &client->output_lock) {
+				rfile = client->out_rfile;
+				client->out_rfile = (struct snd_rawmidi_file){};
+			}
+			if (rfile.rmidi)
+				snd_rawmidi_kernel_release(&rfile);
+		}
+	}
 	return 0;
 }
 
@@ -467,6 +480,7 @@ static int snd_seq_ump_probe(struct snd_seq_device *dev)
 
 	INIT_WORK(&client->group_notify_work, handle_group_notify);
 	client->ump = ump;
+	rwlock_init(&client->output_lock);
 
 	client->seq_client =
 		snd_seq_create_kernel_client(card, ump->core.device,
-- 
2.43.0

