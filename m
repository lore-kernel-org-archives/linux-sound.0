Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3481135A56
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024009; cv=none; b=JvKNbN27Ec+LriBCg5/J3izOcTGOs3GwePr1qjcg3VpLj/fMHK5EjWmkVNQDjUgJ7Gyzvu9g596wXCbCyVtLkBOEWuybujtP7dgYCDvab1NWCNOUzT7xkLqxCR+hgbB8sRIeigt+yueLLjhOUzZ4dogTwK76scVw0GmOkqIpvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024009; c=relaxed/simple;
	bh=BLFrlknqyQP0hzqEUa4QwZdYTsCqWHMaXtk2h8Y4fw8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8Ol3L8tkF8sE2ZbHcdZ6SlV+HvVQq5gsgqHZIXWZdS+OnDcAiTOYFzbhUGhtB7HH1NRao/1G5AJFxMWx9IaYS4mK0tv3mZlFXBILP3YtuL8YGpje7YPTK3TLZzlvX/fZsSEts9xW8AXsnhyEEmgk+cDdngDMm2A3mdJdVWUNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQLbQDew; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4zMb+cU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQLbQDew; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4zMb+cU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQLbQDew";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4zMb+cU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQLbQDew";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4zMb+cU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 648A322781;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fESucqM8FkxNWsDnTz+11bmd3zuVEh/fO85aBx6cat8=;
	b=MQLbQDew+qydv2k9LcEbhlR7mRclWHyJNQCWRsejALVBRGsaQJW20K+YStwEJA4Xm10rf1
	Q80QVNzPHUVbDO55TkevjT9oqauOHExTStQTs7DphyBweDnImHWaE+WS7ulZsJtN9+VffM
	oUqHKOK0oa0FvOK1j21woO4Z9RjTCWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fESucqM8FkxNWsDnTz+11bmd3zuVEh/fO85aBx6cat8=;
	b=S4zMb+cUpZTon/fd17kv178TV8RSh0faRWCi13na5kfesSL/ocD3zS/WMXbBUvoe2c9o7x
	y03u/nqL4Hos1HDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fESucqM8FkxNWsDnTz+11bmd3zuVEh/fO85aBx6cat8=;
	b=MQLbQDew+qydv2k9LcEbhlR7mRclWHyJNQCWRsejALVBRGsaQJW20K+YStwEJA4Xm10rf1
	Q80QVNzPHUVbDO55TkevjT9oqauOHExTStQTs7DphyBweDnImHWaE+WS7ulZsJtN9+VffM
	oUqHKOK0oa0FvOK1j21woO4Z9RjTCWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fESucqM8FkxNWsDnTz+11bmd3zuVEh/fO85aBx6cat8=;
	b=S4zMb+cUpZTon/fd17kv178TV8RSh0faRWCi13na5kfesSL/ocD3zS/WMXbBUvoe2c9o7x
	y03u/nqL4Hos1HDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BA0813AD7;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0JNTEfyi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 17/24] ALSA: seq: midi: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:59 +0100
Message-Id: <20240227085306.9764-18-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_midi.c       | 16 ++++------------
 sound/core/seq/seq_midi_event.c | 14 +++-----------
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 0594269d92ab..ba52a77eda38 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -302,22 +302,19 @@ snd_seq_midisynth_probe(struct device *_dev)
 	if (ports > (256 / SNDRV_RAWMIDI_DEVICES))
 		ports = 256 / SNDRV_RAWMIDI_DEVICES;
 
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	client = synths[card->number];
 	if (client == NULL) {
 		newclient = 1;
 		client = kzalloc(sizeof(*client), GFP_KERNEL);
-		if (client == NULL) {
-			mutex_unlock(&register_mutex);
+		if (client == NULL)
 			return -ENOMEM;
-		}
 		client->seq_client =
 			snd_seq_create_kernel_client(
 				card, 0, "%s", card->shortname[0] ?
 				(const char *)card->shortname : "External MIDI");
 		if (client->seq_client < 0) {
 			kfree(client);
-			mutex_unlock(&register_mutex);
 			return -ENOMEM;
 		}
 	}
@@ -398,7 +395,6 @@ snd_seq_midisynth_probe(struct device *_dev)
 	client->num_ports++;
 	if (newclient)
 		synths[card->number] = client;
-	mutex_unlock(&register_mutex);
 	return 0;	/* success */
 
       __nomem:
@@ -411,7 +407,6 @@ snd_seq_midisynth_probe(struct device *_dev)
 		snd_seq_delete_kernel_client(client->seq_client);
 		kfree(client);
 	}
-	mutex_unlock(&register_mutex);
 	return -ENOMEM;
 }
 
@@ -425,12 +420,10 @@ snd_seq_midisynth_remove(struct device *_dev)
 	struct snd_card *card = dev->card;
 	int device = dev->device, p, ports;
 	
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	client = synths[card->number];
-	if (client == NULL || client->ports[device] == NULL) {
-		mutex_unlock(&register_mutex);
+	if (client == NULL || client->ports[device] == NULL)
 		return -ENODEV;
-	}
 	ports = client->ports_per_device[device];
 	client->ports_per_device[device] = 0;
 	msynth = client->ports[device];
@@ -444,7 +437,6 @@ snd_seq_midisynth_remove(struct device *_dev)
 		synths[card->number] = NULL;
 		kfree(client);
 	}
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 
diff --git a/sound/core/seq/seq_midi_event.c b/sound/core/seq/seq_midi_event.c
index 7511462fe071..fa9dfc53c3fc 100644
--- a/sound/core/seq/seq_midi_event.c
+++ b/sound/core/seq/seq_midi_event.c
@@ -144,21 +144,15 @@ static inline void reset_encode(struct snd_midi_event *dev)
 
 void snd_midi_event_reset_encode(struct snd_midi_event *dev)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->lock, flags);
+	guard(spinlock_irqsave)(&dev->lock);
 	reset_encode(dev);
-	spin_unlock_irqrestore(&dev->lock, flags);
 }
 EXPORT_SYMBOL(snd_midi_event_reset_encode);
 
 void snd_midi_event_reset_decode(struct snd_midi_event *dev)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->lock, flags);
+	guard(spinlock_irqsave)(&dev->lock);
 	dev->lastcmd = 0xff;
-	spin_unlock_irqrestore(&dev->lock, flags);
 }
 EXPORT_SYMBOL(snd_midi_event_reset_decode);
 
@@ -177,7 +171,6 @@ bool snd_midi_event_encode_byte(struct snd_midi_event *dev, unsigned char c,
 				struct snd_seq_event *ev)
 {
 	bool rc = false;
-	unsigned long flags;
 
 	if (c >= MIDI_CMD_COMMON_CLOCK) {
 		/* real-time event */
@@ -187,7 +180,7 @@ bool snd_midi_event_encode_byte(struct snd_midi_event *dev, unsigned char c,
 		return ev->type != SNDRV_SEQ_EVENT_NONE;
 	}
 
-	spin_lock_irqsave(&dev->lock, flags);
+	guard(spinlock_irqsave)(&dev->lock);
 	if ((c & 0x80) &&
 	    (c != MIDI_CMD_COMMON_SYSEX_END || dev->type != ST_SYSEX)) {
 		/* new command */
@@ -236,7 +229,6 @@ bool snd_midi_event_encode_byte(struct snd_midi_event *dev, unsigned char c,
 		}
 	}
 
-	spin_unlock_irqrestore(&dev->lock, flags);
 	return rc;
 }
 EXPORT_SYMBOL(snd_midi_event_encode_byte);
-- 
2.35.3

