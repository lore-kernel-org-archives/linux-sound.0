Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D74D0A1C
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090914; cv=none; b=FesiUIkwc0d8Vn0OVYt1GHMT18q3E1ZC5mD6wn2JtF7uwbiYxp7mDYDG1QW16xu6uS49l+E0W+ALHdr2Hb5UpDuUD8eVZi4881u7Xh2GBJ/exQcw02QT5KHoSvo1IUDnXFUfYs335MWMEOhlE5lRlkIByOj9BBQy19VFabDIyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090914; c=relaxed/simple;
	bh=EvSv0XljwdTUDZW0yDd0nu3CHQtaLNZF3Us+dEx92dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byhC1HCjcC+bjjP7wx9y9EsKWZq5LoHqMdRT4+hnBswBzrNeJ4++2ft0kTWXdKYzoUXvBKGQC3GozZ/0qlHLwgQRdA4x7hqO85H4ayVa+IqVcivQDwxu8rPkPTk5bK3tX7Wa1VXthc2YmUmxFakTQZFro6ZfLmc8gUiAgkBh4js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HG090PSg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1UW3lOED; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HG090PSg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1UW3lOED; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HG090PSg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1UW3lOED";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HG090PSg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1UW3lOED"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86B391FC9E;
	Thu, 15 Oct 2026 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792090910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4b6HSpVdpnFoHfc1bJd0QnF3diASqiNfkYJ61csn+U=;
	b=HG090PSgcSo2xWBc2WhzxuLsTj9oBwWCPbJ2h4jQ7Ly/clboMIr7gPipOz1RxcDg+xKHzP
	wTQofdqLivmE+2c2Qa0EgEQBsVYubPEeIVDEiBK35DNKL3gTFb0jSgVfv07pZp7J/7yCk9
	SHmfqH5lqePD+PV/cmVCWVa1jbiYgvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792090910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4b6HSpVdpnFoHfc1bJd0QnF3diASqiNfkYJ61csn+U=;
	b=1UW3lOEDJtdfhKaJ7VwjHYhCqOsoMpmNmhwyZJX1/i3/u2Hkr+/JS0uTJxkekRQD0F6b0g
	nGQitiyqhT0H3DCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HG090PSg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1UW3lOED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792090910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4b6HSpVdpnFoHfc1bJd0QnF3diASqiNfkYJ61csn+U=;
	b=HG090PSgcSo2xWBc2WhzxuLsTj9oBwWCPbJ2h4jQ7Ly/clboMIr7gPipOz1RxcDg+xKHzP
	wTQofdqLivmE+2c2Qa0EgEQBsVYubPEeIVDEiBK35DNKL3gTFb0jSgVfv07pZp7J/7yCk9
	SHmfqH5lqePD+PV/cmVCWVa1jbiYgvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792090910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4b6HSpVdpnFoHfc1bJd0QnF3diASqiNfkYJ61csn+U=;
	b=1UW3lOEDJtdfhKaJ7VwjHYhCqOsoMpmNmhwyZJX1/i3/u2Hkr+/JS0uTJxkekRQD0F6b0g
	nGQitiyqhT0H3DCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 278AC13223;
	Thu, 15 Oct 2026 19:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iNcVMR0j0WrHJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 19:01:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ALSA: pcm: Call snd_pcm_sync_stop outside spinlock in snd_pcm_drop()
Date: Thu, 15 Oct 2026 21:01:46 +0200
Message-ID: <20261015190147.230736-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 86B391FC9E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

In the recent addition of snd_pcm_sync_stop() call at snd_pcm_drop(),
I overlooked the guard() line in snd_pcm_drop() (and the review
overlooked, too) -- it must be called outside, of course!

Let's fix it.  Now guard() became scoped_guard(), and its range is
shown more clearly.

Fixes: fdf9a21cda78 ("ALSA: pcm: Apply sync-stop at SNDRV_PCM_IOCTL_DROP ioctl")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/c2bc1478-5999-455f-bd67-8b536c452215@samsung.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 05097f2630ad..f2e378696c7e 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2307,17 +2307,18 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 		return -ENXIO;
 	runtime = substream->runtime;
 
-	guard(pcm_stream_lock_irq)(substream);
-	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
-		return -EBADFD;
+	scoped_guard(pcm_stream_lock_irq, substream) {
+		if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+		    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+			return -EBADFD;
 
-	/* resume pause */
-	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
-		snd_pcm_pause(substream, false);
+		/* resume pause */
+		if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+			snd_pcm_pause(substream, false);
 
-	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
-	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
+		result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
+		/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
+	}
 
 	snd_pcm_sync_stop(substream, true);
 
-- 
2.55.0

