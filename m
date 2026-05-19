Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8924CA278
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192724; cv=none; b=TdrwiysqJgFQZYNuEb5h8RSp3EaMSDjisH7KUsuLZ4dVKR+jXbA2st7+QLrMkoGYd7nDIiAFje1if0zSFqBAvXgtsfIcWza2YhPP+kArG1byf1Q55gsZlhLIdFwOD4i0A47S6BRsyNK/tQZB8YFj6EewJPu6NUAWrdcDyCuKcVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192724; c=relaxed/simple;
	bh=6elKY9A4W4DmGEhUTXH8w3CeG6y0eRYsDIdzvJnRCq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3Viq+fg//uHrAr54H6NsOjJiLAwJkpGYzBY8TYEW7c3TTWMHqXDX9jIMyp4/EEGzArzmWM83IQYJ2WmKWiEbOaWeqrW9XivBdRFTWHQhX0P5dsDkcWvwcvVVilbHkFdrcte4hsCQu2HgXvcMPJoQjZ0R2Nit7+C/EVTDWTcjwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xnDl5Mff; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DAhhSxYd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xnDl5Mff; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DAhhSxYd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xnDl5Mff";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DAhhSxYd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xnDl5Mff";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DAhhSxYd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94180680C3;
	Tue, 19 May 2026 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oBtIijnoQIHfGcEYaenvpfSFQbzuUrSgyj0wMFpecWA=;
	b=xnDl5Mff5wdPGljW/p6oPUB5dHW4tVA1Pc3Nbodw9dsZokPo5wApXRuBnAI6nNdKyAMea6
	N2das/ypCWqTTRXU0hkudLCNbxzkiYal1rZr3tdBWbpbpmmMHaxvW+Ho8ua//JVqFWa8q8
	9kOod5AqP2O+O7r8R5IR13aqSPiLpyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779192719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oBtIijnoQIHfGcEYaenvpfSFQbzuUrSgyj0wMFpecWA=;
	b=DAhhSxYd7nxjM5eK88QN2ZQxcPtVertEtCJ6li225cwgLtaqhrUx9fb1mwOIFlhP9wJ8t3
	uKbQ8P5U0/tAWsCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oBtIijnoQIHfGcEYaenvpfSFQbzuUrSgyj0wMFpecWA=;
	b=xnDl5Mff5wdPGljW/p6oPUB5dHW4tVA1Pc3Nbodw9dsZokPo5wApXRuBnAI6nNdKyAMea6
	N2das/ypCWqTTRXU0hkudLCNbxzkiYal1rZr3tdBWbpbpmmMHaxvW+Ho8ua//JVqFWa8q8
	9kOod5AqP2O+O7r8R5IR13aqSPiLpyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779192719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oBtIijnoQIHfGcEYaenvpfSFQbzuUrSgyj0wMFpecWA=;
	b=DAhhSxYd7nxjM5eK88QN2ZQxcPtVertEtCJ6li225cwgLtaqhrUx9fb1mwOIFlhP9wJ8t3
	uKbQ8P5U0/tAWsCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A0C3593A8;
	Tue, 19 May 2026 12:11:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KPXRHI9TDGp6agAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 12:11:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jake Lamberson <lamberson.jake@gmail.com>
Subject: [PATCH 1/2] ALSA: hda: Move irq pending work into hda-intel stream
Date: Tue, 19 May 2026 14:11:52 +0200
Message-ID: <20260519121157.28477-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Currently, the delayed IRQ handling for PCM streams is managed in a
single work embedded in hda_intel, but this is basically a per-stream
thing.  Due to the single work, we can't cancel the work properly at
closing each stream, for example.

For making the IRQ pending work to be stream-based, this patch changes
the following:

- An extended version of azx_dev (i.e. the hd-audio stream object) is
  defined for snd-hda-intel
- The irq_pending flag and irq_pending_work are moved to
  hda_intel_stream, so that they can be hda-intel stream specific
- The stream creation and assignment are refactored so that
  snd-hda-intel can handle individually;
  the snd-hda-intel specific workaround for stream tags is also moved
  to snd-hda-intel itself instead of the common code
- The irq pending work is canceled properly at free / shutdown

While we're at it, changed the bit field flag to bool, as the bit
field doesn't help much in our case.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/controller.c     | 26 ++-------
 sound/hda/common/hda_controller.h | 12 +++-
 sound/hda/controllers/intel.c     | 92 +++++++++++++++++++++----------
 sound/hda/controllers/intel.h     | 15 ++++-
 4 files changed, 89 insertions(+), 56 deletions(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index 5934e5cdfdfd..89e63a53d683 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -1264,19 +1264,17 @@ int azx_codec_configure(struct azx *chip)
 }
 EXPORT_SYMBOL_GPL(azx_codec_configure);
 
-static int stream_direction(struct azx *chip, unsigned char index)
+void azx_add_stream(struct azx *chip, struct azx_dev *azx_dev, int idx, int tag)
 {
-	if (index >= chip->capture_index_offset &&
-	    index < chip->capture_index_offset + chip->capture_streams)
-		return SNDRV_PCM_STREAM_CAPTURE;
-	return SNDRV_PCM_STREAM_PLAYBACK;
+	snd_hdac_stream_init(azx_bus(chip), azx_stream(azx_dev), idx,
+			     azx_stream_direction(chip, idx), tag);
 }
+EXPORT_SYMBOL_GPL(azx_add_stream);
 
 /* initialize SD streams */
 int azx_init_streams(struct azx *chip)
 {
 	int i;
-	int stream_tags[2] = { 0, 0 };
 
 	/* initialize each stream (aka device)
 	 * assign the starting bdl address to each stream (device)
@@ -1284,24 +1282,10 @@ int azx_init_streams(struct azx *chip)
 	 */
 	for (i = 0; i < chip->num_streams; i++) {
 		struct azx_dev *azx_dev = kzalloc_obj(*azx_dev);
-		int dir, tag;
 
 		if (!azx_dev)
 			return -ENOMEM;
-
-		dir = stream_direction(chip, i);
-		/* stream tag must be unique throughout
-		 * the stream direction group,
-		 * valid values 1...15
-		 * use separate stream tag if the flag
-		 * AZX_DCAPS_SEPARATE_STREAM_TAG is used
-		 */
-		if (chip->driver_caps & AZX_DCAPS_SEPARATE_STREAM_TAG)
-			tag = ++stream_tags[dir];
-		else
-			tag = i + 1;
-		snd_hdac_stream_init(azx_bus(chip), azx_stream(azx_dev),
-				     i, dir, tag);
+		azx_add_stream(chip, azx_dev, i, i + 1);
 	}
 
 	return 0;
diff --git a/sound/hda/common/hda_controller.h b/sound/hda/common/hda_controller.h
index 7434f38038a0..bc8ee4cc2401 100644
--- a/sound/hda/common/hda_controller.h
+++ b/sound/hda/common/hda_controller.h
@@ -57,13 +57,12 @@ enum {
 struct azx_dev {
 	struct hdac_stream core;
 
-	unsigned int irq_pending:1;
 	/*
 	 * For VIA:
 	 *  A flag to ensure DMA position is 0
 	 *  when link position is not greater than FIFO size
 	 */
-	unsigned int insufficient:1;
+	bool insufficient;
 };
 
 #define azx_stream(dev)		(&(dev)->core)
@@ -206,6 +205,15 @@ int azx_bus_init(struct azx *chip, const char *model);
 int azx_probe_codecs(struct azx *chip, unsigned int max_slots);
 int azx_codec_configure(struct azx *chip);
 int azx_init_streams(struct azx *chip);
+void azx_add_stream(struct azx *chip, struct azx_dev *s, int idx, int tag);
 void azx_free_streams(struct azx *chip);
 
+static inline int azx_stream_direction(struct azx *chip, unsigned char index)
+{
+	if (index >= chip->capture_index_offset &&
+	    index < chip->capture_index_offset + chip->capture_streams)
+		return SNDRV_PCM_STREAM_CAPTURE;
+	return SNDRV_PCM_STREAM_PLAYBACK;
+}
+
 #endif /* __SOUND_HDA_CONTROLLER_H */
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index c87d75dbd8aa..01477bd4fcb9 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -615,17 +615,17 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev);
 /* called from IRQ */
 static int azx_position_check(struct azx *chip, struct azx_dev *azx_dev)
 {
-	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
+	struct hda_intel_stream *istream = azx_dev_to_istream(azx_dev);
 	int ok;
 
 	ok = azx_position_ok(chip, azx_dev);
 	if (ok == 1) {
-		azx_dev->irq_pending = 0;
+		istream->irq_pending = false;
 		return ok;
 	} else if (ok == 0) {
 		/* bogus IRQ, process it later */
-		azx_dev->irq_pending = 1;
-		schedule_work(&hda->irq_pending_work);
+		istream->irq_pending = true;
+		schedule_work(&istream->irq_pending_work);
 	}
 	return 0;
 }
@@ -721,11 +721,13 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
  */
 static void azx_irq_pending_work(struct work_struct *work)
 {
-	struct hda_intel *hda = container_of(work, struct hda_intel, irq_pending_work);
+	struct hda_intel_stream *istream =
+		container_of(work, struct hda_intel_stream, irq_pending_work);
+	struct azx_dev *azx_dev = &istream->azx_dev;
+	struct hda_intel *hda = istream->hda;
 	struct azx *chip = &hda->chip;
 	struct hdac_bus *bus = azx_bus(chip);
-	struct hdac_stream *s;
-	int pending, ok;
+	int ok;
 
 	if (!hda->irq_pending_warned) {
 		dev_info(chip->card->dev,
@@ -735,28 +737,25 @@ static void azx_irq_pending_work(struct work_struct *work)
 	}
 
 	for (;;) {
-		pending = 0;
-		spin_lock_irq(&bus->reg_lock);
-		list_for_each_entry(s, &bus->stream_list, list) {
-			struct azx_dev *azx_dev = stream_to_azx_dev(s);
-			if (!azx_dev->irq_pending ||
-			    !s->substream ||
-			    !s->running)
-				continue;
+		scoped_guard(spinlock_irq, &bus->reg_lock) {
+			if (!istream->irq_pending ||
+			    !azx_dev->core.substream ||
+			    !azx_dev->core.running) {
+				return;
+			}
+
 			ok = azx_position_ok(chip, azx_dev);
-			if (ok > 0) {
-				azx_dev->irq_pending = 0;
-				spin_unlock(&bus->reg_lock);
-				snd_pcm_period_elapsed(s->substream);
-				spin_lock(&bus->reg_lock);
-			} else if (ok < 0) {
-				pending = 0;	/* too early */
-			} else
-				pending++;
+			if (ok < 0)
+				return; /* too early */
+			if (ok > 0)
+				istream->irq_pending = false;
 		}
-		spin_unlock_irq(&bus->reg_lock);
-		if (!pending)
+
+		if (ok) {
+			snd_pcm_period_elapsed(azx_dev->core.substream);
 			return;
+		}
+
 		msleep(1);
 	}
 }
@@ -767,10 +766,11 @@ static void azx_clear_irq_pending(struct azx *chip)
 	struct hdac_bus *bus = azx_bus(chip);
 	struct hdac_stream *s;
 
-	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(s, &bus->stream_list, list) {
 		struct azx_dev *azx_dev = stream_to_azx_dev(s);
-		azx_dev->irq_pending = 0;
+		struct hda_intel_stream *istream = azx_dev_to_istream(azx_dev);
+		istream->irq_pending = false;
+		cancel_work_sync(&istream->irq_pending_work);
 	}
 }
 
@@ -1797,7 +1797,6 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	if (jackpoll_ms[dev] >= 50 && jackpoll_ms[dev] <= 60000)
 		chip->jackpoll_interval = msecs_to_jiffies(jackpoll_ms[dev]);
 	INIT_LIST_HEAD(&chip->pcm_list);
-	INIT_WORK(&hda->irq_pending_work, azx_irq_pending_work);
 	INIT_LIST_HEAD(&hda->list);
 	init_vga_switcheroo(chip);
 	init_completion(&hda->probe_wait);
@@ -1846,6 +1845,39 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	return 0;
 }
 
+/* create and assign streams */
+static int hda_init_streams(struct azx *chip)
+{
+	int i;
+	int stream_tags[2] = { 0, 0 };
+
+	for (i = 0; i < chip->num_streams; i++) {
+		struct hda_intel_stream *s = kzalloc_obj(*s);
+		int tag, dir;
+
+		if (!s)
+			return -ENOMEM;
+
+		s->hda = container_of(chip, struct hda_intel, chip);
+		INIT_WORK(&s->irq_pending_work, azx_irq_pending_work);
+
+		/* stream tag must be unique throughout
+		 * the stream direction group,
+		 * valid values 1...15
+		 * use separate stream tag if the flag
+		 * AZX_DCAPS_SEPARATE_STREAM_TAG is used
+		 */
+		dir = azx_stream_direction(chip, i);
+		if (chip->driver_caps & AZX_DCAPS_SEPARATE_STREAM_TAG)
+			tag = ++stream_tags[dir];
+		else
+			tag = i + 1;
+		azx_add_stream(chip, &s->azx_dev, i, tag);
+	}
+
+	return 0;
+}
+
 static int azx_first_init(struct azx *chip)
 {
 	int dev = chip->dev_index;
@@ -2000,7 +2032,7 @@ static int azx_first_init(struct azx *chip)
 	}
 
 	/* initialize streams */
-	err = azx_init_streams(chip);
+	err = hda_init_streams(chip);
 	if (err < 0)
 		return err;
 
diff --git a/sound/hda/controllers/intel.h b/sound/hda/controllers/intel.h
index 2d1725f86ef1..4efb3b0fc2d8 100644
--- a/sound/hda/controllers/intel.h
+++ b/sound/hda/controllers/intel.h
@@ -9,9 +9,6 @@
 struct hda_intel {
 	struct azx chip;
 
-	/* for pending irqs */
-	struct work_struct irq_pending_work;
-
 	/* sync probing */
 	struct completion probe_wait;
 	struct delayed_work probe_work;
@@ -35,4 +32,16 @@ struct hda_intel {
 	int probe_retry;	/* being probe-retry */
 };
 
+struct hda_intel_stream {
+	struct azx_dev azx_dev;
+
+	/* for pending irqs */
+	struct hda_intel *hda;
+	struct work_struct irq_pending_work;
+	bool irq_pending;
+};
+
+#define azx_dev_to_istream(azx_dev) \
+	container_of(azx_dev, struct hda_intel_stream, azx_dev)
+
 #endif
-- 
2.54.0

