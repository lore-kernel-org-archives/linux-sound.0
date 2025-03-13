Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0691155CBD
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887729; cv=none; b=skYDIgGl5gyjomMU7vOK9HHMmq+OUeHvFOZOVrkXggMc3UEhctnhQkIfsgut+jYtx6PpghQM/uYfS5Soq5IyPVKdNQCf5se2dTjLqlYY90cUrW1eNrlGhpFVll+jFOjx6E2x8+YoZbZyePUIwNAcAtQ9+OjZDGVOqh0nMej1PvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887729; c=relaxed/simple;
	bh=x+q7QFesmYk8JY0Ho74Bc266nED+MDNYbSvIqJnh8IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmGwrQ9aBrBFyriiHoVyxE3y7+QVoCBNq3hDGz8T8z7dCa/gl8QdQtJJAjt6amL9M5VofgZQEY869eGm9KpRDyp/KynjmTIT37VUk5KULWYSyGww9SFssYL1PiYEwZZu9Nq6nNQURDN0Y4tCtU0GZLh4En+6F8E2MaXmnjQ5Vmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EilILJ8B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Af0Db1DJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EilILJ8B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Af0Db1DJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EilILJ8B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Af0Db1DJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EilILJ8B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Af0Db1DJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FB19211B8;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXnAMmDhseinqmOlgpPDC0ZLCDpX86ndHiGqskZjc9U=;
	b=EilILJ8BdH4AjXRYwdk3lj1SJ3+T2DDDHDn9qqMPSAro/I6CDDjEPSUHipZ2tTlLH51SBP
	5IBTch/trotcksWVHzVDcFTWvA7sNV6JBy7LNjDRyNHLPxiHXly47sMmoqghwPUSoiVF1G
	qS4YnBllDp88qbVl3huxrSt8k9NnefI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXnAMmDhseinqmOlgpPDC0ZLCDpX86ndHiGqskZjc9U=;
	b=Af0Db1DJuw9Wee1wmmF4ag80hHoTBI8Wlb5D9aiukXpuSRY4BYE7wpy0jKQWXTzIDcKMC+
	XlHasrrBaZrg+AAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EilILJ8B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Af0Db1DJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXnAMmDhseinqmOlgpPDC0ZLCDpX86ndHiGqskZjc9U=;
	b=EilILJ8BdH4AjXRYwdk3lj1SJ3+T2DDDHDn9qqMPSAro/I6CDDjEPSUHipZ2tTlLH51SBP
	5IBTch/trotcksWVHzVDcFTWvA7sNV6JBy7LNjDRyNHLPxiHXly47sMmoqghwPUSoiVF1G
	qS4YnBllDp88qbVl3huxrSt8k9NnefI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXnAMmDhseinqmOlgpPDC0ZLCDpX86ndHiGqskZjc9U=;
	b=Af0Db1DJuw9Wee1wmmF4ag80hHoTBI8Wlb5D9aiukXpuSRY4BYE7wpy0jKQWXTzIDcKMC+
	XlHasrrBaZrg+AAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 296ED137BA;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJmZCOMY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 10/89] ASoC: cs42l42: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:15 +0100
Message-ID: <20250313174139.29942-11-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4FB19211B8
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42l42-i2c.c |  6 +++---
 sound/soc/codecs/cs42l42-sdw.c | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-i2c.c b/sound/soc/codecs/cs42l42-i2c.c
index 8a1d5c7a61d7..98b6718ccabf 100644
--- a/sound/soc/codecs/cs42l42-i2c.c
+++ b/sound/soc/codecs/cs42l42-i2c.c
@@ -48,7 +48,7 @@ static void cs42l42_i2c_remove(struct i2c_client *i2c_client)
 	cs42l42_common_remove(cs42l42);
 }
 
-static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
+static int cs42l42_i2c_resume(struct device *dev)
 {
 	int ret;
 
@@ -62,7 +62,7 @@ static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cs42l42_i2c_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_i2c_resume)
+	SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_i2c_resume)
 };
 
 static const struct of_device_id __maybe_unused cs42l42_of_match[] = {
@@ -87,7 +87,7 @@ MODULE_DEVICE_TABLE(i2c, cs42l42_id);
 static struct i2c_driver cs42l42_i2c_driver = {
 	.driver = {
 		.name = "cs42l42",
-		.pm = &cs42l42_i2c_pm_ops,
+		.pm = pm_ptr(&cs42l42_i2c_pm_ops),
 		.of_match_table = of_match_ptr(cs42l42_of_match),
 		.acpi_match_table = ACPI_PTR(cs42l42_acpi_match),
 		},
diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index ae1401b250a3..f837c7eff10b 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -411,7 +411,7 @@ static const struct sdw_slave_ops cs42l42_sdw_ops = {
 	.port_prep = cs42l42_sdw_port_prep,
 };
 
-static int __maybe_unused cs42l42_sdw_runtime_suspend(struct device *dev)
+static int cs42l42_sdw_runtime_suspend(struct device *dev)
 {
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
 
@@ -426,11 +426,11 @@ static int __maybe_unused cs42l42_sdw_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static const struct reg_sequence __maybe_unused cs42l42_soft_reboot_seq[] = {
+static const struct reg_sequence cs42l42_soft_reboot_seq[] = {
 	REG_SEQ0(CS42L42_SOFT_RESET_REBOOT, 0x1e),
 };
 
-static int __maybe_unused cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
+static int cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
 {
 	struct sdw_slave *peripheral = cs42l42->sdw_peripheral;
 
@@ -460,7 +460,7 @@ static int __maybe_unused cs42l42_sdw_handle_unattach(struct cs42l42_private *cs
 	return 0;
 }
 
-static int __maybe_unused cs42l42_sdw_runtime_resume(struct device *dev)
+static int cs42l42_sdw_runtime_resume(struct device *dev)
 {
 	static const unsigned int ts_dbnce_ms[] = { 0, 125, 250, 500, 750, 1000, 1250, 1500};
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
@@ -491,7 +491,7 @@ static int __maybe_unused cs42l42_sdw_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs42l42_sdw_resume(struct device *dev)
+static int cs42l42_sdw_resume(struct device *dev)
 {
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
 	int ret;
@@ -596,8 +596,8 @@ static int cs42l42_sdw_remove(struct sdw_slave *peripheral)
 }
 
 static const struct dev_pm_ops cs42l42_sdw_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_sdw_resume)
-	SET_RUNTIME_PM_OPS(cs42l42_sdw_runtime_suspend, cs42l42_sdw_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_sdw_resume)
+	RUNTIME_PM_OPS(cs42l42_sdw_runtime_suspend, cs42l42_sdw_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id cs42l42_sdw_id[] = {
@@ -609,7 +609,7 @@ MODULE_DEVICE_TABLE(sdw, cs42l42_sdw_id);
 static struct sdw_driver cs42l42_sdw_driver = {
 	.driver = {
 		.name = "cs42l42-sdw",
-		.pm = &cs42l42_sdw_pm,
+		.pm = pm_ptr(&cs42l42_sdw_pm),
 	},
 	.probe = cs42l42_sdw_probe,
 	.remove = cs42l42_sdw_remove,
-- 
2.43.0

