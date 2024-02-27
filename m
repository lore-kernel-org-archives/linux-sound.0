Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A212FF61
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023998; cv=none; b=uaxHSnQ74RMWZUVy5uq8Ixsj9SKBKItRvKCHQBUSUeEcehosNF6sjlGkaCj7uusFEFfU8uTiq7XC7zIBFs/G0MWqJa2dSJbS02CBxMb+U1u8O3RozCN0q/4ooIEjU9UQ25aVeCFJ0VeqY+MdmBpqrrnFEjvmxyNOZ/grkn43/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023998; c=relaxed/simple;
	bh=4qiZ3aChjpIganT4gpxH5A7mhq0EZHR7csH6DX6VGp0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ushT04Ogcy3C6GSf8luSvy+4RLZ70qGgFEVsTdztnlhdS+BhhH75K08U3S+mKVV13iI9MotPTAESsvfptP1atacPS88SyY8I/fBvpu9kq8pcO0b/g7GHfjKSY8ZZDlKSh/lUU+sj8mKwVWCu/MDKrPYXj+hHfeADB6YxLDz2Cak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jvKctxOA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bDmiM9kn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jvKctxOA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bDmiM9kn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jvKctxOA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDmiM9kn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jvKctxOA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDmiM9kn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBD951FB9B;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=jvKctxOA8ueivFzprDbWFKINnv4Lzrl37R5rMyVgDYU1ChAkfvLFok45EBjupwXnX/mpM6
	LDH69vJLWWe3zqknkP6E9X2w/NoIzUZBNasHvPl+xEnSvPrdhvi4dk4TBVcZUI/bc4Aq+6
	xI1nMLIdnXCdwalNue5D0RH2vsTb/N4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=bDmiM9knteA/6Q9ya3Lby7wRQL1bwCKRUjK7UPXE+xPLl2eS+WMJJYsn4p8q/K8PNYVrZj
	NwkG/+7OHcrSLpCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=jvKctxOA8ueivFzprDbWFKINnv4Lzrl37R5rMyVgDYU1ChAkfvLFok45EBjupwXnX/mpM6
	LDH69vJLWWe3zqknkP6E9X2w/NoIzUZBNasHvPl+xEnSvPrdhvi4dk4TBVcZUI/bc4Aq+6
	xI1nMLIdnXCdwalNue5D0RH2vsTb/N4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=bDmiM9knteA/6Q9ya3Lby7wRQL1bwCKRUjK7UPXE+xPLl2eS+WMJJYsn4p8q/K8PNYVrZj
	NwkG/+7OHcrSLpCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A158613A58;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UCExJvqi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 04/24] ALSA: hrtimer: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:46 +0100
Message-Id: <20240227085306.9764-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jvKctxOA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bDmiM9kn
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
	 BAYES_HAM(-0.00)[24.12%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: BBD951FB9B
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/hrtimer.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index e97ff8cccb64..147c1fea4708 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -35,12 +35,12 @@ static enum hrtimer_restart snd_hrtimer_callback(struct hrtimer *hrt)
 	unsigned long ticks;
 	enum hrtimer_restart ret = HRTIMER_NORESTART;
 
-	spin_lock(&t->lock);
-	if (!t->running)
-		goto out; /* fast path */
-	stime->in_callback = true;
-	ticks = t->sticks;
-	spin_unlock(&t->lock);
+	scoped_guard(spinlock, &t->lock) {
+		if (!t->running)
+			return HRTIMER_NORESTART; /* fast path */
+		stime->in_callback = true;
+		ticks = t->sticks;
+	}
 
 	/* calculate the drift */
 	delta = ktime_sub(hrt->base->get_time(), hrtimer_get_expires(hrt));
@@ -49,15 +49,13 @@ static enum hrtimer_restart snd_hrtimer_callback(struct hrtimer *hrt)
 
 	snd_timer_interrupt(stime->timer, ticks);
 
-	spin_lock(&t->lock);
+	guard(spinlock)(&t->lock);
 	if (t->running) {
 		hrtimer_add_expires_ns(hrt, t->sticks * resolution);
 		ret = HRTIMER_RESTART;
 	}
 
 	stime->in_callback = false;
- out:
-	spin_unlock(&t->lock);
 	return ret;
 }
 
@@ -80,10 +78,10 @@ static int snd_hrtimer_close(struct snd_timer *t)
 	struct snd_hrtimer *stime = t->private_data;
 
 	if (stime) {
-		spin_lock_irq(&t->lock);
-		t->running = 0; /* just to be sure */
-		stime->in_callback = 1; /* skip start/stop */
-		spin_unlock_irq(&t->lock);
+		scoped_guard(spinlock_irq, &t->lock) {
+			t->running = 0; /* just to be sure */
+			stime->in_callback = 1; /* skip start/stop */
+		}
 
 		hrtimer_cancel(&stime->hrt);
 		kfree(stime);
-- 
2.35.3

