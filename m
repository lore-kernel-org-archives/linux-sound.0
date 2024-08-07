Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C101E673D
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037661; cv=none; b=NCsloWkqOoY1hbXZL/SCJPPUjioS0r2xPCWx3HT5AnzodMFaG0bqyPo/YTiON5nQFIXbDogWRkRMAxBEoHT4qqq94wGrm1MCRR9kDrvrhJMzP8vk1qa8YpVP+Wvl8PxOyQ/ed2+S84DiwghBIGZG9Ikfh0PtnxVA7XSFRMsQKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037661; c=relaxed/simple;
	bh=THgLEZpqbCchsQtbXmlpNfZNC5sSobddesVYT9GTIyQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=if1YyZbVcTVXyWAlOnby//H78FcTdwUHXdI+wO5S7uISUBC4cQhDE31CZZAzT+iMfT+guiRy/f62w+XNfWDTE3zBquwWMXiEDzXfjUMdgeA87qawIRwxZKxzAhTGpyYDnmT9YRnRH/6mruFUsc8wofB+F1otgMIN9qFu6Ub5COw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YsaUhdSk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C0lSRtf6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YsaUhdSk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C0lSRtf6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YsaUhdSk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C0lSRtf6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YsaUhdSk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C0lSRtf6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9AF91FB58;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGgcCztPHQd4UtGcNJRqgGt4msFnk/ksbWjvwAJpV0Y=;
	b=YsaUhdSkIq0EKnvZFCZdVJfFaG7vFOTi78xn1pGxmsqGlSfrkypRdlFC3pb2k4KaFobOVX
	4akpEysfmNLzhxL9u+aV6NRXaEFJmfELsTQxFm8o9xoQqjpbT3YFWun4HGkzxSFXrkLf06
	pljSfq8dAFSu6cFwl9X0eIm384S0q9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGgcCztPHQd4UtGcNJRqgGt4msFnk/ksbWjvwAJpV0Y=;
	b=C0lSRtf67UiKdh3PekDylnvaWzVFEb9spuNlk4XYoZgmVeaeGRrQHwtPKvHqCBAX1mUV/U
	AU2VnLAqI1ClooAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YsaUhdSk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C0lSRtf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGgcCztPHQd4UtGcNJRqgGt4msFnk/ksbWjvwAJpV0Y=;
	b=YsaUhdSkIq0EKnvZFCZdVJfFaG7vFOTi78xn1pGxmsqGlSfrkypRdlFC3pb2k4KaFobOVX
	4akpEysfmNLzhxL9u+aV6NRXaEFJmfELsTQxFm8o9xoQqjpbT3YFWun4HGkzxSFXrkLf06
	pljSfq8dAFSu6cFwl9X0eIm384S0q9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGgcCztPHQd4UtGcNJRqgGt4msFnk/ksbWjvwAJpV0Y=;
	b=C0lSRtf67UiKdh3PekDylnvaWzVFEb9spuNlk4XYoZgmVeaeGRrQHwtPKvHqCBAX1mUV/U
	AU2VnLAqI1ClooAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 900CF13B05;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cHIKItl3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/54] ALSA: opl4: Use standard print API
Date: Wed,  7 Aug 2024 15:33:57 +0200
Message-ID: <20240807133452.9424-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A9AF91FB58
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl4/opl4_lib.c | 8 ++++----
 sound/drivers/opl4/yrw801.c   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/drivers/opl4/opl4_lib.c b/sound/drivers/opl4/opl4_lib.c
index 035645eb5e8d..8fa61596875a 100644
--- a/sound/drivers/opl4/opl4_lib.c
+++ b/sound/drivers/opl4/opl4_lib.c
@@ -114,7 +114,7 @@ static int snd_opl4_detect(struct snd_opl4 *opl4)
 	snd_opl4_enable_opl4(opl4);
 
 	id1 = snd_opl4_read(opl4, OPL4_REG_MEMORY_CONFIGURATION);
-	snd_printdd("OPL4[02]=%02x\n", id1);
+	dev_dbg(opl4->card->dev, "OPL4[02]=%02x\n", id1);
 	switch (id1 & OPL4_DEVICE_ID_MASK) {
 	case 0x20:
 		opl4->hardware = OPL3_HW_OPL4;
@@ -130,7 +130,7 @@ static int snd_opl4_detect(struct snd_opl4 *opl4)
 	snd_opl4_write(opl4, OPL4_REG_MIX_CONTROL_PCM, 0xff);
 	id1 = snd_opl4_read(opl4, OPL4_REG_MIX_CONTROL_FM);
 	id2 = snd_opl4_read(opl4, OPL4_REG_MIX_CONTROL_PCM);
-	snd_printdd("OPL4 id1=%02x id2=%02x\n", id1, id2);
+	dev_dbg(opl4->card->dev, "OPL4 id1=%02x id2=%02x\n", id1, id2);
        	if (id1 != 0x00 || id2 != 0xff)
 		return -ENODEV;
 
@@ -200,7 +200,7 @@ int snd_opl4_create(struct snd_card *card,
 	opl4->res_fm_port = request_region(fm_port, 8, "OPL4 FM");
 	opl4->res_pcm_port = request_region(pcm_port, 8, "OPL4 PCM/MIX");
 	if (!opl4->res_fm_port || !opl4->res_pcm_port) {
-		snd_printk(KERN_ERR "opl4: can't grab ports 0x%lx, 0x%lx\n", fm_port, pcm_port);
+		dev_err(card->dev, "opl4: can't grab ports 0x%lx, 0x%lx\n", fm_port, pcm_port);
 		snd_opl4_free(opl4);
 		return -EBUSY;
 	}
@@ -214,7 +214,7 @@ int snd_opl4_create(struct snd_card *card,
 	err = snd_opl4_detect(opl4);
 	if (err < 0) {
 		snd_opl4_free(opl4);
-		snd_printd("OPL4 chip not detected at %#lx/%#lx\n", fm_port, pcm_port);
+		dev_dbg(card->dev, "OPL4 chip not detected at %#lx/%#lx\n", fm_port, pcm_port);
 		return err;
 	}
 
diff --git a/sound/drivers/opl4/yrw801.c b/sound/drivers/opl4/yrw801.c
index 6c335492d082..9e464b84b905 100644
--- a/sound/drivers/opl4/yrw801.c
+++ b/sound/drivers/opl4/yrw801.c
@@ -43,7 +43,7 @@ int snd_yrw801_detect(struct snd_opl4 *opl4)
 	snd_opl4_read_memory(opl4, buf, 0x1ffffe, 2);
 	if (buf[0] != 0x01)
 		return -ENODEV;
-	snd_printdd("YRW801 ROM version %02x.%02x\n", buf[0], buf[1]);
+	dev_dbg(opl4->card->dev, "YRW801 ROM version %02x.%02x\n", buf[0], buf[1]);
 	return 0;
 }
 
-- 
2.43.0

