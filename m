Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C2322DB2
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478674; cv=none; b=hlje0kxHWicfl3WHYD3uDqtXo9eO3/JAQ851rnv+yERcYrPhGJdXJnxLYOQdr+mMAkEJlHa9EEeyIIft/4CWYsM/uFdY7fF13zZ7a5wTFSIGq07fsQqycYzSMOOkfmDRxicN0KKi0AdnRcVN6xRX+e3e71kMKvzsch+9zf/adJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478674; c=relaxed/simple;
	bh=75BKzJ/6wZLCGEqSr0T0FXFtrx1tbYTbFESXOrifHEQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nniiR6xymG+kq/hlCKTxa0p6mc/v3p8Svmr+ZyKjmk4fNr5w/T6kmTlFqrGY6YL2PuJntwnBuT7ZARlZuMb3Sp1cp0aOG1A11GszjDAab2arlzb53KNQxnRXf6uH+sg8TrZyQ/DGFztvJ8MIIbcZh2jBtfajQwcPDPU9L/ouydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=StiisKq9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6uY0WGz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=StiisKq9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6uY0WGz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="StiisKq9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6uY0WGz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="StiisKq9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6uY0WGz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4476133EC8;
	Fri, 29 Aug 2025 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4qobfZrC+bfCZXaDDo2wyvubnI7NT8aZ8UVWyOR/Qo=;
	b=StiisKq95W9CB4/raZCTj5SbqJxFlpkkm7GsAn/Ga07SoN5X70Tz6vQ3u8Ou7O9jZuRwn1
	rARRS8GNE0zdB1GO4YUhXP5wErvW41HU5wcf4CHIOCAv0fLjyOGkFjaghhMNcvKj9M/OsS
	ljBeT6whwCUTm3D+bWjraM5F7euT/wM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4qobfZrC+bfCZXaDDo2wyvubnI7NT8aZ8UVWyOR/Qo=;
	b=f6uY0WGzCQ9k3o+9TXP24A+XIl1qaFnYQ0fl+D1LCYUVbu+iWHyilG+UK6TWNS7216tOqt
	fErDU6Rl7daKyXCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=StiisKq9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f6uY0WGz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4qobfZrC+bfCZXaDDo2wyvubnI7NT8aZ8UVWyOR/Qo=;
	b=StiisKq95W9CB4/raZCTj5SbqJxFlpkkm7GsAn/Ga07SoN5X70Tz6vQ3u8Ou7O9jZuRwn1
	rARRS8GNE0zdB1GO4YUhXP5wErvW41HU5wcf4CHIOCAv0fLjyOGkFjaghhMNcvKj9M/OsS
	ljBeT6whwCUTm3D+bWjraM5F7euT/wM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4qobfZrC+bfCZXaDDo2wyvubnI7NT8aZ8UVWyOR/Qo=;
	b=f6uY0WGzCQ9k3o+9TXP24A+XIl1qaFnYQ0fl+D1LCYUVbu+iWHyilG+UK6TWNS7216tOqt
	fErDU6Rl7daKyXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B89C13A3E;
	Fri, 29 Aug 2025 14:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OFVaCau8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/61] ALSA: aw2: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:47 +0200
Message-ID: <20250829144342.4290-13-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4476133EC8
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
 sound/pci/aw2/aw2-alsa.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 1d7aab14579e..bf9b3c84f554 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -347,7 +347,7 @@ static int snd_aw2_pcm_prepare_playback(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned long period_size, buffer_size;
 
-	mutex_lock(&chip->mtx);
+	guard(mutex)(&chip->mtx);
 
 	period_size = snd_pcm_lib_period_bytes(substream);
 	buffer_size = snd_pcm_lib_buffer_bytes(substream);
@@ -363,8 +363,6 @@ static int snd_aw2_pcm_prepare_playback(struct snd_pcm_substream *substream)
 						    snd_pcm_period_elapsed,
 						    (void *)substream);
 
-	mutex_unlock(&chip->mtx);
-
 	return 0;
 }
 
@@ -376,7 +374,7 @@ static int snd_aw2_pcm_prepare_capture(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned long period_size, buffer_size;
 
-	mutex_lock(&chip->mtx);
+	guard(mutex)(&chip->mtx);
 
 	period_size = snd_pcm_lib_period_bytes(substream);
 	buffer_size = snd_pcm_lib_buffer_bytes(substream);
@@ -392,8 +390,6 @@ static int snd_aw2_pcm_prepare_capture(struct snd_pcm_substream *substream)
 						   snd_pcm_period_elapsed,
 						   (void *)substream);
 
-	mutex_unlock(&chip->mtx);
-
 	return 0;
 }
 
-- 
2.50.1

