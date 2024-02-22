Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF6405E6
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=MDDp+XhrlS8i+aymIi4RQbO1wijxrbPHEs0NKYDAFc2UvzUk5619qT4NBqjjXvvp/+LpeCAZkh35FkRkHltZA1yagJJrR6H/O/0Z7XWOtMQbKRc4ehM8QeLISBwP9Mh1+LsMSTmu62iOrVTD84bUpW9FVJkVNlAJtHbDABTJVKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=8CkDN82akGdxLTl+vfmbIaaKOblQA+dwpYvPiy2iCwA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XXisBL9u0yD0snheE0cdm06StVEVHYevhhrQIe+bIHCr4rTtk6C21iUloqIpFM1jgZlszoi8UJc6hJkZQF+l/0YIEs0CxAi0iDipgEmOgoX87/UBpCJ/1m3SrqCItPCCVEEAu3QMBV9+i6ECkojaf8qVXGD4DgujkSbyziCfXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dyBtP1gF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UF5QS/vj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dyBtP1gF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UF5QS/vj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dyBtP1gF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UF5QS/vj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dyBtP1gF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UF5QS/vj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 502281FB9E;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODUQN77aEGIez2pog7TizuiSf/jRfmfFLaGd6uZ0/Yc=;
	b=dyBtP1gFnw7nqlttxRmlmtN5QwIHRGrs4oI8k5tgWbIu9gnHKP2jszU9+yNnUhmLFJOMgU
	6oHmngJwrJ/pyOqLRjNs1kcFB/WgJ3AGfl5HXV/Aw3G0rSIg3pnWEJRLViDZY2cSRoImVY
	n9eCqIadlACtP4MDR7/7fCknXW5Kr98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODUQN77aEGIez2pog7TizuiSf/jRfmfFLaGd6uZ0/Yc=;
	b=UF5QS/vjZ3B+AkeTkJ5AZ2VZtFinn6oaXmeGrb/J8sDRkBMrfR1hCmm9fHxgRNmv/vq1Sv
	QzHui8wPIdEyE/Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODUQN77aEGIez2pog7TizuiSf/jRfmfFLaGd6uZ0/Yc=;
	b=dyBtP1gFnw7nqlttxRmlmtN5QwIHRGrs4oI8k5tgWbIu9gnHKP2jszU9+yNnUhmLFJOMgU
	6oHmngJwrJ/pyOqLRjNs1kcFB/WgJ3AGfl5HXV/Aw3G0rSIg3pnWEJRLViDZY2cSRoImVY
	n9eCqIadlACtP4MDR7/7fCknXW5Kr98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODUQN77aEGIez2pog7TizuiSf/jRfmfFLaGd6uZ0/Yc=;
	b=UF5QS/vjZ3B+AkeTkJ5AZ2VZtFinn6oaXmeGrb/J8sDRkBMrfR1hCmm9fHxgRNmv/vq1Sv
	QzHui8wPIdEyE/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3826113ADA;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +DKHDMQs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 8/9] ALSA: seq: ump: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:08 +0100
Message-Id: <20240222111509.28390-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 2db371d79930..ccac2d3a9fbc 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -217,15 +217,12 @@ static void fill_port_info(struct snd_seq_port_info *port,
 static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 {
 	struct seq_ump_group *group = &client->groups[group_index];
-	struct snd_seq_port_info *port;
+	struct snd_seq_port_info *port __free(kfree) = NULL;
 	struct snd_seq_port_callback pcallbacks;
-	int err;
 
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
-	if (!port) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!port)
+		return -ENOMEM;
 
 	fill_port_info(port, client, group);
 	port->flags = SNDRV_SEQ_PORT_FLG_GIVEN_PORT;
@@ -238,24 +235,22 @@ static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 	pcallbacks.unuse = seq_ump_unuse;
 	pcallbacks.event_input = seq_ump_process_event;
 	port->kernel = &pcallbacks;
-	err = snd_seq_kernel_client_ctl(client->seq_client,
-					SNDRV_SEQ_IOCTL_CREATE_PORT,
-					port);
- error:
-	kfree(port);
-	return err;
+	return snd_seq_kernel_client_ctl(client->seq_client,
+					 SNDRV_SEQ_IOCTL_CREATE_PORT,
+					 port);
 }
 
 /* update the sequencer ports; called from notify_fb_change callback */
 static void update_port_infos(struct seq_ump_client *client)
 {
-	struct snd_seq_port_info *old, *new;
+	struct snd_seq_port_info *old __free(kfree) = NULL;
+	struct snd_seq_port_info *new __free(kfree) = NULL;
 	int i, err;
 
 	old = kzalloc(sizeof(*old), GFP_KERNEL);
 	new = kzalloc(sizeof(*new), GFP_KERNEL);
 	if (!old || !new)
-		goto error;
+		return;
 
 	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++) {
 		old->addr.client = client->seq_client;
@@ -264,7 +259,7 @@ static void update_port_infos(struct seq_ump_client *client)
 						SNDRV_SEQ_IOCTL_GET_PORT_INFO,
 						old);
 		if (err < 0)
-			goto error;
+			return;
 		fill_port_info(new, client, &client->groups[i]);
 		if (old->capability == new->capability &&
 		    !strcmp(old->name, new->name))
@@ -273,13 +268,10 @@ static void update_port_infos(struct seq_ump_client *client)
 						SNDRV_SEQ_IOCTL_SET_PORT_INFO,
 						new);
 		if (err < 0)
-			goto error;
+			return;
 		/* notify to system port */
 		snd_seq_system_client_ev_port_change(client->seq_client, i);
 	}
- error:
-	kfree(new);
-	kfree(old);
 }
 
 /* update dir_bits and active flag for all groups in the client */
@@ -334,7 +326,7 @@ static void update_group_attrs(struct seq_ump_client *client)
 /* create a UMP Endpoint port */
 static int create_ump_endpoint_port(struct seq_ump_client *client)
 {
-	struct snd_seq_port_info *port;
+	struct snd_seq_port_info *port __free(kfree) = NULL;
 	struct snd_seq_port_callback pcallbacks;
 	unsigned int rawmidi_info = client->ump->core.info_flags;
 	int err;
@@ -383,7 +375,6 @@ static int create_ump_endpoint_port(struct seq_ump_client *client)
 	err = snd_seq_kernel_client_ctl(client->seq_client,
 					SNDRV_SEQ_IOCTL_CREATE_PORT,
 					port);
-	kfree(port);
 	return err;
 }
 
-- 
2.35.3

