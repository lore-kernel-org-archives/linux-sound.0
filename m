Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0098D322746
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480466; cv=none; b=HAdQnrvJcmHZ05aOhYAZZN1Pgo/143ihWEI+cFr0XQXrT2gd2Sx3wVTos2iYfbUSQMdmhxN/boGKQjbAi6344lX88eXDpMCYxpCIFFHPbcE/XNUiPzPb6tuPSf3awsRErDQaPk2htf5lgJEhNPNYCNxdfuuwD8P4yYmaAO5RIew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480466; c=relaxed/simple;
	bh=dHh+uq09R6V8D2szutMt0HY+6Ymzqf+SNfAx0Oab7D0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJ7t8WFiLnU5y9qMd2WarBlhj5Ras8V7tnuc/+lnWteEC5JPPIxnIjsbSR73yl+eadxPUdf9HfbrvOcjOwMPB3Yl4cYErafPzHDJnxNaofFDigN5BJXG2AaKHOrroU2Y2BAoU75nUYhSAGaomVyoJ60yGhO+TT/NOf89UOy+S78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQwvF0W8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=49Qamrit; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQwvF0W8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=49Qamrit; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQwvF0W8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="49Qamrit";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQwvF0W8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="49Qamrit"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FD5D33F0B;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKwTIzf1q8uJt7b3NMzjabwiceOsbLNNru4knStf5Wk=;
	b=QQwvF0W8Z9tSe6Rglxs5NRaQDa5Wa5Erhm9Rf/WntxL3f82vSbHzb9qmTOG1L5k/mjSiQq
	8+hykcmLbakJucSl3mKS2m8GMa9N0GJj4eeK5rdwJBTDC0KAZZbL+wir01Vwq8FdDWn/MT
	o0q47Q+Zn+5LF/i8NazY0kfMUqZZsOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKwTIzf1q8uJt7b3NMzjabwiceOsbLNNru4knStf5Wk=;
	b=49QamritSHiv/UcyfhqXW10Xqo3f+n7vjmy80TGdOUjgIJ0uS+w4JQego2rhht4RhBXTpc
	NeADplL9PU7ojLCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QQwvF0W8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=49Qamrit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKwTIzf1q8uJt7b3NMzjabwiceOsbLNNru4knStf5Wk=;
	b=QQwvF0W8Z9tSe6Rglxs5NRaQDa5Wa5Erhm9Rf/WntxL3f82vSbHzb9qmTOG1L5k/mjSiQq
	8+hykcmLbakJucSl3mKS2m8GMa9N0GJj4eeK5rdwJBTDC0KAZZbL+wir01Vwq8FdDWn/MT
	o0q47Q+Zn+5LF/i8NazY0kfMUqZZsOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKwTIzf1q8uJt7b3NMzjabwiceOsbLNNru4knStf5Wk=;
	b=49QamritSHiv/UcyfhqXW10Xqo3f+n7vjmy80TGdOUjgIJ0uS+w4JQego2rhht4RhBXTpc
	NeADplL9PU7ojLCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0604913A6A;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MONBAKfDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/19] ALSA: aaci: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:28 +0200
Message-ID: <20250829151335.7342-15-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 1FD5D33F0B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/aaci.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index 243965615ef2..881d5b067c23 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -73,7 +73,7 @@ static void aaci_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (ac97->num >= 4)
 		return;
 
-	mutex_lock(&aaci->ac97_sem);
+	guard(mutex)(&aaci->ac97_sem);
 
 	aaci_ac97_select_codec(aaci, ac97);
 
@@ -97,8 +97,6 @@ static void aaci_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (v & (SLFR_1TXB|SLFR_2TXB))
 		dev_err(&aaci->dev->dev,
 			"timeout waiting for write to complete\n");
-
-	mutex_unlock(&aaci->ac97_sem);
 }
 
 /*
@@ -113,7 +111,7 @@ static unsigned short aaci_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	if (ac97->num >= 4)
 		return ~0;
 
-	mutex_lock(&aaci->ac97_sem);
+	guard(mutex)(&aaci->ac97_sem);
 
 	aaci_ac97_select_codec(aaci, ac97);
 
@@ -134,8 +132,7 @@ static unsigned short aaci_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 
 	if (v & SLFR_1TXB) {
 		dev_err(&aaci->dev->dev, "timeout on slot 1 TX busy\n");
-		v = ~0;
-		goto out;
+		return ~0;
 	}
 
 	/* Now wait for the response frame */
@@ -151,8 +148,7 @@ static unsigned short aaci_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 
 	if (v != (SLFR_1RXV|SLFR_2RXV)) {
 		dev_err(&aaci->dev->dev, "timeout on RX valid\n");
-		v = ~0;
-		goto out;
+		return ~0;
 	}
 
 	do {
@@ -171,8 +167,6 @@ static unsigned short aaci_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 			v = ~0;
 		}
 	} while (retries);
- out:
-	mutex_unlock(&aaci->ac97_sem);
 	return v;
 }
 
@@ -437,14 +431,13 @@ static int aaci_pcm_open(struct snd_pcm_substream *substream)
 	 */
 	runtime->hw.fifo_size = aaci->fifo_depth * 2;
 
-	mutex_lock(&aaci->irq_lock);
+	guard(mutex)(&aaci->irq_lock);
 	if (!aaci->users++) {
 		ret = request_irq(aaci->dev->irq[0], aaci_irq,
 			   IRQF_SHARED, DRIVER_NAME, aaci);
 		if (ret != 0)
 			aaci->users--;
 	}
-	mutex_unlock(&aaci->irq_lock);
 
 	return ret;
 }
@@ -462,10 +455,9 @@ static int aaci_pcm_close(struct snd_pcm_substream *substream)
 
 	aacirun->substream = NULL;
 
-	mutex_lock(&aaci->irq_lock);
+	guard(mutex)(&aaci->irq_lock);
 	if (!--aaci->users)
 		free_irq(aaci->dev->irq[0], aaci);
-	mutex_unlock(&aaci->irq_lock);
 
 	return 0;
 }
-- 
2.50.1

