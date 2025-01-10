Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D21211A39
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524792; cv=none; b=qDE9ESRMKJQq6Z3XOmbnpRF4c8SkGjHNnO2qBzwbP7Sq34QaSBCtIvdbQWz7CsKvKsliGyjj8nq5wCVN+WLSQ1/H4mF9BEkFoDoFrUhVLWAESZu2ky1HsALmBeQGSrxQ2mmcIPeXruS7aKscf7wIoE8+vl8GE2awVgUDoYNerrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524792; c=relaxed/simple;
	bh=uqeLuyYI5Agx29ZtHuXFMaK/fmBLupw0kAa0zoxFvS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUyMPSUsH6uE1dPXnIGvdjHtFGOi+ZKq5ZT1mdLoy0yoii1m7urqOAIDi8WSR0h5sWG/X6KbDj9qDy04/nJ+fcJd48/Hf+6SrcBCprwFtqEFeQCAM0SIrJ1nWBUGvUA6bAc015B0EszG35EcQSW9hTdZzdBtPaTQrLNiSdrWV9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FWXDzSUK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5wXMhn1L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FWXDzSUK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5wXMhn1L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FWXDzSUK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5wXMhn1L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FWXDzSUK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5wXMhn1L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86A021F37C;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77LmzW1KSFAvb55Y0IQ9XjbY7G6MqnWat02urX5QZ0s=;
	b=FWXDzSUKGcNTg3s9c+uhGgSVkCkK+s9rmT2bWuH7g/UnUQLWBaPtfbl2VYVHgmkKVe1tTX
	lctlx2PICxJx7IIzdkTJMq25v6ywLygIfFHjuDEI6aJTnQm/UxPTyxqXPZGWYUStAFEprk
	mRw3TqNDdXzCEI7bP3vDS7GUNeEzdOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77LmzW1KSFAvb55Y0IQ9XjbY7G6MqnWat02urX5QZ0s=;
	b=5wXMhn1LRH/s/uctIIxiKXmbEfL8JmQFfOiVRipuYwJ32/kVFwGAk0em9ITbOP4U+lPl1B
	Yx3Ume9kKrQji4Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77LmzW1KSFAvb55Y0IQ9XjbY7G6MqnWat02urX5QZ0s=;
	b=FWXDzSUKGcNTg3s9c+uhGgSVkCkK+s9rmT2bWuH7g/UnUQLWBaPtfbl2VYVHgmkKVe1tTX
	lctlx2PICxJx7IIzdkTJMq25v6ywLygIfFHjuDEI6aJTnQm/UxPTyxqXPZGWYUStAFEprk
	mRw3TqNDdXzCEI7bP3vDS7GUNeEzdOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77LmzW1KSFAvb55Y0IQ9XjbY7G6MqnWat02urX5QZ0s=;
	b=5wXMhn1LRH/s/uctIIxiKXmbEfL8JmQFfOiVRipuYwJ32/kVFwGAk0em9ITbOP4U+lPl1B
	Yx3Ume9kKrQji4Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E3AD13A86;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KOCDGfRDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 7/8] ALSA: seq: Allow system notification in atomic
Date: Fri, 10 Jan 2025 16:59:40 +0100
Message-ID: <20250110155943.31578-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110155943.31578-1-tiwai@suse.de>
References: <20250110155943.31578-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Currently the system notification helper assumes only the non-atomic
delivery.  For allowing an event delivery in non-atomic context, add
the atomic flag to the helper function.

This is a preliminary change for the support of UMP EP/FB
notification.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c |  2 +-
 sound/core/seq/seq_system.c    |  9 +++++----
 sound/core/seq/seq_system.h    | 21 +++++++++++++--------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index fe2d7f901610..3d27f777f29e 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1476,7 +1476,7 @@ int snd_seq_client_notify_subscription(int client, int port,
 	event.data.connect.dest = info->dest;
 	event.data.connect.sender = info->sender;
 
-	return snd_seq_system_notify(client, port, &event);  /* non-atomic */
+	return snd_seq_system_notify(client, port, &event, false);  /* non-atomic */
 }
 
 
diff --git a/sound/core/seq/seq_system.c b/sound/core/seq/seq_system.c
index 37edcc3881ed..853920f79016 100644
--- a/sound/core/seq/seq_system.c
+++ b/sound/core/seq/seq_system.c
@@ -78,26 +78,27 @@ static int setheader(struct snd_seq_event * ev, int client, int port)
 
 
 /* entry points for broadcasting system events */
-void snd_seq_system_broadcast(int client, int port, int type)
+void snd_seq_system_broadcast(int client, int port, int type, bool atomic)
 {
 	struct snd_seq_event ev;
 	
 	if (setheader(&ev, client, port) < 0)
 		return;
 	ev.type = type;
-	snd_seq_kernel_client_dispatch(sysclient, &ev, 0, 0);
+	snd_seq_kernel_client_dispatch(sysclient, &ev, atomic, 0);
 }
 EXPORT_SYMBOL_GPL(snd_seq_system_broadcast);
 
 /* entry points for broadcasting system events */
-int snd_seq_system_notify(int client, int port, struct snd_seq_event *ev)
+int snd_seq_system_notify(int client, int port, struct snd_seq_event *ev,
+			  bool atomic)
 {
 	ev->flags = SNDRV_SEQ_EVENT_LENGTH_FIXED;
 	ev->source.client = sysclient;
 	ev->source.port = announce_port;
 	ev->dest.client = client;
 	ev->dest.port = port;
-	return snd_seq_kernel_client_dispatch(sysclient, ev, 0, 0);
+	return snd_seq_kernel_client_dispatch(sysclient, ev, atomic, 0);
 }
 
 /* call-back handler for timer events */
diff --git a/sound/core/seq/seq_system.h b/sound/core/seq/seq_system.h
index 4fe88ad40346..a118f7252b62 100644
--- a/sound/core/seq/seq_system.h
+++ b/sound/core/seq/seq_system.h
@@ -10,16 +10,21 @@
 
 
 /* entry points for broadcasting system events */
-void snd_seq_system_broadcast(int client, int port, int type);
+void snd_seq_system_broadcast(int client, int port, int type, bool atomic);
 
-#define snd_seq_system_client_ev_client_start(client) snd_seq_system_broadcast(client, 0, SNDRV_SEQ_EVENT_CLIENT_START)
-#define snd_seq_system_client_ev_client_exit(client) snd_seq_system_broadcast(client, 0, SNDRV_SEQ_EVENT_CLIENT_EXIT)
-#define snd_seq_system_client_ev_client_change(client) snd_seq_system_broadcast(client, 0, SNDRV_SEQ_EVENT_CLIENT_CHANGE)
-#define snd_seq_system_client_ev_port_start(client, port) snd_seq_system_broadcast(client, port, SNDRV_SEQ_EVENT_PORT_START)
-#define snd_seq_system_client_ev_port_exit(client, port) snd_seq_system_broadcast(client, port, SNDRV_SEQ_EVENT_PORT_EXIT)
-#define snd_seq_system_client_ev_port_change(client, port) snd_seq_system_broadcast(client, port, SNDRV_SEQ_EVENT_PORT_CHANGE)
+/* normal system notification event broadcast */
+#define notify_event(client, port, type) \
+	snd_seq_system_broadcast(client, port, type, false)
 
-int snd_seq_system_notify(int client, int port, struct snd_seq_event *ev);
+#define snd_seq_system_client_ev_client_start(client) notify_event(client, 0, SNDRV_SEQ_EVENT_CLIENT_START)
+#define snd_seq_system_client_ev_client_exit(client) notify_event(client, 0, SNDRV_SEQ_EVENT_CLIENT_EXIT)
+#define snd_seq_system_client_ev_client_change(client) notify_event(client, 0, SNDRV_SEQ_EVENT_CLIENT_CHANGE)
+#define snd_seq_system_client_ev_port_start(client, port) notify_event(client, port, SNDRV_SEQ_EVENT_PORT_START)
+#define snd_seq_system_client_ev_port_exit(client, port) notify_event(client, port, SNDRV_SEQ_EVENT_PORT_EXIT)
+#define snd_seq_system_client_ev_port_change(client, port) notify_event(client, port, SNDRV_SEQ_EVENT_PORT_CHANGE)
+
+int snd_seq_system_notify(int client, int port, struct snd_seq_event *ev,
+			  bool atomic);
 
 /* register our internal client */
 int snd_seq_system_client_init(void);
-- 
2.43.0

