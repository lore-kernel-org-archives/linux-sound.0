Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6520124E
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037671; cv=none; b=Qww3BbDO6+BkmLxNDioa9Nkaj11Y/9RVx83UIfmGv0ZSGBw8haOphCTB9ZbgAXienoyVjXgz6JYQaubnyvjPFH+NWMpj2n7JXcBeDwR59FJxPxyaJUgSccQhcPXCb1OFt3RlPoVG2qYIi2d0drFn2kXdxkCWaJKkfDfION2+J7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037671; c=relaxed/simple;
	bh=19QciAYNJWy11LvCL7W9Bc/Gi1lw88/MsPPQ8niIOzU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFE1ENQxtgQU/kwe/GAt/Yihn8Vj/ebaH8hw48DsIFfY+XHsVXnPtUsYtz/InFVqJBc9SY9W0I1IM6I+JDYMaTDKZAlCQjM9BYvCzXpCx44eaU2GB/f0hOATIhwpmKSIKiAh7Of1cG6Oqgz96SvU/lm9I/Plu03GTPen3H0MJx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t3Wxyz8W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4R5nnOBK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t3Wxyz8W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4R5nnOBK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t3Wxyz8W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4R5nnOBK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t3Wxyz8W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4R5nnOBK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 74C811FB9E;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cywpGgagXmTM7Cfo1iFxnkEAUgbB5JA8VNwYOKxTuyE=;
	b=t3Wxyz8WJDCNX06+1JdjbuHcoGf49W2yIc0+nOl/KE249qVvv4Ah+Sz8YkPwwYef1iIrms
	UKGzCNuzlLMB6FXKbcioMJ6YVlJ4BeqlYPfLWFh7Fa3DvvD1NxatSrwzvdZeBVb8TIDBNl
	UMHPUMpFcRwIMYu+4Tbzt5/1Yyg97gE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cywpGgagXmTM7Cfo1iFxnkEAUgbB5JA8VNwYOKxTuyE=;
	b=4R5nnOBKsD1jFXXaanSugXj7bkqWLV52usHiwnxrViS9Zqt0uwRoWrIYY5xQq+EOJwQqW4
	+UJJqVYYdNaWySCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=t3Wxyz8W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4R5nnOBK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cywpGgagXmTM7Cfo1iFxnkEAUgbB5JA8VNwYOKxTuyE=;
	b=t3Wxyz8WJDCNX06+1JdjbuHcoGf49W2yIc0+nOl/KE249qVvv4Ah+Sz8YkPwwYef1iIrms
	UKGzCNuzlLMB6FXKbcioMJ6YVlJ4BeqlYPfLWFh7Fa3DvvD1NxatSrwzvdZeBVb8TIDBNl
	UMHPUMpFcRwIMYu+4Tbzt5/1Yyg97gE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cywpGgagXmTM7Cfo1iFxnkEAUgbB5JA8VNwYOKxTuyE=;
	b=4R5nnOBKsD1jFXXaanSugXj7bkqWLV52usHiwnxrViS9Zqt0uwRoWrIYY5xQq+EOJwQqW4
	+UJJqVYYdNaWySCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C96713A7D;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uE1xFd53s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 43/54] ALSA: emux: Use standard print API
Date: Wed,  7 Aug 2024 15:34:33 +0200
Message-ID: <20240807133452.9424-44-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 74C811FB9E
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Some functions are changed to receive snd_card object for calling
dev_*() functions, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/soundfont.h     |  6 ++--
 sound/synth/emux/emux_hwdep.c |  6 ++--
 sound/synth/emux/emux_oss.c   | 11 +++---
 sound/synth/emux/emux_seq.c   | 13 ++++---
 sound/synth/emux/emux_synth.c | 12 +++----
 sound/synth/emux/soundfont.c  | 67 +++++++++++++++++++----------------
 6 files changed, 63 insertions(+), 52 deletions(-)

diff --git a/include/sound/soundfont.h b/include/sound/soundfont.h
index 98ed98d89d6d..8a40cc15f66d 100644
--- a/include/sound/soundfont.h
+++ b/include/sound/soundfont.h
@@ -86,9 +86,11 @@ struct snd_sf_list {
 };
 
 /* Prototypes for soundfont.c */
-int snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
+int snd_soundfont_load(struct snd_card *card,
+		       struct snd_sf_list *sflist, const void __user *data,
 		       long count, int client);
-int snd_soundfont_load_guspatch(struct snd_sf_list *sflist, const char __user *data,
+int snd_soundfont_load_guspatch(struct snd_card *card,
+				struct snd_sf_list *sflist, const char __user *data,
 				long count);
 int snd_soundfont_close_check(struct snd_sf_list *sflist, int client);
 
diff --git a/sound/synth/emux/emux_hwdep.c b/sound/synth/emux/emux_hwdep.c
index fd8f978cde1c..9e98c4c73fd1 100644
--- a/sound/synth/emux/emux_hwdep.c
+++ b/sound/synth/emux/emux_hwdep.c
@@ -26,12 +26,14 @@ snd_emux_hwdep_load_patch(struct snd_emux *emu, void __user *arg)
 		return -EFAULT;
 
 	if (patch.key == GUS_PATCH)
-		return snd_soundfont_load_guspatch(emu->sflist, arg,
+		return snd_soundfont_load_guspatch(emu->card, emu->sflist, arg,
 						   patch.len + sizeof(patch));
 
 	if (patch.type >= SNDRV_SFNT_LOAD_INFO &&
 	    patch.type <= SNDRV_SFNT_PROBE_DATA) {
-		err = snd_soundfont_load(emu->sflist, arg, patch.len + sizeof(patch), TMP_CLIENT_ID);
+		err = snd_soundfont_load(emu->card, emu->sflist, arg,
+					 patch.len + sizeof(patch),
+					 TMP_CLIENT_ID);
 		if (err < 0)
 			return err;
 	} else {
diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index 04df46b269d3..5f98d5201ba2 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -115,7 +115,7 @@ snd_emux_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
 	p = snd_emux_create_port(emu, tmpname, 32,
 				 1, &callback);
 	if (p == NULL) {
-		snd_printk(KERN_ERR "can't create port\n");
+		dev_err(emu->card->dev, "can't create port\n");
 		snd_emux_dec_count(emu);
 		return -ENOMEM;
 	}
@@ -205,7 +205,7 @@ snd_emux_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
 		return -ENXIO;
 
 	if (format == GUS_PATCH)
-		rc = snd_soundfont_load_guspatch(emu->sflist, buf, count);
+		rc = snd_soundfont_load_guspatch(emu->card, emu->sflist, buf, count);
 	else if (format == SNDRV_OSS_SOUNDFONT_PATCH) {
 		struct soundfont_patch_info patch;
 		if (count < (int)sizeof(patch))
@@ -214,10 +214,13 @@ snd_emux_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
 			return -EFAULT;
 		if (patch.type >= SNDRV_SFNT_LOAD_INFO &&
 		    patch.type <= SNDRV_SFNT_PROBE_DATA)
-			rc = snd_soundfont_load(emu->sflist, buf, count, SF_CLIENT_NO(p->chset.port));
+			rc = snd_soundfont_load(emu->card, emu->sflist, buf,
+						count,
+						SF_CLIENT_NO(p->chset.port));
 		else {
 			if (emu->ops.load_fx)
-				rc = emu->ops.load_fx(emu, patch.type, patch.optarg, buf, count);
+				rc = emu->ops.load_fx(emu, patch.type,
+						      patch.optarg, buf, count);
 			else
 				rc = -EINVAL;
 		}
diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 1adaa75df2f6..9daced0e6c59 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -61,16 +61,17 @@ snd_emux_init_seq(struct snd_emux *emu, struct snd_card *card, int index)
 	emu->client = snd_seq_create_kernel_client(card, index,
 						   "%s WaveTable", emu->name);
 	if (emu->client < 0) {
-		snd_printk(KERN_ERR "can't create client\n");
+		dev_err(card->dev, "can't create client\n");
 		return -ENODEV;
 	}
 
 	if (emu->num_ports <= 0) {
-		snd_printk(KERN_WARNING "seqports must be greater than zero\n");
+		dev_warn(card->dev, "seqports must be greater than zero\n");
 		emu->num_ports = 1;
 	} else if (emu->num_ports > SNDRV_EMUX_MAX_PORTS) {
-		snd_printk(KERN_WARNING "too many ports. "
-			   "limited max. ports %d\n", SNDRV_EMUX_MAX_PORTS);
+		dev_warn(card->dev,
+			 "too many ports. limited max. ports %d\n",
+			 SNDRV_EMUX_MAX_PORTS);
 		emu->num_ports = SNDRV_EMUX_MAX_PORTS;
 	}
 
@@ -87,7 +88,7 @@ snd_emux_init_seq(struct snd_emux *emu, struct snd_card *card, int index)
 		p = snd_emux_create_port(emu, tmpname, MIDI_CHANNELS,
 					 0, &pinfo);
 		if (!p) {
-			snd_printk(KERN_ERR "can't create port\n");
+			dev_err(card->dev, "can't create port\n");
 			return -ENOMEM;
 		}
 
@@ -376,12 +377,10 @@ int snd_emux_init_virmidi(struct snd_emux *emu, struct snd_card *card)
 			goto __error;
 		}
 		emu->vmidi[i] = rmidi;
-		/* snd_printk(KERN_DEBUG "virmidi %d ok\n", i); */
 	}
 	return 0;
 
 __error:
-	/* snd_printk(KERN_DEBUG "error init..\n"); */
 	snd_emux_delete_virmidi(emu);
 	return -ENOMEM;
 }
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index 075358a533a0..02e2c69d7f18 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -942,9 +942,9 @@ void snd_emux_lock_voice(struct snd_emux *emu, int voice)
 	if (emu->voices[voice].state == SNDRV_EMUX_ST_OFF)
 		emu->voices[voice].state = SNDRV_EMUX_ST_LOCKED;
 	else
-		snd_printk(KERN_WARNING
-			   "invalid voice for lock %d (state = %x)\n",
-			   voice, emu->voices[voice].state);
+		dev_warn(emu->card->dev,
+			 "invalid voice for lock %d (state = %x)\n",
+			 voice, emu->voices[voice].state);
 	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
@@ -960,9 +960,9 @@ void snd_emux_unlock_voice(struct snd_emux *emu, int voice)
 	if (emu->voices[voice].state == SNDRV_EMUX_ST_LOCKED)
 		emu->voices[voice].state = SNDRV_EMUX_ST_OFF;
 	else
-		snd_printk(KERN_WARNING
-			   "invalid voice for unlock %d (state = %x)\n",
-			   voice, emu->voices[voice].state);
+		dev_warn(emu->card->dev,
+			 "invalid voice for unlock %d (state = %x)\n",
+			 voice, emu->voices[voice].state);
 	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 2373ed580bf8..b38a4e231790 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -38,7 +38,8 @@ static struct snd_sf_sample *sf_sample_new(struct snd_sf_list *sflist,
 static void sf_sample_delete(struct snd_sf_list *sflist,
 			     struct snd_soundfont *sf, struct snd_sf_sample *sp);
 static int load_map(struct snd_sf_list *sflist, const void __user *data, int count);
-static int load_info(struct snd_sf_list *sflist, const void __user *data, long count);
+static int load_info(struct snd_card *card, struct snd_sf_list *sflist,
+		     const void __user *data, long count);
 static int remove_info(struct snd_sf_list *sflist, struct snd_soundfont *sf,
 		       int bank, int instr);
 static void init_voice_info(struct soundfont_voice_info *avp);
@@ -113,7 +114,8 @@ snd_soundfont_close_check(struct snd_sf_list *sflist, int client)
  * it wants to do with it.
  */
 int
-snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
+snd_soundfont_load(struct snd_card *card,
+		   struct snd_sf_list *sflist, const void __user *data,
 		   long count, int client)
 {
 	struct soundfont_patch_info patch;
@@ -121,7 +123,7 @@ snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
 	int  rc;
 
 	if (count < (long)sizeof(patch)) {
-		snd_printk(KERN_ERR "patch record too small %ld\n", count);
+		dev_err(card->dev, "patch record too small %ld\n", count);
 		return -EINVAL;
 	}
 	if (copy_from_user(&patch, data, sizeof(patch)))
@@ -131,16 +133,16 @@ snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
 	data += sizeof(patch);
 
 	if (patch.key != SNDRV_OSS_SOUNDFONT_PATCH) {
-		snd_printk(KERN_ERR "The wrong kind of patch %x\n", patch.key);
+		dev_err(card->dev, "The wrong kind of patch %x\n", patch.key);
 		return -EINVAL;
 	}
 	if (count < patch.len) {
-		snd_printk(KERN_ERR "Patch too short %ld, need %d\n",
-			   count, patch.len);
+		dev_err(card->dev, "Patch too short %ld, need %d\n",
+			count, patch.len);
 		return -EINVAL;
 	}
 	if (patch.len < 0) {
-		snd_printk(KERN_ERR "poor length %d\n", patch.len);
+		dev_err(card->dev, "poor length %d\n", patch.len);
 		return -EINVAL;
 	}
 
@@ -164,7 +166,7 @@ snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
 	rc = -EINVAL;
 	switch (patch.type) {
 	case SNDRV_SFNT_LOAD_INFO:
-		rc = load_info(sflist, data, count);
+		rc = load_info(card, sflist, data, count);
 		break;
 	case SNDRV_SFNT_LOAD_DATA:
 		rc = load_data(sflist, data, count);
@@ -184,8 +186,8 @@ snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
 	case SNDRV_SFNT_REMOVE_INFO:
 		/* patch must be opened */
 		if (!sflist->currsf) {
-			snd_printk(KERN_ERR "soundfont: remove_info: "
-				   "patch not opened\n");
+			dev_err(card->dev,
+				"soundfont: remove_info: patch not opened\n");
 			rc = -EINVAL;
 		} else {
 			int bank, instr;
@@ -509,7 +511,8 @@ remove_info(struct snd_sf_list *sflist, struct snd_soundfont *sf,
  * open soundfont.
  */
 static int
-load_info(struct snd_sf_list *sflist, const void __user *data, long count)
+load_info(struct snd_card *card,
+	  struct snd_sf_list *sflist, const void __user *data, long count)
 {
 	struct snd_soundfont *sf;
 	struct snd_sf_zone *zone;
@@ -525,7 +528,7 @@ load_info(struct snd_sf_list *sflist, const void __user *data, long count)
 		return -EINVAL;
 
 	if (count < (long)sizeof(hdr)) {
-		printk(KERN_ERR "Soundfont error: invalid patch zone length\n");
+		dev_err(card->dev, "Soundfont error: invalid patch zone length\n");
 		return -EINVAL;
 	}
 	if (copy_from_user((char*)&hdr, data, sizeof(hdr)))
@@ -535,15 +538,15 @@ load_info(struct snd_sf_list *sflist, const void __user *data, long count)
 	count -= sizeof(hdr);
 
 	if (hdr.nvoices <= 0 || hdr.nvoices >= 100) {
-		printk(KERN_ERR "Soundfont error: Illegal voice number %d\n",
-		       hdr.nvoices);
+		dev_err(card->dev, "Soundfont error: Illegal voice number %d\n",
+			hdr.nvoices);
 		return -EINVAL;
 	}
 
 	if (count < (long)sizeof(struct soundfont_voice_info) * hdr.nvoices) {
-		printk(KERN_ERR "Soundfont Error: "
-		       "patch length(%ld) is smaller than nvoices(%d)\n",
-		       count, hdr.nvoices);
+		dev_err(card->dev,
+			"Soundfont Error: patch length(%ld) is smaller than nvoices(%d)\n",
+			count, hdr.nvoices);
 		return -EINVAL;
 	}
 
@@ -974,7 +977,8 @@ int snd_sf_vol_table[128] = {
 
 /* load GUS patch */
 static int
-load_guspatch(struct snd_sf_list *sflist, const char __user *data, long count)
+load_guspatch(struct snd_card *card,
+	      struct snd_sf_list *sflist, const char __user *data, long count)
 {
 	struct patch_info patch;
 	struct snd_soundfont *sf;
@@ -984,7 +988,7 @@ load_guspatch(struct snd_sf_list *sflist, const char __user *data, long count)
 	int rc;
 
 	if (count < (long)sizeof(patch)) {
-		snd_printk(KERN_ERR "patch record too small %ld\n", count);
+		dev_err(card->dev, "patch record too small %ld\n", count);
 		return -EINVAL;
 	}
 	if (copy_from_user(&patch, data, sizeof(patch)))
@@ -1076,10 +1080,10 @@ load_guspatch(struct snd_sf_list *sflist, const char __user *data, long count)
 	/* panning position; -128 - 127 => 0-127 */
 	zone->v.pan = (patch.panning + 128) / 2;
 #if 0
-	snd_printk(KERN_DEBUG
-		   "gus: basefrq=%d (ofs=%d) root=%d,tune=%d, range:%d-%d\n",
-		   (int)patch.base_freq, zone->v.rate_offset,
-		   zone->v.root, zone->v.tune, zone->v.low, zone->v.high);
+	pr_debug(
+		 "gus: basefrq=%d (ofs=%d) root=%d,tune=%d, range:%d-%d\n",
+		 (int)patch.base_freq, zone->v.rate_offset,
+		 zone->v.root, zone->v.tune, zone->v.low, zone->v.high);
 #endif
 
 	/* detuning is ignored */
@@ -1111,12 +1115,12 @@ load_guspatch(struct snd_sf_list *sflist, const char __user *data, long count)
 		zone->v.parm.volrelease = 0x8000 | snd_sf_calc_parm_decay(release);
 		zone->v.attenuation = calc_gus_attenuation(patch.env_offset[0]);
 #if 0
-		snd_printk(KERN_DEBUG
-			   "gus: atkhld=%x, dcysus=%x, volrel=%x, att=%d\n",
-			   zone->v.parm.volatkhld,
-			   zone->v.parm.voldcysus,
-			   zone->v.parm.volrelease,
-			   zone->v.attenuation);
+		dev_dbg(card->dev,
+			"gus: atkhld=%x, dcysus=%x, volrel=%x, att=%d\n",
+			zone->v.parm.volatkhld,
+			zone->v.parm.voldcysus,
+			zone->v.parm.volrelease,
+			zone->v.attenuation);
 #endif
 	}
 
@@ -1160,12 +1164,13 @@ load_guspatch(struct snd_sf_list *sflist, const char __user *data, long count)
 
 /* load GUS patch */
 int
-snd_soundfont_load_guspatch(struct snd_sf_list *sflist, const char __user *data,
+snd_soundfont_load_guspatch(struct snd_card *card,
+			    struct snd_sf_list *sflist, const char __user *data,
 			    long count)
 {
 	int rc;
 	lock_preset(sflist);
-	rc = load_guspatch(sflist, data, count);
+	rc = load_guspatch(card, sflist, data, count);
 	unlock_preset(sflist);
 	return rc;
 }
-- 
2.43.0

