Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534B322521
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480424; cv=none; b=qEye9v4Ume8EWnAjpaAUBBJDSnzyalIUt7L9z8g246GtQz94Iy8zonoK6rRnFka3J+dv/TtsGYmMG4RB5qR3/xLGCMnSQbA/NGvXpGW/cvGSTdWLzfhfOPrBPCvLlAQA8leMYW3QveuZPFFuBUaKMAQJBA1Tdifxhiqu2oXxSek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480424; c=relaxed/simple;
	bh=vHl4XgNI/Jq+gyV/s+KbtdZSyCnInPBWJ4JeY6FfazQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gv60pLmLZBUPfZxZ5ciUKaJnJCHcwbzYOceo6jwkUx6cPPI7ZRZY58VTohSnMMCKxl5aSQlk7GDVvT8vCmXUxGUqWqFIrJtOPlaI+T+mAAUX+lXppdRCFw/xqxs+mS+xAlNuI34NnVj68Doz/CCv7Wug+iJhtcWMZWN3T5AbzCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sC+13fLw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O/N72O/I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sC+13fLw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O/N72O/I; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sC+13fLw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O/N72O/I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sC+13fLw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O/N72O/I"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 52AF15C267;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNtmKk83jBxINKBFa6hFvJnTlzQOTfXolOWj0gmlWVc=;
	b=sC+13fLwIsj4nbuk3fn3RZQY7TXTC1rIYSg+ECNGcHRjxHrymRAvdqzCOEriDvNUxT3bPF
	8mUOXFiicBKKafF5PzTwYo4oxM2K09e2r9YwuSHiOgJ0qF+EowaqRhE/cA1+TUjwa2yt7u
	Rn5o3Yig1+PXTOGosYKP4W1e0ajUXpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNtmKk83jBxINKBFa6hFvJnTlzQOTfXolOWj0gmlWVc=;
	b=O/N72O/IXmtK6ZAYBUnE7e02Eolw+WxebiJo44Z9abm1FUPaJGiwgUsym/OURwX4Mz5SQw
	ChXiSHlj4Q7jAPDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sC+13fLw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="O/N72O/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNtmKk83jBxINKBFa6hFvJnTlzQOTfXolOWj0gmlWVc=;
	b=sC+13fLwIsj4nbuk3fn3RZQY7TXTC1rIYSg+ECNGcHRjxHrymRAvdqzCOEriDvNUxT3bPF
	8mUOXFiicBKKafF5PzTwYo4oxM2K09e2r9YwuSHiOgJ0qF+EowaqRhE/cA1+TUjwa2yt7u
	Rn5o3Yig1+PXTOGosYKP4W1e0ajUXpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNtmKk83jBxINKBFa6hFvJnTlzQOTfXolOWj0gmlWVc=;
	b=O/N72O/IXmtK6ZAYBUnE7e02Eolw+WxebiJo44Z9abm1FUPaJGiwgUsym/OURwX4Mz5SQw
	ChXiSHlj4Q7jAPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 342C513A54;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHZ6C6XDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/19] ALSA: i2c: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:15 +0200
Message-ID: <20250829151335.7342-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 52AF15C267
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/i2c/other/ak4113.c | 6 +++---
 sound/i2c/other/ak4114.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index c1f7447a4d11..fd54e44fe7d6 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -127,9 +127,9 @@ void snd_ak4113_reinit(struct ak4113 *chip)
 {
 	if (atomic_inc_return(&chip->wq_processing) == 1)
 		cancel_delayed_work_sync(&chip->work);
-	mutex_lock(&chip->reinit_mutex);
-	ak4113_init_regs(chip);
-	mutex_unlock(&chip->reinit_mutex);
+	scoped_guard(mutex, &chip->reinit_mutex) {
+		ak4113_init_regs(chip);
+	}
 	/* bring up statistics / event queing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index 7c493681f3cb..f4ded69bb0e4 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -132,9 +132,9 @@ void snd_ak4114_reinit(struct ak4114 *chip)
 {
 	if (atomic_inc_return(&chip->wq_processing) == 1)
 		cancel_delayed_work_sync(&chip->work);
-	mutex_lock(&chip->reinit_mutex);
-	ak4114_init_regs(chip);
-	mutex_unlock(&chip->reinit_mutex);
+	scoped_guard(mutex, &chip->reinit_mutex) {
+		ak4114_init_regs(chip);
+	}
 	/* bring up statistics / event queing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
-- 
2.50.1

