Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A0221D99
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205620; cv=none; b=e7LzrMo2SdqZHpqrA3UZfgdV4DQ4k2NerB9Uv7NGpaNsM52fNkAaMV7fAEGIwWBJob4u7o5HLAAemjahz1Dud4vcA1rMD3bvsOZFAFFXghTinE04DuOWWUQll5NYzXTuOucMkyjViM+WbxBdWax4nDC7xPqD7NliR9Im+NYFqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205620; c=relaxed/simple;
	bh=fkRBul6K3KhU8ykh7lrt9MYP8T9Nu08gQRDOMCu+QMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GThJiaLIzGqcxHTvHtT0U7f1K8PR5glM0F7zMiGrFuLlYU0LRamk7PHptSXdxr6deFhb98XbeCupJ2sPCugkp/a50R2MA8XHgmUs+DlINMBOMs9OT3l5tQ1nNGip0g4XsnWRCe2f5j3A7EoQ8hWxsedDr5AJy8rT2So5TeeL8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 01A9520242;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC21C13A2C;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mPQ4MMrx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 77/88] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:39 +0100
Message-ID: <20250317095603.20073-78-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 01A9520242
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer EXPORT_NS_DEV_PM_OPS() macro together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: sound-open-firmware@alsa-project.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/bdw.c    | 2 +-
 sound/soc/sof/intel/byt.c    | 2 +-
 sound/soc/sof/sof-acpi-dev.c | 9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 79374dcde89f..f1287d509835 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -686,7 +686,7 @@ static struct platform_driver snd_sof_acpi_intel_bdw_driver = {
 	.remove = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-bdw",
-		.pm = &sof_acpi_pm,
+		.pm = pm_ptr(&sof_acpi_pm),
 		.acpi_match_table = sof_broadwell_match,
 	},
 };
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 900cc10a3b7f..18208f77b84d 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -467,7 +467,7 @@ static struct platform_driver snd_sof_acpi_intel_byt_driver = {
 	.remove = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-byt",
-		.pm = &sof_acpi_pm,
+		.pm = pm_ptr(&sof_acpi_pm),
 		.acpi_match_table = sof_baytrail_match,
 	},
 };
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 58fd5f7c7905..68bf1b57093e 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -36,12 +36,11 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
 
 #define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
 
-const struct dev_pm_ops sof_acpi_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
-	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
-			   snd_sof_runtime_idle)
+EXPORT_NS_DEV_PM_OPS(sof_acpi_pm, SND_SOC_SOF_ACPI_DEV) = {
+	SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
+		       snd_sof_runtime_idle)
 };
-EXPORT_SYMBOL_NS(sof_acpi_pm, "SND_SOC_SOF_ACPI_DEV");
 
 static void sof_acpi_probe_complete(struct device *dev)
 {
-- 
2.43.0

