Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE4232C318
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286448; cv=none; b=YoKbEQjFn1lUp/yFxsIYHoU7iEd3GFLjIdksXAZE31vHQyXduH/eiGtjSFcroLom+23YErkIImcSzTY0CRMlsGP2XAtCfMIQ5vverPJWumeqMXAi95QWjRxQ4nsT5pGoFaOSEQ75vuh9u+eyka+pgjmiHHv132YazycD1o+K4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286448; c=relaxed/simple;
	bh=9mP+5uDhAWuC77LOhpHh/j+16Yig2L56Lmu8uAWwuYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfsHk35MxTBecOLqgnT/kb+VLtQA+Po98QKzi8mfQdScSZHosz1/XgONmqBPJsONH9ifchT7oq6+oB/I6Tbjgagvo679sTkY1f7bcyozvIXauFExyI2li2+9R82big1pDBKWVhJZXnIRCTV3Abhk/q3UjrCVL07LOjKwOrN+LKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MaaHJtdI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QCSrDLLq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vjBzvva+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UveJln3O; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MaaHJtdI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QCSrDLLq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vjBzvva+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UveJln3O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E654522156;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sK0oORwFhP6kGjR7RpVB2zasS9iFueufgOxLp+Zzl/Y=;
	b=MaaHJtdIWcBVMQQA8G4Ar9XLPocnnXbqpsVHvO5VbhPIYC9C4p6SwRQ2dI8H3e9NPjlkOs
	h7KxzFyIULE8kLhyfYlnPPvKoat1rWbLELXwAzXs5qEC9VYFMTJf6XFqtqLd/qRgOKrVpJ
	pS+E8CdktNj6cnzCOpwNL+GYOy5YLss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sK0oORwFhP6kGjR7RpVB2zasS9iFueufgOxLp+Zzl/Y=;
	b=QCSrDLLqjW4MHI36xaYrOZOU2Wrtrw7qYqSN5htsWCbSA9u3HG1B4yLkfDJoG9Q8RAcJAd
	BXCB9kp/m+ySA3Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sK0oORwFhP6kGjR7RpVB2zasS9iFueufgOxLp+Zzl/Y=;
	b=vjBzvva+ieyY/U6owqrKGknR/Uqnab7QrPKNOGBYlF+QPqNua/ZqRzuKA8EcuFkPeGdU9k
	Zi6OkZ39Slzxipn4XyQt+aq/IDc9ZDyAjcQFrOihueOvMe9HvnkJypks5QNtrNCQ7H3kfJ
	AyBcBFC5cTzXPC2w3uS01EHqBIQggME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sK0oORwFhP6kGjR7RpVB2zasS9iFueufgOxLp+Zzl/Y=;
	b=UveJln3Oa64keCes3OTLT+M2Ib9YTy1AZ53qFh7fM/kHkDy8NZU4qOKzr8fVq5IlUleZVd
	m8xoGsVuXc6oBUCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D415D13A6A;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aKI1M9jNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 10/19] ALSA: firewire: lib: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:20:04 +0200
Message-ID: <20250827092017.29014-11-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL4srdohtr7muph9mn9hundm3r)];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/amdtp-stream.c  | 28 ++++++-------------
 sound/firewire/cmp.c           | 37 +++++++------------------
 sound/firewire/iso-resources.c | 50 ++++++++++++++--------------------
 3 files changed, 38 insertions(+), 77 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 7fc51f829ecc..5cdc34877fc1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1688,20 +1688,16 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	struct pkt_desc *descs;
 	int i, type, tag, err;
 
-	mutex_lock(&s->mutex);
+	guard(mutex)(&s->mutex);
 
 	if (WARN_ON(amdtp_stream_running(s) ||
-		    (s->data_block_quadlets < 1))) {
-		err = -EBADFD;
-		goto err_unlock;
-	}
+		    (s->data_block_quadlets < 1)))
+		return -EBADFD;
 
 	if (s->direction == AMDTP_IN_STREAM) {
 		// NOTE: IT context should be used for constant IRQ.
-		if (is_irq_target) {
-			err = -EINVAL;
-			goto err_unlock;
-		}
+		if (is_irq_target)
+			return -EINVAL;
 
 		s->data_block_counter = UINT_MAX;
 	} else {
@@ -1725,7 +1721,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 
 	err = iso_packets_buffer_init(&s->buffer, s->unit, queue_size, max_ctx_payload_size, dir);
 	if (err < 0)
-		goto err_unlock;
+		return err;
 	s->queue_size = queue_size;
 
 	s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
@@ -1846,8 +1842,6 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	if (err < 0)
 		goto err_pkt_descs;
 
-	mutex_unlock(&s->mutex);
-
 	return 0;
 err_pkt_descs:
 	kfree(s->packet_descs);
@@ -1863,8 +1857,6 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	s->context = ERR_PTR(-1);
 err_buffer:
 	iso_packets_buffer_destroy(&s->buffer, s->unit);
-err_unlock:
-	mutex_unlock(&s->mutex);
 
 	return err;
 }
@@ -1934,12 +1926,10 @@ EXPORT_SYMBOL(amdtp_stream_update);
  */
 static void amdtp_stream_stop(struct amdtp_stream *s)
 {
-	mutex_lock(&s->mutex);
+	guard(mutex)(&s->mutex);
 
-	if (!amdtp_stream_running(s)) {
-		mutex_unlock(&s->mutex);
+	if (!amdtp_stream_running(s))
 		return;
-	}
 
 	cancel_work_sync(&s->period_work);
 	fw_iso_context_stop(s->context);
@@ -1955,8 +1945,6 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 		if (s->domain->replay.enable)
 			kfree(s->ctx_data.tx.cache.descs);
 	}
-
-	mutex_unlock(&s->mutex);
 }
 
 /**
diff --git a/sound/firewire/cmp.c b/sound/firewire/cmp.c
index f5028a061a91..b2b76c7c71b3 100644
--- a/sound/firewire/cmp.c
+++ b/sound/firewire/cmp.c
@@ -188,32 +188,23 @@ EXPORT_SYMBOL(cmp_connection_destroy);
 int cmp_connection_reserve(struct cmp_connection *c,
 			   unsigned int max_payload_bytes)
 {
-	int err;
+	guard(mutex)(&c->mutex);
 
-	mutex_lock(&c->mutex);
-
-	if (WARN_ON(c->resources.allocated)) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (WARN_ON(c->resources.allocated))
+		return -EBUSY;
 
 	c->speed = min(c->max_speed,
 		       fw_parent_device(c->resources.unit)->max_speed);
 
-	err = fw_iso_resources_allocate(&c->resources, max_payload_bytes,
-					c->speed);
-end:
-	mutex_unlock(&c->mutex);
-
-	return err;
+	return fw_iso_resources_allocate(&c->resources, max_payload_bytes,
+					 c->speed);
 }
 EXPORT_SYMBOL(cmp_connection_reserve);
 
 void cmp_connection_release(struct cmp_connection *c)
 {
-	mutex_lock(&c->mutex);
+	guard(mutex)(&c->mutex);
 	fw_iso_resources_free(&c->resources);
-	mutex_unlock(&c->mutex);
 }
 EXPORT_SYMBOL(cmp_connection_release);
 
@@ -304,12 +295,10 @@ int cmp_connection_establish(struct cmp_connection *c)
 {
 	int err;
 
-	mutex_lock(&c->mutex);
+	guard(mutex)(&c->mutex);
 
-	if (WARN_ON(c->connected)) {
-		mutex_unlock(&c->mutex);
+	if (WARN_ON(c->connected))
 		return -EISCONN;
-	}
 
 retry_after_bus_reset:
 	if (c->direction == CMP_OUTPUT)
@@ -327,8 +316,6 @@ int cmp_connection_establish(struct cmp_connection *c)
 	if (err >= 0)
 		c->connected = true;
 
-	mutex_unlock(&c->mutex);
-
 	return err;
 }
 EXPORT_SYMBOL(cmp_connection_establish);
@@ -350,19 +337,15 @@ void cmp_connection_break(struct cmp_connection *c)
 {
 	int err;
 
-	mutex_lock(&c->mutex);
+	guard(mutex)(&c->mutex);
 
-	if (!c->connected) {
-		mutex_unlock(&c->mutex);
+	if (!c->connected)
 		return;
-	}
 
 	err = pcr_modify(c, pcr_break_modify, NULL, SUCCEED_ON_BUS_RESET);
 	if (err < 0)
 		cmp_error(c, "plug is still connected\n");
 
 	c->connected = false;
-
-	mutex_unlock(&c->mutex);
 }
 EXPORT_SYMBOL(cmp_connection_break);
diff --git a/sound/firewire/iso-resources.c b/sound/firewire/iso-resources.c
index 84f71b2eaa82..b47ee029d688 100644
--- a/sound/firewire/iso-resources.c
+++ b/sound/firewire/iso-resources.c
@@ -123,28 +123,24 @@ int fw_iso_resources_allocate(struct fw_iso_resources *r,
 	if (err < 0)
 		return err;
 
-	mutex_lock(&r->mutex);
-
-	bandwidth = r->bandwidth + r->bandwidth_overhead;
-	fw_iso_resource_manage(card, r->generation, r->channels_mask,
-			       &channel, &bandwidth, true);
-	if (channel == -EAGAIN) {
-		mutex_unlock(&r->mutex);
-		goto retry_after_bus_reset;
+	scoped_guard(mutex, &r->mutex) {
+		bandwidth = r->bandwidth + r->bandwidth_overhead;
+		fw_iso_resource_manage(card, r->generation, r->channels_mask,
+				       &channel, &bandwidth, true);
+		if (channel == -EAGAIN)
+			goto retry_after_bus_reset;
+		if (channel >= 0) {
+			r->channel = channel;
+			r->allocated = true;
+		} else {
+			if (channel == -EBUSY)
+				dev_err(&r->unit->device,
+					"isochronous resources exhausted\n");
+			else
+				dev_err(&r->unit->device,
+					"isochronous resource allocation failed\n");
+		}
 	}
-	if (channel >= 0) {
-		r->channel = channel;
-		r->allocated = true;
-	} else {
-		if (channel == -EBUSY)
-			dev_err(&r->unit->device,
-				"isochronous resources exhausted\n");
-		else
-			dev_err(&r->unit->device,
-				"isochronous resource allocation failed\n");
-	}
-
-	mutex_unlock(&r->mutex);
 
 	return channel;
 }
@@ -166,12 +162,10 @@ int fw_iso_resources_update(struct fw_iso_resources *r)
 	struct fw_card *card = fw_parent_device(r->unit)->card;
 	int bandwidth, channel;
 
-	mutex_lock(&r->mutex);
+	guard(mutex)(&r->mutex);
 
-	if (!r->allocated) {
-		mutex_unlock(&r->mutex);
+	if (!r->allocated)
 		return 0;
-	}
 
 	spin_lock_irq(&card->lock);
 	r->generation = card->generation;
@@ -196,8 +190,6 @@ int fw_iso_resources_update(struct fw_iso_resources *r)
 				"isochronous resource allocation failed\n");
 	}
 
-	mutex_unlock(&r->mutex);
-
 	return channel;
 }
 EXPORT_SYMBOL(fw_iso_resources_update);
@@ -218,7 +210,7 @@ void fw_iso_resources_free(struct fw_iso_resources *r)
 		return;
 	card = fw_parent_device(r->unit)->card;
 
-	mutex_lock(&r->mutex);
+	guard(mutex)(&r->mutex);
 
 	if (r->allocated) {
 		bandwidth = r->bandwidth + r->bandwidth_overhead;
@@ -230,7 +222,5 @@ void fw_iso_resources_free(struct fw_iso_resources *r)
 
 		r->allocated = false;
 	}
-
-	mutex_unlock(&r->mutex);
 }
 EXPORT_SYMBOL(fw_iso_resources_free);
-- 
2.50.1

