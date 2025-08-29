Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D13203B2
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478695; cv=none; b=NIjWPHFtuPU7m9I7LEyhLYJ64t7SI0WjVdwRxVFJce9VZDZIkXZMaDvSxam2fWNDGZvlm1aT50W42UWHiYKHVaeMchKNWX3EUQXMT3jCNVmUIFi3lMmDeyjZbTCNdJ4i7zrZyCmmKqePHHoKaYxPZIXgB6Owad7RlVyKOzbenl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478695; c=relaxed/simple;
	bh=1G2j00QCfUZ32yGc29viEGr+sH25KiYyOUlG/exBMIk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkaVHT6jujZlwiCwJor8MMMA7B2CUC/ZY5O8jMbo/klOoa1d2QR+F0M0Tm1es/6tdhOFo8+Jra1SehW+QFbrafYloPIidRYeawanpCJbQpGZWdytEJz6+6Xj4wvnVeFgKbyl4JyTueyL0MnW/UghtIDJo30YEqGTtGu+alaCvFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2JjjGeAH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/77QZLg/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2JjjGeAH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/77QZLg/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2JjjGeAH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/77QZLg/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2JjjGeAH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/77QZLg/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F4C033EC6;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gm5OSG2Kzp1GrBsovNaPeFw8hwOBaPNv6JzFcmODOfQ=;
	b=2JjjGeAHtcSFAJ680gqhFCJU+Fq3PJl06hfbdneKIVYeXXcP1euMz9ONcDmPWqMamhBgeg
	W62gB4mCuvW+YEfYdZjMJq2FYW9b2PDZuyVa0GUQe6ReViyF/zwOhzGz3xQ8rR45mtckB5
	dWkmCo/iOpzqnXbMPdjDYGAW69NnwBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gm5OSG2Kzp1GrBsovNaPeFw8hwOBaPNv6JzFcmODOfQ=;
	b=/77QZLg/vWnO4VFW8lToZNlDu7W6g6HKxQ0/x1RswSKOXQpZIHp3Dkj4o6IMhFhyM05lfk
	1QVfqoXeSksfTMCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gm5OSG2Kzp1GrBsovNaPeFw8hwOBaPNv6JzFcmODOfQ=;
	b=2JjjGeAHtcSFAJ680gqhFCJU+Fq3PJl06hfbdneKIVYeXXcP1euMz9ONcDmPWqMamhBgeg
	W62gB4mCuvW+YEfYdZjMJq2FYW9b2PDZuyVa0GUQe6ReViyF/zwOhzGz3xQ8rR45mtckB5
	dWkmCo/iOpzqnXbMPdjDYGAW69NnwBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gm5OSG2Kzp1GrBsovNaPeFw8hwOBaPNv6JzFcmODOfQ=;
	b=/77QZLg/vWnO4VFW8lToZNlDu7W6g6HKxQ0/x1RswSKOXQpZIHp3Dkj4o6IMhFhyM05lfk
	1QVfqoXeSksfTMCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85A0E13A3E;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gMR9H6+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 23/61] ALSA: ctxfi: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:58 +0200
Message-ID: <20250829144342.4290-24-tiwai@suse.de>
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

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctamixer.c |  67 +++++++++++-------------
 sound/pci/ctxfi/ctdaio.c   |  42 ++++++---------
 sound/pci/ctxfi/cthw20k1.c |  39 +++-----------
 sound/pci/ctxfi/ctsrc.c    | 101 +++++++++++++++----------------------
 sound/pci/ctxfi/cttimer.c  |  63 +++++++++--------------
 5 files changed, 115 insertions(+), 197 deletions(-)

diff --git a/sound/pci/ctxfi/ctamixer.c b/sound/pci/ctxfi/ctamixer.c
index 397900929aa6..bb4658592636 100644
--- a/sound/pci/ctxfi/ctamixer.c
+++ b/sound/pci/ctxfi/ctamixer.c
@@ -231,7 +231,6 @@ static int get_amixer_rsc(struct amixer_mgr *mgr,
 	int err, i;
 	unsigned int idx;
 	struct amixer *amixer;
-	unsigned long flags;
 
 	*ramixer = NULL;
 
@@ -243,15 +242,15 @@ static int get_amixer_rsc(struct amixer_mgr *mgr,
 	/* Check whether there are sufficient
 	 * amixer resources to meet request. */
 	err = 0;
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i = 0; i < desc->msr; i++) {
-		err = mgr_get_resource(&mgr->mgr, 1, &idx);
-		if (err)
-			break;
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i = 0; i < desc->msr; i++) {
+			err = mgr_get_resource(&mgr->mgr, 1, &idx);
+			if (err)
+				break;
 
-		amixer->idx[i] = idx;
+			amixer->idx[i] = idx;
+		}
 	}
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
 	if (err) {
 		dev_err(mgr->card->dev,
 			"Can't meet AMIXER resource request!\n");
@@ -267,25 +266,23 @@ static int get_amixer_rsc(struct amixer_mgr *mgr,
 	return 0;
 
 error:
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i--; i >= 0; i--)
-		mgr_put_resource(&mgr->mgr, 1, amixer->idx[i]);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i--; i >= 0; i--)
+			mgr_put_resource(&mgr->mgr, 1, amixer->idx[i]);
+	}
 
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
 	kfree(amixer);
 	return err;
 }
 
 static int put_amixer_rsc(struct amixer_mgr *mgr, struct amixer *amixer)
 {
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i = 0; i < amixer->rsc.msr; i++)
-		mgr_put_resource(&mgr->mgr, 1, amixer->idx[i]);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i = 0; i < amixer->rsc.msr; i++)
+			mgr_put_resource(&mgr->mgr, 1, amixer->idx[i]);
+	}
 	amixer_rsc_uninit(amixer);
 	kfree(amixer);
 
@@ -387,7 +384,6 @@ static int get_sum_rsc(struct sum_mgr *mgr,
 	int err, i;
 	unsigned int idx;
 	struct sum *sum;
-	unsigned long flags;
 
 	*rsum = NULL;
 
@@ -398,15 +394,15 @@ static int get_sum_rsc(struct sum_mgr *mgr,
 
 	/* Check whether there are sufficient sum resources to meet request. */
 	err = 0;
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i = 0; i < desc->msr; i++) {
-		err = mgr_get_resource(&mgr->mgr, 1, &idx);
-		if (err)
-			break;
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i = 0; i < desc->msr; i++) {
+			err = mgr_get_resource(&mgr->mgr, 1, &idx);
+			if (err)
+				break;
 
-		sum->idx[i] = idx;
+			sum->idx[i] = idx;
+		}
 	}
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
 	if (err) {
 		dev_err(mgr->card->dev,
 			"Can't meet SUM resource request!\n");
@@ -422,25 +418,22 @@ static int get_sum_rsc(struct sum_mgr *mgr,
 	return 0;
 
 error:
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i--; i >= 0; i--)
-		mgr_put_resource(&mgr->mgr, 1, sum->idx[i]);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i--; i >= 0; i--)
+			mgr_put_resource(&mgr->mgr, 1, sum->idx[i]);
+	}
 	kfree(sum);
 	return err;
 }
 
 static int put_sum_rsc(struct sum_mgr *mgr, struct sum *sum)
 {
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i = 0; i < sum->rsc.msr; i++)
-		mgr_put_resource(&mgr->mgr, 1, sum->idx[i]);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i = 0; i < sum->rsc.msr; i++)
+			mgr_put_resource(&mgr->mgr, 1, sum->idx[i]);
+	}
 	sum_rsc_uninit(sum);
 	kfree(sum);
 
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 806c4d754387..c0c3f8ab8467 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -503,14 +503,13 @@ static int get_daio_rsc(struct daio_mgr *mgr,
 			struct daio **rdaio)
 {
 	int err;
-	unsigned long flags;
 
 	*rdaio = NULL;
 
 	/* Check whether there are sufficient daio resources to meet request. */
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	err = daio_mgr_get_rsc(&mgr->mgr, desc->type);
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		err = daio_mgr_get_rsc(&mgr->mgr, desc->type);
+	}
 	if (err) {
 		dev_err(mgr->card->dev,
 			"Can't meet DAIO resource request!\n");
@@ -551,22 +550,20 @@ static int get_daio_rsc(struct daio_mgr *mgr,
 	return 0;
 
 error:
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	daio_mgr_put_rsc(&mgr->mgr, desc->type);
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		daio_mgr_put_rsc(&mgr->mgr, desc->type);
+	}
 	return err;
 }
 
 static int put_daio_rsc(struct daio_mgr *mgr, struct daio *daio)
 {
-	unsigned long flags;
-
 	mgr->daio_disable(mgr, daio);
 	mgr->commit_write(mgr);
 
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	daio_mgr_put_rsc(&mgr->mgr, daio->type);
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		daio_mgr_put_rsc(&mgr->mgr, daio->type);
+	}
 
 	if (daio->type <= DAIO_OUT_MAX) {
 		dao_rsc_uninit(container_of(daio, struct dao, daio));
@@ -622,34 +619,26 @@ static int daio_map_op(void *data, struct imapper *entry)
 
 static int daio_imap_add(struct daio_mgr *mgr, struct imapper *entry)
 {
-	unsigned long flags;
-	int err;
-
-	spin_lock_irqsave(&mgr->imap_lock, flags);
+	guard(spinlock_irqsave)(&mgr->imap_lock);
 	if (!entry->addr && mgr->init_imap_added) {
 		input_mapper_delete(&mgr->imappers, mgr->init_imap,
 							daio_map_op, mgr);
 		mgr->init_imap_added = 0;
 	}
-	err = input_mapper_add(&mgr->imappers, entry, daio_map_op, mgr);
-	spin_unlock_irqrestore(&mgr->imap_lock, flags);
-
-	return err;
+	return input_mapper_add(&mgr->imappers, entry, daio_map_op, mgr);
 }
 
 static int daio_imap_delete(struct daio_mgr *mgr, struct imapper *entry)
 {
-	unsigned long flags;
 	int err;
 
-	spin_lock_irqsave(&mgr->imap_lock, flags);
+	guard(spinlock_irqsave)(&mgr->imap_lock);
 	err = input_mapper_delete(&mgr->imappers, entry, daio_map_op, mgr);
 	if (list_empty(&mgr->imappers)) {
 		input_mapper_add(&mgr->imappers, mgr->init_imap,
 							daio_map_op, mgr);
 		mgr->init_imap_added = 1;
 	}
-	spin_unlock_irqrestore(&mgr->imap_lock, flags);
 
 	return err;
 }
@@ -719,12 +708,11 @@ int daio_mgr_create(struct hw *hw, void **rdaio_mgr)
 int daio_mgr_destroy(void *ptr)
 {
 	struct daio_mgr *daio_mgr = ptr;
-	unsigned long flags;
 
 	/* free daio input mapper list */
-	spin_lock_irqsave(&daio_mgr->imap_lock, flags);
-	free_input_mapper_list(&daio_mgr->imappers);
-	spin_unlock_irqrestore(&daio_mgr->imap_lock, flags);
+	scoped_guard(spinlock_irqsave, &daio_mgr->imap_lock) {
+		free_input_mapper_list(&daio_mgr->imappers);
+	}
 
 	rsc_mgr_uninit(&daio_mgr->mgr);
 	kfree(daio_mgr);
diff --git a/sound/pci/ctxfi/cthw20k1.c b/sound/pci/ctxfi/cthw20k1.c
index 9edbf5d8c3c7..42b90c9b2ee9 100644
--- a/sound/pci/ctxfi/cthw20k1.c
+++ b/sound/pci/ctxfi/cthw20k1.c
@@ -2091,57 +2091,30 @@ static int hw_resume(struct hw *hw, struct card_conf *info)
 
 static u32 hw_read_20kx(struct hw *hw, u32 reg)
 {
-	u32 value;
-	unsigned long flags;
-
-	spin_lock_irqsave(
-		&container_of(hw, struct hw20k1, hw)->reg_20k1_lock, flags);
+	guard(spinlock_irqsave)(&container_of(hw, struct hw20k1, hw)->reg_20k1_lock);
 	outl(reg, hw->io_base + 0x0);
-	value = inl(hw->io_base + 0x4);
-	spin_unlock_irqrestore(
-		&container_of(hw, struct hw20k1, hw)->reg_20k1_lock, flags);
-
-	return value;
+	return inl(hw->io_base + 0x4);
 }
 
 static void hw_write_20kx(struct hw *hw, u32 reg, u32 data)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(
-		&container_of(hw, struct hw20k1, hw)->reg_20k1_lock, flags);
+	guard(spinlock_irqsave)(&container_of(hw, struct hw20k1, hw)->reg_20k1_lock);
 	outl(reg, hw->io_base + 0x0);
 	outl(data, hw->io_base + 0x4);
-	spin_unlock_irqrestore(
-		&container_of(hw, struct hw20k1, hw)->reg_20k1_lock, flags);
-
 }
 
 static u32 hw_read_pci(struct hw *hw, u32 reg)
 {
-	u32 value;
-	unsigned long flags;
-
-	spin_lock_irqsave(
-		&container_of(hw, struct hw20k1, hw)->reg_pci_lock, flags);
+	guard(spinlock_irqsave)(&container_of(hw, struct hw20k1, hw)->reg_pci_lock);
 	outl(reg, hw->io_base + 0x10);
-	value = inl(hw->io_base + 0x14);
-	spin_unlock_irqrestore(
-		&container_of(hw, struct hw20k1, hw)->reg_pci_lock, flags);
-
-	return value;
+	return inl(hw->io_base + 0x14);
 }
 
 static void hw_write_pci(struct hw *hw, u32 reg, u32 data)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(
-		&container_of(hw, struct hw20k1, hw)->reg_pci_lock, flags);
+	guard(spinlock_irqsave)(&container_of(hw, struct hw20k1, hw)->reg_pci_lock);
 	outl(reg, hw->io_base + 0x10);
 	outl(data, hw->io_base + 0x14);
-	spin_unlock_irqrestore(
-		&container_of(hw, struct hw20k1, hw)->reg_pci_lock, flags);
 }
 
 static const struct hw ct20k1_preset = {
diff --git a/sound/pci/ctxfi/ctsrc.c b/sound/pci/ctxfi/ctsrc.c
index 159bd4008069..46afc9604c08 100644
--- a/sound/pci/ctxfi/ctsrc.c
+++ b/sound/pci/ctxfi/ctsrc.c
@@ -414,18 +414,16 @@ get_src_rsc(struct src_mgr *mgr, const struct src_desc *desc, struct src **rsrc)
 	unsigned int idx = SRC_RESOURCE_NUM;
 	int err;
 	struct src *src;
-	unsigned long flags;
 
 	*rsrc = NULL;
 
 	/* Check whether there are sufficient src resources to meet request. */
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	if (MEMRD == desc->mode)
-		err = mgr_get_resource(&mgr->mgr, desc->multi, &idx);
-	else
-		err = mgr_get_resource(&mgr->mgr, 1, &idx);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		if (MEMRD == desc->mode)
+			err = mgr_get_resource(&mgr->mgr, desc->multi, &idx);
+		else
+			err = mgr_get_resource(&mgr->mgr, 1, &idx);
+	}
 	if (err) {
 		dev_err(mgr->card->dev,
 			"Can't meet SRC resource request!\n");
@@ -454,29 +452,25 @@ get_src_rsc(struct src_mgr *mgr, const struct src_desc *desc, struct src **rsrc)
 error2:
 	kfree(src);
 error1:
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	if (MEMRD == desc->mode)
-		mgr_put_resource(&mgr->mgr, desc->multi, idx);
-	else
-		mgr_put_resource(&mgr->mgr, 1, idx);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		if (MEMRD == desc->mode)
+			mgr_put_resource(&mgr->mgr, desc->multi, idx);
+		else
+			mgr_put_resource(&mgr->mgr, 1, idx);
+	}
 	return err;
 }
 
 static int put_src_rsc(struct src_mgr *mgr, struct src *src)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	src->rsc.ops->master(&src->rsc);
-	if (MEMRD == src->mode)
-		mgr_put_resource(&mgr->mgr, src->multi,
-				 src->rsc.ops->index(&src->rsc));
-	else
-		mgr_put_resource(&mgr->mgr, 1, src->rsc.ops->index(&src->rsc));
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		src->rsc.ops->master(&src->rsc);
+		if (MEMRD == src->mode)
+			mgr_put_resource(&mgr->mgr, src->multi,
+					 src->rsc.ops->index(&src->rsc));
+		else
+			mgr_put_resource(&mgr->mgr, 1, src->rsc.ops->index(&src->rsc));
+	}
 	src_rsc_uninit(src, mgr);
 	kfree(src);
 
@@ -714,7 +708,6 @@ static int get_srcimp_rsc(struct srcimp_mgr *mgr,
 	int err, i;
 	unsigned int idx;
 	struct srcimp *srcimp;
-	unsigned long flags;
 
 	*rsrcimp = NULL;
 
@@ -725,15 +718,15 @@ static int get_srcimp_rsc(struct srcimp_mgr *mgr,
 
 	/* Check whether there are sufficient SRCIMP resources. */
 	err = 0;
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i = 0; i < desc->msr; i++) {
-		err = mgr_get_resource(&mgr->mgr, 1, &idx);
-		if (err)
-			break;
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i = 0; i < desc->msr; i++) {
+			err = mgr_get_resource(&mgr->mgr, 1, &idx);
+			if (err)
+				break;
 
-		srcimp->idx[i] = idx;
+			srcimp->idx[i] = idx;
+		}
 	}
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
 	if (err) {
 		dev_err(mgr->card->dev,
 			"Can't meet SRCIMP resource request!\n");
@@ -749,25 +742,22 @@ static int get_srcimp_rsc(struct srcimp_mgr *mgr,
 	return 0;
 
 error1:
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i--; i >= 0; i--)
-		mgr_put_resource(&mgr->mgr, 1, srcimp->idx[i]);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i--; i >= 0; i--)
+			mgr_put_resource(&mgr->mgr, 1, srcimp->idx[i]);
+	}
 	kfree(srcimp);
 	return err;
 }
 
 static int put_srcimp_rsc(struct srcimp_mgr *mgr, struct srcimp *srcimp)
 {
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&mgr->mgr_lock, flags);
-	for (i = 0; i < srcimp->rsc.msr; i++)
-		mgr_put_resource(&mgr->mgr, 1, srcimp->idx[i]);
-
-	spin_unlock_irqrestore(&mgr->mgr_lock, flags);
+	scoped_guard(spinlock_irqsave, &mgr->mgr_lock) {
+		for (i = 0; i < srcimp->rsc.msr; i++)
+			mgr_put_resource(&mgr->mgr, 1, srcimp->idx[i]);
+	}
 	srcimp_rsc_uninit(srcimp);
 	kfree(srcimp);
 
@@ -790,34 +780,26 @@ static int srcimp_map_op(void *data, struct imapper *entry)
 
 static int srcimp_imap_add(struct srcimp_mgr *mgr, struct imapper *entry)
 {
-	unsigned long flags;
-	int err;
-
-	spin_lock_irqsave(&mgr->imap_lock, flags);
+	guard(spinlock_irqsave)(&mgr->imap_lock);
 	if ((0 == entry->addr) && (mgr->init_imap_added)) {
 		input_mapper_delete(&mgr->imappers,
 				    mgr->init_imap, srcimp_map_op, mgr);
 		mgr->init_imap_added = 0;
 	}
-	err = input_mapper_add(&mgr->imappers, entry, srcimp_map_op, mgr);
-	spin_unlock_irqrestore(&mgr->imap_lock, flags);
-
-	return err;
+	return input_mapper_add(&mgr->imappers, entry, srcimp_map_op, mgr);
 }
 
 static int srcimp_imap_delete(struct srcimp_mgr *mgr, struct imapper *entry)
 {
-	unsigned long flags;
 	int err;
 
-	spin_lock_irqsave(&mgr->imap_lock, flags);
+	guard(spinlock_irqsave)(&mgr->imap_lock);
 	err = input_mapper_delete(&mgr->imappers, entry, srcimp_map_op, mgr);
 	if (list_empty(&mgr->imappers)) {
 		input_mapper_add(&mgr->imappers, mgr->init_imap,
 				 srcimp_map_op, mgr);
 		mgr->init_imap_added = 1;
 	}
-	spin_unlock_irqrestore(&mgr->imap_lock, flags);
 
 	return err;
 }
@@ -870,12 +852,11 @@ int srcimp_mgr_create(struct hw *hw, void **rsrcimp_mgr)
 int srcimp_mgr_destroy(void *ptr)
 {
 	struct srcimp_mgr *srcimp_mgr = ptr;
-	unsigned long flags;
 
 	/* free src input mapper list */
-	spin_lock_irqsave(&srcimp_mgr->imap_lock, flags);
-	free_input_mapper_list(&srcimp_mgr->imappers);
-	spin_unlock_irqrestore(&srcimp_mgr->imap_lock, flags);
+	scoped_guard(spinlock_irqsave, &srcimp_mgr->imap_lock) {
+		free_input_mapper_list(&srcimp_mgr->imappers);
+	}
 
 	rsc_mgr_uninit(&srcimp_mgr->mgr);
 	kfree(srcimp_mgr);
diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
index fa6867adb42b..609b10320ff7 100644
--- a/sound/pci/ctxfi/cttimer.c
+++ b/sound/pci/ctxfi/cttimer.c
@@ -68,7 +68,6 @@ static void ct_systimer_callback(struct timer_list *t)
 	struct ct_atc_pcm *apcm = ti->apcm;
 	unsigned int period_size = runtime->period_size;
 	unsigned int buffer_size = runtime->buffer_size;
-	unsigned long flags;
 	unsigned int position, dist, interval;
 
 	position = substream->ops->pointer(substream);
@@ -82,10 +81,9 @@ static void ct_systimer_callback(struct timer_list *t)
 	 * at 8kHz in 8-bit format or at 88kHz in 24-bit format. */
 	interval = ((period_size - (position % period_size))
 		   * HZ + (runtime->rate - 1)) / runtime->rate + HZ * 5 / 1000;
-	spin_lock_irqsave(&ti->lock, flags);
+	guard(spinlock_irqsave)(&ti->lock);
 	if (ti->running)
 		mod_timer(&ti->timer, jiffies + interval);
-	spin_unlock_irqrestore(&ti->lock, flags);
 }
 
 static void ct_systimer_init(struct ct_timer_instance *ti)
@@ -96,24 +94,19 @@ static void ct_systimer_init(struct ct_timer_instance *ti)
 static void ct_systimer_start(struct ct_timer_instance *ti)
 {
 	struct snd_pcm_runtime *runtime = ti->substream->runtime;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ti->lock, flags);
+	guard(spinlock_irqsave)(&ti->lock);
 	ti->running = 1;
 	mod_timer(&ti->timer,
 		  jiffies + (runtime->period_size * HZ +
 			     (runtime->rate - 1)) / runtime->rate);
-	spin_unlock_irqrestore(&ti->lock, flags);
 }
 
 static void ct_systimer_stop(struct ct_timer_instance *ti)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&ti->lock, flags);
+	guard(spinlock_irqsave)(&ti->lock);
 	ti->running = 0;
 	timer_delete(&ti->timer);
-	spin_unlock_irqrestore(&ti->lock, flags);
 }
 
 static void ct_systimer_prepare(struct ct_timer_instance *ti)
@@ -229,25 +222,22 @@ static int ct_xfitimer_reprogram(struct ct_timer *atimer, int can_update)
 static void ct_xfitimer_check_period(struct ct_timer *atimer)
 {
 	struct ct_timer_instance *ti;
-	unsigned long flags;
 
-	spin_lock_irqsave(&atimer->list_lock, flags);
+	guard(spinlock_irqsave)(&atimer->list_lock);
 	list_for_each_entry(ti, &atimer->instance_head, instance_list) {
 		if (ti->running && ti->need_update) {
 			ti->need_update = 0;
 			ti->apcm->interrupt(ti->apcm);
 		}
 	}
-	spin_unlock_irqrestore(&atimer->list_lock, flags);
 }
 
 /* Handle timer-interrupt */
 static void ct_xfitimer_callback(struct ct_timer *atimer)
 {
 	int update;
-	unsigned long flags;
 
-	spin_lock_irqsave(&atimer->lock, flags);
+	guard(spinlock_irqsave)(&atimer->lock);
 	atimer->irq_handling = 1;
 	do {
 		update = ct_xfitimer_reprogram(atimer, 1);
@@ -257,7 +247,6 @@ static void ct_xfitimer_callback(struct ct_timer *atimer)
 		spin_lock(&atimer->lock);
 	} while (atimer->reprogram);
 	atimer->irq_handling = 0;
-	spin_unlock_irqrestore(&atimer->lock, flags);
 }
 
 static void ct_xfitimer_prepare(struct ct_timer_instance *ti)
@@ -271,45 +260,39 @@ static void ct_xfitimer_prepare(struct ct_timer_instance *ti)
 /* start/stop the timer */
 static void ct_xfitimer_update(struct ct_timer *atimer)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&atimer->lock, flags);
+	guard(spinlock_irqsave)(&atimer->lock);
 	if (atimer->irq_handling) {
 		/* reached from IRQ handler; let it handle later */
 		atimer->reprogram = 1;
-		spin_unlock_irqrestore(&atimer->lock, flags);
 		return;
 	}
 
 	ct_xfitimer_irq_stop(atimer);
 	ct_xfitimer_reprogram(atimer, 0);
-	spin_unlock_irqrestore(&atimer->lock, flags);
 }
 
 static void ct_xfitimer_start(struct ct_timer_instance *ti)
 {
 	struct ct_timer *atimer = ti->timer_base;
-	unsigned long flags;
 
-	spin_lock_irqsave(&atimer->lock, flags);
-	if (list_empty(&ti->running_list))
-		atimer->wc = ct_xfitimer_get_wc(atimer);
-	ti->running = 1;
-	ti->need_update = 0;
-	list_add(&ti->running_list, &atimer->running_head);
-	spin_unlock_irqrestore(&atimer->lock, flags);
+	scoped_guard(spinlock_irqsave, &atimer->lock) {
+		if (list_empty(&ti->running_list))
+			atimer->wc = ct_xfitimer_get_wc(atimer);
+		ti->running = 1;
+		ti->need_update = 0;
+		list_add(&ti->running_list, &atimer->running_head);
+	}
 	ct_xfitimer_update(atimer);
 }
 
 static void ct_xfitimer_stop(struct ct_timer_instance *ti)
 {
 	struct ct_timer *atimer = ti->timer_base;
-	unsigned long flags;
 
-	spin_lock_irqsave(&atimer->lock, flags);
-	list_del_init(&ti->running_list);
-	ti->running = 0;
-	spin_unlock_irqrestore(&atimer->lock, flags);
+	scoped_guard(spinlock_irqsave, &atimer->lock) {
+		list_del_init(&ti->running_list);
+		ti->running = 0;
+	}
 	ct_xfitimer_update(atimer);
 }
 
@@ -347,9 +330,9 @@ ct_timer_instance_new(struct ct_timer *atimer, struct ct_atc_pcm *apcm)
 	if (atimer->ops->init)
 		atimer->ops->init(ti);
 
-	spin_lock_irq(&atimer->list_lock);
-	list_add(&ti->instance_list, &atimer->instance_head);
-	spin_unlock_irq(&atimer->list_lock);
+	scoped_guard(spinlock_irq, &atimer->list_lock) {
+		list_add(&ti->instance_list, &atimer->instance_head);
+	}
 
 	return ti;
 }
@@ -382,9 +365,9 @@ void ct_timer_instance_free(struct ct_timer_instance *ti)
 	if (atimer->ops->free_instance)
 		atimer->ops->free_instance(ti);
 
-	spin_lock_irq(&atimer->list_lock);
-	list_del(&ti->instance_list);
-	spin_unlock_irq(&atimer->list_lock);
+	scoped_guard(spinlock_irq, &atimer->list_lock) {
+		list_del(&ti->instance_list);
+	}
 
 	kfree(ti);
 }
-- 
2.50.1

