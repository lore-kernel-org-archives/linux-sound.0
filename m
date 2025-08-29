Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6652EA170
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478725; cv=none; b=BoL/3OGe143sxk3oxE/dlmNv7dym4Fr0y41mFkK1JyRLMMh21r6qnKDgMlQAu03Wh84xKdZF1In+GY+/323/yT5RMc+ntOkGdWXKx+0iSqBNta7SbpdDT7wLmX3EyjJFunf1xkRSSaF/yJFIPqyq9ZKdoTG28b+z2FKL/NnHE3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478725; c=relaxed/simple;
	bh=mdDPbG0K8IB5Kkw159KrKEqMGBWVpbl3WHhyQK8Y0mE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cP34CY+q/tNJEPfTnSmrASqImxVtocdATSYJ0olE2LvXHPxap1LpBXEI1zHFKvaVwgwFvAoW33Cs7nzJy5lF0i3sZsIXl1tck8GiW4cLXk9TPO822Q+e0hY62poSBUqqDr+BXeBoF3TBXpIjk383JBUGAag9AZCpgRhTJCRDXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mka34p8h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LQlcYYqN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mka34p8h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LQlcYYqN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mka34p8h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LQlcYYqN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mka34p8h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LQlcYYqN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80FF45C231;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A05nHt+7kJzBXUBks2PFHTMFN3qiuq1RDoWuPtnOCls=;
	b=mka34p8hr0+e1QUwQyuy693fVksN5oTQIu9qR6CppR9Y16v0GFGse+oCDRyXg7CAtl6+gW
	PPtULPLeCE4zLpLAY3GGAADaFljikLbCB0xoOEziUvsJflt9HNc9EcQt/z5B9BG8lErzIY
	ilD7fdc5ga5ffbdZEWOfUXwkSbWcixg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A05nHt+7kJzBXUBks2PFHTMFN3qiuq1RDoWuPtnOCls=;
	b=LQlcYYqNPASIZEGDR5OBjGa5SpbIQ/rumn5eR1yc/uWGVoSq6v51HGgQMImFTtaO44xBXi
	Y4AA5tBkgFc7plAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mka34p8h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LQlcYYqN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A05nHt+7kJzBXUBks2PFHTMFN3qiuq1RDoWuPtnOCls=;
	b=mka34p8hr0+e1QUwQyuy693fVksN5oTQIu9qR6CppR9Y16v0GFGse+oCDRyXg7CAtl6+gW
	PPtULPLeCE4zLpLAY3GGAADaFljikLbCB0xoOEziUvsJflt9HNc9EcQt/z5B9BG8lErzIY
	ilD7fdc5ga5ffbdZEWOfUXwkSbWcixg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A05nHt+7kJzBXUBks2PFHTMFN3qiuq1RDoWuPtnOCls=;
	b=LQlcYYqNPASIZEGDR5OBjGa5SpbIQ/rumn5eR1yc/uWGVoSq6v51HGgQMImFTtaO44xBXi
	Y4AA5tBkgFc7plAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66AF213A54;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4CLvF6+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 22/61] ALSA: ctxfi: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:57 +0200
Message-ID: <20250829144342.4290-23-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 80FF45C231
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctatc.c  | 28 +++++++++++++---------------
 sound/pci/ctxfi/ctvmem.c | 16 ++++++----------
 2 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 2a3e9d8ba7db..14779b383d9e 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -295,10 +295,10 @@ static int atc_pcm_playback_prepare(struct ct_atc *atc, struct ct_atc_pcm *apcm)
 	src = apcm->src;
 	for (i = 0; i < n_amixer; i++) {
 		amixer = apcm->amixers[i];
-		mutex_lock(&atc->atc_mutex);
-		amixer->ops->setup(amixer, &src->rsc,
-					INIT_VOL, atc->pcm[i+device*2]);
-		mutex_unlock(&atc->atc_mutex);
+		scoped_guard(mutex, &atc->atc_mutex) {
+			amixer->ops->setup(amixer, &src->rsc,
+					   INIT_VOL, atc->pcm[i+device*2]);
+		}
 		src = src->ops->next_interleave(src);
 		if (!src)
 			src = apcm->src;
@@ -874,7 +874,7 @@ spdif_passthru_playback_setup(struct ct_atc *atc, struct ct_atc_pcm *apcm)
 		return -ENOENT;
 	}
 
-	mutex_lock(&atc->atc_mutex);
+	guard(mutex)(&atc->atc_mutex);
 	dao->ops->get_spos(dao, &status);
 	if (((status >> 24) & IEC958_AES3_CON_FS) != iec958_con_fs) {
 		status &= ~(IEC958_AES3_CON_FS << 24);
@@ -884,7 +884,6 @@ spdif_passthru_playback_setup(struct ct_atc *atc, struct ct_atc_pcm *apcm)
 	}
 	if ((rate != atc->pll_rate) && (32000 != rate))
 		err = atc_pll_init(atc, rate);
-	mutex_unlock(&atc->atc_mutex);
 
 	return err;
 }
@@ -921,13 +920,13 @@ spdif_passthru_playback_prepare(struct ct_atc *atc, struct ct_atc_pcm *apcm)
 			src = apcm->src;
 	}
 	/* Connect to SPDIFOO */
-	mutex_lock(&atc->atc_mutex);
-	dao = container_of(atc->daios[SPDIFOO], struct dao, daio);
-	amixer = apcm->amixers[0];
-	dao->ops->set_left_input(dao, &amixer->rsc);
-	amixer = apcm->amixers[1];
-	dao->ops->set_right_input(dao, &amixer->rsc);
-	mutex_unlock(&atc->atc_mutex);
+	scoped_guard(mutex, &atc->atc_mutex) {
+		dao = container_of(atc->daios[SPDIFOO], struct dao, daio);
+		amixer = apcm->amixers[0];
+		dao->ops->set_left_input(dao, &amixer->rsc);
+		amixer = apcm->amixers[1];
+		dao->ops->set_right_input(dao, &amixer->rsc);
+	}
 
 	ct_timer_prepare(apcm->timer);
 
@@ -1115,7 +1114,7 @@ static int atc_spdif_out_passthru(struct ct_atc *atc, unsigned char state)
 	struct rsc *rscs[2] = {NULL};
 	unsigned int spos = 0;
 
-	mutex_lock(&atc->atc_mutex);
+	guard(mutex)(&atc->atc_mutex);
 	dao = container_of(atc->daios[SPDIFOO], struct dao, daio);
 	da_dsc.msr = state ? 1 : atc->msr;
 	da_dsc.passthru = state ? 1 : 0;
@@ -1133,7 +1132,6 @@ static int atc_spdif_out_passthru(struct ct_atc *atc, unsigned char state)
 	}
 	dao->ops->set_spos(dao, spos);
 	dao->ops->commit_write(dao);
-	mutex_unlock(&atc->atc_mutex);
 
 	return err;
 }
diff --git a/sound/pci/ctxfi/ctvmem.c b/sound/pci/ctxfi/ctvmem.c
index 7a805c4a58e1..823d6e240a07 100644
--- a/sound/pci/ctxfi/ctvmem.c
+++ b/sound/pci/ctxfi/ctvmem.c
@@ -29,7 +29,7 @@
 static struct ct_vm_block *
 get_vm_block(struct ct_vm *vm, unsigned int size, struct ct_atc *atc)
 {
-	struct ct_vm_block *block = NULL, *entry;
+	struct ct_vm_block *block, *entry;
 	struct list_head *pos;
 
 	size = CT_PAGE_ALIGN(size);
@@ -39,26 +39,25 @@ get_vm_block(struct ct_vm *vm, unsigned int size, struct ct_atc *atc)
 		return NULL;
 	}
 
-	mutex_lock(&vm->lock);
+	guard(mutex)(&vm->lock);
 	list_for_each(pos, &vm->unused) {
 		entry = list_entry(pos, struct ct_vm_block, list);
 		if (entry->size >= size)
 			break; /* found a block that is big enough */
 	}
 	if (pos == &vm->unused)
-		goto out;
+		return NULL;
 
 	if (entry->size == size) {
 		/* Move the vm node from unused list to used list directly */
 		list_move(&entry->list, &vm->used);
 		vm->size -= size;
-		block = entry;
-		goto out;
+		return entry;
 	}
 
 	block = kzalloc(sizeof(*block), GFP_KERNEL);
 	if (!block)
-		goto out;
+		return NULL;
 
 	block->addr = entry->addr;
 	block->size = size;
@@ -67,8 +66,6 @@ get_vm_block(struct ct_vm *vm, unsigned int size, struct ct_atc *atc)
 	entry->size -= size;
 	vm->size -= size;
 
- out:
-	mutex_unlock(&vm->lock);
 	return block;
 }
 
@@ -79,7 +76,7 @@ static void put_vm_block(struct ct_vm *vm, struct ct_vm_block *block)
 
 	block->size = CT_PAGE_ALIGN(block->size);
 
-	mutex_lock(&vm->lock);
+	guard(mutex)(&vm->lock);
 	list_del(&block->list);
 	vm->size += block->size;
 
@@ -116,7 +113,6 @@ static void put_vm_block(struct ct_vm *vm, struct ct_vm_block *block)
 		pos = pre;
 		pre = pos->prev;
 	}
-	mutex_unlock(&vm->lock);
 }
 
 /* Map host addr (kmalloced/vmalloced) to device logical addr. */
-- 
2.50.1

