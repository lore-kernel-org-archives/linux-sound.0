Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1F3C73D7
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555652; cv=none; b=ELSLi6dIoOB18vS8kPisH6WESna+CHswC2+RaGJ1fzdhuX5TSSFID+L5CnC+UxpUZQ77RRbDFvmiJKCAHquCCXqmXIvzNBYUXOw0R7VfxtmkJycghHZ1SMNikRrFQ0ew5AvV9INWmD3EhJvjonWb/zfx1N+y9YYN3PabU/5MRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555652; c=relaxed/simple;
	bh=BnPHvbdLR+KK/clJ6eTNjKjFOiu/0M9EJtxFUfESucs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jb6wUaSB+HgDpOSfsfqMYCXpV6ozgB6v9MtwONfv4LDE8dMsqd5qAzFUCWqR+isClgb2FlyPi8LFj1w1SjiJHsgVQtVvv7iSOdKeVz70JajjHTBkTWZw2R65nu30/Il/MtTeSYS/9YLlME9YOq0gwasWwVcRZzaPUpHczk8GgT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sUrerCgw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U8ri74AN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sUrerCgw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U8ri74AN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sUrerCgw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U8ri74AN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sUrerCgw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U8ri74AN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E290579FA8;
	Mon, 20 Jul 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oT6wM0Z5RqQGdb//l1PG30oj+xsYg7TUcqiShGqM594=;
	b=sUrerCgwjS8csW0wuRJt99xKeqG9pzri8K6YYBKbMo45wsnpAawgwnyhqLvIOTSH3zLFzR
	pRTP+FDN3iBJo/QxMtEWT6g6tzhn8dc73hJN+TE/pe1iRmEy+Pah+Dt8ch0hV8AUDg5Flf
	R7PA2sjJqsRtnQAcjG2wjZ1Tv4jkxbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oT6wM0Z5RqQGdb//l1PG30oj+xsYg7TUcqiShGqM594=;
	b=U8ri74ANTsniqYI74AwQBGvjO6ZoxHcRF6PzZiamD00nF8qOS2kGrIE89aWSUFr3okUR80
	imGzgeAdDINTVSCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oT6wM0Z5RqQGdb//l1PG30oj+xsYg7TUcqiShGqM594=;
	b=sUrerCgwjS8csW0wuRJt99xKeqG9pzri8K6YYBKbMo45wsnpAawgwnyhqLvIOTSH3zLFzR
	pRTP+FDN3iBJo/QxMtEWT6g6tzhn8dc73hJN+TE/pe1iRmEy+Pah+Dt8ch0hV8AUDg5Flf
	R7PA2sjJqsRtnQAcjG2wjZ1Tv4jkxbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oT6wM0Z5RqQGdb//l1PG30oj+xsYg7TUcqiShGqM594=;
	b=U8ri74ANTsniqYI74AwQBGvjO6ZoxHcRF6PzZiamD00nF8qOS2kGrIE89aWSUFr3okUR80
	imGzgeAdDINTVSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C39DB779AB;
	Mon, 20 Jul 2026 13:54:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8PSHLnkoXmr8KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 13:54:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ALSA: dummy: Use the standard PCM sync_stop callback for hrtimer
Date: Mon, 20 Jul 2026 15:53:52 +0200
Message-ID: <20260720135356.1779857-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720135356.1779857-1-tiwai@suse.de>
References: <20260720135356.1779857-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

The hrtimer backend code in ALSA dummy driver calls explicitly the
synchronization of hrtimer cancel from prepare and free callbacks, and
this is exactly what the standard PCM sync_stop callback serves for.

Replace the open-code with the standard PCM sync_stop callback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 7283f0f18813..ddd4da058693 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -100,6 +100,7 @@ struct dummy_timer_ops {
 	int (*prepare)(struct snd_pcm_substream *);
 	int (*start)(struct snd_pcm_substream *);
 	int (*stop)(struct snd_pcm_substream *);
+	int (*sync_stop)(struct snd_pcm_substream *);
 	snd_pcm_uframes_t (*pointer)(struct snd_pcm_substream *);
 };
 
@@ -407,9 +408,12 @@ static int dummy_hrtimer_stop(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static inline void dummy_hrtimer_sync(struct dummy_hrtimer_pcm *dpcm)
+static int dummy_hrtimer_sync_stop(struct snd_pcm_substream *substream)
 {
+	struct dummy_hrtimer_pcm *dpcm = substream->runtime->private_data;
+
 	hrtimer_cancel(&dpcm->timer);
+	return 0;
 }
 
 static snd_pcm_uframes_t
@@ -435,7 +439,6 @@ static int dummy_hrtimer_prepare(struct snd_pcm_substream *substream)
 	long sec;
 	unsigned long nsecs;
 
-	dummy_hrtimer_sync(dpcm);
 	period = runtime->period_size;
 	rate = runtime->rate;
 	sec = period / rate;
@@ -463,7 +466,7 @@ static int dummy_hrtimer_create(struct snd_pcm_substream *substream)
 static void dummy_hrtimer_free(struct snd_pcm_substream *substream)
 {
 	struct dummy_hrtimer_pcm *dpcm = substream->runtime->private_data;
-	dummy_hrtimer_sync(dpcm);
+
 	kfree(dpcm);
 }
 
@@ -473,6 +476,7 @@ static const struct dummy_timer_ops dummy_hrtimer_ops = {
 	.prepare =	dummy_hrtimer_prepare,
 	.start =	dummy_hrtimer_start,
 	.stop =		dummy_hrtimer_stop,
+	.sync_stop =	dummy_hrtimer_sync_stop,
 	.pointer =	dummy_hrtimer_pointer,
 };
 
@@ -495,6 +499,13 @@ static int dummy_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return -EINVAL;
 }
 
+static int dummy_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	if (get_dummy_ops(substream)->sync_stop)
+		return get_dummy_ops(substream)->sync_stop(substream);
+	return 0;
+}
+
 static int dummy_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	return get_dummy_ops(substream)->prepare(substream);
@@ -646,6 +657,7 @@ static const struct snd_pcm_ops dummy_pcm_ops = {
 	.hw_params =	dummy_pcm_hw_params,
 	.prepare =	dummy_pcm_prepare,
 	.trigger =	dummy_pcm_trigger,
+	.sync_stop =	dummy_pcm_sync_stop,
 	.pointer =	dummy_pcm_pointer,
 };
 
@@ -655,6 +667,7 @@ static const struct snd_pcm_ops dummy_pcm_ops_no_buf = {
 	.hw_params =	dummy_pcm_hw_params,
 	.prepare =	dummy_pcm_prepare,
 	.trigger =	dummy_pcm_trigger,
+	.sync_stop =	dummy_pcm_sync_stop,
 	.pointer =	dummy_pcm_pointer,
 	.copy =		dummy_pcm_copy,
 	.fill_silence =	dummy_pcm_silence,
-- 
2.55.0

