Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CB34D920
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894031; cv=none; b=H0syj0Jc2Fz6T+bqq14a1iehzQr3kehuragDIKRv6iLK9Xx8mALu59Tnt5AB6jMnSov5TJ2Yn85Hvzc+WKeGinBJ7NtyEj/FrGYrHVKhz2rJsACDVXg6KRQhw+rlZBacrlP1ZABZBiM5yGyC6BiVWlOe7F4zXtDvEPaFKQzZEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894031; c=relaxed/simple;
	bh=q+I2/OMpct0WTjYttdo+D5WIN1KYXsx+3hxdZSPX9fA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1cdip3erDdpt/b7wFooaF/PT2LDCv4hWGDTtBUL6zjURJHihf9kuF/lUqRK+Y+o8mhRCiGoB3XtzxnnpWEIq1YIuDWPq/rSMP2nWffPTSSXGr9VFAetLXf9o8YsAfNz2HqLsZpxMskmaimCEJVpvp7DWfOQQu7U2cWFfnmDhyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=STuMyfVt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o8ZDl2B2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GqsFY64P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=USr+CA64; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="STuMyfVt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o8ZDl2B2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GqsFY64P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="USr+CA64"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 925D35BCE1;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzZtSMw7UPM/stNt1kWj91NeKZ7JuefHBLR+d/j/uu4=;
	b=STuMyfVtJ03QUz9SQNFQbAQ/BpfzlFq0PHkT6ApQY9N00L/n9xX0bI/sjQp/lb7TOX3h42
	4rE+OyJ7Dz8gav5pf2kLCakvuu8Ns0kFLAiBwJRr5FrwPD5g0hQDMIXn7y4rebwHPqucrF
	a5SxOh1coW/tOoZpvMNLNafof/lvafY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzZtSMw7UPM/stNt1kWj91NeKZ7JuefHBLR+d/j/uu4=;
	b=o8ZDl2B2ELNdANRI8KsNAZDUfl3Y6cWE0A1saICrtWBk1RRhjpSb4HosKjakkWAXCKrUpy
	2gc1BEdL/gjJCeDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GqsFY64P;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=USr+CA64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzZtSMw7UPM/stNt1kWj91NeKZ7JuefHBLR+d/j/uu4=;
	b=GqsFY64Pl8UovM3Y7XKZl8i3VPH07LjP4c6fSdbIS/FMSI3kBc8QBcm7W3dnnV2os9zhSw
	F+cRwKCi/IcnsWTO0co30RNf7DDz7TUCep1HCn235B9ilbKbvSvazIYNPVsdgcvoci9N/3
	E/LXyDnyIultFmwQ9brNO7zreLgtvc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzZtSMw7UPM/stNt1kWj91NeKZ7JuefHBLR+d/j/uu4=;
	b=USr+CA64snCmCfG1O6oi1LHP44RVoIiHunMGCvN8EgV2Wd7Oly5nps+Zpjml9QBKIGC4x+
	rrfv6/CQEP5sUnAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 842C53EA65;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MGPAH3JnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/11] ALSA: compress_offload: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:23 +0100
Message-ID: <20251216140634.171890-2-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 925D35BCE1
X-Spam-Flag: NO
X-Spam-Score: -3.01

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment.

Fixes: 9b02221422a5 ("ALSA: compress_offload: Use automatic cleanup of kfree()")
Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index da514fef45bc..ed2eeb914c6d 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -514,12 +514,12 @@ static int
 snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
 {
 	int retval;
-	struct snd_compr_codec_caps *caps __free(kfree) = NULL;
 
 	if (!stream->ops->get_codec_caps)
 		return -ENXIO;
 
-	caps = kzalloc(sizeof(*caps), GFP_KERNEL);
+	struct snd_compr_codec_caps *caps __free(kfree) =
+		kzalloc(sizeof(*caps), GFP_KERNEL);
 	if (!caps)
 		return -ENOMEM;
 
@@ -647,7 +647,6 @@ snd_compress_check_input(struct snd_compr_stream *stream, struct snd_compr_param
 static int
 snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_compr_params *params __free(kfree) = NULL;
 	int retval;
 
 	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
@@ -655,7 +654,9 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
 		 */
-		params = memdup_user((void __user *)arg, sizeof(*params));
+		struct snd_compr_params *params __free(kfree) =
+			memdup_user((void __user *)arg, sizeof(*params));
+
 		if (IS_ERR(params))
 			return PTR_ERR(params);
 
@@ -687,13 +688,13 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 static int
 snd_compr_get_params(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_codec *params __free(kfree) = NULL;
 	int retval;
 
 	if (!stream->ops->get_params)
 		return -EBADFD;
 
-	params = kzalloc(sizeof(*params), GFP_KERNEL);
+	struct snd_codec *params __free(kfree) =
+		kzalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 	retval = stream->ops->get_params(stream, params);
@@ -1104,12 +1105,13 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 
 static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_compr_task *task __free(kfree) = NULL;
 	int retval;
 
 	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
 		return -EPERM;
-	task = memdup_user((void __user *)arg, sizeof(*task));
+
+	struct snd_compr_task *task __free(kfree) =
+		memdup_user((void __user *)arg, sizeof(*task));
 	if (IS_ERR(task))
 		return PTR_ERR(task);
 	retval = snd_compr_task_new(stream, task);
@@ -1165,12 +1167,13 @@ static int snd_compr_task_start(struct snd_compr_stream *stream, struct snd_comp
 
 static int snd_compr_task_start_ioctl(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_compr_task *task __free(kfree) = NULL;
 	int retval;
 
 	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
 		return -EPERM;
-	task = memdup_user((void __user *)arg, sizeof(*task));
+
+	struct snd_compr_task *task __free(kfree) =
+		memdup_user((void __user *)arg, sizeof(*task));
 	if (IS_ERR(task))
 		return PTR_ERR(task);
 	retval = snd_compr_task_start(stream, task);
@@ -1256,12 +1259,13 @@ static int snd_compr_task_status(struct snd_compr_stream *stream,
 
 static int snd_compr_task_status_ioctl(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_compr_task_status *status __free(kfree) = NULL;
 	int retval;
 
 	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
 		return -EPERM;
-	status = memdup_user((void __user *)arg, sizeof(*status));
+
+	struct snd_compr_task_status *status __free(kfree) =
+		memdup_user((void __user *)arg, sizeof(*status));
 	if (IS_ERR(status))
 		return PTR_ERR(status);
 	retval = snd_compr_task_status(stream, status);
-- 
2.52.0

