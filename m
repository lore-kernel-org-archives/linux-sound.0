Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506A284B2F
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478714; cv=none; b=HiCfXceIln7h1wwybsbptDPcriN6mrZvDoocbG2UGvszXYSZPHnRZ44QCVN4osLUrrYPXUNsnKpj5b+V7vX6aRcaVaK38HTQg+f+Jl3OycsegL/ekDl89yzC+GDct9u8lP8hJhVic8E9NNx4DEx5IN25uAOvBfnzYYPr5NYodMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478714; c=relaxed/simple;
	bh=XbPld5aHkvCqm9TuHcT66+9FRITQeEQe4zTxwC/7G5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Og0c9Uv98pmvu07RStq1eXqnL5+XOnDXAvrvBGVtCXRbHaIGtfV/3T6vRs+LaO34+ERJnGgdd3wPqlJQiSao/PoltUPZ8Yp9523Mg1+B7woV0IVwa7cAjl3LBeSWKi3W9DVQG0iMDDIllJZdpfzlyVfbz8Bv+QAdrJpZ3Zc6Wmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hmMTl9U2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rOSE9wWj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hmMTl9U2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rOSE9wWj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hmMTl9U2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rOSE9wWj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hmMTl9U2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rOSE9wWj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B70833EC4;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9HCUb0TGeEQb4YrnN2vQR+maxLD0hyGGVl6CLCaiYA=;
	b=hmMTl9U2BgU9jK6yvLI7H6318JIhFFoUgU1v9/CCLZyR79dW2ewRlpl0UMbqoGQpBMnJoc
	b6xgziiKq65r95NVnOp5Jwur1m8onaJMV9HpPmsWYVDFeXztM/dCL9MdRh+Z2yVETh4K2I
	EeR+CL99pn/NBerdgMbtk5Lo/vVeuFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9HCUb0TGeEQb4YrnN2vQR+maxLD0hyGGVl6CLCaiYA=;
	b=rOSE9wWj/7Htu2dFZjERKEhd/ELfSJZjvuzKBC5b6FsfNbvcWSHotSGZCnCsnlodYOaH+u
	ozVU+kr1PXRE2JCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hmMTl9U2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rOSE9wWj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9HCUb0TGeEQb4YrnN2vQR+maxLD0hyGGVl6CLCaiYA=;
	b=hmMTl9U2BgU9jK6yvLI7H6318JIhFFoUgU1v9/CCLZyR79dW2ewRlpl0UMbqoGQpBMnJoc
	b6xgziiKq65r95NVnOp5Jwur1m8onaJMV9HpPmsWYVDFeXztM/dCL9MdRh+Z2yVETh4K2I
	EeR+CL99pn/NBerdgMbtk5Lo/vVeuFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9HCUb0TGeEQb4YrnN2vQR+maxLD0hyGGVl6CLCaiYA=;
	b=rOSE9wWj/7Htu2dFZjERKEhd/ELfSJZjvuzKBC5b6FsfNbvcWSHotSGZCnCsnlodYOaH+u
	ozVU+kr1PXRE2JCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11B8713A3E;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IFcrA7C8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 27/61] ALSA: emu10k1: Use guard() for emu1010 FPGA locking
Date: Fri, 29 Aug 2025 16:43:02 +0200
Message-ID: <20250829144342.4290-28-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2B70833EC4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

The snd_emu1010_fpga_lock() and _unlock() call pairs can be simplified
gracefully with the introduction of guard().

Only code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/emu10k1.h          |  3 +--
 sound/pci/emu10k1/emu10k1_main.c | 15 +++++----------
 sound/pci/emu10k1/emumixer.c     | 15 ++++++---------
 sound/pci/emu10k1/emuproc.c      |  8 ++------
 sound/pci/emu10k1/io.c           |  3 +--
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 38db50b280eb..4f94565c9d15 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1842,8 +1842,7 @@ unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, unsigned int reg,
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
 int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
-static inline void snd_emu1010_fpga_lock(struct snd_emu10k1 *emu) { mutex_lock(&emu->emu1010.lock); };
-static inline void snd_emu1010_fpga_unlock(struct snd_emu10k1 *emu) { mutex_unlock(&emu->emu1010.lock); };
+DEFINE_GUARD(snd_emu1010_fpga_lock, struct snd_emu10k1 *, mutex_lock(&(_T)->emu1010.lock), mutex_unlock(&(_T)->emu1010.lock))
 void snd_emu1010_fpga_write_lock(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index bbe252b8916c..a3d028e4a212 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -768,7 +768,7 @@ static void emu1010_work(struct work_struct *work)
 		return;
 #endif
 
-	snd_emu1010_fpga_lock(emu);
+	guard(snd_emu1010_fpga_lock)(emu);
 
 	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &sts);
 
@@ -779,8 +779,6 @@ static void emu1010_work(struct work_struct *work)
 
 	if (sts & EMU_HANA_IRQ_WCLK_CHANGED)
 		emu1010_clock_event(emu);
-
-	snd_emu1010_fpga_unlock(emu);
 }
 
 static void emu1010_interrupt(struct snd_emu10k1 *emu)
@@ -814,13 +812,13 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	 * Proper init follows in snd_emu10k1_init(). */
 	outl(HCFG_LOCKSOUNDCACHE | HCFG_LOCKTANKCACHE_MASK, emu->port + HCFG);
 
-	snd_emu1010_fpga_lock(emu);
+	guard(snd_emu1010_fpga_lock)(emu);
 
 	dev_info(emu->card->dev, "emu1010: Loading Hana Firmware\n");
 	err = snd_emu1010_load_firmware(emu, 0, &emu->firmware);
 	if (err < 0) {
 		dev_info(emu->card->dev, "emu1010: Loading Firmware failed\n");
-		goto fail;
+		return err;
 	}
 
 	/* ID, should read & 0x7f = 0x55 when FPGA programmed. */
@@ -830,8 +828,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 		dev_info(emu->card->dev,
 			 "emu1010: Loading Hana Firmware file failed, reg = 0x%x\n",
 			 reg);
-		err = -ENODEV;
-		goto fail;
+		return -ENODEV;
 	}
 
 	dev_info(emu->card->dev, "emu1010: Hana Firmware loaded\n");
@@ -891,9 +888,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	// so it is safe to simply enable the outputs.
 	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 
-fail:
-	snd_emu1010_fpga_unlock(emu);
-	return err;
+	return 0;
 }
 /*
  *  Create the EMU10K1 instance
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index d665d5d1ad7c..6d86584be750 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -662,9 +662,8 @@ static int snd_emu1010_output_source_put(struct snd_kcontrol *kcontrol,
 	change = (emu->emu1010.output_source[channel] != val);
 	if (change) {
 		emu->emu1010.output_source[channel] = val;
-		snd_emu1010_fpga_lock(emu);
+		guard(snd_emu1010_fpga_lock)(emu);
 		snd_emu1010_output_source_apply(emu, channel, val);
-		snd_emu1010_fpga_unlock(emu);
 	}
 	return change;
 }
@@ -708,9 +707,8 @@ static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
 	change = (emu->emu1010.input_source[channel] != val);
 	if (change) {
 		emu->emu1010.input_source[channel] = val;
-		snd_emu1010_fpga_lock(emu);
+		guard(snd_emu1010_fpga_lock)(emu);
 		snd_emu1010_input_source_apply(emu, channel, val);
-		snd_emu1010_fpga_unlock(emu);
 	}
 	return change;
 }
@@ -985,7 +983,7 @@ static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.enumerated.item[0] ;
 	if (val >= emu_ci->num)
 		return -EINVAL;
-	snd_emu1010_fpga_lock(emu);
+	guard(snd_emu1010_fpga_lock)(emu);
 	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.clock_source != val);
 	if (change) {
@@ -1002,7 +1000,6 @@ static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 	} else {
 		spin_unlock_irq(&emu->reg_lock);
 	}
-	snd_emu1010_fpga_unlock(emu);
 	return change;
 }
 
@@ -2330,9 +2327,9 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		for (i = 0; i < emu_ri->n_outs; i++)
 			emu->emu1010.output_source[i] =
 				emu1010_map_source(emu_ri, emu_ri->out_dflts[i]);
-		snd_emu1010_fpga_lock(emu);
-		snd_emu1010_apply_sources(emu);
-		snd_emu1010_fpga_unlock(emu);
+		scoped_guard(snd_emu1010_fpga_lock, emu) {
+			snd_emu1010_apply_sources(emu);
+		}
 
 		kctl = emu->ctl_clock_source = snd_ctl_new1(&snd_emu1010_clock_source, emu);
 		err = snd_ctl_add(card, kctl);
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index bd4734dc04cd..a12518dd4eed 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -166,7 +166,7 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 	u32 value2;
 
 	if (emu->card_capabilities->emu_model) {
-		snd_emu1010_fpga_lock(emu);
+		guard(snd_emu1010_fpga_lock)(emu);
 
 		// This represents the S/PDIF lock status on 0404b, which is
 		// kinda weird and unhelpful, because monitoring it via IRQ is
@@ -200,8 +200,6 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "\nS/PDIF mode: %s%s\n",
 				    value & EMU_HANA_SPDIF_MODE_RX_PRO ? "professional" : "consumer",
 				    value & EMU_HANA_SPDIF_MODE_RX_NOCOPY ? ", no copy" : "");
-
-		snd_emu1010_fpga_unlock(emu);
 	} else {
 		snd_emu10k1_proc_spdif_status(emu, buffer, "CD-ROM S/PDIF In", CDCS, CDSRCS);
 		snd_emu10k1_proc_spdif_status(emu, buffer, "Optical or Coax S/PDIF In", GPSCS, GPSRCS);
@@ -464,7 +462,7 @@ static void snd_emu_proc_emu1010_reg_read(struct snd_info_entry *entry,
 	u32 value;
 	int i;
 
-	snd_emu1010_fpga_lock(emu);
+	guard(snd_emu1010_fpga_lock)(emu);
 
 	snd_iprintf(buffer, "EMU1010 Registers:\n\n");
 
@@ -504,8 +502,6 @@ static void snd_emu_proc_emu1010_reg_read(struct snd_info_entry *entry,
 			snd_emu_proc_emu1010_link_read(emu, buffer, 0x701);
 		}
 	}
-
-	snd_emu1010_fpga_unlock(emu);
 }
 
 static void snd_emu_proc_io_reg_read(struct snd_info_entry *entry,
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index b60ab5671e00..69debe781177 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -297,9 +297,8 @@ void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
 
 void snd_emu1010_fpga_write_lock(struct snd_emu10k1 *emu, u32 reg, u32 value)
 {
-	snd_emu1010_fpga_lock(emu);
+	guard(snd_emu1010_fpga_lock)(emu);
 	snd_emu1010_fpga_write_locked(emu, reg, value);
-	snd_emu1010_fpga_unlock(emu);
 }
 
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
-- 
2.50.1

