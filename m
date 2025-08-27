Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3EC2E1745
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281959; cv=none; b=j18kMSDuTYBqrS4eyUlMHqvI2nM+q4CzcWlHFKqQhr8ezbDOHa/PCvUJy+GOuIBMtPE6O/6nUNojCYea5smI/9zXcWDQaZG6frDMT0A1gHd2zxmyOp9NK1E0Vrwet7/dV3X0zVwDYo9buhRsHng3tQzPB3Oz+yaz17/X2nV/Uu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281959; c=relaxed/simple;
	bh=ibOjPeqMzC2G0oqWN5Mwc7o23lDmuK2C3x2HZU9mrEc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVK1eQQZVpmnnJlYgVfhdmBzMfPgmaPK17Ox6+8jmAYohb5mR9/jXE5llMmvPDyjcynKOaaUrrySIVSm+C3kBhZlBclwc6KEI9p4p/vA78gFTOFA2/mwWlbkf75jgxqvFWJZcPgz/+mac6y168If1d59K2QZxSxOkeY0dKu1oWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YagOsYro; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0wNVLTlf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YagOsYro; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0wNVLTlf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YagOsYro";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0wNVLTlf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YagOsYro";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0wNVLTlf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDA981FEE6;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtcAeBoaguHoKyHRsxm26oY9E/t2ikE0N+/IYv7AQYQ=;
	b=YagOsYroGnhfEB2RkeRQ8D3V+tid7ZEhmpVPuL4vFbYwd2SdnfaIqHVSVJHfLLM1we8LsO
	MGP82zo4j3FAqNmvTqBbrCTfkgkNGhE/G9XUExa+mtbjvn2woOL8bxQQpW0YSsI1ya/3Fe
	hWPgGUahb8jyHA85TNqcQY1k+qTZylg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtcAeBoaguHoKyHRsxm26oY9E/t2ikE0N+/IYv7AQYQ=;
	b=0wNVLTlfsJtmWzEgu8Y7Uo22ao7vliMiMRVnws+bRtLuyPGLcWIVfF7+nq7FGNDqCZopV2
	0CjoOnJAK8Cn/jAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtcAeBoaguHoKyHRsxm26oY9E/t2ikE0N+/IYv7AQYQ=;
	b=YagOsYroGnhfEB2RkeRQ8D3V+tid7ZEhmpVPuL4vFbYwd2SdnfaIqHVSVJHfLLM1we8LsO
	MGP82zo4j3FAqNmvTqBbrCTfkgkNGhE/G9XUExa+mtbjvn2woOL8bxQQpW0YSsI1ya/3Fe
	hWPgGUahb8jyHA85TNqcQY1k+qTZylg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtcAeBoaguHoKyHRsxm26oY9E/t2ikE0N+/IYv7AQYQ=;
	b=0wNVLTlfsJtmWzEgu8Y7Uo22ao7vliMiMRVnws+bRtLuyPGLcWIVfF7+nq7FGNDqCZopV2
	0CjoOnJAK8Cn/jAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9D2A13310;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gC5ILEO8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 05/11] ALSA: seq: Clean up port locking with auto cleanup
Date: Wed, 27 Aug 2025 10:05:11 +0200
Message-ID: <20250827080520.7544-6-tiwai@suse.de>
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

Like the previous change in seq_clientmgr.c, introduce a new
auto-cleanup macro for the snd_seq_port_unlock(), and apply it
appropriately.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 141 ++++++++++++---------------------
 sound/core/seq/seq_ports.c     |   3 +-
 sound/core/seq/seq_ports.h     |   2 +
 3 files changed, 53 insertions(+), 93 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 5b14d70ba87a..18424f56251a 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -612,21 +612,18 @@ static int _snd_seq_deliver_single_event(struct snd_seq_client *client,
 					 int atomic, int hop)
 {
 	struct snd_seq_client *dest __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *dest_port = NULL;
-	int result = -ENOENT;
+	struct snd_seq_client_port *dest_port __free(snd_seq_port) = NULL;
 
 	dest = get_event_dest_client(event);
 	if (dest == NULL)
-		goto __skip;
+		return -ENOENT;
 	dest_port = snd_seq_port_use_ptr(dest, event->dest.port);
 	if (dest_port == NULL)
-		goto __skip;
+		return -ENOENT;
 
 	/* check permission */
-	if (! check_port_perm(dest_port, SNDRV_SEQ_PORT_CAP_WRITE)) {
-		result = -EPERM;
-		goto __skip;
-	}
+	if (!check_port_perm(dest_port, SNDRV_SEQ_PORT_CAP_WRITE))
+		return -EPERM;
 
 	if (dest_port->timestamping)
 		update_timestamp_of_queue(event, dest_port->time_queue,
@@ -634,31 +631,21 @@ static int _snd_seq_deliver_single_event(struct snd_seq_client *client,
 
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
 	if (snd_seq_ev_is_ump(event)) {
-		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
-			result = snd_seq_deliver_from_ump(client, dest, dest_port,
-							  event, atomic, hop);
-			goto __skip;
-		} else if (dest->type == USER_CLIENT &&
-			   !snd_seq_client_is_ump(dest)) {
-			result = 0; // drop the event
-			goto __skip;
-		}
-	} else if (snd_seq_client_is_ump(dest)) {
-		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
-			result = snd_seq_deliver_to_ump(client, dest, dest_port,
+		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT))
+			return snd_seq_deliver_from_ump(client, dest, dest_port,
 							event, atomic, hop);
-			goto __skip;
-		}
+		else if (dest->type == USER_CLIENT &&
+			 !snd_seq_client_is_ump(dest))
+			return 0; // drop the event
+	} else if (snd_seq_client_is_ump(dest)) {
+		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT))
+			return snd_seq_deliver_to_ump(client, dest, dest_port,
+						      event, atomic, hop);
 	}
 #endif /* CONFIG_SND_SEQ_UMP */
 
-	result = __snd_seq_deliver_single_event(dest, dest_port, event,
-						atomic, hop);
-
-  __skip:
-	if (dest_port)
-		snd_seq_port_unlock(dest_port);
-	return result;
+	return __snd_seq_deliver_single_event(dest, dest_port, event,
+					      atomic, hop);
 }
 
 /*
@@ -687,7 +674,7 @@ static int __deliver_to_subscribers(struct snd_seq_client *client,
 				    struct snd_seq_event *event,
 				    int port, int atomic, int hop)
 {
-	struct snd_seq_client_port *src_port;
+	struct snd_seq_client_port *src_port __free(snd_seq_port) = NULL;
 	struct snd_seq_subscribers *subs;
 	int err, result = 0, num_ev = 0;
 	union __snd_seq_event event_saved;
@@ -734,7 +721,6 @@ static int __deliver_to_subscribers(struct snd_seq_client *client,
 		read_unlock(&grp->list_lock);
 	else
 		up_read(&grp->list_mutex);
-	snd_seq_port_unlock(src_port);
 	memcpy(event, &event_saved, saved_size);
 	return (result < 0) ? result : num_ev;
 }
@@ -902,10 +888,10 @@ static int snd_seq_client_enqueue_event(struct snd_seq_client *client,
 		event->queue = SNDRV_SEQ_QUEUE_DIRECT;
 	} else if (event->dest.client == SNDRV_SEQ_ADDRESS_SUBSCRIBERS) {
 		/* check presence of source port */
-		struct snd_seq_client_port *src_port = snd_seq_port_use_ptr(client, event->source.port);
-		if (src_port == NULL)
+		struct snd_seq_client_port *src_port __free(snd_seq_port) =
+			snd_seq_port_use_ptr(client, event->source.port);
+		if (!src_port)
 			return -EINVAL;
-		snd_seq_port_unlock(src_port);
 	}
 
 	/* direct event processing without enqueued */
@@ -1361,7 +1347,7 @@ static int snd_seq_ioctl_get_port_info(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_port_info *info = arg;
 	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *port;
+	struct snd_seq_client_port *port __free(snd_seq_port) = NULL;
 
 	cptr = client_load_and_use_ptr(info->addr.client);
 	if (cptr == NULL)
@@ -1373,7 +1359,6 @@ static int snd_seq_ioctl_get_port_info(struct snd_seq_client *client, void *arg)
 
 	/* get port info */
 	snd_seq_get_port_info(port, info);
-	snd_seq_port_unlock(port);
 	return 0;
 }
 
@@ -1384,14 +1369,13 @@ static int snd_seq_ioctl_get_port_info(struct snd_seq_client *client, void *arg)
 static int snd_seq_ioctl_set_port_info(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_port_info *info = arg;
-	struct snd_seq_client_port *port;
+	struct snd_seq_client_port *port __free(snd_seq_port) = NULL;
 
 	if (info->addr.client != client->number) /* only set our own ports ! */
 		return -EPERM;
 	port = snd_seq_port_use_ptr(client, info->addr.port);
 	if (port) {
 		snd_seq_set_port_info(port, info);
-		snd_seq_port_unlock(port);
 		/* notify the change */
 		snd_seq_system_client_ev_port_change(info->addr.client,
 						     info->addr.port);
@@ -1461,39 +1445,35 @@ int snd_seq_client_notify_subscription(int client, int port,
 static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 					void *arg)
 {
-	int result = -EINVAL;
 	struct snd_seq_port_subscribe *subs = arg;
 	struct snd_seq_client *receiver __free(snd_seq_client) = NULL;
 	struct snd_seq_client *sender __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *sport = NULL, *dport = NULL;
+	struct snd_seq_client_port *sport __free(snd_seq_port) = NULL;
+	struct snd_seq_client_port *dport __free(snd_seq_port) = NULL;
+	int result;
 
 	receiver = client_load_and_use_ptr(subs->dest.client);
 	if (!receiver)
-		goto __end;
+		return -EINVAL;
 	sender = client_load_and_use_ptr(subs->sender.client);
 	if (!sender)
-		goto __end;
+		return -EINVAL;
 	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
 	if (!sport)
-		goto __end;
+		return -EINVAL;
 	dport = snd_seq_port_use_ptr(receiver, subs->dest.port);
 	if (!dport)
-		goto __end;
+		return -EINVAL;
 
 	result = check_subscription_permission(client, sport, dport, subs);
 	if (result < 0)
-		goto __end;
+		return result;
 
 	/* connect them */
 	result = snd_seq_port_connect(client, sender, sport, receiver, dport, subs);
 	if (! result) /* broadcast announce */
 		snd_seq_client_notify_subscription(SNDRV_SEQ_ADDRESS_SUBSCRIBERS, 0,
 						   subs, SNDRV_SEQ_EVENT_PORT_SUBSCRIBED);
-      __end:
-      	if (sport)
-		snd_seq_port_unlock(sport);
-	if (dport)
-		snd_seq_port_unlock(dport);
 	return result;
 }
 
@@ -1504,38 +1484,34 @@ static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 static int snd_seq_ioctl_unsubscribe_port(struct snd_seq_client *client,
 					  void *arg)
 {
-	int result = -ENXIO;
 	struct snd_seq_port_subscribe *subs = arg;
 	struct snd_seq_client *receiver __free(snd_seq_client) = NULL;
 	struct snd_seq_client *sender __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *sport = NULL, *dport = NULL;
+	struct snd_seq_client_port *sport __free(snd_seq_port) = NULL;
+	struct snd_seq_client_port *dport __free(snd_seq_port) = NULL;
+	int result;
 
 	receiver = snd_seq_client_use_ptr(subs->dest.client);
 	if (!receiver)
-		goto __end;
+		return -ENXIO;
 	sender = snd_seq_client_use_ptr(subs->sender.client);
 	if (!sender)
-		goto __end;
+		return -ENXIO;
 	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
 	if (!sport)
-		goto __end;
+		return -ENXIO;
 	dport = snd_seq_port_use_ptr(receiver, subs->dest.port);
 	if (!dport)
-		goto __end;
+		return -ENXIO;
 
 	result = check_subscription_permission(client, sport, dport, subs);
 	if (result < 0)
-		goto __end;
+		return result;
 
 	result = snd_seq_port_disconnect(client, sender, sport, receiver, dport, subs);
 	if (! result) /* broadcast announce */
 		snd_seq_client_notify_subscription(SNDRV_SEQ_ADDRESS_SUBSCRIBERS, 0,
 						   subs, SNDRV_SEQ_EVENT_PORT_UNSUBSCRIBED);
-      __end:
-      	if (sport)
-		snd_seq_port_unlock(sport);
-	if (dport)
-		snd_seq_port_unlock(dport);
 	return result;
 }
 
@@ -1926,24 +1902,16 @@ static int snd_seq_ioctl_get_subscription(struct snd_seq_client *client,
 					  void *arg)
 {
 	struct snd_seq_port_subscribe *subs = arg;
-	int result;
 	struct snd_seq_client *sender __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *sport = NULL;
+	struct snd_seq_client_port *sport __free(snd_seq_port) = NULL;
 
-	result = -EINVAL;
 	sender = client_load_and_use_ptr(subs->sender.client);
 	if (!sender)
-		goto __end;
+		return -EINVAL;
 	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
 	if (!sport)
-		goto __end;
-	result = snd_seq_port_get_subscription(&sport->c_src, &subs->dest,
-					       subs);
-      __end:
-      	if (sport)
-		snd_seq_port_unlock(sport);
-
-	return result;
+		return -EINVAL;
+	return snd_seq_port_get_subscription(&sport->c_src, &subs->dest, subs);
 }
 
 
@@ -1953,19 +1921,18 @@ static int snd_seq_ioctl_get_subscription(struct snd_seq_client *client,
 static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_query_subs *subs = arg;
-	int result = -ENXIO;
 	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *port = NULL;
+	struct snd_seq_client_port *port __free(snd_seq_port) = NULL;
 	struct snd_seq_port_subs_info *group;
 	struct list_head *p;
 	int i;
 
 	cptr = client_load_and_use_ptr(subs->root.client);
 	if (!cptr)
-		goto __end;
+		return -ENXIO;
 	port = snd_seq_port_use_ptr(cptr, subs->root.port);
 	if (!port)
-		goto __end;
+		return -ENXIO;
 
 	switch (subs->type) {
 	case SNDRV_SEQ_QUERY_SUBS_READ:
@@ -1975,14 +1942,13 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 		group = &port->c_dest;
 		break;
 	default:
-		goto __end;
+		return -ENXIO;
 	}
 
-	down_read(&group->list_mutex);
+	guard(rwsem_read)(&group->list_mutex);
 	/* search for the subscriber */
 	subs->num_subs = group->count;
 	i = 0;
-	result = -ENOENT;
 	list_for_each(p, &group->list_head) {
 		if (i++ == subs->index) {
 			/* found! */
@@ -1996,17 +1962,11 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 			}
 			subs->flags = s->info.flags;
 			subs->queue = s->info.queue;
-			result = 0;
-			break;
+			return 0;
 		}
 	}
-	up_read(&group->list_mutex);
 
-      __end:
-   	if (port)
-		snd_seq_port_unlock(port);
-
-	return result;
+	return -ENOENT;
 }
 
 
@@ -2042,7 +2002,7 @@ static int snd_seq_ioctl_query_next_port(struct snd_seq_client *client,
 {
 	struct snd_seq_port_info *info = arg;
 	struct snd_seq_client *cptr __free(snd_seq_client) = NULL;
-	struct snd_seq_client_port *port = NULL;
+	struct snd_seq_client_port *port __free(snd_seq_port) = NULL;
 
 	cptr = client_load_and_use_ptr(info->addr.client);
 	if (cptr == NULL)
@@ -2057,7 +2017,6 @@ static int snd_seq_ioctl_query_next_port(struct snd_seq_client *client,
 	/* get port info */
 	info->addr = port->addr;
 	snd_seq_get_port_info(port, info);
-	snd_seq_port_unlock(port);
 
 	return 0;
 }
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 446d67c0fd67..40fa379847e5 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -212,7 +212,7 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 	list_for_each_safe(p, n, &grp->list_head) {
 		struct snd_seq_subscribers *subs;
 		struct snd_seq_client *c __free(snd_seq_client) = NULL;
-		struct snd_seq_client_port *aport;
+		struct snd_seq_client_port *aport __free(snd_seq_port) = NULL;
 
 		subs = get_subscriber(p, is_src);
 		if (is_src)
@@ -234,7 +234,6 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 		/* ok we got the connected port */
 		delete_and_unsubscribe_port(c, aport, subs, !is_src, true);
 		kfree(subs);
-		snd_seq_port_unlock(aport);
 	}
 }
 
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index b3b35018cb82..40ed6cf7cb90 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -96,6 +96,8 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 /* unlock the port */
 #define snd_seq_port_unlock(port) snd_use_lock_free(&(port)->use_lock)
 
+DEFINE_FREE(snd_seq_port, struct snd_seq_client_port *, if (!IS_ERR_OR_NULL(_T)) snd_seq_port_unlock(_T))
+
 /* create a port, port number or a negative error code is returned */
 int snd_seq_create_port(struct snd_seq_client *client, int port_index,
 			struct snd_seq_client_port **port_ret);
-- 
2.50.1

