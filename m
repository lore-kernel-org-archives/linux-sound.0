Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2C2D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142110; cv=none; b=lAlFGJocArrDO4P84r2PyIRBkG1zZRBq2ihzYNX3OKgPxkM5rv7ajwYYIWU+0lygBmODsrNEjsa15lzCruocQRt0iGneJbmvXzSXPnCjVMC2WNkxutp9STPQedVWTnjgM6XrdJkmzy8AU6et8NLGwPk1We7O1CiR2EotFPUREf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142110; c=relaxed/simple;
	bh=RsCQGaqHx7mbUAfnIs4/xlLsc/0K14Jtcga61soot8U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+BTZQ/u2yxnq4WaZixl/y8h3vGZNp5hiC2+q6NCrGHLetkMgBXpejf/oV0PidHAAqLAk21GcqtlkLzGo7oG9JRyWwSmamIovaX4g3h61iUD91c6h647vQnRpcXcaBSaocE8sKsV/puK0XY/BCZvEEahMS0fxfyypkHyY9qJd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wayxq2Jm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BnDk5a5w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wayxq2Jm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BnDk5a5w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wayxq2Jm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BnDk5a5w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wayxq2Jm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BnDk5a5w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 522D51F457;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjDpxH7MmONlDgRzrCp7ciPmynynV5yzmfd90OQ9gC0=;
	b=wayxq2JmjRjouukVjaAcJTC1Dhi9oL+Mjar59vsfcq5Hqm5VbynL0ESOptrpi16K6EKjCs
	pqSnRDy+Vj/s8eRhtqddGHpcgpGbayehWEWHe/0chX39ukOTMbHvQvERpIvUwsan1LiaK0
	2uF5wqDmq/yPNxMHjxgtFEbKR/PQsqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjDpxH7MmONlDgRzrCp7ciPmynynV5yzmfd90OQ9gC0=;
	b=BnDk5a5wQ/u6qa7K+c9EDzRtUK70IDtac5wqQSQ2mJ9aUL8pt8XOoViAM4b0IvXNa4rx68
	4EKt3L5gHAiwjjDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjDpxH7MmONlDgRzrCp7ciPmynynV5yzmfd90OQ9gC0=;
	b=wayxq2JmjRjouukVjaAcJTC1Dhi9oL+Mjar59vsfcq5Hqm5VbynL0ESOptrpi16K6EKjCs
	pqSnRDy+Vj/s8eRhtqddGHpcgpGbayehWEWHe/0chX39ukOTMbHvQvERpIvUwsan1LiaK0
	2uF5wqDmq/yPNxMHjxgtFEbKR/PQsqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjDpxH7MmONlDgRzrCp7ciPmynynV5yzmfd90OQ9gC0=;
	b=BnDk5a5wQ/u6qa7K+c9EDzRtUK70IDtac5wqQSQ2mJ9aUL8pt8XOoViAM4b0IvXNa4rx68
	4EKt3L5gHAiwjjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DA3F136DC;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mOG9CeyQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 026/103] ALSA: cmi8330: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:08 +0200
Message-ID: <20250710100727.22653-27-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8330.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index 25b4dc181089..e681c2c82474 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -297,7 +297,7 @@ static int snd_cmi8330_mixer(struct snd_card *card, struct snd_cmi8330 *acard)
 	unsigned int idx;
 	int err;
 
-	strcpy(card->mixername, (acard->type == CMI8329) ? "CMI8329" : "CMI8330/C3D");
+	strscpy(card->mixername, (acard->type == CMI8329) ? "CMI8329" : "CMI8330/C3D");
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_cmi8330_controls); idx++) {
 		err = snd_ctl_add(card,
@@ -437,7 +437,7 @@ static int snd_cmi8330_pcm(struct snd_card *card, struct snd_cmi8330 *chip)
 	err = snd_pcm_new(card, (chip->type == CMI8329) ? "CMI8329" : "CMI8330", 0, 1, 1, &pcm);
 	if (err < 0)
 		return err;
-	strcpy(pcm->name, (chip->type == CMI8329) ? "CMI8329" : "CMI8330");
+	strscpy(pcm->name, (chip->type == CMI8329) ? "CMI8329" : "CMI8330");
 	pcm->private_data = chip;
 	
 	/* SB16 */
@@ -590,8 +590,8 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 				mpuport[dev]);
 	}
 
-	strcpy(card->driver, (acard->type == CMI8329) ? "CMI8329" : "CMI8330/C3D");
-	strcpy(card->shortname, (acard->type == CMI8329) ? "C-Media CMI8329" : "C-Media CMI8330/C3D");
+	strscpy(card->driver, (acard->type == CMI8329) ? "CMI8329" : "CMI8330/C3D");
+	strscpy(card->shortname, (acard->type == CMI8329) ? "C-Media CMI8329" : "C-Media CMI8330/C3D");
 	sprintf(card->longname, "%s at 0x%lx, irq %d, dma %d",
 		card->shortname,
 		acard->wss->port,
-- 
2.50.0

