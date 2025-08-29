Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE4B1E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479654; cv=none; b=L2Q36v72HROlRd7hpPkZHC1ApvjX1lMA7EuZPUPyqpNTwE9QxkAsxGeATRlLhB+Zyrcm47vJWNqQtCj/9yGOVKnESk/NKxglSM99DMMfNlxQL2Fl785OVj2Rajm5jJkYWGbuh9nZ6pHz2SN3MbeK9iP0fAysvGqX5tLmhQkXBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479654; c=relaxed/simple;
	bh=0XhKfetT2sd+Ye/9A4ByZh9OPRmpHSs7bPRnSZKV3gw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=er6QVHAOFc4X5JNHooduFloy9Z9u2CLmUJj8wqP3SJp/2ZHlQjgT2YjfQr5v8HY6TEIo+2ZIFC+V3nUlKKVvjYIWxVbyJkOjzBNlx6IJzPCqg5XP8yc1SXDif000HkByq9qZQ5SEaU8rIu5t29+GQxAWP0/2vw20HwycN83e2C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f5Kiejpf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LOvdQs1Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f5Kiejpf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LOvdQs1Y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f5Kiejpf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LOvdQs1Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f5Kiejpf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LOvdQs1Y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0114433EDF;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WllfU01IEOCq5StuCYVXsyrFEslrg4jftTS1l7ZgmsI=;
	b=f5KiejpfbCsfLNbMufzhP2P5PVOeJYVxCjK0CvoN1rGhp3k1gqh4LA7EZowhf2Li3OyMVu
	wYfcRgk51NSRKRPHon8fX+da7IwNcy2Dae2DbvYDRIYQkVpvO/iBVqY7t8vFYPhgk6A35n
	93vipiALKIZjGDum3JUGDEOpc5OlPJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WllfU01IEOCq5StuCYVXsyrFEslrg4jftTS1l7ZgmsI=;
	b=LOvdQs1YqI8SNA1oqYcEaEh6Emi68vE11CRBlbrmm4k3VuPjcq3V3PWF92gOknYr5CfUST
	lkeeKJvWX6UV7lCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f5Kiejpf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LOvdQs1Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WllfU01IEOCq5StuCYVXsyrFEslrg4jftTS1l7ZgmsI=;
	b=f5KiejpfbCsfLNbMufzhP2P5PVOeJYVxCjK0CvoN1rGhp3k1gqh4LA7EZowhf2Li3OyMVu
	wYfcRgk51NSRKRPHon8fX+da7IwNcy2Dae2DbvYDRIYQkVpvO/iBVqY7t8vFYPhgk6A35n
	93vipiALKIZjGDum3JUGDEOpc5OlPJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WllfU01IEOCq5StuCYVXsyrFEslrg4jftTS1l7ZgmsI=;
	b=LOvdQs1YqI8SNA1oqYcEaEh6Emi68vE11CRBlbrmm4k3VuPjcq3V3PWF92gOknYr5CfUST
	lkeeKJvWX6UV7lCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7F9213326;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MIOWM4/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/13] ALSA: opl4: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:00:16 +0200
Message-ID: <20250829150026.6379-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0114433EDF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl4/opl4_proc.c | 10 +++-------
 sound/drivers/opl4/opl4_seq.c  | 28 +++++++++++-----------------
 2 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/sound/drivers/opl4/opl4_proc.c b/sound/drivers/opl4/opl4_proc.c
index f2149091e10a..fd0ba4704d9f 100644
--- a/sound/drivers/opl4/opl4_proc.c
+++ b/sound/drivers/opl4/opl4_proc.c
@@ -14,13 +14,10 @@ static int snd_opl4_mem_proc_open(struct snd_info_entry *entry,
 {
 	struct snd_opl4 *opl4 = entry->private_data;
 
-	mutex_lock(&opl4->access_mutex);
-	if (opl4->memory_access) {
-		mutex_unlock(&opl4->access_mutex);
+	guard(mutex)(&opl4->access_mutex);
+	if (opl4->memory_access)
 		return -EBUSY;
-	}
 	opl4->memory_access++;
-	mutex_unlock(&opl4->access_mutex);
 	return 0;
 }
 
@@ -29,9 +26,8 @@ static int snd_opl4_mem_proc_release(struct snd_info_entry *entry,
 {
 	struct snd_opl4 *opl4 = entry->private_data;
 
-	mutex_lock(&opl4->access_mutex);
+	guard(mutex)(&opl4->access_mutex);
 	opl4->memory_access--;
-	mutex_unlock(&opl4->access_mutex);
 	return 0;
 }
 
diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
index f59ca660c616..7bb22089a093 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -63,24 +63,18 @@ static int snd_opl4_seq_use(void *private_data, struct snd_seq_port_subscribe *i
 	struct snd_opl4 *opl4 = private_data;
 	int err;
 
-	mutex_lock(&opl4->access_mutex);
+	scoped_guard(mutex, &opl4->access_mutex) {
+		if (opl4->used)
+			return -EBUSY;
+		opl4->used++;
 
-	if (opl4->used) {
-		mutex_unlock(&opl4->access_mutex);
-		return -EBUSY;
-	}
-	opl4->used++;
-
-	if (info->sender.client != SNDRV_SEQ_CLIENT_SYSTEM) {
-		err = snd_opl4_seq_use_inc(opl4);
-		if (err < 0) {
-			mutex_unlock(&opl4->access_mutex);
-			return err;
+		if (info->sender.client != SNDRV_SEQ_CLIENT_SYSTEM) {
+			err = snd_opl4_seq_use_inc(opl4);
+			if (err < 0)
+				return err;
 		}
 	}
 
-	mutex_unlock(&opl4->access_mutex);
-
 	snd_opl4_synth_reset(opl4);
 	return 0;
 }
@@ -91,9 +85,9 @@ static int snd_opl4_seq_unuse(void *private_data, struct snd_seq_port_subscribe
 
 	snd_opl4_synth_shutdown(opl4);
 
-	mutex_lock(&opl4->access_mutex);
-	opl4->used--;
-	mutex_unlock(&opl4->access_mutex);
+	scoped_guard(mutex, &opl4->access_mutex) {
+		opl4->used--;
+	}
 
 	if (info->sender.client != SNDRV_SEQ_CLIENT_SYSTEM)
 		snd_opl4_seq_use_dec(opl4);
-- 
2.50.1

