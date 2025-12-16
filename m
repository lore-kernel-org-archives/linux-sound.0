Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74F934A3A2
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894020; cv=none; b=CCMDeNrbhOKSvqwaa5UkW7yNx2Vt2zWTHN9bxlfbGnvnxW/bxwaxzWFD/1uezo6xYRy7Bi1E9Mb8k6MqPzBwfYO/P/AWDQ7xS4Z2nr2OAPrzfyiNd5mZrFvdWMyApc6ALbi/k9zlekIjjwlsaDbThSx+tCdAqQtjYH3//p/JTsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894020; c=relaxed/simple;
	bh=o/cRC9cDCndtPH+IkwbKor0uLGjP419PRgjcV5RitLI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1Safh8ocmP+poHjGNNM3xvyk6oBhn2JrIvv/V8dRJKS5mJ9LB3b6roZIr5r37LeDPIXtWyP5ERdGoSXZCnHUrhROFFAU1QZGrZM5gA57dHTUHfsW8XcFgb5iFb8rDMAiGzwGTbhYNWhLqdd405Jn+Lo2NDM1BMVY5vZzPRP56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FaZFH1jy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/TgpQbGp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=McMGcDUU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lQK2zOv1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FaZFH1jy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/TgpQbGp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="McMGcDUU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lQK2zOv1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F17B8336AD;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaNtBcI1pDakpeNT3HtiE+LN+ngJdhZ3Q7fUa0MPqLI=;
	b=FaZFH1jyxPn7E/rz2ehqrEsfdnk/SQ+Ca+7LZuvQhhUmCSkTnfz7v5um2eqtJuQDeKTn6w
	IMvIbOrzQRoWtOIbGzg/t1gQpiOn6oLtjisx+Cp0RN40TYR7dbCSDHL4BD0xzFcqtw7Gnd
	2KJq+74QTt17EAk6J/n7ivuBMAaWcQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaNtBcI1pDakpeNT3HtiE+LN+ngJdhZ3Q7fUa0MPqLI=;
	b=/TgpQbGpO+wjFeWrbDLcr30/ki/4g5DfIHfut4uyGi44EfO2acXBX56ez+SdhYAgyKYsak
	BG+HyCCkT1Ee73Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaNtBcI1pDakpeNT3HtiE+LN+ngJdhZ3Q7fUa0MPqLI=;
	b=McMGcDUUYvtS8CjguwcPmt7NklRdBYmpL5OfHLEfAu4JZZy1J2a16jiugszdm4wH6GPiAE
	QE1Of9lmtMNMqomMckJasvCAVHAmS8iCxEQqcPS17kkAYSz8mEwGbQL+MVODSB/TnVJ9my
	L2A9f20c57AZ4syqp92g6lidGEl4sh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaNtBcI1pDakpeNT3HtiE+LN+ngJdhZ3Q7fUa0MPqLI=;
	b=lQK2zOv1xba7jyqp1LmBp3O2D1sxqn/JFr8uFwbausN3tS08x1EpAK/xRNURoD2n5Mdec9
	ckifvIHH1LjVm5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E32263EA69;
	Tue, 16 Dec 2025 14:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIjoNnJnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/11] ALSA: timer: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:29 +0100
Message-ID: <20251216140634.171890-8-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.18)[-0.897];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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

Fixes: ed96f6394e1b ("ALSA: timer: Use automatic cleanup of kfree()")
Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven timers")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index d9fff5c87613..9a4a1748ff80 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1614,12 +1614,12 @@ static int snd_timer_user_next_device(struct snd_timer_id __user *_tid)
 static int snd_timer_user_ginfo(struct file *file,
 				struct snd_timer_ginfo __user *_ginfo)
 {
-	struct snd_timer_ginfo *ginfo __free(kfree) = NULL;
 	struct snd_timer_id tid;
 	struct snd_timer *t;
 	struct list_head *p;
+	struct snd_timer_ginfo *ginfo __free(kfree) =
+		memdup_user(_ginfo, sizeof(*ginfo));
 
-	ginfo = memdup_user(_ginfo, sizeof(*ginfo));
 	if (IS_ERR(ginfo))
 		return PTR_ERR(ginfo);
 
@@ -1756,7 +1756,6 @@ static int snd_timer_user_info(struct file *file,
 			       struct snd_timer_info __user *_info)
 {
 	struct snd_timer_user *tu;
-	struct snd_timer_info *info __free(kfree) = NULL;
 	struct snd_timer *t;
 
 	tu = file->private_data;
@@ -1766,7 +1765,8 @@ static int snd_timer_user_info(struct file *file,
 	if (!t)
 		return -EBADFD;
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	struct snd_timer_info *info __free(kfree) =
+		kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info)
 		return -ENOMEM;
 	info->card = t->card ? t->card->number : -1;
@@ -2192,10 +2192,10 @@ static int snd_utimer_ioctl_create(struct file *file,
 				   struct snd_timer_uinfo __user *_utimer_info)
 {
 	struct snd_utimer *utimer;
-	struct snd_timer_uinfo *utimer_info __free(kfree) = NULL;
 	int err, timer_fd;
+	struct snd_timer_uinfo *utimer_info __free(kfree) =
+		memdup_user(_utimer_info, sizeof(*utimer_info));
 
-	utimer_info = memdup_user(_utimer_info, sizeof(*utimer_info));
 	if (IS_ERR(utimer_info))
 		return PTR_ERR(utimer_info);
 
-- 
2.52.0

