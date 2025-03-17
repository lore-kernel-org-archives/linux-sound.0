Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3DC22FDEA
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205606; cv=none; b=GTIkFDG1Fq6VFyLBPtg/yuW9s3ebiM3Bban1pshspx56tB5j4AVRTimP5ykVV5esvlzkwXuD5YZkLCoEuYWMUUD+y+8qc8O9rLTIjhXOwOo5cYedoJhfYGs0iAgaACimzy3UiZA5pK9ynTe/kgyAQWnQOjhu4WSzqYMvyPucmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205606; c=relaxed/simple;
	bh=/PoYbuQfUsjXCzhdxiG0dE1Qm0r/gz9Fk0AXJ3YcLfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRHhr9MvRbl3jNvIpOX1m4rzkN0XjkVEDMgLLg8SNAO11M1l9ofqNdkCqfnkjQkgaDciPyMjCu96bdnIMTkhkee6+5ew3q/mmoDADXfC81INlY6xMFQjye1bnwGMVuQJDU7jNz2QrcTZelWUDa3jnVtyoqQL6/gpxj/smhFDnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D14322110;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0638B132CF;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oOMwAMvx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 78/88] ASoC: SOF: pci: Convert to EXPORT_NS_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:40 +0100
Message-ID: <20250317095603.20073-79-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 2D14322110
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
 sound/soc/sof/amd/pci-acp63.c   | 2 +-
 sound/soc/sof/amd/pci-acp70.c   | 2 +-
 sound/soc/sof/amd/pci-rn.c      | 2 +-
 sound/soc/sof/amd/pci-vangogh.c | 2 +-
 sound/soc/sof/intel/pci-apl.c   | 2 +-
 sound/soc/sof/intel/pci-cnl.c   | 2 +-
 sound/soc/sof/intel/pci-icl.c   | 2 +-
 sound/soc/sof/intel/pci-lnl.c   | 2 +-
 sound/soc/sof/intel/pci-mtl.c   | 2 +-
 sound/soc/sof/intel/pci-ptl.c   | 2 +-
 sound/soc/sof/intel/pci-skl.c   | 2 +-
 sound/soc/sof/intel/pci-tgl.c   | 2 +-
 sound/soc/sof/intel/pci-tng.c   | 2 +-
 sound/soc/sof/sof-pci-dev.c     | 9 ++++-----
 14 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index 13aa87cdeeac..21ffdfdcf03d 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -104,7 +104,7 @@ static struct pci_driver snd_sof_pci_amd_acp63_driver = {
 	.probe = acp63_pci_probe,
 	.remove = acp63_pci_remove,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_amd_acp63_driver);
diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index d886bdf3a112..8fa1170a2161 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -100,7 +100,7 @@ static struct pci_driver snd_sof_pci_amd_acp70_driver = {
 	.probe = acp70_pci_probe,
 	.remove = acp70_pci_remove,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_amd_acp70_driver);
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 4a36029a00de..2b7fbcf11b55 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -97,7 +97,7 @@ static struct pci_driver snd_sof_pci_amd_rn_driver = {
 	.probe = acp_pci_rn_probe,
 	.remove = acp_pci_rn_remove,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_amd_rn_driver);
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index caf9e2b2e463..6ef692becfb9 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -90,7 +90,7 @@ static struct pci_driver snd_sof_pci_amd_vgh_driver = {
 	.probe = acp_pci_vgh_probe,
 	.remove = acp_pci_vgh_remove,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_amd_vgh_driver);
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 94ab3c61e3f7..0bf7ee753bc3 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -99,7 +99,7 @@ static struct pci_driver snd_sof_pci_intel_apl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_apl_driver);
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 739c352c3860..de48640024e4 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -137,7 +137,7 @@ static struct pci_driver snd_sof_pci_intel_cnl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_cnl_driver);
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 8545ab95eac8..fd219e654844 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -102,7 +102,7 @@ static struct pci_driver snd_sof_pci_intel_icl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_icl_driver);
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 91b9cff8c4ca..ae379c23f008 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -72,7 +72,7 @@ static struct pci_driver snd_sof_pci_intel_lnl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_lnl_driver);
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index c5048a4a56be..7b2533999195 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -135,7 +135,7 @@ static struct pci_driver snd_sof_pci_intel_mtl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_mtl_driver);
diff --git a/sound/soc/sof/intel/pci-ptl.c b/sound/soc/sof/intel/pci-ptl.c
index 3812ab6d99c0..7d4c46f56931 100644
--- a/sound/soc/sof/intel/pci-ptl.c
+++ b/sound/soc/sof/intel/pci-ptl.c
@@ -71,7 +71,7 @@ static struct pci_driver snd_sof_pci_intel_ptl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_ptl_driver);
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index bd9daae51e4c..a16945dc35f7 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -83,7 +83,7 @@ static struct pci_driver snd_sof_pci_intel_skl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_skl_driver);
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index f76a7197f6ca..437c43819825 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -311,7 +311,7 @@ static struct pci_driver snd_sof_pci_intel_tgl_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_tgl_driver);
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 3eb7400942dd..0c11cc1fd820 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -238,7 +238,7 @@ static struct pci_driver snd_sof_pci_intel_tng_driver = {
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
-		.pm = &sof_pci_pm,
+		.pm = pm_ptr(&sof_pci_pm),
 	},
 };
 module_pci_driver(snd_sof_pci_intel_tng_driver);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 103377e2caaf..2fc14b9a33d4 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -155,14 +155,13 @@ static const struct dmi_system_id community_key_platforms[] = {
 	{},
 };
 
-const struct dev_pm_ops sof_pci_pm = {
+EXPORT_NS_DEV_PM_OPS(sof_pci_pm, SND_SOC_SOF_PCI_DEV) = {
 	.prepare = snd_sof_prepare,
 	.complete = snd_sof_complete,
-	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
-	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
-			   snd_sof_runtime_idle)
+	SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
+		       snd_sof_runtime_idle)
 };
-EXPORT_SYMBOL_NS(sof_pci_pm, "SND_SOC_SOF_PCI_DEV");
 
 static void sof_pci_probe_complete(struct device *dev)
 {
-- 
2.43.0

