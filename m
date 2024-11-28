Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95683CC1
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732780086; cv=none; b=Dk6eXIjC2Tpp1oucby1XAdpCXxXs7YfxPX2bFc4EpMAkDv8Lb4YYVVwNQLiQ/JuvpuldvmUCjGo60b36pGBIzvnymuak6VRWhs4sBBq0E9H18wGoBQkD4QXMhgy5Dz20wUa5et5lkVobV0AL5YF1XETUc7LBXBg8U+ghyzOxUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732780086; c=relaxed/simple;
	bh=hhF2sEEcj8DZOu+xpD4pzyKVaSGWWbQnzlSsRP4zJ3s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=K5+HzQ/EmK0V0eIyCII+bj4ReoOFk5MTVXfpiQOnh0MyXCNJ14s960dt9gRVSD9MIDNBwmWvB2JxwHHfJGweD3SWdksArv+LZOyXCGWubSb5g0rUbFi/K5Fqk3GsQvrbafQnwKguYtXhiFQVdWRiiSxdamlWEV5Q48Ur7efRLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R9vdjIlI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zKxrOgKv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R9vdjIlI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zKxrOgKv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R9vdjIlI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zKxrOgKv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R9vdjIlI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zKxrOgKv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A75211F44F;
	Thu, 28 Nov 2024 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732780082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cxjp4HjQZ9gCnlxmYc81GUfG4xQ5vdnXPcTszZ514sk=;
	b=R9vdjIlIfbnkfq8H5WWNNzqwloGZR/FJIKHGtTgs9dPC8AlgYc0/yAJkiYB1LqgzwCXDr9
	fLEd/woGu1hFnZ/v3z6UMob9Tz25YActJVmau2RMt7DLE2QYYZncOzK1oG3DFSR/7FghFZ
	LLMWhEYiPDpcd4cIjXi+6Th+Ix7COtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732780082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cxjp4HjQZ9gCnlxmYc81GUfG4xQ5vdnXPcTszZ514sk=;
	b=zKxrOgKvoZUVvqPmJaNhkP77rLJ/MwKjZRV2p+vJrJB9FZ4HxFoe+5EhF55ttQvcmhqQIi
	lctp/i0Cl4L6BOCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R9vdjIlI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zKxrOgKv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732780082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cxjp4HjQZ9gCnlxmYc81GUfG4xQ5vdnXPcTszZ514sk=;
	b=R9vdjIlIfbnkfq8H5WWNNzqwloGZR/FJIKHGtTgs9dPC8AlgYc0/yAJkiYB1LqgzwCXDr9
	fLEd/woGu1hFnZ/v3z6UMob9Tz25YActJVmau2RMt7DLE2QYYZncOzK1oG3DFSR/7FghFZ
	LLMWhEYiPDpcd4cIjXi+6Th+Ix7COtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732780082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cxjp4HjQZ9gCnlxmYc81GUfG4xQ5vdnXPcTszZ514sk=;
	b=zKxrOgKvoZUVvqPmJaNhkP77rLJ/MwKjZRV2p+vJrJB9FZ4HxFoe+5EhF55ttQvcmhqQIi
	lctp/i0Cl4L6BOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B76413690;
	Thu, 28 Nov 2024 07:48:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u/ytIDIgSGdNGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 07:48:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Skip notifications unless subscribed to announce port
Date: Thu, 28 Nov 2024 08:48:00 +0100
Message-ID: <20241128074801.32253-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A75211F44F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The notification via system announce port isn't a lightweight task,
hence it'd be better to skip if there is no subscription is done for
the announce port.  Implement a simple counter for checking that by
hooking the subscribe and unsubscribe callbacks.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_system.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_system.c b/sound/core/seq/seq_system.c
index 80267290190d..37edcc3881ed 100644
--- a/sound/core/seq/seq_system.c
+++ b/sound/core/seq/seq_system.c
@@ -49,12 +49,14 @@ static int sysclient = -1;
 /* port id numbers for this client */
 static int announce_port = -1;
 
+/* number of subscriptions to announce port */
+static int announce_subscribed;
 
 
 /* fill standard header data, source port & channel are filled in */
 static int setheader(struct snd_seq_event * ev, int client, int port)
 {
-	if (announce_port < 0)
+	if (announce_port < 0 || !announce_subscribed)
 		return -ENODEV;
 
 	memset(ev, 0, sizeof(struct snd_seq_event));
@@ -104,6 +106,22 @@ static int event_input_timer(struct snd_seq_event * ev, int direct, void *privat
 	return snd_seq_control_queue(ev, atomic, hop);
 }
 
+static int sys_announce_subscribe(void *private_data,
+				  struct snd_seq_port_subscribe *info)
+{
+	announce_subscribed++;
+	return 0;
+}
+
+static int sys_announce_unsubscribe(void *private_data,
+				    struct snd_seq_port_subscribe *info)
+{
+	if (snd_BUG_ON(!announce_subscribed))
+		return 0;
+	announce_subscribed--;
+	return 0;
+}
+
 /* register our internal client */
 int __init snd_seq_system_client_init(void)
 {
@@ -143,7 +161,10 @@ int __init snd_seq_system_client_init(void)
 	/* register announcement port */
 	strcpy(port->name, "Announce");
 	port->capability = SNDRV_SEQ_PORT_CAP_READ|SNDRV_SEQ_PORT_CAP_SUBS_READ; /* for broadcast only */
-	port->kernel = NULL;
+	pcallbacks.event_input = NULL;
+	pcallbacks.subscribe = sys_announce_subscribe;
+	pcallbacks.unsubscribe = sys_announce_unsubscribe;
+	port->kernel = &pcallbacks;
 	port->type = 0;
 	port->flags = SNDRV_SEQ_PORT_FLG_GIVEN_PORT;
 	port->addr.client = sysclient;
-- 
2.43.0

