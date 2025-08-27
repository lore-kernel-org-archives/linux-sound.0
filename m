Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0925191F6A
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281971; cv=none; b=snNia4+2CIFrcTXJjZgWm7PRwnkqibE80RcusBq41d7EuFZotIUOWcJ3K5CgFXiugHPxVmuhR5hw3YP7qoC6U1rsW5NiMNAWwZixVItO8rnyxWvvnhiQqVQ9mg5u8InEftJIP7YtCfgquqyxpMNodFKicYqv5WZk4kejgzVz/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281971; c=relaxed/simple;
	bh=ZabujSEEcRE6Fo9JC6OGxBFDPChGQH5u6bHpNXvwYKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnmzupLx+npYWj0eoUe2dOTso6tTaHxeuqxqGbugvf+Kfe5fUUB9s420GQGigAuQm8HvAulIDzVWLZ9SLxF0imosV8TAmOEdiY4VNSEadzX6yATc6L96OHihdl1W+z0tm7zPDR0ARETUKnQo9HHMk4nO7gbqJJYiCvPd1DkDwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aRBRh0wY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g6zusbaO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aRBRh0wY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g6zusbaO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aRBRh0wY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g6zusbaO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aRBRh0wY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g6zusbaO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B9B61FEE9;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaNo1r1Glw9iBO8gdxeMa++UH6C4/nFPr9gSSGgGjWw=;
	b=aRBRh0wYsyDyYCkgCym9F+qrFnk+ofdtXCm+/uxFKlFSHWYn1c3hbVJ/mygvXplhmTmNFR
	SG7PKhQWqIWY904IeCxs5jIggaEljeuz8TwKaCrrSTQ7iPsTDArvhylBx9MkvqQSBY/Ad9
	7M2rNv5C+OBguQl4vuGNfvK+iagJ70Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaNo1r1Glw9iBO8gdxeMa++UH6C4/nFPr9gSSGgGjWw=;
	b=g6zusbaO6ice/AGCqo8MGcQzoV6NaWF2l+NNKjKu5uYVdrN7SKRHN2yt0zq8KZK7iTqhTX
	g1n6OcNaxO4zRKBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aRBRh0wY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=g6zusbaO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaNo1r1Glw9iBO8gdxeMa++UH6C4/nFPr9gSSGgGjWw=;
	b=aRBRh0wYsyDyYCkgCym9F+qrFnk+ofdtXCm+/uxFKlFSHWYn1c3hbVJ/mygvXplhmTmNFR
	SG7PKhQWqIWY904IeCxs5jIggaEljeuz8TwKaCrrSTQ7iPsTDArvhylBx9MkvqQSBY/Ad9
	7M2rNv5C+OBguQl4vuGNfvK+iagJ70Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaNo1r1Glw9iBO8gdxeMa++UH6C4/nFPr9gSSGgGjWw=;
	b=g6zusbaO6ice/AGCqo8MGcQzoV6NaWF2l+NNKjKu5uYVdrN7SKRHN2yt0zq8KZK7iTqhTX
	g1n6OcNaxO4zRKBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 229E913A31;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aKhCB0S8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 08/11] ALSA: seq: oss: Clean up core code with guard()
Date: Wed, 27 Aug 2025 10:05:14 +0200
Message-ID: <20250827080520.7544-9-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 3B9B61FEE9
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 77c1214acd90..02d30d8b6c3a 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -117,18 +117,15 @@ static DEFINE_MUTEX(register_mutex);
 static int
 odev_open(struct inode *inode, struct file *file)
 {
-	int level, rc;
+	int level;
 
 	if (iminor(inode) == SNDRV_MINOR_OSS_MUSIC)
 		level = SNDRV_SEQ_OSS_MODE_MUSIC;
 	else
 		level = SNDRV_SEQ_OSS_MODE_SYNTH;
 
-	mutex_lock(&register_mutex);
-	rc = snd_seq_oss_open(file, level);
-	mutex_unlock(&register_mutex);
-
-	return rc;
+	guard(mutex)(&register_mutex);
+	return snd_seq_oss_open(file, level);
 }
 
 static int
@@ -140,10 +137,8 @@ odev_release(struct inode *inode, struct file *file)
 	if (!dp)
 		return 0;
 
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	snd_seq_oss_release(dp);
-	mutex_unlock(&register_mutex);
-
 	return 0;
 }
 
@@ -229,13 +224,12 @@ register_device(void)
 {
 	int rc;
 
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	rc = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_SEQUENCER,
 				     NULL, 0,
 				     &seq_oss_f_ops, NULL);
 	if (rc < 0) {
 		pr_err("ALSA: seq_oss: can't register device seq\n");
-		mutex_unlock(&register_mutex);
 		return rc;
 	}
 	rc = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MUSIC,
@@ -244,22 +238,19 @@ register_device(void)
 	if (rc < 0) {
 		pr_err("ALSA: seq_oss: can't register device music\n");
 		snd_unregister_oss_device(SNDRV_OSS_DEVICE_TYPE_SEQUENCER, NULL, 0);
-		mutex_unlock(&register_mutex);
 		return rc;
 	}
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 
 static void
 unregister_device(void)
 {
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	if (snd_unregister_oss_device(SNDRV_OSS_DEVICE_TYPE_MUSIC, NULL, 0) < 0)		
 		pr_err("ALSA: seq_oss: error unregister device music\n");
 	if (snd_unregister_oss_device(SNDRV_OSS_DEVICE_TYPE_SEQUENCER, NULL, 0) < 0)
 		pr_err("ALSA: seq_oss: error unregister device seq\n");
-	mutex_unlock(&register_mutex);
 }
 
 /*
@@ -273,12 +264,11 @@ static struct snd_info_entry *info_entry;
 static void
 info_read(struct snd_info_entry *entry, struct snd_info_buffer *buf)
 {
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	snd_iprintf(buf, "OSS sequencer emulation version %s\n", SNDRV_SEQ_OSS_VERSION_STR);
 	snd_seq_oss_system_info_read(buf);
 	snd_seq_oss_synth_info_read(buf);
 	snd_seq_oss_midi_info_read(buf);
-	mutex_unlock(&register_mutex);
 }
 
 
-- 
2.50.1

