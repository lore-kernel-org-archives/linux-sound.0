Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901A34EEED
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894048; cv=none; b=D9degZxZEGR1ffZ2NvyrYHFQlyqDJPhsofMZcwfOi/hK5Yc5lTcxQ3Mt/L9K6/jnnpN25yRVGtIiga21/GnsdoDElKk4+YLg4n0a7JZtryAja5XRhOi3e05aVII9OyfSXYPN33wLpq694jR8862zOWbxx7d3KnPQHNNQcnfuteQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894048; c=relaxed/simple;
	bh=PXwMAInEhFfP0cW1Wn8Nc8oTVtrinAPNTEeZUDVOTew=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgXjsttBtqOO+H0gX5H980eOWDiigZpbinDWM95j3DyiHro1pgP0kof3nror/wbDbraMQG5Wf/3uHhj2erLzy6V6D+EPmBSvlfKL5+jYQgL7a5imZ4CIAjl9nw8ueRmx0F9L0LecKWqBHugM9T7T6cK/91VQeRw4hM19zJ9BaNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NP+onnhG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m5yy6Fen; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xKrbg1lY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bFW10fbU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NP+onnhG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m5yy6Fen";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xKrbg1lY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bFW10fbU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4537336A6;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGpEHcRT8D3Hmv5fXxG+MeSZodI0OPWHBAQ4Wv2OH04=;
	b=NP+onnhGANAxOhKrQqOmun3AeM5+SzVMWbJ8EMRA4KniqDTWHnTkCtPlp3YWeoYLg/foqT
	SSWjzi6Cq//RqWT8TM4bo4ElMRZs4zEX6BsgryQg4tLFguXu9AHbIDar/MV533oto/CCUD
	quYMmDVT+nQ3Lk6H5zLU9OKYg9P840s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGpEHcRT8D3Hmv5fXxG+MeSZodI0OPWHBAQ4Wv2OH04=;
	b=m5yy6Fen4rcri8BWCgK4GSbO7omSDMFeoEYep7PSmg5ZOFpeTgM2lc5u7+lXkPlxHi+BrS
	4LUYrhhfnPrbWiDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xKrbg1lY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bFW10fbU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGpEHcRT8D3Hmv5fXxG+MeSZodI0OPWHBAQ4Wv2OH04=;
	b=xKrbg1lYuSExGXUFpD+m2YbKGw2M4modg6V1vlLV2TpphPF8PAdIwartqSFKj9JOA+6f58
	yoE7ttSMFHznjoP2wYlM3OBAImAbJ0TCV3fcqKnXLf1o4Pb7f/ZYX2DzIEB84UppD3G7tp
	IFU2XhfYc55T1+2PytfIyrlldn2ThLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGpEHcRT8D3Hmv5fXxG+MeSZodI0OPWHBAQ4Wv2OH04=;
	b=bFW10fbU2VLV+RZW1IYyDcNB+llCxjHgR86qYn/ovawttKmPbDbWYvo2GJJbpVpDs9G/La
	6fDhplgJw2QieVBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93A953EA66;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMGII3JnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/11] ALSA: control: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:24 +0100
Message-ID: <20251216140634.171890-3-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216140634.171890-1-tiwai@suse.de>
References: <20251216140634.171890-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: A4537336A6
X-Spam-Flag: NO
X-Spam-Score: -3.01

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Fixes: 7dba48a474e6 ("ALSA: control_led: Use guard() for locking")
Fixes: 1052d9882269 ("ALSA: control: Use automatic cleanup of kfree()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c        | 12 ++++++------
 sound/core/control_compat.c | 21 +++++++++++----------
 sound/core/control_led.c    | 12 ++++++------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 9c3fd5113a61..486d1bc4dac2 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -867,9 +867,9 @@ EXPORT_SYMBOL(snd_ctl_find_id);
 static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 			     unsigned int cmd, void __user *arg)
 {
-	struct snd_ctl_card_info *info __free(kfree) = NULL;
+	struct snd_ctl_card_info *info __free(kfree) =
+		kzalloc(sizeof(*info), GFP_KERNEL);
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info)
 		return -ENOMEM;
 	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
@@ -1244,10 +1244,10 @@ static int snd_ctl_elem_read(struct snd_card *card,
 static int snd_ctl_elem_read_user(struct snd_card *card,
 				  struct snd_ctl_elem_value __user *_control)
 {
-	struct snd_ctl_elem_value *control __free(kfree) = NULL;
 	int result;
+	struct snd_ctl_elem_value *control __free(kfree) =
+		memdup_user(_control, sizeof(*control));
 
-	control = memdup_user(_control, sizeof(*control));
 	if (IS_ERR(control))
 		return PTR_ERR(control);
 
@@ -1320,11 +1320,11 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 				   struct snd_ctl_elem_value __user *_control)
 {
-	struct snd_ctl_elem_value *control __free(kfree) = NULL;
 	struct snd_card *card;
 	int result;
+	struct snd_ctl_elem_value *control __free(kfree) =
+		memdup_user(_control, sizeof(*control));
 
-	control = memdup_user(_control, sizeof(*control));
 	if (IS_ERR(control))
 		return PTR_ERR(control);
 
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 6459809ed364..b8988a4bcd9b 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -80,10 +80,10 @@ static int snd_ctl_elem_info_compat(struct snd_ctl_file *ctl,
 				    struct snd_ctl_elem_info32 __user *data32)
 {
 	struct snd_card *card = ctl->card;
-	struct snd_ctl_elem_info *data __free(kfree) = NULL;
 	int err;
+	struct snd_ctl_elem_info *data __free(kfree) =
+		kzalloc(sizeof(*data), GFP_KERNEL);
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (! data)
 		return -ENOMEM;
 
@@ -169,14 +169,15 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 			int *countp)
 {
 	struct snd_kcontrol *kctl;
-	struct snd_ctl_elem_info *info __free(kfree) = NULL;
 	int err;
 
 	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_ctl_find_id(card, id);
 	if (!kctl)
 		return -ENOENT;
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
+
+	struct snd_ctl_elem_info *info __free(kfree) =
+		kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL)
 		return -ENOMEM;
 	info->id = *id;
@@ -280,10 +281,10 @@ static int copy_ctl_value_to_user(void __user *userdata,
 static int __ctl_elem_read_user(struct snd_card *card,
 				void __user *userdata, void __user *valuep)
 {
-	struct snd_ctl_elem_value *data __free(kfree) = NULL;
 	int err, type, count;
+	struct snd_ctl_elem_value *data __free(kfree) =
+		kzalloc(sizeof(*data), GFP_KERNEL);
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
@@ -314,11 +315,11 @@ static int ctl_elem_read_user(struct snd_card *card,
 static int __ctl_elem_write_user(struct snd_ctl_file *file,
 				 void __user *userdata, void __user *valuep)
 {
-	struct snd_ctl_elem_value *data __free(kfree) = NULL;
 	struct snd_card *card = file->card;
 	int err, type, count;
+	struct snd_ctl_elem_value *data __free(kfree) =
+		kzalloc(sizeof(*data), GFP_KERNEL);
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
@@ -378,9 +379,9 @@ static int snd_ctl_elem_add_compat(struct snd_ctl_file *file,
 				   struct snd_ctl_elem_info32 __user *data32,
 				   int replace)
 {
-	struct snd_ctl_elem_info *data __free(kfree) = NULL;
+	struct snd_ctl_elem_info *data __free(kfree) =
+		kzalloc(sizeof(*data), GFP_KERNEL);
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (! data)
 		return -ENOMEM;
 
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index e33dfcf863cf..c7641d5084e7 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -245,12 +245,12 @@ DEFINE_FREE(snd_card_unref, struct snd_card *, if (_T) snd_card_unref(_T))
 static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 			      unsigned int group, bool set)
 {
-	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int ioff, access, new_access;
+	struct snd_card *card __free(snd_card_unref) =
+		snd_card_ref(card_number);
 
-	card = snd_card_ref(card_number);
 	if (!card)
 		return -ENXIO;
 	guard(rwsem_write)(&card->controls_rwsem);
@@ -302,13 +302,13 @@ static void snd_ctl_led_clean(struct snd_card *card)
 
 static int snd_ctl_led_reset(int card_number, unsigned int group)
 {
-	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ctl_led_ctl *lctl, *_lctl;
 	struct snd_ctl_led *led;
 	struct snd_kcontrol_volatile *vd;
 	bool change = false;
+	struct snd_card *card __free(snd_card_unref) =
+		snd_card_ref(card_number);
 
-	card = snd_card_ref(card_number);
 	if (!card)
 		return -ENXIO;
 
@@ -598,11 +598,11 @@ static ssize_t list_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
-	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ctl_led_ctl *lctl;
 	size_t l = 0;
+	struct snd_card *card __free(snd_card_unref) =
+		snd_card_ref(led_card->number);
 
-	card = snd_card_ref(led_card->number);
 	if (!card)
 		return -ENXIO;
 	guard(rwsem_read)(&card->controls_rwsem);
-- 
2.52.0

