Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907F189B95
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723108480; cv=none; b=ZNCT5Edon+IS60MfW15GhhBJsrxvAzpyIXp1bkrNx2BkLZyr5622rTVoZfWg6Q/u1zzxUEwso/wj2L6Atmmfk/F4SR871mWr6CCLOKOzSraXMkwl7aijDHNW3/oBcQcF2BaRMXYxxo9NlI9u5HlJV+aMV1L8x3ErJVVoa2eaQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723108480; c=relaxed/simple;
	bh=rL8jXX/Idhx10vXTGrWdrWbqdlxNBrXWGYEZL/HTDwo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=t3f49DYfBKOcLV7TkLlClfIA1NTJsFa9xBC7gTTpwIOJzDp/w1RTUFGRvjQEcNgcLnO8rQEfRTEdW4AjRF7/fXo+XmGunqpyRZQZJED7M3GU7N5eQ+D6sgsOgEK7yVVeApRzG637nMMBZTx9la8/sOTPcOLtWhOAjtQrzm9kIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ak4QZTpy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NDClarkZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NvoIZWu0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WrUGXa0L; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ak4QZTpy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NDClarkZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NvoIZWu0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WrUGXa0L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5C5C821B71;
	Thu,  8 Aug 2024 09:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723108477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWU5i2vEbk1cGtc2ysfJqBdmlkvIxJwGbH6k9t3h/Ko=;
	b=ak4QZTpyu5aNkMZc7b/+p1nVgtR/vXBO2fYirw14rzb+xHRkWLqN1+pPBXVTfSKx3vOEhl
	Tgl01YSmsw5bsk5Cyf94mT7GywCTXWYmzaNlgA+Z1h1KJJWfzDfhoEXGbJ3jUkbJ5ykx3V
	sKS2va1WeOfBgwShSDhthSfiCy5ldBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723108477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWU5i2vEbk1cGtc2ysfJqBdmlkvIxJwGbH6k9t3h/Ko=;
	b=NDClarkZqZwmk7JG8qykQs7z5/FSzc9bQNjKaaxlhbc62APie980uqgrsaGQBnSx+X1nFL
	CU/1OTuySHujxNAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723108476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWU5i2vEbk1cGtc2ysfJqBdmlkvIxJwGbH6k9t3h/Ko=;
	b=NvoIZWu00dkiOzte2qTpIHIN9a1bJyHJjU46JwXa2KttPlTj4w9USR3hmQc6zW3LeJhUkM
	JHXzAZEgs7Fe4KUZBaPAgD37zY+h/CgecZ/mpjh1ba2gY5yIxyNOnH0GH61FnSOsbjZEWG
	b2wc9BMpro6bnLpsFvDA7Av19nkaDQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723108476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWU5i2vEbk1cGtc2ysfJqBdmlkvIxJwGbH6k9t3h/Ko=;
	b=WrUGXa0LfKkP7kbeEuFfIa7l7AmthqXaFwV1vW3ah+apJJfazuu3Qf7knCL8ZLLfPPpRSd
	0FNFLyFyKeyIzIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 434AD13876;
	Thu,  8 Aug 2024 09:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fqATD3yMtGaVHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 09:14:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hdsp: Break infinite MIDI input flush loop
Date: Thu,  8 Aug 2024 11:15:12 +0200
Message-ID: <20240808091513.31380-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spam-Level: 

The current MIDI input flush on HDSP and HDSPM drivers relies on the
hardware reporting the right value.  If the hardware doesn't give the
proper value but returns -1, it may be stuck at an infinite loop.

Add a counter and break if the loop is unexpectedly too long.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c  | 6 ++++--
 sound/pci/rme9652/hdspm.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index e7d1b43471a2..713ca262a0e9 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1298,8 +1298,10 @@ static int snd_hdsp_midi_output_possible (struct hdsp *hdsp, int id)
 
 static void snd_hdsp_flush_midi_input (struct hdsp *hdsp, int id)
 {
-	while (snd_hdsp_midi_input_available (hdsp, id))
-		snd_hdsp_midi_read_byte (hdsp, id);
+	int count = 256;
+
+	while (snd_hdsp_midi_input_available(hdsp, id) && --count)
+		snd_hdsp_midi_read_byte(hdsp, id);
 }
 
 static int snd_hdsp_midi_output_write (struct hdsp_midi *hmidi)
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 56d335f0e196..c3f930a8f78d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1838,8 +1838,10 @@ static inline int snd_hdspm_midi_output_possible (struct hdspm *hdspm, int id)
 
 static void snd_hdspm_flush_midi_input(struct hdspm *hdspm, int id)
 {
-	while (snd_hdspm_midi_input_available (hdspm, id))
-		snd_hdspm_midi_read_byte (hdspm, id);
+	int count = 256;
+
+	while (snd_hdspm_midi_input_available(hdspm, id) && --count)
+		snd_hdspm_midi_read_byte(hdspm, id);
 }
 
 static int snd_hdspm_midi_output_write (struct hdspm_midi *hmidi)
-- 
2.43.0

