Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DAE26A08D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885672; cv=none; b=fSLn1hLFoJK60/NpsqWcUHJkHSZmQxpP3VNOnbJXsn37T4kZZbQ8OjzYq8fFviDZLVDmM94FsQ99D4F1TlfrsNFgcOAomcjEfPxpZ8vBK5vNG5r14Wz9azspqvGTMdtjNFVs74nBq8MLS3rvlxSDhllllmtRxTyp8PR/r/Lp/EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885672; c=relaxed/simple;
	bh=yWh8onOsUP+msLCgKqQTFCoUleraxwGOCtZOmzYim1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPE5icac+RxXqdBzCfgSOcMgeHezNulOfhEwiNS1lIeo48oH+CE5lYhwHf58aYL7TJLff8iJM8BbKGRtKVOfAchrqtBK++KC+M1pdEhISXkzyiUDdxTgpsNpaZ5izuXFr8dCZNeuktqsd+2ALXlEK3Hru8+YMtL1hHG69LrNvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WFWqpt1M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0revYGCT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WFWqpt1M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0revYGCT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WFWqpt1M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0revYGCT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WFWqpt1M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0revYGCT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADAF821189;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvt2hXDQpTiH1eaBRFxi87qlpn106cpNfZDGUPR/Ls0=;
	b=WFWqpt1MNJ24pG7AhHwe1igNwb8+JUgibWxIa73wLYpQQZ8pHnRywy9y+M2EcIiPs9703Z
	h59DmZ86foLcLO+1SesaVZGOdNijO1y2X/E7pD634P/MkaH7eeW9pP/1EOkHVrWH/BFTr9
	GtL60QiQEwUpgWXO2LPUDe8k4yD2TYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvt2hXDQpTiH1eaBRFxi87qlpn106cpNfZDGUPR/Ls0=;
	b=0revYGCTAKIL3jpbXnpzkYxRNfbR0fY2MZkKtsNKsYv3r205UNdZ+aL6dVWBunX30ukQM5
	UweEL6M+WydY75Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvt2hXDQpTiH1eaBRFxi87qlpn106cpNfZDGUPR/Ls0=;
	b=WFWqpt1MNJ24pG7AhHwe1igNwb8+JUgibWxIa73wLYpQQZ8pHnRywy9y+M2EcIiPs9703Z
	h59DmZ86foLcLO+1SesaVZGOdNijO1y2X/E7pD634P/MkaH7eeW9pP/1EOkHVrWH/BFTr9
	GtL60QiQEwUpgWXO2LPUDe8k4yD2TYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvt2hXDQpTiH1eaBRFxi87qlpn106cpNfZDGUPR/Ls0=;
	b=0revYGCTAKIL3jpbXnpzkYxRNfbR0fY2MZkKtsNKsYv3r205UNdZ+aL6dVWBunX30ukQM5
	UweEL6M+WydY75Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9435013797;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AIboItgQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/9] ALSA: hda-intel: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:07:23 +0100
Message-ID: <20250313170731.26943-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3f11f169fe4a..62ee32f70adc 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1051,7 +1051,7 @@ static int azx_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused azx_resume(struct device *dev)
+static int azx_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1098,7 +1098,7 @@ static int azx_thaw_noirq(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused azx_runtime_suspend(struct device *dev)
+static int azx_runtime_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1115,7 +1115,7 @@ static int __maybe_unused azx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused azx_runtime_resume(struct device *dev)
+static int azx_runtime_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1132,7 +1132,7 @@ static int __maybe_unused azx_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused azx_runtime_idle(struct device *dev)
+static int azx_runtime_idle(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
@@ -1163,7 +1163,7 @@ static const struct dev_pm_ops azx_pm = {
 	.complete = pm_sleep_ptr(azx_complete),
 	.freeze_noirq = pm_sleep_ptr(azx_freeze_noirq),
 	.thaw_noirq = pm_sleep_ptr(azx_thaw_noirq),
-	SET_RUNTIME_PM_OPS(azx_runtime_suspend, azx_runtime_resume, azx_runtime_idle)
+	RUNTIME_PM_OPS(azx_runtime_suspend, azx_runtime_resume, azx_runtime_idle)
 };
 
 
@@ -2795,7 +2795,7 @@ static struct pci_driver azx_driver = {
 	.remove = azx_remove,
 	.shutdown = azx_shutdown,
 	.driver = {
-		.pm = &azx_pm,
+		.pm = pm_ptr(&azx_pm),
 	},
 };
 
-- 
2.43.0

