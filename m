Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148823218DE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478639; cv=none; b=rc0PyMv1WrumkGrbKa/Ty82Wiu0DcjDLpYbLa6iU2XZXcAyQ8+h0/1eVknx218gTf1j4rrEVzQ721AXEBETMqrnz6wyCErmMwDZQ+OmiiuEjcOMKJ8NrKn+nLsEJnkdH8MwDLNWKMTnqL3n1G8dgtllUF6+Yt/hKHHHymPBYxno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478639; c=relaxed/simple;
	bh=zaSkyx1PjY8ojb3HBxrhArAFkifkNdX7+H03K8VfvEc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1qn/Nue9HNznOG6MaPU+UatdNs3cMIMQM4E4p6ujFiJkOlq78Is+QnvuLVS6bWkd+uH+Sys/rPJZy4wMWBhBXPSxUxbKpn30LjaffNdV+ulWZLGI7P9+JyFDYtzubEuQ4Sy+mJluJsorI4XObnNkEqamAuYZnOwTQpYJza3HSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vjEogqld; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1fnszL0X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vjEogqld; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1fnszL0X; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vjEogqld";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1fnszL0X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vjEogqld";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1fnszL0X"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 08E4733EC6;
	Fri, 29 Aug 2025 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0LSLN7fHB43G73L7S0kWANBxv3gmQpcfq7Q3/CvLGU=;
	b=vjEogqldtI8Ino7RfVBB07vUyFhBC8arBqOJ648/zmR4ytT9s39/R9xWD7l7bC+Xgl+VF8
	9OVML3ZbESiY3jjpVP4LkR4AhZf5+ieOFBjBJZBPlCFJzqxPyWA6yRokINI1Z/HJMxxGH5
	Ac7E//NvkvQrXY8ddTYmfSrSTMBXJdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0LSLN7fHB43G73L7S0kWANBxv3gmQpcfq7Q3/CvLGU=;
	b=1fnszL0XNqSnYXyuRHxplEyA6+I4dRY37x7ge1S+x1BpOJU8QPU92cih0iGha1rrXdku9N
	t83wud+YS7c4rqCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0LSLN7fHB43G73L7S0kWANBxv3gmQpcfq7Q3/CvLGU=;
	b=vjEogqldtI8Ino7RfVBB07vUyFhBC8arBqOJ648/zmR4ytT9s39/R9xWD7l7bC+Xgl+VF8
	9OVML3ZbESiY3jjpVP4LkR4AhZf5+ieOFBjBJZBPlCFJzqxPyWA6yRokINI1Z/HJMxxGH5
	Ac7E//NvkvQrXY8ddTYmfSrSTMBXJdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0LSLN7fHB43G73L7S0kWANBxv3gmQpcfq7Q3/CvLGU=;
	b=1fnszL0XNqSnYXyuRHxplEyA6+I4dRY37x7ge1S+x1BpOJU8QPU92cih0iGha1rrXdku9N
	t83wud+YS7c4rqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E63A113A3E;
	Fri, 29 Aug 2025 14:43:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SOkZN6S8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/61] ALSA: ac97: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:36 +0200
Message-ID: <20250829144342.4290-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_codec.c | 32 ++++++++++----------------------
 sound/pci/ac97/ac97_patch.c |  9 +++------
 sound/pci/ac97/ac97_pcm.c   |  3 +--
 sound/pci/ac97/ac97_proc.c  | 10 ++++------
 4 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index cd60c856a92e..c54bdefa5afe 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -326,11 +326,10 @@ void snd_ac97_write_cache(struct snd_ac97 *ac97, unsigned short reg, unsigned sh
 {
 	if (!snd_ac97_valid_reg(ac97, reg))
 		return;
-	mutex_lock(&ac97->reg_mutex);
+	guard(mutex)(&ac97->reg_mutex);
 	ac97->regs[reg] = value;
 	ac97->bus->ops->write(ac97, reg, value);
 	set_bit(reg, ac97->reg_accessed);
-	mutex_unlock(&ac97->reg_mutex);
 }
 
 EXPORT_SYMBOL(snd_ac97_write_cache);
@@ -353,14 +352,13 @@ int snd_ac97_update(struct snd_ac97 *ac97, unsigned short reg, unsigned short va
 
 	if (!snd_ac97_valid_reg(ac97, reg))
 		return -EINVAL;
-	mutex_lock(&ac97->reg_mutex);
+	guard(mutex)(&ac97->reg_mutex);
 	change = ac97->regs[reg] != value;
 	if (change) {
 		ac97->regs[reg] = value;
 		ac97->bus->ops->write(ac97, reg, value);
 	}
 	set_bit(reg, ac97->reg_accessed);
-	mutex_unlock(&ac97->reg_mutex);
 	return change;
 }
 
@@ -381,14 +379,10 @@ EXPORT_SYMBOL(snd_ac97_update);
  */
 int snd_ac97_update_bits(struct snd_ac97 *ac97, unsigned short reg, unsigned short mask, unsigned short value)
 {
-	int change;
-
 	if (!snd_ac97_valid_reg(ac97, reg))
 		return -EINVAL;
-	mutex_lock(&ac97->reg_mutex);
-	change = snd_ac97_update_bits_nolock(ac97, reg, mask, value);
-	mutex_unlock(&ac97->reg_mutex);
-	return change;
+	guard(mutex)(&ac97->reg_mutex);
+	return snd_ac97_update_bits_nolock(ac97, reg, mask, value);
 }
 
 EXPORT_SYMBOL(snd_ac97_update_bits);
@@ -416,12 +410,12 @@ static int snd_ac97_ad18xx_update_pcm_bits(struct snd_ac97 *ac97, int codec, uns
 	int change;
 	unsigned short old, new, cfg;
 
-	mutex_lock(&ac97->page_mutex);
+	guard(mutex)(&ac97->page_mutex);
 	old = ac97->spec.ad18xx.pcmreg[codec];
 	new = (old & ~mask) | (value & mask);
 	change = old != new;
 	if (change) {
-		mutex_lock(&ac97->reg_mutex);
+		guard(mutex)(&ac97->reg_mutex);
 		cfg = snd_ac97_read_cache(ac97, AC97_AD_SERIAL_CFG);
 		ac97->spec.ad18xx.pcmreg[codec] = new;
 		/* select single codec */
@@ -433,9 +427,7 @@ static int snd_ac97_ad18xx_update_pcm_bits(struct snd_ac97 *ac97, int codec, uns
 		/* select all codecs */
 		ac97->bus->ops->write(ac97, AC97_AD_SERIAL_CFG,
 				 cfg | 0x7000);
-		mutex_unlock(&ac97->reg_mutex);
 	}
-	mutex_unlock(&ac97->page_mutex);
 	return change;
 }
 
@@ -716,12 +708,11 @@ static int snd_ac97_spdif_default_get(struct snd_kcontrol *kcontrol, struct snd_
 {
 	struct snd_ac97 *ac97 = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&ac97->reg_mutex);
+	guard(mutex)(&ac97->reg_mutex);
 	ucontrol->value.iec958.status[0] = ac97->spdif_status & 0xff;
 	ucontrol->value.iec958.status[1] = (ac97->spdif_status >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (ac97->spdif_status >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (ac97->spdif_status >> 24) & 0xff;
-	mutex_unlock(&ac97->reg_mutex);
 	return 0;
 }
                         
@@ -760,7 +751,7 @@ static int snd_ac97_spdif_default_put(struct snd_kcontrol *kcontrol, struct snd_
 		}
 	}
 
-	mutex_lock(&ac97->reg_mutex);
+	guard(mutex)(&ac97->reg_mutex);
 	change = ac97->spdif_status != new;
 	ac97->spdif_status = new;
 
@@ -794,7 +785,6 @@ static int snd_ac97_spdif_default_put(struct snd_kcontrol *kcontrol, struct snd_
 			snd_ac97_update_bits_nolock(ac97, AC97_EXTENDED_STATUS, AC97_EA_SPDIF, AC97_EA_SPDIF); /* turn on again */
                 }
 	}
-	mutex_unlock(&ac97->reg_mutex);
 
 	return change;
 }
@@ -811,7 +801,7 @@ static int snd_ac97_put_spsa(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 
 	value = (ucontrol->value.integer.value[0] & mask);
 
-	mutex_lock(&ac97->reg_mutex);
+	guard(mutex)(&ac97->reg_mutex);
 	mask <<= shift;
 	value <<= shift;
 	old = snd_ac97_read_cache(ac97, reg);
@@ -825,7 +815,6 @@ static int snd_ac97_put_spsa(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 		if (extst & AC97_EA_SPDIF)
 			snd_ac97_update_bits_nolock(ac97, AC97_EXTENDED_STATUS, AC97_EA_SPDIF, AC97_EA_SPDIF); /* turn on again */
 	}
-	mutex_unlock(&ac97->reg_mutex);
 	return change;
 }
 
@@ -936,10 +925,9 @@ static int snd_ac97_ad18xx_pcm_get_volume(struct snd_kcontrol *kcontrol, struct
 	struct snd_ac97 *ac97 = snd_kcontrol_chip(kcontrol);
 	int codec = kcontrol->private_value & 3;
 	
-	mutex_lock(&ac97->page_mutex);
+	guard(mutex)(&ac97->page_mutex);
 	ucontrol->value.integer.value[0] = 31 - ((ac97->spec.ad18xx.pcmreg[codec] >> 8) & 31);
 	ucontrol->value.integer.value[1] = 31 - ((ac97->spec.ad18xx.pcmreg[codec] >> 0) & 31);
-	mutex_unlock(&ac97->page_mutex);
 	return 0;
 }
 
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 3002be9d88f3..64cc39dd2008 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -54,12 +54,11 @@ static int ac97_update_bits_page(struct snd_ac97 *ac97, unsigned short reg, unsi
 	unsigned short page_save;
 	int ret;
 
-	mutex_lock(&ac97->page_mutex);
+	guard(mutex)(&ac97->page_mutex);
 	page_save = snd_ac97_read(ac97, AC97_INT_PAGING) & AC97_PAGE_MASK;
 	snd_ac97_update_bits(ac97, AC97_INT_PAGING, AC97_PAGE_MASK, page);
 	ret = snd_ac97_update_bits(ac97, reg, mask, value);
 	snd_ac97_update_bits(ac97, AC97_INT_PAGING, AC97_PAGE_MASK, page_save);
-	mutex_unlock(&ac97->page_mutex); /* unlock paging */
 	return ret;
 }
 
@@ -976,12 +975,11 @@ static int snd_ac97_stac9708_put_bias(struct snd_kcontrol *kcontrol, struct snd_
 	struct snd_ac97 *ac97 = snd_kcontrol_chip(kcontrol);
 	int err;
 
-	mutex_lock(&ac97->page_mutex);
+	guard(mutex)(&ac97->page_mutex);
 	snd_ac97_write(ac97, AC97_SIGMATEL_BIAS1, 0xabba);
 	err = snd_ac97_update_bits(ac97, AC97_SIGMATEL_BIAS2, 0x0010,
 				   (ucontrol->value.integer.value[0] & 1) << 4);
 	snd_ac97_write(ac97, AC97_SIGMATEL_BIAS1, 0);
-	mutex_unlock(&ac97->page_mutex);
 	return err;
 }
 
@@ -3699,7 +3697,7 @@ static int snd_ac97_vt1618_UAJ_get(struct snd_kcontrol *kcontrol,
 	unsigned short datpag, uaj;
 	struct snd_ac97 *pac97 = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&pac97->page_mutex);
+	guard(mutex)(&pac97->page_mutex);
 
 	datpag = snd_ac97_read(pac97, AC97_INT_PAGING) & AC97_PAGE_MASK;
 	snd_ac97_update_bits(pac97, AC97_INT_PAGING, AC97_PAGE_MASK, 0);
@@ -3708,7 +3706,6 @@ static int snd_ac97_vt1618_UAJ_get(struct snd_kcontrol *kcontrol,
 		vt1618_uaj[kcontrol->private_value].mask;
 
 	snd_ac97_update_bits(pac97, AC97_INT_PAGING, AC97_PAGE_MASK, datpag);
-	mutex_unlock(&pac97->page_mutex);
 
 	ucontrol->value.enumerated.item[0] = uaj >>
 		vt1618_uaj[kcontrol->private_value].shift;
diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index 5fee8e89790f..fa14a562fe87 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -192,7 +192,7 @@ static int set_spdif_rate(struct snd_ac97 *ac97, unsigned short rate)
 		mask = AC97_SC_SPSR_MASK;
 	}
 
-	mutex_lock(&ac97->reg_mutex);
+	guard(mutex)(&ac97->reg_mutex);
 	old = snd_ac97_read(ac97, reg) & mask;
 	if (old != bits) {
 		snd_ac97_update_bits_nolock(ac97, AC97_EXTENDED_STATUS, AC97_EA_SPDIF, 0);
@@ -217,7 +217,6 @@ static int set_spdif_rate(struct snd_ac97 *ac97, unsigned short rate)
 		ac97->spdif_status = sbits;
 	}
 	snd_ac97_update_bits_nolock(ac97, AC97_EXTENDED_STATUS, AC97_EA_SPDIF, AC97_EA_SPDIF);
-	mutex_unlock(&ac97->reg_mutex);
 	return 0;
 }
 
diff --git a/sound/pci/ac97/ac97_proc.c b/sound/pci/ac97/ac97_proc.c
index 2df3ba9a08dc..1c9d76994b3a 100644
--- a/sound/pci/ac97/ac97_proc.c
+++ b/sound/pci/ac97/ac97_proc.c
@@ -329,7 +329,7 @@ static void snd_ac97_proc_read(struct snd_info_entry *entry, struct snd_info_buf
 {
 	struct snd_ac97 *ac97 = entry->private_data;
 	
-	mutex_lock(&ac97->page_mutex);
+	guard(mutex)(&ac97->page_mutex);
 	if ((ac97->id & 0xffffff40) == AC97_ID_AD1881) {	// Analog Devices AD1881/85/86
 		int idx;
 		for (idx = 0; idx < 3; idx++)
@@ -355,7 +355,6 @@ static void snd_ac97_proc_read(struct snd_info_entry *entry, struct snd_info_buf
 	} else {
 		snd_ac97_proc_read_main(ac97, buffer, 0);
 	}
-	mutex_unlock(&ac97->page_mutex);
 }
 
 #ifdef CONFIG_SND_DEBUG
@@ -365,7 +364,8 @@ static void snd_ac97_proc_regs_write(struct snd_info_entry *entry, struct snd_in
 	struct snd_ac97 *ac97 = entry->private_data;
 	char line[64];
 	unsigned int reg, val;
-	mutex_lock(&ac97->page_mutex);
+
+	guard(mutex)(&ac97->page_mutex);
 	while (!snd_info_get_line(buffer, line, sizeof(line))) {
 		if (sscanf(line, "%x %x", &reg, &val) != 2)
 			continue;
@@ -373,7 +373,6 @@ static void snd_ac97_proc_regs_write(struct snd_info_entry *entry, struct snd_in
 		if (reg < 0x80 && (reg & 1) == 0 && val <= 0xffff)
 			snd_ac97_write_cache(ac97, reg, val);
 	}
-	mutex_unlock(&ac97->page_mutex);
 }
 #endif
 
@@ -392,7 +391,7 @@ static void snd_ac97_proc_regs_read(struct snd_info_entry *entry,
 {
 	struct snd_ac97 *ac97 = entry->private_data;
 
-	mutex_lock(&ac97->page_mutex);
+	guard(mutex)(&ac97->page_mutex);
 	if ((ac97->id & 0xffffff40) == AC97_ID_AD1881) {	// Analog Devices AD1881/85/86
 
 		int idx;
@@ -408,7 +407,6 @@ static void snd_ac97_proc_regs_read(struct snd_info_entry *entry,
 	} else {
 		snd_ac97_proc_regs_read_main(ac97, buffer, 0);
 	}	
-	mutex_unlock(&ac97->page_mutex);
 }
 
 void snd_ac97_proc_init(struct snd_ac97 * ac97)
-- 
2.50.1

