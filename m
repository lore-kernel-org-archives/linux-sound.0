Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3648441625;
	Thu,  6 Aug 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011251; cv=none; b=B/DDKwOR1oWeg3dFKaTi/NAxbtJ8aemqDrdQ33MKBHTRwOxp4MMiUeyjCHJt2BEG3ESHSXP6XpglkvQEcvR4rhFrXoZhUWTzG6NPpBf0LiHCvSvQrMtL0HBa1LnryH4ZpQ1OdttWSm2vTymuKxNM7Y9JDngpZihWGIX/+v0gGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011251; c=relaxed/simple;
	bh=Eel4Pr22xHADxJCycRre2yXnc1peQX7vUznDyMK9Gz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3hfCq2pchZyBHrsDhe3shtVePYtBpGY/9eiTi4O/RpRC29HdjFtVG60WrvX5M64E7psdGC6JBrS68pqDCcEmqkPatqKPSxruU5+ze9YKLk32WPhItaveONXA2EyRar36j8o+Q8YIOC/w0v6INeQ5q9CGyNTwuyLYZ50b7cRUMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mE7ClHhX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W1WRgfAN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mpnJirg0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xJ+nqoQD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mE7ClHhX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W1WRgfAN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mpnJirg0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xJ+nqoQD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51E793E00;
	Thu,  6 Aug 2026 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786011243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8o2HGvKrnSN8vCg+UYQrUl0Pyvty705t/9p+3XX2oY=;
	b=mE7ClHhXvqGrtMPV0IqozaQRTNOWDcMYrvL4O3rizpBtAb0AdAnDwW7sgjOG8er1MHBiSU
	PBAt/Lw8wM872G/r4nhkZwLJJyWpS6L0eqVzavUDdEYpWuLdcwlxF4q5N6nNETg/G2pTzs
	mNTxOBFJb0ZOK2Gh+QS848W8enNVQVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786011243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8o2HGvKrnSN8vCg+UYQrUl0Pyvty705t/9p+3XX2oY=;
	b=W1WRgfANwfRh/80VwdD2DTuXQXGJP0aaasYJwJOcrCr+itdPk5pFFsZ/Pzovr5CDojlPXQ
	RLwKs4MZKpkh2oCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786011239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8o2HGvKrnSN8vCg+UYQrUl0Pyvty705t/9p+3XX2oY=;
	b=mpnJirg0ywaq4wDbN3y7RHQHOxWrINOGPkg4zciVfVmPRRnWS6Ef7fPHzzO4NEdH7Z59ze
	t9iBXIFcl60VBZiUIS+3GcsN5OdlgQb8K9xIP4avujAlNr04BvBMuxIESD2OrSt5tQNJoQ
	5R8kfDHZ+/nRKbYVn6emgM3nsRfPRHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786011239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8o2HGvKrnSN8vCg+UYQrUl0Pyvty705t/9p+3XX2oY=;
	b=xJ+nqoQDnkJ8sjD/LTp1+OAYZSVcEzpTUlGVMdttWWYvICmkFtX1/o8k5VhM7/0JpROMxT
	qXFQuq8d3cfnkWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D1FB779BF;
	Thu,  6 Aug 2026 10:13:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RcKOCWdedGpBWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 10:13:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: rawmidi: Work around false-positive mutex lockdep warning
Date: Thu,  6 Aug 2026 12:13:51 +0200
Message-ID: <20260806101352.1291581-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,appspotmail.com:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

When opening a legacy rawmidi device for a UMP, it may re-open an
existing rawmidi device for appending to a substream, leading to a
lockdep warning due to rmidi->open_mutex taken twice -- but the
rawmidi devices are completely individual, hence it's a
false-positive.

For avoiding the warning, modify the helper to open a rawmidi instance
with a proper locking subclass from the UMP legacy open.

Unfortunately, there is no good way to achieve it with guard(), so
reverted to the manual mutex calls again.

Reported-by: syzbot+d10d58fc99caa0489796@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a6a9634.57649fcc.360844.000b.GAE@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h | 14 ++++++++++++--
 sound/core/rawmidi.c    | 12 +++++++-----
 sound/core/ump.c        |  9 +++++----
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 6916f7133597..88a6159364d0 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -176,8 +176,9 @@ int snd_rawmidi_proceed(struct snd_rawmidi_substream *substream);
 /* main midi functions */
 
 int snd_rawmidi_info_select(struct snd_card *card, struct snd_rawmidi_info *info);
-int snd_rawmidi_kernel_open(struct snd_rawmidi *rmidi, int subdevice,
-			    int mode, struct snd_rawmidi_file *rfile);
+int snd_rawmidi_kernel_open_nested(struct snd_rawmidi *rmidi, int subdevice,
+				   int mode, struct snd_rawmidi_file *rfile,
+				   int depth);
 int snd_rawmidi_kernel_release(struct snd_rawmidi_file *rfile);
 int snd_rawmidi_output_params(struct snd_rawmidi_substream *substream,
 			      struct snd_rawmidi_params *params);
@@ -191,6 +192,15 @@ long snd_rawmidi_kernel_read(struct snd_rawmidi_substream *substream,
 long snd_rawmidi_kernel_write(struct snd_rawmidi_substream *substream,
 			      const unsigned char *buf, long count);
 
+/* non-nested version */
+static inline int snd_rawmidi_kernel_open(struct snd_rawmidi *rmidi,
+					  int subdevice,
+					  int mode,
+					  struct snd_rawmidi_file *rfile)
+{
+	return snd_rawmidi_kernel_open_nested(rmidi, subdevice, mode, rfile, 0);
+}
+
 /* set up the tied devices */
 static inline void snd_rawmidi_tie_devices(struct snd_rawmidi *r1,
 					   struct snd_rawmidi *r2)
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 1d55da2dcb01..bf504e27f73e 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -408,9 +408,10 @@ static int rawmidi_open_priv(struct snd_rawmidi *rmidi, int subdevice, int mode,
 	return 0;
 }
 
-/* called from sound/core/seq/seq_midi.c */
-int snd_rawmidi_kernel_open(struct snd_rawmidi *rmidi, int subdevice,
-			    int mode, struct snd_rawmidi_file *rfile)
+/* called from sound/core/seq/seq_midi.c and sound/core/ump.c */
+int snd_rawmidi_kernel_open_nested(struct snd_rawmidi *rmidi, int subdevice,
+				   int mode, struct snd_rawmidi_file *rfile,
+				   int depth)
 {
 	int err;
 
@@ -419,13 +420,14 @@ int snd_rawmidi_kernel_open(struct snd_rawmidi *rmidi, int subdevice,
 	if (!try_module_get(rmidi->card->module))
 		return -ENXIO;
 
-	guard(mutex)(&rmidi->open_mutex);
+	mutex_lock_nested(&rmidi->open_mutex, depth);
 	err = rawmidi_open_priv(rmidi, subdevice, mode, rfile);
 	if (err < 0)
 		module_put(rmidi->card->module);
+	mutex_unlock(&rmidi->open_mutex);
 	return err;
 }
-EXPORT_SYMBOL(snd_rawmidi_kernel_open);
+EXPORT_SYMBOL(snd_rawmidi_kernel_open_nested);
 
 static int snd_rawmidi_open(struct inode *inode, struct file *file)
 {
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 632c13baf21e..82ad155c56e6 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1157,10 +1157,11 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 		return -ENODEV;
 	if (dir == SNDRV_RAWMIDI_STREAM_OUTPUT) {
 		if (!ump->legacy_out_opens) {
-			err = snd_rawmidi_kernel_open(&ump->core, 0,
-						      SNDRV_RAWMIDI_LFLG_OUTPUT |
-						      SNDRV_RAWMIDI_LFLG_APPEND,
-						      &ump->legacy_out_rfile);
+			err = snd_rawmidi_kernel_open_nested(&ump->core, 0,
+							     SNDRV_RAWMIDI_LFLG_OUTPUT |
+							     SNDRV_RAWMIDI_LFLG_APPEND,
+							     &ump->legacy_out_rfile,
+							     SINGLE_DEPTH_NESTING);
 			if (err < 0)
 				return err;
 		}
-- 
2.55.0

