Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033EE320CD5
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480431; cv=none; b=dvlcUcHs8KHXnuci2zSMI9DuB56XYyRA5uPdA4rMe6vTIFIDU9vK+Z27zJO0BIKHSlCssxBqu9TLkytNJSZ6M2NpBP1n2g9wIXdcMtmhJROVwMtyonQk7d0bfruVmKZrAxWHWPHP2HZVRgDqULJHeC6c9iu63I439YS+VNVHP54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480431; c=relaxed/simple;
	bh=N++4uE+qnujYdXXR/Zh6Q5yt38qUC3gn5cmDqhjIlWw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHPjcoUHRYhCAfUepIqcA7NHS8dZBccBvzJWngvId0WkepppLIJv8K3SDZBvQie8ujOvCWzFE9MKLgag++3faErWwZTedKybOjCRmAT8U2UJwEoISU12OQ8WplB2UsfFtUTeYvHvDmWCT0tLrLHafwxizMYeA4dHIAfxMxIs8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wfUc1TsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nxMN2CJh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wfUc1TsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nxMN2CJh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wfUc1TsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nxMN2CJh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wfUc1TsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nxMN2CJh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9204C33F06;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tcmAL3KKqN8TMLnBqEnkz67BMD+zkBNlGtEivEdoys=;
	b=wfUc1TsSe2+ag3iJ0GX04pm17414viIfDIz8Bxi6/TAuZEXv63oayDD5a3Ye+f8l78egSQ
	p0yGBi/x5X9clW2Q9eWFgsL4aApNyAiWjRCYa3nDZLx3BXUp+wgrRF+30rcNRVjo6AOaDp
	cZ2KqR/H4AmhMvAIoH7dTeDl/KvN5xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tcmAL3KKqN8TMLnBqEnkz67BMD+zkBNlGtEivEdoys=;
	b=nxMN2CJhbafAolKKuP+WSUBxpsOtJYN73bMYBUqOOwCe6nH39ji40nKDKLh8zHsGHoMblm
	ZlY89fr0OS6crTBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wfUc1TsS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nxMN2CJh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tcmAL3KKqN8TMLnBqEnkz67BMD+zkBNlGtEivEdoys=;
	b=wfUc1TsSe2+ag3iJ0GX04pm17414viIfDIz8Bxi6/TAuZEXv63oayDD5a3Ye+f8l78egSQ
	p0yGBi/x5X9clW2Q9eWFgsL4aApNyAiWjRCYa3nDZLx3BXUp+wgrRF+30rcNRVjo6AOaDp
	cZ2KqR/H4AmhMvAIoH7dTeDl/KvN5xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tcmAL3KKqN8TMLnBqEnkz67BMD+zkBNlGtEivEdoys=;
	b=nxMN2CJhbafAolKKuP+WSUBxpsOtJYN73bMYBUqOOwCe6nH39ji40nKDKLh8zHsGHoMblm
	ZlY89fr0OS6crTBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 765E713326;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gHW3G6XDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/19] ALSA: synth: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:17 +0200
Message-ID: <20250829151335.7342-4-tiwai@suse.de>
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
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9204C33F06
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/synth/emux/emux_proc.c |  6 ++----
 sound/synth/emux/emux_seq.c  | 17 +++++------------
 sound/synth/util_mem.c       | 17 +++++------------
 3 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/sound/synth/emux/emux_proc.c b/sound/synth/emux/emux_proc.c
index 820351f52551..16d6c9a1e24f 100644
--- a/sound/synth/emux/emux_proc.c
+++ b/sound/synth/emux/emux_proc.c
@@ -19,7 +19,7 @@ snd_emux_proc_info_read(struct snd_info_entry *entry,
 	int i;
 
 	emu = entry->private_data;
-	mutex_lock(&emu->register_mutex);
+	guard(mutex)(&emu->register_mutex);
 	if (emu->name)
 		snd_iprintf(buf, "Device: %s\n", emu->name);
 	snd_iprintf(buf, "Ports: %d\n", emu->num_ports);
@@ -38,13 +38,12 @@ snd_emux_proc_info_read(struct snd_info_entry *entry,
 		snd_iprintf(buf, "Memory Size: 0\n");
 	}
 	if (emu->sflist) {
-		mutex_lock(&emu->sflist->presets_mutex);
+		guard(mutex)(&emu->sflist->presets_mutex);
 		snd_iprintf(buf, "SoundFonts: %d\n", emu->sflist->fonts_size);
 		snd_iprintf(buf, "Instruments: %d\n", emu->sflist->zone_counter);
 		snd_iprintf(buf, "Samples: %d\n", emu->sflist->sample_counter);
 		snd_iprintf(buf, "Locked Instruments: %d\n", emu->sflist->zone_locked);
 		snd_iprintf(buf, "Locked Samples: %d\n", emu->sflist->sample_locked);
-		mutex_unlock(&emu->sflist->presets_mutex);
 	}
 #if 0  /* debug */
 	if (emu->voices[0].state != SNDRV_EMUX_ST_OFF && emu->voices[0].ch >= 0) {
@@ -85,7 +84,6 @@ snd_emux_proc_info_read(struct snd_info_entry *entry,
 		snd_iprintf(buf, "sample_mode=%x, rate=%x\n", vp->reg.sample_mode, vp->reg.rate_offset);
 	}
 #endif
-	mutex_unlock(&emu->register_mutex);
 }
 
 
diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 9daced0e6c59..9d63ac006aa5 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -272,12 +272,8 @@ __snd_emux_inc_count(struct snd_emux *emu)
 
 int snd_emux_inc_count(struct snd_emux *emu)
 {
-	int ret;
-
-	mutex_lock(&emu->register_mutex);
-	ret = __snd_emux_inc_count(emu);
-	mutex_unlock(&emu->register_mutex);
-	return ret;
+	guard(mutex)(&emu->register_mutex);
+	return __snd_emux_inc_count(emu);
 }
 
 /*
@@ -295,9 +291,8 @@ __snd_emux_dec_count(struct snd_emux *emu)
 
 void snd_emux_dec_count(struct snd_emux *emu)
 {
-	mutex_lock(&emu->register_mutex);
+	guard(mutex)(&emu->register_mutex);
 	__snd_emux_dec_count(emu);
-	mutex_unlock(&emu->register_mutex);
 }
 
 /*
@@ -316,10 +311,9 @@ snd_emux_use(void *private_data, struct snd_seq_port_subscribe *info)
 	if (snd_BUG_ON(!emu))
 		return -EINVAL;
 
-	mutex_lock(&emu->register_mutex);
+	guard(mutex)(&emu->register_mutex);
 	snd_emux_init_port(p);
 	__snd_emux_inc_count(emu);
-	mutex_unlock(&emu->register_mutex);
 	return 0;
 }
 
@@ -339,10 +333,9 @@ snd_emux_unuse(void *private_data, struct snd_seq_port_subscribe *info)
 	if (snd_BUG_ON(!emu))
 		return -EINVAL;
 
-	mutex_lock(&emu->register_mutex);
+	guard(mutex)(&emu->register_mutex);
 	snd_emux_sounds_off_all(p);
 	__snd_emux_dec_count(emu);
-	mutex_unlock(&emu->register_mutex);
 	return 0;
 }
 
diff --git a/sound/synth/util_mem.c b/sound/synth/util_mem.c
index 304a8f1740c3..2fd577c2a8eb 100644
--- a/sound/synth/util_mem.c
+++ b/sound/synth/util_mem.c
@@ -124,11 +124,8 @@ __snd_util_memblk_new(struct snd_util_memhdr *hdr, unsigned int units,
 struct snd_util_memblk *
 snd_util_mem_alloc(struct snd_util_memhdr *hdr, int size)
 {
-	struct snd_util_memblk *blk;
-	mutex_lock(&hdr->block_mutex);
-	blk = __snd_util_mem_alloc(hdr, size);
-	mutex_unlock(&hdr->block_mutex);
-	return blk;
+	guard(mutex)(&hdr->block_mutex);
+	return __snd_util_mem_alloc(hdr, size);
 }
 
 
@@ -153,9 +150,8 @@ int snd_util_mem_free(struct snd_util_memhdr *hdr, struct snd_util_memblk *blk)
 	if (snd_BUG_ON(!hdr || !blk))
 		return -EINVAL;
 
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	__snd_util_mem_free(hdr, blk);
-	mutex_unlock(&hdr->block_mutex);
 	return 0;
 }
 
@@ -164,11 +160,8 @@ int snd_util_mem_free(struct snd_util_memhdr *hdr, struct snd_util_memblk *blk)
  */
 int snd_util_mem_avail(struct snd_util_memhdr *hdr)
 {
-	unsigned int size;
-	mutex_lock(&hdr->block_mutex);
-	size = hdr->size - hdr->used;
-	mutex_unlock(&hdr->block_mutex);
-	return size;
+	guard(mutex)(&hdr->block_mutex);
+	return hdr->size - hdr->used;
 }
 
 
-- 
2.50.1

