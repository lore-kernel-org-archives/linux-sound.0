Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD9145B21
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722269189; cv=none; b=E/YaZH+3V7ct9G8FVlJ+6zwAcLp5NuLoc7QHA22VPL9SQ3Zxlf6rb9shwMKI/vZfctHbeiXWCfq9LcjVAR6Lh/ncFTCNCpjz6JLSuOTLWdGEzghFqsNs0lrZaoTzilZM3uwHBKQUMeUO/m6EARNfSbCchEdchX5mTzCzkBEb0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722269189; c=relaxed/simple;
	bh=5FeoWSK8ctvh5zxsVTTprqnZToszZogpTovYDSTwN28=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e2Y+cB8JWv/LOvIXz9hqD8kfygtmUgvMreA4CMhb/HlScU/HB1ihlcx9dTW9ZDE0cBjR9uSnqra8ouk2nMYhdWQTaLWvQQ1y1rklPdd2aVe/cKViXzjMAB0UXsoPJQELSUXVy01IDV68EPZ1kxEDPCnY/zawbEYvN4Iz6o9T3D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oWOyJjby; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6KrOhUAe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oWOyJjby; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6KrOhUAe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oWOyJjby";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6KrOhUAe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oWOyJjby";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6KrOhUAe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2892E1F7A7;
	Mon, 29 Jul 2024 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722269185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7/2tvrKJeQmKE+UkKOys0KrTWvEy62FZNw7RmGEP7s=;
	b=oWOyJjbykDKNBmZxY79+GhowICv2Q0N7eMw4PCVDhWrGifaTZIv6NHFwArKZo9vEAfsRA8
	DrOgqxGUOE4Ws5hqBvDygAcORajlN+y7KwXki2Ums/LCtd1wxYFarFkIFwsHHVS4H8tvOZ
	OJ4CuWHVYyx4gTD+mXRBZB/eKxxIvWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722269185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7/2tvrKJeQmKE+UkKOys0KrTWvEy62FZNw7RmGEP7s=;
	b=6KrOhUAeGOTB/QaMaJrqh8dbbCwFESgClIhAqQItgLjMaY5qtGrlMvEcOVf/gDWvhds/4D
	gLJEYRiEeEEeevBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oWOyJjby;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6KrOhUAe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722269185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7/2tvrKJeQmKE+UkKOys0KrTWvEy62FZNw7RmGEP7s=;
	b=oWOyJjbykDKNBmZxY79+GhowICv2Q0N7eMw4PCVDhWrGifaTZIv6NHFwArKZo9vEAfsRA8
	DrOgqxGUOE4Ws5hqBvDygAcORajlN+y7KwXki2Ums/LCtd1wxYFarFkIFwsHHVS4H8tvOZ
	OJ4CuWHVYyx4gTD+mXRBZB/eKxxIvWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722269185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7/2tvrKJeQmKE+UkKOys0KrTWvEy62FZNw7RmGEP7s=;
	b=6KrOhUAeGOTB/QaMaJrqh8dbbCwFESgClIhAqQItgLjMaY5qtGrlMvEcOVf/gDWvhds/4D
	gLJEYRiEeEEeevBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE25C1368A;
	Mon, 29 Jul 2024 16:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9nZoOAC+p2ZnBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 16:06:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: control: Take power_ref lock primarily
Date: Mon, 29 Jul 2024 18:06:58 +0200
Message-ID: <20240729160659.4516-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2892E1F7A7
X-Spam-Score: -2.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

The code path for kcontrol accesses have often nested locks of both
card's controls_rwsem and power_ref, and applies in that order.
However, what could take much longer is the latter, power_ref; it
waits for the power state of the device, and it pretty much depends on
the user's action.

This patch swaps the locking order of those locks to a more natural
way, namely, power_ref -> controls_rwsem, in order to shorten the time
of possible nested locks.  For consistency, power_ref is taken always
in the top-level caller side (that is, *_user() functions and the
ioctl handler itself).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 54 ++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index f64a555f404f..96a2c088a460 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1167,9 +1167,7 @@ static int __snd_ctl_elem_info(struct snd_card *card,
 #ifdef CONFIG_SND_DEBUG
 	info->access = 0;
 #endif
-	result = snd_power_ref_and_wait(card);
-	if (!result)
-		result = kctl->info(kctl, info);
+	result = kctl->info(kctl, info);
 	snd_power_unref(card);
 	if (result >= 0) {
 		snd_BUG_ON(info->access);
@@ -1208,12 +1206,17 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 static int snd_ctl_elem_info_user(struct snd_ctl_file *ctl,
 				  struct snd_ctl_elem_info __user *_info)
 {
+	struct snd_card *card = ctl->card;
 	struct snd_ctl_elem_info info;
 	int result;
 
 	if (copy_from_user(&info, _info, sizeof(info)))
 		return -EFAULT;
+	result = snd_power_ref_and_wait(card);
+	if (result)
+		return result;
 	result = snd_ctl_elem_info(ctl, &info);
+	snd_power_unref(card);
 	if (result < 0)
 		return result;
 	/* drop internal access flags */
@@ -1257,10 +1260,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 
 	if (!snd_ctl_skip_validation(&info))
 		fill_remaining_elem_value(control, &info, pattern);
-	ret = snd_power_ref_and_wait(card);
-	if (!ret)
-		ret = kctl->get(kctl, control);
-	snd_power_unref(card);
+	ret = kctl->get(kctl, control);
 	if (ret < 0)
 		return ret;
 	if (!snd_ctl_skip_validation(&info) &&
@@ -1285,7 +1285,11 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 	if (IS_ERR(control))
 		return PTR_ERR(no_free_ptr(control));
 
+	result = snd_power_ref_and_wait(card);
+	if (result)
+		return result;
 	result = snd_ctl_elem_read(card, control);
+	snd_power_unref(card);
 	if (result < 0)
 		return result;
 
@@ -1300,7 +1304,7 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int index_offset;
-	int result;
+	int result = 0;
 
 	down_write(&card->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, &control->id);
@@ -1318,9 +1322,8 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	}
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
-	result = snd_power_ref_and_wait(card);
 	/* validate input values */
-	if (IS_ENABLED(CONFIG_SND_CTL_INPUT_VALIDATION) && !result) {
+	if (IS_ENABLED(CONFIG_SND_CTL_INPUT_VALIDATION)) {
 		struct snd_ctl_elem_info info;
 
 		memset(&info, 0, sizeof(info));
@@ -1332,7 +1335,6 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	}
 	if (!result)
 		result = kctl->put(kctl, control);
-	snd_power_unref(card);
 	if (result < 0) {
 		up_write(&card->controls_rwsem);
 		return result;
@@ -1361,7 +1363,11 @@ static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 		return PTR_ERR(no_free_ptr(control));
 
 	card = file->card;
+	result = snd_power_ref_and_wait(card);
+	if (result < 0)
+		return result;
 	result = snd_ctl_elem_write(card, file, control);
+	snd_power_unref(card);
 	if (result < 0)
 		return result;
 
@@ -1830,7 +1836,7 @@ static int call_tlv_handler(struct snd_ctl_file *file, int op_flag,
 		{SNDRV_CTL_TLV_OP_CMD,   SNDRV_CTL_ELEM_ACCESS_TLV_COMMAND},
 	};
 	struct snd_kcontrol_volatile *vd = &kctl->vd[snd_ctl_get_ioff(kctl, id)];
-	int i, ret;
+	int i;
 
 	/* Check support of the request for this element. */
 	for (i = 0; i < ARRAY_SIZE(pairs); ++i) {
@@ -1848,11 +1854,7 @@ static int call_tlv_handler(struct snd_ctl_file *file, int op_flag,
 	    vd->owner != NULL && vd->owner != file)
 		return -EPERM;
 
-	ret = snd_power_ref_and_wait(file->card);
-	if (!ret)
-		ret = kctl->tlv.c(kctl, op_flag, size, buf);
-	snd_power_unref(file->card);
-	return ret;
+	return kctl->tlv.c(kctl, op_flag, size, buf);
 }
 
 static int read_tlv_buf(struct snd_kcontrol *kctl, struct snd_ctl_elem_id *id,
@@ -1965,16 +1967,28 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 	case SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS:
 		return snd_ctl_subscribe_events(ctl, ip);
 	case SNDRV_CTL_IOCTL_TLV_READ:
-		scoped_guard(rwsem_read, &ctl->card->controls_rwsem)
+		err = snd_power_ref_and_wait(card);
+		if (err < 0)
+			return err;
+		scoped_guard(rwsem_read, &card->controls_rwsem)
 			err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_READ);
+		snd_power_unref(card);
 		return err;
 	case SNDRV_CTL_IOCTL_TLV_WRITE:
-		scoped_guard(rwsem_write, &ctl->card->controls_rwsem)
+		err = snd_power_ref_and_wait(card);
+		if (err < 0)
+			return err;
+		scoped_guard(rwsem_write, &card->controls_rwsem)
 			err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_WRITE);
+		snd_power_unref(card);
 		return err;
 	case SNDRV_CTL_IOCTL_TLV_COMMAND:
-		scoped_guard(rwsem_write, &ctl->card->controls_rwsem)
+		err = snd_power_ref_and_wait(card);
+		if (err < 0)
+			return err;
+		scoped_guard(rwsem_write, &card->controls_rwsem)
 			err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_CMD);
+		snd_power_unref(card);
 		return err;
 	case SNDRV_CTL_IOCTL_POWER:
 		return -ENOPROTOOPT;
-- 
2.43.0

