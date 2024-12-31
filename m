Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34117ADE8
	for <linux-sound@vger.kernel.org>; Tue, 31 Dec 2024 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735646134; cv=none; b=UOPndfcsMbR25IZ7TF1wG3we6qp82b/kiEu3a/VRTpeWZR8tq0m97bHUg5jzH2/CwSXnWmmcMZl0OonFXMIZ2jAzDt0hGe5lEs8oaPTjSBZDlAPNzQrK4OTsNA0hSUGTP8RN8eeYSSrTNBGf1vZs4DtUkJmAz3U/X+GS5sfkFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735646134; c=relaxed/simple;
	bh=KQ6Dg+6okoEIPP8Q3+FUR0H+XlmA4mOL4ozJETDOidY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGGeMZDHoPehmRmE3rYkW/0ynmM85uLvnVAc44Me4y7PBRKqzYm9F4ZLj1EgvYzpYF/lzNy5hlcmKFD9DoO7s36+KigU+1i616UJP5ROH43ysUWE5Cj0HZOQ0f8aEm4gNZjUpwX0494D4zQkl/nKyw7786hOKgs8pdHUQQY9/JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kxYN1VfX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k4PYuYCN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kxYN1VfX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k4PYuYCN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kxYN1VfX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k4PYuYCN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kxYN1VfX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k4PYuYCN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06AC121102;
	Tue, 31 Dec 2024 11:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735646125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v2Ywnii6ld1I0Ep8R5cz0AbhKISgtqY/KKb+uDpBBQI=;
	b=kxYN1VfXG7t+F6IJFMCeL2QPBHM+/cGoNNnDK2nfajBSYHTkrLcbMdHOxtWJBn9If0XrBR
	cKdQMJ//1I4ebjUnjryDCpZ0qDpfOZwqCKECXQEy/hzRuI0ZpB32Na0DEGj9p7Il5RifBb
	2yldcihPyUWRClhaiGPSfWpnbrp65nM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735646125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v2Ywnii6ld1I0Ep8R5cz0AbhKISgtqY/KKb+uDpBBQI=;
	b=k4PYuYCNkBCf/gonaCy38plzqz82uFOW5Bra4QWxuU3E+BWWuiXN5z+Jkve94vggPOyoQE
	vUn3a9Nd1Zs8ceAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735646125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v2Ywnii6ld1I0Ep8R5cz0AbhKISgtqY/KKb+uDpBBQI=;
	b=kxYN1VfXG7t+F6IJFMCeL2QPBHM+/cGoNNnDK2nfajBSYHTkrLcbMdHOxtWJBn9If0XrBR
	cKdQMJ//1I4ebjUnjryDCpZ0qDpfOZwqCKECXQEy/hzRuI0ZpB32Na0DEGj9p7Il5RifBb
	2yldcihPyUWRClhaiGPSfWpnbrp65nM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735646125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v2Ywnii6ld1I0Ep8R5cz0AbhKISgtqY/KKb+uDpBBQI=;
	b=k4PYuYCNkBCf/gonaCy38plzqz82uFOW5Bra4QWxuU3E+BWWuiXN5z+Jkve94vggPOyoQE
	vUn3a9Nd1Zs8ceAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6D1613A30;
	Tue, 31 Dec 2024 11:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qb5dL6zbc2cHKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Dec 2024 11:55:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kun Hu <huk23@m.fudan.edu.cn>
Subject: [PATCH] ALSA: seq: oss: Send fragmented SysEx messages immediately
Date: Tue, 31 Dec 2024 12:55:18 +0100
Message-ID: <20241231115523.15796-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The recent bug report spotted on the old OSS sequencer code that tries
to combine incoming SysEx messages to a single sequencer event.  This
is good, per se, but it has more demerits:

- The sysex message delivery is delayed until the very last event
- The use of internal buffer forced the serialization

The recent fix in commit 0179488ca992 ("ALSA: seq: oss: Fix races at
processing SysEx messages") addressed the latter, but a better fix is
to handle the sysex messages immediately, i.e. just send each incoming
fragmented sysex message as is.  And this patch implements that.
This resulted in a significant cleanup as well.

Note that the only caller of snd_seq_oss_synth_sysex() is
snd_seq_oss_process_event(), and all its callers dispatch the event
immediately, so we can just put the passed buffer pointer to the event
record to be handled.

Reported-and-tested-by: Kun Hu <huk23@m.fudan.edu.cn>
Link: https://lore.kernel.org/2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_device.h |  1 -
 sound/core/seq/oss/seq_oss_synth.c  | 80 +++++------------------------
 2 files changed, 14 insertions(+), 67 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
index 98dd20b42976..c0b1cce127a3 100644
--- a/sound/core/seq/oss/seq_oss_device.h
+++ b/sound/core/seq/oss/seq_oss_device.h
@@ -55,7 +55,6 @@ struct seq_oss_chinfo {
 struct seq_oss_synthinfo {
 	struct snd_seq_oss_arg arg;
 	struct seq_oss_chinfo *ch;
-	struct seq_oss_synth_sysex *sysex;
 	int nr_voices;
 	int opened;
 	int is_midi;
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 51ee4c00a843..02a90c960992 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -26,13 +26,6 @@
  * definition of synth info records
  */
 
-/* sysex buffer */
-struct seq_oss_synth_sysex {
-	int len;
-	int skip;
-	unsigned char buf[MAX_SYSEX_BUFLEN];
-};
-
 /* synth info */
 struct seq_oss_synth {
 	int seq_device;
@@ -66,7 +59,6 @@ static struct seq_oss_synth midi_synth_dev = {
 };
 
 static DEFINE_SPINLOCK(register_lock);
-static DEFINE_MUTEX(sysex_mutex);
 
 /*
  * prototypes
@@ -319,8 +311,6 @@ snd_seq_oss_synth_cleanup(struct seq_oss_devinfo *dp)
 			}
 			snd_use_lock_free(&rec->use_lock);
 		}
-		kfree(info->sysex);
-		info->sysex = NULL;
 		kfree(info->ch);
 		info->ch = NULL;
 	}
@@ -396,8 +386,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
 	info = get_synthinfo_nospec(dp, dev);
 	if (!info || !info->opened)
 		return;
-	if (info->sysex)
-		info->sysex->len = 0; /* reset sysex */
 	reset_channels(info);
 	if (info->is_midi) {
 		if (midi_synth_dev.opened <= 0)
@@ -409,8 +397,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
 					  dp->file_mode) < 0) {
 			midi_synth_dev.opened--;
 			info->opened = 0;
-			kfree(info->sysex);
-			info->sysex = NULL;
 			kfree(info->ch);
 			info->ch = NULL;
 		}
@@ -483,64 +469,26 @@ snd_seq_oss_synth_info(struct seq_oss_devinfo *dp, int dev)
 
 /*
  * receive OSS 6 byte sysex packet:
- * the full sysex message will be sent if it reaches to the end of data
- * (0xff).
+ * the event is filled and prepared for sending immediately
+ * (i.e. sysex messages are fragmented)
  */
 int
 snd_seq_oss_synth_sysex(struct seq_oss_devinfo *dp, int dev, unsigned char *buf, struct snd_seq_event *ev)
 {
-	int i, send;
-	unsigned char *dest;
-	struct seq_oss_synth_sysex *sysex;
-	struct seq_oss_synthinfo *info;
+	unsigned char *p;
+	int len = 6;
 
-	info = snd_seq_oss_synth_info(dp, dev);
-	if (!info)
-		return -ENXIO;
+	p = memchr(buf, 0xff, 6);
+	if (p)
+		len = p - buf + 1;
 
-	guard(mutex)(&sysex_mutex);
-	sysex = info->sysex;
-	if (sysex == NULL) {
-		sysex = kzalloc(sizeof(*sysex), GFP_KERNEL);
-		if (sysex == NULL)
-			return -ENOMEM;
-		info->sysex = sysex;
-	}
-
-	send = 0;
-	dest = sysex->buf + sysex->len;
-	/* copy 6 byte packet to the buffer */
-	for (i = 0; i < 6; i++) {
-		if (buf[i] == 0xff) {
-			send = 1;
-			break;
-		}
-		dest[i] = buf[i];
-		sysex->len++;
-		if (sysex->len >= MAX_SYSEX_BUFLEN) {
-			sysex->len = 0;
-			sysex->skip = 1;
-			break;
-		}
-	}
-
-	if (sysex->len && send) {
-		if (sysex->skip) {
-			sysex->skip = 0;
-			sysex->len = 0;
-			return -EINVAL; /* skip */
-		}
-		/* copy the data to event record and send it */
-		ev->flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
-		if (snd_seq_oss_synth_addr(dp, dev, ev))
-			return -EINVAL;
-		ev->data.ext.len = sysex->len;
-		ev->data.ext.ptr = sysex->buf;
-		sysex->len = 0;
-		return 0;
-	}
-
-	return -EINVAL; /* skip */
+	/* copy the data to event record and send it */
+	if (snd_seq_oss_synth_addr(dp, dev, ev))
+		return -EINVAL;
+	ev->flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
+	ev->data.ext.len = len;
+	ev->data.ext.ptr = buf;
+	return 0;
 }
 
 /*
-- 
2.43.0

