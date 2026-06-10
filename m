Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B04CA279
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106361; cv=none; b=DT0kKTx4UifjZI+ZlSK7xdh7ezzwSS1bMwVmMGmvKi3KDPNbaqqQy84+JhyZ4ZI6Ec9MMxnQn2D7t5PSxwIg0lpDrfBltsYy2nbPrjmxZj3t2l7oOrQiTr1+/2lAV8RhjIyonUUQhFA3U1WhtM3fjMUK6qZ/IKzu0wQgnkhJLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106361; c=relaxed/simple;
	bh=NDLfg5vOJ/kgWfswEuttCJb7m7h1EU0b0E0aOeDo3gI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QADrOdExtk43DW3aqzFvRmQhXpApL5rwIG1FlnebUvpSDmEnRVWT69iORwbFWSW/ZHpfywp0K9pMUM0A1E4RVn93HmwXh3gdP/oQ6KMonTeRQIt4C9aQwc0aFoDKWWtwWpBwJqHCYSp/Vhz3Goa34ZM6ijaomVhVZYidu59WUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1BY9trBi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ly2vIMlO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1BY9trBi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ly2vIMlO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1BY9trBi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ly2vIMlO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1BY9trBi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ly2vIMlO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D63B46AF02;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acbItduUV+sVAopmiVcAhmBo1FaQT5B95h8uK9dl7WQ=;
	b=1BY9trBiXrcXBMjkw8to1CJyquuPtGIrFaLfgqUz9QBrWIOlOsfDCUEvbr0QYwHmiIy5Gb
	WuLZcUf+6hs15Mq/1S2S0uHIVFnpNe7ls7SaiPrW6BQUYjsxENscclEPCRa3IABHx7WI8c
	Z+delkiPKdaGlqXIr67XXu0HFBAurso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acbItduUV+sVAopmiVcAhmBo1FaQT5B95h8uK9dl7WQ=;
	b=Ly2vIMlOWb34ZAbqA6ImI0CIc9bqr22by9ASUXg74ZuByxcPHEqUVUGugIVNkM8y0wnEKv
	917V5D7g97gT10BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acbItduUV+sVAopmiVcAhmBo1FaQT5B95h8uK9dl7WQ=;
	b=1BY9trBiXrcXBMjkw8to1CJyquuPtGIrFaLfgqUz9QBrWIOlOsfDCUEvbr0QYwHmiIy5Gb
	WuLZcUf+6hs15Mq/1S2S0uHIVFnpNe7ls7SaiPrW6BQUYjsxENscclEPCRa3IABHx7WI8c
	Z+delkiPKdaGlqXIr67XXu0HFBAurso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acbItduUV+sVAopmiVcAhmBo1FaQT5B95h8uK9dl7WQ=;
	b=Ly2vIMlOWb34ZAbqA6ImI0CIc9bqr22by9ASUXg74ZuByxcPHEqUVUGugIVNkM8y0wnEKv
	917V5D7g97gT10BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B20DB779A9;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHIuKqaGKWo5MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 15:45:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	linux-kernel@vber.kernel.org
Subject: [PATCH 5/5] ALSA: usb-audio: Use the new helper for shutdown refcount
Date: Wed, 10 Jun 2026 17:45:35 +0200
Message-ID: <20260610154538.51076-6-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610154538.51076-1-tiwai@suse.de>
References: <20260610154538.51076-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the open-code for managing the shutdown refcount with the new
helpers.
Only a code cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 14 +++++---------
 sound/usb/usbaudio.h |  5 +++--
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index f42d72cd0378..6a3b576fb067 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -769,7 +769,6 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 
 	chip = card->private_data;
 	mutex_init(&chip->mutex);
-	init_waitqueue_head(&chip->shutdown_wait);
 	chip->index = idx;
 	chip->dev = dev;
 	chip->card = card;
@@ -778,7 +777,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	chip->autoclock = autoclock;
 	chip->lowlatency = lowlatency;
 	atomic_set(&chip->active, 1); /* avoid autopm during probing */
-	atomic_set(&chip->usage_count, 0);
+	snd_refcount_init(&chip->usage_count);
 	atomic_set(&chip->shutdown, 0);
 
 	chip->usb_id = usb_id;
@@ -1107,8 +1106,7 @@ static bool __usb_audio_disconnect(struct usb_interface *intf,
 		/* wait until all pending tasks done;
 		 * they are protected by snd_usb_lock_shutdown()
 		 */
-		wait_event(chip->shutdown_wait,
-			   !atomic_read(&chip->usage_count));
+		snd_refcount_sync(&chip->usage_count);
 		snd_card_disconnect(card);
 		/* release the pcm resources */
 		list_for_each_entry(as, &chip->pcm_list, list) {
@@ -1166,7 +1164,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
 {
 	int err;
 
-	atomic_inc(&chip->usage_count);
+	snd_refcount_get(&chip->usage_count);
 	if (atomic_read(&chip->shutdown)) {
 		err = -EIO;
 		goto error;
@@ -1177,8 +1175,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
 	return 0;
 
  error:
-	if (atomic_dec_and_test(&chip->usage_count))
-		wake_up(&chip->shutdown_wait);
+	snd_refcount_put(&chip->usage_count);
 	return err;
 }
 EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
@@ -1187,8 +1184,7 @@ EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
 void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
 {
 	snd_usb_autosuspend(chip);
-	if (atomic_dec_and_test(&chip->usage_count))
-		wake_up(&chip->shutdown_wait);
+	snd_refcount_put(&chip->usage_count);
 }
 EXPORT_SYMBOL_GPL(snd_usb_unlock_shutdown);
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index e472aef6eb87..e26f9092417e 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -7,6 +7,8 @@
  *   Copyright (c) 2002 by Takashi Iwai <tiwai@suse.de>
  */
 
+#include <sound/core.h>
+
 /* handling of USB vendor/product ID pairs as 32-bit numbers */
 #define USB_ID(vendor, product) (((unsigned int)(vendor) << 16) | (product))
 #define USB_ID_VENDOR(id) ((id) >> 16)
@@ -41,8 +43,7 @@ struct snd_usb_audio {
 	unsigned int system_suspend;
 	atomic_t active;
 	atomic_t shutdown;
-	atomic_t usage_count;
-	wait_queue_head_t shutdown_wait;
+	struct snd_refcount usage_count;
 	unsigned int quirk_flags;
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
 	int num_interfaces;
-- 
2.54.0

