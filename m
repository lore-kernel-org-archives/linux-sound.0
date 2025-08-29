Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EF43203B2
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478688; cv=none; b=D9n89WS444wk5489NWhqsKBLdjzew58UK/FHWQ2ulGey5eLOVwuRT6q5KmrvC29m8MliB2seYZs1AsgncWsk5kZphwHH/lQe5ksa/qx+IUUs098XJRV1amBXmpNJDZW8DxlQKsJTQlp0RRkdDwAhHjUCLaNAQgn3LYhkd1Bg1io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478688; c=relaxed/simple;
	bh=RTrs4/Wt9QvhwjT8hid9D1IvZkMF9X1bGCqyn17ppXQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtpHL1HvFDkRTg2oM/dY6MouvU7uG4RViYTVefJdoz3E7G3XkOPLs1b8Mrg+D4wepwhXW2QKj2u+5vwMS2JI+ge+7waPvvFGSNSR9rEDjDw8wXJIDVUdM7O9Kb9I/885SzaryG5evulwtq/s+02LDPCx0BRrH1lc46sguES3efU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sylMxGOk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q2HBrPLz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sylMxGOk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q2HBrPLz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sylMxGOk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2HBrPLz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sylMxGOk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2HBrPLz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2641433ECA;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTwauuXQITNuP1nKRqq0QVl5EUREJ7EDmmNyxtIC/HI=;
	b=sylMxGOklhsrFmTBg59XVbru1VpVpOPNZ/m5ENilFsqlbXcdT6Oer5IvQ8YSup379LUafR
	WRnseW+pX5YqycwwoLxDKeGFSD2SjhWClGAgXjjyYcmpeUBojGsEWuByDvvCBE1rnT3Vz/
	TdamM9T/fwbv4oUdO+87eYMvUC/GGME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTwauuXQITNuP1nKRqq0QVl5EUREJ7EDmmNyxtIC/HI=;
	b=Q2HBrPLzT1rPb013emVFWuJMYJxCOGpRFxXzuHTWiikwWgBtP8kzPNI3WiV9eCJquMFtIL
	tktVX67mJckWsBDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTwauuXQITNuP1nKRqq0QVl5EUREJ7EDmmNyxtIC/HI=;
	b=sylMxGOklhsrFmTBg59XVbru1VpVpOPNZ/m5ENilFsqlbXcdT6Oer5IvQ8YSup379LUafR
	WRnseW+pX5YqycwwoLxDKeGFSD2SjhWClGAgXjjyYcmpeUBojGsEWuByDvvCBE1rnT3Vz/
	TdamM9T/fwbv4oUdO+87eYMvUC/GGME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTwauuXQITNuP1nKRqq0QVl5EUREJ7EDmmNyxtIC/HI=;
	b=Q2HBrPLzT1rPb013emVFWuJMYJxCOGpRFxXzuHTWiikwWgBtP8kzPNI3WiV9eCJquMFtIL
	tktVX67mJckWsBDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6C7613A3E;
	Fri, 29 Aug 2025 14:43:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UHU6N668sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 19/61] ALSA: cs46xx: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:54 +0200
Message-ID: <20250829144342.4290-20-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx_lib.c       | 87 +++++++++++------------------
 sound/pci/cs46xx/dsp_spos.c         | 66 +++++++++-------------
 sound/pci/cs46xx/dsp_spos_scb_lib.c |  3 +-
 3 files changed, 59 insertions(+), 97 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 85a7988cf822..a87571d5b572 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1093,24 +1093,17 @@ static int snd_cs46xx_playback_hw_params(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!sample_rate))
 		return -ENXIO;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 
-	if (_cs46xx_adjust_sample_rate (chip,cpcm,sample_rate)) {
-		mutex_unlock(&chip->spos_mutex);
+	if (_cs46xx_adjust_sample_rate(chip, cpcm, sample_rate))
 		return -ENXIO;
-	}
 
 	snd_BUG_ON(!cpcm->pcm_channel);
-	if (!cpcm->pcm_channel) {
-		mutex_unlock(&chip->spos_mutex);
+	if (!cpcm->pcm_channel)
 		return -ENXIO;
-	}
 
-
-	if (cs46xx_dsp_pcm_channel_set_period (chip,cpcm->pcm_channel,period_size)) {
-		 mutex_unlock(&chip->spos_mutex);
+	if (cs46xx_dsp_pcm_channel_set_period(chip, cpcm->pcm_channel, period_size))
 		 return -EINVAL;
-	 }
 
 	dev_dbg(chip->card->dev,
 		"period_size (%d), periods (%d) buffer_size(%d)\n",
@@ -1144,12 +1137,8 @@ static int snd_cs46xx_playback_hw_params(struct snd_pcm_substream *substream,
 		if (runtime->dma_area == cpcm->hw_buf.area)
 			snd_pcm_set_runtime_buffer(substream, NULL);
 		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-		if (err < 0) {
-#ifdef CONFIG_SND_CS46XX_NEW_DSP
-			mutex_unlock(&chip->spos_mutex);
-#endif
+		if (err < 0)
 			return err;
-		}
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 		if (cpcm->pcm_channel_id == DSP_PCM_MAIN_CHANNEL) {
@@ -1169,10 +1158,6 @@ static int snd_cs46xx_playback_hw_params(struct snd_pcm_substream *substream,
 
 	}
 
-#ifdef CONFIG_SND_CS46XX_NEW_DSP
-	mutex_unlock(&chip->spos_mutex);
-#endif
-
 	return 0;
 }
 
@@ -1495,16 +1480,14 @@ static int _cs46xx_playback_open_channel (struct snd_pcm_substream *substream,in
 
 	cpcm->substream = substream;
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
-	mutex_lock(&chip->spos_mutex);
-	cpcm->pcm_channel = NULL; 
-	cpcm->pcm_channel_id = pcm_channel_id;
-
+	scoped_guard(mutex, &chip->spos_mutex) {
+		cpcm->pcm_channel = NULL;
+		cpcm->pcm_channel_id = pcm_channel_id;
+	}
 
 	snd_pcm_hw_constraint_list(runtime, 0,
 				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 
 				   &hw_constraints_period_sizes);
-
-	mutex_unlock(&chip->spos_mutex);
 #else
 	chip->playback_pcm = cpcm; /* HACK */
 #endif
@@ -1541,9 +1524,9 @@ static int snd_cs46xx_playback_open_iec958(struct snd_pcm_substream *substream)
 
 	dev_dbg(chip->card->dev, "open raw iec958 channel\n");
 
-	mutex_lock(&chip->spos_mutex);
-	cs46xx_iec958_pre_open (chip);
-	mutex_unlock(&chip->spos_mutex);
+	scoped_guard(mutex, &chip->spos_mutex) {
+		cs46xx_iec958_pre_open(chip);
+	}
 
 	return _cs46xx_playback_open_channel(substream,DSP_IEC958_CHANNEL);
 }
@@ -1559,9 +1542,9 @@ static int snd_cs46xx_playback_close_iec958(struct snd_pcm_substream *substream)
 
 	err = snd_cs46xx_playback_close(substream);
 
-	mutex_lock(&chip->spos_mutex);
-	cs46xx_iec958_post_close (chip);
-	mutex_unlock(&chip->spos_mutex);
+	scoped_guard(mutex, &chip->spos_mutex) {
+		cs46xx_iec958_post_close(chip);
+	}
 
 	return err;
 }
@@ -1602,12 +1585,12 @@ static int snd_cs46xx_playback_close(struct snd_pcm_substream *substream)
 	if (!cpcm) return -ENXIO;
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
-	mutex_lock(&chip->spos_mutex);
-	if (cpcm->pcm_channel) {
-		cs46xx_dsp_destroy_pcm_channel(chip,cpcm->pcm_channel);
-		cpcm->pcm_channel = NULL;
+	scoped_guard(mutex, &chip->spos_mutex) {
+		if (cpcm->pcm_channel) {
+			cs46xx_dsp_destroy_pcm_channel(chip, cpcm->pcm_channel);
+			cpcm->pcm_channel = NULL;
+		}
 	}
-	mutex_unlock(&chip->spos_mutex);
 #else
 	chip->playback_pcm = NULL;
 #endif
@@ -1982,15 +1965,15 @@ static int snd_cs46xx_iec958_put(struct snd_kcontrol *kcontrol,
 
 	switch (kcontrol->private_value) {
 	case CS46XX_MIXER_SPDIF_OUTPUT_ELEMENT:
-		mutex_lock(&chip->spos_mutex);
-		change = (chip->dsp_spos_instance->spdif_status_out & DSP_SPDIF_STATUS_OUTPUT_ENABLED);
-		if (ucontrol->value.integer.value[0] && !change) 
-			cs46xx_dsp_enable_spdif_out(chip);
-		else if (change && !ucontrol->value.integer.value[0])
-			cs46xx_dsp_disable_spdif_out(chip);
+		scoped_guard(mutex, &chip->spos_mutex) {
+			change = (chip->dsp_spos_instance->spdif_status_out & DSP_SPDIF_STATUS_OUTPUT_ENABLED);
+			if (ucontrol->value.integer.value[0] && !change)
+				cs46xx_dsp_enable_spdif_out(chip);
+			else if (change && !ucontrol->value.integer.value[0])
+				cs46xx_dsp_disable_spdif_out(chip);
 
-		res = (change != (chip->dsp_spos_instance->spdif_status_out & DSP_SPDIF_STATUS_OUTPUT_ENABLED));
-		mutex_unlock(&chip->spos_mutex);
+			res = (change != (chip->dsp_spos_instance->spdif_status_out & DSP_SPDIF_STATUS_OUTPUT_ENABLED));
+		}
 		break;
 	case CS46XX_MIXER_SPDIF_INPUT_ELEMENT:
 		change = chip->dsp_spos_instance->spdif_status_in;
@@ -2131,12 +2114,11 @@ static int snd_cs46xx_spdif_default_get(struct snd_kcontrol *kcontrol,
 	struct snd_cs46xx *chip = snd_kcontrol_chip(kcontrol);
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	ucontrol->value.iec958.status[0] = _wrap_all_bits((ins->spdif_csuv_default >> 24) & 0xff);
 	ucontrol->value.iec958.status[1] = _wrap_all_bits((ins->spdif_csuv_default >> 16) & 0xff);
 	ucontrol->value.iec958.status[2] = 0;
 	ucontrol->value.iec958.status[3] = _wrap_all_bits((ins->spdif_csuv_default) & 0xff);
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -2149,7 +2131,7 @@ static int snd_cs46xx_spdif_default_put(struct snd_kcontrol *kcontrol,
 	unsigned int val;
 	int change;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	val = ((unsigned int)_wrap_all_bits(ucontrol->value.iec958.status[0]) << 24) |
 		((unsigned int)_wrap_all_bits(ucontrol->value.iec958.status[2]) << 16) |
 		((unsigned int)_wrap_all_bits(ucontrol->value.iec958.status[3]))  |
@@ -2163,8 +2145,6 @@ static int snd_cs46xx_spdif_default_put(struct snd_kcontrol *kcontrol,
 	if ( !(ins->spdif_status_out & DSP_SPDIF_STATUS_PLAYBACK_OPEN) )
 		cs46xx_poke_via_dsp (chip,SP_SPDOUT_CSUV,val);
 
-	mutex_unlock(&chip->spos_mutex);
-
 	return change;
 }
 
@@ -2184,12 +2164,11 @@ static int snd_cs46xx_spdif_stream_get(struct snd_kcontrol *kcontrol,
 	struct snd_cs46xx *chip = snd_kcontrol_chip(kcontrol);
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	ucontrol->value.iec958.status[0] = _wrap_all_bits((ins->spdif_csuv_stream >> 24) & 0xff);
 	ucontrol->value.iec958.status[1] = _wrap_all_bits((ins->spdif_csuv_stream >> 16) & 0xff);
 	ucontrol->value.iec958.status[2] = 0;
 	ucontrol->value.iec958.status[3] = _wrap_all_bits((ins->spdif_csuv_stream) & 0xff);
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -2202,7 +2181,7 @@ static int snd_cs46xx_spdif_stream_put(struct snd_kcontrol *kcontrol,
 	unsigned int val;
 	int change;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	val = ((unsigned int)_wrap_all_bits(ucontrol->value.iec958.status[0]) << 24) |
 		((unsigned int)_wrap_all_bits(ucontrol->value.iec958.status[1]) << 16) |
 		((unsigned int)_wrap_all_bits(ucontrol->value.iec958.status[3])) |
@@ -2216,8 +2195,6 @@ static int snd_cs46xx_spdif_stream_put(struct snd_kcontrol *kcontrol,
 	if ( ins->spdif_status_out & DSP_SPDIF_STATUS_PLAYBACK_OPEN )
 		cs46xx_poke_via_dsp (chip,SP_SPDOUT_CSUV,val);
 
-	mutex_unlock(&chip->spos_mutex);
-
 	return change;
 }
 
diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index e07f85322f1c..a0f908bfe7fa 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -283,7 +283,7 @@ void  cs46xx_dsp_spos_destroy (struct snd_cs46xx * chip)
 	if (snd_BUG_ON(!ins))
 		return;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	for (i = 0; i < ins->nscb; ++i) {
 		if (ins->scbs[i].deleted) continue;
 
@@ -297,7 +297,6 @@ void  cs46xx_dsp_spos_destroy (struct snd_cs46xx * chip)
 	vfree(ins->symbol_table.symbols);
 	kfree(ins->modules);
 	kfree(ins);
-	mutex_unlock(&chip->spos_mutex);
 }
 
 static int dsp_load_parameter(struct snd_cs46xx *chip,
@@ -525,7 +524,7 @@ static void cs46xx_dsp_proc_modules_read (struct snd_info_entry *entry,
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 	int i,j;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	snd_iprintf(buffer, "MODULES:\n");
 	for ( i = 0; i < ins->nmodules; ++i ) {
 		snd_iprintf(buffer, "\n%s:\n", ins->modules[i].module_name);
@@ -538,7 +537,6 @@ static void cs46xx_dsp_proc_modules_read (struct snd_info_entry *entry,
 				    desc->segment_type,desc->offset, desc->size);
 		}
 	}
-	mutex_unlock(&chip->spos_mutex);
 }
 
 static void cs46xx_dsp_proc_task_tree_read (struct snd_info_entry *entry,
@@ -549,7 +547,7 @@ static void cs46xx_dsp_proc_task_tree_read (struct snd_info_entry *entry,
 	int i, j, col;
 	void __iomem *dst = chip->region.idx[1].remap_addr + DSP_PARAMETER_BYTE_OFFSET;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	snd_iprintf(buffer, "TASK TREES:\n");
 	for ( i = 0; i < ins->ntask; ++i) {
 		snd_iprintf(buffer,"\n%04x %s:\n",ins->tasks[i].address,ins->tasks[i].task_name);
@@ -566,7 +564,6 @@ static void cs46xx_dsp_proc_task_tree_read (struct snd_info_entry *entry,
 	}
 
 	snd_iprintf(buffer,"\n");  
-	mutex_unlock(&chip->spos_mutex);
 }
 
 static void cs46xx_dsp_proc_scb_read (struct snd_info_entry *entry,
@@ -576,7 +573,7 @@ static void cs46xx_dsp_proc_scb_read (struct snd_info_entry *entry,
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 	int i;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	snd_iprintf(buffer, "SCB's:\n");
 	for ( i = 0; i < ins->nscb; ++i) {
 		if (ins->scbs[i].deleted)
@@ -599,7 +596,6 @@ static void cs46xx_dsp_proc_scb_read (struct snd_info_entry *entry,
 	}
 
 	snd_iprintf(buffer,"\n");
-	mutex_unlock(&chip->spos_mutex);
 }
 
 static void cs46xx_dsp_proc_parameter_dump_read (struct snd_info_entry *entry,
@@ -831,14 +827,13 @@ int cs46xx_dsp_proc_init (struct snd_card *card, struct snd_cs46xx *chip)
 		snd_info_set_text_ops(entry, chip,
 				      cs46xx_dsp_proc_scb_read);
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	/* register/update SCB's entries on proc */
 	for (i = 0; i < ins->nscb; ++i) {
 		if (ins->scbs[i].deleted) continue;
 
 		cs46xx_dsp_proc_register_scb_desc (chip, (ins->scbs + i));
 	}
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -851,12 +846,13 @@ int cs46xx_dsp_proc_done (struct snd_cs46xx *chip)
 	if (!ins)
 		return 0;
 
-	mutex_lock(&chip->spos_mutex);
-	for (i = 0; i < ins->nscb; ++i) {
-		if (ins->scbs[i].deleted) continue;
-		cs46xx_dsp_proc_free_scb_desc ( (ins->scbs + i) );
+	scoped_guard(mutex, &chip->spos_mutex) {
+		for (i = 0; i < ins->nscb; ++i) {
+			if (ins->scbs[i].deleted)
+				continue;
+			cs46xx_dsp_proc_free_scb_desc((ins->scbs + i));
+		}
 	}
-	mutex_unlock(&chip->spos_mutex);
 
 	snd_info_free_entry(ins->proc_dsp_dir);
 	ins->proc_dsp_dir = NULL;
@@ -1677,7 +1673,7 @@ int cs46xx_dsp_enable_spdif_in (struct snd_cs46xx *chip)
 	if (snd_BUG_ON(!ins->spdif_in_src))
 		return -EINVAL;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 
 	if ( ! (ins->spdif_status_out & DSP_SPDIF_STATUS_INPUT_CTRL_ENABLED) ) {
 		/* time countdown enable */
@@ -1721,7 +1717,6 @@ int cs46xx_dsp_enable_spdif_in (struct snd_cs46xx *chip)
 
 	/* monitor state */
 	ins->spdif_status_in = 1;
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -1735,17 +1730,16 @@ int cs46xx_dsp_disable_spdif_in (struct snd_cs46xx *chip)
 	if (snd_BUG_ON(!ins->spdif_in_src))
 		return -EINVAL;
 
-	mutex_lock(&chip->spos_mutex);
+	scoped_guard(mutex, &chip->spos_mutex) {
+		/* Remove the asynchronous receiver SCB */
+		cs46xx_dsp_remove_scb(chip, ins->asynch_rx_scb);
+		ins->asynch_rx_scb = NULL;
 
-	/* Remove the asynchronous receiver SCB */
-	cs46xx_dsp_remove_scb (chip,ins->asynch_rx_scb);
-	ins->asynch_rx_scb = NULL;
+		cs46xx_src_unlink(chip, ins->spdif_in_src);
 
-	cs46xx_src_unlink(chip,ins->spdif_in_src);
-
-	/* monitor state */
-	ins->spdif_status_in = 0;
-	mutex_unlock(&chip->spos_mutex);
+		/* monitor state */
+		ins->spdif_status_in = 0;
+	}
 
 	/* restore amplifier */
 	chip->active_ctrl(chip, -1);
@@ -1763,10 +1757,9 @@ int cs46xx_dsp_enable_pcm_capture (struct snd_cs46xx *chip)
 	if (snd_BUG_ON(!ins->ref_snoop_scb))
 		return -EINVAL;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	ins->pcm_input = cs46xx_add_record_source(chip,ins->ref_snoop_scb,PCMSERIALIN_PCM_SCB_ADDR,
                                                   "PCMSerialInput_Wave");
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -1778,10 +1771,9 @@ int cs46xx_dsp_disable_pcm_capture (struct snd_cs46xx *chip)
 	if (snd_BUG_ON(!ins->pcm_input))
 		return -EINVAL;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	cs46xx_dsp_remove_scb (chip,ins->pcm_input);
 	ins->pcm_input = NULL;
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -1795,10 +1787,9 @@ int cs46xx_dsp_enable_adc_capture (struct snd_cs46xx *chip)
 	if (snd_BUG_ON(!ins->codec_in_scb))
 		return -EINVAL;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	ins->adc_input = cs46xx_add_record_source(chip,ins->codec_in_scb,PCMSERIALIN_SCB_ADDR,
 						  "PCMSerialInput_ADC");
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -1810,10 +1801,9 @@ int cs46xx_dsp_disable_adc_capture (struct snd_cs46xx *chip)
 	if (snd_BUG_ON(!ins->adc_input))
 		return -EINVAL;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	cs46xx_dsp_remove_scb (chip,ins->adc_input);
 	ins->adc_input = NULL;
-	mutex_unlock(&chip->spos_mutex);
 
 	return 0;
 }
@@ -1861,7 +1851,7 @@ int cs46xx_dsp_set_dac_volume (struct snd_cs46xx * chip, u16 left, u16 right)
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 	struct dsp_scb_descriptor * scb; 
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	
 	/* main output */
 	scb = ins->master_mix_scb->sub_list_ptr;
@@ -1880,8 +1870,6 @@ int cs46xx_dsp_set_dac_volume (struct snd_cs46xx * chip, u16 left, u16 right)
 	ins->dac_volume_left = left;
 	ins->dac_volume_right = right;
 
-	mutex_unlock(&chip->spos_mutex);
-
 	return 0;
 }
 
@@ -1889,7 +1877,7 @@ int cs46xx_dsp_set_iec958_volume (struct snd_cs46xx * chip, u16 left, u16 right)
 {
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 
 	if (ins->asynch_rx_scb != NULL)
 		cs46xx_dsp_scb_set_volume (chip,ins->asynch_rx_scb,
@@ -1898,8 +1886,6 @@ int cs46xx_dsp_set_iec958_volume (struct snd_cs46xx * chip, u16 left, u16 right)
 	ins->spdif_input_volume_left = left;
 	ins->spdif_input_volume_right = right;
 
-	mutex_unlock(&chip->spos_mutex);
-
 	return 0;
 }
 
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 28faca268196..660ad19e5f18 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -63,7 +63,7 @@ static void cs46xx_dsp_proc_scb_info_read (struct snd_info_entry *entry,
 	int j,col;
 	void __iomem *dst = chip->region.idx[1].remap_addr + DSP_PARAMETER_BYTE_OFFSET;
 
-	mutex_lock(&chip->spos_mutex);
+	guard(mutex)(&chip->spos_mutex);
 	snd_iprintf(buffer,"%04x %s:\n",scb->address,scb->scb_name);
 
 	for (col = 0,j = 0;j < 0x10; j++,col++) {
@@ -91,7 +91,6 @@ static void cs46xx_dsp_proc_scb_info_read (struct snd_info_entry *entry,
 		    scb->task_entry->address);
 
 	snd_iprintf(buffer,"index [%d] ref_count [%d]\n",scb->index,scb->ref_count);  
-	mutex_unlock(&chip->spos_mutex);
 }
 #endif
 
-- 
2.50.1

