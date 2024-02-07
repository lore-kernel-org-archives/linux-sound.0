Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59680032
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321122; cv=none; b=BMdfIV3ilPqzIPRUXn19oZ0uveHIlbvI8g96fTpWfdHBYRThwUpfuxbulo082+tH3OmbRgcTvLQv2heTIEm90oE6RtgVh0oN/YTfyaeSLpPmZRPuqqps76bdHSepiHPdXSZl1jJzVq5XI+Gx+p5gDhWVvD9HE8GjCs/Vkb1xXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321122; c=relaxed/simple;
	bh=suTSG/dbWKYnEU9XeJ8a7XBHsIicW4CmlW1q6Wraiog=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZVYES7TVj0uggvVMhDVuB+zmSE0yI/hjJ9uFpXw+ko/5lWjYpsD4r1/PRh883m/iFaXls8e+tTEfBU4yEzriHZ+vWPfNz9HGTUlBitRWsIE1R5y637L64p033jYtlIIKHsK4SzPquEDZNW96Izi7TMYt3leVSnpVyP96+W5SaKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MoPfLlFl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f8Zwoibb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MoPfLlFl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f8Zwoibb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MoPfLlFl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f8Zwoibb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MoPfLlFl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f8Zwoibb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0DA3922330;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/N2qFa1jWdoTGrVKVWyK/iNILxA4QtZ77MGOkz6cMI=;
	b=MoPfLlFlq/PdYUFBbA9T31hY2k7l3VGrLurOqb6MCz30MiyvROyQqfU2osHnZN7bPX1BNl
	YfBuogqkpGQtLM20cfKmjFyz0nTQ5x63e1IGKfSwpgaGTAbqdvjmbhe37wP4ezPmToOFr8
	7Ym0qaaNXcBvDrxTi9ggpQxwftjUmFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/N2qFa1jWdoTGrVKVWyK/iNILxA4QtZ77MGOkz6cMI=;
	b=f8ZwoibbZvg0ho7YEoq3BLX0di5UGynYMqqBEj9TnVYohnk1J/azH3Rkh+mKz9VNBPvSSB
	L/rIFbWZko92r7CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/N2qFa1jWdoTGrVKVWyK/iNILxA4QtZ77MGOkz6cMI=;
	b=MoPfLlFlq/PdYUFBbA9T31hY2k7l3VGrLurOqb6MCz30MiyvROyQqfU2osHnZN7bPX1BNl
	YfBuogqkpGQtLM20cfKmjFyz0nTQ5x63e1IGKfSwpgaGTAbqdvjmbhe37wP4ezPmToOFr8
	7Ym0qaaNXcBvDrxTi9ggpQxwftjUmFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/N2qFa1jWdoTGrVKVWyK/iNILxA4QtZ77MGOkz6cMI=;
	b=f8ZwoibbZvg0ho7YEoq3BLX0di5UGynYMqqBEj9TnVYohnk1J/azH3Rkh+mKz9VNBPvSSB
	L/rIFbWZko92r7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4FFF139B9;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4N5pNh6nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/29] ALSA: ens137x: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:18 +0100
Message-Id: <20240207155140.18238-8-tiwai@suse.de>
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
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[33.52%]
X-Spam-Flag: NO

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

For building properly, add the dummy functions for
snd_ak4531_suspend/resume() functions, too.

Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ak4531_codec.h | 3 +++
 sound/pci/ens1370.c          | 9 ++-------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/sound/ak4531_codec.h b/include/sound/ak4531_codec.h
index 9a4429970d92..64402347d7a2 100644
--- a/include/sound/ak4531_codec.h
+++ b/include/sound/ak4531_codec.h
@@ -65,6 +65,9 @@ int snd_ak4531_mixer(struct snd_card *card, struct snd_ak4531 *_ak4531,
 #ifdef CONFIG_PM
 void snd_ak4531_suspend(struct snd_ak4531 *ak4531);
 void snd_ak4531_resume(struct snd_ak4531 *ak4531);
+#else
+static inline void snd_ak4531_suspend(struct snd_ak4531 *ak4531) {}
+static inline void snd_ak4531_resume(struct snd_ak4531 *ak4531) {}
 #endif
 
 #endif /* __SOUND_AK4531_CODEC_H */
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 89210b2c7342..18928b905939 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1968,7 +1968,6 @@ static void snd_ensoniq_chip_init(struct ensoniq *ensoniq)
 	outl(ensoniq->cssr, ES_REG(ensoniq, STATUS));
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_ensoniq_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -2007,11 +2006,7 @@ static int snd_ensoniq_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_ensoniq_pm, snd_ensoniq_suspend, snd_ensoniq_resume);
-#define SND_ENSONIQ_PM_OPS	&snd_ensoniq_pm
-#else
-#define SND_ENSONIQ_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_ensoniq_pm, snd_ensoniq_suspend, snd_ensoniq_resume);
 
 static int snd_ensoniq_create(struct snd_card *card,
 			      struct pci_dev *pci)
@@ -2380,7 +2375,7 @@ static struct pci_driver ens137x_driver = {
 	.id_table = snd_audiopci_ids,
 	.probe = snd_audiopci_probe,
 	.driver = {
-		.pm = SND_ENSONIQ_PM_OPS,
+		.pm = &snd_ensoniq_pm,
 	},
 };
 	
-- 
2.35.3

