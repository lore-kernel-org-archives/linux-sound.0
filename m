Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724262EAB72
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991352; cv=none; b=jlhnJCKQGITp9lxnCP8RdFaeBchdX5FFD0gR+3vt7insE18Ey3GpTX2LOpAMQo0yOjDBMIRCWFLJpCLu03L2MNvCMm5RwithIkIpbiQ8Xin2ZlvQ79Nw1gNhI+fWgKgkKRl5Iuiu2fnAm+z/WXgRW2hjjIqdo181dJgp2nakz3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991352; c=relaxed/simple;
	bh=QBXV6cZQNv95D2lWbdgLMFoS8bWvyQAvDV+K5cq3J68=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lWx3CdCFb/YHecPWh4BYG28Qmte4FbnOw2/xZFUTHU+ZutieqHpoBftWnwTFXJ5SiDvRgCItOHwGlKP+UgA/XMaFgOTBrK5GT4LGEV3Q4LLkWAl/ARQ4ujXOZjAatNfxNeF5ORG60ujhTlHdZ33kVz0QuCdTC16sZtPRogARgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FYb1lSRT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nkmk8Bzf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FYb1lSRT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nkmk8Bzf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FYb1lSRT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nkmk8Bzf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FYb1lSRT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nkmk8Bzf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 939BC6A906;
	Tue,  9 Jun 2026 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780991349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e+CDwCyh3JijRWO+GshpHjTflTGXqM4y3IUkdy3wlcw=;
	b=FYb1lSRTFzRegz8mYfiJJO2sa4iFxW9UzLI+V8QuBn5GYIPSa4v8qEci2C5O7OjzGTcpUv
	fVZf7qecqoVJEirEPWVYUUoCSLEw0Z9RieCgoB1Jax9PCtMwxpbR4hswkTg0WJtTy1luMe
	V2BTfZocJaFxguGQbGuZ3kgB/6EqGQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780991349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e+CDwCyh3JijRWO+GshpHjTflTGXqM4y3IUkdy3wlcw=;
	b=Nkmk8BzfKtWLtGyXJIJqls8iw4FkIn043y2EiW/uMEeaVhUr1ByOVMcRqw9h9+mtd9o7G6
	mp1//ceI1AuL/9BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780991349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e+CDwCyh3JijRWO+GshpHjTflTGXqM4y3IUkdy3wlcw=;
	b=FYb1lSRTFzRegz8mYfiJJO2sa4iFxW9UzLI+V8QuBn5GYIPSa4v8qEci2C5O7OjzGTcpUv
	fVZf7qecqoVJEirEPWVYUUoCSLEw0Z9RieCgoB1Jax9PCtMwxpbR4hswkTg0WJtTy1luMe
	V2BTfZocJaFxguGQbGuZ3kgB/6EqGQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780991349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e+CDwCyh3JijRWO+GshpHjTflTGXqM4y3IUkdy3wlcw=;
	b=Nkmk8BzfKtWLtGyXJIJqls8iw4FkIn043y2EiW/uMEeaVhUr1ByOVMcRqw9h9+mtd9o7G6
	mp1//ceI1AuL/9BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AFB6779A9;
	Tue,  9 Jun 2026 07:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pbb0GHXFJ2rYNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jun 2026 07:49:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: aloop: Drop superfluous break
Date: Tue,  9 Jun 2026 09:49:04 +0200
Message-ID: <20260609074907.726593-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

At converting the spinlock to guard(), a break statement was put in
the scoped_guard block in loopback_jiffies_timer_function(), but it's
obviously superfluous (although it's harmless).  Better to drop it for
avoiding confusion.

Fixes: 1ef2cb6b29c2 ("ALSA: aloop: Use guard() for spin locks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index a37a1695f51c..3f8488716a08 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -728,7 +728,6 @@ static void loopback_jiffies_timer_function(struct timer_list *t)
 			if (dpcm->period_update_pending) {
 				dpcm->period_update_pending = 0;
 				period_elapsed = true;
-				break;
 			}
 		}
 	}
-- 
2.54.0

