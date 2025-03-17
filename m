Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CAE22A7F6
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205412; cv=none; b=Yc41hwB6lhUOSiZKDAyegRsmJjBqAgBO7u6f0/1whDHSnVZlxnC6kC/D8p1Ld56RoL5arCJ4JIqvcFuTlfbPNaEa9zF+0GvT8CU+FMcv5htg+JOtLOicyoMOsLU0P5n0B17rVTcDR3UHjC6fci8663ejFO+mKwr0lvBPIDpFuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205412; c=relaxed/simple;
	bh=AEzFzb2cfjfqEDVABZBJwDANJ8+MwAxg3+aWlmhAC3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuZJuwqVq2/XYtkI4q+7NHEfnjo27ANiKYeBgIO2JlkfcWzqz1vOE5yrYppa8mt3NwgNey3KvewN4bE0gh8c2E+SlWy7bD3Q3TYQsKuDT9UfJrM7v/85fmRAURubpEcPduX8RwU/d//e3XhOh8/TkdWP1AFC0kMsHD5Ll7IrtMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF72B21DB6;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3568132CF;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SKafJr/x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 15/88] ASoC: cs53l30: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:37 +0100
Message-ID: <20250317095603.20073-16-tiwai@suse.de>
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
X-Rspamd-Queue-Id: CF72B21DB6
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs53l30.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index aea4244fb275..61bf72681674 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -1031,7 +1031,6 @@ static void cs53l30_i2c_remove(struct i2c_client *client)
 			       cs53l30->supplies);
 }
 
-#ifdef CONFIG_PM
 static int cs53l30_runtime_suspend(struct device *dev)
 {
 	struct cs53l30_private *cs53l30 = dev_get_drvdata(dev);
@@ -1070,11 +1069,9 @@ static int cs53l30_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops cs53l30_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs53l30_runtime_suspend, cs53l30_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs53l30_runtime_suspend, cs53l30_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs53l30_of_match[] = {
@@ -1095,7 +1092,7 @@ static struct i2c_driver cs53l30_i2c_driver = {
 	.driver = {
 		.name = "cs53l30",
 		.of_match_table = cs53l30_of_match,
-		.pm = &cs53l30_runtime_pm,
+		.pm = pm_ptr(&cs53l30_runtime_pm),
 	},
 	.id_table = cs53l30_id,
 	.probe = cs53l30_i2c_probe,
-- 
2.43.0

