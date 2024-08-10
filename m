Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30D1474C3
	for <linux-sound@vger.kernel.org>; Sat, 10 Aug 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723279677; cv=none; b=XQ4nnFOcM9oLIW1dGtiQVBr1J0OdsM0Y+zvEsMWu8byG7jvzDF/fR8Q2qMZnD8INRIvgSdu1uBQmj/LFbS0tV6OQwVx6PJjeqBcsqVOCRU/f/YnmVfPiG1oAYfvaDbdLAnnHskP1vLt2UhXvmH9376VmDtio1fCUoMjkrXGQglw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723279677; c=relaxed/simple;
	bh=lMbyjbWgmYs2XFVwfWxwraDJDB5BGrOZl7uD36GmN+0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=aoESvDxEuSbUqnA4RYfY0FUyl84Kq4Wn2v+ocwYqpeP129q/qcoDtEdrZHAtgBVXU1fsnKvV63RjLilSH0Ox3HaKiMSvz5FgI0Sacd0fS0FNQpkfASGvNzXJw7ObEdpaakb0QJPsK38Wd+CkMuWwNCvKHKuX4SVnbRBKkCAao1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PWxkK8u7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZJLbvsfI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PWxkK8u7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZJLbvsfI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PWxkK8u7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZJLbvsfI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PWxkK8u7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZJLbvsfI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4728222144;
	Sat, 10 Aug 2024 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723279674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4KVpqHyY30nvFloW8NfoaasTvVT1zEmfAPjuO3uY+Ss=;
	b=PWxkK8u7o+z8KTzi/zGd7YXNKMK7KY5WzFxC8c/cHhFn+jbMvPVPhPn8yrQGkZ9piHB90a
	RL0Rmp8mvo4XLY8up3jXi3noXb3rm0SLNvN86BVDkJ7ZRGIPo4A4nn+dJ12mHMxkU7AoiB
	b6OhyPvt/OfZjkqZVXwnOv9WncXYAp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723279674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4KVpqHyY30nvFloW8NfoaasTvVT1zEmfAPjuO3uY+Ss=;
	b=ZJLbvsfItVdcTuroYOVKeROqK4X4zu8koNFgan2c5lVzwPemBEyfdhsf7fx1z2yWVtRxq9
	J6DAErwPA0956WAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723279674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4KVpqHyY30nvFloW8NfoaasTvVT1zEmfAPjuO3uY+Ss=;
	b=PWxkK8u7o+z8KTzi/zGd7YXNKMK7KY5WzFxC8c/cHhFn+jbMvPVPhPn8yrQGkZ9piHB90a
	RL0Rmp8mvo4XLY8up3jXi3noXb3rm0SLNvN86BVDkJ7ZRGIPo4A4nn+dJ12mHMxkU7AoiB
	b6OhyPvt/OfZjkqZVXwnOv9WncXYAp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723279674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4KVpqHyY30nvFloW8NfoaasTvVT1zEmfAPjuO3uY+Ss=;
	b=ZJLbvsfItVdcTuroYOVKeROqK4X4zu8koNFgan2c5lVzwPemBEyfdhsf7fx1z2yWVtRxq9
	J6DAErwPA0956WAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A38313704;
	Sat, 10 Aug 2024 08:47:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Lgw7CDopt2Z3JgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Aug 2024 08:47:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: timer: Relax start tick time check for slave timer elements
Date: Sat, 10 Aug 2024 10:48:32 +0200
Message-ID: <20240810084833.10939-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The recent addition of a sanity check for a too low start tick time
seems breaking some applications that uses aloop with a certain slave
timer setup.  They may have the initial resolution 0, hence it's
treated as if it were a too low value.

Relax and skip the check for the slave timer instance for addressing
the regression.

Fixes: 4a63bd179fa8 ("ALSA: timer: Set lower bound of start tick time")
Cc: <stable@vger.kernel.org>
Link: https://github.com/raspberrypi/linux/issues/6294
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index d104adc75a8b..71a07c1662f5 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -547,7 +547,7 @@ static int snd_timer_start1(struct snd_timer_instance *timeri,
 	/* check the actual time for the start tick;
 	 * bail out as error if it's way too low (< 100us)
 	 */
-	if (start) {
+	if (start && !(timer->hw.flags & SNDRV_TIMER_HW_SLAVE)) {
 		if ((u64)snd_timer_hw_resolution(timer) * ticks < 100000)
 			return -EINVAL;
 	}
-- 
2.43.0

