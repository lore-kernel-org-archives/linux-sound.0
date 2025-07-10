Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314242D59E1
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142074; cv=none; b=kgxavIQtuJFX42Le5WQhG58EmQ4trxOlOE5B9WYxQcVkG188Icm88EAu6CuO6iCW9nQJNlpRi1DZWDdAKO4u2xpO/Do38v7l0RQXLxV3Ab/jpuW8Sauw2+Wh8rIEQn2oz2uMjJWzhCMVBsP4WY2/cbk1+VyNe0LvIjeIcoibdac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142074; c=relaxed/simple;
	bh=e1Ewv+KpKEaZD9GSuLghsYfawjZToPp9e9wiQXDucdY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXW8IufR0Wqfan1HlFcr4j1EQwpRW52WwduhPqkNRV5Rp/JYqbuhoGBYPlm/AAnQl2qMwhZgXu5BXsY5hQyDFMVPAlL0dJxkVzLw6yxVZP6rd2VwaemswpqMReqYAHORvZd5tnMWCdqkKHZDv4qdmK+FWGMrAtc6sFI8i0+PkBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KvyKYbwW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xuoUfyax; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KvyKYbwW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xuoUfyax; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KvyKYbwW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xuoUfyax";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KvyKYbwW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xuoUfyax"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 232BC21175;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dg+pyvEfS+anFbzFMXSShwDLqJXKeeB4tqzP1CTox6c=;
	b=KvyKYbwWACY/vDwEHWhq/HNlvBPJsdgJ6mFO2keXKAvSQRNhqYYiOvyEBme4Gxx3zHtjwU
	jHajvlhynOOZd5d8FtRs8ndW/kXM8smT/LyoNxU0eK7dxsqQrFm2CNlEPINvEOZE5w8cZw
	8E9dTmohJXLFDlvr6J4GKBJY8kQrRwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dg+pyvEfS+anFbzFMXSShwDLqJXKeeB4tqzP1CTox6c=;
	b=xuoUfyaxyKMIUbKZfBzWr/ADJS85TnQIKhFGIyWaTqwqFuqXyfkphc1N0/43XcZh3qKSo3
	ZVAmDHThTwktTeDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KvyKYbwW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xuoUfyax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dg+pyvEfS+anFbzFMXSShwDLqJXKeeB4tqzP1CTox6c=;
	b=KvyKYbwWACY/vDwEHWhq/HNlvBPJsdgJ6mFO2keXKAvSQRNhqYYiOvyEBme4Gxx3zHtjwU
	jHajvlhynOOZd5d8FtRs8ndW/kXM8smT/LyoNxU0eK7dxsqQrFm2CNlEPINvEOZE5w8cZw
	8E9dTmohJXLFDlvr6J4GKBJY8kQrRwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dg+pyvEfS+anFbzFMXSShwDLqJXKeeB4tqzP1CTox6c=;
	b=xuoUfyaxyKMIUbKZfBzWr/ADJS85TnQIKhFGIyWaTqwqFuqXyfkphc1N0/43XcZh3qKSo3
	ZVAmDHThTwktTeDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 089DB13A70;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iBC8AOmQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 003/103] ALSA: seq: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:45 +0200
Message-ID: <20250710100727.22653-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 232BC21175
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_init.c | 4 ++--
 sound/core/seq/seq_clientmgr.c    | 2 +-
 sound/core/seq/seq_midi.c         | 2 +-
 sound/core/seq/seq_system.c       | 4 ++--
 sound/core/seq/seq_ump_client.c   | 2 +-
 sound/core/seq/seq_virmidi.c      | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index e6d7d83ed0e7..973f057eb731 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -79,7 +79,7 @@ snd_seq_oss_create_client(void)
 	system_client = rc;
 
 	/* create announcement receiver port */
-	strcpy(port->name, "Receiver");
+	strscpy(port->name, "Receiver");
 	port->addr.client = system_client;
 	port->capability = SNDRV_SEQ_PORT_CAP_WRITE; /* receive only */
 	port->type = 0;
@@ -347,7 +347,7 @@ alloc_seq_queue(struct seq_oss_devinfo *dp)
 	memset(&qinfo, 0, sizeof(qinfo));
 	qinfo.owner = system_client;
 	qinfo.locked = 1;
-	strcpy(qinfo.name, "OSS Sequencer Emulation");
+	strscpy(qinfo.name, "OSS Sequencer Emulation");
 	rc = call_ctl(SNDRV_SEQ_IOCTL_CREATE_QUEUE, &qinfo);
 	if (rc < 0)
 		return rc;
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 880240924bfd..aa9c956d2581 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1256,7 +1256,7 @@ static void get_client_info(struct snd_seq_client *cptr,
 
 	/* fill the info fields */
 	info->type = cptr->type;
-	strcpy(info->name, cptr->name);
+	strscpy(info->name, cptr->name);
 	info->filter = cptr->filter;
 	info->event_lost = cptr->event_lost;
 	memcpy(info->event_filter, cptr->event_filter, 32);
diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index ba52a77eda38..581e138a3115 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -344,7 +344,7 @@ snd_seq_midisynth_probe(struct device *_dev)
 			info->stream = SNDRV_RAWMIDI_STREAM_INPUT;
 		info->subdevice = p;
 		if (snd_rawmidi_info_select(card, info) >= 0)
-			strcpy(port->name, info->subname);
+			strscpy(port->name, info->subname);
 		if (! port->name[0]) {
 			if (info->name[0]) {
 				if (ports > 1)
diff --git a/sound/core/seq/seq_system.c b/sound/core/seq/seq_system.c
index 853920f79016..5b5603e5970b 100644
--- a/sound/core/seq/seq_system.c
+++ b/sound/core/seq/seq_system.c
@@ -146,7 +146,7 @@ int __init snd_seq_system_client_init(void)
 	}
 
 	/* register timer */
-	strcpy(port->name, "Timer");
+	strscpy(port->name, "Timer");
 	port->capability = SNDRV_SEQ_PORT_CAP_WRITE; /* accept queue control */
 	port->capability |= SNDRV_SEQ_PORT_CAP_READ|SNDRV_SEQ_PORT_CAP_SUBS_READ; /* for broadcast */
 	port->kernel = &pcallbacks;
@@ -160,7 +160,7 @@ int __init snd_seq_system_client_init(void)
 		goto error_port;
 
 	/* register announcement port */
-	strcpy(port->name, "Announce");
+	strscpy(port->name, "Announce");
 	port->capability = SNDRV_SEQ_PORT_CAP_READ|SNDRV_SEQ_PORT_CAP_SUBS_READ; /* for broadcast only */
 	pcallbacks.event_input = NULL;
 	pcallbacks.subscribe = sys_announce_subscribe;
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 1255351b59ce..27247babb16d 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -310,7 +310,7 @@ static int create_ump_endpoint_port(struct seq_ump_client *client)
 		SNDRV_SEQ_PORT_TYPE_HARDWARE |
 		SNDRV_SEQ_PORT_TYPE_PORT;
 	port->midi_channels = 16;
-	strcpy(port->name, "MIDI 2.0");
+	strscpy(port->name, "MIDI 2.0");
 	memset(&pcallbacks, 0, sizeof(pcallbacks));
 	pcallbacks.owner = THIS_MODULE;
 	pcallbacks.private_data = client;
diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index b4672613c261..9e7fd4993a10 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -497,7 +497,7 @@ int snd_virmidi_new(struct snd_card *card, int device, struct snd_rawmidi **rrmi
 			      &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, rmidi->id);
+	strscpy(rmidi->name, rmidi->id);
 	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
 	if (rdev == NULL) {
 		snd_device_free(card, rmidi);
-- 
2.50.0

