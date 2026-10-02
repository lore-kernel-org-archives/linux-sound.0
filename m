Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD446A5E6
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931357; cv=none; b=lcVfKg5ErTNx5rvRnBnLJnR20OeGjTGs72QYLwWKKLPKhiS7an1t8ce2h1mRY2dzwZAU5xvSuBUdnw31m9Ah6qX3N0EL/sHFFUewWUNd7hT1FFHgjhgYHLPRp/aWoqTCVJwP7ARV2aJi55y+A6mhjO5QhztcbD/SKAhFo61Fk2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931357; c=relaxed/simple;
	bh=cS00qKF0MAfMaY4iU15AtsheMQSlhopm4WRcFqFxyzU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv4/SDTrRSGI/VspePvKHgO/ac5+N2k/do+DjvB/X/EjYCH79DYINk9dTNNjnxZ/dQvWGMeNgXvKAFuYNhn4BR3wsjxmGJ4yEzFXVIbXAPsFgFL6cOcyOMmOKhOTEEToWSpJ80EmZbajO2BUJMareBjCKXQmmqOCMZ7Uh4uUj7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ehKQwa3Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XtGGT2s3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OSE+rjCa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=92ix4/sc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ehKQwa3Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XtGGT2s3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OSE+rjCa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="92ix4/sc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA5AE1FE5A;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1nnwf9OsnQQcb0xb37ek7h93qJXo+nFa/UGnLeJoRo=;
	b=ehKQwa3QZpOoFwUmKl3Dj4nQXzBJT18TmJrEZuPYcvr406WEcGUv1fSo5cMJgVcOuzxW9s
	EfY4ehHC5xX51O+DI+5P7htTEC/8Qu2pzS9cIU2u5yPMTj+/1aknbYNj0EwUAE+n7bUj8W
	X05UTc2IkH6As5Wi8OuF9rPWM6HGc3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1nnwf9OsnQQcb0xb37ek7h93qJXo+nFa/UGnLeJoRo=;
	b=XtGGT2s3LShGpTadyIQlruYNNrFKAWkKRBgsdeO/ZphpZhZcBWVBCMaZcs1X17+Ss+u3RD
	uOTYwhh3nzlHUvCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1nnwf9OsnQQcb0xb37ek7h93qJXo+nFa/UGnLeJoRo=;
	b=OSE+rjCa+W0nSk8mVP1EmGisvKNk2y5Ty6Zy2oc22pThbvL/pLcvykr4CJBHMfs/cvrnoV
	Ze0766sXRzswdT5VNo8TAHkI2VIyT83X1wUH9ZNSThqRLQf6vfX/izrgWAEgW/gL5uk5zd
	5Yu0dU3d6p6FdcPwVYTgmLYBdJsSrVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1nnwf9OsnQQcb0xb37ek7h93qJXo+nFa/UGnLeJoRo=;
	b=92ix4/scto3ZfslmM+PcL31KbaOht8PQrFsOCCV4oohBis682liGJOLdqE7EvGjbv6xVgf
	s3z5MZBtncfaSvCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBB5913C1B;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T33
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 32/32] ALSA: Drop unused snd_card_free_on_error()
Date: Fri,  2 Oct 2026 10:55:10 +0200
Message-ID: <20261002085517.693510-33-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002085517.693510-1-tiwai@suse.de>
References: <20261002085517.693510-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

Now that all users of snd_card_free_on_error() are gone by refactoring
with auto-cleanup, let's drop the superfluous function.

Also, update the documentation for reflecting the recommended error
handling procedure, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  1 -
 sound/core/init.c    | 36 +++++++-----------------------------
 2 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 15be947a730e..daa91a46a16b 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -314,7 +314,6 @@ void snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
 void snd_card_free(struct snd_card *card);
 void snd_card_free_when_closed(struct snd_card *card);
-int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
 int snd_card_register(struct snd_card *card);
 int snd_card_info_init(void);
diff --git a/sound/core/init.c b/sound/core/init.c
index 1bcb6a2e7550..ebf96ba6c49c 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -216,11 +216,13 @@ static void __snd_card_release(struct device *dev, void *data)
  * is added automatically.  In that way, the resource disconnection is assured
  * at first, then released in the expected order.
  *
- * If an error happens at the probe before snd_card_register() is called and
- * there have been other devres resources, you'd need to free the card manually
- * via snd_card_free() call in the error; otherwise it may lead to UAF due to
- * devres call orders.  You can use snd_card_free_on_error() helper for
- * handling it more easily.
+ * Caveat: if an error happens at the probe before snd_card_register() is
+ * called and there have been other devres resources that are referred at the
+ * card-level destructor call, you'd still need to free the card manually;
+ * otherwise it may lead to UAF due to devres call orders.  Instead of a manual
+ * snd_card_free() call, you can use the automatic clean-up for the card
+ * pointer via __free(snd_card_free), too.  In this case, don't forget to do
+ * NULL-clear the card pointer before the successful return!
  *
  * Return: zero if successful, or a negative error code
  */
@@ -250,30 +252,6 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 }
 EXPORT_SYMBOL_GPL(snd_devm_card_new);
 
-/**
- * snd_card_free_on_error - a small helper for handling devm probe errors
- * @dev: the managed device object
- * @ret: the return code from the probe callback
- *
- * This function handles the explicit snd_card_free() call at the error from
- * the probe callback.  It's just a small helper for simplifying the error
- * handling with the managed devices.
- *
- * Return: zero if successful, or a negative error code
- */
-int snd_card_free_on_error(struct device *dev, int ret)
-{
-	struct snd_card *card;
-
-	if (!ret)
-		return 0;
-	card = devres_find(dev, __snd_card_release, NULL, NULL);
-	if (card)
-		snd_card_free(card);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_card_free_on_error);
-
 static int snd_card_init(struct snd_card *card, struct device *parent,
 			 int idx, const char *xid, struct module *module,
 			 size_t extra_size)
-- 
2.55.0

