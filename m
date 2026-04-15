Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0FD3CEB99
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261337; cv=none; b=kDQYJpTAs/DMAQqG2xVt3rmOed2t9wxaAik6Sgq0xkpOGEqWqlRd2UTZVlYnhAoMAuwl97hDRCGkyH72n2sBUMGqgFgagO52FnvvR8RQGtgri6rJNV7vijLvyNhWpxfTJRyazGIlOiEc5Hm90XL5avnfZKL6hfqglAEJFibztEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261337; c=relaxed/simple;
	bh=vvtOfeDp8W5WMWzXXmdzEYaHB2N0HKq8Bfy5qB/u6bc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=r7hIMIzAYgTg3SinQmqMb0Mlusl3pOYT/o/V5dipKwW7Hyq7LqZ7iUExGIGcRmy2fQSqhCp7fcp92xxeD49CLfKDr9kKgOvp16RCOdFEdV/WgGkDvOg/gSeFAnii2bMpD9y+fJZ0AAZRYSLuwmozbDTof6e/euuxeWKq5LuHgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VmzaHsaZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xlwdUrnp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VmzaHsaZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xlwdUrnp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VmzaHsaZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xlwdUrnp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VmzaHsaZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xlwdUrnp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84B5A5BDD0;
	Wed, 15 Apr 2026 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776261332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWxvKYSveEn5HcrA0cI62t+S2LjuGkMZ86DgIwmsfQM=;
	b=VmzaHsaZFSlXrw9m7Jp2/P/WIBPUTTv1fS8hrnM3Xo6BDPwxyu/PKzLiXb8e8n1LbM8XM1
	wUn31xC9Jor8AYNZL0Hl389oqBMOiFHqLa8mhgVxv2xImZ8d2l1wbhycySdAJtSDfc5bRC
	1SD5lmQ9NDZ9fK42QwQcDoul4ahubO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776261332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWxvKYSveEn5HcrA0cI62t+S2LjuGkMZ86DgIwmsfQM=;
	b=xlwdUrnp9ukF7RoxQkGzYTtUqZQk1/70U0f2qTrAvohFargXHYkR5lxQhs82uaKQaEypKU
	EVOnjNTduIeqZrCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VmzaHsaZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xlwdUrnp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776261332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWxvKYSveEn5HcrA0cI62t+S2LjuGkMZ86DgIwmsfQM=;
	b=VmzaHsaZFSlXrw9m7Jp2/P/WIBPUTTv1fS8hrnM3Xo6BDPwxyu/PKzLiXb8e8n1LbM8XM1
	wUn31xC9Jor8AYNZL0Hl389oqBMOiFHqLa8mhgVxv2xImZ8d2l1wbhycySdAJtSDfc5bRC
	1SD5lmQ9NDZ9fK42QwQcDoul4ahubO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776261332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gWxvKYSveEn5HcrA0cI62t+S2LjuGkMZ86DgIwmsfQM=;
	b=xlwdUrnp9ukF7RoxQkGzYTtUqZQk1/70U0f2qTrAvohFargXHYkR5lxQhs82uaKQaEypKU
	EVOnjNTduIeqZrCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 717734BA3C;
	Wed, 15 Apr 2026 13:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RODyGtSY32k8fwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Apr 2026 13:55:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/intel: Move firmware loading into the probe work
Date: Wed, 15 Apr 2026 15:55:22 +0200
Message-ID: <20260415135526.1813126-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 84B5A5BDD0
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The hda-intel driver uses request_firmware_nowait() for loading its
patch, and tries to continue the probe directly from the fw loader
callback.  This works in principle, but it has a few drawbacks:

- The driver may be released before the firmware callback completes
- Having two ways of async probe makes the code flow unnecessarily
  complex

The former issue is more severe, as it may potentially lead to a UAF,
and there is no explicit way to cancel the pending firmware worker
for now.

This patch changes the firmware loading to be performed rather in the
common probe work without *_nowait().  Then the pending work can be
easily canceled, and the code becomes more straightforward.

A nice bonus is that, by moving into the probe work, the firmware
doesn't need any longer to be cached, hence we can get rid of struct
azx.fw field, and release the firmware immediately after parsing it,
too.

Fixes: 5cb543dba986 ("ALSA: hda - Deferred probing with request_firmware_nowait()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/hda_controller.h |  4 ---
 sound/hda/controllers/intel.c     | 58 ++++++++-----------------------
 2 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/sound/hda/common/hda_controller.h b/sound/hda/common/hda_controller.h
index c2d0109866e6..7434f38038a0 100644
--- a/sound/hda/common/hda_controller.h
+++ b/sound/hda/common/hda_controller.h
@@ -127,10 +127,6 @@ struct azx {
 	unsigned int beep_mode;
 	bool ctl_dev_id;
 
-#ifdef CONFIG_SND_HDA_PATCH_LOADER
-	const struct firmware *fw;
-#endif
-
 	/* flags */
 	int bdl_pos_adj;
 	unsigned int running:1;
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 257c498c3260..c87d75dbd8aa 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1385,9 +1385,6 @@ static void azx_free(struct azx *chip)
 	azx_free_streams(chip);
 	snd_hdac_bus_exit(bus);
 
-#ifdef CONFIG_SND_HDA_PATCH_LOADER
-	release_firmware(chip->fw);
-#endif
 	display_power(chip, false);
 
 	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT)
@@ -2037,24 +2034,6 @@ static int azx_first_init(struct azx *chip)
 	return 0;
 }
 
-#ifdef CONFIG_SND_HDA_PATCH_LOADER
-/* callback from request_firmware_nowait() */
-static void azx_firmware_cb(const struct firmware *fw, void *context)
-{
-	struct snd_card *card = context;
-	struct azx *chip = card->private_data;
-
-	if (fw)
-		chip->fw = fw;
-	else
-		dev_err(card->dev, "Cannot load firmware, continue without patching\n");
-	if (!chip->disabled) {
-		/* continue probing */
-		azx_probe_continue(chip);
-	}
-}
-#endif
-
 static int disable_msi_reset_irq(struct azx *chip)
 {
 	struct hdac_bus *bus = azx_bus(chip);
@@ -2131,7 +2110,6 @@ static int azx_probe(struct pci_dev *pci,
 	struct snd_card *card;
 	struct hda_intel *hda;
 	struct azx *chip;
-	bool schedule_probe;
 	int dev;
 	int err;
 
@@ -2227,22 +2205,7 @@ static int azx_probe(struct pci_dev *pci,
 		chip->disabled = true;
 	}
 
-	schedule_probe = !chip->disabled;
-
-#ifdef CONFIG_SND_HDA_PATCH_LOADER
-	if (patch[dev] && *patch[dev]) {
-		dev_info(card->dev, "Applying patch firmware '%s'\n",
-			 patch[dev]);
-		err = request_firmware_nowait(THIS_MODULE, true, patch[dev],
-					      &pci->dev, GFP_KERNEL, card,
-					      azx_firmware_cb);
-		if (err < 0)
-			goto out_free;
-		schedule_probe = false; /* continued in azx_firmware_cb() */
-	}
-#endif /* CONFIG_SND_HDA_PATCH_LOADER */
-
-	if (schedule_probe)
+	if (!chip->disabled)
 		schedule_delayed_work(&hda->probe_work, 0);
 
 	set_bit(dev, probed_devs);
@@ -2371,11 +2334,20 @@ static int azx_probe_continue(struct azx *chip)
 	}
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
-	if (chip->fw) {
-		err = snd_hda_load_patch(&chip->bus, chip->fw->size,
-					 chip->fw->data);
-		if (err < 0)
-			goto out_free;
+	if (patch[dev] && *patch[dev]) {
+		const struct firmware *fw = NULL;
+
+		dev_info(&pci->dev, "Applying patch firmware '%s'\n",
+			 patch[dev]);
+		if (request_firmware(&fw, patch[dev], &pci->dev) < 0) {
+			dev_err(&pci->dev,
+				"Cannot load firmware, continue without patching\n");
+		} else {
+			err = snd_hda_load_patch(&chip->bus, fw->size, fw->data);
+			release_firmware(fw);
+			if (err < 0)
+				goto out_free;
+		}
 	}
 #endif
 
-- 
2.53.0

