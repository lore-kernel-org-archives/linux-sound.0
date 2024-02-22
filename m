Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7581468F8
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608123; cv=none; b=qeUDp09z6tHfSeaYY5Fjd92HJ4kAlto5xuCwiJNXqOjndSS7yrsJXDO+Ky8+kwQC7Blo+4QTuqcMoV6h1KhBivY7Gn2I+mmdeza1eypsgAVaIFe9LqgzOLwJjnebtTEXMfXZ9oqZ92um2sns/cs8MR9xkeHY09HhJJ2rmMnpRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608123; c=relaxed/simple;
	bh=OkwThAcMsyERVGM1muOQWBefp9/abmD7oU2JD6R1wnI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=XDCFgALNL57nx390TW3F2A2pUoOduEoG/bRBm2S0tiJn/XUYovLGzMmJXgR+Ah8uv69jCPWwc5+6jcZqd1x2hPKvgqgcsvRZ8HPi1Jv7JIN0XDrbkAvdjry2Lhcu8mdsYkcyfVAE5RPxATGafxXhwKkrLG28TNfbj9NtiT4A9w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rrTrwsCi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Dt2wQGM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rrTrwsCi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Dt2wQGM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rrTrwsCi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Dt2wQGM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rrTrwsCi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Dt2wQGM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7457D21EB1;
	Thu, 22 Feb 2024 13:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708608118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p61NkeyC/C+I9Q8SVKkzroJKnN5CP+BAtk5okRy4CQo=;
	b=rrTrwsCidUgkFV7NwKAmi4Q5JmVDdNGMJ8efAjBQbnJPAidnsCYuDmB5eAjKaLOwJlFXT9
	QElcRJws/ZEeyZdONdsrjj3HfLGelhVtzDWJ7Ywi1nbt7YhasecC4gjPhmNL55WVSPHyzY
	LX9a62a+MQr1W2cjxJ/G4EX9WM7VP4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708608118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p61NkeyC/C+I9Q8SVKkzroJKnN5CP+BAtk5okRy4CQo=;
	b=4Dt2wQGMk8sLk+JuyrpV128S0tz9UMNqklbusNsXa4LLxdGpXjOhdgPu7EU0mrxKVfvOxZ
	spLdHNoXQWxr1vDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708608118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p61NkeyC/C+I9Q8SVKkzroJKnN5CP+BAtk5okRy4CQo=;
	b=rrTrwsCidUgkFV7NwKAmi4Q5JmVDdNGMJ8efAjBQbnJPAidnsCYuDmB5eAjKaLOwJlFXT9
	QElcRJws/ZEeyZdONdsrjj3HfLGelhVtzDWJ7Ywi1nbt7YhasecC4gjPhmNL55WVSPHyzY
	LX9a62a+MQr1W2cjxJ/G4EX9WM7VP4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708608118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p61NkeyC/C+I9Q8SVKkzroJKnN5CP+BAtk5okRy4CQo=;
	b=4Dt2wQGMk8sLk+JuyrpV128S0tz9UMNqklbusNsXa4LLxdGpXjOhdgPu7EU0mrxKVfvOxZ
	spLdHNoXQWxr1vDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56E8E13A8C;
	Thu, 22 Feb 2024 13:21:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kgeCE3ZK12U7OAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 13:21:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: prioq: Unify cell removal functions
Date: Thu, 22 Feb 2024 14:21:52 +0100
Message-Id: <20240222132152.29063-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rrTrwsCi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4Dt2wQGM
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: 7457D21EB1
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

Both snd_seq_prioq_remove_events() and snd_seq_prioq_leave() have a
very similar loop for removing events.  Unify them with a callback for
code simplification.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_prioq.c | 197 ++++++++++++++++---------------------
 1 file changed, 84 insertions(+), 113 deletions(-)

diff --git a/sound/core/seq/seq_prioq.c b/sound/core/seq/seq_prioq.c
index 1d857981e876..e062df7610e1 100644
--- a/sound/core/seq/seq_prioq.c
+++ b/sound/core/seq/seq_prioq.c
@@ -249,30 +249,11 @@ int snd_seq_prioq_avail(struct snd_seq_prioq * f)
 	return f->cells;
 }
 
-static inline int prioq_match(struct snd_seq_event_cell *cell,
-			      int client, int timestamp)
-{
-	if (cell->event.source.client == client ||
-	    cell->event.dest.client == client)
-		return 1;
-	if (!timestamp)
-		return 0;
-	switch (cell->event.flags & SNDRV_SEQ_TIME_STAMP_MASK) {
-	case SNDRV_SEQ_TIME_STAMP_TICK:
-		if (cell->event.time.tick)
-			return 1;
-		break;
-	case SNDRV_SEQ_TIME_STAMP_REAL:
-		if (cell->event.time.time.tv_sec ||
-		    cell->event.time.time.tv_nsec)
-			return 1;
-		break;
-	}
-	return 0;
-}
-
-/* remove cells for left client */
-void snd_seq_prioq_leave(struct snd_seq_prioq * f, int client, int timestamp)
+/* remove cells matching with the condition */
+static void prioq_remove_cells(struct snd_seq_prioq *f,
+			       bool (*match)(struct snd_seq_event_cell *cell,
+					     void *arg),
+			       void *arg)
 {
 	register struct snd_seq_event_cell *cell, *next;
 	unsigned long flags;
@@ -281,39 +262,29 @@ void snd_seq_prioq_leave(struct snd_seq_prioq * f, int client, int timestamp)
 
 	/* collect all removed cells */
 	spin_lock_irqsave(&f->lock, flags);
-	cell = f->head;
-	while (cell) {
+	for (cell = f->head; cell; cell = next) {
 		next = cell->next;
-		if (prioq_match(cell, client, timestamp)) {
-			/* remove cell from prioq */
-			if (cell == f->head) {
-				f->head = cell->next;
-			} else {
-				prev->next = cell->next;
-			}
-			if (cell == f->tail)
-				f->tail = cell->next;
-			f->cells--;
-			/* add cell to free list */
-			cell->next = NULL;
-			if (freefirst == NULL) {
-				freefirst = cell;
-			} else {
-				freeprev->next = cell;
-			}
-			freeprev = cell;
-		} else {
-#if 0
-			pr_debug("ALSA: seq: type = %i, source = %i, dest = %i, "
-			       "client = %i\n",
-				cell->event.type,
-				cell->event.source.client,
-				cell->event.dest.client,
-				client);
-#endif
+		if (!match(cell, arg)) {
 			prev = cell;
+			continue;
 		}
-		cell = next;		
+
+		/* remove cell from prioq */
+		if (cell == f->head)
+			f->head = cell->next;
+		else
+			prev->next = cell->next;
+		if (cell == f->tail)
+			f->tail = cell->next;
+		f->cells--;
+
+		/* add cell to free list */
+		cell->next = NULL;
+		if (freefirst == NULL)
+			freefirst = cell;
+		else
+			freeprev->next = cell;
+		freeprev = cell;
 	}
 	spin_unlock_irqrestore(&f->lock, flags);	
 
@@ -325,22 +296,68 @@ void snd_seq_prioq_leave(struct snd_seq_prioq * f, int client, int timestamp)
 	}
 }
 
-static int prioq_remove_match(struct snd_seq_remove_events *info,
-			      struct snd_seq_event *ev)
+struct prioq_match_arg {
+	int client;
+	int timestamp;
+};
+
+static inline bool prioq_match(struct snd_seq_event_cell *cell, void *arg)
 {
+	struct prioq_match_arg *v = arg;
+
+	if (cell->event.source.client == v->client ||
+	    cell->event.dest.client == v->client)
+		return true;
+	if (!v->timestamp)
+		return false;
+	switch (cell->event.flags & SNDRV_SEQ_TIME_STAMP_MASK) {
+	case SNDRV_SEQ_TIME_STAMP_TICK:
+		if (cell->event.time.tick)
+			return true;
+		break;
+	case SNDRV_SEQ_TIME_STAMP_REAL:
+		if (cell->event.time.time.tv_sec ||
+		    cell->event.time.time.tv_nsec)
+			return true;
+		break;
+	}
+	return false;
+}
+
+/* remove cells for left client */
+void snd_seq_prioq_leave(struct snd_seq_prioq *f, int client, int timestamp)
+{
+	struct prioq_match_arg arg = { client, timestamp };
+
+	return prioq_remove_cells(f, prioq_match, &arg);
+}
+
+struct prioq_remove_match_arg {
+	int client;
+	struct snd_seq_remove_events *info;
+};
+
+static bool prioq_remove_match(struct snd_seq_event_cell *cell, void *arg)
+{
+	struct prioq_remove_match_arg *v = arg;
+	struct snd_seq_event *ev = &cell->event;
+	struct snd_seq_remove_events *info = v->info;
 	int res;
 
+	if (ev->source.client != v->client)
+		return false;
+
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_DEST) {
 		if (ev->dest.client != info->dest.client ||
 				ev->dest.port != info->dest.port)
-			return 0;
+			return false;
 	}
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_DEST_CHANNEL) {
 		if (! snd_seq_ev_is_channel_type(ev))
-			return 0;
+			return false;
 		/* data.note.channel and data.control.channel are identical */
 		if (ev->data.note.channel != info->channel)
-			return 0;
+			return false;
 	}
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_TIME_AFTER) {
 		if (info->remove_mode & SNDRV_SEQ_REMOVE_TIME_TICK)
@@ -348,7 +365,7 @@ static int prioq_remove_match(struct snd_seq_remove_events *info,
 		else
 			res = snd_seq_compare_real_time(&ev->time.time, &info->time.time);
 		if (!res)
-			return 0;
+			return false;
 	}
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_TIME_BEFORE) {
 		if (info->remove_mode & SNDRV_SEQ_REMOVE_TIME_TICK)
@@ -356,81 +373,35 @@ static int prioq_remove_match(struct snd_seq_remove_events *info,
 		else
 			res = snd_seq_compare_real_time(&ev->time.time, &info->time.time);
 		if (res)
-			return 0;
+			return false;
 	}
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_EVENT_TYPE) {
 		if (ev->type != info->type)
-			return 0;
+			return false;
 	}
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_IGNORE_OFF) {
 		/* Do not remove off events */
 		switch (ev->type) {
 		case SNDRV_SEQ_EVENT_NOTEOFF:
 		/* case SNDRV_SEQ_EVENT_SAMPLE_STOP: */
-			return 0;
+			return false;
 		default:
 			break;
 		}
 	}
 	if (info->remove_mode & SNDRV_SEQ_REMOVE_TAG_MATCH) {
 		if (info->tag != ev->tag)
-			return 0;
+			return false;
 	}
 
-	return 1;
+	return true;
 }
 
 /* remove cells matching remove criteria */
 void snd_seq_prioq_remove_events(struct snd_seq_prioq * f, int client,
 				 struct snd_seq_remove_events *info)
 {
-	struct snd_seq_event_cell *cell, *next;
-	unsigned long flags;
-	struct snd_seq_event_cell *prev = NULL;
-	struct snd_seq_event_cell *freefirst = NULL, *freeprev = NULL, *freenext;
+	struct prioq_remove_match_arg arg = { client, info };
 
-	/* collect all removed cells */
-	spin_lock_irqsave(&f->lock, flags);
-	cell = f->head;
-
-	while (cell) {
-		next = cell->next;
-		if (cell->event.source.client == client &&
-			prioq_remove_match(info, &cell->event)) {
-
-			/* remove cell from prioq */
-			if (cell == f->head) {
-				f->head = cell->next;
-			} else {
-				prev->next = cell->next;
-			}
-
-			if (cell == f->tail)
-				f->tail = cell->next;
-			f->cells--;
-
-			/* add cell to free list */
-			cell->next = NULL;
-			if (freefirst == NULL) {
-				freefirst = cell;
-			} else {
-				freeprev->next = cell;
-			}
-
-			freeprev = cell;
-		} else {
-			prev = cell;
-		}
-		cell = next;		
-	}
-	spin_unlock_irqrestore(&f->lock, flags);	
-
-	/* remove selected cells */
-	while (freefirst) {
-		freenext = freefirst->next;
-		snd_seq_cell_free(freefirst);
-		freefirst = freenext;
-	}
+	return prioq_remove_cells(f, prioq_remove_match, &arg);
 }
-
-
-- 
2.35.3

