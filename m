Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D68287B
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705704; cv=none; b=I5BM0PgC109Yxga9H5WhaTkHJks6PqAWbt7GebKiZaWWdK3B1VZtDow8YvVGMukMj40XACBl4rgmPxOusmrXXe4SLRaOez3mppCX6xWqhqPIEAznoBzixNa7VGK+p8tmPF90SaMfwkHIZZL783HeQhBLVriEOnjMww44ysv9tKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705704; c=relaxed/simple;
	bh=Y7Hws7KjBnbAumnmkP6ecSUj5yoKLmys0TDxzxRtrqY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cAgN2dhAmq3ry99ove0M3h2V0yILEPVo3NDZqQPNF4bUOm+Cqx2dD3NvqGLg6/bll76o9mgW2Ke2mgQZ1QzwHLaC+i0E0auvIUEeSx2LOEgr+IjKqcPN76mvm57eg/YWbHgB8BQeKOc8j+v2vxaJEak9INi2wpr44cBMBXeUzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DtvM+tGh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BCfDQ5oG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DtvM+tGh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BCfDQ5oG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtvM+tGh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BCfDQ5oG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtvM+tGh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BCfDQ5oG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77E0722017;
	Fri, 23 Feb 2024 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RBICid4kXEluFyKvLMIfooyhTxKUzuiOcjbVi5SV8M=;
	b=DtvM+tGhnRjIbNIoQPWPM74GwEqAUmj4ItlkfA0YijO4/2L4wCt6TNxChR8oCR0cdVAD+C
	rlnYh90RKTyg8aWF4BWmWPj4Q39LjUI61ibTWLMQZytuGD5602US7UOjXpRg6mHt5UUbFk
	JbwYkFDcPCkA/o6godt/Lcl894mjO5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RBICid4kXEluFyKvLMIfooyhTxKUzuiOcjbVi5SV8M=;
	b=BCfDQ5oGm3ITp/Gf7os5wKYdDzGPBiY3Cto24R8wU/vggbRmh+XQjxLGqst3L9vA1cbDRD
	xtNYIYeo+mTjfICQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RBICid4kXEluFyKvLMIfooyhTxKUzuiOcjbVi5SV8M=;
	b=DtvM+tGhnRjIbNIoQPWPM74GwEqAUmj4ItlkfA0YijO4/2L4wCt6TNxChR8oCR0cdVAD+C
	rlnYh90RKTyg8aWF4BWmWPj4Q39LjUI61ibTWLMQZytuGD5602US7UOjXpRg6mHt5UUbFk
	JbwYkFDcPCkA/o6godt/Lcl894mjO5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RBICid4kXEluFyKvLMIfooyhTxKUzuiOcjbVi5SV8M=;
	b=BCfDQ5oGm3ITp/Gf7os5wKYdDzGPBiY3Cto24R8wU/vggbRmh+XQjxLGqst3L9vA1cbDRD
	xtNYIYeo+mTjfICQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A867133DC;
	Fri, 23 Feb 2024 16:28:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wOO/FKTH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/24] ALSA: seq: ports: Use guard() for locking
Date: Fri, 23 Feb 2024 17:28:00 +0100
Message-Id: <20240223162810.32302-15-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223162810.32302-1-tiwai@suse.de>
References: <20240223162810.32302-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.71
X-Spamd-Result: default: False [0.71 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.19)[-0.965];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ports.c | 114 ++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 65 deletions(-)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index f3f14ff0f80f..ca631ca4f2c6 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -48,17 +48,15 @@ struct snd_seq_client_port *snd_seq_port_use_ptr(struct snd_seq_client *client,
 
 	if (client == NULL)
 		return NULL;
-	read_lock(&client->ports_lock);
+	guard(read_lock)(&client->ports_lock);
 	list_for_each_entry(port, &client->ports_list_head, list) {
 		if (port->addr.port == num) {
 			if (port->closing)
 				break; /* deleting now */
 			snd_use_lock_use(&port->use_lock);
-			read_unlock(&client->ports_lock);
 			return port;
 		}
 	}
-	read_unlock(&client->ports_lock);
 	return NULL;		/* not found */
 }
 
@@ -73,7 +71,7 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 
 	num = pinfo->addr.port;
 	found = NULL;
-	read_lock(&client->ports_lock);
+	guard(read_lock)(&client->ports_lock);
 	list_for_each_entry(port, &client->ports_list_head, list) {
 		if ((port->capability & SNDRV_SEQ_PORT_CAP_INACTIVE) &&
 		    !check_inactive)
@@ -93,7 +91,6 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 		else
 			snd_use_lock_use(&found->use_lock);
 	}
-	read_unlock(&client->ports_lock);
 	return found;
 }
 
@@ -145,13 +142,12 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
 	snd_use_lock_use(&new_port->use_lock);
 
 	num = max(port, 0);
-	mutex_lock(&client->ports_mutex);
-	write_lock_irq(&client->ports_lock);
+	guard(mutex)(&client->ports_mutex);
+	guard(write_lock_irq)(&client->ports_lock);
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->addr.port == port) {
 			kfree(new_port);
-			num = -EBUSY;
-			goto unlock;
+			return -EBUSY;
 		}
 		if (p->addr.port > num)
 			break;
@@ -164,9 +160,6 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
 	new_port->addr.port = num;	/* store the port number in the port */
 	sprintf(new_port->name, "port-%d", num);
 	*port_ret = new_port;
- unlock:
-	write_unlock_irq(&client->ports_lock);
-	mutex_unlock(&client->ports_mutex);
 
 	return num;
 }
@@ -281,19 +274,18 @@ int snd_seq_delete_port(struct snd_seq_client *client, int port)
 {
 	struct snd_seq_client_port *found = NULL, *p;
 
-	mutex_lock(&client->ports_mutex);
-	write_lock_irq(&client->ports_lock);
-	list_for_each_entry(p, &client->ports_list_head, list) {
-		if (p->addr.port == port) {
-			/* ok found.  delete from the list at first */
-			list_del(&p->list);
-			client->num_ports--;
-			found = p;
-			break;
+	scoped_guard(mutex, &client->ports_mutex) {
+		guard(write_lock_irq)(&client->ports_lock);
+		list_for_each_entry(p, &client->ports_list_head, list) {
+			if (p->addr.port == port) {
+				/* ok found.  delete from the list at first */
+				list_del(&p->list);
+				client->num_ports--;
+				found = p;
+				break;
+			}
 		}
 	}
-	write_unlock_irq(&client->ports_lock);
-	mutex_unlock(&client->ports_mutex);
 	if (found)
 		return port_delete(client, found);
 	else
@@ -309,16 +301,16 @@ int snd_seq_delete_all_ports(struct snd_seq_client *client)
 	/* move the port list to deleted_list, and
 	 * clear the port list in the client data.
 	 */
-	mutex_lock(&client->ports_mutex);
-	write_lock_irq(&client->ports_lock);
-	if (! list_empty(&client->ports_list_head)) {
-		list_add(&deleted_list, &client->ports_list_head);
-		list_del_init(&client->ports_list_head);
-	} else {
-		INIT_LIST_HEAD(&deleted_list);
+	guard(mutex)(&client->ports_mutex);
+	scoped_guard(write_lock_irq, &client->ports_lock) {
+		if (!list_empty(&client->ports_list_head)) {
+			list_add(&deleted_list, &client->ports_list_head);
+			list_del_init(&client->ports_list_head);
+		} else {
+			INIT_LIST_HEAD(&deleted_list);
+		}
+		client->num_ports = 0;
 	}
-	client->num_ports = 0;
-	write_unlock_irq(&client->ports_lock);
 
 	/* remove each port in deleted_list */
 	list_for_each_entry_safe(port, tmp, &deleted_list, list) {
@@ -326,7 +318,6 @@ int snd_seq_delete_all_ports(struct snd_seq_client *client)
 		snd_seq_system_client_ev_port_exit(port->addr.client, port->addr.port);
 		port_delete(client, port);
 	}
-	mutex_unlock(&client->ports_mutex);
 	return 0;
 }
 
@@ -506,42 +497,37 @@ static int check_and_subscribe_port(struct snd_seq_client *client,
 	int err;
 
 	grp = is_src ? &port->c_src : &port->c_dest;
-	err = -EBUSY;
-	down_write(&grp->list_mutex);
+	guard(rwsem_write)(&grp->list_mutex);
 	if (exclusive) {
 		if (!list_empty(&grp->list_head))
-			goto __error;
+			return -EBUSY;
 	} else {
 		if (grp->exclusive)
-			goto __error;
+			return -EBUSY;
 		/* check whether already exists */
 		list_for_each(p, &grp->list_head) {
 			s = get_subscriber(p, is_src);
 			if (match_subs_info(&subs->info, &s->info))
-				goto __error;
+				return -EBUSY;
 		}
 	}
 
 	err = subscribe_port(client, port, grp, &subs->info, ack);
 	if (err < 0) {
 		grp->exclusive = 0;
-		goto __error;
+		return err;
 	}
 
 	/* add to list */
-	write_lock_irq(&grp->list_lock);
+	guard(write_lock_irq)(&grp->list_lock);
 	if (is_src)
 		list_add_tail(&subs->src_list, &grp->list_head);
 	else
 		list_add_tail(&subs->dest_list, &grp->list_head);
 	grp->exclusive = exclusive;
 	atomic_inc(&subs->ref_count);
-	write_unlock_irq(&grp->list_lock);
-	err = 0;
 
- __error:
-	up_write(&grp->list_mutex);
-	return err;
+	return 0;
 }
 
 /* called with grp->list_mutex held */
@@ -556,12 +542,12 @@ static void __delete_and_unsubscribe_port(struct snd_seq_client *client,
 
 	grp = is_src ? &port->c_src : &port->c_dest;
 	list = is_src ? &subs->src_list : &subs->dest_list;
-	write_lock_irq(&grp->list_lock);
-	empty = list_empty(list);
-	if (!empty)
-		list_del_init(list);
-	grp->exclusive = 0;
-	write_unlock_irq(&grp->list_lock);
+	scoped_guard(write_lock_irq, &grp->list_lock) {
+		empty = list_empty(list);
+		if (!empty)
+			list_del_init(list);
+		grp->exclusive = 0;
+	}
 
 	if (!empty)
 		unsubscribe_port(client, port, grp, &subs->info, ack);
@@ -575,9 +561,8 @@ static void delete_and_unsubscribe_port(struct snd_seq_client *client,
 	struct snd_seq_port_subs_info *grp;
 
 	grp = is_src ? &port->c_src : &port->c_dest;
-	down_write(&grp->list_mutex);
+	guard(rwsem_write)(&grp->list_mutex);
 	__delete_and_unsubscribe_port(client, port, subs, is_src, ack);
-	up_write(&grp->list_mutex);
 }
 
 /* connect two ports */
@@ -639,18 +624,18 @@ int snd_seq_port_disconnect(struct snd_seq_client *connector,
 	/* always start from deleting the dest port for avoiding concurrent
 	 * deletions
 	 */
-	down_write(&dest->list_mutex);
-	/* look for the connection */
-	list_for_each_entry(subs, &dest->list_head, dest_list) {
-		if (match_subs_info(info, &subs->info)) {
-			__delete_and_unsubscribe_port(dest_client, dest_port,
-						      subs, false,
-						      connector->number != dest_client->number);
-			err = 0;
-			break;
+	scoped_guard(rwsem_write, &dest->list_mutex) {
+		/* look for the connection */
+		list_for_each_entry(subs, &dest->list_head, dest_list) {
+			if (match_subs_info(info, &subs->info)) {
+				__delete_and_unsubscribe_port(dest_client, dest_port,
+							      subs, false,
+							      connector->number != dest_client->number);
+				err = 0;
+				break;
+			}
 		}
 	}
-	up_write(&dest->list_mutex);
 	if (err < 0)
 		return err;
 
@@ -669,7 +654,7 @@ int snd_seq_port_get_subscription(struct snd_seq_port_subs_info *src_grp,
 	struct snd_seq_subscribers *s;
 	int err = -ENOENT;
 
-	down_read(&src_grp->list_mutex);
+	guard(rwsem_read)(&src_grp->list_mutex);
 	list_for_each_entry(s, &src_grp->list_head, src_list) {
 		if (addr_match(dest_addr, &s->info.dest)) {
 			*subs = s->info;
@@ -677,7 +662,6 @@ int snd_seq_port_get_subscription(struct snd_seq_port_subs_info *src_grp,
 			break;
 		}
 	}
-	up_read(&src_grp->list_mutex);
 	return err;
 }
 
-- 
2.35.3

