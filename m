Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC653C00
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263526; cv=none; b=RD95H/8i25cQgkinAZgVf6A9OXnrkOkKR3Lj3h1amVUYh1l1J/ccFzif6vmriz6ThddLHxV316ZAW9lapKGo1FS+75POgMPsnJyVe7oFCP90qidGTS/yWrPhnqQZrWwVsyxTcuplSxwIr6N//Erm9E2PjM5qIl1ycvfkMehm+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263526; c=relaxed/simple;
	bh=7o5fzv34y4Nlu1j3XfxV35SSQnqcLmXCK51lR2oc+lc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sbcon0AhIQ98EBjWLDTH/JdNq1hMhXYVoCMn2+cwZIT31sVEOotdZc9cAGN9Cz23/lkXlXwSGL2EWM6JokOdJxNzC/WOosP7G8EKW84xD9VEocyDOKoZhWj5CLkPipMpae0v8o163a+vhsi+2ZCiLrAglUcuVwTJOwL5zgPHzbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MEDXrGaD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ImpzFpT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MEDXrGaD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ImpzFpT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MEDXrGaD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ImpzFpT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MEDXrGaD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ImpzFpT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DF0F21B14;
	Mon,  2 Sep 2024 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725263522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3SXVtHyavN0mjLkhTqkKRWbbHU/xTZsKzJnlUFQPdA=;
	b=MEDXrGaD9WiivDNwAcxdUmTtz0hbfyj/SrO+573GS/Yjo6mI+ijRGz9aERQaYbAHdUL/ec
	VJP5ky1soyxsF4LcL8xKtVQOd7uY4ycIk3hEQ7LRuljfYOdgiQWK9+K2uifjpOSRlNBVKx
	p3oZGCPowQThadwekWyx8r/bClwXqIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725263522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3SXVtHyavN0mjLkhTqkKRWbbHU/xTZsKzJnlUFQPdA=;
	b=2ImpzFpTRH1xvsZxbgBRkk80OhsEo3J8VxiXskthyGonscV0ZcjBtlYAq7rwX+g93jvZCL
	kBIUM/CpnCa9EcCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MEDXrGaD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2ImpzFpT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725263522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3SXVtHyavN0mjLkhTqkKRWbbHU/xTZsKzJnlUFQPdA=;
	b=MEDXrGaD9WiivDNwAcxdUmTtz0hbfyj/SrO+573GS/Yjo6mI+ijRGz9aERQaYbAHdUL/ec
	VJP5ky1soyxsF4LcL8xKtVQOd7uY4ycIk3hEQ7LRuljfYOdgiQWK9+K2uifjpOSRlNBVKx
	p3oZGCPowQThadwekWyx8r/bClwXqIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725263522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3SXVtHyavN0mjLkhTqkKRWbbHU/xTZsKzJnlUFQPdA=;
	b=2ImpzFpTRH1xvsZxbgBRkk80OhsEo3J8VxiXskthyGonscV0ZcjBtlYAq7rwX+g93jvZCL
	kBIUM/CpnCa9EcCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40EEF13AE5;
	Mon,  2 Sep 2024 07:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GWODDqJu1WZINQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Sep 2024 07:52:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: core: Drop superfluous no_free_ptr() for memdup_user() errors
Date: Mon,  2 Sep 2024 09:52:27 +0200
Message-ID: <20240902075246.3743-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DF0F21B14
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

We used to wrap with no_free_ptr() for the return value from
memdup_user() with errors where the auto cleanup is applied.  This was
a workaround because the initial implementation of kfree auto-cleanup
checked only NULL pointers.

Since recently, though, the kfree auto-cleanup checks with
IS_ERR_OR_NULL() (by the commit cd7eb8f83fcf ("mm/slab: make
__free(kfree) accept error pointers")), hence those workarounds became
superfluous.  Let's drop them now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c |  2 +-
 sound/core/control.c          |  4 ++--
 sound/core/pcm_native.c       | 10 +++++-----
 sound/core/timer.c            |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index f0008fa2d839..b8c0d6edbdd1 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -581,7 +581,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		 */
 		params = memdup_user((void __user *)arg, sizeof(*params));
 		if (IS_ERR(params))
-			return PTR_ERR(no_free_ptr(params));
+			return PTR_ERR(params);
 
 		retval = snd_compress_check_input(params);
 		if (retval)
diff --git a/sound/core/control.c b/sound/core/control.c
index 7d7d592a8428..4f55f64c42e1 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1249,7 +1249,7 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 
 	control = memdup_user(_control, sizeof(*control));
 	if (IS_ERR(control))
-		return PTR_ERR(no_free_ptr(control));
+		return PTR_ERR(control);
 
 	result = snd_power_ref_and_wait(card);
 	if (result)
@@ -1326,7 +1326,7 @@ static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 
 	control = memdup_user(_control, sizeof(*control));
 	if (IS_ERR(control))
-		return PTR_ERR(no_free_ptr(control));
+		return PTR_ERR(control);
 
 	card = file->card;
 	result = snd_power_ref_and_wait(card);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4057f9f10aee..44381514f695 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -582,7 +582,7 @@ static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
 
 	params = memdup_user(_params, sizeof(*params));
 	if (IS_ERR(params))
-		return PTR_ERR(no_free_ptr(params));
+		return PTR_ERR(params);
 
 	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
@@ -872,7 +872,7 @@ static int snd_pcm_hw_params_user(struct snd_pcm_substream *substream,
 
 	params = memdup_user(_params, sizeof(*params));
 	if (IS_ERR(params))
-		return PTR_ERR(no_free_ptr(params));
+		return PTR_ERR(params);
 
 	err = snd_pcm_hw_params(substream, params);
 	if (err < 0)
@@ -3243,7 +3243,7 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 
 	bufs = memdup_user(xfern.bufs, sizeof(void *) * runtime->channels);
 	if (IS_ERR(bufs))
-		return PTR_ERR(no_free_ptr(bufs));
+		return PTR_ERR(bufs);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		result = snd_pcm_lib_writev(substream, bufs, xfern.frames);
 	else
@@ -4032,7 +4032,7 @@ static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 
 	oparams = memdup_user(_oparams, sizeof(*oparams));
 	if (IS_ERR(oparams))
-		return PTR_ERR(no_free_ptr(oparams));
+		return PTR_ERR(oparams);
 	snd_pcm_hw_convert_from_old_params(params, oparams);
 	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
@@ -4061,7 +4061,7 @@ static int snd_pcm_hw_params_old_user(struct snd_pcm_substream *substream,
 
 	oparams = memdup_user(_oparams, sizeof(*oparams));
 	if (IS_ERR(oparams))
-		return PTR_ERR(no_free_ptr(oparams));
+		return PTR_ERR(oparams);
 
 	snd_pcm_hw_convert_from_old_params(params, oparams);
 	err = snd_pcm_hw_params(substream, params);
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 7610f102360d..1d13f6c1d506 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1615,7 +1615,7 @@ static int snd_timer_user_ginfo(struct file *file,
 
 	ginfo = memdup_user(_ginfo, sizeof(*ginfo));
 	if (IS_ERR(ginfo))
-		return PTR_ERR(no_free_ptr(ginfo));
+		return PTR_ERR(ginfo);
 
 	tid = ginfo->tid;
 	memset(ginfo, 0, sizeof(*ginfo));
@@ -2190,7 +2190,7 @@ static int snd_utimer_ioctl_create(struct file *file,
 
 	utimer_info = memdup_user(_utimer_info, sizeof(*utimer_info));
 	if (IS_ERR(utimer_info))
-		return PTR_ERR(no_free_ptr(utimer_info));
+		return PTR_ERR(utimer_info);
 
 	err = snd_utimer_create(utimer_info, &utimer);
 	if (err < 0)
-- 
2.43.0

