Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E4146D55
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262490; cv=none; b=NqQnWqkNmif6q7toVZMVLKibAwBRH5g9M1iDi4wHSacb+Nwdv0jKGM3wNvJ7MDMCvX1lVLjL5h50QrtrB+8WQF43UHUMowvBI4hr6ix7ss1myw7hQl9MJcdj3BVp/5RKZ2qy5EJbrbYXBHSsjwsarffa7hxAKMB3cE7Wylzdfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262490; c=relaxed/simple;
	bh=ZmSR7juDTiLbAGNJZn/PyXYsY3XdMCB1RAJXTqWvf+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4tLhWTK3AWpTDMWgWM6bVu/DtS/qI1FBFEODdHs8B0tacL7mXfg2zru9dB8qOG2BgOeS7ylVxQ/qdkkZuC61T+S+cr7dWxV3CM/SLp0RdlhdWgceJ9LvsJXS/0tvX7u5IXMoxeYVYE5ydjA4c3nG/WQfI1isFf9glFolBtUKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YhU7+CvR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S6QnU+M1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YhU7+CvR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S6QnU+M1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YhU7+CvR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S6QnU+M1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YhU7+CvR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S6QnU+M1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1432A1F79C;
	Mon, 29 Jul 2024 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722262487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NIjFwJyJh8JHHkAl6PMWJeNXxGiZ4ZenIAmWSCUIYI=;
	b=YhU7+CvRmNLGK7sTaouUEPbX+NsMDyfsorxENX5YC/VvPwrsjhul//oSLzGfBeoKRgswZZ
	3k0xcapKIJzWQVUb9gA6QZQL8O6tgP5AyXtV7B09sQ1kKgN37EMW5sr8ClB8tKaMku41RD
	E9TWZfC8bsBvtUr9fm89+VQmG60j8iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722262487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NIjFwJyJh8JHHkAl6PMWJeNXxGiZ4ZenIAmWSCUIYI=;
	b=S6QnU+M1wqLdEZRkpwAXeeHXJ69OLJRniwIfpsC1HIsw8LY8pRnpnTfSRg6MSQPLNabMQP
	XIGnKW5MkchK5RBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722262487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NIjFwJyJh8JHHkAl6PMWJeNXxGiZ4ZenIAmWSCUIYI=;
	b=YhU7+CvRmNLGK7sTaouUEPbX+NsMDyfsorxENX5YC/VvPwrsjhul//oSLzGfBeoKRgswZZ
	3k0xcapKIJzWQVUb9gA6QZQL8O6tgP5AyXtV7B09sQ1kKgN37EMW5sr8ClB8tKaMku41RD
	E9TWZfC8bsBvtUr9fm89+VQmG60j8iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722262487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NIjFwJyJh8JHHkAl6PMWJeNXxGiZ4ZenIAmWSCUIYI=;
	b=S6QnU+M1wqLdEZRkpwAXeeHXJ69OLJRniwIfpsC1HIsw8LY8pRnpnTfSRg6MSQPLNabMQP
	XIGnKW5MkchK5RBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDDF7138A7;
	Mon, 29 Jul 2024 14:14:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CFG5ONajp2YhZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 14:14:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: Enhance pm_blacklist option
Date: Mon, 29 Jul 2024 16:15:17 +0200
Message-ID: <20240729141519.18398-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729141519.18398-1-tiwai@suse.de>
References: <20240729141519.18398-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

We want sometimes to keep the runtime PM disabled persistently just
like we did for the PM deny-list in the previous change, e.g. for
testing some buggy device.  This patch enhances the existing
pm_blacklist option for achieving it easily.

The default behavior doesn't change -- the driver looks up the deny
list and disables the runtime PM if matches.  However, when
pm_blacklist=1 option is set, now the driver disables the runtime PM
completely, just like the deny-list does.

Update the documentation for this option, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst |  3 +++
 sound/pci/hda/hda_intel.c                  | 14 ++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 829c672d9fe6..04254474fa04 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -1059,6 +1059,9 @@ power_save
     Automatic power-saving timeout (in second, 0 = disable)
 power_save_controller
     Reset HD-audio controller in power-saving mode (default = on)
+pm_blacklist
+    Enable / disable power-management deny-list (default = look up PM
+    deny-list, 0 = skip PM deny-list, 1 = force to turn off runtime PM)
 align_buffer_size
     Force rounding of buffer/period sizes to multiples of 128 bytes.
     This is more efficient in terms of memory access but isn't
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 951ea46824d5..bf9c9bfd38e3 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -175,8 +175,8 @@ module_param(power_save, xint, 0644);
 MODULE_PARM_DESC(power_save, "Automatic power-saving timeout "
 		 "(in second, 0 = disable).");
 
-static bool pm_blacklist = true;
-module_param(pm_blacklist, bool, 0644);
+static int pm_blacklist = -1;
+module_param(pm_blacklist, bint, 0644);
 MODULE_PARM_DESC(pm_blacklist, "Enable power-management denylist");
 
 /* reset the HD-audio controller in power save mode.
@@ -188,7 +188,7 @@ module_param(power_save_controller, bool, 0644);
 MODULE_PARM_DESC(power_save_controller, "Reset controller in power save mode.");
 #else /* CONFIG_PM */
 #define power_save	0
-#define pm_blacklist	false
+#define pm_blacklist	0
 #define power_save_controller	false
 #endif /* CONFIG_PM */
 
@@ -930,6 +930,9 @@ static int __maybe_unused param_set_xint(const char *val, const struct kernel_pa
 	if (ret || prev == power_save)
 		return ret;
 
+	if (pm_blacklist > 0)
+		return 0;
+
 	mutex_lock(&card_list_lock);
 	list_for_each_entry(hda, &card_list, list) {
 		chip = &hda->chip;
@@ -2247,7 +2250,7 @@ static void set_default_power_save(struct azx *chip)
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	int val = power_save;
 
-	if (pm_blacklist) {
+	if (pm_blacklist < 0) {
 		const struct snd_pci_quirk *q;
 
 		q = snd_pci_quirk_lookup(chip->pci, power_save_denylist);
@@ -2257,6 +2260,9 @@ static void set_default_power_save(struct azx *chip)
 			val = 0;
 			hda->runtime_pm_disabled = 1;
 		}
+	} else if (pm_blacklist > 0) {
+		dev_info(chip->card->dev, "Forcing power_save to 0 via option\n");
+		val = 0;
 	}
 	snd_hda_set_power_save(&chip->bus, val * 1000);
 }
-- 
2.43.0

