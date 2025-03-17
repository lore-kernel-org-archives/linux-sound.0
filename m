Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E122A7F6
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205437; cv=none; b=Fy2gt3wXcJY3sV6FQr7LK5mZDkA4Yh1Kq4k6/DHOPqzvTwZVFWAHQLPw3FXq1s6PXN+4/zI7akeSwog4ZPfz/luXSfgbvCaeBwF4I4JSrAjV/HbXDW/UPARzV4Q0hLJVLLoiWprGxcCauN6XnX0ebg3hJOI0y5ur6mfqfP+ff/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205437; c=relaxed/simple;
	bh=xxMUzA9yvOg6ZSIwEnWnzcrnnvGglF5AoxyD/lpq9Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFlC8vYibReq6B+jqd0Vxg95cPJ0+q6FtE/DpTzw9VhktvN3BImESbXv8FvbrLkkSF218vaBhtBClkvSQZb6A7BicHUNTMLy263/4Rt2AjYIyHpUGUa+vRIZhS8COYrwjjUlhmdnC6f2pA/4G1qvS6wz7Q9Bs4lN2x07I2kYy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7684021DE8;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 569CF132CF;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mD3GE8Hx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 25/88] ASoC: max9860: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:47 +0100
Message-ID: <20250317095603.20073-26-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 7684021DE8
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max9860.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 4015ed2c47ec..716d16daf7d7 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -539,7 +539,6 @@ static const struct snd_soc_component_driver max9860_component_driver = {
 	.endianness		= 1,
 };
 
-#ifdef CONFIG_PM
 static int max9860_suspend(struct device *dev)
 {
 	struct max9860_priv *max9860 = dev_get_drvdata(dev);
@@ -584,10 +583,9 @@ static int max9860_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max9860_pm_ops = {
-	SET_RUNTIME_PM_OPS(max9860_suspend, max9860_resume, NULL)
+	RUNTIME_PM_OPS(max9860_suspend, max9860_resume, NULL)
 };
 
 static int max9860_probe(struct i2c_client *i2c)
@@ -729,7 +727,7 @@ static struct i2c_driver max9860_i2c_driver = {
 	.driver         = {
 		.name           = "max9860",
 		.of_match_table = max9860_of_match,
-		.pm             = &max9860_pm_ops,
+		.pm             = pm_ptr(&max9860_pm_ops),
 	},
 };
 
-- 
2.43.0

