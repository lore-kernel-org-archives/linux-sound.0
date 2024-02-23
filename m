Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26411642A
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677775; cv=none; b=BbeQ9y6/uiilbXYRFBVSTw8HxIvsocob3RJCsIrEGsGPK4O+QC9kkgbBzVvZS7k+080potXsCLCxbc3IgLI09lvqonFJXf3XOLOoNZom2YowChFfh6rRTcIZDKJ4ph8i+dDUpQbyCHfgtoqVJL95iQA++7FtNzhlkgTq8uWkg1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677775; c=relaxed/simple;
	bh=gtErrS1TG7qekQ1exHf93mN3yIEMIDjM4WdbRO27PY0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QLwzZ27LlcUW3MrxMj6kZyDskzK2yQydoG08KJW+zzgPWS5/edPfT97NAXiUADFF87g6RRf+oBL15XB1ytsjdCpgUptbkphy7Dnea6VX7f5bPr50QaF5J6DeIAE2NDXdvvyzb6JqyCF7e0UHQfCLRp1zE16F5CbAuM41tqErMhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r77p6wmE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9a7Erv3J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RoghIRaq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gI/Xy61m; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r77p6wmE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9a7Erv3J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RoghIRaq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gI/Xy61m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E4CC9218E7;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDyVbsTYp/PpV98ag4Rba/+ALPageVgohiTLLr3dkwA=;
	b=r77p6wmEXWpIAni/IfvUB+/w8J6vUodA/0YRr5RM4JInRF7AcozMHV0TIUDQ7EobE7H1em
	0Yg+pU8V4nExOG9ymqcKeh8583P4yhWs6zTgeJ06Qn2ULFtqMVdVv91h1WMBt1yuaBjbFH
	Htt3MKkVL+B85MqjQLQJdaMlPvra7O8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDyVbsTYp/PpV98ag4Rba/+ALPageVgohiTLLr3dkwA=;
	b=9a7Erv3JsHXfLiV2elPGua4VexaUcWFyTOExHxJdzrsuyuwjlXf0ovaOgaPxVq51QbH1ju
	4pV8DEwdaXvdAhCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDyVbsTYp/PpV98ag4Rba/+ALPageVgohiTLLr3dkwA=;
	b=RoghIRaqkTbwgHx10iJ76sQ6zkpFLNSSS/88AYpNWAvj/04pwzS4UMdSQXeGxNY84OZLMn
	CgXQQl7YQZqJzjA9ch30wS3QHoQ2cl97PU25gggjXdxI8X52BlPqYZtpf0SDwTg2yy3L0G
	6kyebG30zLl++BbcVRjUbYlgTwsrqQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDyVbsTYp/PpV98ag4Rba/+ALPageVgohiTLLr3dkwA=;
	b=gI/Xy61m0VnaAIaibq1ZkGRnf5E3eoXyORi98OJMu2ujAwUXliDg3m2+2zdit0l0KDiSZO
	wsLeBrn4StuKKmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA5D5133DC;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MIQWMIpa2GVDOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:42:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: mixer_oss: ump: Use automatic cleanup of kfree()
Date: Fri, 23 Feb 2024 09:42:40 +0100
Message-Id: <20240223084241.3361-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223084241.3361-1-tiwai@suse.de>
References: <20240223084241.3361-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RoghIRaq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="gI/Xy61m"
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: E4CC9218E7
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c | 59 ++++++++++++--------------------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index dae2da380835..e10017a42ed8 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -532,8 +532,8 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 					  unsigned int numid,
 					  int *left, int *right)
 {
-	struct snd_ctl_elem_info *uinfo;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 
@@ -561,8 +561,6 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 		*right = snd_mixer_oss_conv1(uctl->value.integer.value[1], uinfo->value.integer.min, uinfo->value.integer.max, &pslot->volume[1]);
       __unalloc:
 	up_read(&card->controls_rwsem);
-      	kfree(uctl);
-      	kfree(uinfo);
 }
 
 static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
@@ -571,8 +569,8 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 					 int *left, int *right,
 					 int route)
 {
-	struct snd_ctl_elem_info *uinfo;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 
@@ -601,8 +599,6 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 		*right = 0;
       __unalloc:
 	up_read(&card->controls_rwsem);
-      	kfree(uctl);
-	kfree(uinfo);
 }
 
 static int snd_mixer_oss_get_volume1(struct snd_mixer_oss_file *fmixer,
@@ -636,8 +632,8 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 					  unsigned int numid,
 					  int left, int right)
 {
-	struct snd_ctl_elem_info *uinfo;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 	int res;
@@ -669,8 +665,6 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
       __unalloc:
 	up_read(&card->controls_rwsem);
-      	kfree(uctl);
-	kfree(uinfo);
 }
 
 static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
@@ -679,8 +673,8 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 					 int left, int right,
 					 int route)
 {
-	struct snd_ctl_elem_info *uinfo;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 	int res;
@@ -716,8 +710,6 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
       __unalloc:
 	up_read(&card->controls_rwsem);
-      	kfree(uctl);
-	kfree(uinfo);
 }
 
 static int snd_mixer_oss_put_volume1(struct snd_mixer_oss_file *fmixer,
@@ -822,16 +814,14 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	struct snd_kcontrol *kctl;
 	struct snd_mixer_oss_slot *pslot;
 	struct slot *slot;
-	struct snd_ctl_elem_info *uinfo;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int err, idx;
 	
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
-	if (uinfo == NULL || uctl == NULL) {
-		err = -ENOMEM;
-		goto __free_only;
-	}
+	if (uinfo == NULL || uctl == NULL)
+		return -ENOMEM;
 	down_read(&card->controls_rwsem);
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (! kctl) {
@@ -861,9 +851,6 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	err = 0;
       __unlock:
      	up_read(&card->controls_rwsem);
-      __free_only:
-      	kfree(uctl);
-      	kfree(uinfo);
       	return err;
 }
 
@@ -874,17 +861,15 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	struct snd_kcontrol *kctl;
 	struct snd_mixer_oss_slot *pslot;
 	struct slot *slot = NULL;
-	struct snd_ctl_elem_info *uinfo;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int err;
 	unsigned int idx;
 
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
-	if (uinfo == NULL || uctl == NULL) {
-		err = -ENOMEM;
-		goto __free_only;
-	}
+	if (uinfo == NULL || uctl == NULL)
+		return -ENOMEM;
 	down_read(&card->controls_rwsem);
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (! kctl) {
@@ -917,9 +902,6 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	err = 0;
       __unlock:
 	up_read(&card->controls_rwsem);
-      __free_only:
-	kfree(uctl);
-	kfree(uinfo);
 	return err;
 }
 
@@ -931,7 +913,7 @@ struct snd_mixer_oss_assign_table {
 
 static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *slot, const char *name, int index, int item)
 {
-	struct snd_ctl_elem_info *info;
+	struct snd_ctl_elem_info *info __free(kfree) = NULL;
 	struct snd_kcontrol *kcontrol;
 	struct snd_card *card = mixer->card;
 	int err;
@@ -950,7 +932,6 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 	err = kcontrol->info(kcontrol, info);
 	if (err < 0) {
 		up_read(&card->controls_rwsem);
-		kfree(info);
 		return err;
 	}
 	slot->numid[item] = kcontrol->id.numid;
@@ -958,7 +939,6 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 	if (info->count > slot->channels)
 		slot->channels = info->count;
 	slot->present |= 1 << item;
-	kfree(info);
 	return 0;
 }
 
@@ -1073,7 +1053,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	if (!ptr->index)
 		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (kctl) {
-		struct snd_ctl_elem_info *uinfo;
+		struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
 
 		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 		if (! uinfo) {
@@ -1083,7 +1063,6 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 			
 		if (kctl->info(kctl, uinfo)) {
 			up_read(&mixer->card->controls_rwsem);
-			kfree(uinfo);
 			return 0;
 		}
 		strcpy(str, ptr->name);
@@ -1099,7 +1078,6 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 				uinfo->value.enumerated.item = slot.capture_item;
 				if (kctl->info(kctl, uinfo)) {
 					up_read(&mixer->card->controls_rwsem);
-					kfree(uinfo);
 					return 0;
 				}
 				if (!strcmp(uinfo->value.enumerated.name, str)) {
@@ -1108,7 +1086,6 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 				}
 			}
 		}
-		kfree(uinfo);
 	}
 	up_read(&mixer->card->controls_rwsem);
 	if (slot.present != 0) {
-- 
2.35.3

