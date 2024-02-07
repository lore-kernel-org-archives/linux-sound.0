Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086008063C
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321131; cv=none; b=kzE6x2nVkjs2CN+VOYMc48HlsExkCroTM+RpY0ZFSiKR3mWGyKDCmIgHqnRM7TcR/URb4MNxOxBAXm8zdYLDEoGdHuyZnib6/i5Dm9XTatrLWyggEjlNJ2b0K/p5yEGSvOMQhnpjmwdZxzVG3MmV1f0nqStzQoxLyIqAh7vkhIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321131; c=relaxed/simple;
	bh=kUSahc+1IDWx7cmStE1yAyD98pZzPjAkE3e/SNL1zi8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RMIX5NGE7zG6T4gkvW7HNH9nMOigv9CDAwcEyxM/NuRKbe0Op9mTT5DDhSVTwJU1vKgSXfsX+AUQrcHIdE9nDh+rxffnbfByyPOTq7jgW6faNbbbnaMi0hU5i055yTUs0AqgoIrfXVK4uwd+94x8Qg6ovNJ04ck145RTIP+skYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xbb+96p2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gRh9RWIt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xbb+96p2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gRh9RWIt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xbb+96p2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gRh9RWIt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xbb+96p2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gRh9RWIt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CEC7822338;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YMArDc8aR3Wmg1nRPYI2uXhA5bjCAix4Xp14nbBVn4=;
	b=Xbb+96p2cyB3GfhsDIV8Gf1132nd0tQ91wurPkGiVHQMtMNkyiHbcmNbbA6z1J9hPmIXdl
	I07eOcTrySF7mtC6L0tHNh2A/AMZyt5FKskVzFKjAGZZZE54Zr+FqIrnRtB73x9eEj2B19
	+ibQTbRW21LLzChwdN4SM31kph8PVZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YMArDc8aR3Wmg1nRPYI2uXhA5bjCAix4Xp14nbBVn4=;
	b=gRh9RWItTUrNZtSzsGvnpu1WyM1dbLCt75RmyfvtixwG8gpdKSDE6C0OYzOp1BsQtMrTxg
	oNbPiTUuz2ScgNCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YMArDc8aR3Wmg1nRPYI2uXhA5bjCAix4Xp14nbBVn4=;
	b=Xbb+96p2cyB3GfhsDIV8Gf1132nd0tQ91wurPkGiVHQMtMNkyiHbcmNbbA6z1J9hPmIXdl
	I07eOcTrySF7mtC6L0tHNh2A/AMZyt5FKskVzFKjAGZZZE54Zr+FqIrnRtB73x9eEj2B19
	+ibQTbRW21LLzChwdN4SM31kph8PVZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YMArDc8aR3Wmg1nRPYI2uXhA5bjCAix4Xp14nbBVn4=;
	b=gRh9RWItTUrNZtSzsGvnpu1WyM1dbLCt75RmyfvtixwG8gpdKSDE6C0OYzOp1BsQtMrTxg
	oNbPiTUuz2ScgNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE283139D8;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WN8NKSGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 24/29] ALSA: maestro3: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:35 +0100
Message-Id: <20240207155140.18238-25-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xbb+96p2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gRh9RWIt
X-Spamd-Result: default: False [4.68 / 50.00];
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
	 BAYES_HAM(-0.01)[51.33%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.68
X-Rspamd-Queue-Id: CEC7822338
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

The area for register dump is conditionally allocated instead of
ifdef now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 305cbd24a391..f4d211970d7e 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -769,9 +769,7 @@ struct snd_m3 {
 
 	unsigned int in_suspend;
 
-#ifdef CONFIG_PM_SLEEP
 	u16 *suspend_mem;
-#endif
 
 	const struct firmware *assp_kernel_image;
 	const struct firmware *assp_minisrc_image;
@@ -2354,9 +2352,7 @@ static void snd_m3_free(struct snd_card *card)
 		outw(0, chip->iobase + HOST_INT_CTRL); /* disable ints */
 	}
 
-#ifdef CONFIG_PM_SLEEP
 	vfree(chip->suspend_mem);
-#endif
 	release_firmware(chip->assp_kernel_image);
 	release_firmware(chip->assp_minisrc_image);
 }
@@ -2365,7 +2361,6 @@ static void snd_m3_free(struct snd_card *card)
 /*
  * APM support
  */
-#ifdef CONFIG_PM_SLEEP
 static int m3_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -2439,11 +2434,7 @@ static int m3_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(m3_pm, m3_suspend, m3_resume);
-#define M3_PM_OPS	&m3_pm
-#else
-#define M3_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(m3_pm, m3_suspend, m3_resume);
 
 #ifdef CONFIG_SND_MAESTRO3_INPUT
 static int snd_m3_input_register(struct snd_m3 *chip)
@@ -2587,14 +2578,14 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-#ifdef CONFIG_PM_SLEEP
-	chip->suspend_mem =
-		vmalloc(array_size(sizeof(u16),
-				   REV_B_CODE_MEMORY_LENGTH +
-					REV_B_DATA_MEMORY_LENGTH));
-	if (chip->suspend_mem == NULL)
-		dev_warn(card->dev, "can't allocate apm buffer\n");
-#endif
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		chip->suspend_mem =
+			vmalloc(array_size(sizeof(u16),
+					   REV_B_CODE_MEMORY_LENGTH +
+					   REV_B_DATA_MEMORY_LENGTH));
+		if (!chip->suspend_mem)
+			dev_warn(card->dev, "can't allocate apm buffer\n");
+	}
 
 	err = snd_m3_mixer(chip);
 	if (err < 0)
@@ -2706,7 +2697,7 @@ static struct pci_driver m3_driver = {
 	.id_table = snd_m3_ids,
 	.probe = snd_m3_probe,
 	.driver = {
-		.pm = M3_PM_OPS,
+		.pm = &m3_pm,
 	},
 };
 	
-- 
2.35.3

