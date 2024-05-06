Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F46155757
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012033; cv=none; b=K1+/SHisCHGeWA1KAyGHuwkzv/zrXnIq0ivOG7ip0oORZehwxiLjRKhXR/uj9mD1yIN/VWrL8YBTlibOQXcmSQALlzQy7tVtabFh90peqjINQ931VFOw1CVguDiifJg8z2DkR+5wGQ+6ANsEMC1k0Ek0xpT0yOWW/E9P94YBM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012033; c=relaxed/simple;
	bh=Jt9owUMs0yD9snXK08xVvHlCYzeMe1nvtxH2sOVCTL8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdTMCG/ZlBDN5Reyw7RNlRiugqMZy/6EW81HC6jCu1wC/sLBNCqrJH/AIOljp8ce619FM7gkFX3aS6SmAHrcccK4H8asRY1jMFMEzQIXCks//ERsW4ipQLHOtaDP3VpJEzgzMJ1ZA9bV0NkkATWNiciNjLeLBwB47qBfKPntZto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jTX3rHya; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3akVls27; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jTX3rHya; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3akVls27; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jTX3rHya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3akVls27";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jTX3rHya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3akVls27"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 827E31F79B;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ik1gmx8DUckXSti25lP4/S7Tif7RaevTKn46eIF8tZY=;
	b=jTX3rHyady/pa6OqjCg3wKzcMVOSoKostiAtgkZjziCnVluRUD25ZiDlltQpL3rgb4Xa4j
	VJY0ultQtmJNvhca+DCKgyVZq2Ha5LHaZtqydOgVD2iI/MOnahN9fU5zTJ5CTleojzFgjB
	pPTUk741s2MihePG4673rpGU1hgMzXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ik1gmx8DUckXSti25lP4/S7Tif7RaevTKn46eIF8tZY=;
	b=3akVls276qWxqrAvAK62CPnrezm/21wcPPK35iaIjwzhslVKwcl4Y+tj6IkNKmHPRi7EYd
	g9HkGuadsmMD54Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jTX3rHya;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3akVls27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ik1gmx8DUckXSti25lP4/S7Tif7RaevTKn46eIF8tZY=;
	b=jTX3rHyady/pa6OqjCg3wKzcMVOSoKostiAtgkZjziCnVluRUD25ZiDlltQpL3rgb4Xa4j
	VJY0ultQtmJNvhca+DCKgyVZq2Ha5LHaZtqydOgVD2iI/MOnahN9fU5zTJ5CTleojzFgjB
	pPTUk741s2MihePG4673rpGU1hgMzXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ik1gmx8DUckXSti25lP4/S7Tif7RaevTKn46eIF8tZY=;
	b=3akVls276qWxqrAvAK62CPnrezm/21wcPPK35iaIjwzhslVKwcl4Y+tj6IkNKmHPRi7EYd
	g9HkGuadsmMD54Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 669B113A31;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MFLeF70BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/12] ALSA: hda: intel: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:44 +0200
Message-ID: <20240506161359.6960-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 827E31F79B
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

snd-hda-intel contains lots of CONFIG_PM dependent code although
CONFIG_PM is almost mandatory nowadays, and it makes the code
unnecessarily complex.

Let's reduce the dependencies of CONFIG_PM in snd-hda-intel driver
code.  I left a few module options to be dependent on CONFIG_PM (which
are visible to users), but other places are either enabled or
optimized by compiler automatically.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c       | 46 ++++++++++-----------------------
 sound/pci/hda/hda_intel_trace.h |  2 --
 2 files changed, 14 insertions(+), 34 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 1b550c42db09..31b0c954b0c8 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -186,8 +186,10 @@ MODULE_PARM_DESC(pm_blacklist, "Enable power-management denylist");
 static bool power_save_controller = 1;
 module_param(power_save_controller, bool, 0644);
 MODULE_PARM_DESC(power_save_controller, "Reset controller in power save mode.");
-#else
+#else /* CONFIG_PM */
 #define power_save	0
+#define pm_blacklist	false
+#define power_save_controller	false
 #endif /* CONFIG_PM */
 
 static int align_buffer_size = -1;
@@ -890,7 +892,6 @@ static void __azx_shutdown_chip(struct azx *chip, bool skip_link_reset)
 	display_power(chip, false);
 }
 
-#ifdef CONFIG_PM
 static DEFINE_MUTEX(card_list_lock);
 static LIST_HEAD(card_list);
 
@@ -916,7 +917,7 @@ static void azx_del_card_list(struct azx *chip)
 }
 
 /* trigger power-save check at writing parameter */
-static int param_set_xint(const char *val, const struct kernel_param *kp)
+static int __maybe_unused param_set_xint(const char *val, const struct kernel_param *kp)
 {
 	struct hda_intel *hda;
 	struct azx *chip;
@@ -987,7 +988,6 @@ static void __azx_runtime_resume(struct azx *chip)
 		display_power(chip, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int azx_prepare(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -1046,7 +1046,7 @@ static int azx_suspend(struct device *dev)
 	return 0;
 }
 
-static int azx_resume(struct device *dev)
+static int __maybe_unused azx_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1097,9 +1097,8 @@ static int azx_thaw_noirq(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static int azx_runtime_suspend(struct device *dev)
+static int __maybe_unused azx_runtime_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1116,7 +1115,7 @@ static int azx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int azx_runtime_resume(struct device *dev)
+static int __maybe_unused azx_runtime_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1133,7 +1132,7 @@ static int azx_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int azx_runtime_idle(struct device *dev)
+static int __maybe_unused azx_runtime_idle(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1159,23 +1158,14 @@ static int azx_runtime_idle(struct device *dev)
 }
 
 static const struct dev_pm_ops azx_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(azx_suspend, azx_resume)
-#ifdef CONFIG_PM_SLEEP
-	.prepare = azx_prepare,
-	.complete = azx_complete,
-	.freeze_noirq = azx_freeze_noirq,
-	.thaw_noirq = azx_thaw_noirq,
-#endif
+	SYSTEM_SLEEP_PM_OPS(azx_suspend, azx_resume)
+	.prepare = pm_sleep_ptr(azx_prepare),
+	.complete = pm_sleep_ptr(azx_complete),
+	.freeze_noirq = pm_sleep_ptr(azx_freeze_noirq),
+	.thaw_noirq = pm_sleep_ptr(azx_thaw_noirq),
 	SET_RUNTIME_PM_OPS(azx_runtime_suspend, azx_runtime_resume, azx_runtime_idle)
 };
 
-#define AZX_PM_OPS	&azx_pm
-#else
-#define azx_add_card_list(chip) /* NOP */
-#define azx_del_card_list(chip) /* NOP */
-#define AZX_PM_OPS	NULL
-#endif /* CONFIG_PM */
-
 
 static int azx_probe_continue(struct azx *chip);
 
@@ -2206,7 +2196,6 @@ static int azx_probe(struct pci_dev *pci,
 	return err;
 }
 
-#ifdef CONFIG_PM
 /* On some boards setting power_save to a non 0 value leads to clicking /
  * popping sounds when ever we enter/leave powersaving mode. Ideally we would
  * figure out how to avoid these sounds, but that is not always feasible.
@@ -2248,13 +2237,11 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x1734, 0x1232, "KONTRON SinglePC", 0),
 	{}
 };
-#endif /* CONFIG_PM */
 
 static void set_default_power_save(struct azx *chip)
 {
 	int val = power_save;
 
-#ifdef CONFIG_PM
 	if (pm_blacklist) {
 		const struct snd_pci_quirk *q;
 
@@ -2265,7 +2252,6 @@ static void set_default_power_save(struct azx *chip)
 			val = 0;
 		}
 	}
-#endif /* CONFIG_PM */
 	snd_hda_set_power_save(&chip->bus, val * 1000);
 }
 
@@ -2321,10 +2307,6 @@ static int azx_probe_continue(struct azx *chip)
 					 chip->fw->data);
 		if (err < 0)
 			goto out_free;
-#ifndef CONFIG_PM
-		release_firmware(chip->fw); /* no longer needed */
-		chip->fw = NULL;
-#endif
 	}
 #endif
 
@@ -2765,7 +2747,7 @@ static struct pci_driver azx_driver = {
 	.remove = azx_remove,
 	.shutdown = azx_shutdown,
 	.driver = {
-		.pm = AZX_PM_OPS,
+		.pm = &azx_pm,
 	},
 };
 
diff --git a/sound/pci/hda/hda_intel_trace.h b/sound/pci/hda/hda_intel_trace.h
index 73a7adfa192d..2775fa81a500 100644
--- a/sound/pci/hda/hda_intel_trace.h
+++ b/sound/pci/hda/hda_intel_trace.h
@@ -34,7 +34,6 @@ DEFINE_EVENT(hda_pm, azx_resume,
 	TP_ARGS(chip)
 );
 
-#ifdef CONFIG_PM
 DEFINE_EVENT(hda_pm, azx_runtime_suspend,
 	TP_PROTO(struct azx *chip),
 	TP_ARGS(chip)
@@ -44,7 +43,6 @@ DEFINE_EVENT(hda_pm, azx_runtime_resume,
 	TP_PROTO(struct azx *chip),
 	TP_ARGS(chip)
 );
-#endif
 
 #endif /* _TRACE_HDA_INTEL_H */
 
-- 
2.43.0

