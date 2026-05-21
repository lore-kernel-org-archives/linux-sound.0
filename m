Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A923033FF
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 23:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406748; cv=none; b=AiOBBs3+l3RGHUA/xxJOsvjBQ+YnVgy076RqeLeDk/2RQFVfLMR9RvyUG2yE2eDaNds/gdcSmlJx6j4Yrbem9fOgAPV7PUuEqXbT84s1krJ+JYMCQfUeq1YpsOry9zhWh1BO62zvTur4VV3uYDQQff0Pc15ZuXKXa7zQ2GdO5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406748; c=relaxed/simple;
	bh=eSGeIKqFiJG0miSsylLQ5Zl0oDWMYBN+pwvX1ArDsbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nhK/S6OxRZnOy+X9GhLHzNif1xTyT8Lk3U1Ns7CUZ2BuG3Ecs85gFQA1+iV1EDc/ZhyQdSaWBDlE9B0F12BpMxwJ8tgo2vNExQ4yVRuhKe3qfUpdvW0vAvWZYw+Y8LDWipdPuEeMBbQWbk80xFnFD/MWezGh/3AFwx8sCIC89II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbhN0bLS; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbhN0bLS"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-83ef1d17904so6776032b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 16:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779406746; x=1780011546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xaMO0Xf6dkL3sTl6sMuLiblX0dt4IR40MhEHMEjp0lY=;
        b=VbhN0bLS0QfwtlpCmX0l/7DIZFLo0qrgZ3Tf1VHMwbzRA8w2g8jqqxxNeXsbZo54dX
         5pHP2HRbAL3aMhf28mrSYQYnvIlxEWVdmvPRvXoDqn5VE3zThfB5499/HtE1vJNlJORy
         1xh+OLYtbV/hACAvIUn3Y2MhjofLHxnuAf+NraQO23K5PjN7EW95teKo894DSOwFBTsr
         8tXbpy5mHhrBCBwg8RkRJ+HDpdX2XyegeKDQ8jYzAyx1b1+c8sSGDAUE5Dh2JqRKGbP5
         /ns9mIToHNsuQIoEQDMGvlf+BfwyhoYgN4SLGLrKtyAuZsBIYoYOLB+dyV3KzgO79dCD
         d5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779406746; x=1780011546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaMO0Xf6dkL3sTl6sMuLiblX0dt4IR40MhEHMEjp0lY=;
        b=ilyH/Lol4XBsDwWKIGyk4JVX5c6Mun5Vzo9b9yVczlA7kOJG5V8FHjxhMSFkoXLGvb
         ujts2RcCFdOjLDLzNHIef6N+dqqgxW6pfLx3021K4WBamhYaFHBRi7NlIZX2TIgYra0n
         e0xLXUeq93bmVWNNWqJk+1787WEzkaRqja/BDeDn6lAayu3kpDyEogHHfBYS02p8dnZW
         yPb+dj0qEeAivQ3glSyMgLi1hR6H0N1iPWUzCPdF2hp38dvZunMOogDQHvvzT0tiagqc
         foNqcBwb/a3u4HkC8v14zBLgke8P1pa/Z/v7IbslS2WbgiW+uToo20w5Z/zm5+7oe9iU
         Xlwg==
X-Gm-Message-State: AOJu0YzBpzjQmqI+AvDkwu2oGRlPlpzzCNpxFd4+fjxPbdxq8vNM6+zI
	I2zI3rMEmqnW8gVuc/wFiyezJuYpdtjc0NFK+cz/dT1iFCRnHgxwUCO8
X-Gm-Gg: Acq92OFcGZD1ON2hX1fdE5zpctoTDD5yr2fFL6J+0FFPd0izuLKjP3h9CXMSoH163GS
	snf0hxZWyqhN/n7G15XEgzDhYZCdycksIiR9fy10a3Zctnrfy8jdMveSSXHEBLNnz6SxrNW4Vna
	IcSh8mVonvEs5cHlKwNGgnGBOdLECWemFRELAHVggVpPBxQmLZWPCKyzPtFvAFj81jy4jglSYne
	Ceo6PFYb0jATgM5oa918YyzEM0S7gDJ5cmO99cXK8tyR4zboGRwM5TWQJZGksnumUw7q6DaEfHi
	GB8prdNeZGfNyhw8q1Txx875o2/5huLmtDe+KM2+CeHaiN3F8LEfwtH/pGHHotJdbBysFqCuPW3
	79fOqKJ3NKez4vD1S8D8ZoFG/cnpR0pElXxu3gpcfhOT4uhij0rlhUZ9DoIhVVN/P4Z70EJkwJb
	sSTTfodX7ulC384kcZ32B9MU0qNv73aTg=
X-Received: by 2002:a05:6a00:4299:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-8415f0f0cfamr1205296b3a.1.1779406746083;
        Thu, 21 May 2026 16:39:06 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841628c6117sm204791b3a.52.2026.05.21.16.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:39:05 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] ALSA: seq: oss: copy SysEx payloads before handoff
Date: Fri, 22 May 2026 07:39:00 +0800
Message-Id: <20260521233900.478153-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OSS sequencer MIDI output path feeds bytes into an snd_midi_event
coder from snd_seq_oss_midi_putc().  When a SysEx message completes, the
coder builds a variable-length sequencer event whose data.ext.ptr still
points at the coder-owned buffer.

snd_seq_oss_midi_putc() returns after dropping the MIDI device use
reference, but the caller still owns the freshly built event and may
enqueue it afterwards.  A concurrent port-removal notification can
therefore run snd_seq_oss_midi_check_exit_port() and free the coder
buffer before snd_seq_event_dup() copies the variable payload.

The dangerous interleaving is:

write path:
    snd_seq_oss_midi_putc() completes a SysEx event whose
    data.ext.ptr points at mdev->coder storage.  It then returns and
    drops the mdev use reference.  insert_queue() later enqueues the
    variable-length event and snd_seq_event_dup() copies from
    event.data.ext.ptr.

teardown path:
    a PORT_EXIT notification reaches snd_seq_oss_midi_check_exit_port(),
    removes the MIDI device, and frees mdev->coder before the queued
    event is duplicated.

Serialize access to the MIDI coder and copy completed SysEx payloads
into caller-owned scratch storage before returning to the enqueue or
direct-dispatch side.  The copied payload remains valid until the
sequencer core has synchronously duplicated or delivered the event, so
teardown can no longer free the source buffer from under
snd_seq_event_dup().

KASAN report as below:

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
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
 sound/core/seq/oss/seq_oss_event.c |  8 ++++---
 sound/core/seq/oss/seq_oss_event.h |  4 +++-
 sound/core/seq/oss/seq_oss_ioctl.c |  6 +++--
 sound/core/seq/oss/seq_oss_midi.c  | 37 +++++++++++++++++++++++++++---
 sound/core/seq/oss/seq_oss_midi.h  |  3 ++-
 sound/core/seq/oss/seq_oss_rw.c    |  4 +++-
 6 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_event.c b/sound/core/seq/oss/seq_oss_event.c
index 76fb81077eef7..a94e10f29bef8 100644
--- a/sound/core/seq/oss/seq_oss_event.c
+++ b/sound/core/seq/oss/seq_oss_event.c
@@ -39,7 +39,9 @@ static int set_echo_event(struct seq_oss_devinfo *dp, union evrec *rec, struct s
  */
 
 int
-snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, struct snd_seq_event *ev)
+snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q,
+			  struct snd_seq_event *ev,
+			  unsigned char *buf, unsigned int buflen)
 {
 	switch (q->s.code) {
 	case SEQ_EXTENDED:
@@ -69,7 +71,8 @@ snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, struct snd
 		if (snd_seq_oss_midi_open(dp, q->s.dev, SNDRV_SEQ_OSS_FILE_WRITE))
 			break;
 		if (snd_seq_oss_midi_filemode(dp, q->s.dev) & SNDRV_SEQ_OSS_FILE_WRITE)
-			return snd_seq_oss_midi_putc(dp, q->s.dev, q->s.parm1, ev);
+			return snd_seq_oss_midi_putc(dp, q->s.dev, q->s.parm1,
+						     ev, buf, buflen);
 		break;
 
 	case SEQ_ECHO:
@@ -442,4 +445,3 @@ snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *private_data
 	}
 	return 0;
 }
-
diff --git a/sound/core/seq/oss/seq_oss_event.h b/sound/core/seq/oss/seq_oss_event.h
index b4f723949a170..261553b282fc8 100644
--- a/sound/core/seq/oss/seq_oss_event.h
+++ b/sound/core/seq/oss/seq_oss_event.h
@@ -91,7 +91,9 @@ union evrec {
 #define ev_is_long(ev) ((ev)->s.code >= 128)
 #define ev_length(ev) ((ev)->s.code >= 128 ? LONG_EVENT_SIZE : SHORT_EVENT_SIZE)
 
-int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, struct snd_seq_event *ev);
+int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q,
+			      struct snd_seq_event *ev,
+			      unsigned char *buf, unsigned int buflen);
 int snd_seq_oss_process_timer_event(struct seq_oss_timer *rec, union evrec *q);
 int snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *private_data, int atomic, int hop);
 
diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index ccf682689ec95..95982849b06c5 100644
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -14,6 +14,7 @@
 #include "seq_oss_synth.h"
 #include "seq_oss_midi.h"
 #include "seq_oss_event.h"
+#include <sound/seq_midi_event.h>
 
 static int snd_seq_oss_synth_info_user(struct seq_oss_devinfo *dp, void __user *arg)
 {
@@ -44,6 +45,7 @@ static int snd_seq_oss_midi_info_user(struct seq_oss_devinfo *dp, void __user *a
 static int snd_seq_oss_oob_user(struct seq_oss_devinfo *dp, void __user *arg)
 {
 	unsigned char ev[8];
+	unsigned char buf[MAX_MIDI_EVENT_BUF];
 	struct snd_seq_event tmpev;
 
 	if (copy_from_user(ev, arg, 8))
@@ -51,7 +53,8 @@ static int snd_seq_oss_oob_user(struct seq_oss_devinfo *dp, void __user *arg)
 	memset(&tmpev, 0, sizeof(tmpev));
 	snd_seq_oss_fill_addr(dp, &tmpev, dp->addr.client, dp->addr.port);
 	tmpev.time.tick = 0;
-	if (! snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev)) {
+	if (!snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev,
+				       buf, sizeof(buf))) {
 		snd_seq_oss_dispatch(dp, &tmpev, 0, 0);
 	}
 	return 0;
@@ -175,4 +178,3 @@ snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long ca
 	}
 	return 0;
 }
-
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index b50a49ca42ff3..a1f4c2d307584 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -38,6 +38,7 @@ struct seq_oss_midi {
 	struct seq_oss_devinfo *devinfo;	/* assigned OSSseq device */
 	snd_use_lock_t use_lock;
 	struct mutex open_mutex;
+	struct mutex coder_mutex;	/* protects coder buffer handoff */
 };
 
 DEFINE_FREE(seq_oss_midi, struct seq_oss_midi *, if (!IS_ERR_OR_NULL(_T)) snd_use_lock_free(&(_T)->use_lock))
@@ -57,6 +58,8 @@ static struct seq_oss_midi *get_mdev(int dev);
 static struct seq_oss_midi *get_mididev(struct seq_oss_devinfo *dp, int dev);
 static int send_synth_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, int dev);
 static int send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, struct seq_oss_midi *mdev);
+static int copy_midi_sysex(struct snd_seq_event *ev,
+			   unsigned char *buf, unsigned int buflen);
 
 /*
  * look up the existing ports
@@ -164,6 +167,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	mdev->opened = 0;
 	snd_use_lock_init(&mdev->use_lock);
 	mutex_init(&mdev->open_mutex);
+	mutex_init(&mdev->coder_mutex);
 
 	/* copy and truncate the name of synth device */
 	strscpy(mdev->name, pinfo->name, sizeof(mdev->name));
@@ -592,19 +596,46 @@ send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, struct seq
  * return 0 : enqueued
  *        non-zero : invalid - ignored
  */
+static int copy_midi_sysex(struct snd_seq_event *ev,
+			   unsigned char *buf, unsigned int buflen)
+{
+	unsigned int len = ev->data.ext.len & ~SNDRV_SEQ_EXT_MASK;
+
+	if (!buf || len > buflen)
+		return -EINVAL;
+
+	memcpy(buf, ev->data.ext.ptr, len);
+	ev->data.ext.ptr = buf;
+	ev->data.ext.len = len;
+	return 0;
+}
+
 int
-snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, struct snd_seq_event *ev)
+snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c,
+		      struct snd_seq_event *ev,
+		      unsigned char *buf, unsigned int buflen)
 {
 	struct seq_oss_midi *mdev __free(seq_oss_midi) =
 		get_mididev(dp, dev);
+	int rc = -EINVAL;
 
 	if (!mdev)
 		return -ENODEV;
+
+	mutex_lock(&mdev->coder_mutex);
 	if (snd_midi_event_encode_byte(mdev->coder, c, ev)) {
+		if (snd_seq_ev_is_variable(ev)) {
+			rc = copy_midi_sysex(ev, buf, buflen);
+			if (rc < 0)
+				goto unlock;
+		}
 		snd_seq_oss_fill_addr(dp, ev, mdev->client, mdev->port);
-		return 0;
+		rc = 0;
 	}
-	return -EINVAL;
+
+unlock:
+	mutex_unlock(&mdev->coder_mutex);
+	return rc;
 }
 
 /*
diff --git a/sound/core/seq/oss/seq_oss_midi.h b/sound/core/seq/oss/seq_oss_midi.h
index bcc1683773dfb..2da1fa3b97ffc 100644
--- a/sound/core/seq/oss/seq_oss_midi.h
+++ b/sound/core/seq/oss/seq_oss_midi.h
@@ -26,7 +26,8 @@ void snd_seq_oss_midi_open_all(struct seq_oss_devinfo *dp, int file_mode);
 int snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev);
 void snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev);
 int snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c,
-			  struct snd_seq_event *ev);
+			  struct snd_seq_event *ev,
+			  unsigned char *buf, unsigned int buflen);
 int snd_seq_oss_midi_input(struct snd_seq_event *ev, int direct, void *private);
 int snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev);
 int snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info *inf);
diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index 307ef98c44c7b..3177c92b7e2e9 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -11,6 +11,7 @@
 #include "seq_oss_readq.h"
 #include "seq_oss_writeq.h"
 #include "seq_oss_synth.h"
+#include <sound/seq_midi_event.h>
 #include <sound/seq_oss_legacy.h>
 #include "seq_oss_event.h"
 #include "seq_oss_timer.h"
@@ -153,6 +154,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 {
 	int rc = 0;
 	struct snd_seq_event event;
+	unsigned char buf[MAX_MIDI_EVENT_BUF];
 
 	/* if this is a timing event, process the current time */
 	if (snd_seq_oss_process_timer_event(dp->timer, rec))
@@ -164,7 +166,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 	event.type = SNDRV_SEQ_EVENT_NOTEOFF;
 	snd_seq_oss_fill_addr(dp, &event, dp->addr.client, dp->addr.port);
 
-	if (snd_seq_oss_process_event(dp, rec, &event))
+	if (snd_seq_oss_process_event(dp, rec, &event, buf, sizeof(buf)))
 		return 0; /* invalid event - no need to insert queue */
 
 	event.time.tick = snd_seq_oss_timer_cur_tick(dp->timer);
-- 
2.43.0

