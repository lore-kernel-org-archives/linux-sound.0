Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26FF346AE9
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894012; cv=none; b=lvf3djgWswd63rzNYYo2m9eFfX/P9Sa6VXfBBwLUF2TeDjjrWZeYENo0FArxjRcmf6MFnEZOrVrTHrxc5nKg5+fJKuapYcCFS/8KWboAEAEbY0F2r5AhIB01oo2fRpW9Kml00wdPchtuCpCpNCoMHHf3owYDEocb/U6ox/6OTOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894012; c=relaxed/simple;
	bh=hM/YA6JN+4rYWizfF2MyzrfHv37YG1vHfEs8zUqm8Kc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbA0U+Yo4CU00haQuhD2+e8d/h/7GCtUFy1CqD51uG7MOG2G4vbc4R7dl1kCP6XhNWrCxqaufNfC8t8ecTc/xQ5sPuM3SL+pBJTE1+wzJkFmGMCGBHmGFYJa4eG9fBneY6fWl18PbcqIiVnKvrpdLMvb5LRtYKPH+/keLKAoaaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a4AGY4II; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m8+Vwb6L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a4AGY4II; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m8+Vwb6L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a4AGY4II";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m8+Vwb6L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a4AGY4II";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m8+Vwb6L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D39B95BCE7;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i54KoCALi/QHG9XJx+qCOWeN4rljvY/Er+vm+Fuaf34=;
	b=a4AGY4IIVcdXJdaifMdrg3b1RlrgDEjcjy1ttXLMiTtLj9+Z64ZEdt/Xb24NoM5eOgE1r1
	TkW5t9Pu5/spUUifjtTnaZiNS3XZxtDXtXWY93ltabhH6AcBhIOvPFSKIbsU7iIBM9EMcn
	yCateFPGysSJv/Gsue7LRBjMGfThIx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i54KoCALi/QHG9XJx+qCOWeN4rljvY/Er+vm+Fuaf34=;
	b=m8+Vwb6LdifNhjYg9JBWXNps8FMAW/it8q4ePdJG0Hc86O+AaBgiAqpynqndk+l4Ff6ciC
	72hJZp0ROQAimKCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i54KoCALi/QHG9XJx+qCOWeN4rljvY/Er+vm+Fuaf34=;
	b=a4AGY4IIVcdXJdaifMdrg3b1RlrgDEjcjy1ttXLMiTtLj9+Z64ZEdt/Xb24NoM5eOgE1r1
	TkW5t9Pu5/spUUifjtTnaZiNS3XZxtDXtXWY93ltabhH6AcBhIOvPFSKIbsU7iIBM9EMcn
	yCateFPGysSJv/Gsue7LRBjMGfThIx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i54KoCALi/QHG9XJx+qCOWeN4rljvY/Er+vm+Fuaf34=;
	b=m8+Vwb6LdifNhjYg9JBWXNps8FMAW/it8q4ePdJG0Hc86O+AaBgiAqpynqndk+l4Ff6ciC
	72hJZp0ROQAimKCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0D073EA68;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QGDwLXJnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/11] ALSA: seq: oss: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:27 +0100
Message-ID: <20251216140634.171890-6-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216140634.171890-1-tiwai@suse.de>
References: <20251216140634.171890-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.903];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.78

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Fixes: 80ccbe91adab ("ALSA: seq: oss/synth: Clean up with guard and auto cleanup")
Fixes: 895a46e034f9 ("ALSA: seq: oss/midi: Cleanup with guard and auto-cleanup")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_init.c  |  4 +--
 sound/core/seq/oss/seq_oss_midi.c  | 45 +++++++++++++++---------------
 sound/core/seq/oss/seq_oss_synth.c | 23 +++++++--------
 3 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 973f057eb731..e0c368bd09cb 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -63,10 +63,10 @@ int __init
 snd_seq_oss_create_client(void)
 {
 	int rc;
-	struct snd_seq_port_info *port __free(kfree) = NULL;
 	struct snd_seq_port_callback port_callback;
+	struct snd_seq_port_info *port __free(kfree) =
+		kzalloc(sizeof(*port), GFP_KERNEL);
 
-	port = kzalloc(sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 023e5d0a4351..2d48c25ff4df 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -65,11 +65,11 @@ static int send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev,
 int
 snd_seq_oss_midi_lookup_ports(int client)
 {
-	struct snd_seq_client_info *clinfo __free(kfree) = NULL;
-	struct snd_seq_port_info *pinfo __free(kfree) = NULL;
+	struct snd_seq_client_info *clinfo __free(kfree) =
+		kzalloc(sizeof(*clinfo), GFP_KERNEL);
+	struct snd_seq_port_info *pinfo __free(kfree) =
+		kzalloc(sizeof(*pinfo), GFP_KERNEL);
 
-	clinfo = kzalloc(sizeof(*clinfo), GFP_KERNEL);
-	pinfo = kzalloc(sizeof(*pinfo), GFP_KERNEL);
 	if (!clinfo || !pinfo)
 		return -ENOMEM;
 	clinfo->client = -1;
@@ -305,10 +305,10 @@ int
 snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 {
 	int perm;
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 	struct snd_seq_port_subscribe subs;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
 
@@ -364,10 +364,10 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 int
 snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 	struct snd_seq_port_subscribe subs;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
 	guard(mutex)(&mdev->open_mutex);
@@ -399,10 +399,10 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 int
 snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 	int mode;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return 0;
 
@@ -422,9 +422,9 @@ snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev)
 void
 snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return;
 	if (!mdev->opened)
@@ -468,9 +468,9 @@ snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev)
 void
 snd_seq_oss_midi_get_addr(struct seq_oss_devinfo *dp, int dev, struct snd_seq_addr *addr)
 {
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return;
 	addr->client = mdev->client;
@@ -485,11 +485,11 @@ int
 snd_seq_oss_midi_input(struct snd_seq_event *ev, int direct, void *private_data)
 {
 	struct seq_oss_devinfo *dp = (struct seq_oss_devinfo *)private_data;
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	if (dp->readq == NULL)
 		return 0;
-	mdev = find_slot(ev->source.client, ev->source.port);
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		find_slot(ev->source.client, ev->source.port);
 	if (!mdev)
 		return 0;
 	if (!(mdev->opened & PERM_READ))
@@ -595,9 +595,9 @@ send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, struct seq
 int
 snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, struct snd_seq_event *ev)
 {
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
 	if (snd_midi_event_encode_byte(mdev->coder, c, ev)) {
@@ -613,9 +613,9 @@ snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, stru
 int
 snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info *inf)
 {
-	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) =
+		get_mididev(dp, dev);
 
-	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENXIO;
 	inf->device = dev;
@@ -651,10 +651,9 @@ snd_seq_oss_midi_info_read(struct snd_info_buffer *buf)
 
 	snd_iprintf(buf, "\nNumber of MIDI devices: %d\n", max_midi_devs);
 	for (i = 0; i < max_midi_devs; i++) {
-		struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
-
 		snd_iprintf(buf, "\nmidi %d: ", i);
-		mdev = get_mdev(i);
+		struct seq_oss_midi *mdev __free(seq_oss_midi) =
+			get_mdev(i);
 		if (mdev == NULL) {
 			snd_iprintf(buf, "*empty*\n");
 			continue;
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 68bc6d4eed53..c7f81f2053a7 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -364,7 +364,6 @@ reset_channels(struct seq_oss_synthinfo *info)
 void
 snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 	struct seq_oss_synthinfo *info;
 
 	info = get_synthinfo_nospec(dp, dev);
@@ -387,7 +386,8 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
 		return;
 	}
 
-	rec = get_sdev(dev);
+	struct seq_oss_synth *rec __free(seq_oss_synth) =
+		get_sdev(dev);
 	if (rec == NULL)
 		return;
 	if (rec->oper.reset) {
@@ -411,7 +411,6 @@ int
 snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 			    const char __user *buf, int p, int c)
 {
-	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 	struct seq_oss_synthinfo *info;
 
 	info = get_synthinfo_nospec(dp, dev);
@@ -420,7 +419,9 @@ snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 
 	if (info->is_midi)
 		return 0;
-	rec = get_synthdev(dp, dev);
+
+	struct seq_oss_synth *rec __free(seq_oss_synth) =
+		get_synthdev(dp, dev);
 	if (!rec)
 		return -ENXIO;
 
@@ -436,9 +437,9 @@ snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 struct seq_oss_synthinfo *
 snd_seq_oss_synth_info(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
+	struct seq_oss_synth *rec __free(seq_oss_synth) =
+		get_synthdev(dp, dev);
 
-	rec = get_synthdev(dp, dev);
 	if (rec)
 		return get_synthinfo_nospec(dp, dev);
 	return NULL;
@@ -491,13 +492,14 @@ snd_seq_oss_synth_addr(struct seq_oss_devinfo *dp, int dev, struct snd_seq_event
 int
 snd_seq_oss_synth_ioctl(struct seq_oss_devinfo *dp, int dev, unsigned int cmd, unsigned long addr)
 {
-	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 	struct seq_oss_synthinfo *info;
 
 	info = get_synthinfo_nospec(dp, dev);
 	if (!info || info->is_midi)
 		return -ENXIO;
-	rec = get_synthdev(dp, dev);
+
+	struct seq_oss_synth *rec __free(seq_oss_synth) =
+		get_synthdev(dp, dev);
 	if (!rec)
 		return -ENXIO;
 	if (rec->oper.ioctl == NULL)
@@ -571,10 +573,9 @@ snd_seq_oss_synth_info_read(struct snd_info_buffer *buf)
 
 	snd_iprintf(buf, "\nNumber of synth devices: %d\n", max_synth_devs);
 	for (i = 0; i < max_synth_devs; i++) {
-		struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
-
 		snd_iprintf(buf, "\nsynth %d: ", i);
-		rec = get_sdev(i);
+		struct seq_oss_synth *rec __free(seq_oss_synth) =
+			get_sdev(i);
 		if (rec == NULL) {
 			snd_iprintf(buf, "*empty*\n");
 			continue;
-- 
2.52.0

