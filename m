Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A0376F1
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887723; cv=none; b=cSf3j3YfL57OY3cAlmRrqYVlFqeDFFRwykUgOhBgZXpKjOR90oseqXUcfZcFp3aIGj/1JWQta0c7TCmmpVFZ5jzMUW/qEINqcaDGjX4ICpIRloxtnkIMYT4g5vsYcI143RXggjmVCGa3aXYC20Rt2/peFXSnC+R15HMAMvXUJVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887723; c=relaxed/simple;
	bh=+k5QH6Nap3461rQaMRloD++W0SK6JbK89WiNjxeFXH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBddct8HvEcJZ2yESHg+hMCX8QZvheEU+2kQXlmqNtFYSBxjxCLOVX42yPx/0DzirfSxaT7Iaq48HQdv0xQICrsElhMJ7ZhF6VR1dI77h8UBlSYOK5Ow1I7DUyefnBQGHW7dV2mQedY78BYl2WjZZvvfpJMjHHC/uJ09Opn8aQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NKBe0VNv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rXYfM964; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NKBe0VNv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rXYfM964; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NKBe0VNv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rXYfM964";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NKBe0VNv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rXYfM964"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB2FC1F786;
	Thu, 13 Mar 2025 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3R+N9RgWm4VODf1Dv5AfZniWTHnSUFH6NykevEMrTc=;
	b=NKBe0VNvM32KInhtigepFEb3nSOd7oai9fWovr0iYtTohXEx/u/zeRfQantOWNvV4TT4Jy
	XsWP1k/IOhrsadSBYO7z4iZB8LQfsxLjskoq/LBdzh1YmFWT2nhedpEFdgX75J8WjV5Gjn
	0CYuTpDMNkIsUdIdya/SOibQtNbsv5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3R+N9RgWm4VODf1Dv5AfZniWTHnSUFH6NykevEMrTc=;
	b=rXYfM9643URW9H/I3PMFAgP3vRfhUC8nx8rDRe42zvyl/RJ5MV81GGkPRT3Lku5P41xY63
	c3tGHXsQNJoqerBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3R+N9RgWm4VODf1Dv5AfZniWTHnSUFH6NykevEMrTc=;
	b=NKBe0VNvM32KInhtigepFEb3nSOd7oai9fWovr0iYtTohXEx/u/zeRfQantOWNvV4TT4Jy
	XsWP1k/IOhrsadSBYO7z4iZB8LQfsxLjskoq/LBdzh1YmFWT2nhedpEFdgX75J8WjV5Gjn
	0CYuTpDMNkIsUdIdya/SOibQtNbsv5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3R+N9RgWm4VODf1Dv5AfZniWTHnSUFH6NykevEMrTc=;
	b=rXYfM9643URW9H/I3PMFAgP3vRfhUC8nx8rDRe42zvyl/RJ5MV81GGkPRT3Lku5P41xY63
	c3tGHXsQNJoqerBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86CFA139D2;
	Thu, 13 Mar 2025 17:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +AOFH+EY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 01/89] ASoC: au1x: Convert to DEFINE_SIPMLE_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:06 +0100
Message-ID: <20250313174139.29942-2-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Use the new DEFINE_SIPMLE_DEV_PM_OPS() macro instead of open code
together with pm_ptr(), which allows us dropping CONFIG_PM ifdefs.

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/au1x/i2sc.c     | 17 +++--------------
 sound/soc/au1x/psc-ac97.c | 17 +++--------------
 sound/soc/au1x/psc-i2s.c  | 17 +++--------------
 3 files changed, 9 insertions(+), 42 deletions(-)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 7d296f29dade..f94269814544 100644
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
+static DEFINE_SIPMLE_DEV_PM_OPS(au1xi2sc_pmops, au1xi2s_drvsuspend,
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

