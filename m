Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEDF31AF25
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479201; cv=none; b=ABGRx55aTqg2cpBeZwmDy8kP04UiG31dCGOYV/HTy49Y0hmk1S2mCF9qZwcagaphm1hWffX8q+OmEaKfrapdJdzUoIPlpO38tTBArgyZ1IPQXHOKjx98C9xi0WiJoL5enhXuuSbi91qEXDdKQo3kmFq5kNG1BTvYcOgc6bXu9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479201; c=relaxed/simple;
	bh=rc0t2knI+mpDf8qDu+fu5GbSetX/J1Z2zOSOJLTbmjc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AA3fsx0jpFemS3FvebCzCFhbgYppMNzkLK6+ncdgio5eVIHyF/G3NYEZ72SWdpqelcxJ9P8wR7GSWB/VpIGA/6MnxyGpjX+gRn6U8QYMmQFOrGC7NRn2tQuv3L1vwOUGJwXF0FhJaokj85xD3VBZQvFZ65QRbte2o2Ytl2VkfdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U1VZ7JEL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HbrbdsBl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xid7zbGs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dPppYJfs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U1VZ7JEL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HbrbdsBl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xid7zbGs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dPppYJfs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA8AE226FE;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ycn1WcC82ogINMcOvfx0xgvyodcqwBTkayY0bqv6LI=;
	b=U1VZ7JELISf4Tr48iR0e9u2ebKVwxqD4P4tRqiFe/VZ0XY6gPVR/mmR/tmu+hxBzHF2qnb
	hXo98ToXg+PiVL28YMXA31FnZ9kgTG6zok7371Oa64PCpWyyBwy3ElxEPH0p9+Ls17QE+a
	kjeWn7BHP49U4k/r0bdbact9tRS1li4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ycn1WcC82ogINMcOvfx0xgvyodcqwBTkayY0bqv6LI=;
	b=HbrbdsBlxSFlObwei8xSBpi7usjWgR3bQod7yY8tD5UCBQa9xdeoA0nMxJHIxCZBP7f7Rr
	r0XaMQRW6CwWEDDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ycn1WcC82ogINMcOvfx0xgvyodcqwBTkayY0bqv6LI=;
	b=Xid7zbGsQpejsjB1O1J/pzXf+2pKa1jxAtlMHR69eOEbjLOwCxVTNJgPt4bGU5zsYtcqva
	T8xzliDr9HcRzNzQRPdcwUzH3Y9WG0zYYU1wXPHkCuPTiBRGBsqHkezVesh9+5hNV6U0AS
	WffKN5jBFjF9K6vEquypBAzpogJhTjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ycn1WcC82ogINMcOvfx0xgvyodcqwBTkayY0bqv6LI=;
	b=dPppYJfsqBtUSOGdWfExLF/V8sxvKVMICi8iMSotoCw3Y7Cg9/UW139g6pGYcC2mYdD8LQ
	aHgvjTKrbdShxxBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD10913A6A;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4HvcMNa+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/18] ALSA: cmi8330: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:42 +0200
Message-ID: <20250829145300.5460-3-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8330.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index e681c2c82474..3d1f19321b9e 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -269,18 +269,17 @@ static const unsigned char cmi8330_sb_init_values[][2] = {
 static int cmi8330_add_sb_mixers(struct snd_sb *chip)
 {
 	int idx, err;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->mixer_lock, flags);
-	snd_sbmixer_write(chip, 0x00, 0x00);		/* mixer reset */
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+		snd_sbmixer_write(chip, 0x00, 0x00);	/* mixer reset */
+	}
 
 	/* mute and zero volume channels */
 	for (idx = 0; idx < ARRAY_SIZE(cmi8330_sb_init_values); idx++) {
-		spin_lock_irqsave(&chip->mixer_lock, flags);
-		snd_sbmixer_write(chip, cmi8330_sb_init_values[idx][0],
-				  cmi8330_sb_init_values[idx][1]);
-		spin_unlock_irqrestore(&chip->mixer_lock, flags);
+		scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+			snd_sbmixer_write(chip, cmi8330_sb_init_values[idx][0],
+					  cmi8330_sb_init_values[idx][1]);
+		}
 	}
 
 	for (idx = 0; idx < ARRAY_SIZE(cmi8330_sb_mixers); idx++) {
-- 
2.50.1

