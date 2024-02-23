Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13BE84A34
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705702; cv=none; b=k91upnxYevrM8CAIzStRGHI+xtUHBcXvyZytsZDWI4h1EUSnAdnx5ZhNEGUel4sOOjaMzbRGk/RTeqbreaV4u84qv536Npx2ctkNpZRgxELAz6cFLgzHIm45BjetqfmQEVBn0tYdLMKSYPBL2GPbRehhIZVOYIJtryzdX60Mr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705702; c=relaxed/simple;
	bh=4qiZ3aChjpIganT4gpxH5A7mhq0EZHR7csH6DX6VGp0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C/BdX/UcNiNdnJVmDvTvl3yVzjPv7nkROtvj2ibw7mZvOVwnQ1+nOO/pdM0n4RmGH/oHNrh+roEg3XMieDlVUDmY47WWSNjrVkDq2w2yJOrFmIEHUf+JkDpoHDK2drygf94rWMLNQ3Qqed3WjzD/xRWgcKpJNgWeub3s5Vlpqsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wxgdngTw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lTokLWOV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dVivJu0i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CnFXfUU+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wxgdngTw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lTokLWOV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dVivJu0i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CnFXfUU+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ECA361FC9E;
	Fri, 23 Feb 2024 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=wxgdngTwdSTZdW5u0K0XWzm+H5MklzfEJxEIEyGH3mkz6VEWZXknblRHMZ9tMXiukS9pI+
	N0aaDinvbjJJ2wO+1XZy8VeHmVfpfn8wlhHGBhyw9JkpKw0udIXFigazChjarSz7Az5KpA
	1986/couoJQMMQnzECdhEocCVrZ0spU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=lTokLWOVDum0bVGGjJzw8ChaPQOuwbe2utIcCKLh75TOtDGIJcmdZRn83WQLDfSCLIHno5
	LL1oN7te2WrcD8CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=dVivJu0iJ2ZNN/GotUNyjLQYAcKeVYitDyBY2OoiriDTRnBI+rzB/cPmS8LhhGkztHjjhU
	fb2M/yLUWt3sgd6hRMGlqtx5AsEFlenLD8PFS+f8CKrPH7aoBglFdPTVgzLUS7/lJr54zm
	mHvkQpt5EGZQXNBR9s3RyyxTW65IdSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JKd70NXM7/GLMMt14WHoD2Qd8JM3D7yCJ4N+6i4Gg=;
	b=CnFXfUU+Ormw4OSAuB3Gf3Ai7XBj4etASDWr39s6OzAMLHCoghSrVPvyxPIxg5c6bau8lc
	AtqOklOxVska3JBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF8C413AC1;
	Fri, 23 Feb 2024 16:28:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AClfMaLH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/24] ALSA: hrtimer: Use guard() for locking
Date: Fri, 23 Feb 2024 17:27:50 +0100
Message-Id: <20240223162810.32302-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223162810.32302-1-tiwai@suse.de>
References: <20240223162810.32302-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
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
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

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

