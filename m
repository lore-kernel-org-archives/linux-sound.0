Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32FE1C4A03
	for <linux-sound@vger.kernel.org>; Mon,  4 Nov 2024 19:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747153; cv=none; b=K7/lpHDXzsyl1SSUsch/MZ3fd6l5LyrCMG6epWlC0qgtZUCy81lmLCiRcMIWlDNuU+XXTTWlbANt37UyWLZ2wha95Y/6+RMGFoMlhCfS8br2zcYMdQXlMxdwnjz0hW7Db/AwFG7zXMnrimyURRWscT1wTcrDP+I8k8U5bNWl61E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747153; c=relaxed/simple;
	bh=3LOhl08G6PvTYOgeQq5RouYg7fPg314NdpEq/P3BNnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mr/e9aFVsDM82TMLjB2IlsxXzz0VgCBSuhDikU6DkMPJmcLqF3N0Kim3KegsfvliL9y68t0sxgXvpdPI2k0Kw4jIzIIn7AyD2umAZyDR/cgzvi9xIV5drdbrPkCS8WzqNPCyrMH5D9B6N2j0MHyX47Sccuel+R9ZECF5rTf9E2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W2Okv/Hr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8C4w1U1K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W2Okv/Hr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8C4w1U1K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W2Okv/Hr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8C4w1U1K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W2Okv/Hr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8C4w1U1K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C542E21BB7;
	Mon,  4 Nov 2024 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730747149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDHALFWnqYEBUiWw0psD3cTIvlK5m321SnIANjntVFE=;
	b=W2Okv/Hr08XLYw1hWygy5iE7ahzi38kAifDTTXKUjDpY0wIuhxDZBp7Um8j8ZyeyWBW60L
	h9iKyuiQdZbWTa7JQSGrf1R5gnnMJqFcpbJZ8c9cHJK/h4zzUeBD/I8e+IOqDVa58rD5E5
	DywnEldABnbZ2mMTJHDqrOSN/UQENKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730747149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDHALFWnqYEBUiWw0psD3cTIvlK5m321SnIANjntVFE=;
	b=8C4w1U1Ky1uf6J8T3KnMrMgikximUAg4nwdeZgq06dW7skOxETeGMnYtRtYQ5j/Ns+X6Ui
	cUWtejBC0s3NEdDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730747149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDHALFWnqYEBUiWw0psD3cTIvlK5m321SnIANjntVFE=;
	b=W2Okv/Hr08XLYw1hWygy5iE7ahzi38kAifDTTXKUjDpY0wIuhxDZBp7Um8j8ZyeyWBW60L
	h9iKyuiQdZbWTa7JQSGrf1R5gnnMJqFcpbJZ8c9cHJK/h4zzUeBD/I8e+IOqDVa58rD5E5
	DywnEldABnbZ2mMTJHDqrOSN/UQENKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730747149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDHALFWnqYEBUiWw0psD3cTIvlK5m321SnIANjntVFE=;
	b=8C4w1U1Ky1uf6J8T3KnMrMgikximUAg4nwdeZgq06dW7skOxETeGMnYtRtYQ5j/Ns+X6Ui
	cUWtejBC0s3NEdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A54FC13736;
	Mon,  4 Nov 2024 19:05:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fUryJg0bKWdoWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Nov 2024 19:05:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ALSA: hda: Fix unused variable warning
Date: Mon,  4 Nov 2024 20:06:53 +0100
Message-ID: <20241104190654.32216-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The previous code cleanup made a variable not really used, which now
leads to a compile warning.  Let's fix it.

Fixes: cac99f73f075 ("ALSA: hda: intel: Don't free interrupt when suspending")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411050247.3esQz7Am-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index fc329b6a70f5..6e271777feb9 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1039,13 +1039,11 @@ static int azx_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
-	struct hdac_bus *bus;
 
 	if (!azx_is_pm_ready(card))
 		return 0;
 
 	chip = card->private_data;
-	bus = azx_bus(chip);
 	azx_shutdown_chip(chip);
 
 	trace_azx_suspend(chip);
-- 
2.43.0

