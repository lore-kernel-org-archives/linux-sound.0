Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885AD3FE4C
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=FU1ZlJwBToAX77IRnYvAhgNL9AiFKREvtK9ISaS8we57WS1d1QqpWJ48kFaP+v/olM80xZfER76UrBg71f5NHcPh/rU2ViFQmwrMUaDYOcYTomG/f2K0lKs+AsEDM+MU1MhTTyNo+5N7t0WYEN3+Wc2OuprdnzwJ7aksDA1/bB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=eEsfvgR11hXesOnSN73f4bl5No5YoTYaeMw4skLftfk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hotHH729Ab36rvH4sa4AtKa/isIMxShppD7y+wY3B+Mxuc+0iTH9MoweXXd1RA4z6kdRRJSmbTrnCaJg/BAW6kG2dki6JWFpwJ0NzwcGjfin7cDfATGn1fLqDN1SKsw6Tn/ZupiPp7dyQbXe3lLymBwQLXFMsvvS5Do69EInjlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zi/NloY5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4IPCP0gt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zi/NloY5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4IPCP0gt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zi/NloY5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4IPCP0gt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zi/NloY5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4IPCP0gt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBFC0222CA;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZPdEp6SgTJuBzvP47V+xy+mOak/0C4X+K25HnOfgCU=;
	b=zi/NloY5yRsFoc0i79/WsbUfUCPpjMey/4NmqZ2uOZR994//paIkbbOhe9GVOSRWItNXvH
	b9kcEidUPExonTZ86UmplJX+Z9K+DSU1GiSTQhfMTD7UAAJIf3xkangvjX50xYJs6Cn1I2
	65CvSfff/uTrb9ln1GbFpqBwUm8Pdbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZPdEp6SgTJuBzvP47V+xy+mOak/0C4X+K25HnOfgCU=;
	b=4IPCP0gtiKULTWMGl/JLygz01ill1CNxNncPfN2jNiMdAjzC7qKdFPiC5mzgDWqPy/LFyU
	SsV1ocD5hzDOdUCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZPdEp6SgTJuBzvP47V+xy+mOak/0C4X+K25HnOfgCU=;
	b=zi/NloY5yRsFoc0i79/WsbUfUCPpjMey/4NmqZ2uOZR994//paIkbbOhe9GVOSRWItNXvH
	b9kcEidUPExonTZ86UmplJX+Z9K+DSU1GiSTQhfMTD7UAAJIf3xkangvjX50xYJs6Cn1I2
	65CvSfff/uTrb9ln1GbFpqBwUm8Pdbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZPdEp6SgTJuBzvP47V+xy+mOak/0C4X+K25HnOfgCU=;
	b=4IPCP0gtiKULTWMGl/JLygz01ill1CNxNncPfN2jNiMdAjzC7qKdFPiC5mzgDWqPy/LFyU
	SsV1ocD5hzDOdUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3BB713ADA;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +HTCKsMs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/9] ALSA: timer: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:04 +0100
Message-Id: <20240222111509.28390-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[10.67%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index e6e551d4a29e..a595c4fb4b2a 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1645,7 +1645,7 @@ static int snd_timer_user_next_device(struct snd_timer_id __user *_tid)
 static int snd_timer_user_ginfo(struct file *file,
 				struct snd_timer_ginfo __user *_ginfo)
 {
-	struct snd_timer_ginfo *ginfo;
+	struct snd_timer_ginfo *ginfo __free(kfree) = NULL;
 	struct snd_timer_id tid;
 	struct snd_timer *t;
 	struct list_head *p;
@@ -1653,7 +1653,7 @@ static int snd_timer_user_ginfo(struct file *file,
 
 	ginfo = memdup_user(_ginfo, sizeof(*ginfo));
 	if (IS_ERR(ginfo))
-		return PTR_ERR(ginfo);
+		return PTR_ERR(no_free_ptr(ginfo));
 
 	tid = ginfo->tid;
 	memset(ginfo, 0, sizeof(*ginfo));
@@ -1682,7 +1682,6 @@ static int snd_timer_user_ginfo(struct file *file,
 	mutex_unlock(&register_mutex);
 	if (err >= 0 && copy_to_user(_ginfo, ginfo, sizeof(*ginfo)))
 		err = -EFAULT;
-	kfree(ginfo);
 	return err;
 }
 
@@ -1804,9 +1803,8 @@ static int snd_timer_user_info(struct file *file,
 			       struct snd_timer_info __user *_info)
 {
 	struct snd_timer_user *tu;
-	struct snd_timer_info *info;
+	struct snd_timer_info *info __free(kfree) = NULL;
 	struct snd_timer *t;
-	int err = 0;
 
 	tu = file->private_data;
 	if (!tu->timeri)
@@ -1827,9 +1825,8 @@ static int snd_timer_user_info(struct file *file,
 	info->resolution = snd_timer_hw_resolution(t);
 	spin_unlock_irq(&t->lock);
 	if (copy_to_user(_info, info, sizeof(*_info)))
-		err = -EFAULT;
-	kfree(info);
-	return err;
+		return -EFAULT;
+	return 0;
 }
 
 static int snd_timer_user_params(struct file *file,
-- 
2.35.3

