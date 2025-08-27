Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476532254D
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281946; cv=none; b=FLv8MX440AKnHsEOQXFFuwrdVjWpmSfqb5lzfwxetxHoUPdGeFpWm3lUpfu4QMBetCnvNTSjz7qVOaa0k3mQRt397/uh74nFGwgqI9WH9rh1/7wd4D7JjRSzmBBtud6Hpja3A1Af+Hcl8JO8Bx7sD1nga6UbeikB9Q9hk8I0gcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281946; c=relaxed/simple;
	bh=tyQZ5ikiyF9gDt0M1o14EaYXWCh3Zo9AaK0K4ihOe+Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh3svMuRFX3feHEnc9uC8EbXsOKX5qRhwT0c0p1S7gZ43UQGO6qxaZLuOMMag/h356MuK2rw8/ND8ieCk4hbnYLSfM02ncOxXtj3hkMSDPuWizuD9l2BSCZxjcvnbB7Vskx2hr/rTuLz1Sfjcq5a+RSQ6dDga/BuXJkEpdPQ05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eAZRXvXz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L6zdnGay; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eAZRXvXz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L6zdnGay; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eAZRXvXz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6zdnGay";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eAZRXvXz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6zdnGay"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D1A31FEE4;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zW+Mq6pR3YMLC/GzI+h+hQZzf3Uj9leIlom6rURemi0=;
	b=eAZRXvXzW+Csp1iux1hBFVvbco/VAp69XSO2XjRZKnPUPdwxVIeMzukjqmKrkKwnzrHLSX
	u9EM2EG3Kqy9yn0gH3dnOH0NwZD/Xa4MQtaRXdMAw9Qs8jesfnFUHA71mK9cY39E0BB4zC
	sms8cCTJCWo/KViESI3mMts22x/bDvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zW+Mq6pR3YMLC/GzI+h+hQZzf3Uj9leIlom6rURemi0=;
	b=L6zdnGayNf+kHSv9Ysi+8Dha/glvIi86FcLb/dog9qyBfLMbBBF70w7mK7Rur98+WNKWRo
	uphPDrL7GdxPaxCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zW+Mq6pR3YMLC/GzI+h+hQZzf3Uj9leIlom6rURemi0=;
	b=eAZRXvXzW+Csp1iux1hBFVvbco/VAp69XSO2XjRZKnPUPdwxVIeMzukjqmKrkKwnzrHLSX
	u9EM2EG3Kqy9yn0gH3dnOH0NwZD/Xa4MQtaRXdMAw9Qs8jesfnFUHA71mK9cY39E0BB4zC
	sms8cCTJCWo/KViESI3mMts22x/bDvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zW+Mq6pR3YMLC/GzI+h+hQZzf3Uj9leIlom6rURemi0=;
	b=L6zdnGayNf+kHSv9Ysi+8Dha/glvIi86FcLb/dog9qyBfLMbBBF70w7mK7Rur98+WNKWRo
	uphPDrL7GdxPaxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61A7713A6A;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yIi7FkO8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 02/11] ALSA: seq: Clean up spin lock with guard()
Date: Wed, 27 Aug 2025 10:05:08 +0200
Message-ID: <20250827080520.7544-3-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use guard() for spin locks to manage the sequencer client locking.

The code about the refcounting was modified with the new
snd_seq_client_ref() and *_unref() helpers instead of the ugly goto,
too.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 77 +++++++++++++++-------------------
 sound/core/seq/seq_clientmgr.h | 14 ++++++-
 2 files changed, 47 insertions(+), 44 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 7787f4661626..89f99e713a2f 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -108,7 +108,6 @@ static struct snd_seq_client *clientptr(int clientid)
 
 static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 {
-	unsigned long flags;
 	struct snd_seq_client *client;
 
 	if (clientid < 0 || clientid >= SNDRV_SEQ_MAX_CLIENTS) {
@@ -116,15 +115,13 @@ static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 			   clientid);
 		return NULL;
 	}
-	spin_lock_irqsave(&clients_lock, flags);
-	client = clientptr(clientid);
-	if (client)
-		goto __lock;
-	if (clienttablock[clientid]) {
-		spin_unlock_irqrestore(&clients_lock, flags);
-		return NULL;
+	scoped_guard(spinlock_irqsave, &clients_lock) {
+		client = clientptr(clientid);
+		if (client)
+			return snd_seq_client_ref(client);
+		if (clienttablock[clientid])
+			return NULL;
 	}
-	spin_unlock_irqrestore(&clients_lock, flags);
 #ifdef CONFIG_MODULES
 	if (load_module) {
 		static DECLARE_BITMAP(client_requested, SNDRV_SEQ_GLOBAL_CLIENTS);
@@ -153,19 +150,14 @@ static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 				snd_seq_device_load_drivers();
 			}
 		}
-		spin_lock_irqsave(&clients_lock, flags);
-		client = clientptr(clientid);
-		if (client)
-			goto __lock;
-		spin_unlock_irqrestore(&clients_lock, flags);
+		scoped_guard(spinlock_irqsave, &clients_lock) {
+			client = clientptr(clientid);
+			if (client)
+				return snd_seq_client_ref(client);
+		}
 	}
 #endif
 	return NULL;
-
-      __lock:
-	snd_use_lock_use(&client->use_lock);
-	spin_unlock_irqrestore(&clients_lock, flags);
-	return client;
 }
 
 /* get snd_seq_client object for the given id quickly */
@@ -227,25 +219,24 @@ static struct snd_seq_client *seq_create_client1(int client_index, int poolsize)
 	client->ump_endpoint_port = -1;
 
 	/* find free slot in the client table */
-	spin_lock_irq(&clients_lock);
-	if (client_index < 0) {
-		for (c = SNDRV_SEQ_DYNAMIC_CLIENTS_BEGIN;
-		     c < SNDRV_SEQ_MAX_CLIENTS;
-		     c++) {
-			if (clienttab[c] || clienttablock[c])
-				continue;
-			clienttab[client->number = c] = client;
-			spin_unlock_irq(&clients_lock);
-			return client;
-		}
-	} else {
-		if (clienttab[client_index] == NULL && !clienttablock[client_index]) {
-			clienttab[client->number = client_index] = client;
-			spin_unlock_irq(&clients_lock);
-			return client;
+	scoped_guard(spinlock_irq, &clients_lock) {
+		if (client_index < 0) {
+			for (c = SNDRV_SEQ_DYNAMIC_CLIENTS_BEGIN;
+			     c < SNDRV_SEQ_MAX_CLIENTS;
+			     c++) {
+				if (clienttab[c] || clienttablock[c])
+					continue;
+				clienttab[client->number = c] = client;
+				return client;
+			}
+		} else {
+			if (clienttab[client_index] == NULL && !clienttablock[client_index]) {
+				clienttab[client->number = client_index] = client;
+				return client;
+			}
 		}
 	}
-	spin_unlock_irq(&clients_lock);
+
 	snd_seq_pool_delete(&client->pool);
 	kfree(client);
 	return NULL;	/* no free slot found or busy, return failure code */
@@ -256,18 +247,18 @@ static int seq_free_client1(struct snd_seq_client *client)
 {
 	if (!client)
 		return 0;
-	spin_lock_irq(&clients_lock);
-	clienttablock[client->number] = 1;
-	clienttab[client->number] = NULL;
-	spin_unlock_irq(&clients_lock);
+	scoped_guard(spinlock_irq, &clients_lock) {
+		clienttablock[client->number] = 1;
+		clienttab[client->number] = NULL;
+	}
 	snd_seq_delete_all_ports(client);
 	snd_seq_queue_client_leave(client->number);
 	snd_use_lock_sync(&client->use_lock);
 	if (client->pool)
 		snd_seq_pool_delete(&client->pool);
-	spin_lock_irq(&clients_lock);
-	clienttablock[client->number] = 0;
-	spin_unlock_irq(&clients_lock);
+	scoped_guard(spinlock_irq, &clients_lock) {
+		clienttablock[client->number] = 0;
+	}
 	return 0;
 }
 
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index 7d0758e72aa9..b42afb887daf 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -78,8 +78,20 @@ void snd_sequencer_device_done(void);
 /* get locked pointer to client */
 struct snd_seq_client *snd_seq_client_use_ptr(int clientid);
 
+static inline struct snd_seq_client *
+snd_seq_client_ref(struct snd_seq_client *client)
+{
+	snd_use_lock_use(&client->use_lock);
+	return client;
+}
+
 /* unlock pointer to client */
-#define snd_seq_client_unlock(client) snd_use_lock_free(&(client)->use_lock)
+static inline void snd_seq_client_unref(struct snd_seq_client *client)
+{
+	snd_use_lock_free(&client->use_lock);
+}
+
+#define snd_seq_client_unlock(c)	snd_seq_client_unref(c)
 
 /* dispatch event to client(s) */
 int snd_seq_dispatch_event(struct snd_seq_event_cell *cell, int atomic, int hop);
-- 
2.50.1

