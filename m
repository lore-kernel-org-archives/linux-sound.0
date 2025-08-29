Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B5C320CCA
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479252; cv=none; b=YXO4E/BTERNo46+z3CsQ3XA41sDTG30g0onkekrffYJiG1+8kmxsjhemKLt9Fq5HdVyheS6S7L2LMZPDn0t7iz1uKywjh+Kr2zC810Gq666I6glJEsY5XjM5LyJGRShWam3ZteZZ66TjWim5gvRmgXitEVEYHIrkJW+dCNpUclc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479252; c=relaxed/simple;
	bh=5maFuYqGKVqqtQ2Alk9ZcDxY+P49zQv/uA6UBpBM20o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWrUIDGblu0JLmgSqcgUtUP3YnQYMKsuNDCUqrzQfJSfnb+tdt4YWbEOR12A7joA1MWgWzhr/15fRYBSO1wA0G5FyXN9xrH4YAU6uIFnDY3mVqId0JBBODuOY0BRtXs36fuo4+OM9IE12yiOwJQsugy3gIwAoXoTBZvWkPpVNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X+s5VRqg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lt8VtQfo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X+s5VRqg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lt8VtQfo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+s5VRqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lt8VtQfo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+s5VRqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lt8VtQfo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C9DD2228B0;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1hI9JEbXPEPqN05m9RPpNZ0AjrWWQy04G/Al+zB6Lg=;
	b=X+s5VRqgfbh5Zv1ieFNuK9VhtbelN1n95wIqRFgZFELUL5hZg9eCgUdqwtX5UFzWC7A9Qd
	X+cspu89EOQ4neOD4PDTuThoDsCPplbDpRtPsH8iW4pNRMBnXFvS+zxOWdVTiLlXiMV5vR
	Lc2cLhKoPlLqvarx4BVUsA3O/pDVdtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1hI9JEbXPEPqN05m9RPpNZ0AjrWWQy04G/Al+zB6Lg=;
	b=lt8VtQfop+bHIfR0t78DnMiQ4SgyLDQ0YKgQSbb2D+LletTS7uDtu2r5lpdxq8F6SihTvN
	j4zv0DI1bNrxCEBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1hI9JEbXPEPqN05m9RPpNZ0AjrWWQy04G/Al+zB6Lg=;
	b=X+s5VRqgfbh5Zv1ieFNuK9VhtbelN1n95wIqRFgZFELUL5hZg9eCgUdqwtX5UFzWC7A9Qd
	X+cspu89EOQ4neOD4PDTuThoDsCPplbDpRtPsH8iW4pNRMBnXFvS+zxOWdVTiLlXiMV5vR
	Lc2cLhKoPlLqvarx4BVUsA3O/pDVdtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1hI9JEbXPEPqN05m9RPpNZ0AjrWWQy04G/Al+zB6Lg=;
	b=lt8VtQfop+bHIfR0t78DnMiQ4SgyLDQ0YKgQSbb2D+LletTS7uDtu2r5lpdxq8F6SihTvN
	j4zv0DI1bNrxCEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B196F13326;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SLEdKti+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 16/18] ALSA: wss: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:52:56 +0200
Message-ID: <20250829145300.5460-17-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wss/wss_lib.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 1b6a80021d18..0a2c040af5f0 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -618,7 +618,7 @@ static void snd_wss_playback_format(struct snd_wss *chip,
 	unsigned long flags;
 	int full_calib = 1;
 
-	mutex_lock(&chip->mce_mutex);
+	guard(mutex)(&chip->mce_mutex);
 	if (chip->hardware == WSS_HW_CS4231A ||
 	    (chip->hardware & WSS_HW_CS4232_MASK)) {
 		spin_lock_irqsave(&chip->reg_lock, flags);
@@ -669,7 +669,6 @@ static void snd_wss_playback_format(struct snd_wss *chip,
 			udelay(100);	/* this seems to help */
 		snd_wss_mce_down(chip);
 	}
-	mutex_unlock(&chip->mce_mutex);
 }
 
 static void snd_wss_capture_format(struct snd_wss *chip,
@@ -679,7 +678,7 @@ static void snd_wss_capture_format(struct snd_wss *chip,
 	unsigned long flags;
 	int full_calib = 1;
 
-	mutex_lock(&chip->mce_mutex);
+	guard(mutex)(&chip->mce_mutex);
 	if (chip->hardware == WSS_HW_CS4231A ||
 	    (chip->hardware & WSS_HW_CS4232_MASK)) {
 		spin_lock_irqsave(&chip->reg_lock, flags);
@@ -736,7 +735,6 @@ static void snd_wss_capture_format(struct snd_wss *chip,
 		spin_unlock_irqrestore(&chip->reg_lock, flags);
 		snd_wss_mce_down(chip);
 	}
-	mutex_unlock(&chip->mce_mutex);
 }
 
 /*
@@ -862,15 +860,12 @@ static int snd_wss_open(struct snd_wss *chip, unsigned int mode)
 {
 	unsigned long flags;
 
-	mutex_lock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
 	if ((chip->mode & mode) ||
-	    ((chip->mode & WSS_MODE_OPEN) && chip->single_dma)) {
-		mutex_unlock(&chip->open_mutex);
+	    ((chip->mode & WSS_MODE_OPEN) && chip->single_dma))
 		return -EAGAIN;
-	}
 	if (chip->mode & WSS_MODE_OPEN) {
 		chip->mode |= mode;
-		mutex_unlock(&chip->open_mutex);
 		return 0;
 	}
 	/* ok. now enable and ack CODEC IRQ */
@@ -896,7 +891,6 @@ static int snd_wss_open(struct snd_wss *chip, unsigned int mode)
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	chip->mode = mode;
-	mutex_unlock(&chip->open_mutex);
 	return 0;
 }
 
@@ -904,12 +898,10 @@ static void snd_wss_close(struct snd_wss *chip, unsigned int mode)
 {
 	unsigned long flags;
 
-	mutex_lock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
 	chip->mode &= ~mode;
-	if (chip->mode & WSS_MODE_OPEN) {
-		mutex_unlock(&chip->open_mutex);
+	if (chip->mode & WSS_MODE_OPEN)
 		return;
-	}
 	/* disable IRQ */
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	if (!(chip->hardware & WSS_HW_AD1848_MASK))
@@ -943,7 +935,6 @@ static void snd_wss_close(struct snd_wss *chip, unsigned int mode)
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	chip->mode = 0;
-	mutex_unlock(&chip->open_mutex);
 }
 
 /*
-- 
2.50.1

