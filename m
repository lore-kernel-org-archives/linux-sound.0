Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4640757A
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183785; cv=none; b=aVP069QSyHIJojxx9P8WlILVfztmaqjFmM4Lwa/bUe83RzhfgJe+VIC0d4Ex23bcc2mkTJLMcKt/Mm9J7yuW2AzpsildKfv3sn/RMCmjeh4d1kt7BxUs1TbxDgPTMVXgGTGWCqluh+66zGmln0nhfKU270fibP3/rbViDsbRnm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183785; c=relaxed/simple;
	bh=ilWsiyyxmNtpPjjdLggSR5iT/jNnegaTqWPHIA+B3lU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NahQ7WQWB5B2c+WvFf2NRU7vxg6GJpG+57m13k6X2DJuue6pTtm1rvfUTEdWRs0BFh/FzvvU8kuwjdF/poDd3o8bR/78/mZC68vp/HfAgBCcQAFDZK0dqImC3rVw4ThVYGUi5Si8LukIkWGcaphRCyUwLXoiKBodcIsVXaBpDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L32YI0XQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cmcX9oXZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L32YI0XQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cmcX9oXZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L32YI0XQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cmcX9oXZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L32YI0XQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cmcX9oXZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 156115DF56;
	Tue, 19 May 2026 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779183781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dujFgc0dP9GEu9BzcBR1N/SQScKg/s+HVWfBahuXfT0=;
	b=L32YI0XQgh/sr+Nef9PM9t+5+WxGrSAx5RUgSE2hd49gdtqDHYUeRzitgPd1KK+Rg5fyn/
	U/D5VazlJHBsGG5X4vngrMJCDiYVx6Zjabv246sGhPoZ7jhjKj0hgR1bm3+6Uwr0PcAc5n
	ttpZ/YjpZ0VbGGyGoPdezkDeylR4mKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779183781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dujFgc0dP9GEu9BzcBR1N/SQScKg/s+HVWfBahuXfT0=;
	b=cmcX9oXZ69eJcrut4hberHCmld6J0Yc0Ob7lLuIAeyibNTMqu1LKlVzvRxzdx7Ydezyqz9
	rLT9rS33YBiaHjBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779183781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dujFgc0dP9GEu9BzcBR1N/SQScKg/s+HVWfBahuXfT0=;
	b=L32YI0XQgh/sr+Nef9PM9t+5+WxGrSAx5RUgSE2hd49gdtqDHYUeRzitgPd1KK+Rg5fyn/
	U/D5VazlJHBsGG5X4vngrMJCDiYVx6Zjabv246sGhPoZ7jhjKj0hgR1bm3+6Uwr0PcAc5n
	ttpZ/YjpZ0VbGGyGoPdezkDeylR4mKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779183781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dujFgc0dP9GEu9BzcBR1N/SQScKg/s+HVWfBahuXfT0=;
	b=cmcX9oXZ69eJcrut4hberHCmld6J0Yc0Ob7lLuIAeyibNTMqu1LKlVzvRxzdx7Ydezyqz9
	rLT9rS33YBiaHjBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03E98593A8;
	Tue, 19 May 2026 09:43:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sPNFAKUwDGoWVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 09:43:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: seq: Register kernel port with full information
Date: Tue, 19 May 2026 11:42:52 +0200
Message-ID: <20260519094254.465041-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,sashiko.dev:url];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The current ALSA sequencer core tries to register the new kernel
sequencer port on the list at first, then fill up the port
information.  This means that user-space may sneak the wrong
information before the actual data is filled, which isn't ideal.
Although the user-space should try to query the port info after the
port registration notification is sent out, it'd be still better to
have a port available with the full info from the beginning.

This patch changes the sequencer port creation and registration
procedure; now split to two steps, for creation and insertion, and the
port is registered after the information is filled.

Link: https://sashiko.dev/#/patchset/20260518194023.1667857-1-maoyixie.tju%40gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c |  7 ++++++-
 sound/core/seq/seq_ports.c     | 24 ++++++++++++++++--------
 sound/core/seq/seq_ports.h     |  8 ++++++--
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 5719637575a9..19d6fea012f6 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1287,7 +1287,7 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 		port_idx = -1;
 	if (port_idx >= SNDRV_SEQ_ADDRESS_UNKNOWN)
 		return -EINVAL;
-	err = snd_seq_create_port(client, port_idx, &port);
+	err = snd_seq_create_port(client, &port);
 	if (err < 0)
 		return err;
 
@@ -1309,6 +1309,11 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 	info->addr = port->addr;
 
 	snd_seq_set_port_info(port, info);
+	err = snd_seq_insert_port(client, port_idx, port);
+	if (err < 0) {
+		kfree(port);
+		return err;
+	}
 	if (info->capability & SNDRV_SEQ_PORT_CAP_UMP_ENDPOINT)
 		client->ump_endpoint_port = port->addr.port;
 	snd_seq_system_client_ev_port_start(port->addr.client, port->addr.port);
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 31ab4681c601..17daacd4476a 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -108,14 +108,13 @@ static void port_subs_info_init(struct snd_seq_port_subs_info *grp)
 }
 
 
-/* create a port, port number or a negative error code is returned
+/* create a port, 0 on success or a negative error code is returned
  * the caller needs to unref the port via snd_seq_port_unlock() appropriately
  */
-int snd_seq_create_port(struct snd_seq_client *client, int port,
+int snd_seq_create_port(struct snd_seq_client *client,
 			struct snd_seq_client_port **port_ret)
 {
-	struct snd_seq_client_port *new_port, *p;
-	int num;
+	struct snd_seq_client_port *new_port;
 	
 	*port_ret = NULL;
 
@@ -141,15 +140,25 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
 	port_subs_info_init(&new_port->c_dest);
 	snd_use_lock_use(&new_port->use_lock);
 
+	*port_ret = new_port;
+
+	return 0;
+}
+
+/* insert the port; return the port address or a negative error code */
+int snd_seq_insert_port(struct snd_seq_client *client, int port,
+			struct snd_seq_client_port *new_port)
+{
+	struct snd_seq_client_port *p;
+	int num;
+
 	num = max(port, 0);
 	guard(mutex)(&client->ports_mutex);
 	guard(write_lock_irq)(&client->ports_lock);
 	struct list_head *insert_before = &client->ports_list_head;
 	list_for_each_entry(p, &client->ports_list_head, list) {
-		if (p->addr.port == port) {
-			kfree(new_port);
+		if (p->addr.port == port)
 			return -EBUSY;
-		}
 		if (p->addr.port > num) {
 			insert_before = &p->list;
 			break;
@@ -162,7 +171,6 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
 	client->num_ports++;
 	new_port->addr.port = num;	/* store the port number in the port */
 	sprintf(new_port->name, "port-%d", num);
-	*port_ret = new_port;
 
 	return num;
 }
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index 40ed6cf7cb90..b689c0f4867c 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -98,10 +98,14 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 
 DEFINE_FREE(snd_seq_port, struct snd_seq_client_port *, if (!IS_ERR_OR_NULL(_T)) snd_seq_port_unlock(_T))
 
-/* create a port, port number or a negative error code is returned */
-int snd_seq_create_port(struct snd_seq_client *client, int port_index,
+/* create a port, 0 on success or a negative error code is returned */
+int snd_seq_create_port(struct snd_seq_client *client,
 			struct snd_seq_client_port **port_ret);
 
+/* insert the port; return the port address or a negative error code */
+int snd_seq_insert_port(struct snd_seq_client *client, int port,
+			struct snd_seq_client_port *new_port);
+
 /* delete a port */
 int snd_seq_delete_port(struct snd_seq_client *client, int port);
 
-- 
2.54.0

