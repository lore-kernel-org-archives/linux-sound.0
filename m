Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCF918FC8E
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723134654; cv=none; b=umMDxCZQNgsJa/8QOajtzIc9uT4SpSD3+lcxDn0AlpGV1HeqBEVvh625gvcmvTsJJID7jrf+B3fQFQ61Kuj3XcqM4LJKdpRuVnz6FPmMvWp3p23/FZOX6ezo+FAfvGTPbZuvFDgTsaoJ1RmWgsJufG9YcomvpA7/iS1egP69C8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723134654; c=relaxed/simple;
	bh=0LyjoKXSX39pyvpEVIrZa4vxNCu2WLRCroPGFsKYMsI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CqpA9zzR8cWDJvYgAs5F1VVnT34UwrxNWomgjFhpXzbHaeEBdIqOuCbcJPCx3tmwP/Ir1rEXgMMEznSuWPUrqsDj1sFseA4LEG7AaMEcvaHjqe4kGxy2sEVQHIs6BBbzdn0dfh5iH3qXxDnVwIThS2grYIKsTjkFwgcQJvZ8iNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ed6z/Yvv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=87O1xYwF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ed6z/Yvv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=87O1xYwF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ed6z/Yvv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="87O1xYwF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ed6z/Yvv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="87O1xYwF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ABD27216ED;
	Thu,  8 Aug 2024 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723134650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rV9XCSv9Jz59Nui7grurasVcRIfFCFlsQ3VjksL2vqo=;
	b=ed6z/YvvGSh68GONRlARULQgZ/SK96aFI2j7MnYP8ufttv+vhi3Q7xi+6bhm9IdmhVDn7R
	oYLrG9wzYZU6jZs5oQg+pH/UY0E5/04mN2z0NCSPPaCVPz8AtHYQzrc1ElvSf9/C18Dvo4
	xSn9CJwBXdZBclCMtKXKgDg6ozTiOpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723134650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rV9XCSv9Jz59Nui7grurasVcRIfFCFlsQ3VjksL2vqo=;
	b=87O1xYwFFqoFcrNADfG/EGlwJJ5qhsLgBgbcqjfI6Tv3gfK2esgfWpe/oy1/gcQa7FTU63
	vgCJstsSyk0HnBBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723134650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rV9XCSv9Jz59Nui7grurasVcRIfFCFlsQ3VjksL2vqo=;
	b=ed6z/YvvGSh68GONRlARULQgZ/SK96aFI2j7MnYP8ufttv+vhi3Q7xi+6bhm9IdmhVDn7R
	oYLrG9wzYZU6jZs5oQg+pH/UY0E5/04mN2z0NCSPPaCVPz8AtHYQzrc1ElvSf9/C18Dvo4
	xSn9CJwBXdZBclCMtKXKgDg6ozTiOpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723134650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rV9XCSv9Jz59Nui7grurasVcRIfFCFlsQ3VjksL2vqo=;
	b=87O1xYwFFqoFcrNADfG/EGlwJJ5qhsLgBgbcqjfI6Tv3gfK2esgfWpe/oy1/gcQa7FTU63
	vgCJstsSyk0HnBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 922F213B20;
	Thu,  8 Aug 2024 16:30:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id avFWIrrytGbWLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 16:30:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: control: Fix power_ref lock order for compat code, too
Date: Thu,  8 Aug 2024 18:31:27 +0200
Message-ID: <20240808163128.20383-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

In the previous change for swapping the power_ref and controls_rwsem
lock order, the code path for the compat layer was forgotten.
This patch covers the remaining code.

Fixes: fcc62b19104a ("ALSA: control: Take power_ref lock primarily")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_compat.c | 45 ++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 934bb945e702..ff0031cc7dfb 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -79,6 +79,7 @@ struct snd_ctl_elem_info32 {
 static int snd_ctl_elem_info_compat(struct snd_ctl_file *ctl,
 				    struct snd_ctl_elem_info32 __user *data32)
 {
+	struct snd_card *card = ctl->card;
 	struct snd_ctl_elem_info *data __free(kfree) = NULL;
 	int err;
 
@@ -95,7 +96,11 @@ static int snd_ctl_elem_info_compat(struct snd_ctl_file *ctl,
 	if (get_user(data->value.enumerated.item, &data32->value.enumerated.item))
 		return -EFAULT;
 
+	err = snd_power_ref_and_wait(card);
+	if (err < 0)
+		return err;
 	err = snd_ctl_elem_info(ctl, data);
+	snd_power_unref(card);
 	if (err < 0)
 		return err;
 	/* restore info to 32bit */
@@ -175,10 +180,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	if (info == NULL)
 		return -ENOMEM;
 	info->id = *id;
-	err = snd_power_ref_and_wait(card);
-	if (!err)
-		err = kctl->info(kctl, info);
-	snd_power_unref(card);
+	err = kctl->info(kctl, info);
 	if (err >= 0) {
 		err = info->type;
 		*countp = info->count;
@@ -275,8 +277,8 @@ static int copy_ctl_value_to_user(void __user *userdata,
 	return 0;
 }
 
-static int ctl_elem_read_user(struct snd_card *card,
-			      void __user *userdata, void __user *valuep)
+static int __ctl_elem_read_user(struct snd_card *card,
+				void __user *userdata, void __user *valuep)
 {
 	struct snd_ctl_elem_value *data __free(kfree) = NULL;
 	int err, type, count;
@@ -296,8 +298,21 @@ static int ctl_elem_read_user(struct snd_card *card,
 	return copy_ctl_value_to_user(userdata, valuep, data, type, count);
 }
 
-static int ctl_elem_write_user(struct snd_ctl_file *file,
-			       void __user *userdata, void __user *valuep)
+static int ctl_elem_read_user(struct snd_card *card,
+			      void __user *userdata, void __user *valuep)
+{
+	int err;
+
+	err = snd_power_ref_and_wait(card);
+	if (err < 0)
+		return err;
+	err = __ctl_elem_read_user(card, userdata, valuep);
+	snd_power_unref(card);
+	return err;
+}
+
+static int __ctl_elem_write_user(struct snd_ctl_file *file,
+				 void __user *userdata, void __user *valuep)
 {
 	struct snd_ctl_elem_value *data __free(kfree) = NULL;
 	struct snd_card *card = file->card;
@@ -318,6 +333,20 @@ static int ctl_elem_write_user(struct snd_ctl_file *file,
 	return copy_ctl_value_to_user(userdata, valuep, data, type, count);
 }
 
+static int ctl_elem_write_user(struct snd_ctl_file *file,
+			       void __user *userdata, void __user *valuep)
+{
+	struct snd_card *card = file->card;
+	int err;
+
+	err = snd_power_ref_and_wait(card);
+	if (err < 0)
+		return err;
+	err = __ctl_elem_write_user(file, userdata, valuep);
+	snd_power_unref(card);
+	return err;
+}
+
 static int snd_ctl_elem_read_user_compat(struct snd_card *card,
 					 struct snd_ctl_elem_value32 __user *data32)
 {
-- 
2.43.0

