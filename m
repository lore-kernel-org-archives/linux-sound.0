Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD02E06E4
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665802; cv=none; b=pH96MUgoGUNMIyoqliXTnI0PeTFnxJnG1GijHsdSdZ0M0arhZtpHqOO+l287Whdclv43XfDCX+Z6dku4lct9Y7vRSVNSGwsF9KkPIsqCWcPwb9X+yKIgsdviZ5px3kaicGIPBdFz8TDjy4sNWDuU31h++35Ewhd0FbOwNUivthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665802; c=relaxed/simple;
	bh=y8iCYk2hzMzIJo7aenlUlawpposaDu9QWA82MOJ3eGs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GyDB3FF7/CwW9kUltzECJEPI4lxOPgglH8vFEt9NUFZ04UN0TilXHOELW5cPRUdppXQ+ZzK2R66QXNtHFt4fVfzEMdoxPkv4UVb7xC15DjAlGqHnJG6WgMccHooCc6bKvJQXXXvAHYqhNaa7gnrRB0GTQ0WBVFyTxjjV/SkCcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wKwfIYvU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xzw2AVyU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a9vTppC7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cY9qX53l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wKwfIYvU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xzw2AVyU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a9vTppC7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cY9qX53l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCE341F7E7;
	Tue, 25 Aug 2026 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787665795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PIm9rJrsqUQH0hOKN0Y2X1j7ONL6YwhLutzg3pJuR3k=;
	b=wKwfIYvUarKxoMzm02ZadzxscQp/9uISCth8IcQNpyzIBHmVVDkSHlUXAKbZAv6XetNith
	XatjzIcK69OH7Y1O2KGLQ6Q79hjot1Bo9EqyN8zCrCVwiY7DbUXz3maYrk0ae3TGs0cH4/
	wXV6nJ2ANRp9vK2I0eicPooWO9Wgg/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787665795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PIm9rJrsqUQH0hOKN0Y2X1j7ONL6YwhLutzg3pJuR3k=;
	b=xzw2AVyUS5DtqLnLU5dY23cgqUjAfIg2xaBRZ+aYyJUpuEMpDm7hCxvqZNhxul3wEL1Jzc
	oAtxABvB04f9omAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787665790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PIm9rJrsqUQH0hOKN0Y2X1j7ONL6YwhLutzg3pJuR3k=;
	b=a9vTppC7uSsyn0ZPioReBoA3LVDXJdRTOX6Q+inDaBPKT5NU19BCD1mHGNJM8OFL00Cwsp
	AsUZ9sDuIQCWq1qeB4E53GOdIbaMgOId2Vjl2WfoVGT0QjDDv+I/jF6+aWmHxEL42HWBfW
	uh5emvX8mb4wp+m2CNV6wTrXhqzYPGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787665790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PIm9rJrsqUQH0hOKN0Y2X1j7ONL6YwhLutzg3pJuR3k=;
	b=cY9qX53ldTej8Vs5wokrO+DpfJwkJeykUjfFTfp+G97M1xdYL2odAFntYQhG/bUH4f8NPs
	s7XPWCcs7eBLY8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD9C413331;
	Tue, 25 Aug 2026 13:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 66CkMX6djWojTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 13:49:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: rawmidi: Another workaround for false-positive mutex lockdep warning
Date: Tue, 25 Aug 2026 15:49:31 +0200
Message-ID: <20260825134942.1289272-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,appspotmail.com:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

While we attempted to work around the false-positive lockdep warning
due to the nested mutex lock in rawmidi at the open path for a UMP
legacy rawmidi, it didn't cover the similar locking at its close path,
and this still caused another false-positive reports by syzkaller.

Add a similar workaround to snd_rawmidi_kernel_release() as done in
the former commit 9c04742e73b3 ("ALSA: rawmidi: Work around
false-positive mutex lockdep warning") to cover completely.

Reported-by: syzbot+7d1edf0ff6a05961020c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a8c7e4d.4d75e56a.c9a88.0052.GAE@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix export symbol, too

 include/sound/rawmidi.h |  8 +++++++-
 sound/core/rawmidi.c    | 11 +++++++----
 sound/core/ump.c        |  3 ++-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 88a6159364d0..4154035af414 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -179,7 +179,8 @@ int snd_rawmidi_info_select(struct snd_card *card, struct snd_rawmidi_info *info
 int snd_rawmidi_kernel_open_nested(struct snd_rawmidi *rmidi, int subdevice,
 				   int mode, struct snd_rawmidi_file *rfile,
 				   int depth);
-int snd_rawmidi_kernel_release(struct snd_rawmidi_file *rfile);
+int snd_rawmidi_kernel_release_nested(struct snd_rawmidi_file *rfile,
+				      int depth);
 int snd_rawmidi_output_params(struct snd_rawmidi_substream *substream,
 			      struct snd_rawmidi_params *params);
 int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
@@ -201,6 +202,11 @@ static inline int snd_rawmidi_kernel_open(struct snd_rawmidi *rmidi,
 	return snd_rawmidi_kernel_open_nested(rmidi, subdevice, mode, rfile, 0);
 }
 
+static inline int snd_rawmidi_kernel_release(struct snd_rawmidi_file *rfile)
+{
+	return snd_rawmidi_kernel_release_nested(rfile, 0);
+}
+
 /* set up the tied devices */
 static inline void snd_rawmidi_tie_devices(struct snd_rawmidi *r1,
 					   struct snd_rawmidi *r2)
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index bf504e27f73e..34b4c7d6dbe6 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -571,7 +571,6 @@ static void rawmidi_release_priv(struct snd_rawmidi_file *rfile)
 	struct snd_rawmidi *rmidi;
 
 	rmidi = rfile->rmidi;
-	guard(mutex)(&rmidi->open_mutex);
 	if (rfile->input) {
 		close_substream(rmidi, rfile->input, 1);
 		rfile->input = NULL;
@@ -585,7 +584,8 @@ static void rawmidi_release_priv(struct snd_rawmidi_file *rfile)
 }
 
 /* called from sound/core/seq/seq_midi.c */
-int snd_rawmidi_kernel_release(struct snd_rawmidi_file *rfile)
+int snd_rawmidi_kernel_release_nested(struct snd_rawmidi_file *rfile,
+				      int depth)
 {
 	struct snd_rawmidi *rmidi;
 
@@ -593,11 +593,13 @@ int snd_rawmidi_kernel_release(struct snd_rawmidi_file *rfile)
 		return -ENXIO;
 
 	rmidi = rfile->rmidi;
+	mutex_lock_nested(&rmidi->open_mutex, depth);
 	rawmidi_release_priv(rfile);
+	mutex_unlock(&rmidi->open_mutex);
 	module_put(rmidi->card->module);
 	return 0;
 }
-EXPORT_SYMBOL(snd_rawmidi_kernel_release);
+EXPORT_SYMBOL(snd_rawmidi_kernel_release_nested);
 
 static int snd_rawmidi_release(struct inode *inode, struct file *file)
 {
@@ -607,7 +609,8 @@ static int snd_rawmidi_release(struct inode *inode, struct file *file)
 
 	rfile = file->private_data;
 	rmidi = rfile->rmidi;
-	rawmidi_release_priv(rfile);
+	scoped_guard(mutex, &rmidi->open_mutex)
+		rawmidi_release_priv(rfile);
 	kfree(rfile);
 	module = rmidi->card->module;
 	snd_card_file_remove(rmidi->card, file);
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 82ad155c56e6..d183c8a000bd 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1184,7 +1184,8 @@ static int snd_ump_legacy_close(struct snd_rawmidi_substream *substream)
 		ump->legacy_substreams[dir][group] = NULL;
 	if (dir == SNDRV_RAWMIDI_STREAM_OUTPUT) {
 		if (!--ump->legacy_out_opens)
-			snd_rawmidi_kernel_release(&ump->legacy_out_rfile);
+			snd_rawmidi_kernel_release_nested(&ump->legacy_out_rfile,
+							  SINGLE_DEPTH_NESTING);
 	}
 	return 0;
 }
-- 
2.55.0

