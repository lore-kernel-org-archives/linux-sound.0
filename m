Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2A146D55
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262488; cv=none; b=qHVtj675K13QtBbhD4SbA8rDtRYB4tCfLT+VGPQsUZaHW4E5Si/mbsfuO8raYuKMLlQ0u0V4JR9bftAx6t6Ai4COkJz4HjXr/agtkbdyzgKMSfPiJgfjrlc/DzxtKqaLr8i5dKQPpBNywd6DANQNCYwtJJ74yBvVrnrNDeIUMjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262488; c=relaxed/simple;
	bh=3HWLfaUmbQEaPbbgDHdSAUB9XGFkx01stDsM6EeXBlw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ndqOlPp0JDZgHwo7knF2VKSo5yYL8HK/zwCe222sESoD1oMALVdJ6mMWqUd54x9lhkPSig7CEL04auV3uliFM4wmnWn9CKtrvzhgVBzRklFcALo74eVoy6IM+t+p5F6/cq2/u4z0fhS2Lurn9/+h7yZx72fDjOsMRIhBssroiNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A0qsE1Eo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ViB0EW9t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A0qsE1Eo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ViB0EW9t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A0qsE1Eo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ViB0EW9t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A0qsE1Eo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ViB0EW9t"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C3E8821AA3;
	Mon, 29 Jul 2024 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722262484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=peYGFynNeGNJVgYTw0QO97A1mz9QFYx00Et+7SuRk34=;
	b=A0qsE1EoDO8Tr2T0DayZfl3FkAgyATIYI2nBaO1CRCmTdJd/SPSCYb0L8EmzKx0JCptKP3
	XeNnoM2BAOOW2oTarlcGqz9Mp0CcuI4/ZEDdHqDGUNCRE2cSFGl2R8wNcOPxPLmjqn9Nrj
	N4OKWbBBgRwa/G5Gd0mu3MOdxEgmbvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722262484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=peYGFynNeGNJVgYTw0QO97A1mz9QFYx00Et+7SuRk34=;
	b=ViB0EW9t2L1/FCbrD0qi78OsyiNR1o1KrkC6WfkLkYnKfBdZ/DvZ4okvJQTlEYdJ95/qwz
	6KVMB92v7apZjLAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A0qsE1Eo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ViB0EW9t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722262484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=peYGFynNeGNJVgYTw0QO97A1mz9QFYx00Et+7SuRk34=;
	b=A0qsE1EoDO8Tr2T0DayZfl3FkAgyATIYI2nBaO1CRCmTdJd/SPSCYb0L8EmzKx0JCptKP3
	XeNnoM2BAOOW2oTarlcGqz9Mp0CcuI4/ZEDdHqDGUNCRE2cSFGl2R8wNcOPxPLmjqn9Nrj
	N4OKWbBBgRwa/G5Gd0mu3MOdxEgmbvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722262484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=peYGFynNeGNJVgYTw0QO97A1mz9QFYx00Et+7SuRk34=;
	b=ViB0EW9t2L1/FCbrD0qi78OsyiNR1o1KrkC6WfkLkYnKfBdZ/DvZ4okvJQTlEYdJ95/qwz
	6KVMB92v7apZjLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A578D138A7;
	Mon, 29 Jul 2024 14:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T3mTJtSjp2YhZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 14:14:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda: Keep PM disablement for deny-listed instance
Date: Mon, 29 Jul 2024 16:15:16 +0200
Message-ID: <20240729141519.18398-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.81
X-Rspamd-Queue-Id: C3E8821AA3

We have a runtime PM deny-list for the devices that show the problems
(typically click noises) at runtime suspend/resume, and when it
matches, the driver disables the default runtime PM.  However, we
still allow the runtime PM changed via power_save module option
dynamically, and the desktop system often tweaks it.  This ended up
with a re-enablement of the runtime PM that surprises users, suddenly
suffering from the noises.

This patch changes the driver behavior slightly: when the device is
listed in the deny-list, ignore the power_save option change and keep
the original (that is, off) runtime PM state.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 5 ++++-
 sound/pci/hda/hda_intel.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ad474ca9b24e..951ea46824d5 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -933,7 +933,8 @@ static int __maybe_unused param_set_xint(const char *val, const struct kernel_pa
 	mutex_lock(&card_list_lock);
 	list_for_each_entry(hda, &card_list, list) {
 		chip = &hda->chip;
-		if (!hda->probe_continued || chip->disabled)
+		if (!hda->probe_continued || chip->disabled ||
+		    hda->runtime_pm_disabled)
 			continue;
 		snd_hda_set_power_save(&chip->bus, power_save * 1000);
 	}
@@ -2243,6 +2244,7 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 
 static void set_default_power_save(struct azx *chip)
 {
+	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	int val = power_save;
 
 	if (pm_blacklist) {
@@ -2253,6 +2255,7 @@ static void set_default_power_save(struct azx *chip)
 			dev_info(chip->card->dev, "device %04x:%04x is on the power_save denylist, forcing power_save to 0\n",
 				 q->subvendor, q->subdevice);
 			val = 0;
+			hda->runtime_pm_disabled = 1;
 		}
 	}
 	snd_hda_set_power_save(&chip->bus, val * 1000);
diff --git a/sound/pci/hda/hda_intel.h b/sound/pci/hda/hda_intel.h
index 0f39418f9328..2d1725f86ef1 100644
--- a/sound/pci/hda/hda_intel.h
+++ b/sound/pci/hda/hda_intel.h
@@ -22,6 +22,7 @@ struct hda_intel {
 	/* extra flags */
 	unsigned int irq_pending_warned:1;
 	unsigned int probe_continued:1;
+	unsigned int runtime_pm_disabled:1;
 
 	/* vga_switcheroo setup */
 	unsigned int use_vga_switcheroo:1;
-- 
2.43.0

