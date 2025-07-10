Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD32D5A10
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142180; cv=none; b=gZFZLW1IE0Y9OXdvawuHndubvURGcpCC+krKqFzQV1ziEmhaaCsVd62wFWsarqT/CS1aBRKNzy6brxTxFuSZ2JAGa12anWiwg/RnMJzMLuQ07zTMR93KHti4+F7tsFJ9vcM3Xsgn8acfnr8KBD6ZH1m4QqOUDo38BMFZhyklXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142180; c=relaxed/simple;
	bh=sW6NWR0sJtbg02Oub0m6NDA7qjCFtXvfDPyMVo9Z9oc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkAVG6knUkfycCCDC8h1GZMcbpky5LNRK7mBa3gsRvd7SLWZA+NJ0eeQ/O7H3CuauznSbwR6DMo2qvju0tEgtlYsOqpgCCJ4P5wbgcVyvrjGA2Suzti/G4Pw5gyEx9g1SShBZJ2JQ5OD2lnCfvRn2Wf3zfxv0ub3nDyyDE+X/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUUyuS3a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KwtJ/ghu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUUyuS3a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KwtJ/ghu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUUyuS3a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KwtJ/ghu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUUyuS3a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KwtJ/ghu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31BFF1F747;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLNGKbWl5agArUWclpcJNN7tnqMMei09dCVBsNs0Ktg=;
	b=KUUyuS3a9Yaijx0b9WYihPJ9Pv8GhQYEF+2pvkLeQEM4mfcbct9bFit/lFzJszzMxhteMP
	c3SKYtHhPvOCYD2333Wd90BR1VDB2rcJKk3IHfL4gvGS/X3UGCyd7vKzhJpHrqj+KnX7Jg
	eSQBKbnIKpDmgMbxDV6fcvLwfnnamwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLNGKbWl5agArUWclpcJNN7tnqMMei09dCVBsNs0Ktg=;
	b=KwtJ/ghuIdmNS5dm9l583VHu4qg1G9+gweyWltHbiePTyEcTRQj49vnVN3B3xh6k02I+jc
	3pi77SpLbuliu+BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLNGKbWl5agArUWclpcJNN7tnqMMei09dCVBsNs0Ktg=;
	b=KUUyuS3a9Yaijx0b9WYihPJ9Pv8GhQYEF+2pvkLeQEM4mfcbct9bFit/lFzJszzMxhteMP
	c3SKYtHhPvOCYD2333Wd90BR1VDB2rcJKk3IHfL4gvGS/X3UGCyd7vKzhJpHrqj+KnX7Jg
	eSQBKbnIKpDmgMbxDV6fcvLwfnnamwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLNGKbWl5agArUWclpcJNN7tnqMMei09dCVBsNs0Ktg=;
	b=KwtJ/ghuIdmNS5dm9l583VHu4qg1G9+gweyWltHbiePTyEcTRQj49vnVN3B3xh6k02I+jc
	3pi77SpLbuliu+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1932C136DC;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8JsABfCQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 056/103] ALSA: cs46xx: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:38 +0200
Message-ID: <20250710100727.22653-57-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx.c     |  4 ++--
 sound/pci/cs46xx/cs46xx_lib.c | 20 ++++++++++----------
 sound/pci/cs46xx/dsp_spos.c   |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index 8634004a606b..9c1995737eb7 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -107,8 +107,8 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 
 	snd_cs46xx_gameport(chip);
 
-	strcpy(card->driver, "CS46xx");
-	strcpy(card->shortname, "Sound Fusion CS46xx");
+	strscpy(card->driver, "CS46xx");
+	strscpy(card->shortname, "Sound Fusion CS46xx");
 	sprintf(card->longname, "%s at 0x%lx/0x%lx, irq %i",
 		card->shortname,
 		chip->ba0_addr,
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index fb733633740b..85a7988cf822 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1760,7 +1760,7 @@ int snd_cs46xx_pcm(struct snd_cs46xx *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "CS46xx");
+	strscpy(pcm->name, "CS46xx");
 	chip->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1787,7 +1787,7 @@ int snd_cs46xx_pcm_rear(struct snd_cs46xx *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "CS46xx - Rear");
+	strscpy(pcm->name, "CS46xx - Rear");
 	chip->pcm_rear = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1812,7 +1812,7 @@ int snd_cs46xx_pcm_center_lfe(struct snd_cs46xx *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "CS46xx - Center LFE");
+	strscpy(pcm->name, "CS46xx - Center LFE");
 	chip->pcm_center_lfe = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1837,7 +1837,7 @@ int snd_cs46xx_pcm_iec958(struct snd_cs46xx *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "CS46xx - IEC958");
+	strscpy(pcm->name, "CS46xx - IEC958");
 	chip->pcm_iec958 = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -2672,7 +2672,7 @@ int snd_cs46xx_midi(struct snd_cs46xx *chip, int device)
 	err = snd_rawmidi_new(chip->card, "CS46XX", device, 1, 1, &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, "CS46XX");
+	strscpy(rmidi->name, "CS46XX");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_cs46xx_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_cs46xx_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT | SNDRV_RAWMIDI_INFO_INPUT | SNDRV_RAWMIDI_INFO_DUPLEX;
@@ -3853,27 +3853,27 @@ int snd_cs46xx_create(struct snd_card *card,
 	}
 
 	region = &chip->region.name.ba0;
-	strcpy(region->name, "CS46xx_BA0");
+	strscpy(region->name, "CS46xx_BA0");
 	region->base = chip->ba0_addr;
 	region->size = CS46XX_BA0_SIZE;
 
 	region = &chip->region.name.data0;
-	strcpy(region->name, "CS46xx_BA1_data0");
+	strscpy(region->name, "CS46xx_BA1_data0");
 	region->base = chip->ba1_addr + BA1_SP_DMEM0;
 	region->size = CS46XX_BA1_DATA0_SIZE;
 
 	region = &chip->region.name.data1;
-	strcpy(region->name, "CS46xx_BA1_data1");
+	strscpy(region->name, "CS46xx_BA1_data1");
 	region->base = chip->ba1_addr + BA1_SP_DMEM1;
 	region->size = CS46XX_BA1_DATA1_SIZE;
 
 	region = &chip->region.name.pmem;
-	strcpy(region->name, "CS46xx_BA1_pmem");
+	strscpy(region->name, "CS46xx_BA1_pmem");
 	region->base = chip->ba1_addr + BA1_SP_PMEM;
 	region->size = CS46XX_BA1_PRG_SIZE;
 
 	region = &chip->region.name.reg;
-	strcpy(region->name, "CS46xx_BA1_reg");
+	strscpy(region->name, "CS46xx_BA1_reg");
 	region->base = chip->ba1_addr + BA1_SP_REG;
 	region->size = CS46XX_BA1_REG_SIZE;
 
diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index 1db6bc58d6a6..e07f85322f1c 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -203,7 +203,7 @@ add_symbol (struct snd_cs46xx * chip, char * symbol_name, u32 address, int type)
 
 	index = find_free_symbol_index (ins);
 
-	strcpy (ins->symbol_table.symbols[index].symbol_name, symbol_name);
+	strscpy (ins->symbol_table.symbols[index].symbol_name, symbol_name);
 	ins->symbol_table.symbols[index].address = address;
 	ins->symbol_table.symbols[index].symbol_type = type;
 	ins->symbol_table.symbols[index].module = NULL;
@@ -923,7 +923,7 @@ static struct dsp_scb_descriptor * _map_scb (struct snd_cs46xx *chip, char * nam
 	index = find_free_scb_index (ins);
 
 	memset(&ins->scbs[index], 0, sizeof(ins->scbs[index]));
-	strcpy(ins->scbs[index].scb_name, name);
+	strscpy(ins->scbs[index].scb_name, name);
 	ins->scbs[index].address = dest;
 	ins->scbs[index].index = index;
 	ins->scbs[index].ref_count = 1;
@@ -953,9 +953,9 @@ _map_task_tree (struct snd_cs46xx *chip, char * name, u32 dest, u32 size)
 	}
 
 	if (name)
-		strcpy(ins->tasks[ins->ntask].task_name, name);
+		strscpy(ins->tasks[ins->ntask].task_name, name);
 	else
-		strcpy(ins->tasks[ins->ntask].task_name, "(NULL)");
+		strscpy(ins->tasks[ins->ntask].task_name, "(NULL)");
 	ins->tasks[ins->ntask].address = dest;
 	ins->tasks[ins->ntask].size = size;
 
-- 
2.50.0

