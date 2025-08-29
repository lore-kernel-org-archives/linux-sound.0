Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8018327794
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478733; cv=none; b=dSxoX7EThSeasAusvX63DpmQnewy8TLJ1toCSAgYU9HgH8PEiwIrgW8Nzq5bcGnC+rDzf3ahqK4Rzt78smkQxFrowNqsmMUtBfeDRsIt7gGHWhXDfDePYudcUlP9ZOErKLWp/dy8KLjuFxlth8VczfcNuo/FQw3g0MTTEnyCXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478733; c=relaxed/simple;
	bh=bkhVYiaT2Xp3MEuz7vXKtDt9f7onfzeqDCMRbCuCbHo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgCcTUZXx2SbXZpEjdyJX4tQDt6cBoYf/myO1vn8bRhm9sfYqJJJ6m6sECFfRIhPaYFS/Iy5mOtU09mwxsHrWCJ0p5G6G6obxPc1SOU3dA9z4ArKOHMAYh364aBk3km4fuET+E47pr+d4fn63ReQlNdYIyeaEYBvr2lFm945IJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGF1kXfi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLcZOoTX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGF1kXfi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLcZOoTX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGF1kXfi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLcZOoTX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGF1kXfi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLcZOoTX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CD335C232;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAiyODCcgU7gNr1lQ98aVU+I3jFZHbRPuM8/Fr+8mJY=;
	b=yGF1kXfiylZtuJDN/HBFQDrcTu7O2i3zSVgbjAwpF2x1PtiMy4R2OFqDKRhF1KKs/tMZ9e
	r7ktNK87O4fHU5OGLZKfETMD1n1sGvUrZMIxSrshkRgAugZ4oyrbr7CTcNdSABlmMvYXXx
	m5Pdao7ecq79qqnh6NKlHmmJKOUWoWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAiyODCcgU7gNr1lQ98aVU+I3jFZHbRPuM8/Fr+8mJY=;
	b=PLcZOoTXb/gnZqy4x11Cu1gEU4UBc7/iLvcLrAldjuul+CnnPGwdArZD5pyRS3vb2E+akW
	tK/JwNNBpNVM9BAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yGF1kXfi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PLcZOoTX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAiyODCcgU7gNr1lQ98aVU+I3jFZHbRPuM8/Fr+8mJY=;
	b=yGF1kXfiylZtuJDN/HBFQDrcTu7O2i3zSVgbjAwpF2x1PtiMy4R2OFqDKRhF1KKs/tMZ9e
	r7ktNK87O4fHU5OGLZKfETMD1n1sGvUrZMIxSrshkRgAugZ4oyrbr7CTcNdSABlmMvYXXx
	m5Pdao7ecq79qqnh6NKlHmmJKOUWoWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAiyODCcgU7gNr1lQ98aVU+I3jFZHbRPuM8/Fr+8mJY=;
	b=PLcZOoTXb/gnZqy4x11Cu1gEU4UBc7/iLvcLrAldjuul+CnnPGwdArZD5pyRS3vb2E+akW
	tK/JwNNBpNVM9BAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E757813A54;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +I1bN6+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 26/61] ALSA: emu10k1: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:01 +0200
Message-ID: <20250829144342.4290-27-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 0CD335C232
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emufx.c  | 35 +++++++++++++++--------------------
 sound/pci/emu10k1/memory.c | 20 +++++---------------
 2 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 7db0660e6b61..aaf488978b18 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1026,12 +1026,12 @@ static int snd_emu10k1_icode_poke(struct snd_emu10k1 *emu,
 				  struct snd_emu10k1_fx8010_code *icode,
 				  bool in_kernel)
 {
-	int err = 0;
+	int err;
 
-	mutex_lock(&emu->fx8010.lock);
+	guard(mutex)(&emu->fx8010.lock);
 	err = snd_emu10k1_verify_controls(emu, icode, in_kernel);
 	if (err < 0)
-		goto __error;
+		return err;
 	strscpy(emu->fx8010.name, icode->name, sizeof(emu->fx8010.name));
 	/* stop FX processor - this may be dangerous, but it's better to miss
 	   some samples than generate wrong ones - [jk] */
@@ -1042,27 +1042,25 @@ static int snd_emu10k1_icode_poke(struct snd_emu10k1 *emu,
 	/* ok, do the main job */
 	err = snd_emu10k1_del_controls(emu, icode, in_kernel);
 	if (err < 0)
-		goto __error;
+		return err;
 	err = snd_emu10k1_gpr_poke(emu, icode, in_kernel);
 	if (err < 0)
-		goto __error;
+		return err;
 	err = snd_emu10k1_tram_poke(emu, icode, in_kernel);
 	if (err < 0)
-		goto __error;
+		return err;
 	err = snd_emu10k1_code_poke(emu, icode, in_kernel);
 	if (err < 0)
-		goto __error;
+		return err;
 	err = snd_emu10k1_add_controls(emu, icode, in_kernel);
 	if (err < 0)
-		goto __error;
+		return err;
 	/* start FX processor when the DSP code is updated */
 	if (emu->audigy)
 		snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg);
 	else
 		snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg);
-      __error:
-	mutex_unlock(&emu->fx8010.lock);
-	return err;
+	return 0;
 }
 
 static int snd_emu10k1_icode_peek(struct snd_emu10k1 *emu,
@@ -1070,7 +1068,7 @@ static int snd_emu10k1_icode_peek(struct snd_emu10k1 *emu,
 {
 	int err;
 
-	mutex_lock(&emu->fx8010.lock);
+	guard(mutex)(&emu->fx8010.lock);
 	strscpy(icode->name, emu->fx8010.name, sizeof(icode->name));
 	/* ok, do the main job */
 	err = snd_emu10k1_gpr_peek(emu, icode);
@@ -1080,7 +1078,6 @@ static int snd_emu10k1_icode_peek(struct snd_emu10k1 *emu,
 		err = snd_emu10k1_code_peek(emu, icode);
 	if (err >= 0)
 		err = snd_emu10k1_list_controls(emu, icode);
-	mutex_unlock(&emu->fx8010.lock);
 	return err;
 }
 
@@ -1098,7 +1095,7 @@ static int snd_emu10k1_ipcm_poke(struct snd_emu10k1 *emu,
 	if (ipcm->channels > 32)
 		return -EINVAL;
 	pcm = &emu->fx8010.pcm[ipcm->substream];
-	mutex_lock(&emu->fx8010.lock);
+	guard(mutex)(&emu->fx8010.lock);
 	spin_lock_irq(&emu->reg_lock);
 	if (pcm->opened) {
 		err = -EBUSY;
@@ -1128,7 +1125,6 @@ static int snd_emu10k1_ipcm_poke(struct snd_emu10k1 *emu,
 	}
       __error:
 	spin_unlock_irq(&emu->reg_lock);
-	mutex_unlock(&emu->fx8010.lock);
 	return err;
 }
 
@@ -1144,7 +1140,7 @@ static int snd_emu10k1_ipcm_peek(struct snd_emu10k1 *emu,
 	ipcm->substream = array_index_nospec(ipcm->substream,
 					     EMU10K1_FX8010_PCM_COUNT);
 	pcm = &emu->fx8010.pcm[ipcm->substream];
-	mutex_lock(&emu->fx8010.lock);
+	guard(mutex)(&emu->fx8010.lock);
 	spin_lock_irq(&emu->reg_lock);
 	ipcm->channels = pcm->channels;
 	ipcm->tram_start = pcm->tram_start;
@@ -1160,7 +1156,6 @@ static int snd_emu10k1_ipcm_peek(struct snd_emu10k1 *emu,
 	ipcm->res1 = ipcm->res2 = 0;
 	ipcm->pad = 0;
 	spin_unlock_irq(&emu->reg_lock);
-	mutex_unlock(&emu->fx8010.lock);
 	return err;
 }
 
@@ -2547,9 +2542,9 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, un
 			return -EPERM;
 		if (get_user(addr, (unsigned int __user *)argp))
 			return -EFAULT;
-		mutex_lock(&emu->fx8010.lock);
-		res = snd_emu10k1_fx8010_tram_setup(emu, addr);
-		mutex_unlock(&emu->fx8010.lock);
+		scoped_guard(mutex, &emu->fx8010.lock) {
+			res = snd_emu10k1_fx8010_tram_setup(emu, addr);
+		}
 		return res;
 	case SNDRV_EMU10K1_IOCTL_STOP:
 		if (!capable(CAP_SYS_ADMIN))
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index f6982bc6ff0d..3bccba48f82c 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -315,12 +315,10 @@ snd_emu10k1_alloc_pages(struct snd_emu10k1 *emu, struct snd_pcm_substream *subst
 	if (snd_BUG_ON(!hdr))
 		return NULL;
 
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	blk = search_empty(emu, runtime->dma_bytes);
-	if (blk == NULL) {
-		mutex_unlock(&hdr->block_mutex);
+	if (blk == NULL)
 		return NULL;
-	}
 	/* fill buffer addresses but pointers are not stored so that
 	 * snd_free_pci_page() is not called in synth_free()
 	 */
@@ -335,7 +333,6 @@ snd_emu10k1_alloc_pages(struct snd_emu10k1 *emu, struct snd_pcm_substream *subst
 		if (! is_valid_page(emu, addr)) {
 			dev_err_ratelimited(emu->card->dev,
 				"emu: failure page = %d\n", idx);
-			mutex_unlock(&hdr->block_mutex);
 			return NULL;
 		}
 		emu->page_addr_table[page] = addr;
@@ -347,10 +344,8 @@ snd_emu10k1_alloc_pages(struct snd_emu10k1 *emu, struct snd_pcm_substream *subst
 	err = snd_emu10k1_memblk_map(emu, blk);
 	if (err < 0) {
 		__snd_util_mem_free(hdr, (struct snd_util_memblk *)blk);
-		mutex_unlock(&hdr->block_mutex);
 		return NULL;
 	}
-	mutex_unlock(&hdr->block_mutex);
 	return (struct snd_util_memblk *)blk;
 }
 
@@ -407,19 +402,15 @@ snd_emu10k1_synth_alloc(struct snd_emu10k1 *hw, unsigned int size)
 	struct snd_emu10k1_memblk *blk;
 	struct snd_util_memhdr *hdr = hw->memhdr; 
 
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	blk = (struct snd_emu10k1_memblk *)__snd_util_mem_alloc(hdr, size);
-	if (blk == NULL) {
-		mutex_unlock(&hdr->block_mutex);
+	if (blk == NULL)
 		return NULL;
-	}
 	if (synth_alloc_pages(hw, blk)) {
 		__snd_util_mem_free(hdr, (struct snd_util_memblk *)blk);
-		mutex_unlock(&hdr->block_mutex);
 		return NULL;
 	}
 	snd_emu10k1_memblk_map(hw, blk);
-	mutex_unlock(&hdr->block_mutex);
 	return (struct snd_util_memblk *)blk;
 }
 
@@ -435,14 +426,13 @@ snd_emu10k1_synth_free(struct snd_emu10k1 *emu, struct snd_util_memblk *memblk)
 	struct snd_emu10k1_memblk *blk = (struct snd_emu10k1_memblk *)memblk;
 	unsigned long flags;
 
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	spin_lock_irqsave(&emu->memblk_lock, flags);
 	if (blk->mapped_page >= 0)
 		unmap_memblk(emu, blk);
 	spin_unlock_irqrestore(&emu->memblk_lock, flags);
 	synth_free_pages(emu, blk);
 	__snd_util_mem_free(hdr, memblk);
-	mutex_unlock(&hdr->block_mutex);
 	return 0;
 }
 
-- 
2.50.1

