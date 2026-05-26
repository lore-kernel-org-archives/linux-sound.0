Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67671D5CD1
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809179; cv=none; b=cr4jaNC+kJm0AMQk3/6mAbiQVeYzJzJg7o9UsB23DdLr3lVpiegNL1XUqoKdvpCWV5dCaMwRnKKCZSeVsOL55EJlpd/ZM6IpaaNbjU0hkP/p+L4trELDO4VagoT558nynoMpoNrd16DRP4VScGFc5efdJLcBP2fq5Dj1lB/YvL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809179; c=relaxed/simple;
	bh=SRUrxk0jQMECROBCKrBkw3sSs5AFF/NDiJTbXObbw/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rpIy2ifbDIHb9H3ZrfE9TiJ2XpD89hqEUoVmkjNWFgrclAOhR9lQnmwrJvUd2BXJ7j/I40M/xoIJLAjSeBVgvhrXmyzYBUFT34GGZPcd89i7DaokanZl2PN6mZ+YxmJvXmJE2JIWG1ublDlOyNSiCp5mPItq0bJ7DD6kI5hpZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQhd03R0; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQhd03R0"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c801912c903so4779869a12.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779809176; x=1780413976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXhvDMTVMMUhsFNc2MO0bSQYrkXjyhTt35+Xy2fE/lg=;
        b=FQhd03R0VNd+aWLL5M5UCqNNIWcQJeXJTSOGGikYbVkCmbK47Jmi5WDZFbyXCa4FiG
         c9lNOyEPPqM5iy9vl94nKescp+Zhfp89toXf8SvAjNQdZuqkNmmbXPKyib+S+um33bQ9
         jZXccQAkXGChd36Ie8vvRC5qmLhhtn/e4QkWVByxkgQu3txswmad60h93uL0LHKHrEk7
         hYQjYpALT+BA4WOLTY1Yj/3Kn1b+Jh2KJZivCkSZi82sayadIMvevQ4T5rc0TbROvWTn
         ZA+WeG9EqjmH+h0eN6f2kaTbUaLo6BRxnwuVXefIGomIIRVnhcB8f6ixBeoVTAQkOn+R
         t3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809176; x=1780413976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXhvDMTVMMUhsFNc2MO0bSQYrkXjyhTt35+Xy2fE/lg=;
        b=pqMK8ldHvHHaNAh0HWh3C1/6l87GXf1uAE0sl8j/UigdIrl2RcVLC1ZW/Ld2FT7t+r
         nJsKm+4liT014AMgtPgt/SbF0wQ7T4mIbBheyyCWepzyHPXy3Pe/nFpDWgUZylT9LIQI
         PB2qOUQritKYIsgYnWa1Eeay6XxaJ22OZxjETeHu6sl8aWg/AlwVx64fN6bdVxuox75I
         lFSbxl2cnWrQRHNp+bfGLjSKYOJ2/PupRFC+pEROuBu6YNPkuJkFSadTJPouyHkq7oc4
         /4vprAJIUoVrFk3W7aT+LqJgShnmyvpR5N1w+UQAu7GdJcnq4BteGKyzWFyLHH+Q2OWq
         TXWA==
X-Gm-Message-State: AOJu0Yx8V9wXZ4lq1Sgv2Upx2GPIrqwKsn1A+Et/IRM4qPsCL0HRZvVn
	ER7zoHrTYifp/kAzCVjowaK0p/bUW8Mt2KV2VmpAHHRr7XDnzqywMg7h
X-Gm-Gg: Acq92OF/Ds8/fhFSoO86oRCZzHOfNDtorS3OeUjKiU/HC16oXNRPHB24ZK4xNmHS22/
	OCwVdXIBf17o5cOs10rNTiOrz5Copz7VDBcIB1dTSPRr1Oop4S9GA3H9TnolikXj3ORWOM9OfOy
	otClsasavDjJfjgiJ0iB6EYkgSk7V0qhYYOmuFS5Q3P8SHsK/4msqABkcRPfeqZUnVEVySHnLSp
	Ac1sg3fmvIiGYrDY6vg2eaILCBisQ+axi/kb0qIWODqpOpws8qZyow5sYXnfdFfAtYbGdVsDzTS
	rlrwPTtNb9FFbGHq96nDWeQtC45PljuxtmCq7YnkSXzAdYeMmYCbB+c5f/auuOWW4aQi2o/Mefg
	6a9ruLCV2a9UP23jBCLkgK8ODZ6nfq6avMSDNyyqw/t0z6P2HoNPGQH208vPEi8NzQR8NYiCmFi
	/iq9IU4Jd4yoywEFEXnnEuBp2uUYPBKLE=
X-Received: by 2002:a05:6a20:9f07:b0:3a0:b65a:5def with SMTP id adf61e73a8af0-3b328e9d0b6mr19968629637.33.1779809175676;
        Tue, 26 May 2026 08:26:15 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056dfb1sm10082727a12.28.2026.05.26.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:26:15 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] ALSA: seq: midi: Serialize output teardown with event_input
Date: Tue, 26 May 2026 23:26:08 +0800
Message-Id: <20260526152608.1250473-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

event_process_midi() borrows msynth->output_rfile.output and then
passes the substream to dump_midi() and snd_rawmidi_kernel_write()
without synchronizing with the output open/close transition.
midisynth_use() also publishes output_rfile before
snd_rawmidi_output_params() has finished.

The last midisynth_unuse() can therefore release the same rawmidi file
and free substream->runtime before snd_rawmidi_kernel_write1() takes
its runtime buffer reference. That leaves the event_input path using a
stale substream or runtime and can end in a NULL-deref or use-after-free.

Fix this with two pieces of synchronization. Keep a short IRQ-safe
spinlock only for publishing or clearing output_rfile and for pairing
the output snapshot with an snd_use_lock_t reference. Once
event_process_midi() has taken that in-flight reference, it drops the
spinlock before calling snd_seq_dump_var_event(), dump_midi(), or
snd_rawmidi_kernel_write(). midisynth_unuse() now detaches the visible
rawmidi file under the same spinlock, waits for the in-flight writers
to drain, and only then drains and releases the saved file.
midisynth_use() likewise opens into a local snd_rawmidi_file and
publishes it only after snd_rawmidi_output_params() succeeds.

The buggy scenario involves two paths, with each column showing the
order within that path:

event_input path:                     last unuse path:
1. event_process_midi() snapshots    1. midisynth_unuse() starts
   output_rfile.output.                 tearing down output_rfile.
2. dump_midi() reaches               2. snd_rawmidi_kernel_release()
   snd_rawmidi_kernel_write()           closes the output file.
   before runtime is pinned.         3. close_substream() frees
3. The callback keeps using             substream->runtime.
   the borrowed substream.

Validation reproduced this kernel report:
KASAN null-ptr-deref in snd_rawmidi_kernel_write1+0x56/0x360
RIP: 0033:0x7fde7dd0837f
RIP: 0010:snd_rawmidi_kernel_write1+0x56/0x360
Read of size 8
Call trace:
  dump_stack_lvl+0x73/0xb0 (?:?)
  print_report+0x43e/0x650 (?:?)
  srso_alias_return_thunk+0x5/0xfbef5 (?:?)
  rcu_is_watching+0x24/0x60 (?:?)
  __virt_addr_valid+0x2f/0x340 (?:?)
  kasan_addr_to_slab+0x11/0xa0 (?:?)
  kasan_report+0xf7/0x130 (?:?)
  snd_rawmidi_kernel_write1+0x56/0x360 (?:?)
  __asan_load8+0x82/0xb0 (?:?)
  snd_rawmidi_kernel_write1+0x5/0x360 (?:?)
  snd_rawmidi_kernel_write+0x1a/0x20 (?:?)
  event_process_midi+0x125/0x220 (sound/core/seq/seq_midi.c:122)
  __entry_text_end+0xfdeb5/0x101fb9 (?:?)
  __kasan_check_write+0x18/0x20 (?:?)
  __snd_seq_deliver_single_event+0x8a/0xe0 (?:?)
  snd_seq_deliver_single_event+0x241/0x4b0 (?:?)
  do_raw_read_unlock+0x32/0xa0 (?:?)
  __deliver_to_subscribers+0x217/0x380 (?:?)
  snd_seq_deliver_event+0x91/0x1b0 (?:?)
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
  __x64_sys_write+0x46/0x60 (?:?)
  x64_sys_call+0x7d/0x20d0 (?:?)
  do_syscall_64+0xc1/0x360 (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
 sound/core/seq/seq_midi.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index ca3f5fc309927..f8520bd352253 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -24,6 +24,7 @@ Possible options for midisynth module:
 #include <sound/seq_device.h>
 #include <sound/seq_midi_event.h>
 #include <sound/initval.h>
+#include "seq_lock.h"
 
 MODULE_AUTHOR("Frank van de Pol <fvdpol@coil.demon.nl>, Jaroslav Kysela <perex@perex.cz>");
 MODULE_DESCRIPTION("Advanced Linux Sound Architecture sequencer MIDI synth.");
@@ -42,6 +43,8 @@ struct seq_midisynth {
 	int device;
 	int subdevice;
 	struct snd_rawmidi_file input_rfile;
+	spinlock_t output_lock;		/* protects output_rfile publication */
+	snd_use_lock_t output_use_lock;	/* in-flight event_input users */
 	struct snd_rawmidi_file output_rfile;
 	int seq_client;
 	int seq_port;
@@ -125,31 +128,44 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 	struct seq_midisynth *msynth = private_data;
 	unsigned char msg[10];	/* buffer for constructing midi messages */
 	struct snd_rawmidi_substream *substream;
+	unsigned long flags;
+	int err = 0;
 	int len;
 
 	if (snd_BUG_ON(!msynth))
 		return -EINVAL;
+
+	spin_lock_irqsave(&msynth->output_lock, flags);
 	substream = msynth->output_rfile.output;
-	if (substream == NULL)
+	if (substream)
+		snd_use_lock_use(&msynth->output_use_lock);
+	spin_unlock_irqrestore(&msynth->output_lock, flags);
+
+	if (!substream)
 		return -ENODEV;
 	if (ev->type == SNDRV_SEQ_EVENT_SYSEX) {	/* special case, to save space */
 		if ((ev->flags & SNDRV_SEQ_EVENT_LENGTH_MASK) != SNDRV_SEQ_EVENT_LENGTH_VARIABLE) {
 			/* invalid event */
 			pr_debug("ALSA: seq_midi: invalid sysex event flags = 0x%x\n", ev->flags);
-			return 0;
+			goto out;
 		}
 		snd_seq_dump_var_event(ev, __dump_midi, substream);
 		snd_midi_event_reset_decode(msynth->parser);
 	} else {
-		if (msynth->parser == NULL)
-			return -EIO;
+		if (!msynth->parser) {
+			err = -EIO;
+			goto out;
+		}
 		len = snd_midi_event_decode(msynth->parser, msg, sizeof(msg), ev);
 		if (len < 0)
-			return 0;
+			goto out;
 		if (dump_midi(substream, msg, len) < 0)
 			snd_midi_event_reset_decode(msynth->parser);
 	}
-	return 0;
+
+out:
+	snd_use_lock_free(&msynth->output_use_lock);
+	return err;
 }
 
 
@@ -163,6 +179,8 @@ static int snd_seq_midisynth_new(struct seq_midisynth *msynth,
 	msynth->card = card;
 	msynth->device = device;
 	msynth->subdevice = subdevice;
+	spin_lock_init(&msynth->output_lock);
+	snd_use_lock_init(&msynth->output_use_lock);
 	return 0;
 }
 
@@ -215,12 +233,14 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 {
 	int err;
 	struct seq_midisynth *msynth = private_data;
+	struct snd_rawmidi_file rfile = {};
 	struct snd_rawmidi_params params;
+	unsigned long flags;
 
 	/* open midi port */
 	err = snd_rawmidi_kernel_open(msynth->rmidi, msynth->subdevice,
 				      SNDRV_RAWMIDI_LFLG_OUTPUT,
-				      &msynth->output_rfile);
+				      &rfile);
 	if (err < 0) {
 		pr_debug("ALSA: seq_midi: midi output open failed!!!\n");
 		return err;
@@ -229,12 +249,15 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 	params.avail_min = 1;
 	params.buffer_size = output_buffer_size;
 	params.no_active_sensing = 1;
-	err = snd_rawmidi_output_params(msynth->output_rfile.output, &params);
+	err = snd_rawmidi_output_params(rfile.output, &params);
 	if (err < 0) {
-		snd_rawmidi_kernel_release(&msynth->output_rfile);
+		snd_rawmidi_kernel_release(&rfile);
 		return err;
 	}
 	snd_midi_event_reset_decode(msynth->parser);
+	spin_lock_irqsave(&msynth->output_lock, flags);
+	msynth->output_rfile = rfile;
+	spin_unlock_irqrestore(&msynth->output_lock, flags);
 	return 0;
 }
 
@@ -242,11 +265,20 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 static int midisynth_unuse(void *private_data, struct snd_seq_port_subscribe *info)
 {
 	struct seq_midisynth *msynth = private_data;
+	struct snd_rawmidi_file rfile = {};
+	unsigned long flags;
 
-	if (snd_BUG_ON(!msynth->output_rfile.output))
+	spin_lock_irqsave(&msynth->output_lock, flags);
+	rfile = msynth->output_rfile;
+	msynth->output_rfile = (struct snd_rawmidi_file){};
+	spin_unlock_irqrestore(&msynth->output_lock, flags);
+
+	if (snd_BUG_ON(!rfile.output))
 		return -EINVAL;
-	snd_rawmidi_drain_output(msynth->output_rfile.output);
-	return snd_rawmidi_kernel_release(&msynth->output_rfile);
+
+	snd_use_lock_sync(&msynth->output_use_lock);
+	snd_rawmidi_drain_output(rfile.output);
+	return snd_rawmidi_kernel_release(&rfile);
 }
 
 /* delete given midi synth port */
-- 
2.43.0

