Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D8823F37D
	for <linux-sound@vger.kernel.org>; Sat,  1 Mar 2025 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829537; cv=none; b=jlPbdohjyvnN7kxZPDX3g1iQs0VneUXvgQT09ZxNQcDRLuCLIu3/vhwLwiaSzHVDH0lr2bmbYL/XgtPo4COVsjS6V41jMmwGd/TAL5FschfbCVpiUO3aZpo7bjZOakjSJUMdfOb+LgHDGmjKMPgiovLjaiVK9zd5b34RzTUDVTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829537; c=relaxed/simple;
	bh=A5vwjG1rplSUeq9jrUTFYk853fggwFWdraxqf+zEIJo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gE5frygRFgd7dcMvMJ4dnLhXTYCmkcZ4E9s9ieTM+3z69dOeSg7IaZbvWpOBACXnSaFtqhHagjwA6J8ZcQQuTFPIrtm8QcUIJEYV5NV8vhFxSyR3VFEDipokztKnxORFKLkQpyZTV88WrrviRNirQIfumhNy2HKFmkAMLUhQcmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c4R9+HgA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lq4JZbqR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NGxIU6Cs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ad/SRjoO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c4R9+HgA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lq4JZbqR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NGxIU6Cs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ad/SRjoO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8221621189;
	Sat,  1 Mar 2025 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740829533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HXI0AAvef/spWcKIqqlymDpOKnhgus+ZySrm22qvu2E=;
	b=c4R9+HgAbXOMHzhWzCzrVvMJVBL6EvRenJgPygjI0n+pBrRi9LMtUleH35q5A5qW3nXmu7
	x6RimkP3Zv9eUyRnO5QYE3by8q5WKOHJLlJiJzQuWKgM28tn4CYz+8NNtq/LLFTCiX1Rpb
	gqzzXLxJ3bGNoxv1DsVEVxIi8BAOgEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740829533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HXI0AAvef/spWcKIqqlymDpOKnhgus+ZySrm22qvu2E=;
	b=lq4JZbqRgVfnNGPxGqj3VsEarPJeUe4plXlldKGnf6i1ZvZc1nOIF2753sCIPciXCRZmBZ
	duAF8CBnMf+PuLBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NGxIU6Cs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ad/SRjoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740829532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HXI0AAvef/spWcKIqqlymDpOKnhgus+ZySrm22qvu2E=;
	b=NGxIU6Cs9LipvEixYXXFWB5pmFw00WalQ/UcHDoFurDnkjs+BaPKGMuc3G493wwExQNXYs
	Wk8uqbuRGpVQa1HQ2h3CQ22KjlQwyGCYWFefXkPA0/N7qZIEeALOc4b5l2BZ0IMR4U07kB
	9xxiR3qy1NTZEgz3idOH+r4H4QrWrBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740829532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HXI0AAvef/spWcKIqqlymDpOKnhgus+ZySrm22qvu2E=;
	b=ad/SRjoOuYkHL1np9C6j14kGui5VQR4JnNHDWtv8O+XjA+5MhzIUk3lOch/XCe3WW5kPc5
	rVRQCQKVk5tykkAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D93D13A53;
	Sat,  1 Mar 2025 11:45:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7te2FFzzwmerOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 01 Mar 2025 11:45:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Avoid module auto-load handling at event delivery
Date: Sat,  1 Mar 2025 12:45:29 +0100
Message-ID: <20250301114530.8975-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8221621189
X-Spam-Level: 
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

snd_seq_client_use_ptr() is supposed to return the snd_seq_client
object for the given client ID, and it tries to handle the module
auto-loading when no matching object is found.  Although the module
handling is performed only conditionally with "!in_interrupt()", this
condition may be fragile, e.g. when the code is called from the ALSA
timer callback where the spinlock is temporarily disabled while the
irq is disabled.  Then his doesn't fit well and spews the error about
sleep from invalid context, as complained recently by syzbot.

Also, in general, handling the module-loading at each time if no
matching object is found is really an overkill.  It can be still
useful when performed at the top-level ioctl or proc reads, but it
shouldn't be done at event delivery at all.

For addressing the issues above, this patch disables the module
handling in snd_seq_client_use_ptr() in normal cases like event
deliveries, but allow only in limited and safe situations.
A new function client_load_and_use_ptr() is used for the cases where
the module loading can be done safely, instead.

Reported-by: syzbot+4cb9fad083898f54c517@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/67c272e5.050a0220.dc10f.0159.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index cb66ec42a3f8..706f53e39b53 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -106,7 +106,7 @@ static struct snd_seq_client *clientptr(int clientid)
 	return clienttab[clientid];
 }
 
-struct snd_seq_client *snd_seq_client_use_ptr(int clientid)
+static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 {
 	unsigned long flags;
 	struct snd_seq_client *client;
@@ -126,7 +126,7 @@ struct snd_seq_client *snd_seq_client_use_ptr(int clientid)
 	}
 	spin_unlock_irqrestore(&clients_lock, flags);
 #ifdef CONFIG_MODULES
-	if (!in_interrupt()) {
+	if (load_module) {
 		static DECLARE_BITMAP(client_requested, SNDRV_SEQ_GLOBAL_CLIENTS);
 		static DECLARE_BITMAP(card_requested, SNDRV_CARDS);
 
@@ -168,6 +168,20 @@ struct snd_seq_client *snd_seq_client_use_ptr(int clientid)
 	return client;
 }
 
+/* get snd_seq_client object for the given id quickly */
+struct snd_seq_client *snd_seq_client_use_ptr(int clientid)
+{
+	return client_use_ptr(clientid, false);
+}
+
+/* get snd_seq_client object for the given id;
+ * if not found, retry after loading the modules
+ */
+static struct snd_seq_client *client_load_and_use_ptr(int clientid)
+{
+	return client_use_ptr(clientid, IS_ENABLED(CONFIG_MODULES));
+}
+
 /* Take refcount and perform ioctl_mutex lock on the given client;
  * used only for OSS sequencer
  * Unlock via snd_seq_client_ioctl_unlock() below
@@ -176,7 +190,7 @@ bool snd_seq_client_ioctl_lock(int clientid)
 {
 	struct snd_seq_client *client;
 
-	client = snd_seq_client_use_ptr(clientid);
+	client = client_load_and_use_ptr(clientid);
 	if (!client)
 		return false;
 	mutex_lock(&client->ioctl_mutex);
@@ -1195,7 +1209,7 @@ static int snd_seq_ioctl_running_mode(struct snd_seq_client *client, void  *arg)
 	int err = 0;
 
 	/* requested client number */
-	cptr = snd_seq_client_use_ptr(info->client);
+	cptr = client_load_and_use_ptr(info->client);
 	if (cptr == NULL)
 		return -ENOENT;		/* don't change !!! */
 
@@ -1257,7 +1271,7 @@ static int snd_seq_ioctl_get_client_info(struct snd_seq_client *client,
 	struct snd_seq_client *cptr;
 
 	/* requested client number */
-	cptr = snd_seq_client_use_ptr(client_info->client);
+	cptr = client_load_and_use_ptr(client_info->client);
 	if (cptr == NULL)
 		return -ENOENT;		/* don't change !!! */
 
@@ -1396,7 +1410,7 @@ static int snd_seq_ioctl_get_port_info(struct snd_seq_client *client, void *arg)
 	struct snd_seq_client *cptr;
 	struct snd_seq_client_port *port;
 
-	cptr = snd_seq_client_use_ptr(info->addr.client);
+	cptr = client_load_and_use_ptr(info->addr.client);
 	if (cptr == NULL)
 		return -ENXIO;
 
@@ -1503,10 +1517,10 @@ static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 	struct snd_seq_client *receiver = NULL, *sender = NULL;
 	struct snd_seq_client_port *sport = NULL, *dport = NULL;
 
-	receiver = snd_seq_client_use_ptr(subs->dest.client);
+	receiver = client_load_and_use_ptr(subs->dest.client);
 	if (!receiver)
 		goto __end;
-	sender = snd_seq_client_use_ptr(subs->sender.client);
+	sender = client_load_and_use_ptr(subs->sender.client);
 	if (!sender)
 		goto __end;
 	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
@@ -1871,7 +1885,7 @@ static int snd_seq_ioctl_get_client_pool(struct snd_seq_client *client,
 	struct snd_seq_client_pool *info = arg;
 	struct snd_seq_client *cptr;
 
-	cptr = snd_seq_client_use_ptr(info->client);
+	cptr = client_load_and_use_ptr(info->client);
 	if (cptr == NULL)
 		return -ENOENT;
 	memset(info, 0, sizeof(*info));
@@ -1975,7 +1989,7 @@ static int snd_seq_ioctl_get_subscription(struct snd_seq_client *client,
 	struct snd_seq_client_port *sport = NULL;
 
 	result = -EINVAL;
-	sender = snd_seq_client_use_ptr(subs->sender.client);
+	sender = client_load_and_use_ptr(subs->sender.client);
 	if (!sender)
 		goto __end;
 	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
@@ -2006,7 +2020,7 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 	struct list_head *p;
 	int i;
 
-	cptr = snd_seq_client_use_ptr(subs->root.client);
+	cptr = client_load_and_use_ptr(subs->root.client);
 	if (!cptr)
 		goto __end;
 	port = snd_seq_port_use_ptr(cptr, subs->root.port);
@@ -2073,7 +2087,7 @@ static int snd_seq_ioctl_query_next_client(struct snd_seq_client *client,
 	if (info->client < 0)
 		info->client = 0;
 	for (; info->client < SNDRV_SEQ_MAX_CLIENTS; info->client++) {
-		cptr = snd_seq_client_use_ptr(info->client);
+		cptr = client_load_and_use_ptr(info->client);
 		if (cptr)
 			break; /* found */
 	}
@@ -2096,7 +2110,7 @@ static int snd_seq_ioctl_query_next_port(struct snd_seq_client *client,
 	struct snd_seq_client *cptr;
 	struct snd_seq_client_port *port = NULL;
 
-	cptr = snd_seq_client_use_ptr(info->addr.client);
+	cptr = client_load_and_use_ptr(info->addr.client);
 	if (cptr == NULL)
 		return -ENXIO;
 
@@ -2193,7 +2207,7 @@ static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
 		size = sizeof(struct snd_ump_endpoint_info);
 	else
 		size = sizeof(struct snd_ump_block_info);
-	cptr = snd_seq_client_use_ptr(client);
+	cptr = client_load_and_use_ptr(client);
 	if (!cptr)
 		return -ENOENT;
 
@@ -2475,7 +2489,7 @@ int snd_seq_kernel_client_enqueue(int client, struct snd_seq_event *ev,
 	if (check_event_type_and_length(ev))
 		return -EINVAL;
 
-	cptr = snd_seq_client_use_ptr(client);
+	cptr = client_load_and_use_ptr(client);
 	if (cptr == NULL)
 		return -EINVAL;
 	
@@ -2707,7 +2721,7 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 
 	/* list the client table */
 	for (c = 0; c < SNDRV_SEQ_MAX_CLIENTS; c++) {
-		client = snd_seq_client_use_ptr(c);
+		client = client_load_and_use_ptr(c);
 		if (client == NULL)
 			continue;
 		if (client->type == NO_CLIENT) {
-- 
2.43.0

