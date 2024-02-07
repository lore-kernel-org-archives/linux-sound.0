Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D880BE8
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321131; cv=none; b=roRwOJ+rOz92xcD7vQPHUflJlsn1cV41NAsaaUMtVPCF3n9yq7PlrPnaVQ0X2AcTrFLOx/4T8WRalrlG4AMlhjpnM5S6dFUiaN4iuQrzMZvR+LhvZMX9vMh3OkE22JH5tzGs0T84phn1PuzkB34SgF929r7HDejCv8M3kZP9BuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321131; c=relaxed/simple;
	bh=zn2xnT5ktJlHbqaEKfKnqjynXEckUI9juZ5wJ9rQl5c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mPRXssKTfKXWBpWklXKFnLGK5TJjw1Uhwmco0dIaO5dyoGEa7dSsL72OvBXhg+0w7QWXzW2ctTwTpxs182G1t7OFc+gn9CpmV5y/QBIYiizj3VPv+DdfkNu4k9PTQsLu6BPoy5bdNtiinaED7i4Fg+P/e8GhOjtrdtHPIL6ZWOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SXSTffIF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Som04ng; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SXSTffIF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Som04ng; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SXSTffIF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Som04ng";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SXSTffIF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Som04ng"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 22389222CF;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4KDZHUqFX6qBLv8U1utusalBfBNHsYYgHfcSmeeurQ=;
	b=SXSTffIFnwAjmGrbi4FqBFpVPCylq7WYZ6eX5qcKsy4/FxwMwLB74ZGrnLMiYG0cpp1JmP
	KLjrfqH2Chis1esy+jwX+TcdWMEiP5BbMd43e4NDpWLd1YZ5l8G730ML7A1JHkqKpkdPiL
	QCbawQ8qzPHNqZip6yYhJ/M68Ef9A4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4KDZHUqFX6qBLv8U1utusalBfBNHsYYgHfcSmeeurQ=;
	b=2Som04ngGbKSm2iopIuRWlN/K1Her70Qr5DCdSnCN9/tBaDCWYPxS0nEJs1BsInu5WNeoN
	2nGPeU1mtzVYawAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4KDZHUqFX6qBLv8U1utusalBfBNHsYYgHfcSmeeurQ=;
	b=SXSTffIFnwAjmGrbi4FqBFpVPCylq7WYZ6eX5qcKsy4/FxwMwLB74ZGrnLMiYG0cpp1JmP
	KLjrfqH2Chis1esy+jwX+TcdWMEiP5BbMd43e4NDpWLd1YZ5l8G730ML7A1JHkqKpkdPiL
	QCbawQ8qzPHNqZip6yYhJ/M68Ef9A4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4KDZHUqFX6qBLv8U1utusalBfBNHsYYgHfcSmeeurQ=;
	b=2Som04ngGbKSm2iopIuRWlN/K1Her70Qr5DCdSnCN9/tBaDCWYPxS0nEJs1BsInu5WNeoN
	2nGPeU1mtzVYawAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04CD4139D8;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WGtbOyGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 26/29] ALSA: rme96: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:37 +0100
Message-Id: <20240207155140.18238-27-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SXSTffIF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2Som04ng
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[34.01%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 22389222CF
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

The temporary buffers for PCM stream backups are conditionally
allocated since the sizes aren't too small.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme96.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 6b5ffb18197b..d50ad25574ad 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -220,12 +220,10 @@ struct rme96 {
 
 	u8 rev; /* card revision number */
 
-#ifdef CONFIG_PM_SLEEP
 	u32 playback_pointer;
 	u32 capture_pointer;
 	void *playback_suspend_buffer;
 	void *capture_suspend_buffer;
-#endif
 
 	struct snd_pcm_substream *playback_substream;
 	struct snd_pcm_substream *capture_substream;
@@ -1543,10 +1541,8 @@ snd_rme96_free(struct rme96 *rme96)
 		rme96->areg &= ~RME96_AR_DAC_EN;
 		writel(rme96->areg, rme96->iobase + RME96_IO_ADDITIONAL_REG);
 	}
-#ifdef CONFIG_PM_SLEEP
 	vfree(rme96->playback_suspend_buffer);
 	vfree(rme96->capture_suspend_buffer);
-#endif
 }
 
 static void
@@ -2329,8 +2325,6 @@ snd_rme96_create_switches(struct snd_card *card,
  * Card initialisation
  */
 
-#ifdef CONFIG_PM_SLEEP
-
 static int rme96_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -2392,11 +2386,7 @@ static int rme96_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rme96_pm, rme96_suspend, rme96_resume);
-#define RME96_PM_OPS	&rme96_pm
-#else
-#define RME96_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(rme96_pm, rme96_suspend, rme96_resume);
 
 static void snd_rme96_card_free(struct snd_card *card)
 {
@@ -2432,14 +2422,14 @@ __snd_rme96_probe(struct pci_dev *pci,
 	if (err)
 		return err;
 	
-#ifdef CONFIG_PM_SLEEP
-	rme96->playback_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
-	if (!rme96->playback_suspend_buffer)
-		return -ENOMEM;
-	rme96->capture_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
-	if (!rme96->capture_suspend_buffer)
-		return -ENOMEM;
-#endif
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		rme96->playback_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
+		if (!rme96->playback_suspend_buffer)
+			return -ENOMEM;
+		rme96->capture_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
+		if (!rme96->capture_suspend_buffer)
+			return -ENOMEM;
+	}
 
 	strcpy(card->driver, "Digi96");
 	switch (rme96->pci->device) {
@@ -2483,7 +2473,7 @@ static struct pci_driver rme96_driver = {
 	.id_table = snd_rme96_ids,
 	.probe = snd_rme96_probe,
 	.driver = {
-		.pm = RME96_PM_OPS,
+		.pm = &rme96_pm,
 	},
 };
 
-- 
2.35.3

