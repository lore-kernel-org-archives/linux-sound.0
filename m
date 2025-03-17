Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11424229B01
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205406; cv=none; b=Rc/dFXVdconKg5dQJTw8WHBuw/8QfqlhbDcwsnMFdQhUMkF7ssoehw3ch4m/jIQcaVHDblmJIgQyuZsTZyY26Ums75r7/wEgbc4GvuvzC0S32ueW3l3rtKl1gwYL3ZEPes/P7MA3iVAgYSG17vmn5qDQbL32HlZpIJz57CnyAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205406; c=relaxed/simple;
	bh=fqvDgaSScWTmeXeYHoyxDi7hUpebMRoQDNjPf8zki3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+fq2R9Zfwakz4nMUuxDy4OzDTPbUZGevK91nhEOASMUFglzruGvnGN29R3YRK2Nv2wfACaZHoadwkjPqP27qBQTM2IYG2M+rYYFE78WsfkRjHJlUGwz/mQj1IfzFLci5C8LEifTuhhxAMGH8ITMaPLO0IVUV2+XPEPl7jpg930=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CBA421D96;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 734A8132CF;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uOHhGr/x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 14/88] ASoC: cs4349: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:36 +0100
Message-ID: <20250317095603.20073-15-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 9CBA421D96
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs4349.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index a134ca722892..d9a9c34fffe3 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -312,7 +312,6 @@ static void cs4349_i2c_remove(struct i2c_client *client)
 	gpiod_set_value_cansleep(cs4349->reset_gpio, 0);
 }
 
-#ifdef CONFIG_PM
 static int cs4349_runtime_suspend(struct device *dev)
 {
 	struct cs4349_private *cs4349 = dev_get_drvdata(dev);
@@ -346,11 +345,9 @@ static int cs4349_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops cs4349_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs4349_runtime_suspend, cs4349_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs4349_runtime_suspend, cs4349_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs4349_of_match[] = {
@@ -371,7 +368,7 @@ static struct i2c_driver cs4349_i2c_driver = {
 	.driver = {
 		.name		= "cs4349",
 		.of_match_table	= cs4349_of_match,
-		.pm = &cs4349_runtime_pm,
+		.pm = pm_ptr(&cs4349_runtime_pm),
 	},
 	.id_table	= cs4349_i2c_id,
 	.probe		= cs4349_i2c_probe,
-- 
2.43.0

