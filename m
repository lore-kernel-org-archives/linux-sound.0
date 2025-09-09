Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9B1EDA26
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421825; cv=none; b=VS6rLigC7q0iqzYGS7YEqePtOmOtfyq4ks2pYNIw5So9E8gk+xtXdNDSd7i37bc4mlSbxPpJYbx2GwqLXKywVXwKDm3tBdhJGswi8QvWyAdxG7aNEbddvk/LTQofIVjufrcqusgOq2Tn3qum0vm5+qLAmi9LJ9Tpmo7xAn42Y4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421825; c=relaxed/simple;
	bh=1ZW/9Eie25Xg546VRRBha/o426rgywe20PXKjwkgMcw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSz9ukcFw/CKwcF8iebfHsZsFrbW/pqrEMIDh0huIHADuLOx1EaMnAK1SjdmvdCx9ZrntIEf6J6SEvE3vqH1FHQxVSAPhJ97xelWtG8+WCdGLhKdMqIyDBFmZOz+2LdGup0RCcCQHPmZOG8sEC8Wwik982As3eGGkHBRWcKyU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IbduQjJ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WAfVf0JS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IbduQjJ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WAfVf0JS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IbduQjJ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WAfVf0JS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IbduQjJ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WAfVf0JS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9A721FCFE;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbLfQ1IAbrdBXWT5kGvB/gS+U5hMJieESqLAFyqwa04=;
	b=IbduQjJ+mXixjCxylabKn0rl/PaNpf8gdUypHFqhQ8O9SGd7ruNPsL0UhLwFPG+g+PdOu2
	H6EwkMksF8LTT1AzqyC93HuxqFKtofMcJaQR+s0cU39KdgqOC00QSCK3QJQH1+9ikx91UN
	+nf/gXsCqrYQBJIvDLDefEIudpjBGPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbLfQ1IAbrdBXWT5kGvB/gS+U5hMJieESqLAFyqwa04=;
	b=WAfVf0JSrchRowVFZLabKqDyfQt3I/qexbXt7VR9J/PN9VRRVjAgXkUmm4QuVUy85xfQRg
	smRrI+ZdYAiG+zCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbLfQ1IAbrdBXWT5kGvB/gS+U5hMJieESqLAFyqwa04=;
	b=IbduQjJ+mXixjCxylabKn0rl/PaNpf8gdUypHFqhQ8O9SGd7ruNPsL0UhLwFPG+g+PdOu2
	H6EwkMksF8LTT1AzqyC93HuxqFKtofMcJaQR+s0cU39KdgqOC00QSCK3QJQH1+9ikx91UN
	+nf/gXsCqrYQBJIvDLDefEIudpjBGPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbLfQ1IAbrdBXWT5kGvB/gS+U5hMJieESqLAFyqwa04=;
	b=WAfVf0JSrchRowVFZLabKqDyfQt3I/qexbXt7VR9J/PN9VRRVjAgXkUmm4QuVUy85xfQRg
	smRrI+ZdYAiG+zCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C64B1388C;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yPCjJfYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/14] ALSA: snd_ps3: Use guard() for spin locks
Date: Tue,  9 Sep 2025 14:43:27 +0200
Message-ID: <20250909124331.10670-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909124331.10670-1-tiwai@suse.de>
References: <20250909124331.10670-1-tiwai@suse.de>
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
 sound/ppc/snd_ps3.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index ce7ee2713f9d..225b20f0b71a 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -221,7 +221,6 @@ static int snd_ps3_program_dma(struct snd_ps3_card_info *card,
 	int fill_stages, dma_ch, stage;
 	enum snd_ps3_ch ch;
 	uint32_t ch0_kick_event = 0; /* initialize to mute gcc */
-	unsigned long irqsave;
 	int silent = 0;
 
 	switch (filltype) {
@@ -242,7 +241,7 @@ static int snd_ps3_program_dma(struct snd_ps3_card_info *card,
 
 	snd_ps3_verify_dma_stop(card, 700, 0);
 	fill_stages = 4;
-	spin_lock_irqsave(&card->dma_lock, irqsave);
+	guard(spinlock_irqsave)(&card->dma_lock);
 	for (ch = 0; ch < 2; ch++) {
 		for (stage = 0; stage < fill_stages; stage++) {
 			dma_ch = stage * 2 + ch;
@@ -289,7 +288,6 @@ static int snd_ps3_program_dma(struct snd_ps3_card_info *card,
 	}
 	/* ensure the hardware sees the change */
 	wmb();
-	spin_unlock_irqrestore(&card->dma_lock, irqsave);
 
 	return 0;
 }
@@ -561,7 +559,6 @@ static int snd_ps3_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ps3_card_info *card = snd_pcm_substream_chip(substream);
-	unsigned long irqsave;
 
 	if (!snd_ps3_set_avsetting(substream)) {
 		/* some parameter changed */
@@ -578,8 +575,7 @@ static int snd_ps3_pcm_prepare(struct snd_pcm_substream *substream)
 	}
 
 	/* restart ring buffer pointer */
-	spin_lock_irqsave(&card->dma_lock, irqsave);
-	{
+	scoped_guard(spinlock_irqsave, &card->dma_lock) {
 		card->dma_buffer_size = runtime->dma_bytes;
 
 		card->dma_last_transfer_vaddr[SND_PS3_CH_L] =
@@ -600,7 +596,6 @@ static int snd_ps3_pcm_prepare(struct snd_pcm_substream *substream)
 			 card->dma_start_bus_addr[SND_PS3_CH_L]);
 
 	}
-	spin_unlock_irqrestore(&card->dma_lock, irqsave);
 
 	/* ensure the hardware sees the change */
 	mb();
@@ -618,11 +613,9 @@ static int snd_ps3_pcm_trigger(struct snd_pcm_substream *substream,
 		/* clear outstanding interrupts  */
 		update_reg(PS3_AUDIO_AX_IS, 0);
 
-		spin_lock(&card->dma_lock);
-		{
+		scoped_guard(spinlock, &card->dma_lock) {
 			card->running = 1;
 		}
-		spin_unlock(&card->dma_lock);
 
 		snd_ps3_program_dma(card,
 				    SND_PS3_DMA_FILLTYPE_SILENT_FIRSTFILL);
@@ -636,11 +629,9 @@ static int snd_ps3_pcm_trigger(struct snd_pcm_substream *substream,
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
-		spin_lock(&card->dma_lock);
-		{
+		scoped_guard(spinlock, &card->dma_lock) {
 			card->running = 0;
 		}
-		spin_unlock(&card->dma_lock);
 		snd_ps3_wait_for_dma_stop(card);
 		break;
 	default:
@@ -661,12 +652,10 @@ static snd_pcm_uframes_t snd_ps3_pcm_pointer(
 	size_t bytes;
 	snd_pcm_uframes_t ret;
 
-	spin_lock(&card->dma_lock);
-	{
+	scoped_guard(spinlock, &card->dma_lock) {
 		bytes = (size_t)(card->dma_last_transfer_vaddr[SND_PS3_CH_L] -
 				 card->dma_start_vaddr[SND_PS3_CH_L]);
 	}
-	spin_unlock(&card->dma_lock);
 
 	ret = bytes_to_frames(substream->runtime, bytes * 2);
 
-- 
2.50.1

