Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BCE480946
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106354; cv=none; b=NlEHQvWFVWcs1w5FaWbMu6t/JuqZoGwKDieeYePAT/Qj0VcUM2sKmzy7KhykXORv7Ry+0h6ASfQ8Nu17bAf3FWN6TPyKXv0XjTeoVUcLuPSG+v2k9M/rUKxGYCEpIHgtZWsrhW+poo6r3be0KtoDNI4M0mvdH+JcmqMU6O4TeOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106354; c=relaxed/simple;
	bh=35w219Qw40pDK8KxwSukuR1KW0nnfNv1UKLEJclojtY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqT8IiG0Go0HI6t4a/opeBTHseuBQCJr5l1ZmgYWB0iafXQMeTa99wOkMaEKVjtVF5xwbCoJYAqUGKyP86STtKc8A+dCCdAkPxS/1Ul7d13ugkcnlkwzFe5eMZk8wX4LDN2kpjWgelTvOpMZUwbF7WASatQFbuzMN2NJlHXkmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vdz7Ps6w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EII9y1dP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vdz7Ps6w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EII9y1dP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vdz7Ps6w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EII9y1dP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vdz7Ps6w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EII9y1dP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C0D775CBF;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKkNOw1TNYTf+T2RMNMHV7FTIG4NReP4IVT9dZaos5E=;
	b=Vdz7Ps6wE3ZxfU75K60ULYNU7n60QFd+AtbKqxdEZUW27PVhIwqeXqtScLxW1mexD33oFj
	dLzhMzb4wKNUpBCMEcYXsMiKFTV6QqUcYujIU88Mil7kNR/tfA/B2GlDG6VrYyCHeuxu0A
	Uuu5slq0FV4oHTbRMRgTMjw5EVTFCkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKkNOw1TNYTf+T2RMNMHV7FTIG4NReP4IVT9dZaos5E=;
	b=EII9y1dPlHgjCzsnt6sZUP/ETz/jH4yPFn7j7ci1JSDTa8ry3oE6sSGfUJaf5CsWp8oN88
	pfRwIIz+CiofttBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Vdz7Ps6w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EII9y1dP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKkNOw1TNYTf+T2RMNMHV7FTIG4NReP4IVT9dZaos5E=;
	b=Vdz7Ps6wE3ZxfU75K60ULYNU7n60QFd+AtbKqxdEZUW27PVhIwqeXqtScLxW1mexD33oFj
	dLzhMzb4wKNUpBCMEcYXsMiKFTV6QqUcYujIU88Mil7kNR/tfA/B2GlDG6VrYyCHeuxu0A
	Uuu5slq0FV4oHTbRMRgTMjw5EVTFCkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKkNOw1TNYTf+T2RMNMHV7FTIG4NReP4IVT9dZaos5E=;
	b=EII9y1dPlHgjCzsnt6sZUP/ETz/jH4yPFn7j7ci1JSDTa8ry3oE6sSGfUJaf5CsWp8oN88
	pfRwIIz+CiofttBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35027779A7;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KEGzC6aGKWo5MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 15:45:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	linux-kernel@vber.kernel.org
Subject: [PATCH 2/5] ALSA: core: Use the new helper for the power refcount
Date: Wed, 10 Jun 2026 17:45:32 +0200
Message-ID: <20260610154538.51076-3-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610154538.51076-1-tiwai@suse.de>
References: <20260610154538.51076-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5C0D775CBF
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Replace the open code for managing the power refcount in the snd_card
object with the new helper functions.
Only a code cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h | 10 ++++------
 sound/core/init.c    |  3 +--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index a3f10294e834..404785b7d885 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -160,9 +160,8 @@ struct snd_card {
 
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
-	atomic_t power_ref;
 	wait_queue_head_t power_sleep;
-	wait_queue_head_t power_ref_sleep;
+	struct snd_refcount power_ref;
 #endif
 
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
@@ -197,7 +196,7 @@ static inline void snd_power_change_state(struct snd_card *card, unsigned int st
  */
 static inline void snd_power_ref(struct snd_card *card)
 {
-	atomic_inc(&card->power_ref);
+	snd_refcount_get(&card->power_ref);
 }
 
 /**
@@ -206,8 +205,7 @@ static inline void snd_power_ref(struct snd_card *card)
  */
 static inline void snd_power_unref(struct snd_card *card)
 {
-	if (atomic_dec_and_test(&card->power_ref))
-		wake_up(&card->power_ref_sleep);
+	snd_refcount_put(&card->power_ref);
 }
 
 /**
@@ -219,7 +217,7 @@ static inline void snd_power_unref(struct snd_card *card)
  */
 static inline void snd_power_sync_ref(struct snd_card *card)
 {
-	wait_event(card->power_ref_sleep, !atomic_read(&card->power_ref));
+	snd_refcount_sync(&card->power_ref);
 }
 
 /* init.c */
diff --git a/sound/core/init.c b/sound/core/init.c
index 2408160b8ea1..ed5af4e0ec10 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -328,8 +328,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	mutex_init(&card->memory_mutex);
 #ifdef CONFIG_PM
 	init_waitqueue_head(&card->power_sleep);
-	init_waitqueue_head(&card->power_ref_sleep);
-	atomic_set(&card->power_ref, 0);
+	snd_refcount_init(&card->power_ref);
 #endif
 	init_waitqueue_head(&card->remove_sleep);
 	card->sync_irq = -1;
-- 
2.54.0

