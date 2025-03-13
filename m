Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA40155326
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885679; cv=none; b=gkW5d795Y1sXR2jm6Xj640kE3TxU9rre6n/pWvWOWLtYmuW/NRcN2Bxf215yE6E0TANWeJg1fqQozDtgjsGZK+1laaKfFW4+VDmNlHe2Z9BO08rSnIrlFc9WT6YGcAGvO6E3XjJuNmDDIr51J9IZoaj5/nC2S0SqgUbWFeoTGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885679; c=relaxed/simple;
	bh=3dAzkpUIjvHSab7xnOJWs5BoQFMfaQnkTpSF/y5qCf0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KadiUCRg5iWH8JWtbmQ1hzbERRoiSPKSl0PaQj5H81xOkoMjQZGf7zGlm29xgR/LY3KL3EOEvwOu4cXZHGTiMZuici8lM57C4RmJYmwXOoaNqNUdc6zH9+G7XRmp73ctVVzwRVI/51NFEBp8yCHYnL9txegQGHLq7fmUbzcTUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CnZIRgyc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P4RMKMcs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CnZIRgyc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P4RMKMcs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CnZIRgyc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4RMKMcs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CnZIRgyc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4RMKMcs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DCEDB211B8;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BE1y6q2JYYvOuXEG6XM9SJHTFF9kXiW8NBPthsiJuqw=;
	b=CnZIRgycP/Kk4bJVK2E0wtlg1E9eZyINn82egc9iUlV6HWxnlP1wpVg/1Xb+LC1bB2R+Pp
	6KLjQ402Lcs+PEoHG8HOR6eixWyLSorm8dsGbLi7HqfFnz1Az8n76qoFdv+PZaUclXURcU
	AsSFH2tmsBY8ofZhOYfulN/+dAmSbYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BE1y6q2JYYvOuXEG6XM9SJHTFF9kXiW8NBPthsiJuqw=;
	b=P4RMKMcsb0CdV4a+i/u7p9+9EJ+iJ04mh2ABWSDpOmRAUXcABhiaHYSdpaMwsEMm2QmWbQ
	q+T5knGgCwYj9JDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CnZIRgyc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P4RMKMcs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BE1y6q2JYYvOuXEG6XM9SJHTFF9kXiW8NBPthsiJuqw=;
	b=CnZIRgycP/Kk4bJVK2E0wtlg1E9eZyINn82egc9iUlV6HWxnlP1wpVg/1Xb+LC1bB2R+Pp
	6KLjQ402Lcs+PEoHG8HOR6eixWyLSorm8dsGbLi7HqfFnz1Az8n76qoFdv+PZaUclXURcU
	AsSFH2tmsBY8ofZhOYfulN/+dAmSbYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BE1y6q2JYYvOuXEG6XM9SJHTFF9kXiW8NBPthsiJuqw=;
	b=P4RMKMcsb0CdV4a+i/u7p9+9EJ+iJ04mh2ABWSDpOmRAUXcABhiaHYSdpaMwsEMm2QmWbQ
	q+T5knGgCwYj9JDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3240139D2;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gN91KtgQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/9] ALSA: hda/tegra: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:07:24 +0100
Message-ID: <20250313170731.26943-7-tiwai@suse.de>
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
X-Rspamd-Queue-Id: DCEDB211B8
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_tegra.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index b1e30a83dfb0..a590d431c5ff 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -125,7 +125,7 @@ static void hda_tegra_init(struct hda_tegra *hda)
 /*
  * power management
  */
-static int __maybe_unused hda_tegra_suspend(struct device *dev)
+static int hda_tegra_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	int rc;
@@ -138,7 +138,7 @@ static int __maybe_unused hda_tegra_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused hda_tegra_resume(struct device *dev)
+static int hda_tegra_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	int rc;
@@ -151,7 +151,7 @@ static int __maybe_unused hda_tegra_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
+static int hda_tegra_runtime_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip = card->private_data;
@@ -170,7 +170,7 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
+static int hda_tegra_runtime_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip = card->private_data;
@@ -204,10 +204,8 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops hda_tegra_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(hda_tegra_suspend, hda_tegra_resume)
-	SET_RUNTIME_PM_OPS(hda_tegra_runtime_suspend,
-			   hda_tegra_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(hda_tegra_suspend, hda_tegra_resume)
+	RUNTIME_PM_OPS(hda_tegra_runtime_suspend, hda_tegra_runtime_resume, NULL)
 };
 
 static int hda_tegra_dev_disconnect(struct snd_device *device)
@@ -602,7 +600,7 @@ static void hda_tegra_shutdown(struct platform_device *pdev)
 static struct platform_driver tegra_platform_hda = {
 	.driver = {
 		.name = "tegra-hda",
-		.pm = &hda_tegra_pm,
+		.pm = pm_ptr(&hda_tegra_pm),
 		.of_match_table = hda_tegra_match,
 	},
 	.probe = hda_tegra_probe,
-- 
2.43.0

