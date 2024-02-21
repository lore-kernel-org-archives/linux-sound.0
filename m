Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48883D38E
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507324; cv=none; b=M1+YW3K6pSLVYT91PCcQV+oaWBq5RSI/USwUe7qdRsfkrSrUDh7I7Po9dXONQl4kFp5FZmJ5Y33lxBIDkHkxKy6pAZx6T6YDC1ruw+pLZ43IXiZ9j3imk9f0tFVTA8CAgiIb6AVLSZAUPzHVdbPHQLuA2YnObulO1I5XLXHSI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507324; c=relaxed/simple;
	bh=bE/UFac9rALCjOc0BkSb7Oew4RsObAoHk89ortVn8cA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=phd2Q7SZmip9zj0DTJuVfXTWrvCTeOOAhhmuwuMmmEDddyTYkK26dn5rScPw+8jks8q4L5tx5Ybocyg8ivAFYe2PTLmD3vFidbFL7yHVazsKqfIsc8eDs/B3ZJG4C7jGYYO/719DnclPuGxSKG2LtD7ZFwFIjBa+6woaRlsrCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggdxRLw9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=npovCf12; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggdxRLw9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=npovCf12; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggdxRLw9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="npovCf12";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggdxRLw9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="npovCf12"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAB8E2205B;
	Wed, 21 Feb 2024 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708507320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/QHL2fVbcUQphOJnyb7/qgsQ5PLezMxmc+6SS77UfzY=;
	b=ggdxRLw96tBwbl5o7SWnEaG1N02wGGyaN+qq1gwNiuPw09CPx6aXHSRgEKp8X809EiVUM7
	xTcQSZk2KRQoA25YCLU2Y07mMIyQByrlQhuDgeewO4wl9256tEpR593mcFbTeFssHpugTk
	Q87Xcd98q6ySfdDYA2JdhhWOFU4k8C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708507320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/QHL2fVbcUQphOJnyb7/qgsQ5PLezMxmc+6SS77UfzY=;
	b=npovCf12nsjHa6WuDcFdr+pHtUSDyAnERNrcJnqWXa+v4VT4MF43U5+CjQmE1dI2UMhmtM
	IM6acK8GgHG3zdCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708507320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/QHL2fVbcUQphOJnyb7/qgsQ5PLezMxmc+6SS77UfzY=;
	b=ggdxRLw96tBwbl5o7SWnEaG1N02wGGyaN+qq1gwNiuPw09CPx6aXHSRgEKp8X809EiVUM7
	xTcQSZk2KRQoA25YCLU2Y07mMIyQByrlQhuDgeewO4wl9256tEpR593mcFbTeFssHpugTk
	Q87Xcd98q6ySfdDYA2JdhhWOFU4k8C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708507320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/QHL2fVbcUQphOJnyb7/qgsQ5PLezMxmc+6SS77UfzY=;
	b=npovCf12nsjHa6WuDcFdr+pHtUSDyAnERNrcJnqWXa+v4VT4MF43U5+CjQmE1dI2UMhmtM
	IM6acK8GgHG3zdCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0EF6139D0;
	Wed, 21 Feb 2024 09:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MwQCKbjA1WW7NAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Feb 2024 09:22:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: Drop leftover snd-rtctimer stuff from Makefile
Date: Wed, 21 Feb 2024 10:21:56 +0100
Message-Id: <20240221092156.28695-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ggdxRLw9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=npovCf12
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.49 / 50.00];
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
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[32.40%]
X-Spam-Score: 3.49
X-Rspamd-Queue-Id: DAB8E2205B
X-Spam-Flag: NO

We forgot to remove the line for snd-rtctimer from Makefile while
dropping the functionality.  Get rid of the stale line.

Fixes: 34ce71a96dcb ("ALSA: timer: remove legacy rtctimer")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/Makefile b/sound/core/Makefile
index a6b444ee2832..f6526b337137 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -32,7 +32,6 @@ snd-ump-objs      := ump.o
 snd-ump-$(CONFIG_SND_UMP_LEGACY_RAWMIDI) += ump_convert.o
 snd-timer-objs    := timer.o
 snd-hrtimer-objs  := hrtimer.o
-snd-rtctimer-objs := rtctimer.o
 snd-hwdep-objs    := hwdep.o
 snd-seq-device-objs := seq_device.o
 
-- 
2.35.3

