Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D6226D10
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205384; cv=none; b=F5JyQu2viU0U2pAeV0FvZYSIMZqWGPz8irJwMuATirWLlhznO3InEfTNI5MK/o2QSOUw1FJxzl1LrdbXEhGiimPelszjxRBjSCr+GPabXbDf4jUBLm4/rM5Lxx/q4zKbYWGsIledXZZ/KhLSWlbheElbUUdnlbAzi2LMavIaRwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205384; c=relaxed/simple;
	bh=mwPxxDng8wbOZXFknpOaSRtDOMNEQ1XoejXeFrWTB1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7tH2iuM8d2ANMVJYIZ+463ZBeBKXbFn5sagWzu3l+Y0bn4zyMNBrkbRW+SWFg+XraoulGwWAN37yAM60yxjpkJ3yf5BkRMNoI5PjOz4j79clLsjFIN8yb4IxfmofW0FYLWh0SbC99EqIcM0GsI15zEXv46r/PtuYy8MR+5C6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 116151FDFF;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E266F13A2C;
	Mon, 17 Mar 2025 09:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uJnINbzx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 01/88] ASoC: au1x: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:23 +0100
Message-ID: <20250317095603.20073-2-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 116151FDFF
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the new DEFINE_SIMPLE_DEV_PM_OPS() macro instead of open code
together with pm_ptr(), which allows us dropping CONFIG_PM ifdefs.

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/au1x/i2sc.c     | 17 +++--------------
 sound/soc/au1x/psc-ac97.c | 17 +++--------------
 sound/soc/au1x/psc-i2s.c  | 17 +++--------------
 3 files changed, 9 insertions(+), 42 deletions(-)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 7d296f29dade..57735004f416 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -279,7 +279,6 @@ static void au1xi2s_drvremove(struct platform_device *pdev)
 	WR(ctx, I2S_ENABLE, EN_D);	/* clock off, disable */
 }
 
-#ifdef CONFIG_PM
 static int au1xi2s_drvsuspend(struct device *dev)
 {
 	struct au1xpsc_audio_data *ctx = dev_get_drvdata(dev);
@@ -294,23 +293,13 @@ static int au1xi2s_drvresume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops au1xi2sc_pmops = {
-	.suspend	= au1xi2s_drvsuspend,
-	.resume		= au1xi2s_drvresume,
-};
-
-#define AU1XI2SC_PMOPS (&au1xi2sc_pmops)
-
-#else
-
-#define AU1XI2SC_PMOPS NULL
-
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(au1xi2sc_pmops, au1xi2s_drvsuspend,
+				au1xi2s_drvresume);
 
 static struct platform_driver au1xi2s_driver = {
 	.driver	= {
 		.name	= "alchemy-i2sc",
-		.pm	= AU1XI2SC_PMOPS,
+		.pm	= pm_ptr(&au1xi2sc_pmops),
 	},
 	.probe		= au1xi2s_drvprobe,
 	.remove		= au1xi2s_drvremove,
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 8a59a50978b9..94698e08a513 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -436,7 +436,6 @@ static void au1xpsc_ac97_drvremove(struct platform_device *pdev)
 	au1xpsc_ac97_workdata = NULL;	/* MDEV */
 }
 
-#ifdef CONFIG_PM
 static int au1xpsc_ac97_drvsuspend(struct device *dev)
 {
 	struct au1xpsc_audio_data *wd = dev_get_drvdata(dev);
@@ -467,23 +466,13 @@ static int au1xpsc_ac97_drvresume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops au1xpscac97_pmops = {
-	.suspend	= au1xpsc_ac97_drvsuspend,
-	.resume		= au1xpsc_ac97_drvresume,
-};
-
-#define AU1XPSCAC97_PMOPS &au1xpscac97_pmops
-
-#else
-
-#define AU1XPSCAC97_PMOPS NULL
-
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(au1xpscac97_pmops, au1xpsc_ac97_drvsuspend,
+				au1xpsc_ac97_drvresume);
 
 static struct platform_driver au1xpsc_ac97_driver = {
 	.driver	= {
 		.name	= "au1xpsc_ac97",
-		.pm	= AU1XPSCAC97_PMOPS,
+		.pm	= pm_ptr(&au1xpscac97_pmops),
 	},
 	.probe		= au1xpsc_ac97_drvprobe,
 	.remove		= au1xpsc_ac97_drvremove,
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index bee013555e7a..bf59105fcb7a 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -354,7 +354,6 @@ static void au1xpsc_i2s_drvremove(struct platform_device *pdev)
 	wmb(); /* drain writebuffer */
 }
 
-#ifdef CONFIG_PM
 static int au1xpsc_i2s_drvsuspend(struct device *dev)
 {
 	struct au1xpsc_audio_data *wd = dev_get_drvdata(dev);
@@ -385,23 +384,13 @@ static int au1xpsc_i2s_drvresume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops au1xpsci2s_pmops = {
-	.suspend	= au1xpsc_i2s_drvsuspend,
-	.resume		= au1xpsc_i2s_drvresume,
-};
-
-#define AU1XPSCI2S_PMOPS &au1xpsci2s_pmops
-
-#else
-
-#define AU1XPSCI2S_PMOPS NULL
-
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(au1xpsci2s_pmops, au1xpsc_i2s_drvsuspend,
+				au1xpsc_i2s_drvresume);
 
 static struct platform_driver au1xpsc_i2s_driver = {
 	.driver		= {
 		.name	= "au1xpsc_i2s",
-		.pm	= AU1XPSCI2S_PMOPS,
+		.pm	= pm_ptr(&au1xpsci2s_pmops),
 	},
 	.probe		= au1xpsc_i2s_drvprobe,
 	.remove		= au1xpsc_i2s_drvremove,
-- 
2.43.0

