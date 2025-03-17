Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E65E22ACE7
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205429; cv=none; b=BKWHc3JfZh3xnNeLC5jHDJVYFDzd26gafgwqosqgErLAbKujsXrjlQCMEWWAlp11UmNzAMArC/OimftnISZ8Idw4veN3iFqqCyk45U+mpnjvthgSOIJXyKVz8yJ1qCpvgx465ktMQ6+Qj6DISml0Nj0eiYf8/cQrrg1Y09TxiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205429; c=relaxed/simple;
	bh=4LjlGZ42SIDrUA9k3IZDPmRgj4skfbgnkBXqfn2kONU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUu3Z83B1/0TXNhlt2upwHgyGbmNVz7GkyLjOzk8nx0Qf+rbtP1yg43Q3uyUOvJIN7Ese0FIii4gtysKNwryV1SNytcVbyTUKGOg9PmAOUHg3lrc4qoNBl+IUwSgBKMuM3fEFqsNJDkISM6XCSHUWerT1jd0dn6C8c8JYC4xWyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A3ED20118;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D541913A2C;
	Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EFbVMr7x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 11/88] ASoC: cs42l83: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:33 +0100
Message-ID: <20250317095603.20073-12-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0A3ED20118
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42l83-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l83-i2c.c b/sound/soc/codecs/cs42l83-i2c.c
index 42c3e1efdc08..53a7fe1ab3dd 100644
--- a/sound/soc/codecs/cs42l83-i2c.c
+++ b/sound/soc/codecs/cs42l83-i2c.c
@@ -199,7 +199,7 @@ static void cs42l83_i2c_remove(struct i2c_client *i2c_client)
 	cs42l42_common_remove(cs42l83);
 }
 
-static int __maybe_unused cs42l83_i2c_resume(struct device *dev)
+static int cs42l83_i2c_resume(struct device *dev)
 {
 	int ret;
 
@@ -213,7 +213,7 @@ static int __maybe_unused cs42l83_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cs42l83_i2c_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
+	SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
 };
 
 static const struct of_device_id __maybe_unused cs42l83_of_match[] = {
@@ -225,7 +225,7 @@ MODULE_DEVICE_TABLE(of, cs42l83_of_match);
 static struct i2c_driver cs42l83_i2c_driver = {
 	.driver = {
 		.name = "cs42l83",
-		.pm = &cs42l83_i2c_pm_ops,
+		.pm = pm_ptr(&cs42l83_i2c_pm_ops),
 		.of_match_table = of_match_ptr(cs42l83_of_match),
 		},
 	.probe = cs42l83_i2c_probe,
-- 
2.43.0

