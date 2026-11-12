Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486874;
	b=ZDCZHphs+eSLm9RKd40lA1RsXNO3WJcyZx0ln4xQ3LYDsQd9wXQzJ4epYLnlZpRipcnv
	 Gm4OH4UD6BATbTogJMhvm+XPjIJtEs5MfOEK8ZEmkKdO3+eMYIZVBaj5XIHOmlqjwDpNI
	 1jU1Lxbfa6KI/WJElDK6YZB+KlNstWbhhg5MgO9LMDd5RoWMceIUD2lWpgH6S5XYcB0hj
	 UVPldlXmATWMTJcNrw0N/KNcGNrbfUWMcny5IjoYEq8gYWuhR7su4Sa+O3cUBNRHtzg5X
	 KA/dSfHCSVXhJqvCqvPzMZRrvxfoRZvNdKNvE3qbYsOZssPYPazuYH3BNV4/1ZbTteQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486874;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=dWSOSwLzS6PHWgBi+14MkET6ZXXqBnXPuzMff+RbrxE=;
	b=FHKHRmW2nox9F7HeOInzDLA6vHJN5aXir7mu/1olPaSmqphAX6sZ+Oq6LZMeAyi2qGK2
	 RIE/ziSgoyG5D9qXB/uU0zJRmnNzNnRufDoBtCZ7ntLVlY1PErUjPGmcpWUEH4/1WWZNl
	 hVA+m6Y7qAkjCkcRug4faJamCiz/DFmsbf9sotjOfAjK351zJhGRfOwFzHAUtFj/0pHFu
	 TRwGAMKElcpjchFJPKPwEQ30lsazgG/ZZAIJS9psU5GOqLzmBc+xdCV5FZyLJjGebtxgo
	 tba7086jJ7XCV9eybSqcwgGzfxUGwEOV7uD0gslkCH6nmMgGRfRzgXEFX8V6PQEofgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=So9zact+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MVwADniu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=So9zact+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MVwADniu;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497FB606A339
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 497FB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=So9zact+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MVwADniu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=So9zact+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MVwADniu
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8DFE521BAB;
	Thu, 12 Nov 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794486872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dWSOSwLzS6PHWgBi+14MkET6ZXXqBnXPuzMff+RbrxE=;
	b=So9zact+2UwF2XuDIvqiaSFQssg55qrYgKH9QUewqpG9Z0/EbYRuXMjshEieIycMFVOAr3
	QS/S0IrrQTp442vTCkMu8zpmxBlxdFOAuQS8vAzYXA4RiEG+uBcrJvdx2pteVXuJF+Pj2o
	ui7f39ZK7Y2ukd2z7wPaxo7Jhw8jWBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794486872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dWSOSwLzS6PHWgBi+14MkET6ZXXqBnXPuzMff+RbrxE=;
	b=MVwADniuWhFTImpR90vsMO+k1wROMSXbBNkVX4YgCSzpeND/8sHt+WVRGdcKKuKRuTNZ56
	I9/9MZ3ADLgqcsCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794486872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dWSOSwLzS6PHWgBi+14MkET6ZXXqBnXPuzMff+RbrxE=;
	b=So9zact+2UwF2XuDIvqiaSFQssg55qrYgKH9QUewqpG9Z0/EbYRuXMjshEieIycMFVOAr3
	QS/S0IrrQTp442vTCkMu8zpmxBlxdFOAuQS8vAzYXA4RiEG+uBcrJvdx2pteVXuJF+Pj2o
	ui7f39ZK7Y2ukd2z7wPaxo7Jhw8jWBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794486872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dWSOSwLzS6PHWgBi+14MkET6ZXXqBnXPuzMff+RbrxE=;
	b=MVwADniuWhFTImpR90vsMO+k1wROMSXbBNkVX4YgCSzpeND/8sHt+WVRGdcKKuKRuTNZ56
	I9/9MZ3ADLgqcsCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FCD313432;
	Thu, 12 Nov 2026 12:34:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8oSkCViy9WrcSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 12:34:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: oss: Compare max buffer size in bytes
Date: Thu, 12 Nov 2026 13:34:14 +0100
Message-ID: <20261112123430.684056-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

We introduced the upper-limit check of the buffer size for PCM OSS to
1MB bytes, but at one place (for PCM OSS plugin-base), the check was
applied at a wrong position: the size is compared before scaling down
to byte size, so it's limiting essentially to 1MB bits, i.e. 128kB
bytes, instead.

Although 128kB is enough in practical use cases, it's better to align
with other places for the code consistency.  So this patch moves the
check to the right position after conversion to bytes, so that it can
limit to the correct size, 1MB bytes.

Fixes: efb6402c3c4a ("ALSA: oss: Fix PCM OSS buffer allocation overflow")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_plugin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 3de713779993..c5b3c67345ee 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -48,12 +48,12 @@ static int snd_pcm_plugin_alloc(struct snd_pcm_plugin *plugin, snd_pcm_uframes_t
 	if (width < 0)
 		return width;
 	size = array3_size(frames, format->channels, width);
-	/* check for too large period size once again */
-	if (size > 1024 * 1024)
-		return -ENOMEM;
 	if (snd_BUG_ON(size % 8))
 		return -ENXIO;
 	size /= 8;
+	/* check for too large period size once again */
+	if (size > 1024 * 1024)
+		return -ENOMEM;
 	if (plugin->buf_frames < frames) {
 		kvfree(plugin->buf);
 		plugin->buf = kvzalloc(size, GFP_KERNEL);
-- 
2.53.0

