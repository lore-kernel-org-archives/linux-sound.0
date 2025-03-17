Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA31922ACEF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205479; cv=none; b=BqvqSDKeZOKlzANOYRCJA0SlQiWk5jNEUWy8yxVvbpVLG+7bxs38m6aKe8ybXhGKL1FQvV87b6vQnnrQq6RzZ8joXEoX3RD8N3qWM7GH6YH9f0/DkQy9cZqFX0XtPXC5dUmTEyfK6JL9x64ugj7EUOopHlNnO1PuDEx/OdLDEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205479; c=relaxed/simple;
	bh=z5KsK4ddGY051UCFN23kFfmy2cy/fqwvAT7ioyKJk7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iM8ge1cijHjxZdOndRJqI+K87aQ3vjOUUIx3RZnQ9i89q6srSgTa6L86wfgM2uWkefisO9eqQDpcobAfg5S8WyQCncVQhcpQgBWJOAkJqszDJEJDpjj5/swzPEBDiD4oD7jpSQ066ZmsEHcPG8B2Yx6AGq24QXyOti/CWu/ROo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D4F521D2D;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0792B132CF;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8MuTAMTx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 40/88] ASoC: rt715: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:02 +0100
Message-ID: <20250317095603.20073-41-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 2D4F521D2D
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 10 +++++-----
 sound/soc/codecs/rt715-sdw.c      | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index c8dabb9b16b5..ce7d8955efc3 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -205,7 +205,7 @@ static const struct sdw_device_id rt715_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt715_sdca_id);
 
-static int __maybe_unused rt715_dev_suspend(struct device *dev)
+static int rt715_dev_suspend(struct device *dev)
 {
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
 
@@ -222,7 +222,7 @@ static int __maybe_unused rt715_dev_suspend(struct device *dev)
 
 #define RT715_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt715_dev_resume(struct device *dev)
+static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
@@ -263,14 +263,14 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt715_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
-	SET_RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
+	RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
 };
 
 static struct sdw_driver rt715_sdw_driver = {
 	.driver = {
 		.name = "rt715-sdca",
-		.pm = &rt715_pm,
+		.pm = pm_ptr(&rt715_pm),
 	},
 	.probe = rt715_sdca_sdw_probe,
 	.remove = rt715_sdca_sdw_remove,
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index cd702574c84b..a3df4bbedf86 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -485,7 +485,7 @@ static const struct sdw_device_id rt715_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt715_id);
 
-static int __maybe_unused rt715_dev_suspend(struct device *dev)
+static int rt715_dev_suspend(struct device *dev)
 {
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
 
@@ -499,7 +499,7 @@ static int __maybe_unused rt715_dev_suspend(struct device *dev)
 
 #define RT715_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt715_dev_resume(struct device *dev)
+static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
@@ -530,14 +530,14 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt715_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
-	SET_RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
+	RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
 };
 
 static struct sdw_driver rt715_sdw_driver = {
 	.driver = {
 		   .name = "rt715",
-		   .pm = &rt715_pm,
+		   .pm = pm_ptr(&rt715_pm),
 		   },
 	.probe = rt715_sdw_probe,
 	.remove = rt715_sdw_remove,
-- 
2.43.0

