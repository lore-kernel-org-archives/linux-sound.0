Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0282A1B2193
	for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732546682; cv=none; b=puXu6a8L7z+OTftLk+P2KeKKdUKyArqE9doQMvwS6sHTFz6hLbuAYY2yqmYRzJcKQ7G5S/Xhda0CgUFRJukwyNtM+bXSysemWsdVYLR1Lq65GwxawLs11RIrPzMyFL199/fP6kdZcEEwEcpkPG/u+NTNGCzZNtM08kUOi6YM4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732546682; c=relaxed/simple;
	bh=hwKGyVzMfDkCSCTaw96Ja4FXqpTJJYQSkbzoUukLWiQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=spNQRfF7KrpuKFybL39jY6PO3PwL6C+I6yMJ3R6R2glv/D3Wy5y74PU2X+N/82ZHyljdeDdSLe/EChWQLhA1z7pH1NclsBWpbebHxoKJJ/pbubzxOcK2vs6mQpeP5x5HlXPAwwVwT6wf23ZNgWqTSIsdLVeKQvEO8xXMTQ5CyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RBbgGbZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L2hXrEkR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RBbgGbZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L2hXrEkR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RBbgGbZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L2hXrEkR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RBbgGbZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L2hXrEkR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 248591F396;
	Mon, 25 Nov 2024 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732546679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XUnt8Bt8AwYiybMiuWtmZXMy8DkgIC0qSexb1p1XFR8=;
	b=RBbgGbZpOs+KtWMmzXYWQyKpirUf0JAYF2vnhYDxxwjrakSYhWck62e8JNC/WRHUaNbX8l
	YIZnFepPHxAtGtqLTsnwUDKrrcPUM22sdlh2sN0ogdYhFCyghgb9ZqjtPzXOu8Ta/+Q2ww
	ui/qfBs8uHfz7RhIAr4z0OIAQqTyIzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732546679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XUnt8Bt8AwYiybMiuWtmZXMy8DkgIC0qSexb1p1XFR8=;
	b=L2hXrEkRRuP7LuMB0mTmktyAxPrSK783sHvhdOFh9CeIHQsOFbl3MlpTgRj8ICbFEVkXL3
	sGSp4CSbIXszqeDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732546679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XUnt8Bt8AwYiybMiuWtmZXMy8DkgIC0qSexb1p1XFR8=;
	b=RBbgGbZpOs+KtWMmzXYWQyKpirUf0JAYF2vnhYDxxwjrakSYhWck62e8JNC/WRHUaNbX8l
	YIZnFepPHxAtGtqLTsnwUDKrrcPUM22sdlh2sN0ogdYhFCyghgb9ZqjtPzXOu8Ta/+Q2ww
	ui/qfBs8uHfz7RhIAr4z0OIAQqTyIzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732546679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XUnt8Bt8AwYiybMiuWtmZXMy8DkgIC0qSexb1p1XFR8=;
	b=L2hXrEkRRuP7LuMB0mTmktyAxPrSK783sHvhdOFh9CeIHQsOFbl3MlpTgRj8ICbFEVkXL3
	sGSp4CSbIXszqeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C2BF137D4;
	Mon, 25 Nov 2024 14:57:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YqvKAXeQRGdeUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Nov 2024 14:57:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Don't issue XRUN during draining
Date: Mon, 25 Nov 2024 15:57:55 +0100
Message-ID: <20241125145757.22891-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

snd_pcm_stop_xrun() checks the stream status with snd_pcm_running()
helper, but this isn't really correct; namely, snd_pcm_running()
returns true also when the stream is in draining, but in principle,
the xrun at draining means nothing but the draining finished.  Hence,
we shouldn't issue XRUN when it happens during draining.

That is, for a proper state check, we should check the state only for
SNDRV_PCM_STATE_RUNNING, instead.

Fixes: 1fb8510cdb5b ("ALSA: pcm: Add snd_pcm_stop_xrun() helper")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 381a476a1045..7bcca443e333 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1577,7 +1577,8 @@ int snd_pcm_drain_done(struct snd_pcm_substream *substream)
 int snd_pcm_stop_xrun(struct snd_pcm_substream *substream)
 {
 	guard(pcm_stream_lock_irqsave)(substream);
-	if (substream->runtime && snd_pcm_running(substream))
+	if (substream->runtime &&
+	    substream->runtime->state == SNDRV_PCM_STATE_RUNNING)
 		__snd_pcm_xrun(substream);
 	return 0;
 }
-- 
2.43.0

