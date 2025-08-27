Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE7259CB3
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281933; cv=none; b=IJDaNLuOst4rJggxjtSDkyEiFhuFag+awvRaP/ZSNn0ag149xJNpBQAwBmy4s70dWScKt5ml1I2tZx+18AkauVi9XxpuLgUCqF0st3tirZ91t1QB/MU5tCBxeRfIHoDaPJrDJ//0I9PYF1KPmHwb3AgWbGFmBIdxxaJ6V75MY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281933; c=relaxed/simple;
	bh=+rPGxEAbSRKYbVTiHcSkUKiW9V420v+czIO8m4yBOfk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBXut5HQGfIuVrupPz6uI9IiHGWuJyLSEUSgPJAFx1p5OgsspFrtJ5SJIVsyGCwHOGPoux2gy0mLg6IRXoWdK8tz5ICQkdp/ZLk/MooQEMTTH/ePOR2JYVLnoIaDNj6U17gw30q9OoQPMHQBdjkIsys7awlVFANOMcgGNe6Urvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CDUP1htx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lWscLQVL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CDUP1htx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lWscLQVL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CDUP1htx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lWscLQVL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CDUP1htx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lWscLQVL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B463F21E22;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrjB4MpH8q8Y02ewmpEJmdR1DZ2FrIrq1lYKiAy3o4M=;
	b=CDUP1htxe2i/j5mqWwM+mi8KpIq+rmU2vB0KnDTl6IR9DGTuxnc3bzbRKptNkXKYIjAg4N
	X+/8ov9eoxkYK6kN9P0nL03b8tXvDWz5kzK6Ca7C5EQyrqo8EBnZ91+01lYx7IdjiNB+El
	5AXyos9UPQvfapjVwMMmdj1H4G5Akks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrjB4MpH8q8Y02ewmpEJmdR1DZ2FrIrq1lYKiAy3o4M=;
	b=lWscLQVLvv1lEoq46/x6Th5s+zI/zLaimHVvRQT/J4OChlSTIfgqZ419EYOP0X/orhIFDb
	ZhVSSc4kAO8ZEuAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CDUP1htx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lWscLQVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrjB4MpH8q8Y02ewmpEJmdR1DZ2FrIrq1lYKiAy3o4M=;
	b=CDUP1htxe2i/j5mqWwM+mi8KpIq+rmU2vB0KnDTl6IR9DGTuxnc3bzbRKptNkXKYIjAg4N
	X+/8ov9eoxkYK6kN9P0nL03b8tXvDWz5kzK6Ca7C5EQyrqo8EBnZ91+01lYx7IdjiNB+El
	5AXyos9UPQvfapjVwMMmdj1H4G5Akks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrjB4MpH8q8Y02ewmpEJmdR1DZ2FrIrq1lYKiAy3o4M=;
	b=lWscLQVLvv1lEoq46/x6Th5s+zI/zLaimHVvRQT/J4OChlSTIfgqZ419EYOP0X/orhIFDb
	ZhVSSc4kAO8ZEuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CC9813A31;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8CsjJUO8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 04/11] ALSA: seq: Use auto-cleanup for client refcounting
Date: Wed, 27 Aug 2025 10:05:10 +0200
Message-ID: <20250827080520.7544-5-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B463F21E22
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

The current code manages the refcount of client in a way like:

	snd_seq_client *client;
	client = clientptr(id);
	....
	snd_seq_client_unlock(client);

Now we introduce an auto-cleanup macro to manage the unlock
implicitly, namely, the above will be replaced like:

	snd_seq_client *client __free(snd_seq_client) = NULL;
	client = clientptr(id);

and we can forget the unref call.

A part of the code in snd_seq_deliver_single_event() is factored out
to a function, so that the auto-cleanups can be applied cleanly.

This also allows us to replace some left mutex lock/unlock with
guard(), and also reduce scoped_guard() to the normal guard(), too.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 214 +++++++++++++--------------------
 sound/core/seq/seq_clientmgr.h |   2 +-
 sound/core/seq/seq_ports.c     |  16 +--
 3 files changed, 86 insertions(+), 146 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 5a67c4b2b644..5b14d70ba87a 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -495,24 +495,21 @@ static int check_port_perm(struct snd_seq_client_port *port, unsigned int flags)
  */
 static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event)
 {
-	struct snd_seq_client *dest;
+	struct snd_seq_client *dest __free(snd_seq_client) = NULL;
 
 	dest = snd_seq_client_use_ptr(event->dest.client);
 	if (dest == NULL)
 		return NULL;
 	if (! dest->accept_input)
-		goto __not_avail;
+		return NULL;
 	if (snd_seq_ev_is_ump(event))
-		return dest; /* ok - no filter checks */
+		return no_free_ptr(dest); /* ok - no filter checks */
 
 	if ((dest->filter & SNDRV_SEQ_FILTER_USE_EVENT) &&
 	    ! test_bit(event->type, dest->event_filter))
-		goto __not_avail;
+		return NULL;
 
-	return dest; /* ok - accessible */
-__not_avail:
-	snd_seq_client_unlock(dest);
-	return NULL;
+	return no_free_ptr(dest); /* ok - accessible */
 }
 
 
@@ -609,23 +606,14 @@ int __snd_seq_deliver_single_event(struct snd_seq_client *dest,
 	return 0;
 }
 
-/*
- * deliver an event to the specified destination.
- * if filter is non-zero, client filter bitmap is tested.
- *
- *  RETURN VALUE: 0 : if succeeded
- *		 <0 : error
- */
-static int snd_seq_deliver_single_event(struct snd_seq_client *client,
-					struct snd_seq_event *event,
-					int atomic, int hop)
+/* deliver a single event; called from snd_seq_deliver_single_event() */
+static int _snd_seq_deliver_single_event(struct snd_seq_client *client,
+					 struct snd_seq_event *event,
+					 int atomic, int hop)
 {
-	struct snd_seq_client *dest = NULL;
+	struct snd_seq_client *dest __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *dest_port = NULL;
 	int result = -ENOENT;
-	int direct;
-
-	direct = snd_seq_ev_is_direct(event);
 
 	dest = get_event_dest_client(event);
 	if (dest == NULL)
@@ -639,7 +627,7 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 		result = -EPERM;
 		goto __skip;
 	}
-		
+
 	if (dest_port->timestamping)
 		update_timestamp_of_queue(event, dest_port->time_queue,
 					  dest_port->time_real);
@@ -670,12 +658,24 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
   __skip:
 	if (dest_port)
 		snd_seq_port_unlock(dest_port);
-	if (dest)
-		snd_seq_client_unlock(dest);
+	return result;
+}
 
-	if (result < 0 && !direct) {
-		result = bounce_error_event(client, event, result, atomic, hop);
-	}
+/*
+ * deliver an event to the specified destination.
+ * if filter is non-zero, client filter bitmap is tested.
+ *
+ *  RETURN VALUE: 0 : if succeeded
+ *		 <0 : error
+ */
+static int snd_seq_deliver_single_event(struct snd_seq_client *client,
+					struct snd_seq_event *event,
+					int atomic, int hop)
+{
+	int result = _snd_seq_deliver_single_event(client, event, atomic, hop);
+
+	if (result < 0 && !snd_seq_ev_is_direct(event))
+		return bounce_error_event(client, event, result, atomic, hop);
 	return result;
 }
 
@@ -817,7 +817,7 @@ static int snd_seq_deliver_event(struct snd_seq_client *client, struct snd_seq_e
  */
 int snd_seq_dispatch_event(struct snd_seq_event_cell *cell, int atomic, int hop)
 {
-	struct snd_seq_client *client;
+	struct snd_seq_client *client __free(snd_seq_client) = NULL;
 	int result;
 
 	if (snd_BUG_ON(!cell))
@@ -879,7 +879,6 @@ int snd_seq_dispatch_event(struct snd_seq_event_cell *cell, int atomic, int hop)
 		snd_seq_cell_free(cell);
 	}
 
-	snd_seq_client_unlock(client);
 	return result;
 }
 
@@ -1171,8 +1170,7 @@ static int snd_seq_ioctl_system_info(struct snd_seq_client *client, void *arg)
 static int snd_seq_ioctl_running_mode(struct snd_seq_client *client, void  *arg)
 {
 	struct snd_seq_running_info *info = arg;
-	struct snd_seq_client *cptr;
-	int err = 0;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 
 	/* requested client number */
 	cptr = client_load_and_use_ptr(info->client);
@@ -1180,25 +1178,16 @@ static int snd_seq_ioctl_running_mode(struct snd_seq_client *client, void  *arg)
 		return -ENOENT;		/* don't change !!! */
 
 #ifdef SNDRV_BIG_ENDIAN
-	if (!info->big_endian) {
-		err = -EINVAL;
-		goto __err;
-	}
+	if (!info->big_endian)
+		return -EINVAL;
 #else
-	if (info->big_endian) {
-		err = -EINVAL;
-		goto __err;
-	}
-
+	if (info->big_endian)
+		return -EINVAL;
 #endif
-	if (info->cpu_mode > sizeof(long)) {
-		err = -EINVAL;
-		goto __err;
-	}
+	if (info->cpu_mode > sizeof(long))
+		return -EINVAL;
 	cptr->convert32 = (info->cpu_mode < sizeof(long));
- __err:
-	snd_seq_client_unlock(cptr);
-	return err;
+	return 0;
 }
 
 /* CLIENT_INFO ioctl() */
@@ -1234,7 +1223,7 @@ static int snd_seq_ioctl_get_client_info(struct snd_seq_client *client,
 					 void *arg)
 {
 	struct snd_seq_client_info *client_info = arg;
-	struct snd_seq_client *cptr;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 
 	/* requested client number */
 	cptr = client_load_and_use_ptr(client_info->client);
@@ -1242,8 +1231,6 @@ static int snd_seq_ioctl_get_client_info(struct snd_seq_client *client,
 		return -ENOENT;		/* don't change !!! */
 
 	get_client_info(cptr, client_info);
-	snd_seq_client_unlock(cptr);
-
 	return 0;
 }
 
@@ -1373,7 +1360,7 @@ static int snd_seq_ioctl_delete_port(struct snd_seq_client *client, void *arg)
 static int snd_seq_ioctl_get_port_info(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_port_info *info = arg;
-	struct snd_seq_client *cptr;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *port;
 
 	cptr = client_load_and_use_ptr(info->addr.client);
@@ -1381,16 +1368,12 @@ static int snd_seq_ioctl_get_port_info(struct snd_seq_client *client, void *arg)
 		return -ENXIO;
 
 	port = snd_seq_port_use_ptr(cptr, info->addr.port);
-	if (port == NULL) {
-		snd_seq_client_unlock(cptr);
+	if (port == NULL)
 		return -ENOENT;			/* don't change */
-	}
 
 	/* get port info */
 	snd_seq_get_port_info(port, info);
 	snd_seq_port_unlock(port);
-	snd_seq_client_unlock(cptr);
-
 	return 0;
 }
 
@@ -1478,9 +1461,10 @@ int snd_seq_client_notify_subscription(int client, int port,
 static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 					void *arg)
 {
-	struct snd_seq_port_subscribe *subs = arg;
 	int result = -EINVAL;
-	struct snd_seq_client *receiver = NULL, *sender = NULL;
+	struct snd_seq_port_subscribe *subs = arg;
+	struct snd_seq_client *receiver __free(snd_seq_client) = NULL;
+	struct snd_seq_client *sender __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *sport = NULL, *dport = NULL;
 
 	receiver = client_load_and_use_ptr(subs->dest.client);
@@ -1510,10 +1494,6 @@ static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 		snd_seq_port_unlock(sport);
 	if (dport)
 		snd_seq_port_unlock(dport);
-	if (sender)
-		snd_seq_client_unlock(sender);
-	if (receiver)
-		snd_seq_client_unlock(receiver);
 	return result;
 }
 
@@ -1524,9 +1504,10 @@ static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 static int snd_seq_ioctl_unsubscribe_port(struct snd_seq_client *client,
 					  void *arg)
 {
-	struct snd_seq_port_subscribe *subs = arg;
 	int result = -ENXIO;
-	struct snd_seq_client *receiver = NULL, *sender = NULL;
+	struct snd_seq_port_subscribe *subs = arg;
+	struct snd_seq_client *receiver __free(snd_seq_client) = NULL;
+	struct snd_seq_client *sender __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *sport = NULL, *dport = NULL;
 
 	receiver = snd_seq_client_use_ptr(subs->dest.client);
@@ -1555,10 +1536,6 @@ static int snd_seq_ioctl_unsubscribe_port(struct snd_seq_client *client,
 		snd_seq_port_unlock(sport);
 	if (dport)
 		snd_seq_port_unlock(dport);
-	if (sender)
-		snd_seq_client_unlock(sender);
-	if (receiver)
-		snd_seq_client_unlock(receiver);
 	return result;
 }
 
@@ -1849,7 +1826,7 @@ static int snd_seq_ioctl_get_client_pool(struct snd_seq_client *client,
 					 void *arg)
 {
 	struct snd_seq_client_pool *info = arg;
-	struct snd_seq_client *cptr;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 
 	cptr = client_load_and_use_ptr(info->client);
 	if (cptr == NULL)
@@ -1868,7 +1845,6 @@ static int snd_seq_ioctl_get_client_pool(struct snd_seq_client *client,
 		info->input_pool = 0;
 		info->input_free = 0;
 	}
-	snd_seq_client_unlock(cptr);
 	
 	return 0;
 }
@@ -1951,7 +1927,7 @@ static int snd_seq_ioctl_get_subscription(struct snd_seq_client *client,
 {
 	struct snd_seq_port_subscribe *subs = arg;
 	int result;
-	struct snd_seq_client *sender = NULL;
+	struct snd_seq_client *sender __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *sport = NULL;
 
 	result = -EINVAL;
@@ -1966,8 +1942,6 @@ static int snd_seq_ioctl_get_subscription(struct snd_seq_client *client,
       __end:
       	if (sport)
 		snd_seq_port_unlock(sport);
-	if (sender)
-		snd_seq_client_unlock(sender);
 
 	return result;
 }
@@ -1980,7 +1954,7 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_query_subs *subs = arg;
 	int result = -ENXIO;
-	struct snd_seq_client *cptr = NULL;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *port = NULL;
 	struct snd_seq_port_subs_info *group;
 	struct list_head *p;
@@ -2031,8 +2005,6 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
       __end:
    	if (port)
 		snd_seq_port_unlock(port);
-	if (cptr)
-		snd_seq_client_unlock(cptr);
 
 	return result;
 }
@@ -2045,7 +2017,7 @@ static int snd_seq_ioctl_query_next_client(struct snd_seq_client *client,
 					   void *arg)
 {
 	struct snd_seq_client_info *info = arg;
-	struct snd_seq_client *cptr = NULL;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 
 	/* search for next client */
 	if (info->client < INT_MAX)
@@ -2054,16 +2026,12 @@ static int snd_seq_ioctl_query_next_client(struct snd_seq_client *client,
 		info->client = 0;
 	for (; info->client < SNDRV_SEQ_MAX_CLIENTS; info->client++) {
 		cptr = client_load_and_use_ptr(info->client);
-		if (cptr)
-			break; /* found */
+		if (cptr) {
+			get_client_info(cptr, info);
+			return 0; /* found */
+		}
 	}
-	if (cptr == NULL)
-		return -ENOENT;
-
-	get_client_info(cptr, info);
-	snd_seq_client_unlock(cptr);
-
-	return 0;
+	return -ENOENT;
 }
 
 /* 
@@ -2073,7 +2041,7 @@ static int snd_seq_ioctl_query_next_port(struct snd_seq_client *client,
 					 void *arg)
 {
 	struct snd_seq_port_info *info = arg;
-	struct snd_seq_client *cptr;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 	struct snd_seq_client_port *port = NULL;
 
 	cptr = client_load_and_use_ptr(info->addr.client);
@@ -2083,16 +2051,13 @@ static int snd_seq_ioctl_query_next_port(struct snd_seq_client *client,
 	/* search for next port */
 	info->addr.port++;
 	port = snd_seq_port_query_nearest(cptr, info);
-	if (port == NULL) {
-		snd_seq_client_unlock(cptr);
+	if (port == NULL)
 		return -ENOENT;
-	}
 
 	/* get port info */
 	info->addr = port->addr;
 	snd_seq_get_port_info(port, info);
 	snd_seq_port_unlock(port);
-	snd_seq_client_unlock(cptr);
 
 	return 0;
 }
@@ -2157,7 +2122,7 @@ static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
 {
 	struct snd_seq_client_ump_info __user *argp =
 		(struct snd_seq_client_ump_info __user *)arg;
-	struct snd_seq_client *cptr;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 	int client, type, err = 0;
 	size_t size;
 	void *p;
@@ -2180,7 +2145,7 @@ static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
 	scoped_guard(mutex, &cptr->ioctl_mutex) {
 		if (!cptr->midi_version) {
 			err = -EBADFD;
-			goto error;
+			break;
 		}
 
 		if (cmd == SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO) {
@@ -2190,38 +2155,36 @@ static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
 				p = cptr->ump_info[type];
 			if (!p) {
 				err = -ENODEV;
-				goto error;
+				break;
 			}
 			if (copy_to_user(argp->info, p, size)) {
 				err = -EFAULT;
-				goto error;
+				break;
 			}
 		} else {
 			if (cptr->type != USER_CLIENT) {
 				err = -EBADFD;
-				goto error;
+				break;
 			}
 			if (!cptr->ump_info) {
 				cptr->ump_info = kcalloc(NUM_UMP_INFOS,
 							 sizeof(void *), GFP_KERNEL);
 				if (!cptr->ump_info) {
 					err = -ENOMEM;
-					goto error;
+					break;
 				}
 			}
 			p = memdup_user(argp->info, size);
 			if (IS_ERR(p)) {
 				err = PTR_ERR(p);
-				goto error;
+				break;
 			}
 			kfree(cptr->ump_info[type]);
 			terminate_ump_info_strings(p, type);
 			cptr->ump_info[type] = p;
 		}
-	}
 
- error:
-	snd_seq_client_unlock(cptr);
+	}
 	if (!err && cmd == SNDRV_SEQ_IOCTL_SET_CLIENT_UMP_INFO) {
 		if (type == SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT)
 			snd_seq_system_ump_notify(client, 0,
@@ -2434,8 +2397,7 @@ EXPORT_SYMBOL(snd_seq_delete_kernel_client);
 int snd_seq_kernel_client_enqueue(int client, struct snd_seq_event *ev,
 				  struct file *file, bool blocking)
 {
-	struct snd_seq_client *cptr;
-	int result;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 
 	if (snd_BUG_ON(!ev))
 		return -EINVAL;
@@ -2458,16 +2420,13 @@ int snd_seq_kernel_client_enqueue(int client, struct snd_seq_event *ev,
 		return -EINVAL;
 	
 	if (!cptr->accept_output) {
-		result = -EPERM;
+		return -EPERM;
 	} else { /* send it */
 		guard(mutex)(&cptr->ioctl_mutex);
-		result = snd_seq_client_enqueue_event(cptr, ev, file, blocking,
-						      false, 0,
-						      &cptr->ioctl_mutex);
+		return snd_seq_client_enqueue_event(cptr, ev, file, blocking,
+						    false, 0,
+						    &cptr->ioctl_mutex);
 	}
-
-	snd_seq_client_unlock(cptr);
-	return result;
 }
 EXPORT_SYMBOL(snd_seq_kernel_client_enqueue);
 
@@ -2481,8 +2440,7 @@ EXPORT_SYMBOL(snd_seq_kernel_client_enqueue);
 int snd_seq_kernel_client_dispatch(int client, struct snd_seq_event * ev,
 				   int atomic, int hop)
 {
-	struct snd_seq_client *cptr;
-	int result;
+	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
 
 	if (snd_BUG_ON(!ev))
 		return -EINVAL;
@@ -2499,12 +2457,9 @@ int snd_seq_kernel_client_dispatch(int client, struct snd_seq_event * ev,
 		return -EINVAL;
 
 	if (!cptr->accept_output)
-		result = -EPERM;
+		return -EPERM;
 	else
-		result = snd_seq_deliver_event(cptr, ev, atomic, hop);
-
-	snd_seq_client_unlock(cptr);
-	return result;
+		return snd_seq_deliver_event(cptr, ev, atomic, hop);
 }
 EXPORT_SYMBOL(snd_seq_kernel_client_dispatch);
 
@@ -2550,17 +2505,13 @@ EXPORT_SYMBOL(snd_seq_kernel_client_ctl);
 /* a similar like above but taking locks; used only from OSS sequencer layer */
 int snd_seq_kernel_client_ioctl(int clientid, unsigned int cmd, void *arg)
 {
-	struct snd_seq_client *client;
-	int ret;
+	struct snd_seq_client *client __free(snd_seq_client) = NULL;
 
 	client = client_load_and_use_ptr(clientid);
 	if (!client)
 		return -ENXIO;
-	scoped_guard(mutex, &client->ioctl_mutex) {
-		ret = call_seq_client_ctl(client, cmd, arg);
-	}
-	snd_seq_client_unlock(client);
-	return ret;
+	guard(mutex)(&client->ioctl_mutex);
+	return call_seq_client_ctl(client, cmd, arg);
 }
 EXPORT_SYMBOL_GPL(snd_seq_kernel_client_ioctl);
 
@@ -2590,7 +2541,7 @@ EXPORT_SYMBOL_GPL(snd_seq_kernel_client_get);
 void snd_seq_kernel_client_put(struct snd_seq_client *cptr)
 {
 	if (cptr)
-		snd_seq_client_unlock(cptr);
+		snd_seq_client_unref(cptr);
 }
 EXPORT_SYMBOL_GPL(snd_seq_kernel_client_put);
 
@@ -2692,7 +2643,6 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 			       struct snd_info_buffer *buffer)
 {
 	int c;
-	struct snd_seq_client *client;
 
 	snd_iprintf(buffer, "Client info\n");
 	snd_iprintf(buffer, "  cur  clients : %d\n", client_usage.cur);
@@ -2702,15 +2652,15 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 
 	/* list the client table */
 	for (c = 0; c < SNDRV_SEQ_MAX_CLIENTS; c++) {
+		struct snd_seq_client *client __free(snd_seq_client) = NULL;
+
 		client = client_load_and_use_ptr(c);
 		if (client == NULL)
 			continue;
-		if (client->type == NO_CLIENT) {
-			snd_seq_client_unlock(client);
+		if (client->type == NO_CLIENT)
 			continue;
-		}
 
-		mutex_lock(&client->ioctl_mutex);
+		guard(mutex)(&client->ioctl_mutex);
 		snd_iprintf(buffer, "Client %3d : \"%s\" [%s %s]\n",
 			    c, client->name,
 			    client->type == USER_CLIENT ? "User" : "Kernel",
@@ -2728,8 +2678,6 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "  Input pool :\n");
 			snd_seq_info_pool(buffer, client->data.user.fifo->pool, "    ");
 		}
-		mutex_unlock(&client->ioctl_mutex);
-		snd_seq_client_unlock(client);
 	}
 }
 #endif /* CONFIG_SND_PROC_FS */
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index b42afb887daf..ece02c58db70 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -91,7 +91,7 @@ static inline void snd_seq_client_unref(struct snd_seq_client *client)
 	snd_use_lock_free(&client->use_lock);
 }
 
-#define snd_seq_client_unlock(c)	snd_seq_client_unref(c)
+DEFINE_FREE(snd_seq_client, struct snd_seq_client *, if (!IS_ERR_OR_NULL(_T)) snd_seq_client_unref(_T))
 
 /* dispatch event to client(s) */
 int snd_seq_dispatch_event(struct snd_seq_event_cell *cell, int atomic, int hop);
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index cc2f8e846584..446d67c0fd67 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -178,17 +178,10 @@ static int unsubscribe_port(struct snd_seq_client *client,
 static struct snd_seq_client_port *get_client_port(struct snd_seq_addr *addr,
 						   struct snd_seq_client **cp)
 {
-	struct snd_seq_client_port *p;
 	*cp = snd_seq_client_use_ptr(addr->client);
-	if (*cp) {
-		p = snd_seq_port_use_ptr(*cp, addr->port);
-		if (! p) {
-			snd_seq_client_unlock(*cp);
-			*cp = NULL;
-		}
-		return p;
-	}
-	return NULL;
+	if (!*cp)
+		return NULL;
+	return snd_seq_port_use_ptr(*cp, addr->port);
 }
 
 static void delete_and_unsubscribe_port(struct snd_seq_client *client,
@@ -218,7 +211,7 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 
 	list_for_each_safe(p, n, &grp->list_head) {
 		struct snd_seq_subscribers *subs;
-		struct snd_seq_client *c;
+		struct snd_seq_client *c __free(snd_seq_client) = NULL;
 		struct snd_seq_client_port *aport;
 
 		subs = get_subscriber(p, is_src);
@@ -242,7 +235,6 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 		delete_and_unsubscribe_port(c, aport, subs, !is_src, true);
 		kfree(subs);
 		snd_seq_port_unlock(aport);
-		snd_seq_client_unlock(c);
 	}
 }
 
-- 
2.50.1

