Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1962B3033DE;
	Mon, 10 Aug 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369044; cv=none; b=tPvMF5L7/BYk4rceyQRIgvwFJH1lqG80b5Ksw6zGMTrsWdl8GB97QHFNnamY82FKaUP2BZug64dHA4Ha5CteL1FUyIxHJ/X9c0T0iYFOE5M96tr985JzVuXOMgVfOp+KaTqA8zajpQStbaxcuFfSGLrHLcUq81nrYyLvLPCU59E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369044; c=relaxed/simple;
	bh=M3h8HxzXdzNoOY9kcoDJ0w2zRo3xtKjRROoBYkJV87Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4dRc1WLtvutoLtiVIfa4Vs14kwBpokba96LjdzpbWdSA7B+Bw9HmU0m/ju3wiJblrt9BWNv2/7KfvRAx5NPwQ51IKYbnxv5Fz+JSHeajjqZkVwgdFo6ryMsi9H0jHkKBFKGGoFjhbPPrx+uVVHiVxDhG6Z+SKhdRlWb4p8Q2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jvObYTQ3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ESropR7T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PT1LTMpc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XgIM55Sv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jvObYTQ3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ESropR7T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PT1LTMpc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XgIM55Sv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0497E3E10;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gc5K4lTRZvylPSjIeNywj88GTWlk2PS2z7nR+anATL4=;
	b=jvObYTQ3ZeLkZ78dbWR+qz9jdI16fSzUqQlTiRBuvf7sk8uI77k7WShJcFLhIVCCQlaJes
	uDYFSKABRQbwS+SKFJqDZngcWb6eUFNbBePcKLU1d9fVydBBLDVAwlv92l4ZL52vuxdbx7
	3tcgn5PXJYrMGT7uJhdtrjf/WyO+rAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gc5K4lTRZvylPSjIeNywj88GTWlk2PS2z7nR+anATL4=;
	b=ESropR7TelEBzNWyByYyHsN+NuJsa3yHZ3mcI5UQdjbZNj7mU3rtOIm903dQa/JpihHT5e
	ZRcAcchOBHG4KkDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PT1LTMpc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XgIM55Sv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gc5K4lTRZvylPSjIeNywj88GTWlk2PS2z7nR+anATL4=;
	b=PT1LTMpcWS51JLEbaRVtThLQw0qdVwizfT2Taa7Ms+35DlMuv3Kck/Q7TOigNUNO9NxWRz
	X9cp/IAniJHSsPADPKDw8btTReS5WqynWw/aKRJs9bjTXi59tDMPmPyoIweUYji56r79IY
	S/gZWClTsRaAzbOyh+1Zeb3kcjSv5iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gc5K4lTRZvylPSjIeNywj88GTWlk2PS2z7nR+anATL4=;
	b=XgIM55SvN9OAm3C4MljXr/PzQtFibg5PRBN+Jk26c4W+bMSV2X02zAur6v6QdjOP9LLdlq
	g1lrrLu5I3X0E+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7443779B6;
	Mon, 10 Aug 2026 13:37:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4ARMMwjUeWq3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 13:37:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] ALSA: seq: Use RCU for the port subscriber list
Date: Mon, 10 Aug 2026 15:37:02 +0200
Message-ID: <20260810133711.42483-2-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0497E3E10
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
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Each sequencer port keeps two subscriber groups (c_src and c_dest),
each protected by both an rwlock (list_lock) and a rw_semaphore
(list_mutex).  The rwlock is taken read-side in the event delivery hot
path (__deliver_to_subscribers()) for delivering every event to
subscribers, while the mutex serializes subscribe/unsubscribe and
covers the sleepable delivery and query walks.

Subscriptions change rarely but delivery happens constantly, so this is
a textbook read-mostly case.  Convert the subscriber list traversal to
RCU and drop the rwlock entirely while keeping the existing list_mutex
for serializing the writers.  The atomic delivery path now runs
lock-free under rcu_read_lock() instead of contending on the shared
rwlock.

Along with the conversion to RCU, the subscriber lists are switched
from list_head to hlist so that removal can use hlist_del_init_rcu():
it keeps the ->next pointer intact for concurrent readers while
clearing ->pprev, which lets the double-deletion guard (added in
commit 13d5e5d4725c) keep detecting an already-removed entry via
hlist_unhashed().

Dropping write_lock_irq() from the writers is safe: no writer runs in
atomic/IRQ context, and the sole atomic reader now uses RCU, which is
IRQ-safe.  Port lifetime handling (use_lock/closing drain in
port_delete()) is orthogonal and unchanged.

Note that the conversion to RCU has another merit: it automatically
"fixes" the (rather false) lockdep warnings for the doubly read-locks
of the same subscriber list, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 25 ++++++++--------
 sound/core/seq/seq_ports.c     | 52 ++++++++++++++++------------------
 sound/core/seq/seq_ports.h     |  8 +++---
 3 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 23ec239640c3..77f5020f1873 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -717,10 +717,11 @@ static int __deliver_to_subscribers(struct snd_seq_client *client,
 	
 	/* lock list */
 	if (atomic)
-		read_lock(&grp->list_lock);
+		rcu_read_lock();
 	else
 		down_read_nested(&grp->list_mutex, hop);
-	list_for_each_entry(subs, &grp->list_head, src_list) {
+	hlist_for_each_entry_rcu(subs, &grp->list_head, src_list,
+				 lockdep_is_held(&grp->list_mutex)) {
 		/* both ports ready? */
 		if (atomic_read(&subs->ref_count) != 2)
 			continue;
@@ -741,7 +742,7 @@ static int __deliver_to_subscribers(struct snd_seq_client *client,
 		memcpy(event, &event_saved, saved_size);
 	}
 	if (atomic)
-		read_unlock(&grp->list_lock);
+		rcu_read_unlock();
 	else
 		up_read(&grp->list_mutex);
 	memcpy(event, &event_saved, saved_size);
@@ -1938,7 +1939,7 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_query_subs *subs = arg;
 	struct snd_seq_port_subs_info *group;
-	struct list_head *p;
+	struct hlist_node *p;
 	int i;
 
 	struct snd_seq_client *cptr __free(snd_seq_client) =
@@ -1965,15 +1966,15 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 	/* search for the subscriber */
 	subs->num_subs = group->count;
 	i = 0;
-	list_for_each(p, &group->list_head) {
+	hlist_for_each(p, &group->list_head) {
 		if (i++ == subs->index) {
 			/* found! */
 			struct snd_seq_subscribers *s;
 			if (subs->type == SNDRV_SEQ_QUERY_SUBS_READ) {
-				s = list_entry(p, struct snd_seq_subscribers, src_list);
+				s = hlist_entry(p, struct snd_seq_subscribers, src_list);
 				subs->addr = s->info.dest;
 			} else {
-				s = list_entry(p, struct snd_seq_subscribers, dest_list);
+				s = hlist_entry(p, struct snd_seq_subscribers, dest_list);
 				subs->addr = s->info.sender;
 			}
 			subs->flags = s->info.flags;
@@ -2529,19 +2530,19 @@ static void snd_seq_info_dump_subscribers(struct snd_info_buffer *buffer,
 					  struct snd_seq_port_subs_info *group,
 					  int is_src, char *msg)
 {
-	struct list_head *p;
+	struct hlist_node *p;
 	struct snd_seq_subscribers *s;
 	int count = 0;
 
 	guard(rwsem_read)(&group->list_mutex);
-	if (list_empty(&group->list_head))
+	if (hlist_empty(&group->list_head))
 		return;
 	snd_iprintf(buffer, msg);
-	list_for_each(p, &group->list_head) {
+	hlist_for_each(p, &group->list_head) {
 		if (is_src)
-			s = list_entry(p, struct snd_seq_subscribers, src_list);
+			s = hlist_entry(p, struct snd_seq_subscribers, src_list);
 		else
-			s = list_entry(p, struct snd_seq_subscribers, dest_list);
+			s = hlist_entry(p, struct snd_seq_subscribers, dest_list);
 		if (count++)
 			snd_iprintf(buffer, ", ");
 		snd_iprintf(buffer, "%d:%d",
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 6612e92d801f..357c72ed0d3b 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -98,10 +98,9 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 /* initialize snd_seq_port_subs_info */
 static void port_subs_info_init(struct snd_seq_port_subs_info *grp)
 {
-	INIT_LIST_HEAD(&grp->list_head);
+	INIT_HLIST_HEAD(&grp->list_head);
 	grp->count = 0;
 	grp->exclusive = 0;
-	rwlock_init(&grp->list_lock);
 	init_rwsem(&grp->list_mutex);
 	grp->open = NULL;
 	grp->close = NULL;
@@ -202,12 +201,12 @@ static void delete_and_unsubscribe_port(struct snd_seq_client *client,
 					bool is_src, bool ack);
 
 static inline struct snd_seq_subscribers *
-get_subscriber(struct list_head *p, bool is_src)
+get_subscriber(struct hlist_node *p, bool is_src)
 {
 	if (is_src)
-		return list_entry(p, struct snd_seq_subscribers, src_list);
+		return hlist_entry(p, struct snd_seq_subscribers, src_list);
 	else
-		return list_entry(p, struct snd_seq_subscribers, dest_list);
+		return hlist_entry(p, struct snd_seq_subscribers, dest_list);
 }
 
 /*
@@ -219,9 +218,9 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 				  struct snd_seq_port_subs_info *grp,
 				  int is_src)
 {
-	struct list_head *p, *n;
+	struct hlist_node *p, *n;
 
-	list_for_each_safe(p, n, &grp->list_head) {
+	hlist_for_each_safe(p, n, &grp->list_head) {
 		struct snd_seq_subscribers *subs;
 
 		subs = get_subscriber(p, is_src);
@@ -238,13 +237,13 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 			 * remove the subscriber info
 			 */
 			if (atomic_dec_and_test(&subs->ref_count))
-				kfree(subs);
+				kfree_rcu(subs, rcu);
 			continue;
 		}
 
 		/* ok we got the connected port */
 		delete_and_unsubscribe_port(c, aport, subs, !is_src, true);
-		kfree(subs);
+		kfree_rcu(subs, rcu);
 	}
 }
 
@@ -499,20 +498,20 @@ static int check_and_subscribe_port(struct snd_seq_client *client,
 				    bool is_src, bool exclusive, bool ack)
 {
 	struct snd_seq_port_subs_info *grp;
-	struct list_head *p;
+	struct hlist_node *p;
 	struct snd_seq_subscribers *s;
 	int err;
 
 	grp = is_src ? &port->c_src : &port->c_dest;
 	guard(rwsem_write)(&grp->list_mutex);
 	if (exclusive) {
-		if (!list_empty(&grp->list_head))
+		if (!hlist_empty(&grp->list_head))
 			return -EBUSY;
 	} else {
 		if (grp->exclusive)
 			return -EBUSY;
 		/* check whether already exists */
-		list_for_each(p, &grp->list_head) {
+		hlist_for_each(p, &grp->list_head) {
 			s = get_subscriber(p, is_src);
 			if (match_subs_info(&subs->info, &s->info))
 				return -EBUSY;
@@ -526,11 +525,10 @@ static int check_and_subscribe_port(struct snd_seq_client *client,
 	}
 
 	/* add to list */
-	guard(write_lock_irq)(&grp->list_lock);
 	if (is_src)
-		list_add_tail(&subs->src_list, &grp->list_head);
+		hlist_add_tail_rcu(&subs->src_list, &grp->list_head);
 	else
-		list_add_tail(&subs->dest_list, &grp->list_head);
+		hlist_add_tail_rcu(&subs->dest_list, &grp->list_head);
 	grp->exclusive = exclusive;
 	atomic_inc(&subs->ref_count);
 
@@ -544,17 +542,15 @@ static void __delete_and_unsubscribe_port(struct snd_seq_client *client,
 					  bool is_src, bool ack)
 {
 	struct snd_seq_port_subs_info *grp;
-	struct list_head *list;
+	struct hlist_node *list;
 	bool empty;
 
 	grp = is_src ? &port->c_src : &port->c_dest;
 	list = is_src ? &subs->src_list : &subs->dest_list;
-	scoped_guard(write_lock_irq, &grp->list_lock) {
-		empty = list_empty(list);
-		if (!empty)
-			list_del_init(list);
-		grp->exclusive = 0;
-	}
+	empty = hlist_unhashed(list);
+	if (!empty)
+		hlist_del_init_rcu(list);
+	grp->exclusive = 0;
 
 	if (!empty)
 		unsubscribe_port(client, port, grp, &subs->info, ack);
@@ -590,8 +586,8 @@ int snd_seq_port_connect(struct snd_seq_client *connector,
 
 	subs->info = *info;
 	atomic_set(&subs->ref_count, 0);
-	INIT_LIST_HEAD(&subs->src_list);
-	INIT_LIST_HEAD(&subs->dest_list);
+	INIT_HLIST_NODE(&subs->src_list);
+	INIT_HLIST_NODE(&subs->dest_list);
 
 	exclusive = !!(info->flags & SNDRV_SEQ_PORT_SUBS_EXCLUSIVE);
 
@@ -612,7 +608,7 @@ int snd_seq_port_connect(struct snd_seq_client *connector,
 	delete_and_unsubscribe_port(src_client, src_port, subs, true,
 				    connector->number != src_client->number);
  error:
-	kfree(subs);
+	kfree_rcu(subs, rcu);
 	return err;
 }
 
@@ -633,7 +629,7 @@ int snd_seq_port_disconnect(struct snd_seq_client *connector,
 	 */
 	scoped_guard(rwsem_write, &dest->list_mutex) {
 		/* look for the connection */
-		list_for_each_entry(subs, &dest->list_head, dest_list) {
+		hlist_for_each_entry(subs, &dest->list_head, dest_list) {
 			if (match_subs_info(info, &subs->info)) {
 				__delete_and_unsubscribe_port(dest_client, dest_port,
 							      subs, false,
@@ -648,7 +644,7 @@ int snd_seq_port_disconnect(struct snd_seq_client *connector,
 
 	delete_and_unsubscribe_port(src_client, src_port, subs, true,
 				    connector->number != src_client->number);
-	kfree(subs);
+	kfree_rcu(subs, rcu);
 	return 0;
 }
 
@@ -662,7 +658,7 @@ int snd_seq_port_get_subscription(struct snd_seq_port_subs_info *src_grp,
 	int err = -ENOENT;
 
 	guard(rwsem_read)(&src_grp->list_mutex);
-	list_for_each_entry(s, &src_grp->list_head, src_list) {
+	hlist_for_each_entry(s, &src_grp->list_head, src_list) {
 		if (addr_match(dest_addr, &s->info.dest)) {
 			*subs = s->info;
 			err = 0;
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index b689c0f4867c..12ad86bf1489 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -28,17 +28,17 @@
 
 struct snd_seq_subscribers {
 	struct snd_seq_port_subscribe info;	/* additional info */
-	struct list_head src_list;	/* link of sources */
-	struct list_head dest_list;	/* link of destinations */
+	struct hlist_node src_list;	/* link of sources */
+	struct hlist_node dest_list;	/* link of destinations */
 	atomic_t ref_count;
+	struct rcu_head rcu;		/* for deferred free */
 };
 
 struct snd_seq_port_subs_info {
-	struct list_head list_head;	/* list of subscribed ports */
+	struct hlist_head list_head;	/* list of subscribed ports */
 	unsigned int count;		/* count of subscribers */
 	unsigned int exclusive: 1;	/* exclusive mode */
 	struct rw_semaphore list_mutex;
-	rwlock_t list_lock;
 	int (*open)(void *private_data, struct snd_seq_port_subscribe *info);
 	int (*close)(void *private_data, struct snd_seq_port_subscribe *info);
 };
-- 
2.55.0

