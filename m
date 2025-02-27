Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD051270024
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649916; cv=none; b=XwdxNd1+Tv65/UNcmYOPU2HeZRgGdR1ZBeZAC6wEn9l4+xeaA7iOWf3Znk3w6rDN9JvMUeWxfteaIrf+C2grN+6IyUKRwSac8u98dcIWeQnGa99FJzPaRPWBd+NeqJm4fEefjbkK4yaPV9p2sb3KeXSLnXFkZZaz4JvbqICQiw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649916; c=relaxed/simple;
	bh=ykGUvFOLPHltTFwdyyLSx9VgVUAYhgKZViXNqacoHyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lRZ+viIROa0FWcVbS6x+tp1FbL7vZ0X6GTLqAN2HE0TXsKryeiQQXTHu/Ja6JsD9lYxh5RXZkQUy/iXolwXXwGB2i384KGYAdxR1CB8nJ9SYt7COUujk8jS0yxrUZMv69Nh3THQeHsXM63FU/OO4E3EURcZPgDGPWE928WkR11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=th2zmAJH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X/jI6t28; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=th2zmAJH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X/jI6t28; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="th2zmAJH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X/jI6t28";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="th2zmAJH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X/jI6t28"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DEAEA21185;
	Thu, 27 Feb 2025 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740649912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H28wFOxPLqveV8rFAWZi8zLi6W5jNGZfs0+OKyO5jDY=;
	b=th2zmAJHhJ1qnqRcuHefDCwx1+yL0VGNiQVNEPoKonkw9dBTXnal2NUF923QJMXpXuHvY7
	rCkNJimetyw67KV7xh0pccxfKlPvX2ibC410RHhZOmMV8ufMevm8bXTWMy6U+MLaXw6djx
	i1cDWmT6LhyVJEIxkm+vWtVgNBFZFn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740649912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H28wFOxPLqveV8rFAWZi8zLi6W5jNGZfs0+OKyO5jDY=;
	b=X/jI6t28qubc/o119nMyZOcqjBXr/33fAFSG4iW0h1nUQeohpqBDdVc3tOGGS5nw5Yj08F
	0xf0jHyF0MKE5hBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740649912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H28wFOxPLqveV8rFAWZi8zLi6W5jNGZfs0+OKyO5jDY=;
	b=th2zmAJHhJ1qnqRcuHefDCwx1+yL0VGNiQVNEPoKonkw9dBTXnal2NUF923QJMXpXuHvY7
	rCkNJimetyw67KV7xh0pccxfKlPvX2ibC410RHhZOmMV8ufMevm8bXTWMy6U+MLaXw6djx
	i1cDWmT6LhyVJEIxkm+vWtVgNBFZFn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740649912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H28wFOxPLqveV8rFAWZi8zLi6W5jNGZfs0+OKyO5jDY=;
	b=X/jI6t28qubc/o119nMyZOcqjBXr/33fAFSG4iW0h1nUQeohpqBDdVc3tOGGS5nw5Yj08F
	0xf0jHyF0MKE5hBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBACD1376A;
	Thu, 27 Feb 2025 09:51:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DoaYK7g1wGfgGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Feb 2025 09:51:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Drop superfluous NULL check in snd_pcm_format_set_silence()
Date: Thu, 27 Feb 2025 10:51:49 +0100
Message-ID: <20250227095150.8187-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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

We applied a fix for a KASAN issue for snd_pcm_format_set_silence(),
and it introduced a NULL check of pat.  But this turned out to be
utterly superfluous; it points to pcm_formats[].silence, and this is
an array, which can be never NULL.

The problem (supposedly) it tried to address at that time was likely
already fixed by another commit 8423f0b6d513 ("ALSA: pcm: oss: Fix
race at SNDCTL_DSP_SYNC") instead.

So let's drop the superfluous NULL check again.  While we're at it,
keep the whitespace fix and move the pat assignment after the width
check for a bit better code readability.

Fixes: 2f7a26abb824 ("ALSA: pcm: Test for "silence" field in struct "pcm_format_data"")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 4f556211bb56..d3a08e292072 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -432,9 +432,9 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 	if (samples == 0)
 		return 0;
 	width = pcm_formats[(INT)format].phys; /* physical width */
-	pat = pcm_formats[(INT)format].silence;
-	if (!width || !pat)
+	if (!width)
 		return -EINVAL;
+	pat = pcm_formats[(INT)format].silence;
 	/* signed or 1 byte data */
 	if (pcm_formats[(INT)format].signd == 1 || width <= 8) {
 		unsigned int bytes = samples * width / 8;
-- 
2.43.0

