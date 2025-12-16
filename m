Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680B346ADD
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894006; cv=none; b=sz5KvqtFsPRWnev7h0jXuAXMr+2POijAtRmKdWhccmuZWSJekFY2/MA36BKcSaEDpaNDRndeXC4yfux6pn4m0hkYj7mpsvB5uF0KLp9z1TnzdTDsRiV66vxdSdEovx+WkNStA5TobhZ/UkW9YUF4YTES6MUL1Co9/CmG5DxcdYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894006; c=relaxed/simple;
	bh=8gcmcfLlxe+9S8hdMiQ2/wx0hlUIckXGtY0lQ/If0Mg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAB+f7vWW5l7Uva9d/cTxDeiH34N8czIirXHOu58r20jWXw3/u1NpgqtPeMjyNl7hCkcxH9lVa5uYV+PQQKBBD0H3xl51GSpVNwe5qQRRYzll7ZRW8bxpP7zRs93jcZMqSlcUDM5vVrcSEMzaH1wEq/1UV9Qpy7k3YZa1AOTC5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MU7VnFmx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4uOjijUf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MU7VnFmx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4uOjijUf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MU7VnFmx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4uOjijUf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MU7VnFmx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4uOjijUf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD75A5BCE3;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpH5SoRSNvjvohmu7Cvp8LK4Af2EIQ06l2bVs3N9i3U=;
	b=MU7VnFmxosaKulkf7FzQfdg++1BzUTlJistY9+p/ocYBh9lyhsZds8l9FSmH3j9XXJ5v1W
	xJRIjQlaTT5NJLSbFqODAsaE5tw1evIcewTaEm5QkKwIuv8xNNmk2sONHmMGw0SMIqJXXX
	YJPJlu21wvW1DMoplxttlQVSFvwpIcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpH5SoRSNvjvohmu7Cvp8LK4Af2EIQ06l2bVs3N9i3U=;
	b=4uOjijUf2LLm4bWdgL9oUsiKj+k8u08sG7z59KnzHYrdstwghqd5lY5OzaRWaYHKdPDxrL
	VXC0icFHjAmaVmCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpH5SoRSNvjvohmu7Cvp8LK4Af2EIQ06l2bVs3N9i3U=;
	b=MU7VnFmxosaKulkf7FzQfdg++1BzUTlJistY9+p/ocYBh9lyhsZds8l9FSmH3j9XXJ5v1W
	xJRIjQlaTT5NJLSbFqODAsaE5tw1evIcewTaEm5QkKwIuv8xNNmk2sONHmMGw0SMIqJXXX
	YJPJlu21wvW1DMoplxttlQVSFvwpIcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpH5SoRSNvjvohmu7Cvp8LK4Af2EIQ06l2bVs3N9i3U=;
	b=4uOjijUf2LLm4bWdgL9oUsiKj+k8u08sG7z59KnzHYrdstwghqd5lY5OzaRWaYHKdPDxrL
	VXC0icFHjAmaVmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1E273EA63;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oJP6JnJnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/11] ALSA: pcm: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:25 +0100
Message-ID: <20251216140634.171890-4-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -2.78
X-Spam-Level: 
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.900];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Fixes: ae9213984864 ("ALSA: pcm: Use automatic cleanup of kfree()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c        |  4 ++--
 sound/core/pcm_compat.c |  9 ++++----
 sound/core/pcm_native.c | 50 +++++++++++++++++++++--------------------
 3 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 283aac441fa0..0b512085eb63 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -328,13 +328,13 @@ static const char *snd_pcm_oss_format_name(int format)
 static void snd_pcm_proc_info_read(struct snd_pcm_substream *substream,
 				   struct snd_info_buffer *buffer)
 {
-	struct snd_pcm_info *info __free(kfree) = NULL;
 	int err;
 
 	if (! substream)
 		return;
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	struct snd_pcm_info *info __free(kfree) =
+		kmalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return;
 
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 54eb9bd8eb21..e86f68f1f23c 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -235,7 +235,6 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 					  int refine, 
 					  struct snd_pcm_hw_params32 __user *data32)
 {
-	struct snd_pcm_hw_params *data __free(kfree) = NULL;
 	struct snd_pcm_runtime *runtime;
 	int err;
 
@@ -243,7 +242,8 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 	if (!runtime)
 		return -ENOTTY;
 
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	struct snd_pcm_hw_params *data __free(kfree) =
+		kmalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -332,7 +332,6 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 	compat_caddr_t buf;
 	compat_caddr_t __user *bufptr;
 	u32 frames;
-	void __user **bufs __free(kfree) = NULL;
 	int err, ch, i;
 
 	if (! substream->runtime)
@@ -349,7 +348,9 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 	    get_user(frames, &data32->frames))
 		return -EFAULT;
 	bufptr = compat_ptr(buf);
-	bufs = kmalloc_array(ch, sizeof(void __user *), GFP_KERNEL);
+
+	void __user **bufs __free(kfree) =
+		kmalloc_array(ch, sizeof(void __user *), GFP_KERNEL);
 	if (bufs == NULL)
 		return -ENOMEM;
 	for (i = 0; i < ch; i++) {
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 68bee40c9ada..4352c0a40f8d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -242,10 +242,10 @@ int snd_pcm_info(struct snd_pcm_substream *substream, struct snd_pcm_info *info)
 int snd_pcm_info_user(struct snd_pcm_substream *substream,
 		      struct snd_pcm_info __user * _info)
 {
-	struct snd_pcm_info *info __free(kfree) = NULL;
 	int err;
+	struct snd_pcm_info *info __free(kfree) =
+		kmalloc(sizeof(*info), GFP_KERNEL);
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
 	if (! info)
 		return -ENOMEM;
 	err = snd_pcm_info(substream, info);
@@ -364,7 +364,6 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_constraints *constrs =
 					&substream->runtime->hw_constraints;
 	unsigned int k;
-	unsigned int *rstamps __free(kfree) = NULL;
 	unsigned int vstamps[SNDRV_PCM_HW_PARAM_LAST_INTERVAL + 1];
 	unsigned int stamp;
 	struct snd_pcm_hw_rule *r;
@@ -380,7 +379,8 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	 * Each member of 'rstamps' array represents the sequence number of
 	 * recent application of corresponding rule.
 	 */
-	rstamps = kcalloc(constrs->rules_num, sizeof(unsigned int), GFP_KERNEL);
+	unsigned int *rstamps __free(kfree) =
+		kcalloc(constrs->rules_num, sizeof(unsigned int), GFP_KERNEL);
 	if (!rstamps)
 		return -ENOMEM;
 
@@ -583,10 +583,10 @@ EXPORT_SYMBOL(snd_pcm_hw_refine);
 static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params __user * _params)
 {
-	struct snd_pcm_hw_params *params __free(kfree) = NULL;
 	int err;
+	struct snd_pcm_hw_params *params __free(kfree) =
+		memdup_user(_params, sizeof(*params));
 
-	params = memdup_user(_params, sizeof(*params));
 	if (IS_ERR(params))
 		return PTR_ERR(params);
 
@@ -884,10 +884,10 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 static int snd_pcm_hw_params_user(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params __user * _params)
 {
-	struct snd_pcm_hw_params *params __free(kfree) = NULL;
 	int err;
+	struct snd_pcm_hw_params *params __free(kfree) =
+		memdup_user(_params, sizeof(*params));
 
-	params = memdup_user(_params, sizeof(*params));
 	if (IS_ERR(params))
 		return PTR_ERR(params);
 
@@ -2262,7 +2262,6 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 {
 	struct snd_pcm_file *pcm_file;
 	struct snd_pcm_substream *substream1;
-	struct snd_pcm_group *group __free(kfree) = NULL;
 	struct snd_pcm_group *target_group;
 	bool nonatomic = substream->pcm->nonatomic;
 	CLASS(fd, f)(fd);
@@ -2278,7 +2277,8 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	if (substream == substream1)
 		return -EINVAL;
 
-	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	struct snd_pcm_group *group __free(kfree) =
+		kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group)
 		return -ENOMEM;
 	snd_pcm_group_init(group);
@@ -3286,7 +3286,6 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 {
 	struct snd_xfern xfern;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	void *bufs __free(kfree) = NULL;
 	snd_pcm_sframes_t result;
 
 	if (runtime->state == SNDRV_PCM_STATE_OPEN)
@@ -3298,7 +3297,8 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 	if (copy_from_user(&xfern, _xfern, sizeof(xfern)))
 		return -EFAULT;
 
-	bufs = memdup_array_user(xfern.bufs, runtime->channels, sizeof(void *));
+	void *bufs __free(kfree) =
+		memdup_array_user(xfern.bufs, runtime->channels, sizeof(void *));
 	if (IS_ERR(bufs))
 		return PTR_ERR(bufs);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -3572,7 +3572,6 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	struct snd_pcm_runtime *runtime;
 	snd_pcm_sframes_t result;
 	unsigned long i;
-	void __user **bufs __free(kfree) = NULL;
 	snd_pcm_uframes_t frames;
 	const struct iovec *iov = iter_iov(to);
 
@@ -3591,7 +3590,9 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (!frame_aligned(runtime, iov->iov_len))
 		return -EINVAL;
 	frames = bytes_to_samples(runtime, iov->iov_len);
-	bufs = kmalloc_array(to->nr_segs, sizeof(void *), GFP_KERNEL);
+
+	void __user **bufs __free(kfree) =
+		kmalloc_array(to->nr_segs, sizeof(void *), GFP_KERNEL);
 	if (bufs == NULL)
 		return -ENOMEM;
 	for (i = 0; i < to->nr_segs; ++i) {
@@ -3611,7 +3612,6 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	struct snd_pcm_runtime *runtime;
 	snd_pcm_sframes_t result;
 	unsigned long i;
-	void __user **bufs __free(kfree) = NULL;
 	snd_pcm_uframes_t frames;
 	const struct iovec *iov = iter_iov(from);
 
@@ -3629,7 +3629,9 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	    !frame_aligned(runtime, iov->iov_len))
 		return -EINVAL;
 	frames = bytes_to_samples(runtime, iov->iov_len);
-	bufs = kmalloc_array(from->nr_segs, sizeof(void *), GFP_KERNEL);
+
+	void __user **bufs __free(kfree) =
+		kmalloc_array(from->nr_segs, sizeof(void *), GFP_KERNEL);
 	if (bufs == NULL)
 		return -ENOMEM;
 	for (i = 0; i < from->nr_segs; ++i) {
@@ -4101,15 +4103,15 @@ static void snd_pcm_hw_convert_to_old_params(struct snd_pcm_hw_params_old *opara
 static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params_old __user * _oparams)
 {
-	struct snd_pcm_hw_params *params __free(kfree) = NULL;
-	struct snd_pcm_hw_params_old *oparams __free(kfree) = NULL;
 	int err;
 
-	params = kmalloc(sizeof(*params), GFP_KERNEL);
+	struct snd_pcm_hw_params *params __free(kfree) =
+		kmalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 
-	oparams = memdup_user(_oparams, sizeof(*oparams));
+	struct snd_pcm_hw_params_old *oparams __free(kfree) =
+		memdup_user(_oparams, sizeof(*oparams));
 	if (IS_ERR(oparams))
 		return PTR_ERR(oparams);
 	snd_pcm_hw_convert_from_old_params(params, oparams);
@@ -4130,15 +4132,15 @@ static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 static int snd_pcm_hw_params_old_user(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params_old __user * _oparams)
 {
-	struct snd_pcm_hw_params *params __free(kfree) = NULL;
-	struct snd_pcm_hw_params_old *oparams __free(kfree) = NULL;
 	int err;
 
-	params = kmalloc(sizeof(*params), GFP_KERNEL);
+	struct snd_pcm_hw_params *params __free(kfree) =
+		kmalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 
-	oparams = memdup_user(_oparams, sizeof(*oparams));
+	struct snd_pcm_hw_params_old *oparams __free(kfree) =
+		memdup_user(_oparams, sizeof(*oparams));
 	if (IS_ERR(oparams))
 		return PTR_ERR(oparams);
 
-- 
2.52.0

