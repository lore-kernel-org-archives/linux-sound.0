Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA902DC32C;
	Mon, 10 Aug 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369044; cv=none; b=ldHffdLmA5C3L7rvpblHIW8Rq1AUHuHh0PBBA1GnvFoIA9SzkAZM2wOaLrchl8cgIfFNeUn/9LMvZ0e9Zfq4XjxRsCDm26wVFmq06Q8X2iap7kSSPJQh0IMyB6oqbSAXQXMax2fjXUmCgixITkqE5yugStVRcJfomGbjolRf/FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369044; c=relaxed/simple;
	bh=TZDVHc5j4+oyWvqOscD4LQTMs7IfcqdEtCY8hm+zNPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEgeBmNhtqzQyYbzw/jSXY68U1+nnF3osZl9NyLRSufVbk0t+2AYAfkz5ekgbPtZhgpKBzuWtQA/WSnpfbRUx6eeyuPTYwBntPkVZoa5sy+HTJV3tAu0qij6iso+vIvj+Vsx9ZfoZzJG/pBKdRDXIhNeB84ny2RQCa3oaVq5AkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FHADlORP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cJHf829u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FuWqW9Ee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+XvZukvf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FHADlORP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cJHf829u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FuWqW9Ee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+XvZukvf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2911D3E09;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv77p15HyUuGr7x04M+yNI5E14CsPjoA/vBDic7aPMg=;
	b=FHADlORP4VPqED8npve2L4ZP7LFQj5APejoCLts3dxSR/qiL6/wjIY67PoiWD49iVfxtXz
	RfzYeunWztF7ggsnfLmBw8kzZWml3Zb63xCNia5/ZL93aNlKlgZrkBoLp4BuA3wv3LTMSg
	VVtSNkn0sUQP89qx9QsxN21GqXM3MVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv77p15HyUuGr7x04M+yNI5E14CsPjoA/vBDic7aPMg=;
	b=cJHf829uwdOjG5QbsEfB+sHw9HxFm3RjBp1iPHU0mpRTlGlZ+bh33Rbi1Uu92JQj6B2cO/
	H6SEcjX7Ckz765Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FuWqW9Ee;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+XvZukvf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv77p15HyUuGr7x04M+yNI5E14CsPjoA/vBDic7aPMg=;
	b=FuWqW9EenPYDZamQ6whexq710v3kylf/kSsRRVUvInkqODTiANvn8WOIz248kyCwK6JQVt
	AxmWwfUQY5LbTtZZ8xzozYeVuSf1ogcXP5zVhKlwE5J4rhPa0TDcG9O/DI7ph9og50YYmE
	NXMY9Cs7+62dODDqIFNk52OR5PIiE6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sv77p15HyUuGr7x04M+yNI5E14CsPjoA/vBDic7aPMg=;
	b=+XvZukvfGQ2rSLQ8F2eokIOrFW2XSE/ZkISHS8CcHb2dotC2kDVB9FCWM47uVo27NWaNei
	jG6hjKQvcbIuPsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07B49779BC;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0IimAAnUeWq3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 13:37:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ALSA: seq: Use RCU for the client port list
Date: Mon, 10 Aug 2026 15:37:03 +0200
Message-ID: <20260810133711.42483-3-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 2911D3E09
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Each sequencer client keeps a list of its ports (ports_list_head)
protected by both an rwlock (ports_lock) and a mutex (ports_mutex).
The rwlock is taken read-side on the event delivery hot path:
snd_seq_port_use_ptr() walks the list to resolve a port on every
dispatched event, while the mutex serializes port creation/deletion.

Ports change rarely but delivery happens constantly, so this is the
another read-mostly case as the port subscriber list.  Convert the
port list traversal to RCU and drop the rwlock entirely; the existing
ports_mutex keeps serializing the writers.  The atomic delivery path
(snd_seq_port_use_ptr(), snd_seq_port_query_nearest()) now runs
lock-free under rcu_read_lock() instead of contending on the shared
rwlock.

The writers switch to list_add_tail_rcu()/list_del_rcu().
snd_seq_insert_port() now stores the port number and name before
publishing the node so RCU readers only ever observe a fully
initialized port.  One drawback is that snd_seq_delete_all_ports()
drops the O(1) splice trick and unlinks each port individually,
though: the splice repointed the last port's ->next away from the list
head, which would send a concurrent lockless reader off the end of the
list.

Unlike the subscriber objects, ports are not freed via kfree_rcu():
port_delete() must drain outstanding use_lock references (and run
private_free()) synchronously.  The rwlock previously guaranteed that
no reader could take a new use_lock reference once the port was
unlinked -- list_del under write_lock excluded snd_use_lock_use()
under read_lock.  list_del_rcu() offers no such exclusion, so a reader
still traversing the list can grab a reference after the unlink.
port_delete() therefore calls synchronize_rcu() after the port has
been unlinked and before snd_use_lock_sync(): once the grace period
elapses no new reference can appear, and the existing drain then frees
the port safely.

Dropping write_lock_irq() from the writers is safe: no writer runs in
atomic/IRQ context, and the sole atomic reader now uses RCU, which is
IRQ-safe.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c |  1 -
 sound/core/seq/seq_clientmgr.h |  1 -
 sound/core/seq/seq_ports.c     | 51 +++++++++++++++-------------------
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 77f5020f1873..b7cf14e3ddb3 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -212,7 +212,6 @@ static struct snd_seq_client *seq_create_client1(int client_index, int poolsize)
 	}
 	client->type = NO_CLIENT;
 	snd_use_lock_init(&client->use_lock);
-	rwlock_init(&client->ports_lock);
 	mutex_init(&client->ports_mutex);
 	INIT_LIST_HEAD(&client->ports_list_head);
 	mutex_init(&client->ioctl_mutex);
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index feea8bb7d987..d7ffc5c1ed61 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -49,7 +49,6 @@ struct snd_seq_client {
 	/* ports */
 	int num_ports;		/* number of ports */
 	struct list_head ports_list_head;
-	rwlock_t ports_lock;
 	struct mutex ports_mutex;
 	struct mutex ioctl_mutex;
 	int convert32;		/* convert 32->64bit */
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 357c72ed0d3b..eb67eb0eeb14 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -48,8 +48,8 @@ struct snd_seq_client_port *snd_seq_port_use_ptr(struct snd_seq_client *client,
 
 	if (client == NULL)
 		return NULL;
-	guard(read_lock)(&client->ports_lock);
-	list_for_each_entry(port, &client->ports_list_head, list) {
+	guard(rcu)();
+	list_for_each_entry_rcu(port, &client->ports_list_head, list) {
 		if (port->addr.port == num) {
 			if (port->closing)
 				break; /* deleting now */
@@ -71,8 +71,8 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 
 	num = pinfo->addr.port;
 	found = NULL;
-	guard(read_lock)(&client->ports_lock);
-	list_for_each_entry(port, &client->ports_list_head, list) {
+	guard(rcu)();
+	list_for_each_entry_rcu(port, &client->ports_list_head, list) {
 		if ((port->capability & SNDRV_SEQ_PORT_CAP_INACTIVE) &&
 		    !check_inactive)
 			continue; /* skip inactive ports */
@@ -153,7 +153,6 @@ int snd_seq_insert_port(struct snd_seq_client *client, int port,
 
 	num = max(port, 0);
 	guard(mutex)(&client->ports_mutex);
-	guard(write_lock_irq)(&client->ports_lock);
 	struct list_head *insert_before = &client->ports_list_head;
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->addr.port == port)
@@ -165,12 +164,13 @@ int snd_seq_insert_port(struct snd_seq_client *client, int port,
 		if (port < 0) /* auto-probe mode */
 			num = p->addr.port + 1;
 	}
-	/* insert the new port */
-	list_add_tail(&new_port->list, insert_before);
-	client->num_ports++;
+	/* finish initializing the port before publishing it to RCU readers */
 	new_port->addr.port = num;	/* store the port number in the port */
 	if (!new_port->name[0])
 		sprintf(new_port->name, "port-%d", num);
+	/* insert the new port */
+	list_add_tail_rcu(&new_port->list, insert_before);
+	client->num_ports++;
 
 	return num;
 }
@@ -253,7 +253,13 @@ static int port_delete(struct snd_seq_client *client,
 {
 	/* set closing flag and wait for all port access are gone */
 	port->closing = 1;
-	snd_use_lock_sync(&port->use_lock); 
+	/* the port has already been unlinked from the client's port list;
+	 * wait for a grace period so that RCU readers still traversing the
+	 * list can no longer take a new use_lock reference, then drain the
+	 * outstanding references before freeing
+	 */
+	synchronize_rcu();
+	snd_use_lock_sync(&port->use_lock);
 
 	/* clear subscribers info */
 	clear_subscriber_list(client, port, &port->c_src, true);
@@ -276,11 +282,10 @@ int snd_seq_delete_port(struct snd_seq_client *client, int port)
 	struct snd_seq_client_port *found = NULL, *p;
 
 	scoped_guard(mutex, &client->ports_mutex) {
-		guard(write_lock_irq)(&client->ports_lock);
 		list_for_each_entry(p, &client->ports_list_head, list) {
 			if (p->addr.port == port) {
 				/* ok found.  delete from the list at first */
-				list_del(&p->list);
+				list_del_rcu(&p->list);
 				client->num_ports--;
 				found = p;
 				break;
@@ -296,26 +301,16 @@ int snd_seq_delete_port(struct snd_seq_client *client, int port)
 /* delete the all ports belonging to the given client */
 int snd_seq_delete_all_ports(struct snd_seq_client *client)
 {
-	struct list_head deleted_list;
 	struct snd_seq_client_port *port, *tmp;
-	
-	/* move the port list to deleted_list, and
-	 * clear the port list in the client data.
+
+	/* unlink and delete each port; port_delete() waits for an RCU grace
+	 * period before draining the port, so concurrent lockless readers can
+	 * no longer take a new use_lock reference on it
 	 */
 	guard(mutex)(&client->ports_mutex);
-	scoped_guard(write_lock_irq, &client->ports_lock) {
-		if (!list_empty(&client->ports_list_head)) {
-			list_add(&deleted_list, &client->ports_list_head);
-			list_del_init(&client->ports_list_head);
-		} else {
-			INIT_LIST_HEAD(&deleted_list);
-		}
-		client->num_ports = 0;
-	}
-
-	/* remove each port in deleted_list */
-	list_for_each_entry_safe(port, tmp, &deleted_list, list) {
-		list_del(&port->list);
+	list_for_each_entry_safe(port, tmp, &client->ports_list_head, list) {
+		list_del_rcu(&port->list);
+		client->num_ports--;
 		snd_seq_system_client_ev_port_exit(port->addr.client, port->addr.port);
 		port_delete(client, port);
 	}
-- 
2.55.0

