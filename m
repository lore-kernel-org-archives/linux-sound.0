Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045EC34D38B
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894024; cv=none; b=qKJiMxGWAcNDNpfWizuQV8vAo829KZcv/72tdEw6MxEsM7z8HCUITloQr70PXeMZUiFGwpuk+zi5SwRLLnzbaGKNDVAguCnJ03f1fMSOa16Y/K+S0Of+7a5gPYqVW/QZr9PZRDI6b7J3OHKzc3Sm4i3olZXRIM09pPj9YuHM0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894024; c=relaxed/simple;
	bh=iyUfAzCRuCKeEllfHdfuuouNvTepXwj9AAJcFo0E+dw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5z34y31E/RpVcexlLD60s3cs0V6M+gml7hzE5UCNlhBEtTKUWd6SFox7UvoMMV/mrYy1MhF2Cn6PxygpVe7ULZj11F5vIWfR8ZoAnHq642oF7RqRs6EolFLBRa6pdcTW0nZKk4EyXPjkGuMzRr5UxUr/SsJbPN5DT0lkPzyFeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BI9OJwES; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w0gabldW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=By1L2+jF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kh7di2gU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BI9OJwES";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w0gabldW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="By1L2+jF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kh7di2gU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0A2C5BCE4;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHoKsDV6svbnT2ELqgHZmIojMNuGddnSHkx5uavR2EQ=;
	b=BI9OJwESkpdMfnoWN5D64VrYcxQky2oV1afcj+Zjm23Bv1FONbkRaPbzPObgxr24R3HVVh
	xjPk6xJGRZdlWtMauZoZAwxSTxGXmuSGDzxPpu/ix8IOqehSm1JbpDt8/m1NARIJctmov0
	0XIe07wBcyACC4nI/j+V7q7NlD142RU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHoKsDV6svbnT2ELqgHZmIojMNuGddnSHkx5uavR2EQ=;
	b=w0gabldWTEuKnSEFr28VCk3QiKbUOB9QbDQdFSSV58SBjayZKdzSmae3S5dDZi1GDmCVuq
	XBs9rwmyxmqyMyAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=By1L2+jF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Kh7di2gU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHoKsDV6svbnT2ELqgHZmIojMNuGddnSHkx5uavR2EQ=;
	b=By1L2+jFnNmAsiPFGn3tLl6IeocNeBszluzbagCRlSOlXTF2MdZvhgVfpXf2csDQCO1zYZ
	c1e8UaI6QGtnZBz5DlYHlsEn5ofSYE14pd8YkOsXxMABeJt+7S2n9upDlt6gL32ms2m/1v
	TDGP5Jazul9gGX/n9oA2REa0qg6QtQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHoKsDV6svbnT2ELqgHZmIojMNuGddnSHkx5uavR2EQ=;
	b=Kh7di2gUyXLtI0QdQ4aW4/IUp/tJzqQRoAeS6gs31KGlLVu9fgUXSJTLljzMH/7kt+tahr
	jhQWWSrF3HMvqTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B07923EA67;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sLl6KnJnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/11] ALSA: oss: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:26 +0100
Message-ID: <20251216140634.171890-5-tiwai@suse.de>
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
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: C0A2C5BCE4
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

Fixes: a55bc334d3df ("ALSA: pcm_oss: ump: Use automatic cleanup of kfree()")
Fixes: 6c40eec521af ("ALSA: mixer_oss: ump: Use automatic cleanup of kfree()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c | 64 ++++++++++++++++++++------------------
 sound/core/oss/pcm_oss.c   | 19 ++++++-----
 2 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index e839a4bb93f8..69422ab2d808 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -517,8 +517,6 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 					  unsigned int numid,
 					  int *left, int *right)
 {
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 
@@ -528,8 +526,11 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
-	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return;
 	if (kctl->info(kctl, uinfo))
@@ -550,8 +551,6 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 					 int *left, int *right,
 					 int route)
 {
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 
@@ -561,8 +560,11 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
-	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return;
 	if (kctl->info(kctl, uinfo))
@@ -609,8 +611,6 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 					  unsigned int numid,
 					  int left, int right)
 {
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 	int res;
@@ -621,8 +621,11 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
-	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return;
 	if (kctl->info(kctl, uinfo))
@@ -646,8 +649,6 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 					 int left, int right,
 					 int route)
 {
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = fmixer->card;
 	int res;
@@ -658,8 +659,11 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
-	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return;
 	if (kctl->info(kctl, uinfo))
@@ -783,12 +787,12 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	struct snd_kcontrol *kctl;
 	struct snd_mixer_oss_slot *pslot;
 	struct slot *slot;
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int err, idx;
 	
-	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
 	guard(rwsem_read)(&card->controls_rwsem);
@@ -825,13 +829,13 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	struct snd_kcontrol *kctl;
 	struct snd_mixer_oss_slot *pslot;
 	struct slot *slot = NULL;
-	struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int err;
 	unsigned int idx;
 
-	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+	struct snd_ctl_elem_info *uinfo __free(kfree) =
+		kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
 	guard(rwsem_read)(&card->controls_rwsem);
@@ -872,18 +876,18 @@ struct snd_mixer_oss_assign_table {
 
 static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *slot, const char *name, int index, int item)
 {
-	struct snd_ctl_elem_info *info __free(kfree) = NULL;
 	struct snd_kcontrol *kcontrol;
 	struct snd_card *card = mixer->card;
 	int err;
 
+	struct snd_ctl_elem_info *info __free(kfree) =
+		kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
 	scoped_guard(rwsem_read, &card->controls_rwsem) {
 		kcontrol = snd_mixer_oss_test_id(mixer, name, index);
 		if (kcontrol == NULL)
 			return 0;
-		info = kmalloc(sizeof(*info), GFP_KERNEL);
-		if (!info)
-			return -ENOMEM;
 		err = kcontrol->info(kcontrol, info);
 		if (err < 0)
 			return err;
@@ -1006,9 +1010,9 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	if (!ptr->index)
 		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (kctl) {
-		struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
+		struct snd_ctl_elem_info *uinfo __free(kfree) =
+			kzalloc(sizeof(*uinfo), GFP_KERNEL);
 
-		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 		if (!uinfo)
 			return -ENOMEM;
 			
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index a82dd155e1d3..1dffa8fdf429 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -377,7 +377,6 @@ static int snd_pcm_hw_param_near(struct snd_pcm_substream *pcm,
 				 snd_pcm_hw_param_t var, unsigned int best,
 				 int *dir)
 {
-	struct snd_pcm_hw_params *save __free(kfree) = NULL;
 	int v;
 	unsigned int saved_min;
 	int last = 0;
@@ -397,19 +396,22 @@ static int snd_pcm_hw_param_near(struct snd_pcm_substream *pcm,
 		maxdir = 1;
 		max--;
 	}
-	save = kmalloc(sizeof(*save), GFP_KERNEL);
+
+	struct snd_pcm_hw_params *save __free(kfree) =
+		kmalloc(sizeof(*save), GFP_KERNEL);
 	if (save == NULL)
 		return -ENOMEM;
 	*save = *params;
 	saved_min = min;
 	min = snd_pcm_hw_param_min(pcm, params, var, min, &mindir);
 	if (min >= 0) {
-		struct snd_pcm_hw_params *params1 __free(kfree) = NULL;
 		if (max < 0)
 			goto _end;
 		if ((unsigned int)min == saved_min && mindir == valdir)
 			goto _end;
-		params1 = kmalloc(sizeof(*params1), GFP_KERNEL);
+
+		struct snd_pcm_hw_params *params1 __free(kfree) =
+			kmalloc(sizeof(*params1), GFP_KERNEL);
 		if (params1 == NULL)
 			return -ENOMEM;
 		*params1 = *save;
@@ -781,10 +783,10 @@ static int choose_rate(struct snd_pcm_substream *substream,
 		       struct snd_pcm_hw_params *params, unsigned int best_rate)
 {
 	const struct snd_interval *it;
-	struct snd_pcm_hw_params *save __free(kfree) = NULL;
 	unsigned int rate, prev;
 
-	save = kmalloc(sizeof(*save), GFP_KERNEL);
+	struct snd_pcm_hw_params *save __free(kfree) =
+		kmalloc(sizeof(*save), GFP_KERNEL);
 	if (save == NULL)
 		return -ENOMEM;
 	*save = *params;
@@ -1834,7 +1836,6 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 	struct snd_pcm_substream *substream;
 	int err;
 	int direct;
-	struct snd_pcm_hw_params *params __free(kfree) = NULL;
 	unsigned int formats = 0;
 	const struct snd_mask *format_mask;
 	int fmt;
@@ -1854,7 +1855,9 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 			AFMT_S32_LE | AFMT_S32_BE |
 			AFMT_S24_LE | AFMT_S24_BE |
 			AFMT_S24_PACKED;
-	params = kmalloc(sizeof(*params), GFP_KERNEL);
+
+	struct snd_pcm_hw_params *params __free(kfree) =
+		kmalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 	_snd_pcm_hw_params_any(params);
-- 
2.52.0

