Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BA4322C65
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480437; cv=none; b=HqDgtXAhEArryL54HDvwczR/0MtwO8zEJDFIpfBEYwbBHkUNAGSIXe0Zcf0Mngfh79RqDSF1Un7qMyc1QG8pJUMlKlOKYXOOPNPY77cd2d8BGo0mlgWVqOEo5F0xqOGwahGbVNPbzJG+VfI8FcTV7PxKfKWqZ7mL95AWLC7Mnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480437; c=relaxed/simple;
	bh=ANx7vBVgpsjKCenl3l3oC+TCS+xZPPPzzzwI1O5wdXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/zYuROelVcC4PxR6iS311K/1fIO4yvSkICvAmeLVfft6pTGY44hDuieYHygMDfQJpQcHUFCDYE813gzuOZiwsIa1qFZUuGjzV59ApW0+P5ekWbSHAh/w132xI77AQdpEk4kob96/1A9Emg0ZRA5dhmlFOaeh5iOGexMBAAEKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GSESAK3M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UwZ1pla7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GSESAK3M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UwZ1pla7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GSESAK3M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UwZ1pla7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GSESAK3M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UwZ1pla7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D7FD95C268;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH/tVUW9kRpeREiY0ny68jGGiOg+THJXlK+b/aOlNK4=;
	b=GSESAK3MGidoPTKRxB0ZwzZT1reLXFAUZDpdNuf139oJLRIlqaPnPEphx6mOv+3+X8w7en
	jiE6jx1csZ4DPKl759ZY/Xj8QrgVu1iW9WYJGheW4vDLOfbGobbEgLv7W7LuP02Ij/ZspI
	gKLctvQIPbHSMEpv7jzjxcuWNjgucHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH/tVUW9kRpeREiY0ny68jGGiOg+THJXlK+b/aOlNK4=;
	b=UwZ1pla7Bn1tGjQXVp0rSVG9CjxjJrQzojvDUzlaRsRG61+UiqxmrcKUUUNMcfsYIICTuW
	v+eSWRNOrQK69VCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH/tVUW9kRpeREiY0ny68jGGiOg+THJXlK+b/aOlNK4=;
	b=GSESAK3MGidoPTKRxB0ZwzZT1reLXFAUZDpdNuf139oJLRIlqaPnPEphx6mOv+3+X8w7en
	jiE6jx1csZ4DPKl759ZY/Xj8QrgVu1iW9WYJGheW4vDLOfbGobbEgLv7W7LuP02Ij/ZspI
	gKLctvQIPbHSMEpv7jzjxcuWNjgucHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH/tVUW9kRpeREiY0ny68jGGiOg+THJXlK+b/aOlNK4=;
	b=UwZ1pla7Bn1tGjQXVp0rSVG9CjxjJrQzojvDUzlaRsRG61+UiqxmrcKUUUNMcfsYIICTuW
	v+eSWRNOrQK69VCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD87C13326;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IMQCLaXDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/19] ALSA: synth: Use guard() for preset locks
Date: Fri, 29 Aug 2025 17:13:19 +0200
Message-ID: <20250829151335.7342-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Define a macro for the preset locking/unlocking pairs for soundfont
using guard() macro as a further code cleanup.

The new macro is put in soundfont.h (and some function renames) along
with it for avoiding unnecessary troubles with clang.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/soundfont.h    | 18 ++++++++++++
 sound/synth/emux/soundfont.c | 56 ++++++++----------------------------
 2 files changed, 30 insertions(+), 44 deletions(-)

diff --git a/include/sound/soundfont.h b/include/sound/soundfont.h
index 8a40cc15f66d..48f8cf6de3ac 100644
--- a/include/sound/soundfont.h
+++ b/include/sound/soundfont.h
@@ -114,5 +114,23 @@ int snd_sf_calc_parm_decay(int msec);
 extern int snd_sf_vol_table[128];
 int snd_sf_linear_to_log(unsigned int amount, int offset, int ratio);
 
+/* lock access to sflist */
+static inline void snd_soundfont_lock_preset(struct snd_sf_list *sflist)
+{
+	mutex_lock(&sflist->presets_mutex);
+	guard(spinlock_irqsave)(&sflist->lock);
+	sflist->presets_locked = 1;
+}
+
+/* remove lock */
+static inline void snd_soundfont_unlock_preset(struct snd_sf_list *sflist)
+{
+	guard(spinlock_irqsave)(&sflist->lock);
+	sflist->presets_locked = 0;
+	mutex_unlock(&sflist->presets_mutex);
+}
+
+DEFINE_GUARD(snd_soundfont_lock_preset, struct snd_sf_list *,
+	     snd_soundfont_lock_preset(_T), snd_soundfont_unlock_preset(_T))
 
 #endif /* __SOUND_SOUNDFONT_H */
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index cbff9f7ad38c..59f3b1b6df4a 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -60,30 +60,6 @@ static int get_index(int bank, int instr, int key);
 static void snd_sf_init(struct snd_sf_list *sflist);
 static void snd_sf_clear(struct snd_sf_list *sflist);
 
-/*
- * lock access to sflist
- */
-static void
-lock_preset(struct snd_sf_list *sflist)
-{
-	mutex_lock(&sflist->presets_mutex);
-	guard(spinlock_irqsave)(&sflist->lock);
-	sflist->presets_locked = 1;
-}
-
-
-/*
- * remove lock
- */
-static void
-unlock_preset(struct snd_sf_list *sflist)
-{
-	guard(spinlock_irqsave)(&sflist->lock);
-	sflist->presets_locked = 0;
-	mutex_unlock(&sflist->presets_mutex);
-}
-
-
 /*
  * close the patch if the patch was opened by this client.
  */
@@ -140,10 +116,8 @@ snd_soundfont_load(struct snd_card *card,
 
 	if (patch.type == SNDRV_SFNT_OPEN_PATCH) {
 		/* grab sflist to open */
-		lock_preset(sflist);
-		rc = open_patch(sflist, data, count, client);
-		unlock_preset(sflist);
-		return rc;
+		guard(snd_soundfont_lock_preset)(sflist);
+		return open_patch(sflist, data, count, client);
 	}
 
 	/* check if other client already opened patch */
@@ -152,7 +126,7 @@ snd_soundfont_load(struct snd_card *card,
 			return -EBUSY;
 	}
 
-	lock_preset(sflist);
+	guard(snd_soundfont_lock_preset)(sflist);
 	rc = -EINVAL;
 	switch (patch.type) {
 	case SNDRV_SFNT_LOAD_INFO:
@@ -190,7 +164,6 @@ snd_soundfont_load(struct snd_card *card,
 		}
 		break;
 	}
-	unlock_preset(sflist);
 
 	return rc;
 }
@@ -1153,11 +1126,8 @@ snd_soundfont_load_guspatch(struct snd_card *card,
 			    struct snd_sf_list *sflist, const char __user *data,
 			    long count)
 {
-	int rc;
-	lock_preset(sflist);
-	rc = load_guspatch(card, sflist, data, count);
-	unlock_preset(sflist);
-	return rc;
+	guard(snd_soundfont_lock_preset)(sflist);
+	return load_guspatch(card, sflist, data, count);
 }
 
 
@@ -1446,11 +1416,11 @@ snd_sf_free(struct snd_sf_list *sflist)
 	if (sflist == NULL)
 		return;
 	
-	lock_preset(sflist);
-	if (sflist->callback.sample_reset)
-		sflist->callback.sample_reset(sflist->callback.private_data);
-	snd_sf_clear(sflist);
-	unlock_preset(sflist);
+	scoped_guard(snd_soundfont_lock_preset, sflist) {
+		if (sflist->callback.sample_reset)
+			sflist->callback.sample_reset(sflist->callback.private_data);
+		snd_sf_clear(sflist);
+	}
 
 	kfree(sflist);
 }
@@ -1462,11 +1432,10 @@ snd_sf_free(struct snd_sf_list *sflist)
 int
 snd_soundfont_remove_samples(struct snd_sf_list *sflist)
 {
-	lock_preset(sflist);
+	guard(snd_soundfont_lock_preset)(sflist);
 	if (sflist->callback.sample_reset)
 		sflist->callback.sample_reset(sflist->callback.private_data);
 	snd_sf_clear(sflist);
-	unlock_preset(sflist);
 
 	return 0;
 }
@@ -1482,7 +1451,7 @@ snd_soundfont_remove_unlocked(struct snd_sf_list *sflist)
 	struct snd_sf_zone *zp, *nextzp;
 	struct snd_sf_sample *sp, *nextsp;
 
-	lock_preset(sflist);
+	guard(snd_soundfont_lock_preset)(sflist);
 
 	if (sflist->callback.sample_reset)
 		sflist->callback.sample_reset(sflist->callback.private_data);
@@ -1516,6 +1485,5 @@ snd_soundfont_remove_unlocked(struct snd_sf_list *sflist)
 
 	rebuild_presets(sflist);
 
-	unlock_preset(sflist);
 	return 0;
 }
-- 
2.50.1

