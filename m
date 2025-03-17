Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443722ACE3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205461; cv=none; b=c88f2FTO9kQFmWMBiT/1eWzHaH/cjkdPtQMdYANlYGZrT6r3iG5Z6VqDqUxmszY2PVInD0YmAiml2ocN8iBbA8bpTWY6lk+ZgKwZgMl7n0VV2qOVqWebfezNTG/t4CKelF3UG9ELCEJKeyNkC1DC+6v0JP0ItrSLB2BkGZWgaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205461; c=relaxed/simple;
	bh=85keOgujEBv92/5CRX/rEBG7hTMsHaDiHAFvMR/VI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJlESAWcAZbz44m8vjGn0CHKOwflZTu4NuEsTAvfMebDiwSgEaJb1PLwSjDspos7qhv2wAy/RdaeINQJ8qtBmxRSFG8ZIVlBJCkaOt71JA6DtC1wef/czsrUTACGvuTEV489345v4PXZ6vpGqxUD4K2k/mjd8pmrfjs3cMngmqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88E6F21E7B;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64A51132CF;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIZVF8Lx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 31/88] ASoC: rt1316-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:53 +0100
Message-ID: <20250317095603.20073-32-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 88E6F21E7B
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

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt1316-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 22f1ed4e03f1..960b6c4f5a66 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -730,7 +730,7 @@ static const struct sdw_device_id rt1316_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1316_id);
 
-static int __maybe_unused rt1316_dev_suspend(struct device *dev)
+static int rt1316_dev_suspend(struct device *dev)
 {
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
 
@@ -744,7 +744,7 @@ static int __maybe_unused rt1316_dev_suspend(struct device *dev)
 
 #define RT1316_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1316_dev_resume(struct device *dev)
+static int rt1316_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
@@ -774,14 +774,14 @@ static int __maybe_unused rt1316_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1316_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume)
+	RUNTIME_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1316_sdw_driver = {
 	.driver = {
 		.name = "rt1316-sdca",
-		.pm = &rt1316_pm,
+		.pm = pm_ptr(&rt1316_pm),
 	},
 	.probe = rt1316_sdw_probe,
 	.remove = rt1316_sdw_remove,
-- 
2.43.0

