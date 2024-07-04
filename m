Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F7E1E494
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720096524; cv=none; b=pMG+84MJXcvM+ViHweFDP+vP3SJgA84fFfI6dGj2F4n5FSiQ7dfMUGiy1RsdXwwam1L6LprXXuFvL1GTdlMDvt/qIeZ4XcVujXpUzJyEhLIYMzVdd4Xvc6XaIwzZxTo2stmvHbHAadkZKMqws83wrOn/FkJ3wJ8zXxgiELXCkvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720096524; c=relaxed/simple;
	bh=1BYfDJyGbqn3GAtk/p4PCmPexuPqDeq3AHEh2r2CxHQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=StZ+40K1judQdtuBimmIiXYSjbrC0gWcwsddgtXGcDvqgC5zLqFNGCW6Lnw1qf/zCccu/uDVjo2W6soKFnpaTBIC9xEC1w90SV+72x+zpGeZ9XEBTvsy0lo+yhfEhYw1IFiL68oYdmxxaq7hzAT88ZC8EIqI0s3zgSie/QLQQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tGboPtnW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+IGQo8Nl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tGboPtnW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+IGQo8Nl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tGboPtnW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+IGQo8Nl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tGboPtnW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+IGQo8Nl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0603E1F7BC;
	Thu,  4 Jul 2024 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720096521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FKwx+ImKp7JLWsx6igocdkPpo3o9/oZyMWJv/viBGxg=;
	b=tGboPtnWuvNqMusj7XNovbVxrnuzbWbiByBX/cKHI3kLBBA8jKen7FpqhcC3PXQByuWHru
	L2vXp3nuqxl+eeda0u8CI7J9aYUIouNDpRIMaEAIP004hvczGI4YZasIo4O/71WNj4gscN
	35l9sMu40fJ/fX68Uq9kcKe+dRcxfE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720096521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FKwx+ImKp7JLWsx6igocdkPpo3o9/oZyMWJv/viBGxg=;
	b=+IGQo8NlKTGEFvhDOTYhiRmJLe2WryQDNPRGKR2VvzGLCXrBHjG8s8k/h7X0niZJkNtzhA
	+qNtRSGLrY+FuHDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tGboPtnW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+IGQo8Nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720096521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FKwx+ImKp7JLWsx6igocdkPpo3o9/oZyMWJv/viBGxg=;
	b=tGboPtnWuvNqMusj7XNovbVxrnuzbWbiByBX/cKHI3kLBBA8jKen7FpqhcC3PXQByuWHru
	L2vXp3nuqxl+eeda0u8CI7J9aYUIouNDpRIMaEAIP004hvczGI4YZasIo4O/71WNj4gscN
	35l9sMu40fJ/fX68Uq9kcKe+dRcxfE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720096521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FKwx+ImKp7JLWsx6igocdkPpo3o9/oZyMWJv/viBGxg=;
	b=+IGQo8NlKTGEFvhDOTYhiRmJLe2WryQDNPRGKR2VvzGLCXrBHjG8s8k/h7X0niZJkNtzhA
	+qNtRSGLrY+FuHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D603413889;
	Thu,  4 Jul 2024 12:35:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rof1MgiXhmbUDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jul 2024 12:35:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Add tempo base unit for MIDI2 Set Tempo messages
Date: Thu,  4 Jul 2024 14:35:47 +0200
Message-ID: <20240704123549.13485-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0603E1F7BC
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

MIDI2 Set Tempo message defines the tempo in 10ns unit for finer
accuracy, while MIDI1 was defined in 1us unit.  For adapting this
different unit, introduce "tempo_base" field to snd_seq_queue_tempo
struct so that user-space can pass the proper tempo base unit.

The accepted value is limited, it must be either 0, 10 or 1000.

The protocol version is bumped to 1.0.4 along with this.

The access with the older protocol version ignores the tempo-base
value in ioctls and always treats as 1000.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h |  7 ++++---
 sound/core/seq/seq_clientmgr.c  |  4 ++++
 sound/core/seq/seq_queue.c      |  6 ++++--
 sound/core/seq/seq_timer.c      | 21 +++++++++++++++------
 sound/core/seq/seq_timer.h      |  4 +++-
 5 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index c85fdd8895d8..c7acfeb514a3 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -10,7 +10,7 @@
 #include <sound/asound.h>
 
 /** version of the sequencer */
-#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 3)
+#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 4)
 
 /**
  * definition of sequencer event types
@@ -523,11 +523,12 @@ struct snd_seq_queue_status {
 /* queue tempo */
 struct snd_seq_queue_tempo {
 	int queue;			/* sequencer queue */
-	unsigned int tempo;		/* current tempo, us/tick */
+	unsigned int tempo;		/* current tempo, us/tick (or different time-base below) */
 	int ppq;			/* time resolution, ticks/quarter */
 	unsigned int skew_value;	/* queue skew */
 	unsigned int skew_base;		/* queue skew base */
-	char reserved[24];		/* for the future */
+	unsigned int tempo_base;	/* tempo base in nsec unit; either 10 or 1000 */
+	char reserved[20];		/* for the future */
 };
 
 
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 42a705141050..8c4ee5066afe 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1718,6 +1718,8 @@ static int snd_seq_ioctl_get_queue_tempo(struct snd_seq_client *client,
 	tempo->ppq = tmr->ppq;
 	tempo->skew_value = tmr->skew;
 	tempo->skew_base = tmr->skew_base;
+	if (client->user_pversion >= SNDRV_PROTOCOL_VERSION(1, 0, 4))
+		tempo->tempo_base = tmr->tempo_base;
 	queuefree(queue);
 
 	return 0;
@@ -1739,6 +1741,8 @@ static int snd_seq_ioctl_set_queue_tempo(struct snd_seq_client *client,
 	struct snd_seq_queue_tempo *tempo = arg;
 	int result;
 
+	if (client->user_pversion < SNDRV_PROTOCOL_VERSION(1, 0, 4))
+		tempo->tempo_base = 0;
 	result = snd_seq_set_queue_tempo(client->number, tempo);
 	return result < 0 ? result : 0;
 }
diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 500ee6b19c71..5df26788dda4 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -460,7 +460,8 @@ int snd_seq_queue_timer_set_tempo(int queueid, int client,
 		return -EPERM;
 	}
 
-	result = snd_seq_timer_set_tempo_ppq(q->timer, info->tempo, info->ppq);
+	result = snd_seq_timer_set_tempo_ppq(q->timer, info->tempo, info->ppq,
+					     info->tempo_base);
 	if (result >= 0 && info->skew_base > 0)
 		result = snd_seq_timer_set_skew(q->timer, info->skew_value,
 						info->skew_base);
@@ -724,7 +725,7 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 
 		tmr = q->timer;
 		if (tmr->tempo)
-			bpm = 60000000 / tmr->tempo;
+			bpm = (60000 * tmr->tempo_base) / tmr->tempo;
 		else
 			bpm = 0;
 
@@ -741,6 +742,7 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "timer state        : %s\n", tmr->running ? "Running" : "Stopped");
 		snd_iprintf(buffer, "timer PPQ          : %d\n", tmr->ppq);
 		snd_iprintf(buffer, "current tempo      : %d\n", tmr->tempo);
+		snd_iprintf(buffer, "tempo base         : %d ns\n", tmr->tempo_base);
 		snd_iprintf(buffer, "current BPM        : %d\n", bpm);
 		snd_iprintf(buffer, "current time       : %d.%09d s\n", tmr->cur_time.tv_sec, tmr->cur_time.tv_nsec);
 		snd_iprintf(buffer, "current tick       : %d\n", tmr->tick.cur_tick);
diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index ad2b97e2762d..c9f0392ac7f1 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -20,14 +20,17 @@
 
 static void snd_seq_timer_set_tick_resolution(struct snd_seq_timer *tmr)
 {
-	if (tmr->tempo < 1000000)
-		tmr->tick.resolution = (tmr->tempo * 1000) / tmr->ppq;
+	unsigned int threshold =
+		tmr->tempo_base == 1000 ? 1000000 : 10000;
+
+	if (tmr->tempo < threshold)
+		tmr->tick.resolution = (tmr->tempo * tmr->tempo_base) / tmr->ppq;
 	else {
 		/* might overflow.. */
 		unsigned int s;
 		s = tmr->tempo % tmr->ppq;
-		s = (s * 1000) / tmr->ppq;
-		tmr->tick.resolution = (tmr->tempo / tmr->ppq) * 1000;
+		s = (s * tmr->tempo_base) / tmr->ppq;
+		tmr->tick.resolution = (tmr->tempo / tmr->ppq) * tmr->tempo_base;
 		tmr->tick.resolution += s;
 	}
 	if (tmr->tick.resolution <= 0)
@@ -79,6 +82,7 @@ void snd_seq_timer_defaults(struct snd_seq_timer * tmr)
 	/* setup defaults */
 	tmr->ppq = 96;		/* 96 PPQ */
 	tmr->tempo = 500000;	/* 120 BPM */
+	tmr->tempo_base = 1000;	/* 1us */
 	snd_seq_timer_set_tick_resolution(tmr);
 	tmr->running = 0;
 
@@ -164,8 +168,9 @@ int snd_seq_timer_set_tempo(struct snd_seq_timer * tmr, int tempo)
 	return 0;
 }
 
-/* set current tempo and ppq in a shot */
-int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq)
+/* set current tempo, ppq and base in a shot */
+int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq,
+				unsigned int tempo_base)
 {
 	int changed;
 
@@ -173,6 +178,9 @@ int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq)
 		return -EINVAL;
 	if (tempo <= 0 || ppq <= 0)
 		return -EINVAL;
+	/* allow only 10ns or 1us tempo base for now */
+	if (tempo_base && tempo_base != 10 && tempo_base != 1000)
+		return -EINVAL;
 	guard(spinlock_irqsave)(&tmr->lock);
 	if (tmr->running && (ppq != tmr->ppq)) {
 		/* refuse to change ppq on running timers */
@@ -183,6 +191,7 @@ int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq)
 	changed = (tempo != tmr->tempo) || (ppq != tmr->ppq);
 	tmr->tempo = tempo;
 	tmr->ppq = ppq;
+	tmr->tempo_base = tempo_base ? tempo_base : 1000;
 	if (changed)
 		snd_seq_timer_set_tick_resolution(tmr);
 	return 0;
diff --git a/sound/core/seq/seq_timer.h b/sound/core/seq/seq_timer.h
index 4bec57df8158..3b906064bde1 100644
--- a/sound/core/seq/seq_timer.h
+++ b/sound/core/seq/seq_timer.h
@@ -36,6 +36,7 @@ struct snd_seq_timer {
 
 	unsigned int skew;
 	unsigned int skew_base;
+	unsigned int tempo_base;
 
 	struct timespec64	last_update;	 /* time of last clock update, used for interpolation */
 
@@ -116,7 +117,8 @@ int snd_seq_timer_stop(struct snd_seq_timer *tmr);
 int snd_seq_timer_start(struct snd_seq_timer *tmr);
 int snd_seq_timer_continue(struct snd_seq_timer *tmr);
 int snd_seq_timer_set_tempo(struct snd_seq_timer *tmr, int tempo);
-int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq);
+int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq,
+				unsigned int tempo_base);
 int snd_seq_timer_set_position_tick(struct snd_seq_timer *tmr, snd_seq_tick_time_t position);
 int snd_seq_timer_set_position_time(struct snd_seq_timer *tmr, snd_seq_real_time_t position);
 int snd_seq_timer_set_skew(struct snd_seq_timer *tmr, unsigned int skew, unsigned int base);
-- 
2.43.0

