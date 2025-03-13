Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F9186284
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887912; cv=none; b=LbTiYNWh/o29p5NjsWAmnww7RNL+h6Le5zk2GoC5nhl9prza0u8kuU3p5ZVyvVmRrvCE4FjF6LLFVKRx3gjqxY3GFGMeOfOmuiZgEHWwxOiC+mSxX/R1YxW6l7ErjpmgaebwlFcmnR4IRl0HuxH3MPtEErWIFMyd7/NjZikHggI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887912; c=relaxed/simple;
	bh=hITV6EfDIKhaEcwBeMvybUAMHUwSTeFaMPF4sM3YWwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7dCCtH8ervy7AjCNrZhGS7XE9PJSEZzIuXN9yUKc4tCx75JaiPGoMNPBS2/4+JJja+Uo7nVUgbt+Yx5bwW8xpVbq1STVct8qAIGBNL6MlYwOpTRJWdWL4aA755/LtX1GJnZdzRjNDKNj2MbD/5cdmefVI1MRtwVoNxh5NWzvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c8Y8/q94; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HywAc30S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c8Y8/q94; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HywAc30S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c8Y8/q94";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HywAc30S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c8Y8/q94";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HywAc30S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31353211EF;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=c8Y8/q94aiXWEa2DIbi4IWHM8Lc954U+HtWzplJrIMA8hw63Nu4wV2GDMV7d3pcXPV6QvD
	gqtiVbRzf3V2zgpskvP6kDUk6j9LWuwNel2Ez2G7f3JYHzx+kDAl5r8UBnGuESOgMBDe6V
	OM3lKcSqnLAZz4o5xBAA2IFMTKSsUwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=HywAc30S+zZgJ8kGRKNrippMo4VeK8VM6F1ZF5YQBqqif0R06sFg/+p1Yw4/QQD+Z+TY+F
	ASjpex/C5OhQaHDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="c8Y8/q94";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HywAc30S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=c8Y8/q94aiXWEa2DIbi4IWHM8Lc954U+HtWzplJrIMA8hw63Nu4wV2GDMV7d3pcXPV6QvD
	gqtiVbRzf3V2zgpskvP6kDUk6j9LWuwNel2Ez2G7f3JYHzx+kDAl5r8UBnGuESOgMBDe6V
	OM3lKcSqnLAZz4o5xBAA2IFMTKSsUwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KjvMoe1wHFv2QKUzEtDqfZ57yO6tquEj0mJI+MFAm0=;
	b=HywAc30S+zZgJ8kGRKNrippMo4VeK8VM6F1ZF5YQBqqif0R06sFg/+p1Yw4/QQD+Z+TY+F
	ASjpex/C5OhQaHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09DC9139D2;
	Thu, 13 Mar 2025 17:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KOLvAO0Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 63/89] ASoC: intel: catpt: Convert to RUNTIE_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:08 +0100
Message-ID: <20250313174139.29942-64-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 31353211EF
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/catpt/device.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 2aa637124bec..faa916f40069 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -28,7 +28,7 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
-static int __maybe_unused catpt_suspend(struct device *dev)
+static int catpt_suspend(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	struct dma_chan *chan;
@@ -72,7 +72,7 @@ static int __maybe_unused catpt_suspend(struct device *dev)
 	return catpt_dsp_power_down(cdev);
 }
 
-static int __maybe_unused catpt_resume(struct device *dev)
+static int catpt_resume(struct device *dev)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	int ret, i;
@@ -106,7 +106,7 @@ static int __maybe_unused catpt_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused catpt_runtime_suspend(struct device *dev)
+static int catpt_runtime_suspend(struct device *dev)
 {
 	if (!try_module_get(dev->driver->owner)) {
 		dev_info(dev, "module unloading, skipping suspend\n");
@@ -117,14 +117,14 @@ static int __maybe_unused catpt_runtime_suspend(struct device *dev)
 	return catpt_suspend(dev);
 }
 
-static int __maybe_unused catpt_runtime_resume(struct device *dev)
+static int catpt_runtime_resume(struct device *dev)
 {
 	return catpt_resume(dev);
 }
 
 static const struct dev_pm_ops catpt_dev_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
-	SET_RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
+	RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
 };
 
 /* machine board owned by CATPT is removed with this hook */
@@ -378,7 +378,7 @@ static struct platform_driver catpt_acpi_driver = {
 	.driver = {
 		.name = "intel_catpt",
 		.acpi_match_table = catpt_ids,
-		.pm = &catpt_dev_pm,
+		.pm = pm_ptr(&catpt_dev_pm),
 		.dev_groups = catpt_attr_groups,
 	},
 };
-- 
2.43.0

