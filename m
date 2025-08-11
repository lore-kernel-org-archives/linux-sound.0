Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE18220685
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906957; cv=none; b=f0rLcpiaSjGydNr1YmXOb/MoJxbPKJhJTGcPtCFFnqt+s+VxUHevUMzaggoJoitya5Qrxje3a+pDulHlgHqRdUWFBYH3cw8RUVBzkiyOj/2ZfuFFnJlZf3spkmabLTQvqm+m0HMpaQsfk13/CpnlYBCUjMu9rOu5WeFUA3thAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906957; c=relaxed/simple;
	bh=HfDqmVqyW0HGCpmKsk8w9SlVUCz7c1koDuZt+3QGq+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzSfetON5PPY+/O7nGwL7RLBPws8oSUW7OP/BgnIClpDH+xakR4BOGGceqQgLscg+pmP4N4/77CEyqUW2q98ekljotIR7KF0w/YoHm/P03NGmnaCy4qhKl3mYT0PNLYjsCuaK594QGNRUIdoXioqxXbuU15rBjZpayoYKajadBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dRXvg0mb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E63RtUw3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dRXvg0mb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E63RtUw3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dRXvg0mb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E63RtUw3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dRXvg0mb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E63RtUw3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 64DDE33E82;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=dRXvg0mbyYtW0+Kf9gJgwH6uiwWM/UHbbzpn6Ja70qytPixnhXOGO8pJkUqjz+LvNqpycZ
	g98WhnFUqSv7h9D6XaUvqcbVS5v+CKE7pfVvfhhiakLo/eYrTtqSxYFt8gj9DlIO6oWVIM
	Q+DUcZLj+APyLdUIbPErFVAwLrDDndQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=E63RtUw315QyQ/egbHWsOhx1IOjRRtSDqxcNZVBq36nj1uYxLMLSURvhE0QPzFTqmg/4J9
	A5bQrViYrHnTroAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=dRXvg0mbyYtW0+Kf9gJgwH6uiwWM/UHbbzpn6Ja70qytPixnhXOGO8pJkUqjz+LvNqpycZ
	g98WhnFUqSv7h9D6XaUvqcbVS5v+CKE7pfVvfhhiakLo/eYrTtqSxYFt8gj9DlIO6oWVIM
	Q+DUcZLj+APyLdUIbPErFVAwLrDDndQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=E63RtUw315QyQ/egbHWsOhx1IOjRRtSDqxcNZVBq36nj1uYxLMLSURvhE0QPzFTqmg/4J9
	A5bQrViYrHnTroAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FE6E13A9B;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qHhSChLBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 22/25] ALSA: hda/ext: Use guard() for spinlocks
Date: Mon, 11 Aug 2025 12:07:56 +0200
Message-ID: <20250811100807.7962-23-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/ext/stream.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/sound/hda/core/ext/stream.c b/sound/hda/core/ext/stream.c
index a3ac738f1130..b4759198e51d 100644
--- a/sound/hda/core/ext/stream.c
+++ b/sound/hda/core/ext/stream.c
@@ -163,9 +163,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple_locked);
 void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 				  struct hdac_ext_stream *hext_stream, bool decouple)
 {
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	snd_hdac_ext_stream_decouple_locked(bus, hext_stream, decouple);
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple);
 
@@ -265,7 +264,7 @@ hdac_ext_link_dma_stream_assign(struct hdac_bus *bus,
 		return NULL;
 	}
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(hstream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hext_stream = container_of(hstream,
 								 struct hdac_ext_stream,
@@ -285,7 +284,6 @@ hdac_ext_link_dma_stream_assign(struct hdac_bus *bus,
 		res->link_locked = 1;
 		res->link_substream = substream;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 	return res;
 }
 
@@ -301,7 +299,7 @@ hdac_ext_host_dma_stream_assign(struct hdac_bus *bus,
 		return NULL;
 	}
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(hstream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hext_stream = container_of(hstream,
 								 struct hdac_ext_stream,
@@ -320,7 +318,6 @@ hdac_ext_host_dma_stream_assign(struct hdac_bus *bus,
 		res->hstream.running = 0;
 		res->hstream.substream = substream;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 
 	return res;
 }
@@ -387,22 +384,22 @@ void snd_hdac_ext_stream_release(struct hdac_ext_stream *hext_stream, int type)
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_HOST:
-		spin_lock_irq(&bus->reg_lock);
-		/* couple link only if not in use */
-		if (!hext_stream->link_locked)
-			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
-		snd_hdac_stream_release_locked(&hext_stream->hstream);
-		spin_unlock_irq(&bus->reg_lock);
+		scoped_guard(spinlock_irq, &bus->reg_lock) {
+			/* couple link only if not in use */
+			if (!hext_stream->link_locked)
+				snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
+			snd_hdac_stream_release_locked(&hext_stream->hstream);
+		}
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_LINK:
-		spin_lock_irq(&bus->reg_lock);
-		/* couple host only if not in use */
-		if (!hext_stream->hstream.opened)
-			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
-		hext_stream->link_locked = 0;
-		hext_stream->link_substream = NULL;
-		spin_unlock_irq(&bus->reg_lock);
+		scoped_guard(spinlock_irq, &bus->reg_lock) {
+			/* couple host only if not in use */
+			if (!hext_stream->hstream.opened)
+				snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
+			hext_stream->link_locked = 0;
+			hext_stream->link_substream = NULL;
+		}
 		break;
 
 	default:
@@ -427,7 +424,7 @@ struct hdac_ext_stream *snd_hdac_ext_cstream_assign(struct hdac_bus *bus,
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *hstream;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(hstream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
 
@@ -446,7 +443,6 @@ struct hdac_ext_stream *snd_hdac_ext_cstream_assign(struct hdac_bus *bus,
 		res->hstream.running = 0;
 		res->hstream.cstream = cstream;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 
 	return res;
 }
-- 
2.50.1

