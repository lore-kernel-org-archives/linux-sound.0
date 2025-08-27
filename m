Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D0322745
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281939; cv=none; b=oGvqOQFSeSw+A8JX3HFaYBJMNXCAlnLS1lVRhhuymqrybG7atdNBGqaFw6FQj4rxXUGtShRQy9r1g2ZMtyPD/o+u9qyKFKMbgbcTEAQzxxBnJYBTWg8VzIEibXRes7Jjmb2gMUfFjbfEsB8GPi8I/l0U8ZAnt5gU6fs1uEqSjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281939; c=relaxed/simple;
	bh=MgkFc1uIfNwwtA9JtfKngmn0hfLbI9fkLYH0P/+OTi8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBmg6ae43cji+O1QalNdQj2HrJX/2VeBFbJ2/J1Z98C4s83DtJGwH4w8wTx+uzwiY0rVkJNk9dOcGPOP15upij8fr8Di12muEqG6/qt84Q3VmpyWdcHea8OaRnQcshZNVSJe5fTuq8BRj9mudyG2piaGlXP8CkOdha/EL08YWAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=unEk7nRE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7/hlZ1iw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=unEk7nRE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7/hlZ1iw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="unEk7nRE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7/hlZ1iw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="unEk7nRE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7/hlZ1iw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 634E11FEE3;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnZW8QCkHscRznSHSU/ML9lz0BLJiUM6+85BtqDHogE=;
	b=unEk7nRE8ldjWVeqFIbkm43Pa7jgqK/5nXbrEo9N7uAavSEqIRoHvkQioQFotRT+eDTa+C
	G5th41v+GtnSDwHLTs8IO4oYWgjicJkIXjj7lQk3U7mVRYwuwTjsRKvCMWra/EjAKxg2MC
	ESaOaAOd1ZOBywSTeWIWCjHgIp+yAbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnZW8QCkHscRznSHSU/ML9lz0BLJiUM6+85BtqDHogE=;
	b=7/hlZ1iw2PVD02QCjVAPe3NYr9ZQSMF1KsMaF04uW5qMM4egIUr4CItJkSxOU7mdV5+f//
	FBNv0Tud3/KtmMDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnZW8QCkHscRznSHSU/ML9lz0BLJiUM6+85BtqDHogE=;
	b=unEk7nRE8ldjWVeqFIbkm43Pa7jgqK/5nXbrEo9N7uAavSEqIRoHvkQioQFotRT+eDTa+C
	G5th41v+GtnSDwHLTs8IO4oYWgjicJkIXjj7lQk3U7mVRYwuwTjsRKvCMWra/EjAKxg2MC
	ESaOaAOd1ZOBywSTeWIWCjHgIp+yAbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnZW8QCkHscRznSHSU/ML9lz0BLJiUM6+85BtqDHogE=;
	b=7/hlZ1iw2PVD02QCjVAPe3NYr9ZQSMF1KsMaF04uW5qMM4egIUr4CItJkSxOU7mdV5+f//
	FBNv0Tud3/KtmMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44D1613A31;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gMyyD0O8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 01/11] ALSA: seq: Simplify internal command operation from OSS layer
Date: Wed, 27 Aug 2025 10:05:07 +0200
Message-ID: <20250827080520.7544-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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

snd_seq_client_ioctl_lock() and *_unlock() are used only from a single
function of the OSS layer, and it's just to wrap the call of
snd_seq_kernel_client_ctl().

Provide another variant of snd_seq_kernel_client_ctl() that takes the
locks internally and drop the ugly snd_seq_client_ioctl_lock() and
*_unlock() implementations, instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_device.h |  7 +--
 sound/core/seq/seq_clientmgr.c      | 77 +++++++++++++----------------
 sound/core/seq/seq_clientmgr.h      |  3 +-
 3 files changed, 35 insertions(+), 52 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
index 6163a00bc8de..935cf3df0b30 100644
--- a/sound/core/seq/oss/seq_oss_device.h
+++ b/sound/core/seq/oss/seq_oss_device.h
@@ -137,12 +137,7 @@ snd_seq_oss_dispatch(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, int a
 static inline int
 snd_seq_oss_control(struct seq_oss_devinfo *dp, unsigned int type, void *arg)
 {
-	int err;
-
-	snd_seq_client_ioctl_lock(dp->cseq);
-	err = snd_seq_kernel_client_ctl(dp->cseq, type, arg);
-	snd_seq_client_ioctl_unlock(dp->cseq);
-	return err;
+	return snd_seq_kernel_client_ioctl(dp->cseq, type, arg);
 }
 
 /* fill the addresses in header */
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index aa9c956d2581..7787f4661626 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -182,41 +182,6 @@ static struct snd_seq_client *client_load_and_use_ptr(int clientid)
 	return client_use_ptr(clientid, IS_ENABLED(CONFIG_MODULES));
 }
 
-/* Take refcount and perform ioctl_mutex lock on the given client;
- * used only for OSS sequencer
- * Unlock via snd_seq_client_ioctl_unlock() below
- */
-bool snd_seq_client_ioctl_lock(int clientid)
-{
-	struct snd_seq_client *client;
-
-	client = client_load_and_use_ptr(clientid);
-	if (!client)
-		return false;
-	mutex_lock(&client->ioctl_mutex);
-	/* The client isn't unrefed here; see snd_seq_client_ioctl_unlock() */
-	return true;
-}
-EXPORT_SYMBOL_GPL(snd_seq_client_ioctl_lock);
-
-/* Unlock and unref the given client; for OSS sequencer use only */
-void snd_seq_client_ioctl_unlock(int clientid)
-{
-	struct snd_seq_client *client;
-
-	client = snd_seq_client_use_ptr(clientid);
-	if (WARN_ON(!client))
-		return;
-	mutex_unlock(&client->ioctl_mutex);
-	/* The doubly unrefs below are intentional; the first one releases the
-	 * leftover from snd_seq_client_ioctl_lock() above, and the second one
-	 * is for releasing snd_seq_client_use_ptr() in this function
-	 */
-	snd_seq_client_unlock(client);
-	snd_seq_client_unlock(client);
-}
-EXPORT_SYMBOL_GPL(snd_seq_client_ioctl_unlock);
-
 static void usage_alloc(struct snd_seq_usage *res, int num)
 {
 	res->cur += num;
@@ -2558,6 +2523,21 @@ int snd_seq_kernel_client_dispatch(int client, struct snd_seq_event * ev,
 }
 EXPORT_SYMBOL(snd_seq_kernel_client_dispatch);
 
+static int call_seq_client_ctl(struct snd_seq_client *client,
+			       unsigned int cmd, void *arg)
+{
+	const struct ioctl_handler *handler;
+
+	for (handler = ioctl_handlers; handler->cmd > 0; ++handler) {
+		if (handler->cmd == cmd)
+			return handler->func(client, arg);
+	}
+
+	pr_debug("ALSA: seq unknown ioctl() 0x%x (type='%c', number=0x%02x)\n",
+		 cmd, _IOC_TYPE(cmd), _IOC_NR(cmd));
+	return -ENOTTY;
+}
+
 /**
  * snd_seq_kernel_client_ctl - operate a command for a client with data in
  *			       kernel space.
@@ -2572,24 +2552,33 @@ EXPORT_SYMBOL(snd_seq_kernel_client_dispatch);
  */
 int snd_seq_kernel_client_ctl(int clientid, unsigned int cmd, void *arg)
 {
-	const struct ioctl_handler *handler;
 	struct snd_seq_client *client;
 
 	client = clientptr(clientid);
 	if (client == NULL)
 		return -ENXIO;
 
-	for (handler = ioctl_handlers; handler->cmd > 0; ++handler) {
-		if (handler->cmd == cmd)
-			return handler->func(client, arg);
-	}
-
-	pr_debug("ALSA: seq unknown ioctl() 0x%x (type='%c', number=0x%02x)\n",
-		 cmd, _IOC_TYPE(cmd), _IOC_NR(cmd));
-	return -ENOTTY;
+	return call_seq_client_ctl(client, cmd, arg);
 }
 EXPORT_SYMBOL(snd_seq_kernel_client_ctl);
 
+/* a similar like above but taking locks; used only from OSS sequencer layer */
+int snd_seq_kernel_client_ioctl(int clientid, unsigned int cmd, void *arg)
+{
+	struct snd_seq_client *client;
+	int ret;
+
+	client = client_load_and_use_ptr(clientid);
+	if (!client)
+		return -ENXIO;
+	mutex_lock(&client->ioctl_mutex);
+	ret = call_seq_client_ctl(client, cmd, arg);
+	mutex_unlock(&client->ioctl_mutex);
+	snd_seq_client_unlock(client);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_seq_kernel_client_ioctl);
+
 /* exported (for OSS emulator) */
 int snd_seq_kernel_client_write_poll(int clientid, struct file *file, poll_table *wait)
 {
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index 915b1017286e..7d0758e72aa9 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -94,8 +94,7 @@ int __snd_seq_deliver_single_event(struct snd_seq_client *dest,
 				   int atomic, int hop);
 
 /* only for OSS sequencer */
-bool snd_seq_client_ioctl_lock(int clientid);
-void snd_seq_client_ioctl_unlock(int clientid);
+int snd_seq_kernel_client_ioctl(int clientid, unsigned int cmd, void *arg);
 
 extern int seq_client_load[15];
 
-- 
2.50.1

