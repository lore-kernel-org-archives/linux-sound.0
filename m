Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF21F23BCED
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908385; cv=none; b=jDofQdW/2NVPvLQ0V/ZKMokLFtliHvJo2DuB7CpsP0yi6cLJVWqxMfbhzs7QklW9y8UYumnunL5cP6eMbZxX3XbGdMncWy1/7OhfxeCA6lBsNWEOyYq3tSpt7lOEqfd9ACfYvwPRbuNw6B51ctW7KZknxgw3bgDP8rQjdp6ijuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908385; c=relaxed/simple;
	bh=wReZ+BdYV0mMQ2HzH6a+r3cdlcyy1ZoEbCCYlhcul/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S306vglzVU39BQxZMylkrfiMkkrK3p73a4O1jmnSXpbIOTLgYY7cayFJFc+qkFQUtrLOo0awaaENLXPOEV3H1Wx7xWJQSeTrt+mPleRF5mqA+B6j3/thc4ZkXWHofggj4BMt+3bF71z39VKLB8Znlb2eoS/8Zx4PS3/K/Z3E5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cCgDJb3C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kRR3N3mD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cCgDJb3C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kRR3N3mD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cCgDJb3C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kRR3N3mD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cCgDJb3C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kRR3N3mD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4DCCB21D69;
	Mon, 11 Aug 2025 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWyQE05aEBYMKPeVwQCi0HHk4Mua1PeX+ceSofD44X8=;
	b=cCgDJb3CY1p1tzQAc+BdsR9LLe2E7L7FeSQDD7gEV34snZLviSflXcYVlkInsaevc930/n
	2faVC/+Cpz7PVmXnQDvBs3UOOttxDwEYnImrLRGYckVIA03bJFW/GPNeyf4JLHmbxe+4t6
	FUJI6ghpFNgNV4QIyQ/jUlyUAdc3fv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWyQE05aEBYMKPeVwQCi0HHk4Mua1PeX+ceSofD44X8=;
	b=kRR3N3mDvftF3E8RDpDNjozJyz4+FN0ZHWp51H4eS6Q6ONTRFUs2RoGlGF8TIpd6t6TUtb
	Yw2EO+BTZRmHCkDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cCgDJb3C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kRR3N3mD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWyQE05aEBYMKPeVwQCi0HHk4Mua1PeX+ceSofD44X8=;
	b=cCgDJb3CY1p1tzQAc+BdsR9LLe2E7L7FeSQDD7gEV34snZLviSflXcYVlkInsaevc930/n
	2faVC/+Cpz7PVmXnQDvBs3UOOttxDwEYnImrLRGYckVIA03bJFW/GPNeyf4JLHmbxe+4t6
	FUJI6ghpFNgNV4QIyQ/jUlyUAdc3fv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWyQE05aEBYMKPeVwQCi0HHk4Mua1PeX+ceSofD44X8=;
	b=kRR3N3mDvftF3E8RDpDNjozJyz4+FN0ZHWp51H4eS6Q6ONTRFUs2RoGlGF8TIpd6t6TUtb
	Yw2EO+BTZRmHCkDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 337C013479;
	Mon, 11 Aug 2025 10:32:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MJJLC9bGmWjEDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:32:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/11] ALSA: seq: Use guard() for mutex and rwsem locks
Date: Mon, 11 Aug 2025 12:32:39 +0200
Message-ID: <20250811103249.10644-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811103249.10644-1-tiwai@suse.de>
References: <20250811103249.10644-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4DCCB21D69
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

There are a few manual calls of mutex and rwsem lock/unlock pairs in
seq_clientmngr.c, and those can be replaced nicely with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 226 ++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 118 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 89f99e713a2f..5a67c4b2b644 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -265,23 +265,23 @@ static int seq_free_client1(struct snd_seq_client *client)
 
 static void seq_free_client(struct snd_seq_client * client)
 {
-	mutex_lock(&register_mutex);
-	switch (client->type) {
-	case NO_CLIENT:
-		pr_warn("ALSA: seq: Trying to free unused client %d\n",
-			client->number);
-		break;
-	case USER_CLIENT:
-	case KERNEL_CLIENT:
-		seq_free_client1(client);
-		usage_free(&client_usage, 1);
-		break;
+	scoped_guard(mutex, &register_mutex) {
+		switch (client->type) {
+		case NO_CLIENT:
+			pr_warn("ALSA: seq: Trying to free unused client %d\n",
+				client->number);
+			break;
+		case USER_CLIENT:
+		case KERNEL_CLIENT:
+			seq_free_client1(client);
+			usage_free(&client_usage, 1);
+			break;
 
-	default:
-		pr_err("ALSA: seq: Trying to free client %d with undefined type = %d\n",
-			   client->number, client->type);
+		default:
+			pr_err("ALSA: seq: Trying to free client %d with undefined type = %d\n",
+			       client->number, client->type);
+		}
 	}
-	mutex_unlock(&register_mutex);
 
 	snd_seq_system_client_ev_client_exit(client->number);
 }
@@ -302,37 +302,34 @@ static int snd_seq_open(struct inode *inode, struct file *file)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&register_mutex);
-	client = seq_create_client1(-1, SNDRV_SEQ_DEFAULT_EVENTS);
-	if (!client) {
-		mutex_unlock(&register_mutex);
-		return -ENOMEM;	/* failure code */
-	}
+	scoped_guard(mutex, &register_mutex) {
+		client = seq_create_client1(-1, SNDRV_SEQ_DEFAULT_EVENTS);
+		if (!client)
+			return -ENOMEM;	/* failure code */
 
-	mode = snd_seq_file_flags(file);
-	if (mode & SNDRV_SEQ_LFLG_INPUT)
-		client->accept_input = 1;
-	if (mode & SNDRV_SEQ_LFLG_OUTPUT)
-		client->accept_output = 1;
+		mode = snd_seq_file_flags(file);
+		if (mode & SNDRV_SEQ_LFLG_INPUT)
+			client->accept_input = 1;
+		if (mode & SNDRV_SEQ_LFLG_OUTPUT)
+			client->accept_output = 1;
 
-	user = &client->data.user;
-	user->fifo = NULL;
-	user->fifo_pool_size = 0;
+		user = &client->data.user;
+		user->fifo = NULL;
+		user->fifo_pool_size = 0;
 
-	if (mode & SNDRV_SEQ_LFLG_INPUT) {
-		user->fifo_pool_size = SNDRV_SEQ_DEFAULT_CLIENT_EVENTS;
-		user->fifo = snd_seq_fifo_new(user->fifo_pool_size);
-		if (user->fifo == NULL) {
-			seq_free_client1(client);
-			kfree(client);
-			mutex_unlock(&register_mutex);
-			return -ENOMEM;
+		if (mode & SNDRV_SEQ_LFLG_INPUT) {
+			user->fifo_pool_size = SNDRV_SEQ_DEFAULT_CLIENT_EVENTS;
+			user->fifo = snd_seq_fifo_new(user->fifo_pool_size);
+			if (user->fifo == NULL) {
+				seq_free_client1(client);
+				kfree(client);
+				return -ENOMEM;
+			}
 		}
-	}
 
-	usage_alloc(&client_usage, 1);
-	client->type = USER_CLIENT;
-	mutex_unlock(&register_mutex);
+		usage_alloc(&client_usage, 1);
+		client->type = USER_CLIENT;
+	}
 
 	c = client->number;
 	file->private_data = client;
@@ -2180,50 +2177,50 @@ static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
 	if (!cptr)
 		return -ENOENT;
 
-	mutex_lock(&cptr->ioctl_mutex);
-	if (!cptr->midi_version) {
-		err = -EBADFD;
-		goto error;
-	}
-
-	if (cmd == SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO) {
-		if (!cptr->ump_info)
-			p = NULL;
-		else
-			p = cptr->ump_info[type];
-		if (!p) {
-			err = -ENODEV;
-			goto error;
-		}
-		if (copy_to_user(argp->info, p, size)) {
-			err = -EFAULT;
-			goto error;
-		}
-	} else {
-		if (cptr->type != USER_CLIENT) {
+	scoped_guard(mutex, &cptr->ioctl_mutex) {
+		if (!cptr->midi_version) {
 			err = -EBADFD;
 			goto error;
 		}
-		if (!cptr->ump_info) {
-			cptr->ump_info = kcalloc(NUM_UMP_INFOS,
-						 sizeof(void *), GFP_KERNEL);
-			if (!cptr->ump_info) {
-				err = -ENOMEM;
+
+		if (cmd == SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO) {
+			if (!cptr->ump_info)
+				p = NULL;
+			else
+				p = cptr->ump_info[type];
+			if (!p) {
+				err = -ENODEV;
 				goto error;
 			}
+			if (copy_to_user(argp->info, p, size)) {
+				err = -EFAULT;
+				goto error;
+			}
+		} else {
+			if (cptr->type != USER_CLIENT) {
+				err = -EBADFD;
+				goto error;
+			}
+			if (!cptr->ump_info) {
+				cptr->ump_info = kcalloc(NUM_UMP_INFOS,
+							 sizeof(void *), GFP_KERNEL);
+				if (!cptr->ump_info) {
+					err = -ENOMEM;
+					goto error;
+				}
+			}
+			p = memdup_user(argp->info, size);
+			if (IS_ERR(p)) {
+				err = PTR_ERR(p);
+				goto error;
+			}
+			kfree(cptr->ump_info[type]);
+			terminate_ump_info_strings(p, type);
+			cptr->ump_info[type] = p;
 		}
-		p = memdup_user(argp->info, size);
-		if (IS_ERR(p)) {
-			err = PTR_ERR(p);
-			goto error;
-		}
-		kfree(cptr->ump_info[type]);
-		terminate_ump_info_strings(p, type);
-		cptr->ump_info[type] = p;
 	}
 
  error:
-	mutex_unlock(&cptr->ioctl_mutex);
 	snd_seq_client_unlock(cptr);
 	if (!err && cmd == SNDRV_SEQ_IOCTL_SET_CLIENT_UMP_INFO) {
 		if (type == SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT)
@@ -2337,9 +2334,9 @@ static long snd_seq_ioctl(struct file *file, unsigned int cmd,
 			return -EFAULT;
 	}
 
-	mutex_lock(&client->ioctl_mutex);
-	err = handler->func(client, &buf);
-	mutex_unlock(&client->ioctl_mutex);
+	scoped_guard(mutex, &client->ioctl_mutex) {
+		err = handler->func(client, &buf);
+	}
 	if (err >= 0) {
 		/* Some commands includes a bug in 'dir' field. */
 		if (handler->cmd == SNDRV_SEQ_IOCTL_SET_QUEUE_CLIENT ||
@@ -2376,34 +2373,32 @@ int snd_seq_create_kernel_client(struct snd_card *card, int client_index,
 	if (card == NULL && client_index >= SNDRV_SEQ_GLOBAL_CLIENTS)
 		return -EINVAL;
 
-	mutex_lock(&register_mutex);
+	scoped_guard(mutex, &register_mutex) {
 
-	if (card) {
-		client_index += SNDRV_SEQ_GLOBAL_CLIENTS
-			+ card->number * SNDRV_SEQ_CLIENTS_PER_CARD;
-		if (client_index >= SNDRV_SEQ_DYNAMIC_CLIENTS_BEGIN)
-			client_index = -1;
-	}
+		if (card) {
+			client_index += SNDRV_SEQ_GLOBAL_CLIENTS
+				+ card->number * SNDRV_SEQ_CLIENTS_PER_CARD;
+			if (client_index >= SNDRV_SEQ_DYNAMIC_CLIENTS_BEGIN)
+				client_index = -1;
+		}
 
-	/* empty write queue as default */
-	client = seq_create_client1(client_index, 0);
-	if (client == NULL) {
-		mutex_unlock(&register_mutex);
-		return -EBUSY;	/* failure code */
-	}
-	usage_alloc(&client_usage, 1);
+		/* empty write queue as default */
+		client = seq_create_client1(client_index, 0);
+		if (client == NULL)
+			return -EBUSY;	/* failure code */
+		usage_alloc(&client_usage, 1);
 
-	client->accept_input = 1;
-	client->accept_output = 1;
-	client->data.kernel.card = card;
-	client->user_pversion = SNDRV_SEQ_VERSION;
+		client->accept_input = 1;
+		client->accept_output = 1;
+		client->data.kernel.card = card;
+		client->user_pversion = SNDRV_SEQ_VERSION;
 		
-	va_start(args, name_fmt);
-	vsnprintf(client->name, sizeof(client->name), name_fmt, args);
-	va_end(args);
+		va_start(args, name_fmt);
+		vsnprintf(client->name, sizeof(client->name), name_fmt, args);
+		va_end(args);
 
-	client->type = KERNEL_CLIENT;
-	mutex_unlock(&register_mutex);
+		client->type = KERNEL_CLIENT;
+	}
 
 	/* make others aware this new client */
 	snd_seq_system_client_ev_client_start(client->number);
@@ -2465,11 +2460,10 @@ int snd_seq_kernel_client_enqueue(int client, struct snd_seq_event *ev,
 	if (!cptr->accept_output) {
 		result = -EPERM;
 	} else { /* send it */
-		mutex_lock(&cptr->ioctl_mutex);
+		guard(mutex)(&cptr->ioctl_mutex);
 		result = snd_seq_client_enqueue_event(cptr, ev, file, blocking,
 						      false, 0,
 						      &cptr->ioctl_mutex);
-		mutex_unlock(&cptr->ioctl_mutex);
 	}
 
 	snd_seq_client_unlock(cptr);
@@ -2562,9 +2556,9 @@ int snd_seq_kernel_client_ioctl(int clientid, unsigned int cmd, void *arg)
 	client = client_load_and_use_ptr(clientid);
 	if (!client)
 		return -ENXIO;
-	mutex_lock(&client->ioctl_mutex);
-	ret = call_seq_client_ctl(client, cmd, arg);
-	mutex_unlock(&client->ioctl_mutex);
+	scoped_guard(mutex, &client->ioctl_mutex) {
+		ret = call_seq_client_ctl(client, cmd, arg);
+	}
 	snd_seq_client_unlock(client);
 	return ret;
 }
@@ -2614,11 +2608,9 @@ static void snd_seq_info_dump_subscribers(struct snd_info_buffer *buffer,
 	struct snd_seq_subscribers *s;
 	int count = 0;
 
-	down_read(&group->list_mutex);
-	if (list_empty(&group->list_head)) {
-		up_read(&group->list_mutex);
+	guard(rwsem_read)(&group->list_mutex);
+	if (list_empty(&group->list_head))
 		return;
-	}
 	snd_iprintf(buffer, msg);
 	list_for_each(p, &group->list_head) {
 		if (is_src)
@@ -2635,7 +2627,6 @@ static void snd_seq_info_dump_subscribers(struct snd_info_buffer *buffer,
 		if (group->exclusive)
 			snd_iprintf(buffer, "[ex]");
 	}
-	up_read(&group->list_mutex);
 	snd_iprintf(buffer, "\n");
 }
 
@@ -2661,7 +2652,7 @@ static void snd_seq_info_dump_ports(struct snd_info_buffer *buffer,
 {
 	struct snd_seq_client_port *p;
 
-	mutex_lock(&client->ports_mutex);
+	guard(mutex)(&client->ports_mutex);
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->capability & SNDRV_SEQ_PORT_CAP_INACTIVE)
 			continue;
@@ -2680,7 +2671,6 @@ static void snd_seq_info_dump_ports(struct snd_info_buffer *buffer,
 		snd_seq_info_dump_subscribers(buffer, &p->c_src, 1, "    Connecting To: ");
 		snd_seq_info_dump_subscribers(buffer, &p->c_dest, 0, "    Connected From: ");
 	}
-	mutex_unlock(&client->ports_mutex);
 }
 
 static const char *midi_version_string(unsigned int version)
@@ -2777,10 +2767,10 @@ int __init snd_sequencer_device_init(void)
 		return err;
 	dev_set_name(seq_dev, "seq");
 
-	mutex_lock(&register_mutex);
-	err = snd_register_device(SNDRV_DEVICE_TYPE_SEQUENCER, NULL, 0,
-				  &snd_seq_f_ops, NULL, seq_dev);
-	mutex_unlock(&register_mutex);
+	scoped_guard(mutex, &register_mutex) {
+		err = snd_register_device(SNDRV_DEVICE_TYPE_SEQUENCER, NULL, 0,
+					  &snd_seq_f_ops, NULL, seq_dev);
+	}
 	if (err < 0) {
 		put_device(seq_dev);
 		return err;
-- 
2.50.1

