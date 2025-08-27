Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15D191F6A
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281985; cv=none; b=XwQ5F4dVsPehdjnErV+S7ZJ0k9UHma27qWPKPBu/IP+z7ahgk2Yk5jy+nSNfeq1+Aa0RTM/4bBKg1M4ByCZ/vO5Evkg8zzPTRWqfZhqxNNpTlZ/k1vIY1+KV7jwrOrvNN3c4ggxaGhNgSiIqEs6tgAZB2SbEcyO/1zDRM0VEgDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281985; c=relaxed/simple;
	bh=Os4XvKqzrNJK+3S39f7va399mAO0du+WK7ED64LsE/Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKGF2Xd2vSvx+q6cd2sOyn8dOI5+92S2fw2V/moHEEnHFRVIqmSeCBuopsPCKBlkk01TWh7M0PLtYfPcEBsHkcowlZxlcCdKGNW0sX5/cYfmJt4OGh69PZBRGBnnhS4LUgS2aHTsT1t3PT2ME7cq+B8tv6MQwe10lDiPwtD2Q2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlCddfpL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iF2W+BXg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlCddfpL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iF2W+BXg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlCddfpL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iF2W+BXg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlCddfpL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iF2W+BXg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80D8B1FEEB;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxNgKHD5M8Qfu378umLwc5vBZBx4+I8UJcV20XgADFw=;
	b=DlCddfpLiIeklg8SGg3Erez2LlzuJucwb9d7UO3reoD/bOVfE7iwe8DNmg1I83il2V6jLZ
	PdV/nPPzg9nF6r0xsUFHAS1ICciGbvWoCkMEkthhiN92tZYrup77P2mgAvQPLiJiwBqfE+
	nSU9NVEeUjT+9TGzEhF8uqGvU0/80/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxNgKHD5M8Qfu378umLwc5vBZBx4+I8UJcV20XgADFw=;
	b=iF2W+BXg3vYMoLP2Sl68cyPcLWkO/Gx5b8v2SxE6kb1dNZl7tr/l6aIU0ANhn2EUjNv21u
	vikyD3y/6Jq/6XBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DlCddfpL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iF2W+BXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxNgKHD5M8Qfu378umLwc5vBZBx4+I8UJcV20XgADFw=;
	b=DlCddfpLiIeklg8SGg3Erez2LlzuJucwb9d7UO3reoD/bOVfE7iwe8DNmg1I83il2V6jLZ
	PdV/nPPzg9nF6r0xsUFHAS1ICciGbvWoCkMEkthhiN92tZYrup77P2mgAvQPLiJiwBqfE+
	nSU9NVEeUjT+9TGzEhF8uqGvU0/80/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxNgKHD5M8Qfu378umLwc5vBZBx4+I8UJcV20XgADFw=;
	b=iF2W+BXg3vYMoLP2Sl68cyPcLWkO/Gx5b8v2SxE6kb1dNZl7tr/l6aIU0ANhn2EUjNv21u
	vikyD3y/6Jq/6XBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F34B13A31;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YPb3FUS8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 10/11] ALSA: seq: oss/synth: Clean up with guard and auto cleanup
Date: Wed, 27 Aug 2025 10:05:16 +0200
Message-ID: <20250827080520.7544-11-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827080520.7544-1-tiwai@suse.de>
References: <20250827080520.7544-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 80D8B1FEEB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

Use the auto-cleanup for the refcount management of seq_oss_synth
object.  The explicit call of snd_use_lock_free() is dropped by the
magic __free(seq_oss_synth) attribute.

Along with that, replace the manual mutex and spin locks with
guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_synth.c | 125 ++++++++++++-----------------
 1 file changed, 52 insertions(+), 73 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 9de47e098b29..8c4e5913c7e6 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -44,6 +44,7 @@ struct seq_oss_synth {
 	snd_use_lock_t use_lock;
 };
 
+DEFINE_FREE(seq_oss_synth, struct seq_oss_synth *, if (!IS_ERR_OR_NULL(_T)) snd_use_lock_free(&(_T)->use_lock))
 
 /*
  * device table
@@ -85,7 +86,6 @@ snd_seq_oss_synth_probe(struct device *_dev)
 	int i;
 	struct seq_oss_synth *rec;
 	struct snd_seq_oss_reg *reg = SNDRV_SEQ_DEVICE_ARGPTR(dev);
-	unsigned long flags;
 
 	rec = kzalloc(sizeof(*rec), GFP_KERNEL);
 	if (!rec)
@@ -103,23 +103,22 @@ snd_seq_oss_synth_probe(struct device *_dev)
 	strscpy(rec->name, dev->name, sizeof(rec->name));
 
 	/* registration */
-	spin_lock_irqsave(&register_lock, flags);
-	for (i = 0; i < max_synth_devs; i++) {
-		if (synth_devs[i] == NULL)
-			break;
-	}
-	if (i >= max_synth_devs) {
-		if (max_synth_devs >= SNDRV_SEQ_OSS_MAX_SYNTH_DEVS) {
-			spin_unlock_irqrestore(&register_lock, flags);
-			pr_err("ALSA: seq_oss: no more synth slot\n");
-			kfree(rec);
-			return -ENOMEM;
+	scoped_guard(spinlock_irqsave, &register_lock) {
+		for (i = 0; i < max_synth_devs; i++) {
+			if (synth_devs[i] == NULL)
+				break;
 		}
-		max_synth_devs++;
+		if (i >= max_synth_devs) {
+			if (max_synth_devs >= SNDRV_SEQ_OSS_MAX_SYNTH_DEVS) {
+				pr_err("ALSA: seq_oss: no more synth slot\n");
+				kfree(rec);
+				return -ENOMEM;
+			}
+			max_synth_devs++;
+		}
+		rec->seq_device = i;
+		synth_devs[i] = rec;
 	}
-	rec->seq_device = i;
-	synth_devs[i] = rec;
-	spin_unlock_irqrestore(&register_lock, flags);
 	dev->driver_data = rec;
 #ifdef SNDRV_OSS_INFO_DEV_SYNTH
 	if (i < SNDRV_CARDS)
@@ -135,27 +134,25 @@ snd_seq_oss_synth_remove(struct device *_dev)
 	struct snd_seq_device *dev = to_seq_dev(_dev);
 	int index;
 	struct seq_oss_synth *rec = dev->driver_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&register_lock, flags);
-	for (index = 0; index < max_synth_devs; index++) {
-		if (synth_devs[index] == rec)
-			break;
-	}
-	if (index >= max_synth_devs) {
-		spin_unlock_irqrestore(&register_lock, flags);
-		pr_err("ALSA: seq_oss: can't unregister synth\n");
-		return -EINVAL;
-	}
-	synth_devs[index] = NULL;
-	if (index == max_synth_devs - 1) {
-		for (index--; index >= 0; index--) {
-			if (synth_devs[index])
+	scoped_guard(spinlock_irqsave, &register_lock) {
+		for (index = 0; index < max_synth_devs; index++) {
+			if (synth_devs[index] == rec)
 				break;
 		}
-		max_synth_devs = index + 1;
+		if (index >= max_synth_devs) {
+			pr_err("ALSA: seq_oss: can't unregister synth\n");
+			return -EINVAL;
+		}
+		synth_devs[index] = NULL;
+		if (index == max_synth_devs - 1) {
+			for (index--; index >= 0; index--) {
+				if (synth_devs[index])
+					break;
+			}
+			max_synth_devs = index + 1;
+		}
 	}
-	spin_unlock_irqrestore(&register_lock, flags);
 #ifdef SNDRV_OSS_INFO_DEV_SYNTH
 	if (rec->seq_device < SNDRV_CARDS)
 		snd_oss_info_unregister(SNDRV_OSS_INFO_DEV_SYNTH, rec->seq_device);
@@ -174,13 +171,11 @@ static struct seq_oss_synth *
 get_sdev(int dev)
 {
 	struct seq_oss_synth *rec;
-	unsigned long flags;
 
-	spin_lock_irqsave(&register_lock, flags);
+	guard(spinlock_irqsave)(&register_lock);
 	rec = synth_devs[dev];
 	if (rec)
 		snd_use_lock_use(&rec->use_lock);
-	spin_unlock_irqrestore(&register_lock, flags);
 	return rec;
 }
 
@@ -193,20 +188,18 @@ void
 snd_seq_oss_synth_setup(struct seq_oss_devinfo *dp)
 {
 	int i;
-	struct seq_oss_synth *rec;
 	struct seq_oss_synthinfo *info;
 
 	dp->max_synthdev = max_synth_devs;
 	dp->synth_opened = 0;
 	memset(dp->synths, 0, sizeof(dp->synths));
 	for (i = 0; i < dp->max_synthdev; i++) {
-		rec = get_sdev(i);
+		struct seq_oss_synth *rec __free(seq_oss_synth) = get_sdev(i);
+
 		if (rec == NULL)
 			continue;
-		if (rec->oper.open == NULL || rec->oper.close == NULL) {
-			snd_use_lock_free(&rec->use_lock);
+		if (rec->oper.open == NULL || rec->oper.close == NULL)
 			continue;
-		}
 		info = &dp->synths[i];
 		info->arg.app_index = dp->port;
 		info->arg.file_mode = dp->file_mode;
@@ -216,13 +209,10 @@ snd_seq_oss_synth_setup(struct seq_oss_devinfo *dp)
 		else
 			info->arg.event_passing = SNDRV_SEQ_OSS_PASS_EVENTS;
 		info->opened = 0;
-		if (!try_module_get(rec->oper.owner)) {
-			snd_use_lock_free(&rec->use_lock);
+		if (!try_module_get(rec->oper.owner))
 			continue;
-		}
 		if (rec->oper.open(&info->arg, rec->private_data) < 0) {
 			module_put(rec->oper.owner);
-			snd_use_lock_free(&rec->use_lock);
 			continue;
 		}
 		info->nr_voices = rec->nr_voices;
@@ -231,7 +221,6 @@ snd_seq_oss_synth_setup(struct seq_oss_devinfo *dp)
 			if (!info->ch) {
 				rec->oper.close(&info->arg);
 				module_put(rec->oper.owner);
-				snd_use_lock_free(&rec->use_lock);
 				continue;
 			}
 			reset_channels(info);
@@ -239,7 +228,6 @@ snd_seq_oss_synth_setup(struct seq_oss_devinfo *dp)
 		info->opened++;
 		rec->opened++;
 		dp->synth_opened++;
-		snd_use_lock_free(&rec->use_lock);
 	}
 }
 
@@ -286,7 +274,6 @@ void
 snd_seq_oss_synth_cleanup(struct seq_oss_devinfo *dp)
 {
 	int i;
-	struct seq_oss_synth *rec;
 	struct seq_oss_synthinfo *info;
 
 	if (snd_BUG_ON(dp->max_synthdev > SNDRV_SEQ_OSS_MAX_SYNTH_DEVS))
@@ -301,7 +288,9 @@ snd_seq_oss_synth_cleanup(struct seq_oss_devinfo *dp)
 				midi_synth_dev.opened--;
 			}
 		} else {
-			rec = get_sdev(i);
+			struct seq_oss_synth *rec __free(seq_oss_synth) =
+				get_sdev(i);
+
 			if (rec == NULL)
 				continue;
 			if (rec->opened > 0) {
@@ -309,7 +298,6 @@ snd_seq_oss_synth_cleanup(struct seq_oss_devinfo *dp)
 				module_put(rec->oper.owner);
 				rec->opened = 0;
 			}
-			snd_use_lock_free(&rec->use_lock);
 		}
 		kfree(info->ch);
 		info->ch = NULL;
@@ -380,7 +368,7 @@ reset_channels(struct seq_oss_synthinfo *info)
 void
 snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_synth *rec;
+	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 	struct seq_oss_synthinfo *info;
 
 	info = get_synthinfo_nospec(dp, dev);
@@ -416,7 +404,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo *dp, int dev)
 		ev.type = SNDRV_SEQ_EVENT_RESET;
 		snd_seq_oss_dispatch(dp, &ev, 0, 0);
 	}
-	snd_use_lock_free(&rec->use_lock);
 }
 
 
@@ -428,9 +415,8 @@ int
 snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 			    const char __user *buf, int p, int c)
 {
-	struct seq_oss_synth *rec;
+	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 	struct seq_oss_synthinfo *info;
-	int rc;
 
 	info = get_synthinfo_nospec(dp, dev);
 	if (!info)
@@ -443,11 +429,9 @@ snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 		return -ENXIO;
 
 	if (rec->oper.load_patch == NULL)
-		rc = -ENXIO;
+		return -ENXIO;
 	else
-		rc = rec->oper.load_patch(&info->arg, fmt, buf, p, c);
-	snd_use_lock_free(&rec->use_lock);
-	return rc;
+		return rec->oper.load_patch(&info->arg, fmt, buf, p, c);
 }
 
 /*
@@ -456,13 +440,11 @@ snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 struct seq_oss_synthinfo *
 snd_seq_oss_synth_info(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_synth *rec;
+	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 
 	rec = get_synthdev(dp, dev);
-	if (rec) {
-		snd_use_lock_free(&rec->use_lock);
+	if (rec)
 		return get_synthinfo_nospec(dp, dev);
-	}
 	return NULL;
 }
 
@@ -513,9 +495,8 @@ snd_seq_oss_synth_addr(struct seq_oss_devinfo *dp, int dev, struct snd_seq_event
 int
 snd_seq_oss_synth_ioctl(struct seq_oss_devinfo *dp, int dev, unsigned int cmd, unsigned long addr)
 {
-	struct seq_oss_synth *rec;
+	struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
 	struct seq_oss_synthinfo *info;
-	int rc;
 
 	info = get_synthinfo_nospec(dp, dev);
 	if (!info || info->is_midi)
@@ -524,11 +505,9 @@ snd_seq_oss_synth_ioctl(struct seq_oss_devinfo *dp, int dev, unsigned int cmd, u
 	if (!rec)
 		return -ENXIO;
 	if (rec->oper.ioctl == NULL)
-		rc = -ENXIO;
+		return -ENXIO;
 	else
-		rc = rec->oper.ioctl(&info->arg, cmd, addr);
-	snd_use_lock_free(&rec->use_lock);
-	return rc;
+		return rec->oper.ioctl(&info->arg, cmd, addr);
 }
 
 
@@ -555,7 +534,6 @@ snd_seq_oss_synth_raw_event(struct seq_oss_devinfo *dp, int dev, unsigned char *
 int
 snd_seq_oss_synth_make_info(struct seq_oss_devinfo *dp, int dev, struct synth_info *inf)
 {
-	struct seq_oss_synth *rec;
 	struct seq_oss_synthinfo *info = get_synthinfo_nospec(dp, dev);
 
 	if (!info)
@@ -571,7 +549,9 @@ snd_seq_oss_synth_make_info(struct seq_oss_devinfo *dp, int dev, struct synth_in
 		inf->device = dev;
 		strscpy(inf->name, minf.name, sizeof(inf->name));
 	} else {
-		rec = get_synthdev(dp, dev);
+		struct seq_oss_synth *rec __free(seq_oss_synth) =
+			get_synthdev(dp, dev);
+
 		if (!rec)
 			return -ENXIO;
 		inf->synth_type = rec->synth_type;
@@ -579,7 +559,6 @@ snd_seq_oss_synth_make_info(struct seq_oss_devinfo *dp, int dev, struct synth_in
 		inf->nr_voices = rec->nr_voices;
 		inf->device = dev;
 		strscpy(inf->name, rec->name, sizeof(inf->name));
-		snd_use_lock_free(&rec->use_lock);
 	}
 	return 0;
 }
@@ -593,10 +572,11 @@ void
 snd_seq_oss_synth_info_read(struct snd_info_buffer *buf)
 {
 	int i;
-	struct seq_oss_synth *rec;
 
 	snd_iprintf(buf, "\nNumber of synth devices: %d\n", max_synth_devs);
 	for (i = 0; i < max_synth_devs; i++) {
+		struct seq_oss_synth *rec __free(seq_oss_synth) = NULL;
+
 		snd_iprintf(buf, "\nsynth %d: ", i);
 		rec = get_sdev(i);
 		if (rec == NULL) {
@@ -610,7 +590,6 @@ snd_seq_oss_synth_info_read(struct snd_info_buffer *buf)
 		snd_iprintf(buf, "  capabilities : ioctl %s / load_patch %s\n",
 			    str_enabled_disabled((long)rec->oper.ioctl),
 			    str_enabled_disabled((long)rec->oper.load_patch));
-		snd_use_lock_free(&rec->use_lock);
 	}
 }
 #endif /* CONFIG_SND_PROC_FS */
-- 
2.50.1

