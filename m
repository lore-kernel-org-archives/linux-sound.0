Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30049225A3E
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205382; cv=none; b=VvghKEw6WsOxD2Rea/LROEPBONlA3XW496LJvDQ4sS9EpvPmMElamS1nHEXzslA9fIB28HlDohkpIqvafTOYAqDkLQaCYqRykZE7hUJJw4XsAUK5u3p5HagwTRNYim9qZBWxDuBGMjrf0Rbk8LNf+2Rz3jd6WUMH/nHL5zhEZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205382; c=relaxed/simple;
	bh=8QON6ojXqabafoVi0MntWyWOEHZQEcinhxNJ3wB99IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iO/d7d466Qen5d5wXasGG4TIl//mzEIpJcA4jJgLZKaMUfMTAKfEHvn3SwfsTA8enrMIKcfmbRURgO+ewSNsNYaPuzHwMuoc1jqGakPQlTKPhk19Cx4RAAI1Z5t7/UsxCV0wf7XtMb/zBIUxvTa7Y7kOd65g9fX2T9x7FJGnibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 98C0521D84;
	Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E04A13A2C;
	Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MA2fGb7x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 09/88] ASoC: cs42l42: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:31 +0100
Message-ID: <20250317095603.20073-10-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 98C0521D84
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

