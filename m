Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC70731E113
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478770; cv=none; b=F+BzTrX3Nnp1kWq1XQY7RzDMvG/lGvEUS4S0P+9hJ7EXqOtlYmcTC98dtsU3qItKKm6ARA2K2fRYIzzeO1u/OpHb+5wYHZMmdIkOIKlamzx5D4elgBGvxmzyds7j/tZhzLKSpkyfp6WlGiakiU6LR2ccdfGfCis+qXpvMWFulGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478770; c=relaxed/simple;
	bh=y7oDHNl4NXx+wWV6TSlctmze0ifh5XInkwDd9dip2t4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4i4f8tW04dEWjopyOe/InC3Bfhm8jcnos4kLhcxVuwKyPo7PaCqRWeron9b2Y7rsp95g+/LFT9RZuXuNZwARs8k5piLkzMRnpyRakwq0b3ddGJga5Q+ZH+BI4YtGES2GN/ZVlQnR4DEXyBifSfZfkCjpU0ClmBtKXE4OJ2CI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zXzgEJBc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Md5wx785; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zXzgEJBc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Md5wx785; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zXzgEJBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Md5wx785";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zXzgEJBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Md5wx785"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C02833ED4;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8a6fn7aP8tQu4cAJMy7It3BDvtdFqtS5i7umklXd30=;
	b=zXzgEJBceq9i6XrP1oRfxQdRuk75xxIO3MJGGsURDRYEcTzXqBP095H2gOu9ZmXJSqYOY+
	j12AHDoN3uYzVwQ4WMJq4L37XtOIv0bsWyyUn06X5F7f2cm08qp9titzaXkusOafhFv+SI
	DTWHuala3MUSkEBYQCdYh8KWLK4WCXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8a6fn7aP8tQu4cAJMy7It3BDvtdFqtS5i7umklXd30=;
	b=Md5wx785v/7byA3gnNPKI/74/QEKuX7r5bTdM1t9lT56hPP5grM/un9LQI1mOJZvilv8ws
	yK4zTakMQy+nHlCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zXzgEJBc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Md5wx785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8a6fn7aP8tQu4cAJMy7It3BDvtdFqtS5i7umklXd30=;
	b=zXzgEJBceq9i6XrP1oRfxQdRuk75xxIO3MJGGsURDRYEcTzXqBP095H2gOu9ZmXJSqYOY+
	j12AHDoN3uYzVwQ4WMJq4L37XtOIv0bsWyyUn06X5F7f2cm08qp9titzaXkusOafhFv+SI
	DTWHuala3MUSkEBYQCdYh8KWLK4WCXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8a6fn7aP8tQu4cAJMy7It3BDvtdFqtS5i7umklXd30=;
	b=Md5wx785v/7byA3gnNPKI/74/QEKuX7r5bTdM1t9lT56hPP5grM/un9LQI1mOJZvilv8ws
	yK4zTakMQy+nHlCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7351E13A54;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ICvMGrO8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 54/61] ALSA: sis7019: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:29 +0200
Message-ID: <20250829144342.4290-55-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8C02833ED4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sis7019.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 3d7abcb31679..a1341af8c41f 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -902,7 +902,7 @@ static unsigned short sis_ac97_rw(struct sis7019 *sis, int codec, u32 cmd)
 	/* Get the AC97 semaphore -- software first, so we don't spin
 	 * pounding out IO reads on the hardware semaphore...
 	 */
-	mutex_lock(&sis->ac97_mutex);
+	guard(mutex)(&sis->ac97_mutex);
 
 	count = 0xffff;
 	while ((inw(io + SIS_AC97_SEMA) & SIS_AC97_SEMA_BUSY) && --count)
@@ -941,8 +941,6 @@ static unsigned short sis_ac97_rw(struct sis7019 *sis, int codec, u32 cmd)
 timeout_sema:
 	outl(SIS_AC97_SEMA_RELEASE, io + SIS_AC97_SEMA);
 timeout:
-	mutex_unlock(&sis->ac97_mutex);
-
 	if (!count) {
 		dev_err(&sis->pci->dev, "ac97 codec %d timeout cmd 0x%08x\n",
 					codec, cmd);
-- 
2.50.1

