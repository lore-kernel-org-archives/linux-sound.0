Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFE14BF8A
	for <linux-sound@vger.kernel.org>; Mon, 19 Aug 2024 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724057240; cv=none; b=JdAIxTvXA0yQkQUfr2y74CyD12p1BCASPs+UKqYMqZGvNpuG3fN30V4Y9WGSjQvc6mkxQPyrxO27pHtWTDUwB3mGP91VnJ3eTCTUdmK/fGvwzaCsocHqsJ89SjDQNwKZhIDCfyjABTVHVfnAyQ7Gg5BQ0Q9Ah+8EJV4BLyRtL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724057240; c=relaxed/simple;
	bh=FWYE8mDT35rzktyOxWjd5YCBaxSmEPI+XjTRTWgrbPQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=oNpfrpapF68FKzcpnSZKfzUsKY/4QQ/nCl86zQ7RjYA4hFcLe+VDcan4/Zz8saWFyiQ4BIgHjBHZxtDusg0tbL1jmQf7wOKXgHNASrRLw6QM9RyrjJrlJ/5XMnyG/B51O3EDbGBInEa+u1uwJpsROXU1KF/2gfB/q4AlZHhl6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xMZkzO/q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QJF6SLGe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xMZkzO/q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QJF6SLGe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMZkzO/q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QJF6SLGe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMZkzO/q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QJF6SLGe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 811A0203BF;
	Mon, 19 Aug 2024 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724057237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eW3yPu46GueawLx624gTED1lsT/GYUP6GGt5WXV5UIs=;
	b=xMZkzO/qhvcjLg5vf4LupJgaM84XXDcK8gLivQ7Iv/6u7PfSczGCKphpirFsMmfQtjEFmj
	UwHqhwEn1DjJh8rFl25g/NxJj8+e4j0MWdztao3X+EjhoHr9g4xnEjL/32LKcxuC03BUtZ
	El4hW6RtWUy8OOaptDSlW8DMKQ9PQ28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724057237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eW3yPu46GueawLx624gTED1lsT/GYUP6GGt5WXV5UIs=;
	b=QJF6SLGeNn14QamW3mr3/SR0VJwxPu99ZAT4lD4UawuMeQF73KSBN9hgX7IAdWvXZ910gz
	d2GXmkxvuYOYoyDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xMZkzO/q";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QJF6SLGe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724057237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eW3yPu46GueawLx624gTED1lsT/GYUP6GGt5WXV5UIs=;
	b=xMZkzO/qhvcjLg5vf4LupJgaM84XXDcK8gLivQ7Iv/6u7PfSczGCKphpirFsMmfQtjEFmj
	UwHqhwEn1DjJh8rFl25g/NxJj8+e4j0MWdztao3X+EjhoHr9g4xnEjL/32LKcxuC03BUtZ
	El4hW6RtWUy8OOaptDSlW8DMKQ9PQ28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724057237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eW3yPu46GueawLx624gTED1lsT/GYUP6GGt5WXV5UIs=;
	b=QJF6SLGeNn14QamW3mr3/SR0VJwxPu99ZAT4lD4UawuMeQF73KSBN9hgX7IAdWvXZ910gz
	d2GXmkxvuYOYoyDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65720137C3;
	Mon, 19 Aug 2024 08:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zvx3F5UGw2Z4GwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Aug 2024 08:47:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Drop superfluous filter argument of get_event_dest_client()
Date: Mon, 19 Aug 2024 10:47:49 +0200
Message-ID: <20240819084757.11902-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 811A0203BF
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

All callers of get_event_dest_clienter() pass 0 to the filter
argument, and it means that the check there is utterly redundant.

Drop the superfluous filter argument and its check as a code cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 6be548baa6df..a9b455018592 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -70,7 +70,7 @@ static int bounce_error_event(struct snd_seq_client *client,
 			      int err, int atomic, int hop);
 static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 					struct snd_seq_event *event,
-					int filter, int atomic, int hop);
+					int atomic, int hop);
 
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
 static void free_ump_info(struct snd_seq_client *client);
@@ -525,10 +525,8 @@ static int check_port_perm(struct snd_seq_client_port *port, unsigned int flags)
 
 /*
  * check if the destination client is available, and return the pointer
- * if filter is non-zero, client filter bitmap is tested.
  */
-static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event,
-						    int filter)
+static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event)
 {
 	struct snd_seq_client *dest;
 
@@ -543,8 +541,6 @@ static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event,
 	if ((dest->filter & SNDRV_SEQ_FILTER_USE_EVENT) &&
 	    ! test_bit(event->type, dest->event_filter))
 		goto __not_avail;
-	if (filter && !(dest->filter & filter))
-		goto __not_avail;
 
 	return dest; /* ok - accessible */
 __not_avail:
@@ -588,7 +584,7 @@ static int bounce_error_event(struct snd_seq_client *client,
 	bounce_ev.data.quote.origin = event->dest;
 	bounce_ev.data.quote.event = event;
 	bounce_ev.data.quote.value = -err; /* use positive value */
-	result = snd_seq_deliver_single_event(NULL, &bounce_ev, 0, atomic, hop + 1);
+	result = snd_seq_deliver_single_event(NULL, &bounce_ev, atomic, hop + 1);
 	if (result < 0) {
 		client->event_lost++;
 		return result;
@@ -655,7 +651,7 @@ int __snd_seq_deliver_single_event(struct snd_seq_client *dest,
  */
 static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 					struct snd_seq_event *event,
-					int filter, int atomic, int hop)
+					int atomic, int hop)
 {
 	struct snd_seq_client *dest = NULL;
 	struct snd_seq_client_port *dest_port = NULL;
@@ -664,7 +660,7 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 
 	direct = snd_seq_ev_is_direct(event);
 
-	dest = get_event_dest_client(event, filter);
+	dest = get_event_dest_client(event);
 	if (dest == NULL)
 		goto __skip;
 	dest_port = snd_seq_port_use_ptr(dest, event->dest.port);
@@ -744,8 +740,7 @@ static int __deliver_to_subscribers(struct snd_seq_client *client,
 			/* convert time according to flag with subscription */
 			update_timestamp_of_queue(event, subs->info.queue,
 						  subs->info.flags & SNDRV_SEQ_PORT_SUBS_TIME_REAL);
-		err = snd_seq_deliver_single_event(client, event,
-						   0, atomic, hop);
+		err = snd_seq_deliver_single_event(client, event, atomic, hop);
 		if (err < 0) {
 			/* save first error that occurs and continue */
 			if (!result)
@@ -818,7 +813,7 @@ static int snd_seq_deliver_event(struct snd_seq_client *client, struct snd_seq_e
 	    event->dest.client == SNDRV_SEQ_ADDRESS_SUBSCRIBERS)
 		result = deliver_to_subscribers(client, event, atomic, hop);
 	else
-		result = snd_seq_deliver_single_event(client, event, 0, atomic, hop);
+		result = snd_seq_deliver_single_event(client, event, atomic, hop);
 
 	return result;
 }
-- 
2.43.0

