Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2F8005D
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321131; cv=none; b=q+25FN03iI0FzBFrLwX/kJ/UkkBhySdoTd5zN3C/MBnqwe1Ky6eUIC5cMBDG+de2Zjzjzf8uB8teXUf7oLFjbOXppdMF3yFrXogeZ4Voqq3WER2ru8FReLvpJeXNCqFHnNB+hDAQwpSs/fIKMCQaOPjlX3NfJaPI+J7u7Ahigiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321131; c=relaxed/simple;
	bh=LiGTHVfxQWmQFA39jq5dthx5eSYgVqWK1qRf8ZiuijI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q00ig8xtvDkew4+RipNOwooOFaxzYemue1h/BjutquLbz2I/zpuELvm1eTP235FfXvvN9Khi2yn7gYt39TT3+7fAnrBkSh5mShxQqirr7iPkZrm2tzJBLyAOpYPVaTb5tQ42FMfjmuCbJqeOybnXbdRKrrmEePVZ80baPh5WjHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilGHbvVe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fCkiIYk7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilGHbvVe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fCkiIYk7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilGHbvVe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fCkiIYk7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilGHbvVe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fCkiIYk7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B6352233A;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OO1Zz3kgy1EvVqAS2uodh90ZoX0RTFNfkVwA2IR3Vfk=;
	b=ilGHbvVehs3cCmA7/b0wJTwRIRncID+3NzQALSvLKza44Zy/P/boyt+PtZrdLLbkMfZYB5
	NyGJA2n3Ms3TTsXVkW1AzxyVEmwnbzstDQ598UiTvlM1saTq4Ga1GY44d8BLsIwVz/rMY7
	1e+F6XqFwKmqUv3FakraNDw4kfO7Fzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OO1Zz3kgy1EvVqAS2uodh90ZoX0RTFNfkVwA2IR3Vfk=;
	b=fCkiIYk7gdKJMd9YRrpQc3Z+/G/GrILFJtfzx4quyTHlzgRIhpQyKB9DbaN9xh6jBRDeH6
	dqFat+JhOtJdgcAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OO1Zz3kgy1EvVqAS2uodh90ZoX0RTFNfkVwA2IR3Vfk=;
	b=ilGHbvVehs3cCmA7/b0wJTwRIRncID+3NzQALSvLKza44Zy/P/boyt+PtZrdLLbkMfZYB5
	NyGJA2n3Ms3TTsXVkW1AzxyVEmwnbzstDQ598UiTvlM1saTq4Ga1GY44d8BLsIwVz/rMY7
	1e+F6XqFwKmqUv3FakraNDw4kfO7Fzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OO1Zz3kgy1EvVqAS2uodh90ZoX0RTFNfkVwA2IR3Vfk=;
	b=fCkiIYk7gdKJMd9YRrpQc3Z+/G/GrILFJtfzx4quyTHlzgRIhpQyKB9DbaN9xh6jBRDeH6
	dqFat+JhOtJdgcAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EE10139B9;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCnWESKnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 28/29] ALSA: via82xx: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:39 +0100
Message-Id: <20240207155140.18238-29-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ilGHbvVe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fCkiIYk7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
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
	 BAYES_HAM(-0.00)[25.55%]
X-Spam-Score: -0.01
X-Rspamd-Queue-Id: 6B6352233A
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
state dumps even if it's not really used, but the code simplification
should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 15 ++-------------
 sound/pci/via82xx_modem.c |  9 ++-------
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index d8666ff7bdfa..89838b4fb118 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -347,13 +347,11 @@ struct via82xx {
 
 	unsigned char old_legacy;
 	unsigned char old_legacy_cfg;
-#ifdef CONFIG_PM_SLEEP
 	unsigned char legacy_saved;
 	unsigned char legacy_cfg_saved;
 	unsigned char spdif_ctrl_saved;
 	unsigned char capture_src_saved[2];
 	unsigned int mpu_port_saved;
-#endif
 
 	unsigned char playback_volume[4][2]; /* for VIA8233/C/8235; default = 0 */
 	unsigned char playback_volume_c[2]; /* for VIA8233/C/8235; default = 0 */
@@ -2031,9 +2029,7 @@ static int snd_via686_init_misc(struct via82xx *chip)
 		if (mpu_port >= 0x200) {	/* force MIDI */
 			mpu_port &= 0xfffc;
 			pci_write_config_dword(chip->pci, 0x18, mpu_port | 0x01);
-#ifdef CONFIG_PM_SLEEP
 			chip->mpu_port_saved = mpu_port;
-#endif
 		} else {
 			mpu_port = pci_resource_start(chip->pci, 2);
 		}
@@ -2085,10 +2081,8 @@ static int snd_via686_init_misc(struct via82xx *chip)
 
 	snd_via686_create_gameport(chip, &legacy);
 
-#ifdef CONFIG_PM_SLEEP
 	chip->legacy_saved = legacy;
 	chip->legacy_cfg_saved = legacy_cfg;
-#endif
 
 	return 0;
 }
@@ -2234,7 +2228,6 @@ static int snd_via82xx_chip_init(struct via82xx *chip)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -2287,11 +2280,7 @@ static int snd_via82xx_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_via82xx_pm, snd_via82xx_suspend, snd_via82xx_resume);
-#define SND_VIA82XX_PM_OPS	&snd_via82xx_pm
-#else
-#define SND_VIA82XX_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_via82xx_pm, snd_via82xx_suspend, snd_via82xx_resume);
 
 static void snd_via82xx_free(struct snd_card *card)
 {
@@ -2576,7 +2565,7 @@ static struct pci_driver via82xx_driver = {
 	.id_table = snd_via82xx_ids,
 	.probe = snd_via82xx_probe,
 	.driver = {
-		.pm = SND_VIA82XX_PM_OPS,
+		.pm = &snd_via82xx_pm,
 	},
 };
 
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index ca7f024bf8ec..a0a49b8d1511 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1008,7 +1008,6 @@ static int snd_via82xx_chip_init(struct via82xx_modem *chip)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -1042,11 +1041,7 @@ static int snd_via82xx_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_via82xx_pm, snd_via82xx_suspend, snd_via82xx_resume);
-#define SND_VIA82XX_PM_OPS	&snd_via82xx_pm
-#else
-#define SND_VIA82XX_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_via82xx_pm, snd_via82xx_suspend, snd_via82xx_resume);
 
 static void snd_via82xx_free(struct snd_card *card)
 {
@@ -1168,7 +1163,7 @@ static struct pci_driver via82xx_modem_driver = {
 	.id_table = snd_via82xx_modem_ids,
 	.probe = snd_via82xx_probe,
 	.driver = {
-		.pm = SND_VIA82XX_PM_OPS,
+		.pm = &snd_via82xx_pm,
 	},
 };
 
-- 
2.35.3

