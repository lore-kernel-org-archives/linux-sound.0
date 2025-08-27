Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6A31A55C
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280661; cv=none; b=igOGUI2ZUwWHT1dt9Cq97PiaLY8V6SrOTEJKyn3OG6ab7eTo8f+tWIIk3Fru8Rgu2Up5d6uTs1SlhMTN/HrgR+S6XxvG2Gm9tY4eH6ffm77aVpKhXTqE4pMeFB7KGrWryJebXLaMbHrfNLx45+eOUzalejRlTB8bZP6LlCgUxnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280661; c=relaxed/simple;
	bh=HfDqmVqyW0HGCpmKsk8w9SlVUCz7c1koDuZt+3QGq+4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MV002RCzFMjTv0MoYtDGCb5v5lTQY6r691jJF0kr0Vodqaw6pGHtMRPszeflZuysXKsVajJnclGafPPE01RzT31mF5ZUDXHqtxhvUNkmyVMsXQZzRJWKjeGPndz7g12VO0bj1vxIAfy1zyDZKnM3sGa13HrZM9gvhvpNxBfDJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pYOjDMKH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wDD9l7SY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pYOjDMKH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wDD9l7SY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pYOjDMKH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wDD9l7SY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pYOjDMKH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wDD9l7SY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54905223E6;
	Wed, 27 Aug 2025 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=pYOjDMKHsca0cw7f/cG/Er6Vnc+2/Sme2OgFUVtQGYLQh+V6y+pOR8lg7bscUb6rzPMRoK
	xuh8r32+CchqiMDp+s8gEbhrdukfRgHzrqQxgUvsIQ5y9cSRb96+6APzmboblbcDj6hqWa
	o57klpjotC/e37qFZ6VUfxUmaCHp1Mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=wDD9l7SY8LlHifEh3yhNyJ1n6wP0OYOMq14r/emudeOENtJpTaglBULzLv9VLXoUs0QsIk
	mKU0IL3b7hS3G3AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=pYOjDMKHsca0cw7f/cG/Er6Vnc+2/Sme2OgFUVtQGYLQh+V6y+pOR8lg7bscUb6rzPMRoK
	xuh8r32+CchqiMDp+s8gEbhrdukfRgHzrqQxgUvsIQ5y9cSRb96+6APzmboblbcDj6hqWa
	o57klpjotC/e37qFZ6VUfxUmaCHp1Mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiwOiF5kw/4sQy+u0sNdW+/7yo3T5BjNoVb8UeTuiG8=;
	b=wDD9l7SY8LlHifEh3yhNyJ1n6wP0OYOMq14r/emudeOENtJpTaglBULzLv9VLXoUs0QsIk
	mKU0IL3b7hS3G3AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECA5113A31;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SA2pM9KzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 22/25] ALSA: hda/ext: Use guard() for spinlocks
Date: Wed, 27 Aug 2025 09:29:02 +0200
Message-ID: <20250827072916.31933-23-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

