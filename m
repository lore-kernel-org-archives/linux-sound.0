Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C322571BA
	for <linux-sound@vger.kernel.org>; Sun, 11 May 2025 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971134; cv=none; b=M+BIYaWdjYHQc4y48abLJuGFPH9f1xlLxq+A+Me99h5RV9MJX760riRz5dpO5ysbVbfThJjEcQcHSpZDDGcosmH4EYDjeno4oAVZVlwbQUNTQgGcbG+ad4y7DImFSIfJl8u4uJ5vvMVFjdY65zgeSyUiNor9AMJP70dBb1ixYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971134; c=relaxed/simple;
	bh=DR9T9bNbcvo6R7RFQz1efjqLgbNrYXT0SswZ88mOnsY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KR7JTeYwSpvsya7UIbM8ug/hTtN++XjVUe8Ty8NobVHYLdsWylUy31Y1Jg3+aI8lPJE/NOgn+W4ti8bckQHEzdqftnDqQbjZOEhGkPUyXY/2kv48bOHMVZITcHOPma76gLk6IRsWNwXL9L+jhUGS80YAN2x06UGfxavWFO8U0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ihuvvgav; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1BqhMyVW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ihuvvgav; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1BqhMyVW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihuvvgav";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BqhMyVW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihuvvgav";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BqhMyVW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBDA821170;
	Sun, 11 May 2025 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746971130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CKBjpeTCE6HOoFV2GftPNAcHRbeTA/NCwphpCJoIH3I=;
	b=ihuvvgav7wsODrFnO5ZbwC6hERIl/nMLSDxernilx58V9+MszWqAp7cqbev7LL+YDJOMqC
	NCrWHv8EwvnxmTypEEiWiLgLrK0jADpI/J2cuwM1Jnmur1eatuFRx5/LYexd2XFRwJZNTo
	brmLxiXrCMIHLwwC80dAW1Ue4ndQYAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746971130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CKBjpeTCE6HOoFV2GftPNAcHRbeTA/NCwphpCJoIH3I=;
	b=1BqhMyVW6C9geU/S9jOpzNBJTZX6IPKaYTO7PEt03qyvt5pgAbiRU7KW14lPbHk1XRN6GM
	VifJmJJlVcfz6wBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746971130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CKBjpeTCE6HOoFV2GftPNAcHRbeTA/NCwphpCJoIH3I=;
	b=ihuvvgav7wsODrFnO5ZbwC6hERIl/nMLSDxernilx58V9+MszWqAp7cqbev7LL+YDJOMqC
	NCrWHv8EwvnxmTypEEiWiLgLrK0jADpI/J2cuwM1Jnmur1eatuFRx5/LYexd2XFRwJZNTo
	brmLxiXrCMIHLwwC80dAW1Ue4ndQYAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746971130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CKBjpeTCE6HOoFV2GftPNAcHRbeTA/NCwphpCJoIH3I=;
	b=1BqhMyVW6C9geU/S9jOpzNBJTZX6IPKaYTO7PEt03qyvt5pgAbiRU7KW14lPbHk1XRN6GM
	VifJmJJlVcfz6wBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F37213690;
	Sun, 11 May 2025 13:45:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rpByJfqpIGi/ZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 13:45:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix delivery of UMP events to group ports
Date: Sun, 11 May 2025 15:45:27 +0200
Message-ID: <20250511134528.6314-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80

When an event with UMP message is sent to a UMP client, the EP port
receives always no matter where the event is sent to, as it's a
catch-all port.  OTOH, if an event is sent to EP port, and if the
event has a certain UMP Group, it should have been delivered to the
associated UMP Group port, too, but this was ignored, so far.

This patch addresses the behavior.  Now a UMP event sent to the
Endpoint port will be delivered to the subscribers of the UMP group
port the event is associated with.

The patch also does a bit of refactoring to simplify the code about
__deliver_to_subscribers().

Fixes: 177ccf811df4 ("ALSA: seq: Support MIDI 2.0 UMP Endpoint port")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c   | 52 ++++++++++++++++++++------------
 sound/core/seq/seq_ump_convert.c | 18 +++++++++++
 sound/core/seq/seq_ump_convert.h |  1 +
 3 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 198c598a5393..880240924bfd 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -732,15 +732,21 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
  */
 static int __deliver_to_subscribers(struct snd_seq_client *client,
 				    struct snd_seq_event *event,
-				    struct snd_seq_client_port *src_port,
-				    int atomic, int hop)
+				    int port, int atomic, int hop)
 {
+	struct snd_seq_client_port *src_port;
 	struct snd_seq_subscribers *subs;
 	int err, result = 0, num_ev = 0;
 	union __snd_seq_event event_saved;
 	size_t saved_size;
 	struct snd_seq_port_subs_info *grp;
 
+	if (port < 0)
+		return 0;
+	src_port = snd_seq_port_use_ptr(client, port);
+	if (!src_port)
+		return 0;
+
 	/* save original event record */
 	saved_size = snd_seq_event_packet_size(event);
 	memcpy(&event_saved, event, saved_size);
@@ -775,6 +781,7 @@ static int __deliver_to_subscribers(struct snd_seq_client *client,
 		read_unlock(&grp->list_lock);
 	else
 		up_read(&grp->list_mutex);
+	snd_seq_port_unlock(src_port);
 	memcpy(event, &event_saved, saved_size);
 	return (result < 0) ? result : num_ev;
 }
@@ -783,25 +790,32 @@ static int deliver_to_subscribers(struct snd_seq_client *client,
 				  struct snd_seq_event *event,
 				  int atomic, int hop)
 {
-	struct snd_seq_client_port *src_port;
-	int ret = 0, ret2;
+	int ret;
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
+	int ret2;
+#endif
 
-	src_port = snd_seq_port_use_ptr(client, event->source.port);
-	if (src_port) {
-		ret = __deliver_to_subscribers(client, event, src_port, atomic, hop);
-		snd_seq_port_unlock(src_port);
-	}
-
-	if (client->ump_endpoint_port < 0 ||
-	    event->source.port == client->ump_endpoint_port)
+	ret = __deliver_to_subscribers(client, event,
+				       event->source.port, atomic, hop);
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
+	if (!snd_seq_client_is_ump(client) || client->ump_endpoint_port < 0)
 		return ret;
-
-	src_port = snd_seq_port_use_ptr(client, client->ump_endpoint_port);
-	if (!src_port)
-		return ret;
-	ret2 = __deliver_to_subscribers(client, event, src_port, atomic, hop);
-	snd_seq_port_unlock(src_port);
-	return ret2 < 0 ? ret2 : ret;
+	/* If it's an event from EP port (and with a UMP group),
+	 * deliver to subscribers of the corresponding UMP group port, too.
+	 * Or, if it's from non-EP port, deliver to subscribers of EP port, too.
+	 */
+	if (event->source.port == client->ump_endpoint_port)
+		ret2 = __deliver_to_subscribers(client, event,
+						snd_seq_ump_group_port(event),
+						atomic, hop);
+	else
+		ret2 = __deliver_to_subscribers(client, event,
+						client->ump_endpoint_port,
+						atomic, hop);
+	if (ret2 < 0)
+		return ret2;
+#endif
+	return ret;
 }
 
 /* deliver an event to the destination port(s).
diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index ff7e558b4d51..db2f169cae11 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -1285,3 +1285,21 @@ int snd_seq_deliver_to_ump(struct snd_seq_client *source,
 	else
 		return cvt_to_ump_midi1(dest, dest_port, event, atomic, hop);
 }
+
+/* return the UMP group-port number of the event;
+ * return -1 if groupless or non-UMP event
+ */
+int snd_seq_ump_group_port(const struct snd_seq_event *event)
+{
+	const struct snd_seq_ump_event *ump_ev =
+		(const struct snd_seq_ump_event *)event;
+	unsigned char type;
+
+	if (!snd_seq_ev_is_ump(event))
+		return -1;
+	type = ump_message_type(ump_ev->ump[0]);
+	if (ump_is_groupless_msg(type))
+		return -1;
+	/* group-port number starts from 1 */
+	return ump_message_group(ump_ev->ump[0]) + 1;
+}
diff --git a/sound/core/seq/seq_ump_convert.h b/sound/core/seq/seq_ump_convert.h
index 6c146d803280..4abf0a7637d7 100644
--- a/sound/core/seq/seq_ump_convert.h
+++ b/sound/core/seq/seq_ump_convert.h
@@ -18,5 +18,6 @@ int snd_seq_deliver_to_ump(struct snd_seq_client *source,
 			   struct snd_seq_client_port *dest_port,
 			   struct snd_seq_event *event,
 			   int atomic, int hop);
+int snd_seq_ump_group_port(const struct snd_seq_event *event);
 
 #endif /* __SEQ_UMP_CONVERT_H */
-- 
2.49.0

