Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278C1D8A0A
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887906; cv=none; b=GKHvDxzKMEi0dI8NAlrZkut+TGDS5teuy7ZnmR4JM9AHxMguYdJ5x2X6QbTjR6YnHI9QOLOOM/3nSto5c+8NFcwCE8TtF//1dy6cvNyxC3JXwPK36MClo9ORtqsvbPURT0F8avSDYeNy3m4atwC+zQomQ2q5mw6HXRFM76e2MqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887906; c=relaxed/simple;
	bh=6/TgnY9/kfDfSNY+8NKAvuw/uyuw2VG7Ab+hkf6jgQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoPM7Wp2ke05WRs71slFCgmmTHVUoS11X8GEjbR6MKtUTmqy88Pv14wRQ7ek35M8UW3OvMebuFuGCOPvnCnqEWzhGJeruAxSEsw7eU/zGKq1LtP0fBS4LpDsDg3p0uCD6ZL5fDN1K30wplOZrED8Y5QeyR9npDH7PTF53XB6m4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sSfNGhIN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+yPG7Yv9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sSfNGhIN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+yPG7Yv9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSfNGhIN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+yPG7Yv9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSfNGhIN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+yPG7Yv9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 024FB211EE;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lu7or+POtpK5c2V8q410lxTVFyOPLbOV+lde62C9Zc=;
	b=sSfNGhIN7hqAaienpNtj1KWggClnGfVQWlMU2ntWRbJIr0xZv/wlK0dkycZs6FMfoxrwxA
	7ZezgfTp0JWcAo8NBPNPV6jc6PzgX4ovhJOCxvQmL0DiL+jv+h6iC90YRA56AHPRlbFBu8
	dcOMlqRDlZEYeLO8HHdevjWjqbr9W4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lu7or+POtpK5c2V8q410lxTVFyOPLbOV+lde62C9Zc=;
	b=+yPG7Yv91zdScuhknCDG7ZjxnOvT0wj9y8Uo6+gXtR1iEQP88sGGoSQEho7Wys01Gx3VU7
	+yWxHrDgXCOHcKAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lu7or+POtpK5c2V8q410lxTVFyOPLbOV+lde62C9Zc=;
	b=sSfNGhIN7hqAaienpNtj1KWggClnGfVQWlMU2ntWRbJIr0xZv/wlK0dkycZs6FMfoxrwxA
	7ZezgfTp0JWcAo8NBPNPV6jc6PzgX4ovhJOCxvQmL0DiL+jv+h6iC90YRA56AHPRlbFBu8
	dcOMlqRDlZEYeLO8HHdevjWjqbr9W4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lu7or+POtpK5c2V8q410lxTVFyOPLbOV+lde62C9Zc=;
	b=+yPG7Yv91zdScuhknCDG7ZjxnOvT0wj9y8Uo6+gXtR1iEQP88sGGoSQEho7Wys01Gx3VU7
	+yWxHrDgXCOHcKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEFF713A24;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IHfiMOwY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 62/89] ASoC: intel: avs: Convert to RUNTIE_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:07 +0100
Message-ID: <20250313174139.29942-63-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

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

