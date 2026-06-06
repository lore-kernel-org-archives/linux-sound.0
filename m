Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6BE2DEA93
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762316; cv=none; b=O59+AhXPhtWcspJnvcfbQEGgePR353Oy5mq1aq4yqCk97JVfRZOUjM98lz/Ymy8bexksy2Wd9ooskPHFCSIWqQ4wMYudmSkejrWFVfKSjlw5bYy3Se9KnOCPYN2XnTAuc1FIEgYtj0VbU9EfKWkFKz86679mKY0jOrdtkxZYeTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762316; c=relaxed/simple;
	bh=AU2Jwz8Qzhm2CcXghrwnlG4HeNZ3O1lEx8dJe8Bi14g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXQVJXLJPhL5mZTiTvcRyI4WVGtd6L109I0j+IIlJktVDLoNC+dRIQfdc1MPeKGVZRBtaSJoDp1GePyKw+yb3W2AhuuIciKSuN9tV2O/smGWRsPleRYXIfeXNgPBvDFp0Twoe9Bpfbiur3G11QP3YI16PFqjo1/RnFjXgpekWz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DVtIvWRR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lyI+K1T/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DVtIvWRR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lyI+K1T/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DVtIvWRR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lyI+K1T/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DVtIvWRR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lyI+K1T/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C3BB6862B;
	Sat,  6 Jun 2026 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R9NVcGZ72H5aS8Mi5qpPfwoXoPI86u/BJ1znTZ1dGfw=;
	b=DVtIvWRRbSvzFV3xHp6aJ+dmsYMm7XJuO3wIKqSMD0YlopREEqZnajMvxOZLayRHs2Q3Ur
	ySDkO6Ss99abp4t0n4mPAq2vxBHAVtiFLLvBENDYq3E3x9gx5FV08pMO3L8htwRIRo25dS
	gm9gigrBSwn2h3gKFClCQtrFIvnuubw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R9NVcGZ72H5aS8Mi5qpPfwoXoPI86u/BJ1znTZ1dGfw=;
	b=lyI+K1T/fXbFO2Hq7Mtn30kg8pDttqrSmlOt6TDMKoMI3mQ3nc9u4vkIWMbghAV61XSxM2
	20f0tcVTW1E/T/Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DVtIvWRR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lyI+K1T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R9NVcGZ72H5aS8Mi5qpPfwoXoPI86u/BJ1znTZ1dGfw=;
	b=DVtIvWRRbSvzFV3xHp6aJ+dmsYMm7XJuO3wIKqSMD0YlopREEqZnajMvxOZLayRHs2Q3Ur
	ySDkO6Ss99abp4t0n4mPAq2vxBHAVtiFLLvBENDYq3E3x9gx5FV08pMO3L8htwRIRo25dS
	gm9gigrBSwn2h3gKFClCQtrFIvnuubw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R9NVcGZ72H5aS8Mi5qpPfwoXoPI86u/BJ1znTZ1dGfw=;
	b=lyI+K1T/fXbFO2Hq7Mtn30kg8pDttqrSmlOt6TDMKoMI3mQ3nc9u4vkIWMbghAV61XSxM2
	20f0tcVTW1E/T/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDB1D779A7;
	Sat,  6 Jun 2026 16:11:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3hYDMcJGJGpbbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jun 2026 16:11:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: timer: Forcibly close timer instances at closing
Date: Sat,  6 Jun 2026 18:11:40 +0200
Message-ID: <20260606161145.1933447-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0C3BB6862B
X-Spam-Score: -3.01

When snd_timer object is freed via snd_timer_free() and still pending
snd_timer_instance objects are assigned to the timer object, it tries
to unlink all instances and just set NULL to each ti->timer, then
releases the resources immediately.  The problem is, however, when
there are slave timer instances that are associated with a master
instance linked to this timer: namely, those slave instances still
point to the freed timer object although the master instance is
unlinked, which may lead to user-after-free.  The bug can be easily
triggered particularly when a new userspace-driven timers
(CONFIG_SND_UTIMER) is involved, since it can create and delete the
timer object via a simple file open/close, while the other
applications may keep accessing to that timer.

This patch is an attempt to paper over the problem above: now instead
of just unlinking, call snd_timer_close[_locked]() forcibly for each
pending timer instance, so that all assigned slave timer instances are
properly detached, too.  Since snd_timer_close() might be called later
by the driver that created that instance, the check of
SNDRV_TIMER_IFLG_DEAD is added at the beginning, too.

Reported-by: Kyle Zeng <kylebot@openai.com>
Tested-by: Kyle Zeng <kylebot@openai.com>
Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven timers")
Cc: stable@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 57583dec3974..67fb1ecb33f0 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -430,6 +430,8 @@ static void snd_timer_close_locked(struct snd_timer_instance *timeri,
 
 	if (timer) {
 		guard(spinlock_irq)(&timer->lock);
+		if (timeri->flags & SNDRV_TIMER_IFLG_DEAD)
+			return; /* already closed */
 		timeri->flags |= SNDRV_TIMER_IFLG_DEAD;
 	}
 
@@ -975,18 +977,18 @@ EXPORT_SYMBOL(snd_timer_new);
 
 static int snd_timer_free(struct snd_timer *timer)
 {
+	struct snd_timer_instance *ti, *n;
+
 	if (!timer)
 		return 0;
 
 	guard(mutex)(&register_mutex);
 	if (! list_empty(&timer->open_list_head)) {
-		struct list_head *p, *n;
-		struct snd_timer_instance *ti;
-		pr_warn("ALSA: timer %p is busy?\n", timer);
-		list_for_each_safe(p, n, &timer->open_list_head) {
-			list_del_init(p);
-			ti = list_entry(p, struct snd_timer_instance, open_list);
-			ti->timer = NULL;
+		list_for_each_entry_safe(ti, n, &timer->open_list_head, open_list) {
+			struct device *card_dev_to_put = NULL;
+
+			snd_timer_close_locked(ti, &card_dev_to_put);
+			put_device(card_dev_to_put);
 		}
 	}
 	list_del(&timer->device_list);
-- 
2.54.0

