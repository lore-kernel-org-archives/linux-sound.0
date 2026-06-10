Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265BF38B157
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121829; cv=none; b=Vcu1QeBDjciRQOnFQrWpuRFeX9ORaQCtgx3ZoGMBrDRGyxfqmYfrB6egJJ1hoehSbWNMfytQmyQ+r+/7uqbeIFWT6cZVhvIYoE7pNxEkl5JqRcgTS8isMSMNR+VY/3/acrTd+EI53+Ct9o74MYFJKF5ZpHpiJsiDzZ4tyCTnVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121829; c=relaxed/simple;
	bh=cXApHyFlc2PqD9jOOpKMENeZir7591PNC8udpG2atDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVgZnU81GT2MX4SYWhPRYZ77aQ9ghei5weipfgBk27XlbMRCaYbtpjnzAmCGs3o5T0B51WwsDxQa3BPtoXyhhJHl0TOAFAGwyBBb43wEqqDzNgRXpPY0dK37asuhVATW9Fw0KriIGUrmtXvk7BEY9YJHsKTNEdAz2HO3G4QPxz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=rfoyasQ3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="rfoyasQ3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef5146b56so165846f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 13:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781121818; x=1781726618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9Ik/Hu7HfBReuRjOUx9ml3LLQi6HB3gr0pewSh4Yb4=;
        b=rfoyasQ36cysf2iZPFjUdIqnaYtymV8S6OJ+4gpsj6sonRe7L1aR+r70Np1mdyUtEa
         30N6+hlsCUf6gmjwpE/l1A0JE1cnK7Rbt5YaRSeZCtodEtGPMwWCrbBAoN77Ul30ZPS0
         jdEITKmnNleSKwe5upBUte8zOQgl1nuAFq1UT8ItLcVkWoCnJ9LahchHbfNtLEhxSMPZ
         1NsVtN4OCyr7A5Y4LU7HKthIzq0SUl/6C3liskkna8MZHJmA3Bwk4TocPMaLzkYpA7uM
         j773fVH9N5sLFTMkzkC8CmV2OKScjN5maUnBxyu8hAcEEjMRaypXmdq332EPuqGJs6SY
         OKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121818; x=1781726618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9Ik/Hu7HfBReuRjOUx9ml3LLQi6HB3gr0pewSh4Yb4=;
        b=ZhMFS0O4yAVmG3BIa5r3weKqbCkNpW8na9DmpmojQadTdEhyzmUrI6m5NS0zwOUoFb
         9I972v+o3+xp/m7QOoLmhhr2iEfRx6l04KmvjjfphB8Vb9XbckFyS2h4GU2UpE1cPsZW
         GFTHYTt+uTog3UtFvmMKWmFA0B3RFpFFn9cfu2Je3Vl6/l1zJ4M99eDD78Gv/R1nmtKz
         YF6KCo/gSiB4kpSh6mEWd4nlWOw89OBtSgVfFBQbGNjnOTLrDu779f+Wpf4dewm99Cyr
         EL6hlxHSCkBT1AOJDISPZO7mUIt+mC8DsuJNviG9UlDEZ7EzoNqJevqQFOvXddG59S0l
         1YXQ==
X-Gm-Message-State: AOJu0Yw4Zy/J4QNHAZLalTg1bNo14bZQ/Xx2EIFbsSbGBds0RiNlAMod
	LuHVpI/fV2xEPBWgUz+izQxQ3YjwjBBCm/e/wcfUZcb7ZAwTCYG2sflA075Y8lZ6WPGk
X-Gm-Gg: Acq92OFsOJOdWF3TEa4B1ph3Zoe6WJze12SrsA9DkvpJ4dAyOZTLYUm5E2KSFqWFc2V
	8XMXYhZWTFlb6YiYarRLYO2EVX1BUkVIOucBf1KiZKUwtL7Nk0ZrM1N51OKviyfdz1nqF0prrcF
	4lGWbMZdF/FcN7Xz11MlqmXjkaqo1m7EnBf+JB3g0PrC2p/t5mrmHru1HRwQ+W/Byl4mZ+SxmCS
	V5b2Ldb80t2YmrqMyPDBhFlJi/p3tsb5RG1z44+I+rkMpdK+IophpJwilP7HexnROHFa4RcyZvI
	f4KKgV04+YW/rF6DkQriMlAnPkZfn2Q/FGfFDsdQ8M1COQ/oX2O/iECNW/aDJhP803VDVv73VIK
	LpUCfu9IVzzxCFf7NR8wnX6jAkWr2SEIlg0kpW9o6iyKyuqw5L12NF3ltyrzY0tdN95b08pWLT3
	SPVSJctN2tCgcFO7cbXqHbvHoKH1cjrax9QhviPRKWHMhfHhHWUGRGdx8wCvnrY+CQpK+ebbwOH
	RQMQFCOHDO1yU6Z//zwt+RqLzW+rQDNxdeOaRRIHaiFUPktlEQxRAS2
X-Received: by 2002:a05:6000:2995:20b0:460:3210:950d with SMTP id ffacd0b85a97d-4606653b57fmr109506f8f.21.1781121818328;
        Wed, 10 Jun 2026 13:03:38 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.222.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm81714147f8f.5.2026.06.10.13.03.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jun 2026 13:03:37 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: seq: fix use-after-free of borrowed substream in snd-seq-midi
Date: Wed, 10 Jun 2026 22:03:36 +0200
Message-ID: <20260610200336.33979-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

event_process_midi() borrows the rawmidi output substream via
msynth->output_rfile.output and uses it through dump_midi() ->
snd_rawmidi_kernel_write() -> snd_rawmidi_kernel_write1() without
synchronizing against a concurrent port unsubscribe.

A concurrent UNSUBSCRIBE_PORT on the output connection runs the
unuse callback midisynth_unuse() -> snd_rawmidi_kernel_release() ->
close_substream() -> snd_rawmidi_runtime_free(), freeing
substream->runtime while an in-flight event_input callback is still
inside snd_rawmidi_kernel_write1(). The borrowed substream runtime is
exposed to teardown before the write path takes its own buffer
reference (snd_rawmidi_buffer_ref()), so the early derefs of
substream->runtime / runtime->buffer read freed memory.

The buggy scenario involves two paths, with each column showing the
order within that path:

  path A: event_input path                path B: last unuse path
  1. event_process_midi() reads           1. midisynth_unuse() runs on the
     msynth->output_rfile.output.            last UNSUBSCRIBE_PORT.
  2. snd_rawmidi_kernel_write1() has      2. snd_rawmidi_kernel_release()
     not yet pinned runtime.                 closes the output file.
  3. The writer continues using           3. close_substream() frees
     the borrowed substream.                 substream->runtime.

This is the snd-seq-midi sibling of the UMP-bridge race fixed by
commit 60a1969fae62 ("ALSA: seq: Serialize UMP output teardown with
event_input"); mirror its approach here.

Add a per-msynth rwlock for the event_input-visible output file.
Publish a newly opened output file under the write side once it is
fully set up, and hold the read side from the output lookup through
snd_rawmidi_kernel_write() in event_process_midi(). The last unuse
copies and clears the visible output file under the write side, then
drops the lock and drains/releases the saved rawmidi file outside it
(drain/release may sleep). Use IRQ-safe rwlock guards because
event_input can be reached from atomic sequencer delivery.

Reproduced under KASAN: a single subscription to the midisynth output
port (so the subscriber count oscillates 0<->1 and every unsubscribe
frees the runtime via snd_rawmidi_kernel_release) is raced against a
flood of events driving event_process_midi -> snd_rawmidi_kernel_write1.
The narrow window (the runtime is read before snd_rawmidi_buffer_ref())
was widened with an injected delay to land the race deterministically;
the freed object is the kmalloc-192 snd_rawmidi_runtime. With this patch
applied the same forced race shows no use-after-free.

  BUG: KASAN: slab-use-after-free in snd_rawmidi_kernel_write1+0x73e/0x800
  Read of size 8 at addr ffff88800b04f310 by task seqmidi_uaf2/84
  Call Trace:
   snd_rawmidi_kernel_write1+0x73e/0x800
   __dump_midi+0x70/0x100
   dump_var_event+0x290/0x320
   event_process_midi+0x1ff/0x310
   snd_seq_deliver_single_event+0x1e6/0x670
   snd_seq_deliver_event+0x323/0x5f0
   snd_seq_client_enqueue_event.constprop.0+0x226/0x400
   snd_seq_write+0x2f1/0x530
   vfs_write+0x21e/0xd30
   ksys_write+0x17c/0x1c0
   do_syscall_64+0xf9/0x540

  Allocated by task 85:
   open_substream+0xc7/0x7a0
   rawmidi_open_priv+0x3df/0x660
   snd_rawmidi_kernel_open+0x95/0x140
   midisynth_use+0xda/0x1f0
   check_and_subscribe_port+0x707/0xbd0
   snd_seq_ioctl_subscribe_port+0x1f4/0x400

  Freed by task 85:
   close_substream.part.0+0x1f9/0x790
   rawmidi_release_priv+0x1b0/0x240
   snd_rawmidi_kernel_release+0x2d/0xb0
   __delete_and_unsubscribe_port+0x1b9/0x3c0
   snd_seq_ioctl_unsubscribe_port+0x1ee/0x400

  The buggy address belongs to the object at ffff88800b04f300
   which belongs to the cache kmalloc-192 of size 192

Found by 0sec.
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 sound/core/seq/seq_midi.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index ca3f5fc30992..c79c628561ce 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -18,6 +18,7 @@ Possible options for midisynth module:
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <sound/core.h>
 #include <sound/rawmidi.h>
 #include <sound/seq_kernel.h>
@@ -43,6 +44,7 @@ struct seq_midisynth {
 	int subdevice;
 	struct snd_rawmidi_file input_rfile;
 	struct snd_rawmidi_file output_rfile;
+	rwlock_t output_lock;	/* protects output_rfile.output access */
 	int seq_client;
 	int seq_port;
 	struct snd_midi_event *parser;
@@ -129,6 +131,13 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 
 	if (snd_BUG_ON(!msynth))
 		return -EINVAL;
+	/*
+	 * Hold the read side across the whole borrowed-substream use so a
+	 * concurrent port unsubscribe (midisynth_unuse) cannot release the
+	 * rawmidi file and free substream->runtime under us. IRQ-safe because
+	 * event_input can be reached from atomic sequencer delivery.
+	 */
+	guard(read_lock_irqsave)(&msynth->output_lock);
 	substream = msynth->output_rfile.output;
 	if (substream == NULL)
 		return -ENODEV;
@@ -160,6 +169,7 @@ static int snd_seq_midisynth_new(struct seq_midisynth *msynth,
 {
 	if (snd_midi_event_new(MAX_MIDI_EVENT_BUF, &msynth->parser) < 0)
 		return -ENOMEM;
+	rwlock_init(&msynth->output_lock);
 	msynth->card = card;
 	msynth->device = device;
 	msynth->subdevice = subdevice;
@@ -215,12 +225,13 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 {
 	int err;
 	struct seq_midisynth *msynth = private_data;
+	struct snd_rawmidi_file rfile = {};
 	struct snd_rawmidi_params params;
 
 	/* open midi port */
 	err = snd_rawmidi_kernel_open(msynth->rmidi, msynth->subdevice,
 				      SNDRV_RAWMIDI_LFLG_OUTPUT,
-				      &msynth->output_rfile);
+				      &rfile);
 	if (err < 0) {
 		pr_debug("ALSA: seq_midi: midi output open failed!!!\n");
 		return err;
@@ -229,12 +240,15 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
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
+	/* publish the opened file only after it is fully set up */
+	scoped_guard(write_lock_irqsave, &msynth->output_lock)
+		msynth->output_rfile = rfile;
 	return 0;
 }
 
@@ -242,11 +256,22 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 static int midisynth_unuse(void *private_data, struct snd_seq_port_subscribe *info)
 {
 	struct seq_midisynth *msynth = private_data;
-
-	if (snd_BUG_ON(!msynth->output_rfile.output))
+	struct snd_rawmidi_file rfile = {};
+
+	/*
+	 * Detach the borrowed output file under the write side so any in-flight
+	 * event_process_midi() either still sees the live substream (and is
+	 * drained out by the read lock) or sees NULL. Then drain and release
+	 * outside the lock, since those paths may sleep.
+	 */
+	scoped_guard(write_lock_irqsave, &msynth->output_lock) {
+		rfile = msynth->output_rfile;
+		msynth->output_rfile = (struct snd_rawmidi_file){};
+	}
+	if (snd_BUG_ON(!rfile.output))
 		return -EINVAL;
-	snd_rawmidi_drain_output(msynth->output_rfile.output);
-	return snd_rawmidi_kernel_release(&msynth->output_rfile);
+	snd_rawmidi_drain_output(rfile.output);
+	return snd_rawmidi_kernel_release(&rfile);
 }
 
 /* delete given midi synth port */
-- 
2.43.0

