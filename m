Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3733E358
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779863396; cv=none; b=pyTFOcOESLcgUJwr1dDEvWNq7DKK7Qn4+4oG3nzDoKJ/jxv/E3hgpB/LixrQv2+oEWwJ/XrfaJJgzNOcmHXSprP8tQVAnrLdmebHpEbCmy/2wlGuINGH3kbVqmYHqQs4ihQMPdjGjBxa0Fq9D3WKa51y23PwZOh5mqFLAJFeT9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779863396; c=relaxed/simple;
	bh=rzofBfo1GKzZPsVF1L9CG1k0p53/qJR94RGP8EWBfX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KHOZ1UZQ/3hpn7e5w3wjURGSICkcJx8HkdrgwsKhMiT01gY+4qwwrfjVvp2d6Ac5ehVacUosrj3H5XFgDWldLnqyGBP9L3/tE6lMTa7kg9bP7oy1MTY+W9rRkkl+OVgPWu31oeaPipC39qg4niaL4auo1PTDdqQJj5NYq22stBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UInwuVg2; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UInwuVg2"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so7896904b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779863394; x=1780468194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJBe3vwF2QrPs3DYcUmdSptzLr4CaPZGGU2RkazVWwQ=;
        b=UInwuVg2m4E0qGy6qfc6PRMXQOnz4RQum2ffbmHJSjPSXkhOOxROi6MGAAt1Wxc3IG
         A/golsqEKbjaijJ69ariph5Dbhwui5XihAjNmi5jdClCBs40cYGaYJNPzZL3+xyTuDc0
         402y/odnEKFy4DVMfuYOqC+eDzYHtgydnilfmkiPapKC88xsV+tgyyalGVpjtTG2Yq6H
         /eYUkpIlZ4rDeKcGI1GJW4pvGX4SVdyR4Mq6goNPYKxmTeAQsD7ObHjxBkRFxGm2jD8I
         0058ErhICQ2whkmxi6JleW+FbXC9kkIwXN+sAvXN469Cqy4cP9gan6/Bsa6cem05PqMN
         JV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779863394; x=1780468194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJBe3vwF2QrPs3DYcUmdSptzLr4CaPZGGU2RkazVWwQ=;
        b=JyJplO2FDfKn6Gr16jAhazBqS4lsLWv0CQHDdmSdVKuytpoAfvfiQiFWyeKz/psrNz
         4MmbqmJ0buCjlCGnupbu8toOpSQ86ut/HL/x6xTFSqEbT3WltI9B681ZiSRPYMDSsYDU
         MyX0g+bUqBqmsP+WlXWOmQtrsgRvdeQfGh4kMlKnxC4wA/GI1ENTK6Oah1ApbjwtyHvp
         wbUQmz9ozazp0SklMWSOfOx0rv3kKcPe40z+xRWfDdEcMpGhwRrva30jF3UABJK4wuEO
         N7m4/aDT5Ll0tzrrrpoRv3JavMwbR9Mv9w8eir5+Z4muB9SG5zvG6pIIGjTAequutoL2
         t/lA==
X-Gm-Message-State: AOJu0YxgTWIZAsCvs+032HhxXFQG+NcKGeIYxtjtnwvM9sAWTEG/Jl6c
	rlblgQmUEaxazrzL+Ui2IhjcbIHxjbnoYnG3Mi26W8IA8J4QH8lVhstGSPiViGkfvxx6SA==
X-Gm-Gg: Acq92OFiqRa7MHNxtIRdYcJJK0u/w2tavOjiETXgkSpaqJB0BMHTYt2pbj3ASBFCSQZ
	9Xf30gwjysjhCkM/e4wb4+jRS03QICS9NxmlLl/s4IslYHUf3NNCSw02PGPJJ2gMptjYadB7qQY
	UwArf8qwWGO+EJOYRKnmZN5N2S5nmmVJGBYQ7oFkkWLlENrlanfjbdX46g4jKWsa3ItFtxV6CMo
	L/MveL47ZT8KEj9thM+jtcMVOpAfs3Y/8rjtpHR+wCV/w/qWDtFq5clJscu5aHsg20JJbdMXFrA
	E4eimIzPaHrGGLI+HR6P9aTHOtHVMuItuubHe+NknkUAI2UPJTSBrisH8BkZOF0Uy+9/c1FXz59
	qvm5lIZdoKPCpfCUC1Fl3HMuGZqit5zIq84g/xnO8MDmnE3kY27gFEUA1JxYtagwzCsTMdYpeAd
	bYeAUzMkfQ8ag+haL5sJeXrIniq10LIxe/WTM8jVsGuA==
X-Received: by 2002:a05:6a00:298f:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-8415f3fcafdmr19435866b3a.13.1779863394449;
        Tue, 26 May 2026 23:29:54 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70bbf31sm1430399b3a.28.2026.05.26.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:29:54 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH v2] ALSA: seq: midi: Serialize output teardown with event_input
Date: Wed, 27 May 2026 14:29:48 +0800
Message-Id: <20260527062948.3614025-1-rollkingzzc@gmail.com>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
v2:
Use scoped_guard() for the short output_lock sections and drop the explicit
irq flags variable, as suggested by Takashi Iwai.

 sound/core/seq/seq_midi.c | 55 +++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index ca3f5fc309927..2eb12199c92f9 100644
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
@@ -125,31 +128,42 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 	struct seq_midisynth *msynth = private_data;
 	unsigned char msg[10];	/* buffer for constructing midi messages */
 	struct snd_rawmidi_substream *substream;
+	int err = 0;
 	int len;
 
 	if (snd_BUG_ON(!msynth))
 		return -EINVAL;
-	substream = msynth->output_rfile.output;
-	if (substream == NULL)
-		return -ENODEV;
+
+	scoped_guard(spinlock_irqsave, &msynth->output_lock) {
+		substream = msynth->output_rfile.output;
+		if (!substream)
+			return -ENODEV;
+		snd_use_lock_use(&msynth->output_use_lock);
+	}
+
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
 
 
@@ -163,6 +177,8 @@ static int snd_seq_midisynth_new(struct seq_midisynth *msynth,
 	msynth->card = card;
 	msynth->device = device;
 	msynth->subdevice = subdevice;
+	spin_lock_init(&msynth->output_lock);
+	snd_use_lock_init(&msynth->output_use_lock);
 	return 0;
 }
 
@@ -215,12 +231,13 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
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
@@ -229,12 +246,14 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
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
+	scoped_guard(spinlock_irqsave, &msynth->output_lock)
+		msynth->output_rfile = rfile;
 	return 0;
 }
 
@@ -242,11 +261,19 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 static int midisynth_unuse(void *private_data, struct snd_seq_port_subscribe *info)
 {
 	struct seq_midisynth *msynth = private_data;
+	struct snd_rawmidi_file rfile = {};
 
-	if (snd_BUG_ON(!msynth->output_rfile.output))
+	scoped_guard(spinlock_irqsave, &msynth->output_lock) {
+		rfile = msynth->output_rfile;
+		msynth->output_rfile = (struct snd_rawmidi_file){};
+	}
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

