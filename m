Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31119F115
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478817; cv=none; b=OClFjvm5STxrw5gKKvuWZBWSP4ywy7HlxcEfJD1Reu4qxMCN606GppwrUNV3V18jjAtB6gp8LMQq/JMfScD/go7cIKM9xHrkYDKqmGkVF4qo/UTYJa/aXwui2ha/8KpcjlZU95hd3ei7N7Hxw1pAWs49cqjTkmlWGLFYml8DcyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478817; c=relaxed/simple;
	bh=IMysr3dn84LGdh4DlADpO1lITSgNwpmFJLlyTueNMZ4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibUtJ3WC8c1P/DfFQrRfAvms/hLhyKYYgB+vyjuW+JZMl9r8mdAPk2x0FtORLkOZCYgpyOtLC6RoLt/2sHG3xXBAO47x3goPlCr3rLaRy9VBY8YFFT1Gmo9GPUJMDjNRT5uGtZjAD846vb5P2MRycQNeppblHpeb1F5bO1ezx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o0pb+jsK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G4DVEkgr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o0pb+jsK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G4DVEkgr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o0pb+jsK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G4DVEkgr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o0pb+jsK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G4DVEkgr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 552655C23E;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m60HLOVrRnB4nmzDGyGlw3SfRzds5EMVzxfpaJXg2Bo=;
	b=o0pb+jsK5HuZ0sTRpbT+8s6JpMOGEpwhPhoJNoYGvL//ybEM/2n5b5zJ3WHx84XJeDTolU
	ckpGx6whcOpLaP27LufNTuK1t/g0kK5NlDeSlcy3gX+UTfdKO5J2dk+2VKFrnq7L/lmLhl
	RYwgnftjuC5x/V584C64NPeXXgkdtYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m60HLOVrRnB4nmzDGyGlw3SfRzds5EMVzxfpaJXg2Bo=;
	b=G4DVEkgrbnbBc6CrBdaZ3gjI43xdkfGDmCq2i0TO3rRzKqblYKOuu2N6SUuRdsFV9nOg3b
	lwswx7XaMHMTgNDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o0pb+jsK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=G4DVEkgr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m60HLOVrRnB4nmzDGyGlw3SfRzds5EMVzxfpaJXg2Bo=;
	b=o0pb+jsK5HuZ0sTRpbT+8s6JpMOGEpwhPhoJNoYGvL//ybEM/2n5b5zJ3WHx84XJeDTolU
	ckpGx6whcOpLaP27LufNTuK1t/g0kK5NlDeSlcy3gX+UTfdKO5J2dk+2VKFrnq7L/lmLhl
	RYwgnftjuC5x/V584C64NPeXXgkdtYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m60HLOVrRnB4nmzDGyGlw3SfRzds5EMVzxfpaJXg2Bo=;
	b=G4DVEkgrbnbBc6CrBdaZ3gjI43xdkfGDmCq2i0TO3rRzKqblYKOuu2N6SUuRdsFV9nOg3b
	lwswx7XaMHMTgNDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DF2913A54;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HX6DbK8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 44/61] ALSA: nm256: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:19 +0200
Message-ID: <20250829144342.4290-45-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 552655C23E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 39464d171f6b..7b2c986bb5ef 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -446,27 +446,25 @@ snd_nm256_set_format(struct nm256 *chip, struct nm256_stream *s,
 /* acquire interrupt */
 static int snd_nm256_acquire_irq(struct nm256 *chip)
 {
-	mutex_lock(&chip->irq_mutex);
+	guard(mutex)(&chip->irq_mutex);
 	if (chip->irq < 0) {
 		if (request_irq(chip->pci->irq, chip->interrupt, IRQF_SHARED,
 				KBUILD_MODNAME, chip)) {
 			dev_err(chip->card->dev,
 				"unable to grab IRQ %d\n", chip->pci->irq);
-			mutex_unlock(&chip->irq_mutex);
 			return -EBUSY;
 		}
 		chip->irq = chip->pci->irq;
 		chip->card->sync_irq = chip->irq;
 	}
 	chip->irq_acks++;
-	mutex_unlock(&chip->irq_mutex);
 	return 0;
 }
 
 /* release interrupt */
 static void snd_nm256_release_irq(struct nm256 *chip)
 {
-	mutex_lock(&chip->irq_mutex);
+	guard(mutex)(&chip->irq_mutex);
 	if (chip->irq_acks > 0)
 		chip->irq_acks--;
 	if (chip->irq_acks == 0 && chip->irq >= 0) {
@@ -474,7 +472,6 @@ static void snd_nm256_release_irq(struct nm256 *chip)
 		chip->irq = -1;
 		chip->card->sync_irq = -1;
 	}
-	mutex_unlock(&chip->irq_mutex);
 }
 
 /*
-- 
2.50.1

