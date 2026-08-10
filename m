Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D228033B;
	Mon, 10 Aug 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369045; cv=none; b=tktXWecl21aPzgx0n0V7EpSrdylwn42a9m+ziGn4tvshk2JCiBDKSxUdtAPMQicYbuwUdRa3BdgSPmdOD4vdxhd6Ka6kzPW3m8gmfPEKpky9FEUalxjNQo2pyYoAZ889lII6zfgdAcMu5ob9Gy7UZOjm0v5W6J7PKwoWy0mLJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369045; c=relaxed/simple;
	bh=cjX7TpjnkvqEVzqm96CVJSUc1akOzijhjboTvIkyn9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjISh0rJqQlWC6lF//2sLJv2sh+WVWV+MJkZnQlaCB2WEVlbbs9NFr7xvb4SQGR/5y2517sJ5GoZxuLF3286V0lJOb/na1Er4Wp7wPMcC2lxzKb5F2tSWpTrv982cxul166pQJQtA+Yf3gb4k5nCtthflRazHOeEbp7TIVF7ynA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTp4qA/a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sCkPUOcI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VShSWvOo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4WicXtyF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTp4qA/a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sCkPUOcI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VShSWvOo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4WicXtyF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B6297F8F8;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VpCaDZbXR8VKdP0UIa7LRit4mlFKw5BdaJMULWDr4g=;
	b=oTp4qA/azjdTHzWbLg7QNKOLMYhslmD+zpE2jBYIJVr/JzOleaJVputcdZqdnAqjHMPeQ0
	m86P+6DXV3LbRKqrW3De/7M9X3D6Pn6gViiNZuLP2gVB1llX2EuzW89JO2JPETVBw/n30q
	QJcR9aHpanNMpNZYzebX+PUKFwYCgqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VpCaDZbXR8VKdP0UIa7LRit4mlFKw5BdaJMULWDr4g=;
	b=sCkPUOcIEoKDE/ZDe+fjo+oidzS6h2jzaI8i22+jpmfdSsMhJ7x+WjlAuNFFMUyW467/7Z
	JAaV/AchiPsBTvCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VpCaDZbXR8VKdP0UIa7LRit4mlFKw5BdaJMULWDr4g=;
	b=VShSWvOookm0Lwi1JzvGTyaGpYiCXV3M1FNud7LJCq1zSbBJU1GTDsVvVuI+1fcTpE6XY2
	NNw/82EYsZiVJ+kbde3zFix/q2iEfM4Q53Q4arSt8ZtjQ5y7WDm+M0yzszqOXjCD6+9tfr
	qtyckbUzwJXZRqkX8wp5+cm1usuLdZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VpCaDZbXR8VKdP0UIa7LRit4mlFKw5BdaJMULWDr4g=;
	b=4WicXtyFH+9RkpH8KvvE8mbkanAOpSX4tYpi42R6bg8tLy/XLrENViiT4DeP+KsXiLlNe0
	pXmJ7HuoE3d6f4Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A309779BF;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qCEoCQnUeWq3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 13:37:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ALSA: seq: Use RCU for the client table
Date: Mon, 10 Aug 2026 15:37:04 +0200
Message-ID: <20260810133711.42483-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810133711.42483-1-tiwai@suse.de>
References: <20260810133711.42483-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The sequencer keeps a global table of clients (clienttab[]) indexed by
client id, protected by the global clients_lock spinlock.  The lookup
snd_seq_client_use_ptr() reads a slot and takes a use_lock reference on
the client, and this runs on the event delivery hot path: every
dispatched event resolves its destination (and often source) client
through it.  The spinlock's only job on the read side is to make the
"pointer is non-NULL" test and the reference increment indivisible with
respect to the writer that nulls the slot and then drains the refcount.

Clients come and go rarely but delivery happens constantly, so this is
yet another read-mostly case as the port and subscriber lists.
Convert the table to RCU: the read side now runs lock-free under
rcu_read_lock() and takes the use_lock reference via
rcu_dereference(), removing contention on the single global spinlock
from the delivery path.  The writers keep clients_lock (still needed
to serialize slot allocation) and publish / unpublish via
rcu_assign_pointer(); creation and destruction remain serialized at a
higher level by register_mutex.

As with the ports, the client is not freed via kfree_rcu(): its lifetime
is governed by the use_lock refcount drained in seq_free_client1().
list_del under the old spinlock excluded a concurrent lookup from taking
a new reference once the slot was nulled; rcu_assign_pointer(NULL) offers
no such exclusion, so a reader still holding the old pointer can grab a
reference after the unpublish.  seq_free_client1() therefore calls
synchronize_rcu() after nulling the slot and before snd_use_lock_sync():
once the grace period elapses no new reference can appear, and the
existing drain then frees the client safely.

clienttablock[] keeps its slot-reservation role (create/free are
serialized by register_mutex); its read on the lookup path only gates
module autoload, so a lockless read is harmless.  Dropping the spinlock
from the read path is safe: clients_lock is now taken only by the
process-context writers, and the sole atomic reader uses RCU, which is
IRQ-safe.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 43 ++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index b7cf14e3ddb3..d4cac594bc8f 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -59,7 +59,7 @@ static DEFINE_MUTEX(register_mutex);
  * client table
  */
 static char clienttablock[SNDRV_SEQ_MAX_CLIENTS];
-static struct snd_seq_client *clienttab[SNDRV_SEQ_MAX_CLIENTS];
+static struct snd_seq_client __rcu *clienttab[SNDRV_SEQ_MAX_CLIENTS];
 static struct snd_seq_usage client_usage;
 
 /*
@@ -95,15 +95,23 @@ static inline int snd_seq_write_pool_allocated(struct snd_seq_client *client)
 	return snd_seq_total_cells(client->pool) > 0;
 }
 
-/* return pointer to client structure for specified id */
-static struct snd_seq_client *clientptr(int clientid)
+/* return pointer to client structure for specified id; call under RCU read-lock */
+static struct snd_seq_client *__clientptr(int clientid)
 {
 	if (clientid < 0 || clientid >= SNDRV_SEQ_MAX_CLIENTS) {
 		pr_debug("ALSA: seq: oops. Trying to get pointer to client %d\n",
 			   clientid);
 		return NULL;
 	}
-	return clienttab[clientid];
+	return rcu_dereference_check(clienttab[clientid],
+				    lockdep_is_held(&clients_lock));
+}
+
+/* return pointer to client structure for specified id */
+static struct snd_seq_client *clientptr(int clientid)
+{
+	guard(rcu)();
+	return __clientptr(clientid);
 }
 
 static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
@@ -115,8 +123,8 @@ static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 			   clientid);
 		return NULL;
 	}
-	scoped_guard(spinlock_irqsave, &clients_lock) {
-		client = clientptr(clientid);
+	scoped_guard(rcu) {
+		client = __clientptr(clientid);
 		if (client)
 			return snd_seq_client_ref(client);
 		if (clienttablock[clientid])
@@ -150,8 +158,8 @@ static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 				snd_seq_device_load_drivers();
 			}
 		}
-		scoped_guard(spinlock_irqsave, &clients_lock) {
-			client = clientptr(clientid);
+		scoped_guard(rcu) {
+			client = __clientptr(clientid);
 			if (client)
 				return snd_seq_client_ref(client);
 		}
@@ -223,14 +231,17 @@ static struct snd_seq_client *seq_create_client1(int client_index, int poolsize)
 			for (c = SNDRV_SEQ_DYNAMIC_CLIENTS_BEGIN;
 			     c < SNDRV_SEQ_MAX_CLIENTS;
 			     c++) {
-				if (clienttab[c] || clienttablock[c])
+				if (rcu_access_pointer(clienttab[c]) || clienttablock[c])
 					continue;
-				clienttab[client->number = c] = client;
+				client->number = c;
+				rcu_assign_pointer(clienttab[c], client);
 				return client;
 			}
 		} else {
-			if (clienttab[client_index] == NULL && !clienttablock[client_index]) {
-				clienttab[client->number = client_index] = client;
+			if (rcu_access_pointer(clienttab[client_index]) == NULL &&
+			    !clienttablock[client_index]) {
+				client->number = client_index;
+				rcu_assign_pointer(clienttab[client_index], client);
 				return client;
 			}
 		}
@@ -248,10 +259,16 @@ static int seq_free_client1(struct snd_seq_client *client)
 		return 0;
 	scoped_guard(spinlock_irq, &clients_lock) {
 		clienttablock[client->number] = 1;
-		clienttab[client->number] = NULL;
+		rcu_assign_pointer(clienttab[client->number], NULL);
 	}
 	snd_seq_delete_all_ports(client);
 	snd_seq_queue_client_leave(client->number);
+	/* the client has been unpublished from the table; wait for a grace
+	 * period so that lockless readers (snd_seq_client_use_ptr()) that
+	 * observed the old pointer can no longer take a new use_lock
+	 * reference, then drain the outstanding references before freeing
+	 */
+	synchronize_rcu();
 	snd_use_lock_sync(&client->use_lock);
 	if (client->pool)
 		snd_seq_pool_delete(&client->pool);
-- 
2.55.0

