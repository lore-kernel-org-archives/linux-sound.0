Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C122FDEA
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205578; cv=none; b=EWX0eXo6/iFnHJryS8I1IKWLwHr9x3tCvI6iRyxdNMBzNJH1jXYG2QzeZJYd9h3J2h8fG/LqkwL42MwOuY0m/RjUq96UmlO83AXoHSyutEOg5bP9XoJUvFWHyuAzjGH0AFiXD3LhwmIAzNtAzf3C/h4ulIc7+fxFkUVStCDzxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205578; c=relaxed/simple;
	bh=6/TgnY9/kfDfSNY+8NKAvuw/uyuw2VG7Ab+hkf6jgQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwNeR1W/qYGb1XD9NI2RIRGVVYvriqD2siht7t9SCeIU+gAzPrNg6vw7iH3+uoZlbjKRaq/iYP5ANzKtOYkVvMGFi7nm3EDYnRum+rlMaK7cuF11NGGgEAMpeNxacztXODuLKMwMVwvTNf3iwcDF7UnneCd8olZkiHjdkZhSuQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 234A62023B;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1372132CF;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2M1hOcfx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 61/88] ASoC: intel: avs: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:23 +0100
Message-ID: <20250317095603.20073-62-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 234A62023B
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/avs/core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 0e750e9e01d9..8fbf33e30dfc 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -612,7 +612,7 @@ static int avs_suspend_standby(struct avs_dev *adev)
 	return 0;
 }
 
-static int __maybe_unused avs_suspend_common(struct avs_dev *adev, bool low_power)
+static int avs_suspend_common(struct avs_dev *adev, bool low_power)
 {
 	struct hdac_bus *bus = &adev->base.core;
 	int ret;
@@ -673,7 +673,7 @@ static int avs_resume_standby(struct avs_dev *adev)
 	return 0;
 }
 
-static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
+static int avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
 {
 	struct hdac_bus *bus = &adev->base.core;
 	int ret;
@@ -696,41 +696,41 @@ static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power
 	return 0;
 }
 
-static int __maybe_unused avs_suspend(struct device *dev)
+static int avs_suspend(struct device *dev)
 {
 	return avs_suspend_common(to_avs_dev(dev), true);
 }
 
-static int __maybe_unused avs_resume(struct device *dev)
+static int avs_resume(struct device *dev)
 {
 	return avs_resume_common(to_avs_dev(dev), true, true);
 }
 
-static int __maybe_unused avs_runtime_suspend(struct device *dev)
+static int avs_runtime_suspend(struct device *dev)
 {
 	return avs_suspend_common(to_avs_dev(dev), true);
 }
 
-static int __maybe_unused avs_runtime_resume(struct device *dev)
+static int avs_runtime_resume(struct device *dev)
 {
 	return avs_resume_common(to_avs_dev(dev), true, false);
 }
 
-static int __maybe_unused avs_freeze(struct device *dev)
+static int avs_freeze(struct device *dev)
 {
 	return avs_suspend_common(to_avs_dev(dev), false);
 }
-static int __maybe_unused avs_thaw(struct device *dev)
+static int avs_thaw(struct device *dev)
 {
 	return avs_resume_common(to_avs_dev(dev), false, true);
 }
 
-static int __maybe_unused avs_poweroff(struct device *dev)
+static int avs_poweroff(struct device *dev)
 {
 	return avs_suspend_common(to_avs_dev(dev), false);
 }
 
-static int __maybe_unused avs_restore(struct device *dev)
+static int avs_restore(struct device *dev)
 {
 	return avs_resume_common(to_avs_dev(dev), false, true);
 }
@@ -742,7 +742,7 @@ static const struct dev_pm_ops avs_dev_pm = {
 	.thaw = avs_thaw,
 	.poweroff = avs_poweroff,
 	.restore = avs_restore,
-	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
+	RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
 };
 
 static const struct avs_sram_spec skl_sram_spec = {
@@ -893,7 +893,7 @@ static struct pci_driver avs_pci_driver = {
 	.shutdown = avs_pci_shutdown,
 	.dev_groups = avs_attr_groups,
 	.driver = {
-		.pm = &avs_dev_pm,
+		.pm = pm_ptr(&avs_dev_pm),
 	},
 };
 module_pci_driver(avs_pci_driver);
-- 
2.43.0

