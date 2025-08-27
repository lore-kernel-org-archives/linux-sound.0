Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09073431E7
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286480; cv=none; b=CaUQmqNHfjcIMAAmDQRZDNFHAhJjzCJnbdP7R9cY5iQL6RvGnES7FnnGib1ZwDam0SmhwHe+TMGY1yVf22ZP3CyiVBgZZ4AwRpzInrrxl1YeEiewvMn9vA3Qkwlv1D3X/UwR3MJ1qlxla9lBrSzK5lBv3R+/o9SVSval928+gdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286480; c=relaxed/simple;
	bh=0EfHRKAIJWU19XHvj8XZtJizngYJKXdIuDl8B7z/odY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMSW0wQEiCSuGWxQO+xr6CAu1wJ22ALW88vS5uNrhRzJ6nI9P6dxEZDXhLslbRlaEbCCIEjBdOY+bN40iRB0zqvhbqmRajLmxUNDJ+8o4vQCDbNGMcWIOfV2M1jyLlLiCYvDGG2EQo4elRFe8/kQOPke2tM6fgGNJzVrTQPn2G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w8ueaUKg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1STR3wzD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w8ueaUKg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1STR3wzD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8ueaUKg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1STR3wzD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8ueaUKg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1STR3wzD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A38222234;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cumbVitl7nw7aYtnwtu9WBmxKIiCW2gJjqbkUKhpbI=;
	b=w8ueaUKgjceuI9xwkrkgSy4rDwjD22RmobWsj67ltHPyX8NIIIlQMLxBxjMpn8b3PamQiV
	5Rf0KCEBr3gDjvJ7Nz7yOmWOjsX6zx6yXgh1YxO/gJQxK5ip+7VZiwb54V2PnPx1ZuWRDL
	4gsohGaPLO8GG+bYbNYeG+uA58FFwgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cumbVitl7nw7aYtnwtu9WBmxKIiCW2gJjqbkUKhpbI=;
	b=1STR3wzDmQnjXEkOMwRfFOBV8gcaSYWU+8XUwP30XXIra83i4pkl+EAqAgRJFRiPxC9LEN
	GL07FTH9bGNYTLBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w8ueaUKg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1STR3wzD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cumbVitl7nw7aYtnwtu9WBmxKIiCW2gJjqbkUKhpbI=;
	b=w8ueaUKgjceuI9xwkrkgSy4rDwjD22RmobWsj67ltHPyX8NIIIlQMLxBxjMpn8b3PamQiV
	5Rf0KCEBr3gDjvJ7Nz7yOmWOjsX6zx6yXgh1YxO/gJQxK5ip+7VZiwb54V2PnPx1ZuWRDL
	4gsohGaPLO8GG+bYbNYeG+uA58FFwgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cumbVitl7nw7aYtnwtu9WBmxKIiCW2gJjqbkUKhpbI=;
	b=1STR3wzDmQnjXEkOMwRfFOBV8gcaSYWU+8XUwP30XXIra83i4pkl+EAqAgRJFRiPxC9LEN
	GL07FTH9bGNYTLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89A4A13A6A;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4IkQIdnNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 19/19] ALSA: firewire: lib: Use guard() for spin locks
Date: Wed, 27 Aug 2025 11:20:13 +0200
Message-ID: <20250827092017.29014-20-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827092017.29014-1-tiwai@suse.de>
References: <20250827092017.29014-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLoh6gpjpepziq6z1gge5pcxxt)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9A38222234
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fcp.c           | 19 ++++++++-----------
 sound/firewire/iso-resources.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/sound/firewire/fcp.c b/sound/firewire/fcp.c
index df44dd5dc4b2..e60bfd0ee4ac 100644
--- a/sound/firewire/fcp.c
+++ b/sound/firewire/fcp.c
@@ -242,9 +242,9 @@ int fcp_avc_transaction(struct fw_unit *unit,
 	init_waitqueue_head(&t.wait);
 	t.deferrable = (*(const u8 *)command == 0x00 || *(const u8 *)command == 0x03);
 
-	spin_lock_irq(&transactions_lock);
-	list_add_tail(&t.list, &transactions);
-	spin_unlock_irq(&transactions_lock);
+	scoped_guard(spinlock_irq, &transactions_lock) {
+		list_add_tail(&t.list, &transactions);
+	}
 
 	for (;;) {
 		tcode = command_size == 4 ? TCODE_WRITE_QUADLET_REQUEST
@@ -280,9 +280,9 @@ int fcp_avc_transaction(struct fw_unit *unit,
 		}
 	}
 
-	spin_lock_irq(&transactions_lock);
-	list_del(&t.list);
-	spin_unlock_irq(&transactions_lock);
+	scoped_guard(spinlock_irq, &transactions_lock) {
+		list_del(&t.list);
+	}
 
 	return ret;
 }
@@ -300,7 +300,7 @@ void fcp_bus_reset(struct fw_unit *unit)
 {
 	struct fcp_transaction *t;
 
-	spin_lock_irq(&transactions_lock);
+	guard(spinlock_irq)(&transactions_lock);
 	list_for_each_entry(t, &transactions, list) {
 		if (t->unit == unit &&
 		    (t->state == STATE_PENDING ||
@@ -309,7 +309,6 @@ void fcp_bus_reset(struct fw_unit *unit)
 			wake_up(&t->wait);
 		}
 	}
-	spin_unlock_irq(&transactions_lock);
 }
 EXPORT_SYMBOL(fcp_bus_reset);
 
@@ -341,12 +340,11 @@ static void fcp_response(struct fw_card *card, struct fw_request *request,
 			 void *data, size_t length, void *callback_data)
 {
 	struct fcp_transaction *t;
-	unsigned long flags;
 
 	if (length < 1 || (*(const u8 *)data & 0xf0) != CTS_AVC)
 		return;
 
-	spin_lock_irqsave(&transactions_lock, flags);
+	guard(spinlock_irqsave)(&transactions_lock);
 	list_for_each_entry(t, &transactions, list) {
 		struct fw_device *device = fw_parent_device(t->unit);
 		if (device->card != card ||
@@ -370,7 +368,6 @@ static void fcp_response(struct fw_card *card, struct fw_request *request,
 			wake_up(&t->wait);
 		}
 	}
-	spin_unlock_irqrestore(&transactions_lock, flags);
 }
 
 static struct fw_address_handler response_register_handler = {
diff --git a/sound/firewire/iso-resources.c b/sound/firewire/iso-resources.c
index b47ee029d688..4f63279225c5 100644
--- a/sound/firewire/iso-resources.c
+++ b/sound/firewire/iso-resources.c
@@ -114,10 +114,10 @@ int fw_iso_resources_allocate(struct fw_iso_resources *r,
 	r->bandwidth = packet_bandwidth(max_payload_bytes, speed);
 
 retry_after_bus_reset:
-	spin_lock_irq(&card->lock);
-	r->generation = card->generation;
-	r->bandwidth_overhead = current_bandwidth_overhead(card);
-	spin_unlock_irq(&card->lock);
+	scoped_guard(spinlock_irq, &card->lock) {
+		r->generation = card->generation;
+		r->bandwidth_overhead = current_bandwidth_overhead(card);
+	}
 
 	err = wait_isoch_resource_delay_after_bus_reset(card);
 	if (err < 0)
@@ -167,10 +167,10 @@ int fw_iso_resources_update(struct fw_iso_resources *r)
 	if (!r->allocated)
 		return 0;
 
-	spin_lock_irq(&card->lock);
-	r->generation = card->generation;
-	r->bandwidth_overhead = current_bandwidth_overhead(card);
-	spin_unlock_irq(&card->lock);
+	scoped_guard(spinlock_irq, &card->lock) {
+		r->generation = card->generation;
+		r->bandwidth_overhead = current_bandwidth_overhead(card);
+	}
 
 	bandwidth = r->bandwidth + r->bandwidth_overhead;
 
-- 
2.50.1

